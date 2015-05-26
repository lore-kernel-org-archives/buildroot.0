From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 26 May 2015 09:34:14 +0200
Subject: [Buildroot] [PATCH] package:sysdig: bump to version 0.1.100
Message-ID: <1432625654-16560-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps to version 0.1.100, removes the no more
neded upstream included patch and adds the ENABLE_DKMS=OFF
configure option.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .../sysdig/0001-remove-dkms-module-updater.patch   | 31 ----------------------
 package/sysdig/sysdig.mk                           |  4 +--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/sysdig/0001-remove-dkms-module-updater.patch

diff --git a/package/sysdig/0001-remove-dkms-module-updater.patch b/package/sysdig/0001-remove-dkms-module-updater.patch
deleted file mode 100644
index 8d5c99d..0000000
--- a/package/sysdig/0001-remove-dkms-module-updater.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Remove DKMS module updater
-
-This patch disables the in target installation of DKMS module updater
-mechanism unneeded in buildroot.
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-
---- a/driver/CMakeLists.txt
-+++ b/driver/CMakeLists.txt
-@@ -39,21 +39,3 @@ add_custom_target(install_driver
- 	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
- 	VERBATIM)
- 
--install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Makefile.dkms
--	RENAME Makefile
--	DESTINATION "src/sysdig-${SYSDIG_VERSION}")
--
--install(FILES
--	${CMAKE_CURRENT_BINARY_DIR}/dkms.conf
--	dynamic_params_table.c
--	event_table.c
--	flags_table.c
--	main.c
--	ppm.h
--	ppm_events.c
--	ppm_events.h
--	ppm_events_public.h
--	ppm_fillers.c
--	ppm_ringbuffer.h
--	syscall_table.c
--	DESTINATION "src/sysdig-${SYSDIG_VERSION}")
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index fb348ff..d07d467 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.1.99
+SYSDIG_VERSION = 0.1.100
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPLv2
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
-	-DUSE_BUNDLED_JSONCPP=OFF
+	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF
 SYSDIG_DEPENDENCIES = zlib luajit jsoncpp linux
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
-- 
1.9.1
