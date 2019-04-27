From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 27 Apr 2019 18:16:25 +0200
Subject: [Buildroot] [PATCH] package/minicom: bump to version
 6fe734c5a1d51e2d4a3c1cd4d7a61cc246faa3f2
Message-ID: <20190427161625.99335-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch that has
been upstreamed.

Add host-pkgconf to MINICOM_DEPENDENCIES and remove:
`MINICOM_CONF_ENV = PKG_CONFIG=/bin/false` since now pkg-config is
needed to build.

Merge request for:
0001-sysdep1-check-if-RS485-is-support-before-setting-its.patch
has been opened:
https://salsa.debian.org/minicom-team/minicom/merge_requests/8/commits

Shortlog follows:
git shortlog 19ab49422f3431102c31fea01549121385113f80..
Adam Lackorzynski (9):
      Update project URL
      Updated translations
      Updated translations: pl and sv
      Translations: regen update
      Update danish translation
      Update of danish translation
      Update README
      Formatting fix
      More friendly mbslength test

Fabrice Fontaine (1):
      src/Makefile.am: fix ascii-xfr link with lintl

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...ile.am-fix-ascii-xfr-link-with-lintl.patch | 44 -------------------
 package/minicom/minicom.hash                  |  2 +-
 package/minicom/minicom.mk                    | 10 +----
 3 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch

diff --git a/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch b/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch
deleted file mode 100644
index efc880d2e7..0000000000
--- a/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 6fe734c5a1d51e2d4a3c1cd4d7a61cc246faa3f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Apr 2019 13:34:23 +0200
-Subject: [PATCH] src/Makefile.am: fix ascii-xfr link with lintl
-
-ascii-xfr needs to link with lintl if needed:
-
-/home/dawncrow/buildroot-test/scripts/instance-0/output/host/bin/m68k-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -W -Wall -Wextra -std=gnu99 -Wno-format-truncation   -o ascii-xfr ascii-xfr.o ../lib/libport.a -lncurses
-ascii-xfr.o: In function `stats':
-ascii-xfr.c:(.text+0x4c): undefined reference to `libintl_gettext'
-ascii-xfr.c:(.text+0xb2): undefined reference to `libintl_gettext'
-ascii-xfr.o: In function `usage':
-ascii-xfr.c:(.text+0x10e): undefined reference to `libintl_gettext'
-ascii-xfr.o: In function `asend':
-ascii-xfr.c:(.text+0x534): undefined reference to `libintl_gettext'
-ascii-xfr.o: In function `main':
-ascii-xfr.c:(.text.startup+0xc8): undefined reference to `libintl_gettext'
-ascii-xfr.o:ascii-xfr.c:(.text.startup+0x1a8): more undefined references to `libintl_gettext' follow
-
-Fixes:
- - http://autobuild.buildroot.org/results/e64cdcf648764be53a3e951304bb89dc9410db23
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://salsa.debian.org/minicom-team/minicom/merge_requests/7]
----
- src/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 19b1888..ba92f71 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -29,6 +29,7 @@ confdir = @MINICOM_CONFDIR@
- AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/lib -DCONFDIR=\"$(confdir)\" \
-               -DLOCALEDIR=\"$(datadir)/locale\"
- 
-+ascii_xfr_LDADD = @LIBINTL@
- minicom_LDADD = @LIBINTL@ $(LIBICONV) $(MINICOM_LIBPORT) $(LOCKDEV_LIBS)
- minicom_keyserv_LDADD = @LIBINTL@ $(MINICOM_LIBPORT)
- runscript_LDADD = @LIBINTL@ $(MINICOM_LIBPORT)
--- 
-2.20.1
-
diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index c566f4be52..62982d37e6 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3bd58b594ac66545649c13ab2b728a4df0f78612eb030680d4152f7627d1f177  minicom-19ab49422f3431102c31fea01549121385113f80.tar.gz
+sha256 14d238b7819844515a636ed799cd849285b580a3458f3a4e94ce328a55ab989d  minicom-6fe734c5a1d51e2d4a3c1cd4d7a61cc246faa3f2.tar.gz
 sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 000597f8a9..4ae852c2a8 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,21 +4,15 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 19ab49422f3431102c31fea01549121385113f80
+MINICOM_VERSION = 6fe734c5a1d51e2d4a3c1cd4d7a61cc246faa3f2
 MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
 MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 MINICOM_AUTORECONF = YES
 
-# pkg-config is only used to check for liblockdev, which we don't have
-# in BR, so instead of adding host-pkgconf as a dependency, simply make
-# sure the host version isn't used so we don't end up with problems if
-# people have liblockdev1-dev installed
-MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
-
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
-	$(TARGET_NLS_DEPENDENCIES)
+	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
 # add host-gettext for AM_ICONV macro
 MINICOM_DEPENDENCIES += host-gettext
 
-- 
2.17.1
