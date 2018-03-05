From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:15 -0000
Subject: [Buildroot] [git commit] ncurses: bump to 6.1
Message-ID: <20180305200712.150CE810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41a3bc75e165ef5f029bf0fb87ff55f1506e362d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0002-recognise-uclinux.patch as it has been applies upstream.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncurses/0001-gcc-5.x-MKlib_gen.patch |  5 +++--
 package/ncurses/0002-recognise-uclinux.patch | 29 ----------------------------
 package/ncurses/ncurses.hash                 |  2 +-
 package/ncurses/ncurses.mk                   |  2 +-
 4 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/package/ncurses/0001-gcc-5.x-MKlib_gen.patch b/package/ncurses/0001-gcc-5.x-MKlib_gen.patch
index df7c15fee9..0106e8077f 100644
--- a/package/ncurses/0001-gcc-5.x-MKlib_gen.patch
+++ b/package/ncurses/0001-gcc-5.x-MKlib_gen.patch
@@ -11,10 +11,11 @@ http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=97bb4678dc03e753290b39b
 
 Original author: Thomas E. Dickey <dickey@invisible-island.net>
 Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
-
+[Adam Duskett: Refresh for 6.1]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 --- a/ncurses/base/MKlib_gen.sh 2015-08-06 20:48:24.000000000 -0400
 +++ b/ncurses/base/MKlib_gen.sh	2017-02-07 10:09:01.293962392 -0500
-@@ -491,11 +491,22 @@
+@@ -505,11 +505,22 @@
  	-e 's/gen_$//' \
  	-e 's/  / /g' >>$TMP
  
diff --git a/package/ncurses/0002-recognise-uclinux.patch b/package/ncurses/0002-recognise-uclinux.patch
deleted file mode 100644
index 57dd4cf37f..0000000000
--- a/package/ncurses/0002-recognise-uclinux.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-aclocal: fix detection for uclinux hosts
-uclinux is just a linux like the others...
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: "Adam Duskett" <aduskett@gmail.com>
-
---- a/aclocal.m4	2015-08-05 20:46:34.000000000 -0400
-+++ b/aclocal.m4	2017-02-07 09:58:17.770056849 -0500
-@@ -7656,7 +7656,7 @@
- 	cf_xopen_source="-D_SGI_SOURCE"
- 	cf_XOPEN_SOURCE=
- 	;;
--(linux*|gnu*|mint*|k*bsd*-gnu)
-+(linux*|uclinux*|gnu*|mint*|k*bsd*-gnu)
- 	CF_GNU_SOURCE
- 	;;
- (minix*)
-diff -durN a/configure b/configure
---- a/configure	2015-08-05 05:20:32.000000000 -0400
-+++ b/configure	2017-02-07 09:58:52.883886426 -0500
-@@ -7869,7 +7869,7 @@
- 	cf_xopen_source="-D_SGI_SOURCE"
- 	cf_XOPEN_SOURCE=
- 	;;
--(linux*|gnu*|mint*|k*bsd*-gnu)
-+(linux*|uclinux*|gnu*|mint*|k*bsd*-gnu)
- 
- echo "$as_me:7874: checking if we must define _GNU_SOURCE" >&5
- echo $ECHO_N "checking if we must define _GNU_SOURCE... $ECHO_C" >&6
diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 6bca143836..045625ae3b 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260	ncurses-6.0.tar.gz
+sha256	aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17	ncurses-6.1.tar.gz
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index e63b6e4aed..32ee085314 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCURSES_VERSION = 6.0
+NCURSES_VERSION = 6.1
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
