From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 15:47:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/proj: bump version to 6.2.0
Message-ID: <20191006134735.12202-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added dependency to sqlite:
https://github.com/OSGeo/PROJ/commit/4ad1477c24c3da4be6c7962606e6f9d47336b6a3

Needed for the libgeotiff version bump to 1.5.1.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/proj/Config.in | 1 +
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/proj/Config.in b/package/proj/Config.in
index 788aee8319..4880d3f2cd 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROJ
 	bool "proj"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_SQLITE
 	help
 	  proj.4 is a standard UNIX filter function which converts
 	  geographic longitude and latitude coordinates into cartesian
diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index aadbc385df..c409544d77 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-4.9.3.tar.gz.md5
-md5 15c8d7d6a8cb945c7878d0ff322a232c proj-5.0.1.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-6.2.0.tar.gz.md5
+md5 5cde556545828beaffbe50b1bb038480 proj-6.2.0.tar.gz
 # Locally calculated
-sha256 a792f78897482ed2c4e2af4e8a1a02e294c64e32b591a635c5294cb9d49fdc8c proj-5.0.1.tar.gz
+sha256 b300c0f872f632ad7f8eb60725edbf14f0f8f52db740a3ab23e7b94f1cd22a50 proj-6.2.0.tar.gz
 sha256 2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6 COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 2969eb57ac..735e96bb5f 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PROJ_VERSION = 5.0.1
+PROJ_VERSION = 6.2.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
 PROJ_INSTALL_STAGING = YES
+PROJ_DEPENDENCIES = sqlite
 
 PROJ_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.20.1
