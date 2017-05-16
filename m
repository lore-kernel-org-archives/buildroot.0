From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 21:29:07 +0200
Subject: [Buildroot] [git commit branch/next] python-can: bump to 1.5.2
Message-ID: <20170516193007.C85A58267E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee5bce16478b799aa2ac72f5e47f322cbef5e10f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add Python SQLite3 dependency that first appeared in 1.5.2.

[Peter: clarify that this is a runtime dependency]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/Config.in       | 2 ++
 package/python-can/python-can.hash | 6 +++---
 package/python-can/python-can.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 6b4e0fa..3e1b012 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
+	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  This module provides controller area network support for Python.
 
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index a877862..bd19d19 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9b556fe6f016c0a3b27cc67790cf821, sha256 locally computed
-md5     b9b556fe6f016c0a3b27cc67790cf821  python-can-1.4.3.tar.gz
-sha256  2dcd32737cc39fbf39f41521146a9685f594942c99c6183bad7e3c404930198b  python-can-1.4.3.tar.gz
+# md5 from https://pypi.python.org/pypi/python-can/json, sha256 locally computed
+md5     f653aecf8b9034bbba32cc04ca6a7b6d  python-can-1.5.2.tar.gz
+sha256  edabb426e6cd11c2dc7a98980340135aa0eb02143b0d51bf14e3e6178c131cc3  python-can-1.5.2.tar.gz
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index eddefdb..a271bae 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 1.4.3
-PYTHON_CAN_SITE = https://pypi.python.org/packages/source/p/python-can
+PYTHON_CAN_VERSION = 1.5.2
+PYTHON_CAN_SITE = https://pypi.python.org/packages/a1/b1/80f023e2b728c7ebccbf989aec777f3add3dd4cee650573ce5d38132a07c
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 PYTHON_CAN_SETUP_TYPE = setuptools
