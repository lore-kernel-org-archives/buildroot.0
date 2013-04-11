From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:22:15 +0200
Subject: [Buildroot] [git commit] kismet: bump to version 2013-03-R1a
Message-ID: <20130411081131.7DCF49A809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36319e23e84fd04dec18d5cdce9848fff25f2cb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kismet/kismet-libnl-30-support.patch |  128 --------------------------
 package/kismet/kismet.mk                     |    6 +-
 2 files changed, 3 insertions(+), 131 deletions(-)

diff --git a/package/kismet/kismet-libnl-30-support.patch b/package/kismet/kismet-libnl-30-support.patch
deleted file mode 100644
index dca6151..0000000
--- a/package/kismet/kismet-libnl-30-support.patch
+++ /dev/null
@@ -1,128 +0,0 @@
----
- configure |   79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
- 1 file changed, 78 insertions(+), 1 deletion(-)
-
-Index: b/configure
-===================================================================
---- a/configure
-+++ b/configure
-@@ -601,6 +601,8 @@
- libnl1_CFLAGS
- libnl20_LIBS
- libnl20_CFLAGS
-+libnl30_LIBS
-+libnl30_CFLAGS
- PKG_CONFIG_LIBDIR
- PKG_CONFIG_PATH
- PKG_CONFIG
-@@ -712,6 +714,8 @@
- PKG_CONFIG
- PKG_CONFIG_PATH
- PKG_CONFIG_LIBDIR
-+libnl30_CFLAGS
-+libnl30_LIBS
- libnl20_CFLAGS
- libnl20_LIBS
- libnl1_CFLAGS
-@@ -1361,6 +1365,10 @@
-               directories to add to pkg-config's search path
-   PKG_CONFIG_LIBDIR
-               path overriding pkg-config's built-in search path
-+  libnl30_CFLAGS
-+              C compiler flags for libnl30, overriding pkg-config
-+  libnl30_LIBS
-+              linker flags for libnl30, overriding pkg-config
-   libnl20_CFLAGS
-               C compiler flags for libnl20, overriding pkg-config
-   libnl20_LIBS
-@@ -6760,6 +6768,76 @@
- 	fi
- fi
-
-+#libnl-3.0
-+pkg_failed=no
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for libnl30" >&5
-+$as_echo_n "checking for libnl30... " >&6; }
-+
-+if test -n "$libnl30_CFLAGS"; then
-+    pkg_cv_libnl20_CFLAGS="$libnl30_CFLAGS"
-+ elif test -n "$PKG_CONFIG"; then
-+    if test -n "$PKG_CONFIG" && \
-+    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libnl-3.0\""; } >&5
-+  ($PKG_CONFIG --exists --print-errors "libnl-3.0") 2>&5
-+  ac_status=$?
-+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-+  test $ac_status = 0; }; then
-+  pkg_cv_libnl30_CFLAGS=`$PKG_CONFIG --cflags "libnl-3.0" 2>/dev/null`
-+else
-+  pkg_failed=yes
-+fi
-+ else
-+    pkg_failed=untried
-+fi
-+if test -n "$libnl30_LIBS"; then
-+    pkg_cv_libnl20_LIBS="$libnl30_LIBS"
-+ elif test -n "$PKG_CONFIG"; then
-+    if test -n "$PKG_CONFIG" && \
-+    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libnl-3.0\""; } >&5
-+  ($PKG_CONFIG --exists --print-errors "libnl-3.0") 2>&5
-+  ac_status=$?
-+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-+  test $ac_status = 0; }; then
-+  pkg_cv_libnl30_LIBS=`$PKG_CONFIG --libs "libnl-3.0" 2>/dev/null`
-+else
-+  pkg_failed=yes
-+fi
-+ else
-+    pkg_failed=untried
-+fi
-+
-+if test $pkg_failed = yes; then
-+   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-+$as_echo "no" >&6; }
-+
-+if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-+        _pkg_short_errors_supported=yes
-+else
-+        _pkg_short_errors_supported=no
-+fi
-+        if test $_pkg_short_errors_supported = yes; then
-+	        libnl30_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors "libnl-3.0" 2>&1`
-+        else
-+	        libnl30_PKG_ERRORS=`$PKG_CONFIG --print-errors "libnl-3.0" 2>&1`
-+        fi
-+	# Put the nasty error message in config.log where it belongs
-+	echo "$libnl30_PKG_ERRORS" >&5
-+
-+	libnl30=no
-+elif test $pkg_failed = untried; then
-+     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-+$as_echo "no" >&6; }
-+	libnl30=no
-+else
-+	libnl30_CFLAGS=$pkg_cv_libnl30_CFLAGS
-+	libnl30_LIBS=$pkg_cv_libnl30_LIBS
-+        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-+	CPPFLAGS="$CPPFLAGS $libnl30_CFLAGS"
-+$as_echo "yes" >&6; }
-+	libnl30=yes
-+fi
-+
-+# libnl-2.0
- pkg_failed=no
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking for libnl20" >&5
- $as_echo_n "checking for libnl20... " >&6; }
-@@ -6897,7 +6974,11 @@
- $as_echo "yes" >&6; }
- 	libnl1=yes
- fi
--	if test "$libnl20" = "yes"; then
-+	if test "$libnl30" = "yes"; then
-+$as_echo "#define HAVE_LIBNL 1" >>confdefs.h
-+$as_echo "#define HAVE_LIBNL20 1" >>confdefs.h
-+               NLLIBS="-lnl-genl-3 -lnl-3"
-+	elif test "$libnl20" = "yes"; then
- 
- $as_echo "#define HAVE_LIBNL 1" >>confdefs.h
-
-
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 3787f07..845df6b 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,15 +4,15 @@
 #
 #############################################################
 
-KISMET_VERSION = 2011-03-R2
+KISMET_VERSION = 2013-03-R1a
 KISMET_SITE = http://www.kismetwireless.net/code
-KISMET_DEPENDENCIES = libpcap ncurses
+KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses
 KISMET_LICENSE = GPLv2+
 KISMET_LICENSE_FILES = GPL
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	KISMET_DEPENDENCIES += libnl
-	KISMET_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/"
+	KISMET_CONF_OPT += --with-netlink-version=3
 endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
 	KISMET_DEPENDENCIES += pcre
