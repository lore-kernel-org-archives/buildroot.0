Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143FAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71D660A89;
	Sat,  8 Jan 2022 22:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_PulUx-zAA7; Sat,  8 Jan 2022 22:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2979A60A4F;
	Sat,  8 Jan 2022 22:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B09111BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EEB58132B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Hc60fM76SeX for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:07:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F401881329
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D1167832D2; Sat,  8 Jan 2022 22:01:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:07:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fac3b2b88574e605d713ac917024ba39d444563
X-Git-Newrev: d9437db2720c64b55d67178fc678f7bf8e6c5fd0
X-Patchwork-Hint: ignore
Message-Id: <20220108220140.D1167832D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: add zstd support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9437db2720c64b55d67178fc678f7bf8e6c5fd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zstd is supported since version 4.13.1 and
https://github.com/kdave/btrfs-progs/commit/717a8b1e5d1ba69154ef84b35be75c9cf7730e1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/btrfs-progs/btrfs-progs.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 4c26cf0df5..b010a0e0be 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -8,7 +8,7 @@ BTRFS_PROGS_VERSION = 5.15.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
+BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-python
 BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
 BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
@@ -30,6 +30,13 @@ else
 BTRFS_PROGS_CONF_OPTS += --disable-convert
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+BTRFS_PROGS_CONF_OPTS += --enable-zstd
+BTRFS_PROGS_DEPENDENCIES += zstd
+else
+BTRFS_PROGS_CONF_OPTS += --disable-zstd
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 BTRFS_PROGS_CONF_OPTS += --enable-libudev
 BTRFS_PROGS_DEPENDENCIES += udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
