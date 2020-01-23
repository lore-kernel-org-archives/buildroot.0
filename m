From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: bump
 version to 2.1.0-Leia
Message-ID: <20200122235421.BB8AB83687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=074e1c92e481931372ad9703df1cc4f1cd4f2e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0001-cross-compile.patch, not needed anymore:
https://github.com/xbmc/visualization.goom/pull/4#issuecomment-537987594

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-cross-compile.patch                       | 32 ----------------------
 .../kodi-visualisation-goom.hash                   |  2 +-
 .../kodi-visualisation-goom.mk                     |  4 +--
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/kodi-visualisation-goom/0001-cross-compile.patch b/package/kodi-visualisation-goom/0001-cross-compile.patch
deleted file mode 100644
index 8dd0fe9109..0000000000
--- a/package/kodi-visualisation-goom/0001-cross-compile.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fix cross-compilation
-
-Use the cross-compiler and not the host version.
-
-Patch sent upstream:
-https://github.com/notspiff/visualization.goom/pull/4
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt
---- visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt	2014-10-31 11:34:21.000000000 +0100
-+++ visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt	2015-07-19 19:49:43.340054342 +0200
-@@ -13,6 +13,10 @@
-                     ${KODI_INCLUDE_DIR}
-                     ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/src)
- 
-+get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
-+string( REGEX REPLACE "-[^-]+$" ""
-+        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )
-+
- include(ExternalProject)
- set(update_command "")
- if(BOOTSTRAP_IN_TREE OR NOT DEFINED BOOTSTRAP_IN_TREE)
-@@ -20,7 +24,7 @@
- endif()
- externalproject_add(libgoom SOURCE_DIR ${PROJECT_SOURCE_DIR}/lib/goom2k4-0
-                     "${update_command}"
--                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR>
-+                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR> --host=${TOOLCHAIN_NAME}
-                     BUILD_COMMAND ${MAKE}
-                     INSTALL_COMMAND "")
- 
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index fa5fbf6c37..37d203224a 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 501b8b1d5bd174ec71d57894293ae5eb0c1f41c3b725ab5e7b5a1c5eeea77a7f  kodi-visualisation-goom-54da35870930acd1a3a36195dd2c1498ac336b90.tar.gz
+sha256 49f193d32a14b26a39d6572fcbdd8b69a9e559f453bca017086336e985bf6b2c  kodi-visualisation-goom-2.1.0-Leia.tar.gz
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index a7503a97d8..487a520220 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 54da35870930acd1a3a36195dd2c1498ac336b90
-KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
+KODI_VISUALISATION_GOOM_VERSION = 2.1.0-Leia
+KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
 
