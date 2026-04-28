Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43627FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACEF40CD8;
	Tue, 28 Apr 2026 18:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRwLXdZqOa0v; Tue, 28 Apr 2026 18:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF2D540C9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401184;
	bh=LrE+AG9MQg3QaWfn/rycUk7Tnpceu4UnSQNQscN7hdM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XfMQ4qx/HYUiwsMnZoDr1C6G63l28xRktfToANM17xlVOMY6UuWfXclQBeA/XOOa2
	 /vLkELZ7YrwXpMtKDJjfNvNGqMRG+cSmT0cIeWhganPhqsUrN1uBzbgGGg1/9/QWOg
	 o6HmJDZol2je+zDPeQY+5Kwb2EbpWANgzV1/MAGphbQXR2HPiesE5nwhOTMsPjv1Qm
	 3WqSYDNcx4XGJu6wOYf9GelkazzSX63cAf4VrAi88aE2Ax7L/NCZYRbLPLxpofrl4y
	 mUevqgXa4m5BQFRrK38fEHSi3BJVLB49hquw4UgcMBqbvPY3z10On/I5sgtfhUvEYI
	 k14WT7JjTZhJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF2D540C9D;
	Tue, 28 Apr 2026 18:33:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8325B231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A6FD60F2C
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcKDCeLmL3uK for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B911C60F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B911C60F21
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:32:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 725D3838F7; Tue, 28 Apr 2026 18:32:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:31:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbca3dab85fec57213e42f71024f87d7702d63f7
X-Git-Newrev: 3d6bc9b2af6ac992810359801bcd0494f5722b03
X-Patchwork-Hint: ignore
Message-Id: <20260428183257.725D3838F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uacme: bump version to 1.8.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d6bc9b2af6ac992810359801bcd0494f5722b03
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Change log at
https://github.com/ndilieto/uacme/blob/upstream/1.8.1/ChangeLog

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index c384d1ed03..bb99bcccab 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  69170ef84891a0e3ccce50833ac90db75de26b2c8432050256c1bf4ec26c8ad7  uacme-1.8.0.tar.gz
+sha256  de7588577f8298dcb0d42dfaa9452a918fa692c4e165060207ac22f72fb0425d  uacme-1.8.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index f358025c44..dfd64c2523 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.8.0
+UACME_VERSION = 1.8.1
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
