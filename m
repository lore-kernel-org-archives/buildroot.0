From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 13:53:15 +0100
Subject: [Buildroot] [git commit] package/procps-ng: bump version to 3.3.11
	to fix musl build
Message-ID: <20160201224709.26F717F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8239f45435b14fdec4886e575fbf306772b266c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased 0002-use-pkgconfig-for-ncursesw-cflags.patch

The build error has not yet been found by the autobuilders:

watch.c:564:37: error: request for member ???chars??? in something not a structure or union
     exit_early = (wchar_t) c != oldc.chars[0];
                                     ^
watch.c:573:5: error: unknown type name ???cchar_t???
     cchar_t oldc;

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-use-pkgconfig-for-ncursesw-cflags.patch          | 15 ++++++++-------
 package/procps-ng/procps-ng.hash                          |  4 ++--
 package/procps-ng/procps-ng.mk                            |  2 +-
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
index 973c4e5..c25da3b 100644
--- a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
+++ b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
@@ -6,6 +6,7 @@ Status: contacted one of the maintainers on sf.net
 (ticket submission closed to the public, no other way of contacting them).
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: Rebased for version 3.3.11]
 
 diff -Nura procps-ng-3.3.10.orig/configure.ac procps-ng-3.3.10/configure.ac
 --- procps-ng-3.3.10.orig/configure.ac	2015-04-07 19:21:55.729819952 -0300
@@ -31,14 +32,14 @@ diff -Nura procps-ng-3.3.10.orig/configure.ac procps-ng-3.3.10/configure.ac
 diff -Nura procps-ng-3.3.10.orig/Makefile.am procps-ng-3.3.10/Makefile.am
 --- procps-ng-3.3.10.orig/Makefile.am	2015-04-07 19:21:55.655817434 -0300
 +++ procps-ng-3.3.10/Makefile.am	2015-04-07 19:32:54.516238136 -0300
-@@ -83,6 +83,7 @@
- slabtop_LDADD = @NCURSES_LIBS@
- watch_SOURCES = watch.c $(top_srcdir)/lib/strutils.c $(top_srcdir)/lib/fileutils.c
- watch_LDADD = @WATCH_NCURSES_LIBS@
+@@ -97,6 +97,7 @@
+ slabtop_LDADD = $(LDADD) @NCURSES_LIBS@
+ watch_SOURCES = watch.c lib/strutils.c lib/fileutils.c
+ watch_LDADD = $(LDADD) @WATCH_NCURSES_LIBS@
 +watch_CFLAGS = @WATCH_NCURSES_CFLAGS@
- endif
- 
- if BUILD_SKILL
+ top_top_SOURCES = \
+ 	top/top.h \
+ 	top/top.c \
 diff -Nura procps-ng-3.3.10.orig/watch.c procps-ng-3.3.10/watch.c
 --- procps-ng-3.3.10.orig/watch.c	2015-04-07 19:21:55.707819203 -0300
 +++ procps-ng-3.3.10/watch.c	2015-04-07 19:22:27.323895083 -0300
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index e011356..c98fb14 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5	1fb7f3f6bf92ce6c5c9ed9949ae858fe	procps-ng-3.3.10.tar.xz
-sha1	484db198d6a18a42b4011d5ecb2cb784a81b0e4f	procps-ng-3.3.10.tar.xz
+md5	6cc5b94c1c5b8cbc89ad345a7b522f74	procps-ng-3.3.11.tar.xz
+sha1	1bdca65547df9ed019bd83649b0f8b8eaa017e25	procps-ng-3.3.11.tar.xz
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 62c7534..e0e89c4 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.10
+PROCPS_NG_VERSION = 3.3.11
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
