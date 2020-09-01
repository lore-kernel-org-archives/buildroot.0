From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  1 Sep 2020 19:16:41 +0200
Subject: [Buildroot] [PATCH v2 0/4] package/python-pytest: new package with
 dependencies
Message-ID: <20200901171645.708587-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This is an updated patch series that adds pytest with all its required
dependencies. There is also a simple test provided to verify that pytest really
works.

changes v1 -> v2:
 * remove python-packaging patch, which has been mainlined already
 * bump version from 5.4.1 to 6.0.1
 * add python-iniparser package, which is now required dependency
 * fixed python-pluggy dependencies
 * rebase on Buildroot master + next (locally merged) branches

Marcin Niestroj (4):
  package/python-pluggy: new package
  package/python-iniconfig: new package
  package/python-pytest: new package
  support/testing: add pytest test

 DEVELOPERS                                    |  5 ++++
 package/Config.in                             |  3 +++
 package/python-iniconfig/Config.in            |  6 +++++
 .../python-iniconfig/python-iniconfig.hash    |  5 ++++
 package/python-iniconfig/python-iniconfig.mk  | 14 +++++++++++
 package/python-pluggy/Config.in               |  7 ++++++
 package/python-pluggy/python-pluggy.hash      |  5 ++++
 package/python-pluggy/python-pluggy.mk        | 15 +++++++++++
 package/python-pytest/Config.in               | 16 ++++++++++++
 package/python-pytest/python-pytest.hash      |  5 ++++
 package/python-pytest/python-pytest.mk        | 15 +++++++++++
 .../tests/package/sample_python_pytest.py     | 25 +++++++++++++++++++
 .../tests/package/test_python_pytest.py       | 19 ++++++++++++++
 13 files changed, 140 insertions(+)
 create mode 100644 package/python-iniconfig/Config.in
 create mode 100644 package/python-iniconfig/python-iniconfig.hash
 create mode 100644 package/python-iniconfig/python-iniconfig.mk
 create mode 100644 package/python-pluggy/Config.in
 create mode 100644 package/python-pluggy/python-pluggy.hash
 create mode 100644 package/python-pluggy/python-pluggy.mk
 create mode 100644 package/python-pytest/Config.in
 create mode 100644 package/python-pytest/python-pytest.hash
 create mode 100644 package/python-pytest/python-pytest.mk
 create mode 100644 support/testing/tests/package/sample_python_pytest.py
 create mode 100644 support/testing/tests/package/test_python_pytest.py

-- 
2.28.0
