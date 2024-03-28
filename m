Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E7C54E64
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 11:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F06AE60D6D;
	Thu, 28 Mar 2024 11:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akQwAW1yjQnS; Thu, 28 Mar 2024 11:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 100F260D7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 100F260D7F;
	Thu, 28 Mar 2024 11:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 949491BF3A7
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 11:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80A5440445
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 11:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSkkkugeiKHZ for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 11:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE198401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE198401CE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE198401CE
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 11:01:01 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 389A52C8007F;
 Thu, 28 Mar 2024 12:00:59 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 12:00:58 +0100
Message-Id: <20240328110058.2037303-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711623659; bh=+qff9znGxk8ZZV2syD4zPZLiK1pstSBbvk7eAO8ANV8=;
 h=From:To:Cc:Subject:Date;
 b=Hf00mNP4sWxvQHX3lP4q+KodAGBpDT070KJe9/MHoaa0EFyloDWtu9o6mffDDIUmK
 tUHfbEUuC+7KmsbNVuesp1bmHYGBawlPT6HuBEm+M97Zv3N2S4Q953I88DwGXdUdFQ
 IcquwShhQfLy/T2uPNOMp02RZaAAifVRcV8YIr494BBVzO/rOczUpdDSGqxIbNFNXN
 BqdUCKsdw1UWEvSxC4XdQMEIIq3RaxwwTAJveHkETCWR012q07kCFo6+KazjPt9Ofw
 MnD/saVJ6jayZT/llnHbiGpT61Plsv5FMxM1Nwu/x0RYLk1tQ13R7elKswTr5n8cqj
 g0PF0ZUyTkG+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Hf00mNP4
Subject: [Buildroot] [PATCH] package/nodejs: bump to 20.12.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://nodejs.org/en/blog/release/v20.12.0

LICENSE hash changed due to changes in vendored components:

* copyright year updates [1][2]
* version name update [3]
* change from "Unicode, Inc. License - Data Files and Software"
  to the "Unicode License v3" [4]. This is in the icu vendored
  dependency which is unused in buildroot.
* new build tooling script [5] under BSD style license

[1] https://github.com/nodejs/node/commit/347e1dd06a5f927d9fd64ce72d776c56d5101910
[2] https://github.com/nodejs/node/commit/b88170d602791fa62fc45ac80ca9953bc1bdd25b
[3] https://github.com/nodejs/node/commit/c8233912e9fd7464898b549d6762130722bf0bf4
[4] https://github.com/nodejs/node/commit/625fd69b76b5a8f59152f803b31941c8986d924b
[5] https://github.com/nodejs/node/commit/b5bc597871ca701bab750c46d31ed626decd7f89

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ddab345e0a..2cbbf766f5 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v20.11.1/SHASUMS256.txt.asc
-sha256  c957f29eb4e341903520caf362534f0acd1db7be79c502ae8e283994eed07fe1  node-v20.11.1-linux-arm64.tar.xz
-sha256  28e0120d2d150a8f41717899d33167b8b32053778665583d49ff971bfd188d1b  node-v20.11.1-linux-armv7l.tar.xz
-sha256  51343cacf5cdf5c4b5e93e919d19dd373d6ef43d5f2c666eae299f26e31d08b5  node-v20.11.1-linux-ppc64le.tar.xz
-sha256  d8dab549b09672b03356aa2257699f3de3b58c96e74eb26a8b495fbdc9cf6fbe  node-v20.11.1-linux-x64.tar.xz
-sha256  77813edbf3f7f16d2d35d3353443dee4e61d5ee84d9e3138c7538a3c0ca5209e  node-v20.11.1.tar.xz
+# From https://nodejs.org/dist/v20.12.0/SHASUMS256.txt.asc
+sha256  007ca2699cf6e84290e5bed844ed66ef9d707d23561dfaf117212b7dce216ba7  node-v20.12.0-linux-arm64.tar.xz
+sha256  668fb421a24be596c98f00a31049fbf6ada14d221b7382e0f1caa55ab421431a  node-v20.12.0-linux-armv7l.tar.xz
+sha256  78dc3b7ad993c332684802e35c1f0de2b76193d13394bc89e3bab216828587c7  node-v20.12.0-linux-ppc64le.tar.xz
+sha256  0a126adf5b6a5eb11a37bad76a0c626a18f20b6811322e68aae0e3cf9bf580bd  node-v20.12.0-linux-x64.tar.xz
+sha256  76e5346cebfd581528f699f764f4d1a6e87cb818b696708f235ddcb625a0f78d  node-v20.12.0.tar.xz
 # Locally calculated
-sha256  7b0bbdca72f925bd78b764914651244a4432a753c7325d061a565cd7eac1193d  LICENSE
+sha256  d3a9fbfe0a1fb78627ee296cd5ca5b498822d4d1c5da3b8e8100c41bd7b791fd  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 858c6a86f5..9ed51fbe9b 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.11.1
+NODEJS_COMMON_VERSION = 20.12.0
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
