From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:46 +0100
Subject: [Buildroot] [PATCH 40/51] ympd: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-40-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First patch is removed because a solution was found upstream.
The second one needs to be sent.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../ympd-0001-CMake-cross-compile-mkdata.patch     | 24 ----------------------
 package/ympd/ympd.mk                               |  2 +-
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch

diff --git a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
deleted file mode 100644
index 0bd29c1..0000000
--- a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Do not build the mkdata tool
-
-The mkdata tool is needed on the host, during the build, so building
-it for the target does not work when cross-compiling. Buildroot will
-manually build mkdata before starting the ympd build.
-
-Upstream is looking into a proper solution.
-
-Signed-off-by: Eric Limpens <Limpens@Gmail.com>
-
-Index: b/CMakeLists.txt
-===================================================================
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -28,9 +28,6 @@
- 	htdocs/index.html
- )
- 
--add_executable(mkdata htdocs/mkdata.c)
--get_target_property(MKDATA_EXE mkdata LOCATION)
--
- add_custom_command(OUTPUT ${PROJECT_BINARY_DIR}/assets.c
-     COMMAND ${MKDATA_EXE} ${RESOURCES} > ${PROJECT_BINARY_DIR}/assets.c
-     WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index 2898c9d..f84d333 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
+YMPD_VERSION = v1.2.3
 YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
 YMPD_LICENSE = GPLv2
 YMPD_LICENSE_FILE = LICENSE
-- 
2.1.1
