From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 22:24:17 +0100
Subject: [Buildroot] [PATCH 5/5] package/tvheadend: bump version
In-Reply-To: <cover.1394486562.git.yann.morin.1998@free.fr>
References: <cover.1394486562.git.yann.morin.1998@free.fr>
Message-ID: <7fe2dbaa3e609fa6bd7d80f29daf6bb28d73c64d.1394486562.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The list of changes is too long to repeat here, but lots of fixes
and improvements, plus a brand new rewrite of the DVB handling code.

Refresh patches, except patch 4 which has now been upstreamed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../tvheadend-001-no-auto-download-dvbscans.patch  | 30 +++++++++++-----------
 .../tvheadend/tvheadend-002-no-check_config.patch  |  8 +++---
 .../tvheadend/tvheadend-003-remove-werror.patch    |  9 ++++---
 .../tvheadend-004-dont-run-compiled-code.patch     | 21 ---------------
 package/tvheadend/tvheadend.mk                     |  2 +-
 5 files changed, 25 insertions(+), 45 deletions(-)
 delete mode 100644 package/tvheadend/tvheadend-004-dont-run-compiled-code.patch

diff --git a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
index b64627e..f14f302 100644
--- a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
+++ b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
@@ -8,10 +8,10 @@ it is no longer needed to install those as part of tvheadend.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-diff -durN tvheadend-v3.5.orig/configure tvheadend-v3.5/configure
---- tvheadend-v3.5.orig/configure	2013-02-15 14:41:26.000000000 +0100
-+++ tvheadend-v3.5/configure	2013-02-16 15:41:16.675556099 +0100
-@@ -179,15 +179,16 @@
+diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/configure
+--- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure	2014-03-07 21:44:39.000000000 +0100
++++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/configure	2014-03-09 14:44:09.350095543 +0100
+@@ -272,15 +272,16 @@
  #
  # DVB scan
  #
@@ -35,12 +35,12 @@ diff -durN tvheadend-v3.5.orig/configure tvheadend-v3.5/configure
 +#  echo "ok"
 +#fi
  
- # ###########################################################################
- # Write config
-diff -durN tvheadend-v3.5.orig/Makefile tvheadend-v3.5/Makefile
---- tvheadend-v3.5.orig/Makefile	2013-02-15 14:41:26.000000000 +0100
-+++ tvheadend-v3.5/Makefile	2013-02-16 15:41:38.218821287 +0100
-@@ -211,7 +211,7 @@
+ #
+ # epoll
+diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
+--- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-07 21:44:39.000000000 +0100
++++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:44:09.350095543 +0100
+@@ -255,7 +255,7 @@
  SRCS-${CONFIG_BUNDLE}     += bundle.c
  BUNDLES-yes               += docs/html docs/docresources src/webui/static
  BUNDLES-yes               += data/conf
@@ -49,10 +49,10 @@ diff -durN tvheadend-v3.5.orig/Makefile tvheadend-v3.5/Makefile
  BUNDLES                    = $(BUNDLES-yes)
  
  #
-diff -durN tvheadend-v3.5.orig/support/posix.mk tvheadend-v3.5/support/posix.mk
---- tvheadend-v3.5.orig/support/posix.mk	2013-02-15 14:41:26.000000000 +0100
-+++ tvheadend-v3.5/support/posix.mk	2013-02-16 15:42:41.015290003 +0100
-@@ -15,6 +15,10 @@
+diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/support/posix.mk tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/support/posix.mk
+--- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/support/posix.mk	2014-03-07 21:44:39.000000000 +0100
++++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/support/posix.mk	2014-03-09 14:44:09.350095543 +0100
+@@ -17,6 +17,10 @@
  
  	find ${DESTDIR}${datadir}/tvheadend -name .git -exec rm -rf {} \; &>/dev/null || /bin/true
  
@@ -62,4 +62,4 @@ diff -durN tvheadend-v3.5.orig/support/posix.mk tvheadend-v3.5/support/posix.mk
 +
  uninstall:
  	rm -f ${DESTDIR}${bindir}/tvheadend
- 	rm -f ${DESTDIR}${mandir}/tvheadend.1
+ 	rm -f ${DESTDIR}${mandir}/man1/tvheadend.1
diff --git a/package/tvheadend/tvheadend-002-no-check_config.patch b/package/tvheadend/tvheadend-002-no-check_config.patch
index aad04e5..b55cbfc 100644
--- a/package/tvheadend/tvheadend-002-no-check_config.patch
+++ b/package/tvheadend/tvheadend-002-no-check_config.patch
@@ -9,10 +9,10 @@ to a false comparison of the files' dates.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-diff -durN tvheadend-v3.5.orig/Makefile tvheadend-v3.5/Makefile
---- tvheadend-v3.5.orig/Makefile	2013-02-17 15:15:03.228749505 +0100
-+++ tvheadend-v3.5/Makefile	2013-02-17 15:15:51.591923062 +0100
-@@ -250,7 +250,7 @@
+diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
+--- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:47:43.780025330 +0100
++++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:48:40.836539093 +0100
+@@ -294,7 +294,7 @@
  	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
diff --git a/package/tvheadend/tvheadend-003-remove-werror.patch b/package/tvheadend/tvheadend-003-remove-werror.patch
index 1b0e687..cc97a18 100644
--- a/package/tvheadend/tvheadend-003-remove-werror.patch
+++ b/package/tvheadend/tvheadend-003-remove-werror.patch
@@ -2,14 +2,15 @@ tvheadend: remove -Werror from CFLAGS
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
---- tvheadend-2b649954346aa2e9c81834d500a25c528f31f829/Makefile.orig	2013-11-28 15:52:52.284041848 +0000
-+++ tvheadend-2b649954346aa2e9c81834d500a25c528f31f829/Makefile	2013-11-28 15:53:03.715220194 +0000
-@@ -27,7 +27,7 @@ PROG    := $(BUILDDIR)/tvheadend
+diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
+--- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:50:48.437688482 +0100
++++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:54:00.411418749 +0100
+@@ -27,7 +27,7 @@
  # Common compiler flags
  #
  
 -CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
 +CFLAGS  += -Wall -Wwrite-strings -Wno-deprecated-declarations
  CFLAGS  += -Wmissing-prototypes -fms-extensions
- CFLAGS  += -g -funsigned-char -O2 
+ CFLAGS  += -g -funsigned-char -O2
  CFLAGS  += -D_FILE_OFFSET_BITS=64
diff --git a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
deleted file mode 100644
index 8125db1..0000000
--- a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-support: don't try to run compiled code
-
-When cross-compiling, we can't run the compiled code.
-
-Consider the compiler returning success as an indication
-it is working.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN tvheadend.orig/support/configure.inc tvheadend-c7d0335eb10d02b780423bef8e7c740e422fff13/support/configure.inc
---- tvheadend.orig/support/configure.inc	2013-12-01 01:24:26.000000000 +0100
-+++ tvheadend-c7d0335eb10d02b780423bef8e7c740e422fff13/support/configure.inc	2013-12-03 22:34:57.547762178 +0100
-@@ -265,8 +265,6 @@
- EOF
-   $CC $CFLAGS $LDFLAGS $TMPDIR/$$.c -o $TMPDIR/$$.bin $opt #&> /dev/null
-   RET=$?
--  [ $RET -eq 0 ] && $TMPDIR/$$.bin
--  RET=$?
-   rm -f $TMPDIR/$$.{c,bin}
-   return $RET
- }
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 85240a0..9b1e443 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = c7d0335eb10d02b780423bef8e7c740e422fff13
+TVHEADEND_VERSION           = c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
-- 
1.8.3.2
