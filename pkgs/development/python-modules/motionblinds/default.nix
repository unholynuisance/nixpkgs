{ lib
, buildPythonPackage
, fetchFromGitHub
, pycryptodomex
, pythonOlder
}:

buildPythonPackage rec {
  pname = "motionblinds";
  version = "0.6.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "starkillerOG";
    repo = "motion-blinds";
    rev = version;
    sha256 = "sha256-0Vkx5Hnoa09ZgavReQ72iWqmOG42ATG5w+ptCs7geoA=";
  };

  propagatedBuildInputs = [
    pycryptodomex
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [
    "motionblinds"
  ];

  meta = with lib; {
    description = "Python library for interfacing with Motion Blinds";
    homepage = "https://github.com/starkillerOG/motion-blinds";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
