From: Karoly Kasza <kaszak@gmail.com>
Date: Mon, 15 Sep 2014 16:56:35 +0200
Subject: [Buildroot] [PATCH] openvmtools: disable -Werror
Message-ID: <1410792995-28405-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the mandatory flag -Werror in configure.ac.
This also makes -Wno-deprecated-declarations flag unnecessary.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 .../openvmtools/openvmtools-04-no_cflags_werror.patch |   17 +++++++++++++++++
 package/openvmtools/openvmtools.mk                    |    4 ----
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 package/openvmtools/openvmtools-04-no_cflags_werror.patch

diff --git a/package/openvmtools/openvmtools-04-no_cflags_werror.patch b/package/openvmtools/openvmtools-04-no_cflags_werror.patch
new file mode 100644
index 0000000..96bd355
--- /dev/null
+++ b/package/openvmtools/openvmtools-04-no_cflags_werror.patch
@@ -0,0 +1,17 @@
+configure.ac: disable -Werror
+
+Disable the mandatory flag -Werror in configure.ac.
+
+Signed-off-by: Karoly Kasza <kaszak@gmail.com>
+
+--- open-vm-tools-9.4.6-1770165.orig/configure.ac	2014-07-02 00:21:14.000000000 +0200
++++ open-vm-tools-9.4.6-1770165/configure.ac	2014-09-15 16:03:47.565900402 +0200
+@@ -832,7 +832,7 @@
+ 
+ ### General flags / actions
+ CFLAGS="$CFLAGS -Wall"
+-CFLAGS="$CFLAGS -Werror"
++# CFLAGS="$CFLAGS -Werror"
+ 
+ # -Wno-unknown-pragmas is due to gcc not understanding '#pragma ident' in Xlib.h on OpenSolaris.
+ for TEST_CFLAG in -Wno-pointer-sign -Wno-unused-value -fno-strict-aliasing \
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 6361d6b..9191643 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -13,10 +13,6 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
 # See http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/
 OPENVMTOOLS_AUTORECONF = YES
 OPENVMTOOLS_CONF_OPT = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
-# -Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
-# See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
-OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-deprecated-declarations"
-
 OPENVMTOOLS_DEPENDENCIES = libglib2
 
 # When libfuse is available, openvmtools can build vmblock-fuse, so
-- 
1.7.10.4
