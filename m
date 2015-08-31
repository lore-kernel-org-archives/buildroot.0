From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 31 Aug 2015 11:59:05 +0200
Subject: [Buildroot] [PATCH 0/6] [RFC] Adds test infrastructure for packages
Message-ID: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a test generation infrastructure for packages to
Buildroot.
The generated tests are robotframework tests.

While it is always necessary to test that packages are installed
correctly and work in an intended way, Buildroot does not currently
provide any tests of package nor any way to automate the process of
creating tests depending on your configuration or even share tests you
have written for packages. You have to write tests manually almost
everytime you start a new project with buildroot. This can cost a lot
of time.

This patch series is intented as a solution for that problem.

Why Robotframework Tests:
Robotframework is a widely used test automation framework that allow
writing tests in various languages (Python, Java and even C), provides
useful test librairies and allow writing tests in various syntaxes.
Robotframework tests are meant to be easy to read by people whom did
not write the tests, and that can definitly be useful.

List of patches from the series :
* Patch 1/6 adds a test generation step before install target step.
* Patch 2/6 adds useful keywords for testing through Telnet and Qemu
* Patch 3/6 adds menuconfig options to ease the configuration required
  for testing through telnet and Qemu
* Patch 4/6 adds documentation for patches 1,2 and 3
* Patch 5/6 adds exemple tests for package python-flask
* patch 6/6 adds exemple tests for package python (inspired by tests
  from https://github.com/tpetazzoni/buildroot-runtime-test)

Denis THULIN (6):
  python-robotframework: New package
  Adds package test infrastructure
  tests: create variable files through kconfig
  tests: Adds user manual entry
  flask: Adds robotframework tests
  python: Adds tests

 Config.in                                          |   6 +
 Makefile                                           |   9 +-
 docs/manual/common-usage.txt                       |   2 +
 docs/manual/test-infrastructure.txt                | 239 +++++++++++++++++++++
 package/Config.in                                  |   1 +
 package/Config.in.host                             |   1 +
 package/Makefile.in                                |   1 +
 package/pkg-generic.mk                             |  20 +-
 package/pkg-test.mk                                |  94 ++++++++
 package/python-flask/python-flask.mk               |   5 +
 .../target_test_material/target_test.robot         |  25 +++
 package/python-robotframework/Config.in            |   9 +
 package/python-robotframework/Config.in.host       |   8 +
 .../python-robotframework.hash                     |   4 +
 .../python-robotframework/python-robotframework.mk |  16 ++
 package/python/python.mk                           |  17 ++
 package/python/python.robot                        |  32 +++
 tests/Config.in                                    |   8 +
 tests/host/resource.robot                          |   7 +
 tests/target/resource.robot                        |   1 +
 tests/tests.mk                                     |  20 ++
 21 files changed, 522 insertions(+), 3 deletions(-)
 create mode 100644 docs/manual/test-infrastructure.txt
 create mode 100644 package/pkg-test.mk
 create mode 100644 package/python-flask/target_test_material/target_test.robot
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/Config.in.host
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk
 create mode 100644 package/python/python.robot
 create mode 100644 tests/Config.in
 create mode 100644 tests/host/resource.robot
 create mode 100644 tests/target/resource.robot
 create mode 100644 tests/tests.mk

-- 
2.5.0
