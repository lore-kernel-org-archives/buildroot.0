From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 16:29:48 +0200
Subject: [Buildroot] [git commit] package/procps-ng: Bump to version 3.3.12
Message-ID: <20160902142941.9744A7FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da3bb9167cbef357e6736cfd5c0ba6bb41042e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jeroen Roovers <jer@airfi.aero>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch | 2 +-
 package/procps-ng/procps-ng.hash                               | 4 ++--
 package/procps-ng/procps-ng.mk                                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
index c25da3b..1329ac4 100644
--- a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
+++ b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
@@ -35,7 +35,7 @@ diff -Nura procps-ng-3.3.10.orig/Makefile.am procps-ng-3.3.10/Makefile.am
 @@ -97,6 +97,7 @@
  slabtop_LDADD = $(LDADD) @NCURSES_LIBS@
  watch_SOURCES = watch.c lib/strutils.c lib/fileutils.c
- watch_LDADD = $(LDADD) @WATCH_NCURSES_LIBS@
+ watch_LDADD = @WATCH_NCURSES_LIBS@ $(CYGWINFLAGS)
 +watch_CFLAGS = @WATCH_NCURSES_CFLAGS@
  top_top_SOURCES = \
  	top/top.h \
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index c98fb14..62d6172 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5	6cc5b94c1c5b8cbc89ad345a7b522f74	procps-ng-3.3.11.tar.xz
-sha1	1bdca65547df9ed019bd83649b0f8b8eaa017e25	procps-ng-3.3.11.tar.xz
+md5	957e42e8b193490b2111252e4a2b443c	procps-ng-3.3.12.tar.xz
+sha1	82c0745f150f1385ca01fe7d24f05f74e31c94c6	procps-ng-3.3.12.tar.xz
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 51a70a5..83323b7 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.11
+PROCPS_NG_VERSION = 3.3.12
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
