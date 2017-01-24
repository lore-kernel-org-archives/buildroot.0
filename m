From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:48:59 +1300
Subject: [Buildroot] [git commit] python-pathvalidate: bump to version 0.13.0
Message-ID: <20170124095724.A64E181807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c673c9fcab584627198be4be2ff28350773deee5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add python-six to the runtime dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pathvalidate/Config.in                | 1 +
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
index cc15fff..60163fb 100644
--- a/package/python-pathvalidate/Config.in
+++ b/package/python-pathvalidate/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PATHVALIDATE
 	bool "python-pathvalidate"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	help
diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index e999c73..68e6907 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
-md5	c9f517f6caba5eee56731425b5a75427  pathvalidate-0.9.4.tar.gz
-sha256	289a849464cced59314e6a0827f2d2232bb9891f8f4812574a6875a7c7e554b9  pathvalidate-0.9.4.tar.gz
+md5	03f0af69596f7de52d52753c2a585fce  pathvalidate-0.13.0.tar.gz
+sha256	1ecaebfbd32794abe5f47a20189d5f7dd196a6ba445c1a07429de6ce608bf9b9  pathvalidate-0.13.0.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 25f2548..a8ab4ad 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.9.4
+PYTHON_PATHVALIDATE_VERSION = 0.13.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/9a/4a/49d219ca919753017bacea87e161614ed66204246ee1e150091910cb57c7
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/3a/03/ca01cdbf0f7b766b414d134e71b2eb689619dba0ddee002d53c2d58f6436
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
