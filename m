Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0ACFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB34040493;
	Mon, 31 Oct 2022 14:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB34040493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eAsZ-FdbJFf; Mon, 31 Oct 2022 14:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C974340414;
	Mon, 31 Oct 2022 14:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C974340414
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 654591BF95F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BEF6415B9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BEF6415B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCr6jZzYffhA for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D991415A9
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D991415A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A5B987967; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:42:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4022f5fe44a928c5e987f40fd4f58dd0ae5cf1fb
X-Git-Newrev: b55d1e9c1549ef7f53c9cf42e8cd73745063fdfe
X-Patchwork-Hint: ignore
Message-Id: <20221031144227.4A5B987967@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/casync: bump to latest git commit
 (0efa7abffe5f)
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

commit: https://git.buildroot.net/buildroot/commit/?id=b55d1e9c1549ef7f53c9cf42e8cd73745063fdfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (merged to main)

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-castore-fix-build-without-lzma-or-xz.patch | 35 --------------
 ...t-install-udev-rules-without-udev-support.patch | 53 ----------------------
 package/casync/casync.hash                         |  2 +-
 package/casync/casync.mk                           |  2 +-
 4 files changed, 2 insertions(+), 90 deletions(-)

diff --git a/package/casync/0001-castore-fix-build-without-lzma-or-xz.patch b/package/casync/0001-castore-fix-build-without-lzma-or-xz.patch
deleted file mode 100644
index a528b1244c..0000000000
--- a/package/casync/0001-castore-fix-build-without-lzma-or-xz.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 06b667de02df34e3efa1864b4031853bd4ee010d Mon Sep 17 00:00:00 2001
-From: Yair Ben-Avraham <yairba@protonmail.com>
-Date: Sun, 10 Jan 2021 06:34:58 +0100
-Subject: [PATCH] castore: fix build without lzma or xz
-
-castore.c unconditioanlly includes lzma.h, but lzma support if optional.
-Furthermore, castore.c does not need anything from lzma.h.
-
-Drop the include altogether.
-
-Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
-[yann.morin.1998@free.fr:
-  - lzma.h is not needed at all
-  - rewrite commit log accordingly
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/castore.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/castore.c b/src/castore.c
-index c290dfd..b2e5320 100644
---- a/src/castore.c
-+++ b/src/castore.c
-@@ -2,7 +2,6 @@
- 
- #include <dirent.h>
- #include <fcntl.h>
--#include <lzma.h>
- #include <sys/stat.h>
- #include <unistd.h>
- 
--- 
-2.25.1
-
diff --git a/package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch b/package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch
deleted file mode 100644
index 838b065571..0000000000
--- a/package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e3f683dc3013d14bddb9f9ec5bdc31367dc51a1c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 10 Jan 2021 10:44:39 +0100
-Subject: [PATCH] build: don't install udev rules without udev support
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- meson.build | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index aac7727..92be1ea 100644
---- a/meson.build
-+++ b/meson.build
-@@ -151,6 +151,11 @@ conf.set10('HAVE_SELINUX', get_option('selinux'))
- 
- if get_option('udev')
-         libudev = dependency('libudev')
-+        udevrulesdir = get_option('udevrulesdir')
-+        if udevrulesdir == ''
-+                udev = dependency('udev', required : false)
-+                udevrulesdir = join_paths(udev.get_pkgconfig_variable('udevdir'), 'rules.d')
-+        endif
- else
-         libudev = []
- endif
-@@ -175,12 +180,6 @@ subdir('test')
- 
- includes = include_directories('src')
- 
--udevrulesdir = get_option('udevrulesdir')
--if udevrulesdir == ''
--        udev = dependency('udev', required : false)
--        udevrulesdir = join_paths(udev.get_pkgconfig_variable('udevdir'), 'rules.d')
--endif
--
- subdir('shell-completion/bash')
- subdir('doc')
- 
-@@ -318,7 +317,9 @@ udev_rule = configure_file(
-           input : 'src/75-casync.rules.in',
-           configuration : substs)
- 
--install_data(udev_rule, install_dir : udevrulesdir)
-+if get_option('udev')
-+        install_data(udev_rule, install_dir : udevrulesdir)
-+endif
- 
- ############################################################
- 
--- 
-2.25.1
-
diff --git a/package/casync/casync.hash b/package/casync/casync.hash
index dbb85520de..469beb5b6c 100644
--- a/package/casync/casync.hash
+++ b/package/casync/casync.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  d07f43e70e3c466152033da4c55c065f815d3025234a046c2bce1cfe4ac7d273  casync-4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc.tar.gz
+sha256  5d58def4c5ca902b35a97178d4619b9298a35b27d5748a2cc346bd36c2e38e9c  casync-0efa7abffe5fffbde8c457d3c8fafbdde0bb6e4f.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/casync/casync.mk b/package/casync/casync.mk
index bb9bd8ccac..af010a7ece 100644
--- a/package/casync/casync.mk
+++ b/package/casync/casync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
+CASYNC_VERSION = 0efa7abffe5fffbde8c457d3c8fafbdde0bb6e4f
 CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
 CASYNC_LICENSE = LGPL-2.1+
 CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
