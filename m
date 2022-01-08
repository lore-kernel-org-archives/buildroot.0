Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B5AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFC64028F;
	Sat,  8 Jan 2022 09:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVQu9L9GMyVq; Sat,  8 Jan 2022 09:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA1EF40135;
	Sat,  8 Jan 2022 09:15:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B70491BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0A9140135
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BxEZYSMLVk6 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:15:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D0814012E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:15:47 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout04.t-online.de (Postfix) with SMTP id 831A67409
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:13:50 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n67nJ-0hfTXd0; Sat, 8 Jan 2022 10:13:50 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55024)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n67nJ-0005Wy-IR
 for buildroot@buildroot.org; Sat, 08 Jan 2022 10:13:49 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:13:49 +0100
Message-Id: <20220108091349.918259-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641633230-00001C4D-A11E18F0/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ea75de9-9ac9-4bb0-b161-3608333aca77
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump version to 5.15.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reformatted hashes.

Upstream relicensed libbtrfsutil to LGPL-2.1+ and removed
libbtrfsutil/COPYING.LESSER:
https://github.com/kdave/btrfs-progs/commit/9e30f779e3cbf12a88ebe309ee371851fdfd3aa0

Add optional support for udev:
https://github.com/kdave/btrfs-progs/commit/f74ebeee5c239e007a0144e93f0eee26949a85ec
https://github.com/kdave/btrfs-progs/commit/1d0fa3781ef9374388b683cf96f9c48245025cf6

Changelog:
https://github.com/kdave/btrfs-progs/blob/master/CHANGES

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/btrfs-progs/btrfs-progs.hash |  7 +++----
 package/btrfs-progs/btrfs-progs.mk   | 15 +++++++++++----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index aac144963e..339eab02aa 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 d41961b0a92160c80f894ad9a1882822889c2e1d084cbf3e08b8c214a5cf0137  btrfs-progs-v5.11.tar.xz
+sha256  6230f8f33961bd62633d601b0d049a3c6b833c1a1a7a2f2782d0c5796e7ab920  btrfs-progs-v5.15.1.tar.xz
 # Locally computed
-sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
-sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  libbtrfsutil/COPYING
-sha256 e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  libbtrfsutil/COPYING.LESSER
+sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 96456d1238..50c8e59e50 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 5.11
+BTRFS_PROGS_VERSION = 5.15.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
 BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
-BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-3.0+ (libbtrfsutil)
-BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING \
-	libbtrfsutil/COPYING.LESSER
+BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
+BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
 
 # Doesn't autodetect static-only and tries to build both
@@ -31,9 +30,17 @@ else
 BTRFS_PROGS_CONF_OPTS += --disable-convert
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+BTRFS_PROGS_CONF_OPTS += --enable-libudev
+BTRFS_PROGS_DEPENDENCIES += udev
+else
+BTRFS_PROGS_CONF_OPTS += --disable-libudev
+endif
+
 HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
 HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-backtrace \
+	--disable-libudev \
 	--disable-zstd \
 	--disable-python \
 	--disable-convert
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
