Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A610D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AEC83D01;
	Fri, 12 Dec 2025 07:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14S69aue8v-V; Fri, 12 Dec 2025 07:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BD883C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526212;
	bh=ifqHzWOrTLQDV5ri2Vw6FlXbg5kF054r1h77AzJQxMw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BRTDX1/uEahVb3ce8BcOsFpQPkvgxFPjPVkobn8530C4+8TWHHGGIIPw2AlDBYkEV
	 5qVb/4sz/MWBUv3bHuRmyB1iDFqjkmPRVinKsDwQ4f1rvHyDFFBC/XBF9J1x9uI2yO
	 JBh/C8L5J+IGS2lSfdJ1CccrPGhyFU/WhzLBnFW043b8XqYXH/UmCwxTz/PwtFQYhk
	 Qgqqy4BppLldsnCQVoMDM0fU/b1Z9IQhag46ZkWUiLDjN6zergOyK5SElM5YW8cCwY
	 8+9S1/XJE8y0xCpc/xUiUdAHKc2BgGhZpUHO5NlSrBPM8nL3/6ky1TL6eOVGLlSkeo
	 FfGJX6AM+HDTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BD883C84;
	Fri, 12 Dec 2025 07:56:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28785E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A52741134
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkp2JfUbhLMy for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D482741140
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D482741140
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D374786C93; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 17:14:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d06976eeb02c2fa4f28141ef3b6e92f9f499f69d
X-Git-Newrev: a9e7472d6c8a6220bff9ce51f3188158ba930e7e
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.D374786C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sbc: bump version to 2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9e7472d6c8a6220bff9ce51f3188158ba930e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://git.kernel.org/pub/scm/bluetooth/sbc.git/tree/ChangeLog?h=2.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sbc/sbc.hash | 2 +-
 package/sbc/sbc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
index b080c06205..313551101a 100644
--- a/package/sbc/sbc.hash
+++ b/package/sbc/sbc.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
-sha256  8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992  sbc-2.0.tar.xz
+sha256  426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2  sbc-2.1.tar.xz
 
 # sha256 locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 7a37a99643..62f481be3a 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SBC_VERSION = 2.0
+SBC_VERSION = 2.1
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
