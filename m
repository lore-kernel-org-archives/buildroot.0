Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF81EC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87760814B6;
	Mon,  1 Jul 2024 07:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1m7HdOzAxbx; Mon,  1 Jul 2024 07:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98762814BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98762814BB;
	Mon,  1 Jul 2024 07:51:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7781BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65835814BB
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NBBhExnMS2a for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:51:35 +0000 (UTC)
X-Greylist: delayed 329 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Jul 2024 07:51:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A5EC8146F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A5EC8146F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.100;
 helo=smtprelay05.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
 [80.67.31.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A5EC8146F
 for <buildroot@busybox.net>; Mon,  1 Jul 2024 07:51:35 +0000 (UTC)
Received: from [84.191.232.240] (helo=mail.go-sys.de)
 by smtprelay05.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.97.1)
 (envelope-from <mf@go-sys.de>) id 1sOBje-000000003MF-2LRK
 for buildroot@busybox.net; Mon, 01 Jul 2024 09:46:02 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jul
 2024 09:46:02 +0200
Received: from go-sys.de (192.168.1.175) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport;
 Mon, 1 Jul 2024 09:46:02 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 1 Jul 2024 09:46:00 +0200
Message-ID: <20240701074600.16262-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.4
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 3c72d1d6d1..4f302aaec8 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.3.tar.gz.sig
-sha256  820440072f8f5b50188c1dae104f2ad25984de268785be40c41a099a510f0aec  SDL2-2.30.3.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.4.tar.gz.sig
+sha256  59c89d0ed40d4efb23b7318aa29fe7039dbbc098334b14f17f1e7e561da31a26  SDL2-2.30.4.tar.gz
 # Locally calculated
 sha256  9b9e1764f06701bcf7ce21e942c682d5921ba0900c6fca760321b1c8837a9662  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index b5b0fb49e1..01dcf3551c 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.30.3
+SDL2_VERSION = 2.30.4
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
