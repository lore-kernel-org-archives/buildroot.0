Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E40E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C43480630;
	Thu,  2 Jan 2025 10:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndlk8p1fqIf1; Thu,  2 Jan 2025 10:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC8080C16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC8080C16;
	Thu,  2 Jan 2025 10:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B808BF27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A768580D50
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P82Eq9U3eO1J for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:33:25 +0000 (UTC)
X-Greylist: delayed 319 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 02 Jan 2025 10:33:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DC9880C16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC9880C16
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.24;
 helo=smtprelay01.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.31.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DC9880C16
 for <buildroot@busybox.net>; Thu,  2 Jan 2025 10:33:24 +0000 (UTC)
Received: from [91.21.124.170] (helo=mail.go-sys.de)
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1tTIMS-000000004uo-0Wed
 for buildroot@busybox.net; Thu, 02 Jan 2025 11:23:28 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Thu, 2 Jan
 2025 11:23:27 +0100
Received: from go-sys.de (192.168.1.210) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.43 via Frontend Transport;
 Thu, 2 Jan 2025 11:23:27 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Thu, 2 Jan 2025 11:23:26 +0100
Message-ID: <20250102102326.30250-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.11
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

Update the license hash because of a change in copyright year:
- Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>
+ Copyright (C) 1997-2025 Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/sdl2.hash | 6 +++---
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 140767ef0a..c6237d1286 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.9.tar.gz.sig
-sha256  24b574f71c87a763f50704bbb630cbe38298d544a1f890f099a4696b1d6beba4  SDL2-2.30.9.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.11.tar.gz.sig
+sha256  8b8d4aef2038533da814965220f88f77d60dfa0f32685f80ead65e501337da7f  SDL2-2.30.11.tar.gz
 # Locally calculated
-sha256  9b9e1764f06701bcf7ce21e942c682d5921ba0900c6fca760321b1c8837a9662  LICENSE.txt
+sha256  97f35b302b361680ec1e891e95d2d52097bb95abff361434916d99dc1305f127  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 62d6e91894..50f80c68d7 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.30.9
+SDL2_VERSION = 2.30.11
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
