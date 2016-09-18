From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:19:05 +0200
Subject: [Buildroot] [git commit] python-daemon: bump to version 2.1.1
Message-ID: <20160918141914.04950819E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37bfd19e65db3742b64783cc57d7394960956735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest version, to get python3 support.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index b8b80ba..e85be9a 100644
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
+PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPLv3+ (test, build)
+PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
