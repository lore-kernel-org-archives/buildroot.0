Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7624BC433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 07:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF630819F6;
	Sun, 23 Oct 2022 07:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF630819F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REmOQl8WS0o1; Sun, 23 Oct 2022 07:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06AF9819D6;
	Sun, 23 Oct 2022 07:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06AF9819D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19A361BF356
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 07:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8497819D6
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 07:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8497819D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SMmkOQOWGKk for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 07:04:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E9A819D1
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18E9A819D1
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 07:04:41 +0000 (UTC)
Date: Sun, 23 Oct 2022 07:04:28 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <lY8yl97I8zmKInD6JUak95yumYNlqBm_os7CmKyW0KbBQLgqRfV_OAobCkbkYk-UU-fX62yqO-A7zDnwy5rJZzAUvk1U_Xjh4942ofJWB3w=@protonmail.com>
Feedback-ID: 6956783:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1666508679; x=1666767879;
 bh=DYCCp1up4EOCENOW1iDBeEfXGV8qbiSr8HrJ0E/LxOk=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=uWLDpOmwmL0vNzEsM9yUpgmFedBM3u2QHfFsYiSw5sCDM+5xOm/rsAkOKbEy6bcyg
 TKnh6ZZgVtW3YsEb3pxPnREt/EIM9SkSIAKIFaWhmnx9sAti9hz7xqGSIoytGvoc+V
 wmgNQthY6BUlD8o2LlGYpI6y9M1GLzvDtLziHCyQOKUs0p1UrQcL0O/Fxu37dAyk6E
 u2gXR5976asqCuwvgn72jwkKNsuTNnx/C4vqxeXDdFy+e3fZ4NZxw2PoncTXwdK9NA
 QfC2llBrpRHxlONlc1yp0eWODzZ/iXy3YdfGb1GKOpC63s24oseZJ8kD5L2IkFjp1C
 fSbCNVAbaqlFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=uWLDpOmw
Subject: [Buildroot] [PATCH 1/1] package/casync: bump to latest git commit
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
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (merged to main)

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 ...castore-fix-build-without-lzma-or-xz.patch | 35 ------------
 ...tall-udev-rules-without-udev-support.patch | 53 -------------------
 package/casync/casync.hash                    |  2 +-
 package/casync/casync.mk                      |  2 +-
 4 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 package/casync/0001-castore-fix-build-without-lzma-or-xz.patch
 delete mode 100644 package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch

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
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
