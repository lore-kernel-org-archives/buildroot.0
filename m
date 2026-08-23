Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48315C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED42B60614;
	Sun, 23 Aug 2026 20:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kKp5TQyi9rU; Sun, 23 Aug 2026 20:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787517677;
	bh=b4YrzsgitYgjLu0vRiQey04ZQsWLDjetMALl+WGaorg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V+4JGm6lKOqhDaUtZ6hPbhrX2WXvjvcdPYPMkynkm4FFARc5JOXVDGnl7/I+MxKht
	 FoTQ5ji6zplc9cj6GHfwXf9XNbQEABC/dJqHoMzJw8RjxbAgO810qBu19t1Eg3PCgy
	 vXc0R1nMsSqRFV6JK6twBjBU8mQJmeMrK5ydqEQpgwbsGzVw2TXIjFe8jvWz4/Ylse
	 sa86d3bKK1maJ2p4H1molG/kQ/6JPLLhccEI4D0DI4BaIeYQeYp+HHye0XfGj3npLh
	 yHpntRY1FnrvVn+ukIAkYH5EB5LwIOqGFL/JT10GSMt/YMchwvKdSk7uhxlSEkjnuj
	 rOfFGmAvlM7aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214F060615;
	Sun, 23 Aug 2026 20:41:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B15653DA
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B0480CF1
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWiGve23qAkC for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06A5E8083A
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A4D48EFA2; Sun, 23 Aug 2026 20:40:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 22:20:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca2c31b019eadbed5875dce52ed8e6249a606e86
X-Git-Newrev: 9fdc16a79d31337264304c9c7f94ccf0a44daff8
X-Patchwork-Hint: ignore
Message-Id: <20260823204020.5A4D48EFA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/btrfs-progs: bump to
 version 7.1"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9fdc16a79d31337264304c9c7f94ccf0a44daff8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

We need to revert the fakeroot update which is introducing
filesystem build issue.

Since btrfs-progs needed this new fakeroot version, it needs to be
reverted too.

This commit reverts to the previous btrfs-progs version, which is not
using the nftw() libc function.

This reverts commit 7aba8ecc6aa74cc9c2604ac3bf5548d0d6c2687e.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 38bf9cf4a0..f12c76c2ee 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  d1f55cc2971398c9142eaa79d203e63d586a3b4b867f956664a1d68322cd4e34  btrfs-progs-v7.1.tar.xz
+sha256  3382a84e3fcfe1ffdea07a61ab3f4e86665d38fa35f1f34548d5df867423e0df  btrfs-progs-v6.10.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index ad724657a7..8691a5710e 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 7.1
+BTRFS_PROGS_VERSION = 6.10
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
