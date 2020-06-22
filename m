From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:36:15 +0200
Subject: [Buildroot] [git commit] package/dash: drop patch
Message-ID: <20200622193420.DD9F284022@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a07864be003471503e9ad04413966b73bd821ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is not needed since version 0.5.11 and
https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=9000b48966335b0b3d7a3ec1ec8c15b045d59e9d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dash/0001-no-config.h-for-helpers.patch | 35 -------------------------
 1 file changed, 35 deletions(-)

diff --git a/package/dash/0001-no-config.h-for-helpers.patch b/package/dash/0001-no-config.h-for-helpers.patch
deleted file mode 100644
index 9fd449c414..0000000000
--- a/package/dash/0001-no-config.h-for-helpers.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-[PATCH] Don't include config.h when building helpers using the native compiler
-
-config.h contains settings for the cross compiler (most importantly
-32/64bit versions of functions), so don't include it when calling the
-native compiler to build the helpers.
-
-Otherwise we get build errors like:
-
-/usr/bin/gcc -include ../config.h -DBSD=1 -DSHELL -DIFS_BROKEN  -g -O2 -Wall    -o mkinit mkinit.c
-In file included from /usr/include/sys/stat.h:107,
-                 from /usr/include/fcntl.h:38,
-                 from mkinit.c:50:
-/usr/include/bits/stat.h:117: error: redefinition of ???struct stat???
-In file included from /usr/include/fcntl.h:38,
-                 from mkinit.c:50:
-/usr/include/sys/stat.h:504: error: redefinition of ???stat???
-/usr/include/sys/stat.h:455: note: previous definition of ???stat??? was here
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/Makefile.in |    1 -
- 1 file changed, 1 deletion(-)
-
-Index: dash-0.5.5.1/src/Makefile.in
-===================================================================
---- dash-0.5.5.1.orig/src/Makefile.in
-+++ dash-0.5.5.1/src/Makefile.in
-@@ -165,7 +165,6 @@ COMMON_CPPFLAGS = \
- AM_CFLAGS = $(COMMON_CFLAGS)
- AM_CPPFLAGS = $(COMMON_CPPFLAGS)
- AM_CFLAGS_FOR_BUILD = -g -O2 $(COMMON_CFLAGS) 
--AM_CPPFLAGS_FOR_BUILD = $(COMMON_CPPFLAGS)
- COMPILE_FOR_BUILD = \
- 	$(CC_FOR_BUILD) $(AM_CPPFLAGS_FOR_BUILD) $(CPPFLAGS_FOR_BUILD) \
- 	$(AM_CFLAGS_FOR_BUILD) $(CFLAGS_FOR_BUILD) 
