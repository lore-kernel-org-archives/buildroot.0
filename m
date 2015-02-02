From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 15:37:51 +0100
Subject: [Buildroot] [git commit] ympd: bump version
Message-ID: <20150202143817.658BC807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d7e33f67cccea1156db5fee84e97ba5abb7e8c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

First patch is removed because a solution was found upstream.
The second one needs to be sent.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../ympd-0001-CMake-cross-compile-mkdata.patch     |   24 --------------------
 package/ympd/ympd.mk                               |    2 +-
 2 files changed, 1 insertions(+), 25 deletions(-)

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
index 346c510..61e9cab 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
+YMPD_VERSION = v1.2.3
 YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
 YMPD_LICENSE = GPLv2
 YMPD_LICENSE_FILES = LICENSE
