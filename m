Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B345CC5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CC2E40830;
	Tue, 18 Aug 2026 21:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTi71rVHOsHt; Tue, 18 Aug 2026 21:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787089667;
	bh=AUnY5++cFBcyE0i30+fTHmuSeNnKbdQ+++ZJDlRhl6A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CfSYmXctDKaXhPoZT3DRQaKXno3OzccV0HBUTkHiZlDTuftECGHZFAPdvWrrvgWj7
	 TgQoJgqMgehbnSY1OPAlP5hvf9oiCVl/g5dtVtrCn2p8RStRyVh8hc8cif7WPMTb6k
	 kOx3Fp60kKYEPZUMhuMC6R4VXKkDumGu/EBxnGtd5JprYP9hNmQo+Gkap5W91Wb8RM
	 KwQO3Y/0sab1XxlXw3MGPQsbeh8yoEIAnQnr9CpP6QtOYGK3aTvLVAhTF6fk/lYd/H
	 jH/NMsCHXY1po9rXsbroki+jyhirH+DlZcO8Rcpo9zgsk5E5YLelWhm7oN4msHYOco
	 rae74goOggkKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A6ED407E9;
	Tue, 18 Aug 2026 21:47:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A35A339E
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14D9400AF
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEebTXLMxCDi for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FC7240024
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:47:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9BF68DBFE; Tue, 18 Aug 2026 21:46:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Aug 2026 23:47:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 344d64f38539b28a5b8753d18ceb43ff2ee969bd
X-Git-Newrev: 7aba8ecc6aa74cc9c2604ac3bf5548d0d6c2687e
X-Patchwork-Hint: ignore
Message-Id: <20260818214652.C9BF68DBFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: bump to version 7.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7aba8ecc6aa74cc9c2604ac3bf5548d0d6c2687e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream changelog:
https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/CHANGES?h=v7.1

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index f12c76c2ee..38bf9cf4a0 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  3382a84e3fcfe1ffdea07a61ab3f4e86665d38fa35f1f34548d5df867423e0df  btrfs-progs-v6.10.tar.xz
+sha256  d1f55cc2971398c9142eaa79d203e63d586a3b4b867f956664a1d68322cd4e34  btrfs-progs-v7.1.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 8691a5710e..ad724657a7 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 6.10
+BTRFS_PROGS_VERSION = 7.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
