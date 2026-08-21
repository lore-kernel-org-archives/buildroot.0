Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE12DC5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 16:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF4B040C38;
	Fri, 21 Aug 2026 16:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaRQg-9IVbuS; Fri, 21 Aug 2026 16:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787330924;
	bh=Kq5+IvID9AUib3z8EpyDeQz48BsGdG1TLD3Nh0ff+z0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EPOpTRdEiJi4mfq3OQQn+ip24YVIifX7n/b8ekIm4mr+PPYTQvDltsrtaWPNHAfqj
	 sqN/A/w4gRj9R17IzFOnsgT8SA0eneaj5OdbSUzvlWL6I6XPtJ/1+uRSe9Y67etOv6
	 qQN0VIDnicDeY7YYov2yL5n6SstwV4Hm2Euf9j8Sgsa7cCRrIwb6oAvvhRUwqZ4ndZ
	 yUtylfV+qTdkKHMbQAGZ7ujPZlamZcI4XQNu/mFznJ+S0q2ni6SoMI8BBukt4wQIYn
	 HizootdjPZKiTnAaAnfA9alq2d/5eDZC42SoVrkZ/1di+tjI87YRuo/KAgHOhE7//Y
	 23nrKMJzIOazQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE48640C46;
	Fri, 21 Aug 2026 16:48:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D4B263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 486F060A8C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtAA811cMV-R for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 16:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 265E060A77
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:48:42 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 00CD660136;
 Fri, 21 Aug 2026 18:48:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 21 Aug 2026 18:48:31 +0200
Message-ID: <20260821164832.1906581-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] Revert "package/btrfs-progs: bump to
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to revert the fakeroot update which is introducing
filesystem build issue.

Since btrfs-progs needed this new fakeroot version, it needs to be
reverted too.

This commit reverts to the previous btrfs-progs version, which is not
using the nftw() libc function.

This reverts commit 7aba8ecc6aa74cc9c2604ac3bf5548d0d6c2687e.

Signed-off-by: Julien Olivain <ju.o@free.fr>
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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
