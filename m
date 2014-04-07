From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Apr 2014 10:04:39 -0300
Subject: [Buildroot] [PATCH] eglibc: bump to version 2.19 SVN R25243
Message-ID: <1396875879-22199-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../2.18-svnr23787/glibc-0001-accept-make4.patch   | 33 ----------------------
 package/glibc/glibc.mk                             |  2 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch

diff --git a/package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch b/package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch
deleted file mode 100644
index 4f426f2..0000000
--- a/package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Backport upstream patch (28d708c44bc47b56f6551ff285f78edcf61c208a) to accept
-make-4.0 or newer.
-We patch both configure and configure.in files so if we ever have to run
-autoreconf in the glibc source, then the fix will be propagated properly.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-Index: glibc-2.18-svnr23787/libc/configure
-===================================================================
---- glibc-2.18-svnr23787.orig/libc/configure
-+++ glibc-2.18-svnr23787/libc/configure
-@@ -4772,7 +4772,7 @@ $as_echo_n "checking version of $MAKE...
-   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
-   case $ac_prog_version in
-     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
--    3.79* | 3.[89]*)
-+    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
-        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
-     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
- 
-Index: glibc-2.18-svnr23787/libc/configure.in
-===================================================================
---- glibc-2.18-svnr23787.orig/libc/configure.in
-+++ glibc-2.18-svnr23787/libc/configure.in
-@@ -989,7 +989,7 @@ AC_CHECK_PROG_VER(CC, ${ac_tool_prefix}g
-   critic_missing="$critic_missing gcc")
- AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
-   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
--  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
-+  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
- 
- AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
-   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 6579f46..dbffdb7 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,7 +16,7 @@ GLIBC_SRC_SUBDIR = .
 endif
 else
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_VERSION = 2.18-svnr23787
+GLIBC_VERSION = 2.19-svnr25243
 GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
 GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
 GLIBC_SRC_SUBDIR = libc
-- 
1.8.3.2
