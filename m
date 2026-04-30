Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77C6CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F9C7845C5;
	Mon,  4 May 2026 14:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPTNoP-RwdEY; Mon,  4 May 2026 14:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFFD7846D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906135;
	bh=+Ty2Wgv/UZDtnqaWCa71h0oaODyh480UAyi7ev2vm6U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=exbNcdKZVpTMUqrCOUE/HflG22J/24CM7XyZOC6h2qxyyyTptysWtI1lMq/2veDn0
	 QNZV3/WQtB/1lbbsC8065vxxb8LM0LtWdPkgTdBMpp3xDyTR+p7auXT6JFvi7ZZYuN
	 8zNu3mlaui8Jh+1YY+/kgcQLASi3vARMxb9DW999UrI6TJMUJ+Kn8ko8Ihm+tP44jR
	 c/lVPSiIJSmF7NGD0+4Xr2ajo8FQk4YYeZffmTJoj6hq8a92o16eBT/B5Szh1wzuaM
	 dpd3RazEP4TBBXSHzc+lGVpfrdw6IjRA8n0HFBQcLpXK+J8fin5brSLVty+2rE39o6
	 bIueu2k5wmczQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFD7846D3;
	Mon,  4 May 2026 14:48:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42AD125D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28CDB615C4
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znLsM-kejFH2 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E62C1615AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E62C1615AD
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE6C584364; Mon,  4 May 2026 14:48:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:08:21 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d97a7101672921b8cf594c9d983fa47ecd84830f
X-Git-Newrev: f43fdf13c77ed00dec8d61a2d9ff2a39fce30604
X-Patchwork-Hint: ignore
Message-Id: <20260504144842.BE6C584364@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/btrfs-progs:
 remove unnecessary autoreconf
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f43fdf13c77ed00dec8d61a2d9ff2a39fce30604
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Commit 1c11f9020ad98db11e6d67066d0fdb2cfab27605 removed the patch
changing configure.ac with the bump to 6.10, so it is no longer
needed.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9fd8a1cf4993de9299487e73459b942a67b3a161)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/btrfs-progs/btrfs-progs.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 273c7e37f2..8691a5710e 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -13,9 +13,6 @@ BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
 BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
 
-# 0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch
-BTRFS_PROGS_AUTORECONF = YES
-
 # Doesn't autodetect static-only and tries to build both
 ifeq ($(BR2_STATIC_LIBS),y)
 BTRFS_PROGS_MAKE_OPTS = static
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
