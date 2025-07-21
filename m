Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F454C83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 22:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A68D184A7B;
	Mon, 21 Jul 2025 22:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wK8R2YWNzby; Mon, 21 Jul 2025 22:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF58C84A6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF58C84A6B;
	Mon, 21 Jul 2025 22:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C636ADA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 22:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B53E284A6B
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 22:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaxGHhOoS0gA for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 22:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D4BA84A6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D4BA84A6A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D4BA84A6A
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 22:02:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 59ECBB00572;
 Tue, 22 Jul 2025 00:02:26 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Jul 2025 00:02:19 +0200
Message-ID: <20250721220219.758112-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753135347;
 bh=jF5Vt51kOxULHIGI+rJrULh2jFPY6+gcDm9+uwFH7xI=;
 h=From:To:Cc:Subject:Date:From;
 b=B25aJnLrco1nKE+7T4ztCsZHsuQ8hPRyk9mY2o0t1GO1k+GqnmGhxoLmQXl4zhCcv
 KKT/OKbagwjcMnxg+t7Esay3Y9naa/iGNrNJjvbvfbs7YF6PxcpZiLHgaFh9oYyxNR
 epZG//v+Fssk/0OLleSzkcrTmem/CsXubZe9G2AcS6HlFtxnsHOp99mwu7mXrHcVQs
 pvXUrvgWslKcT2kVhKFdfRcQJqVGwNEKS4bQ7XAhfADX4sD66+L5CohCAiyIwX9anR
 mwJCzpU8Pxp0NLIiqzj2MlnOba9BRHD0Fyr+7kGIJT1Vls967qDAQ/cN3oNsZ/i0Jy
 59d9AsHqi4PBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B25aJnLr
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.4.7
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

For change log since v2.4.6, see:
https://github.com/FluidSynth/fluidsynth/releases/tag/v2.4.7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 9421f90fbf..9953997692 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a6be90fd4842b9e7246500597180af5cf213c11bfa3998a3236dd8ff47961ea8  fluidsynth-2.4.6.tar.gz
+sha256  7fb0e328c66a24161049e2b9e27c3b6e51a6904b31b1a647f73cc1f322523e88  fluidsynth-2.4.7.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 66bb9e287d..e06afe4a07 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.4.6
+FLUIDSYNTH_VERSION = 2.4.7
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
