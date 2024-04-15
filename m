Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAAEC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 12:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EE360821;
	Mon, 15 Apr 2024 12:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvS2u4mjL2PE; Mon, 15 Apr 2024 12:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F141F606EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F141F606EA;
	Mon, 15 Apr 2024 12:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B79FA1BF38E
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A384C4018E
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ng2h0IjoHUeF for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 12:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DF1C40177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF1C40177
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DF1C40177
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 12:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC9251814B9; Mon, 15 Apr 2024 14:08:37 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 14:08:19 +0200
Message-Id: <20240415120820.465163-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1713182919; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=tqNh0WUTH0qOS595uQG8hYs2i14cZFSSRCC4HUJ/6wg=;
 b=WvDne+PiZpI2iYCOfnItHdHeijwgkSDRTFrsubtc2dlHDpGJGPX4eDdSA3f51ty14o+I9V
 mfo4BAcgyT+a5Osb9rBvjZHEAM+4tumb/je+ebNiG/TpGbEsN9PFNsqpSRjNIZ/m9F+irO
 abLV7CfHHc1qpaTwNeKc2vvAMRQyEoQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=WvDne+Pi
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.5.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 5136785513..ec3450836a 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  269543a49eb76f40b3f93ff231d4c24c27a7e16c90e47d2e45bcc564de470c6e  catch2-3.5.2.tar.gz
+sha256  b7754b711242c167d8f60b890695347f90a1ebc95949a045385114165d606dbb  catch2-3.5.4.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index ee0940642f..918f1b4319 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.5.2
+CATCH2_VERSION = 3.5.4
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
