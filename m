From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 17 Sep 2016 22:31:21 -0400
Subject: [Buildroot] [PATCH 1/1] python-daemon: bump to version 2.1.1
Message-ID: <1474165881-2553-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to the latest version, to get python3 support.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

NOTE: It is not quite as clear to me in this version that the GPLv3
license is only test code and build code, because there are more
hits for "gpl" when I grep the package, in setup.py, version.py,
test_version.py, the egg info SOURCES.txt, and a few more. However,
the package home page at https://pypi.python.org/pypi/python-daemon/
indicates Apache-2 only, as opposed to the previous PSF license. The
doc/FAQ also mentions only Apache-2. So I am taking them at their word.
---
 package/python-daemon/Config.in          | 1 -
 package/python-daemon/python-daemon.hash | 5 +++--
 package/python-daemon/python-daemon.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-daemon/Config.in b/package/python-daemon/Config.in
index b3cc8a2..8b6dcc0 100644
--- a/package/python-daemon/Config.in
+++ b/package/python-daemon/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_DAEMON
 	bool "python-daemon"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Library to implement a well-behaved Unix daemon process.
 
diff --git a/package/python-daemon/python-daemon.hash b/package/python-daemon/python-daemon.hash
index 5b3a4d2..12977b5 100644
--- a/package/python-daemon/python-daemon.hash
+++ b/package/python-daemon/python-daemon.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  1406962e48ce03642c6057f40f9ffd49493792a7b34357fe9e264708748c83c0  python-daemon-1.5.5.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=72e2acf2c3d69c7fa75a6625d06adfd0, sha256 locally computed
+md5  72e2acf2c3d69c7fa75a6625d06adfd0  python-daemon-2.1.1.tar.gz
+sha256  58a8c187ee37c3a28913bef00f83240c9ecd4a59dce09a24d92f5c941606689f  python-daemon-2.1.1.tar.gz
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index b8b80ba..bed1b26 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DAEMON_VERSION = 1.5.5
+PYTHON_DAEMON_VERSION = 2.1.1
 PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon
-PYTHON_DAEMON_LICENSE = Python-2.0 (library), GPLv2+ (test)
-PYTHON_DAEMON_LICENSE_FILES = LICENSE.PSF-2 LICENSE.GPL-2
+PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPLv3+ (test)
+PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
1.9.1
