Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAFFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A687340148;
	Sat,  8 Jan 2022 15:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mE7AWBxU1-Ud; Sat,  8 Jan 2022 15:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6576E4027F;
	Sat,  8 Jan 2022 15:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4E021BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8425F813E2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIhJCrI2nILi for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C550A81470
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5DBCD82DF2; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:48:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 834464792e691a243d456335083b2a8b3363e261
X-Git-Newrev: 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.5DBCD82DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: bump version to 5.15.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=20181c3f1b7191d2b6a1b78bfbe32c1f58e87359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
