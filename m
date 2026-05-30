Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C539CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C025D84701;
	Tue,  9 Jun 2026 13:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IrY0sf9q_Pp; Tue,  9 Jun 2026 13:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8051F82217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010271;
	bh=R7w/zuPJ1Iddbd3CfHjGR8j53MEJSig3xldi2Q83900=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Btw1gRb0Q+WqnG42B8dxXBP1VGD5Tn79LHeCEtdTJ3IABFxmKFEEHlpZbeHdzsmc+
	 AD/1wqyNUiAOkdwmg5hIj59i7ENGP6IF12RVjaHU7YqJE69T/e3kOdXxju21Xl2EUC
	 8Pkb0K9tOB8QdCIk3vIP1cJTj7FeivzerUnfN08pYxZerRnMQUkei1mtmMm4aXYv/q
	 VllMDkNLyorsGrBZD4a/fB+tNrKFLeXcfqBvMvPGoN1QgCSfsBi+8hWlVrpGGLKHgf
	 EALPfe6jJ8l0FSYjvFYYubzWI0K8PODyLvB1j1+hV2zpSIUtipQis+NnHpcu6n7l/Y
	 3FsCVoPgQ5lRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8051F82217;
	Tue,  9 Jun 2026 13:04:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 881CD2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 820BA4271C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCzqB21OwtfN for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A44E942705
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A44E942705
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0A9E87E7E; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:05:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f009a9f804b8a148490e2301fc2831aa1d0601de
X-Git-Newrev: 354b8442f89b88c031c8f36f6a7c3d6a3cc5b975
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.E0A9E87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 707c12bf00dafdfd3899b1a6c36435dbbf6c7022
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/354b8442f89b88c031c8f36f6a7c3d6a3cc5b975
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff COPYRIGHT:
    -Copyright (C) 2005-2025 Mike Pall. All rights reserved.
    +Copyright (C) 2005-2026 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/luajit.hash | 4 ++--
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index e147845e4c..4ac36b1af6 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ab3f16d82df6946543565cfb0d2810d387d79a3a43e0431695b03466188e2680  luajit-871db2c84ecefd70a850e03a6c340214a81739f0.tar.gz
+sha256  ac2defd1e9b4ab07ac0a52f2403318ffb0d54505b975dff0cfc49a927ab84d90  luajit-707c12bf00dafdfd3899b1a6c36435dbbf6c7022.tar.gz
 
 # Locally calculated
-sha256  5b79fb4754728487cf43d55b213bb68369912484f2dd7ab68380435e994bce39  COPYRIGHT
+sha256  6cda3076a8c09b31bb1f90da614ea89e7ee194589626eeac613e522849604e47  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index ed44e165c2..bbd423ad02 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 871db2c84ecefd70a850e03a6c340214a81739f0
+LUAJIT_VERSION = 707c12bf00dafdfd3899b1a6c36435dbbf6c7022
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
