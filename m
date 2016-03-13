From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:45:51 +0100
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20160313204835.0C7F181816@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f845aeb84212c3c03b2b9348be1897296c8e93e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added a configure option to disable -Werror:
https://github.com/tvheadend/tvheadend/commit/ddb31c58b88450f7228e620048fb2d691d427fab

Remove our patch therefore and use the new configure option instead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/0002-remove-werror.patch | 16 ----------------
 package/tvheadend/tvheadend.hash           |  2 +-
 package/tvheadend/tvheadend.mk             |  3 ++-
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/package/tvheadend/0002-remove-werror.patch b/package/tvheadend/0002-remove-werror.patch
deleted file mode 100644
index d466907..0000000
--- a/package/tvheadend/0002-remove-werror.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-tvheadend: remove -Werror from CFLAGS
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
---- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:50:48.437688482 +0100
-+++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:54:00.411418749 +0100
-@@ -32,7 +32,7 @@
- ifeq ($(CONFIG_W_UNUSED_RESULT),yes)
- CFLAGS  += -Wunused-result
- endif
--CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
-+CFLAGS  += -Wall -Wwrite-strings -Wno-deprecated-declarations
- CFLAGS  += -Wmissing-prototypes
- CFLAGS  += -fms-extensions -funsigned-char -fno-strict-aliasing
- CFLAGS  += -D_FILE_OFFSET_BITS=64
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index de7bc46..5737c2f 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	0caf44de3baaf115d80410b660d99e49a42f50792397254e8f21b6e1c5ca58ef	tvheadend-1aa0073be39119f5d0d79212e6c83c470904a161.tar.gz
+sha256	5e59b2659badfe921fc324162dbfbfb69da8fe7eac21478651287fd56784ab11	tvheadend-3927788bb71ad0041a00d0daa35fae1cb6355b55.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 11f882a..40d8c6e 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 1aa0073be39119f5d0d79212e6c83c470904a161
+TVHEADEND_VERSION = 3927788bb71ad0041a00d0daa35fae1cb6355b55
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -77,6 +77,7 @@ define TVHEADEND_CONFIGURE_CMDS
 			--prefix=/usr				\
 			--arch="$(ARCH)"			\
 			--cpu="$(BR2_GCC_TARGET_CPU)"		\
+			--nowerror				\
 			--python="$(HOST_DIR)/usr/bin/python"	\
 			--enable-dvbscan			\
 			--enable-bundle				\
