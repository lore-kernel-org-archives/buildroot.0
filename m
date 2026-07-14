Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA64DC44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 14:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A119C80F92;
	Tue, 14 Jul 2026 14:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXJfNu0tY4hc; Tue, 14 Jul 2026 14:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A017B80EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784039761;
	bh=/+TxqXAQbcr+kd2bvQPgZ1Jzy6R4yj4VQ6SFiQ6KAlc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MwJxjSifyuN6kZ3nj86jDJ9fEpBk/rbSMU/AbwWSaR6g6aK4Gwc3Q1P/4cV+rCi4l
	 DIIuNAoAhSMzyLB0bO0RynXbPFb7wjvl2QFoY5V3UYSRxKk44J9PlW4fRo8fu4+S3D
	 6TXXApc+XqW00z/w8wq+MLxFA5jExdSFI7/hHl1SPr/WTYsHbmjhBkN5jMuEm42Dwm
	 qHHpWrFz8ruLITPCbno3v2GzpmCIyDAgORoy2lX+pykDc5eYmkDQI9C3H+SzcN6PQN
	 qSMCctAMNzS4yHPeENe0C8nouEnSk20A1i4Pz5h024JO6MkGCexTxR0DNdBCofHgnu
	 PTZKtn46RU+9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A017B80EBB;
	Tue, 14 Jul 2026 14:36:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF01E270
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B05AC40975
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKg9WL3I-yIS for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 14:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8ADA40743
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8ADA40743
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:35:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7728888B6; Tue, 14 Jul 2026 14:35:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 16:09:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bfb781317fe4995b22815ceb83e49c77ed0c932
X-Git-Newrev: 09ea72e44c944cefaa60071b0e037b1c8f20327c
X-Patchwork-Hint: ignore
Message-Id: <20260714143524.D7728888B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zellij: bump to version 0.44.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09ea72e44c944cefaa60071b0e037b1c8f20327c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/zellij-org/zellij/blob/v0.44.3/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 90e3332dab..ac6a219270 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a246ad21d0317fb184d150feccea1bf6a24443c88b97ae32bbcd201ecd174a1b  zellij-0.44.2-cargo6.tar.gz
+sha256  2a565f28d89c9e8caf2bad7a0f07f03747e3d3ee2d988297a41d1ffcfb034237  zellij-0.44.3-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index f1828cba78..4b4e7d6a3f 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.2
+ZELLIJ_VERSION = 0.44.3
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
