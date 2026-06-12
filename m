Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2D3CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E8458366E;
	Fri, 12 Jun 2026 16:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCArZFdV82RN; Fri, 12 Jun 2026 16:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A79B683880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781281998;
	bh=/L+1H69EpMi6O+RNao+dkmST0fn02U29aKLZnGb/6yg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KTyzsFHJo3SApE23t4kpzwIQnRf91EyuTOxa5TlB1cNaYQ1/x1BqoaXmmKjJojsb/
	 RF/EkEoxxgL93GCGERLmaU+FTOPyRy8diWHPh+e1BZLbQRjgKArEQrRo6q3mH8wiAR
	 MmM+XenSYsaRQjXzbJC729aWAbFNwnHO/ZGvM6KeFGktrEQjJSOZCWSuzJEOcyeVlj
	 SJ/sWCASG8vnJpU5P7MvxQo4Y4Us/OXUt7RKym8NcqaxeUY2RvNQIDpizniCUTyL0v
	 FjQPZUw0i/k0YBSIcWrg0nRAOlIV6+659zYRcDkQTsXFTrxznlqb6Z7/PjIe3lTmTG
	 k/9vnqDf3Hoqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A79B683880;
	Fri, 12 Jun 2026 16:33:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66DDF12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58DC083880
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etyz4MxwoJne for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 757318366E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 757318366E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:33:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3088D8811C; Fri, 12 Jun 2026 16:32:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:32:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b05934511aba4f0323b03548faae6ddc29f941a
X-Git-Newrev: 1afc7aa33457c4528b373eb695403b73a6318df2
X-Patchwork-Hint: ignore
Message-Id: <20260612163257.3088D8811C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: bump to version 3.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1afc7aa33457c4528b373eb695403b73a6318df2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.15.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index b8fc434ffa..31f83a140e 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ba2a939efead3c833c499cf487e185762f419a71d30158cd1b43c6079c586490  catch2-3.14.0.tar.gz
+sha256  9650c55e497759cc39b977e45524bc8acb15256061c112080916ab6cb0b1ea66  catch2-3.15.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 58c64af55e..4c08cb4192 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.14.0
+CATCH2_VERSION = 3.15.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
