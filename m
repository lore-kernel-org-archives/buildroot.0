Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63932E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 17:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1561380CFF;
	Wed, 11 Dec 2024 17:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2Ay8GajgApu; Wed, 11 Dec 2024 17:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3331280DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3331280DA0;
	Wed, 11 Dec 2024 17:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC97BED7
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7C6741C59
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtowOKudek8q for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 17:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F5A94052F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F5A94052F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F5A94052F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:42:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D45920002;
 Wed, 11 Dec 2024 17:42:52 +0000 (UTC)
Date: Wed, 11 Dec 2024 18:42:50 +0100
MIME-Version: 1.0
Message-Id: <20241211-add_gdb_hash-v1-1-eb02d192b6c1@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABnPWWcC/x3MQQqAIBBA0avErBPSbNNVIkSdMWdj4UAE4d2Tl
 m/x/wtClUlgHV6odLPwWTr0OEDMvhykGLvBTMZqo7XyiO7A4LKXrGYb4pIQKS4IPbkqJX7+3ba
 39gHUbdNQXgAAAA==
X-Change-ID: 20241211-add_gdb_hash-34bc5fddec5d
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733938973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zrTNczHOcQAFEy1jbI/H6RB+SNNMxQ72p8TkzD2TaZ0=;
 b=eqTPstt70n6ZqR1VNE4M+elvtWNeLLRyZ/x6/VmRGO6oKRJYgsmlaTcaCUThvkBfw6wcvc
 qlYgkPCqXWIO/u4TDzDximPZz13+UClSJwpBxionu+2bWNHuPDS0yv7lCBhnaDCvBpN9dO
 nZhWfGkys/4CFcSLCdoJp9lhdJMfPB3HSMd3kGsNCfVLxTMnI15lFaBFK0CGeBtlee4yom
 nyr4jvj7At+l1TsBf7eM5o7Pafi5bWT2YXy8j7oJWPQFL6ugCLtlq5q6PdcUwRjapCmnkk
 vIGzFR80NG2YuWHIX0W8HTpEGhYlv/R6KjBYXZngy180MJL0DYH3L+a36rxgkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eqTPstt7
Subject: [Buildroot] [PATCH] package/gdb: add hash of licence files
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds sha512 hash of the license files for GDB.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/gdb/gdb.hash | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 6cf55a675dae3d373f9b32f795aec469049464f0..0fcfd314a01bef78b971a0fa52bf50e7c44a3dca 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,3 +5,9 @@ sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c3
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
+
+# Locally calculated (fetched from gcc.gnu.org)
+sha512 cb0a4f39c66d8d6bf668b2e989fc7741b5da50a48cf69921556e87c8d2ab648d23189628e5a26d7b86b9db47c8593e0e4bc6e9881ec03ca8d2ed62d8bd761e84  COPYING
+sha512 7633623b66b5e686bb94dd96a7cdb5a7e5ee00e87004fab416a5610d59c62badaf512a2e26e34e2455b7ed6b76690d2cd47464836d7d85d78b51d50f7e933d5c  COPYING3
+sha512 12291afdbc1daf063a0829e93fbd95fb8eac599cfb962408dd900ce261dc1117d3ae2b7fd27b90c3ed69e57c4398a0b678b0ffd1df8ba7c1ed02d0280825d3af  COPYING3.LIB
+sha512 85385eef52429877ad2fbf4cdffaad6e7e587aa030985c53ebbab329e3ba83dae5a72c3940941061f2160d506743abfef062b8d20ccd98d976edf8c94eccd77f  COPYING.LIB

---
base-commit: c12008448e6d0f78774b386fb0f66a14c3064eed
change-id: 20241211-add_gdb_hash-34bc5fddec5d

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
