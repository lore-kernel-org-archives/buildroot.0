Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53678D5B144
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEFDD80DA8;
	Mon, 28 Oct 2024 20:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9pnqkk594Pi; Mon, 28 Oct 2024 20:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B3680DAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B3680DAA;
	Mon, 28 Oct 2024 20:09:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91118AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 707B140153
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrljuRkwe7t7 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53BCE40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53BCE40015
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53BCE40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:09:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 48E52B00576;
 Mon, 28 Oct 2024 21:09:06 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 28 Oct 2024 21:09:01 +0100
Message-ID: <20241028200901.649397-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730146147;
 bh=zhqFFodAjbcGSKKnFx0dKrxwJcSWs6jctooGlhChufk=;
 h=From:To:Cc:Subject:Date:From;
 b=RYYYoTRXQYjcupDwSw1S0HepCMIII9w4J3lFsIhz2yiS9EuL+jj09T9nxcgsw5zjg
 8eIWQAb17GhF1CoOrBl728WvoFBPWejmbrO2OEi1qu+n/wXURDsj3IuiqvGoKySXS0
 u9Lb6MSqdsacsosor7W1B8UcmSSYQhXt/N5Nmwl8b7w0xbbZFK+O4uwdL0xl7zgJQs
 PAMhxGvBr8YbALK8zp+tlDfUw5nj3b20Zhm9YHHF8urd9mJJ9Xm5qHa25J3ftXvu1p
 qArbyBiLHC8rF7zoTsjwIU0ymHTo47ijZSL8ogQH0J43Mos8GPeN+MVfHRTAQT0+2b
 Fozdky2rVOR5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RYYYoTRX
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.3.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v2.3.6, see:
https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch runtime tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8208922400
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 0f54ad254e..787e97ce37 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3340d73286b28fe6e5150fbe12648d4640e86c64c228878b572773bd08cac531  fluidsynth-2.3.6.tar.gz
+sha256  38d1d910783ab67c07a4d859d1aa95525979ff352b927e25b1ae894c774bb4c4  fluidsynth-2.3.7.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 3105162bda..98b56ba696 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.3.6
+FLUIDSYNTH_VERSION = 2.3.7
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
