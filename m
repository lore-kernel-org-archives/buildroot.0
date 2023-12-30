Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A89C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 910C760AAC;
	Sat, 30 Dec 2023 17:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 910C760AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqTfKNHZC6gC; Sat, 30 Dec 2023 17:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6574360C14;
	Sat, 30 Dec 2023 17:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6574360C14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 816151BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12D0840189
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12D0840189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLHJ9l1qB4sY for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8983740103
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8983740103
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7573681E4C; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:52:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 132c71798c6e9c47c61e8a8a45db2d0266ac92f7
X-Git-Newrev: 15515ed0cd7efe586dd488a91d66ca6133de9f86
X-Patchwork-Hint: ignore
Message-Id: <20231230175629.7573681E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catatonit: bump to version 0.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=15515ed0cd7efe586dd488a91d66ca6133de9f86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (already in version)
- Update second patch
- License changed to GPL-2.0+:
  https://github.com/openSUSE/catatonit/commit/fe191ef859c6365d44a4d7f4ac9765dee825d78c

https://github.com/openSUSE/catatonit/releases/tag/v0.2.0
https://github.com/openSUSE/catatonit/compare/v0.1.7...v0.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...figure.ac-call-AM_INIT_AUTOMAKE-only-once.patch | 41 ----------------------
 ....patch => 0001-fix-build-with-kernel-5.9.patch} | 15 ++++----
 package/catatonit/catatonit.hash                   |  4 +--
 package/catatonit/catatonit.mk                     |  4 +--
 5 files changed, 10 insertions(+), 55 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e76f6e829e..def465e802 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -237,7 +237,6 @@ package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo
 package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch Upstream
 package/cairo/0004-Fix-mask-usage-in-image-compositor.patch Upstream
 package/caps/0001-Fix-stdint-types-with-musl.patch Upstream
-package/catatonit/0002-fix-build-with-kernel-5.9.patch Upstream
 package/cdrkit/0001-no-rcmd.patch Upstream
 package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch Upstream
 package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch Upstream
diff --git a/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch b/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
deleted file mode 100644
index b978a827a1..0000000000
--- a/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 99bb9048f532257f3a2c3856cfa19fe957ab6cec Mon Sep 17 00:00:00 2001
-From: Antonio Terceiro <terceiro@debian.org>
-Date: Thu, 4 Nov 2021 07:37:13 -0300
-Subject: [PATCH] configure.ac: call AM_INIT_AUTOMAKE only once
-
-That second call seems to be there since the beginning, and autoconf
-2.69 was fine with it. autoconf 2.71 doesn't allow it anymore:
-
-    $ ./autogen.sh
-    autoreconf: export WARNINGS=
-    autoreconf: Entering directory '.'
-    autoreconf: configure.ac: not using Gettext
-    autoreconf: running: aclocal --force
-    configure.ac:34: error: AM_INIT_AUTOMAKE expanded multiple times
-    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-    configure.ac:19: the top level
-    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-    configure.ac:34: the top level
-    autom4te: error: /usr/bin/m4 failed with exit status: 1
-    aclocal: error: /usr/bin/autom4te failed with exit status: 1
-    autoreconf: error: aclocal failed with exit status: 1
-
-Signed-off-by: Antonio Terceiro <terceiro@debian.org>
-Upstream: https://github.com/openSUSE/catatonit/commit/99bb9048f532257f3a2c3856cfa19fe957ab6cec
-Signed-off-by: Christian Stewart <christian@paral.in>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 12c9186..94c5c84 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,4 +31,3 @@ AC_FUNC_FORK
- 
- AC_CONFIG_FILES([Makefile config.h])
- AC_OUTPUT
--AM_INIT_AUTOMAKE
--- 
-2.37.2
-
diff --git a/package/catatonit/0002-fix-build-with-kernel-5.9.patch b/package/catatonit/0001-fix-build-with-kernel-5.9.patch
similarity index 83%
rename from package/catatonit/0002-fix-build-with-kernel-5.9.patch
rename to package/catatonit/0001-fix-build-with-kernel-5.9.patch
index a4c66389db..37def8e546 100644
--- a/package/catatonit/0002-fix-build-with-kernel-5.9.patch
+++ b/package/catatonit/0001-fix-build-with-kernel-5.9.patch
@@ -1,4 +1,4 @@
-From 1fefcbffe4ade02d625bf058a7c07aeaf9fa7a2f Mon Sep 17 00:00:00 2001
+From 65e1b96bd40cb14b3729ac56bb9f1fcb77254403 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Tue, 1 Nov 2022 14:16:01 +0100
 Subject: [PATCH] fix build with kernel < 5.9
@@ -15,17 +15,17 @@ Fixes:
  - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/openSUSE/catatonit/pull/24]
+Upstream: https://github.com/openSUSE/catatonit/commit/663ad1670689143f65af3a288f90cecb7feed54f
 ---
  catatonit.c  | 2 +-
  configure.ac | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/catatonit.c b/catatonit.c
-index a38263a..474c525 100644
+index a33f4cd..b10d9b0 100644
 --- a/catatonit.c
 +++ b/catatonit.c
-@@ -35,7 +35,7 @@
+@@ -36,7 +36,7 @@
  #include <limits.h>
  #include <dirent.h>
  
@@ -35,10 +35,10 @@ index a38263a..474c525 100644
  #else
  # include <sys/syscall.h>
 diff --git a/configure.ac b/configure.ac
-index 94c5c84..a746ea1 100644
+index 69e89f0..b37f146 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -22,7 +22,7 @@ LT_PREREQ([2.4.2])
+@@ -24,7 +24,7 @@ LT_PREREQ([2.4.2])
  LT_INIT([disable-shared])
  
  AC_CHECK_HEADERS([errno.h fcntl.h signal.h stdarg.h stdio.h stdlib.h unistd.h])
@@ -47,6 +47,3 @@ index 94c5c84..a746ea1 100644
  
  AC_CHECK_FUNCS([close_range])
  
--- 
-2.35.1
-
diff --git a/package/catatonit/catatonit.hash b/package/catatonit/catatonit.hash
index 9b7420cdb7..9940309c76 100644
--- a/package/catatonit/catatonit.hash
+++ b/package/catatonit/catatonit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e22bc72ebc23762dad8f5d2ed9d5ab1aaad567bdd54422f1d1da775277a93296  catatonit-0.1.7.tar.gz
-sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  d0cf1feffdc89c9fb52af20fc10127887a408bbd99e0424558d182b310a3dc92  catatonit-0.2.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/catatonit/catatonit.mk b/package/catatonit/catatonit.mk
index 3dd58eff1d..a308ea6471 100644
--- a/package/catatonit/catatonit.mk
+++ b/package/catatonit/catatonit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CATATONIT_VERSION = 0.1.7
+CATATONIT_VERSION = 0.2.0
 CATATONIT_SITE = $(call github,openSUSE,catatonit,v$(CATATONIT_VERSION))
-CATATONIT_LICENSE = GPL-3.0+
+CATATONIT_LICENSE = GPL-2.0+
 CATATONIT_LICENSE_FILES = COPYING
 
 CATATONIT_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
