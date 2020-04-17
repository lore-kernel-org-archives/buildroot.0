From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:47:20 +0200
Subject: [Buildroot] [git commit] package/selinux-python: bump to version 3.0
Message-ID: <20200417203421.B88CA8F030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=791292c48d5165515ca08f35d8cbc1ef78d3ed95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is now Python 3.x only.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/selinux-python/Config.in           |  2 +-
 package/selinux-python/selinux-python.hash |  2 +-
 package/selinux-python/selinux-python.mk   | 16 ++++------------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 5b6cbc80e3..1a610b29f0 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SELINUX_PYTHON
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3
 	help
 	  A set of SELinux tools written in python that help with
 	  managing a system with SELinux enabled. If no packages are
diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 8cbac37016..8fb72423e8 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 3650b5393b0d1790cac66db00e34f059aa91c23cfe3c2559676594e295d75fde selinux-python-2.9.tar.gz
+sha256 43c08fa881ccc64251d396b1ac6c56b354bf98421b4ec937d54a8db190135494 selinux-python-3.0.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 978bee7c88..d6c3231786 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,25 +4,17 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 2.9
-SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+SELINUX_PYTHON_VERSION = 3.0
+SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = COPYING
+SELINUX_PYTHON_DEPENDENCIES = python3
 
 SELINUX_PYTHON_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
 	ARCH="$(BR2_ARCH)" \
-	LIBDIR="$(STAGING_DIR)/usr/lib"
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SELINUX_PYTHON_DEPENDENCIES += python3
-SELINUX_PYTHON_MAKE_OPTS += \
+	LIBDIR="$(STAGING_DIR)/usr/lib" \
 	PYTHONLIBDIR="usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-else
-SELINUX_PYTHON_DEPENDENCIES += python
-SELINUX_PYTHON_MAKE_OPTS += \
-	PYTHONLIBDIR="usr/lib/python$(PYTHON_VERSION_MAJOR)"
-endif
 
 ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW),y)
 SELINUX_PYTHON_DEPENDENCIES += checkpolicy
