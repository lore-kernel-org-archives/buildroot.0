From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:37 +0100
Subject: [Buildroot] [PATCH/next 18/54] package/kodi-pvr-hdhomerun: bump
 version to 7.1.0-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.hdhomerun/commit/f87f811e5d9462cb80370aa72f38d3dbd2e02ba9
https://github.com/kodi-pvr/pvr.hdhomerun/commit/999c7ac4a7f5e6d44d6f35cddfaa27ecb29d1dce

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hdhomerun/Config.in               | 1 -
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash | 4 ++--
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-hdhomerun/Config.in b/package/kodi-pvr-hdhomerun/Config.in
index ed5b914cb3..5a05a85c9c 100644
--- a/package/kodi-pvr-hdhomerun/Config.in
+++ b/package/kodi-pvr-hdhomerun/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_HDHOMERUN
 	bool "kodi-pvr-hdhomerun"
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBHDHOMERUN
 	help
 	  Kodi's HDHomeRun client addon
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 1762289f0c..c506502874 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  815ba3dfbe6e1318226d41879057f0b8a4f0ac960d12ebc5d69f0a1ac28cfa09  kodi-pvr-hdhomerun-3.5.0-Leia.tar.gz
-sha256  9e76c8ce9e201f75c50c755982b9e2f15821280dedc5e953f685086912e1e39d  debian/copyright
+sha256  a31587e00d58efb72aadba3ad1bd67c08332feef0d558e0eeb6fda7c81bf93e8  kodi-pvr-hdhomerun-7.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index ae42f5c33d..110576120f 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_HDHOMERUN_VERSION = 3.5.0-Leia
+KODI_PVR_HDHOMERUN_VERSION = 7.1.0-Matrix
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
-KODI_PVR_HDHOMERUN_LICENSE_FILES = debian/copyright
-KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
+KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
+KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi libhdhomerun
 
 $(eval $(cmake-package))
-- 
2.29.2
