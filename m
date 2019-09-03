From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:43 -0000
Subject: [Buildroot] [git commit] package/autoconf-archive: bump version to
 v2019.01.06
Message-ID: <20190903133620.9137A8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=471ea6a77147178e1f81968d1e2d9f03450a90ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the version of autoconf-archive and drop the backported patch.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-AX_TLS-fix-syntax-error.patch             | 48 ----------------------
 package/autoconf-archive/autoconf-archive.hash     |  2 +-
 package/autoconf-archive/autoconf-archive.mk       |  2 +-
 3 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
deleted file mode 100644
index c0efeb3359..0000000000
--- a/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1870301013d79be781ead2b0e62fc08f91715ca9 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 3 May 2015 23:02:34 +0200
-Subject: [PATCH] AX_TLS: fix syntax error
-
-The commit e012eb17b3d67f31dee477592328207437206c33 introduce
-a syntax error due to an empty "else" statement.
-
-confifure:
-if test "$ac_cv_tls" != "none"; then :
-cat >>confdefs.h <<_ACEOF
-_ACEOF
-else
-
-fi
-
-Remove the [] on the third part of AS_IF.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-(rebased against version 2017.03.21)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- m4/ax_tls.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/ax_tls.m4 b/m4/ax_tls.m4
-index 809b761..2135dd2 100644
---- a/m4/ax_tls.m4
-+++ b/m4/ax_tls.m4
-@@ -44,7 +44,7 @@
- #   modified version of the Autoconf Macro, you may extend this special
- #   exception to the GPL to apply to your modified version as well.
- 
--#serial 13
-+#serial 14
- 
- AC_DEFUN([AX_TLS], [
-   AC_MSG_CHECKING([for thread local storage (TLS) class])
-@@ -70,5 +70,5 @@ AC_DEFUN([AX_TLS], [
-   AS_IF([test "$ac_cv_tls" != "none"],
-     [AC_DEFINE_UNQUOTED([TLS],[$ac_cv_tls],[If the compiler supports a TLS storage class define it to that here])
-      m4_ifnblank([$1],[$1])],
--    [m4_ifnblank([$2],[$2])])
-+    m4_ifnblank([$2],[$2]))
- ])
--- 
-1.9.3
-
diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 2c537b33a2..fadda54e86 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 386ad455f12bdeb3a7d19280441a5ab77355142349200ff11040a8d9d455d765  autoconf-archive-2017.03.21.tar.xz
+sha256 17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f  autoconf-archive-2019.01.06.tar.xz
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 8a6d59578e..3f1f0a5b3c 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2017.03.21
+AUTOCONF_ARCHIVE_VERSION = 2019.01.06
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
