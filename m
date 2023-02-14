Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F55C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 09:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD32E6107C;
	Tue, 14 Feb 2023 09:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD32E6107C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJvnUasUago0; Tue, 14 Feb 2023 09:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BBF60FDD;
	Tue, 14 Feb 2023 09:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10BBF60FDD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E13CB1BF2EA
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 09:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C823581DEE
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 09:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C823581DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYk0ZVeATofO for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 09:16:38 +0000 (UTC)
X-Greylist: delayed 00:10:59 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 784B281DEC
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.97])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 784B281DEC
 for <buildroot@busybox.net>; Tue, 14 Feb 2023 09:16:38 +0000 (UTC)
Received: from [91.21.122.2] (helo=mail.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1pRrFn-0007MK-Vn
 for buildroot@busybox.net; Tue, 14 Feb 2023 10:05:36 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 14 Feb
 2023 10:05:35 +0100
Received: from go-sys.de (192.168.1.173) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.6 via Frontend Transport;
 Tue, 14 Feb 2023 10:05:35 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Tue, 14 Feb 2023 10:05:35 +0100
Message-ID: <20230214090535.9545-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.26.3
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
- Copyright (C) 1997-2022 Sam Lantinga <slouken@libsdl.org>
+ Copyright (C) 1997-2023 Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/sdl2.hash | 6 +++---
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 86e0d86e7c..e26dcee301 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.2.tar.gz.sig
-sha256  95d39bc3de037fbdfa722623737340648de4f180a601b0afad27645d150b99e0  SDL2-2.26.2.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.3.tar.gz.sig
+sha256  c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057  SDL2-2.26.3.tar.gz
 # Locally calculated
-sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
+sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 8995178e71..c01f12d12c 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.26.2
+SDL2_VERSION = 2.26.3
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
