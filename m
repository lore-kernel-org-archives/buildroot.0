Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1065ECAC5B5
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 11:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD2A98109E;
	Mon, 29 Sep 2025 11:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pelTl4f_eh42; Mon, 29 Sep 2025 11:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA83810A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA83810A4;
	Mon, 29 Sep 2025 11:11:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E000A12D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 11:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCC01810A4
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 11:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lDigd0Q0VKx for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 11:11:07 +0000 (UTC)
X-Greylist: delayed 441 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Sep 2025 11:11:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A67488109E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A67488109E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.97;
 helo=smtprelay05.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
 [80.67.31.97])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A67488109E
 for <buildroot@busybox.net>; Mon, 29 Sep 2025 11:11:07 +0000 (UTC)
Received: from [84.146.212.120] (helo=mail.go-sys.de)
 by smtprelay05.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1v3BfN-000000005mO-26oL
 for buildroot@busybox.net; Mon, 29 Sep 2025 13:03:37 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59; Mon, 29 Sep
 2025 13:03:41 +0200
Received: from go-sys.de (192.168.1.81) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.59 via Frontend Transport; Mon, 29 Sep
 2025 13:03:41 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Mon, 29 Sep 2025 13:03:30 +0200
Message-ID: <20250929110330.75028-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.32.10
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

Stable bugfix release:
https://github.com/libsdl-org/SDL/releases/tag/release-2.32.10

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 7e3a40ac5d..484545fe88 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.8.tar.gz.sig
-sha256  0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e  SDL2-2.32.8.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.10.tar.gz.sig
+sha256  5f5993c530f084535c65a6879e9b26ad441169b3e25d789d83287040a9ca5165  SDL2-2.32.10.tar.gz
 # Locally calculated
 sha256  97f35b302b361680ec1e891e95d2d52097bb95abff361434916d99dc1305f127  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 1537d3d82e..eb6e753869 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.32.8
+SDL2_VERSION = 2.32.10
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
