Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A6AC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 08:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FF740807;
	Mon,  4 Mar 2024 08:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NaL6ohXvJzBC; Mon,  4 Mar 2024 08:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C85140827
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C85140827;
	Mon,  4 Mar 2024 08:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A45D91BF359
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E98181EB0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LOzfdj4mxnb for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 08:07:10 +0000 (UTC)
X-Greylist: delayed 873 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 04 Mar 2024 08:07:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2510C81E8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2510C81E8C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.36;
 helo=smtprelay02.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.31.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2510C81E8C
 for <buildroot@busybox.net>; Mon,  4 Mar 2024 08:07:10 +0000 (UTC)
Received: from [91.21.113.99] (helo=mail.go-sys.de)
 by smtprelay02.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.97.1)
 (envelope-from <mf@go-sys.de>) id 1rh37g-000000002Cq-2RhC
 for buildroot@busybox.net; Mon, 04 Mar 2024 08:52:32 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 08:52:32 +0100
Received: from go-sys.de (192.168.1.135) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.35 via Frontend Transport;
 Mon, 4 Mar 2024 08:52:31 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 4 Mar 2024 08:52:30 +0100
Message-ID: <20240304075230.22399-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.0
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

Update the license hash because of a change in copyright year:
- Copyright (C) 1997-2023 Sam Lantinga <slouken@libsdl.org>
+ Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/sdl2.hash | 6 +++---
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 7a28d5efc8..2ed3b9cc70 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.5.tar.gz.sig
-sha256  332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4  SDL2-2.28.5.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.0.tar.gz.sig
+sha256  36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0  SDL2-2.30.0.tar.gz
 # Locally calculated
-sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
+sha256  9b9e1764f06701bcf7ce21e942c682d5921ba0900c6fca760321b1c8837a9662  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index eb5042e3cd..91f6585761 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.28.5
+SDL2_VERSION = 2.30.0
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
