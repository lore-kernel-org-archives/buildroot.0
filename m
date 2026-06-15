Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56E3CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E6441962;
	Mon, 15 Jun 2026 20:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNMElQg6Ib0c; Mon, 15 Jun 2026 20:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C7474195C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781554220;
	bh=VS5KUKELzS24tvK1p4qxDJ0opUZfAhxtZvqrI+KgS6I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Loptpz4ei+eDf7hWst2CFLfam2CZ/ki94O1/AFxd9nAGlmgR14iSvgWObnmD7vmRC
	 yW4CDvJE+nqpbNSfXpUMIEWcmbCOZhNCrq2xUYRKkCb3Rc7TFTZWwfyPuWoU0mFXnW
	 LErHKyLs33XQo/SPDjOKPl1jFkKIHF1z99f6Dbd3tTzlQNm5G1FSE23IX4/mjdmX1D
	 KRqkBzSQpu9+MhygD/cX8amHl13+/YkKH8ItwZzfN5Bs68ijhoEc1PI/bQnkTByCE4
	 4W+QrB+xshF9ygTrqnXQauUVFZ6WNjJn+yC42P9HQHBWWKaOoof5daEb5O8HRXyeU+
	 XpWW0yk24irRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C7474195C;
	Mon, 15 Jun 2026 20:10:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 867B82F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CBB38447A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVKo5-5FTs55 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A98984474
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A98984474
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52D7E7FE00; Mon, 15 Jun 2026 20:09:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 21:55:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c6595aaac7288335e8d8bcccc383a8a12f635f7
X-Git-Newrev: d8d850342d738798885602c6ca7b463240237753
X-Patchwork-Hint: ignore
Message-Id: <20260615200957.52D7E7FE00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: bump to version 3.15.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8d850342d738798885602c6ca7b463240237753
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.15.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 31f83a140e..0c205fa30b 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9650c55e497759cc39b977e45524bc8acb15256061c112080916ab6cb0b1ea66  catch2-3.15.0.tar.gz
+sha256  be23a52b85cf04cd9587612147a10b023d59ed9757fa1843cc99e615d6c0893c  catch2-3.15.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 4c08cb4192..f62eda71f6 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.15.0
+CATCH2_VERSION = 3.15.1
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
