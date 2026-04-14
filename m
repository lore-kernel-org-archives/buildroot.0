Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3D0F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F49B42D2B;
	Tue, 14 Apr 2026 19:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMBYoACSfMR9; Tue, 14 Apr 2026 19:17:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA0042D25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776194268;
	bh=HhK0Q3J+ldtV3+SppWurmay8htprpEWhSxxDivneXW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sB0Zw0ABe+GxpAdRpHMM4JNcAfSQEDjfAMlXNVVGlt2tB8TnCqGS1GnNPitcZ8MuT
	 nAnsV0JKnJQSvG+zEVaVUYkiJS5Km79CsNb0pDJy3aKHIbDEDRbxW/1D9TTF0fxj5f
	 sCowqfDbQzK4zirBxBqgozMpiseqrHm4nk15XRARvS6RlVS3wsQXOiMzhlXfU4u1LO
	 D0uLmFTWOBbeKTa3DGMSBNdAlnV3HdBCmbfqDM9nqY/tcU/8RNN+zP0a4+DE6eI/ux
	 R9WilBVa0CZyqTgC4sFNYBaQ6jLsjulGKqE0tsK+ci34z98LU1xyY4D1qxEwqcpm2G
	 e41EaYAKoqQNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA0042D25;
	Tue, 14 Apr 2026 19:17:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FC4237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FF6684D22
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfUh4GGjEzQj for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BD384D21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53BD384D21
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:17:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9441811FC; Tue, 14 Apr 2026 19:17:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:16:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c0d4efc1c9588d60c78764de3a6e5dc6da8ed2e
X-Git-Newrev: 7518efc192069262e181578ff5e8c8ff06d445f5
X-Patchwork-Hint: ignore
Message-Id: <20260414191745.E9441811FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: bump to version 3.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7518efc192069262e181578ff5e8c8ff06d445f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.14.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index c45cd0e3c5..b8fc434ffa 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  650795f6501af514f806e78c554729847b98db6935e69076f36bb03ed2e985ef  catch2-3.13.0.tar.gz
+sha256  ba2a939efead3c833c499cf487e185762f419a71d30158cd1b43c6079c586490  catch2-3.14.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index fb0edbc9bc..58c64af55e 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.13.0
+CATCH2_VERSION = 3.14.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
