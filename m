From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jul 2019 22:41:24 +0200
Subject: [Buildroot] [git commit] package/python-can: bump to version 3.3.1
Message-ID: <20190728203958.79C4880282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdcd7e601d5aca0964e2c42d03a71a093113d219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the package version to 3.3.1 and drops
an upstreamed patch.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...require-pytest-runner-only-when-necessary.patch | 49 ----------------------
 package/python-can/python-can.hash                 |  2 +-
 package/python-can/python-can.mk                   |  4 +-
 3 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/package/python-can/0001-setup.py-require-pytest-runner-only-when-necessary.patch b/package/python-can/0001-setup.py-require-pytest-runner-only-when-necessary.patch
deleted file mode 100644
index 7fda1e3d57..0000000000
--- a/package/python-can/0001-setup.py-require-pytest-runner-only-when-necessary.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3da4873bcdcb7d8bd47e275b97bbb6f1c134b3b9 Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Sat, 29 Jun 2019 21:19:08 +0200
-Subject: [PATCH] setup.py: require pytest-runner only when necessary
-
-This optimizes setup.py for cases when pytest-runner is not needed,
-using the approach that is suggested upstream:
-
-https://pypi.python.org/pypi/pytest-runner#conditional-requirement
-
-[Upstream status: https://github.com/hardbyte/python-can/pull/633]
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- setup.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 221c030..6e1778a 100644
---- a/setup.py
-+++ b/setup.py
-@@ -11,6 +11,7 @@ from os import listdir
- from os.path import isfile, join
- import re
- import logging
-+import sys
- from setuptools import setup, find_packages
- 
- logging.basicConfig(level=logging.WARNING)
-@@ -40,6 +41,8 @@ tests_require = [
- 
- extras_require["test"] = tests_require
- 
-+needs_pytest = {'pytest', 'test', 'ptr'}.intersection(sys.argv)
-+pytest_runner = ['pytest-runner'] if needs_pytest else []
- 
- setup(
-     # Description
-@@ -96,7 +99,7 @@ setup(
-         'windows-curses;platform_system=="Windows"',
-         "filelock",
-     ],
--    setup_requires=["pytest-runner"],
-+    setup_requires=pytest_runner,
-     extras_require=extras_require,
-     tests_require=tests_require,
- )
--- 
-2.7.4
-
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 813ecf4419..0a945eb006 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/python-can/json
-sha256	2a7e9f658b5db16319bbebb2cdd82b1fc0a390ca939b47829affd07c832357ec  python-can-3.3.0.tar.gz
+sha256	8dc9e0f926e880cd57a3badbaebc6393cde7adffdd3e1975a78a82c48d4e3bbe  python-can-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 33449aa451..749583f961 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 3.3.0
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/9c/1e/a10b6f038a4a4bdd89d13ecc5fba36b71ab716fbd9eae9feda1d975d9504
+PYTHON_CAN_VERSION = 3.3.1
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/d1/7e/d92889e3fa6ed625b5d6f065bff1c1b5921519a5133553905affb0d6b97c
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
