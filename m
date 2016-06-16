From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 15:51:22 +0200
Subject: [Buildroot] [git commit] python-crossbar: bump to version 0.14.0
Message-ID: <20160616135135.F3A7C807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b4ce166ad6b0e6e451d7b7d71a512478551304c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As python-msgpack dependency was replaced with python-u-msgpack,
that is a pure Python implementation, BR2_TOOLCHAIN_HAS_SYNC_4
was removed. BR2_INSTALL_LIBSTDCPP remains because of python-pyasn.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-crossbar/Config.in            | 10 +++++-----
 package/python-crossbar/python-crossbar.hash |  6 +++---
 package/python-crossbar/python-crossbar.mk   |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 4e613db..be83325 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
 	select BR2_PACKAGE_PYTHON_MISTUNE
-	select BR2_PACKAGE_PYTHON_MSGPACK
 	select BR2_PACKAGE_PYTHON_NETADDR
 	select BR2_PACKAGE_PYTHON_PSUTIL
 	select BR2_PACKAGE_PYTHON_PYASN
@@ -20,6 +19,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_PYOPENSSL
 	select BR2_PACKAGE_PYTHON_PYTRIE
 	select BR2_PACKAGE_PYTHON_PYYAML
+	select BR2_PACKAGE_PYTHON_SDNOTIFY
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_SETPROCTITLE
@@ -27,10 +27,11 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_SHUTILWHICH if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_TWISTED
-	select BR2_PACKAGE_PYTHON_UJSON
+	select BR2_PACKAGE_PYTHON_U_MSGPACK
+	select BR2_PACKAGE_PYTHON_UBJSON
+	select BR2_PACKAGE_PYTHON_WATCHDOG
 	select BR2_PACKAGE_PYTHON_WSACCEL
-	depends on BR2_INSTALL_LIBSTDCPP # python-msgpack -> msgpack
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # python-msgpack -> msgpack
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	help
 	  Crossbar.io is an open-source WAMP application router that
 	  allows to build advanced applications from loosely-coupled
@@ -39,5 +40,4 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	  https://pypi.python.org/pypi/crossbar
 
 comment "python-crossbar needs a toolchain w/ C++"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 0690e56..a500bcf 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=cbe9b62a1ec2eebbc0cd0cef887a4993, sha256 locally computed.
-md5	cbe9b62a1ec2eebbc0cd0cef887a4993  crossbar-0.12.1.tar.gz
-sha256	4919e683bcfa3c633da8207f24189fd196ef8412b647f0365cf74c0bff8b4ada  crossbar-0.12.1.tar.gz
+# md5 from https://pypi.python.org/pypi/crossbar/json, sha256 locally computed.
+md5	516478cc368503a0a0babc1dc28c5085  crossbar-0.14.0.tar.gz
+sha256	6242ef34c56061850743d750d042993590ca7ec8ebe7b28c21ed05bb0904d71b  crossbar-0.14.0.tar.gz
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 96bc254..3d82d77 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 0.12.1
+PYTHON_CROSSBAR_VERSION = 0.14.0
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = http://pypi.python.org/packages/source/c/crossbar
+PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/f0/9a/e0b77e15698c47b6293655bc0e1996dd8e87bd8af7bc7434a5c8281a024e
 PYTHON_CROSSBAR_LICENSE = AGPLv3
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
