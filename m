Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA88C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 09:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 526EF40B19;
	Tue, 16 Jul 2024 09:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvuJoJp-n5Z7; Tue, 16 Jul 2024 09:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B2C40AF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B2C40AF9;
	Tue, 16 Jul 2024 09:43:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0135C1BF870
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 09:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3AA3810B4
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 09:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3ktRHsMaUgG for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 09:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88B5881086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B5881086
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88B5881086
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 09:43:08 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 69DBE2C80261;
 Tue, 16 Jul 2024 11:43:06 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 11:43:05 +0200
Message-Id: <20240716094305.1646641-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721122986; bh=vSdCSdyjWQ8S4k6dlmft9qSjuWj4tmnitebF4SZkrP8=;
 h=From:To:Cc:Subject:Date;
 b=F5FW7tLNuCQkAK9DHFlSYLlVI0OzSuQ9rwdPZdO86kQVoybQFey1a7EK71CKKGITg
 9cQPuv8pdO3rOWhzc0m+9q1SdXJv11UlGkKBUYOEtK/yijut94gdHsWI2K64uhnJyg
 8e+dajUt2JJ1svQb5lfwq7gvvWh2svZgw4xET/WZwmja7pFQJkYQk62UNDZ8nsbiGN
 Onz2m2/bZbwq/fVVwh3uUGw2hCR/UbUwx2mvaDIOC+D4/mHwiT7mOU+8ZiVrz3PQhR
 BA/3z8nRXWCkq/6BAyBWQ1GOqGPKFmVxgxP6jqjh2ip/kDcApHtVdCzcymUTOCcIPM
 R7CkkvPvWbEcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=F5FW7tLN
Subject: [Buildroot] [PATCH] package/nodejs: security bump to v20.15.1
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

Release Notes: https://nodejs.org/en/blog/release/v20.15.1

Fixes the following CVE's:

CVE-2024-36138 - Bypass incomplete fix of CVE-2024-27980 (High)
CVE-2024-22020 - Bypass network import restriction via data URL (Medium)
CVE-2024-22018 - fs.lstat bypasses permission model (Low)
CVE-2024-36137 - fs.fchown/fchmod bypasses permission model (Low)
CVE-2024-37372 - Permission model improperly processes UNC paths (Low)

Also these additional CVE's were fixed in the v20.12.1 and v20.12.2 releases [1][2]:

CVE-2024-27983 - Assertion failed in node::http2::Http2Session::~Http2Session() leads to HTTP/2 server crash- (High)
CVE-2024-27982 - HTTP Request Smuggling via Content Length Obfuscation - (Medium)
CVE-2024-27980 - Command injection via args parameter of child_process.spawn without shell option enabled on Windows

NodeJS tests are passing:
$ ./support/testing/run-tests -o ./outputs/ -k tests.package.test_nodejs -d dl
12:02:58 TestNodeJSModuleHostSrc                  Starting
12:02:58 TestNodeJSModuleHostSrc                  Building
13:17:15 TestNodeJSModuleHostSrc                  Building done
13:17:23 TestNodeJSModuleHostSrc                  Cleaning up
.13:17:23 TestNodeJSModuleHostBin                  Starting
13:17:23 TestNodeJSModuleHostBin                  Building
14:06:15 TestNodeJSModuleHostBin                  Building done
14:06:20 TestNodeJSModuleHostBin                  Cleaning up
.14:06:20 TestNodeJSBasic                          Starting
14:06:20 TestNodeJSBasic                          Building
14:55:40 TestNodeJSBasic                          Building done
14:55:45 TestNodeJSBasic                          Cleaning up

LICENSE hash changed due to changes in vendored components:

* copyright year update and adding spdx identifier [1]

[1] https://nodejs.org/en/blog/release/v20.12.1
[2] https://nodejs.org/en/blog/release/v20.12.2
[3] https://github.com/nodejs/node/commit/d5a316f5ea3fade3140c2ae35c144b500fb5d758

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 2cbbf766f5..61bda55098 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v20.12.0/SHASUMS256.txt.asc
-sha256  007ca2699cf6e84290e5bed844ed66ef9d707d23561dfaf117212b7dce216ba7  node-v20.12.0-linux-arm64.tar.xz
-sha256  668fb421a24be596c98f00a31049fbf6ada14d221b7382e0f1caa55ab421431a  node-v20.12.0-linux-armv7l.tar.xz
-sha256  78dc3b7ad993c332684802e35c1f0de2b76193d13394bc89e3bab216828587c7  node-v20.12.0-linux-ppc64le.tar.xz
-sha256  0a126adf5b6a5eb11a37bad76a0c626a18f20b6811322e68aae0e3cf9bf580bd  node-v20.12.0-linux-x64.tar.xz
-sha256  76e5346cebfd581528f699f764f4d1a6e87cb818b696708f235ddcb625a0f78d  node-v20.12.0.tar.xz
+# From https://nodejs.org/dist/v20.15.1/SHASUMS256.txt.asc
+sha256  10d47a46ef208b3e4b226e4d595a82659123b22397ed77b7975d989114ec317e  node-v20.15.1-linux-arm64.tar.xz
+sha256  7bc120efdd8018f6915471b963d9b80adf4ed406d6dc9edb4ae944b85f505c4c  node-v20.15.1-linux-armv7l.tar.xz
+sha256  b33e684802251397ad62ad3f8a1836267ee8b7723f87f669470018ad0035287b  node-v20.15.1-linux-ppc64le.tar.xz
+sha256  26700f8d3e78112ad4a2618a9c8e2816e38a49ecf0213ece80e54c38cb02563f  node-v20.15.1-linux-x64.tar.xz
+sha256  fdd53a5729d936691a2a1151046fb4897721cb8b0fca2af957823a9b40fe0c34  node-v20.15.1.tar.xz
 # Locally calculated
-sha256  d3a9fbfe0a1fb78627ee296cd5ca5b498822d4d1c5da3b8e8100c41bd7b791fd  LICENSE
+sha256  49cd410e0fe6a8879a40d0764092d1e6114cc85fe41d4efed990d028eec25582  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 9ed51fbe9b..104d2cf258 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.12.0
+NODEJS_COMMON_VERSION = 20.15.1
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
