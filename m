From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 20:41:09 +0200
Subject: [Buildroot] [git commit] package/skalibs: bump to version 2.10.0.2
Message-ID: <20210407181658.B36B58198D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d5587cb56224b2b28f53b0202fb14b2ab32d5fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch that has been included upstream

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...e-linker-use-dummy-file-when-testing-libs.patch | 44 ----------------------
 package/skalibs/skalibs.hash                       |  2 +-
 package/skalibs/skalibs.mk                         |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch b/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
deleted file mode 100644
index 17376210f0..0000000000
--- a/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ca69c0d48e65acadccfe65e3adf16c34a744627b Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Tue, 10 Oct 2017 19:51:34 +0200
-Subject: [PATCH] Make linker use dummy file when testing libs
-
-For some architectures, like Xtensa or HPPA, ld from binutils requires
-the output file to be a regular file, as mentioned in a bug report on
-the mailing list [1].
-
-So, use a dummy file as output file for ld in trylibs(), instead of
-/dev/null.
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=19526
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- configure | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 54d755b..64a061a 100755
---- a/configure
-+++ b/configure
-@@ -230,7 +230,7 @@ trylibs () {
-   echo "Checking whether system has $2..." >&3
-   shift 2
-   if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
--    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o /dev/null try$name.o $args 2>/dev/null ; do
-+    until $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o try$name try$name.o $args 2>/dev/null ; do
-       if test -z "$*" ; then
-         rm -f try$name.o
-         echo
-@@ -246,7 +246,7 @@ trylibs () {
-     else
-       echo "  ... yes, with$args" >&3
-     fi
--    rm -f try$name.o
-+    rm -f try$name.o try$name
-     return 0
-   else
-     echo
--- 
-2.17.2
-
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 6736dd8440..cb563d3cc5 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 250b99b53dd413172db944b31c1b930aa145ac79fe6c5d7e6869ef804228c539  skalibs-2.9.2.1.tar.gz
+sha256 8bba3d7650bab83d4ea2ad21d6bfb5479a8652e362a478fcb783b3c7cf891e0f  skalibs-2.10.0.2.tar.gz
 sha256 5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 1c73f26fe7..f92859ff26 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.9.2.1
+SKALIBS_VERSION = 2.10.0.2
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
