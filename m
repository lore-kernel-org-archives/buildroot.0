From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Sep 2012 20:35:45 -0300
Subject: [Buildroot] [PATCHv2] samba: bump to version 3.6.8
Message-ID: <1348616145-21038-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba-getaddrinfo.patch |   13 +++++++------
 package/samba/samba.mk                |    2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/samba/samba-getaddrinfo.patch b/package/samba/samba-getaddrinfo.patch
index af01299..df3570c 100644
--- a/package/samba/samba-getaddrinfo.patch
+++ b/package/samba/samba-getaddrinfo.patch
@@ -1,18 +1,19 @@
-Patch from OpenWRT.
+Patch forward-ported from OpenWRT.
 Don't check for buggy getaddrinfo() assume it's safe if it's present.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
---- a/source3/configure
-+++ b/source3/configure
-@@ -13285,10 +13285,7 @@ if test x"$libreplace_cv_HAVE_GETADDRINF
+diff -Nura samba-3.6.8.orig/source3/configure samba-3.6.8/source3/configure
+--- samba-3.6.8.orig/source3/configure	2012-09-14 05:19:52.000000000 -0300
++++ samba-3.6.8/source3/configure	2012-09-25 20:31:57.861743235 -0300
+@@ -13269,10 +13269,7 @@
  	# see bug 5910, use our replacements if we detect
  	# a broken system.
  	if test "$cross_compiling" = yes; then :
 -  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
 -$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--as_fn_error "cannot run test program while cross compiling
--See \`config.log' for more details." "$LINENO" 5; }
+-as_fn_error $? "cannot run test program while cross compiling
+-See \`config.log' for more details" "$LINENO" 5; }
 +		$as_echo "assuming valid getaddrinfo without bug 5910" >&2
  else
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 75e3173..7c06e14 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.6.7
+SAMBA_VERSION = 3.6.8
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
-- 
1.7.8.6
