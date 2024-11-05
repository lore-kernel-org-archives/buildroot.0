Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39C7D12676
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 09:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E6C607C1;
	Tue,  5 Nov 2024 09:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3PmxpJ-am6w; Tue,  5 Nov 2024 09:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F64607DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F64607DF;
	Tue,  5 Nov 2024 09:54:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E2363B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B83380D17
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fDLmLz0j-VE for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 09:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.28;
 helo=smtprelay01.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 682A280D07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 682A280D07
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.31.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 682A280D07
 for <buildroot@busybox.net>; Tue,  5 Nov 2024 09:54:35 +0000 (UTC)
Received: from [84.191.232.240] (helo=mail.go-sys.de)
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1t8G7p-000000007BV-2oMi
 for buildroot@busybox.net; Tue, 05 Nov 2024 10:45:25 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 10:45:25 +0100
Received: from go-sys.de (192.168.1.175) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport;
 Tue, 5 Nov 2024 10:45:25 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 5 Nov 2024 10:45:06 +0100
Message-ID: <20241105094506.26849-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.9
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

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 4cd3cb08d8..140767ef0a 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.7.tar.gz.sig
-sha256  2508c80438cd5ff3bbeb8fe36b8f3ce7805018ff30303010b61b03bb83ab9694  SDL2-2.30.7.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.9.tar.gz.sig
+sha256  24b574f71c87a763f50704bbb630cbe38298d544a1f890f099a4696b1d6beba4  SDL2-2.30.9.tar.gz
 # Locally calculated
 sha256  9b9e1764f06701bcf7ce21e942c682d5921ba0900c6fca760321b1c8837a9662  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 558deed4bc..9eee5c7123 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.30.7
+SDL2_VERSION = 2.30.9
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
