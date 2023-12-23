Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179A9C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 06:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A53E683BB9;
	Sat, 23 Dec 2023 06:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A53E683BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgoUOeKMDRD0; Sat, 23 Dec 2023 06:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B55782813;
	Sat, 23 Dec 2023 06:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B55782813
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 222BC1BF82F
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 06:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE71860AFF
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 06:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE71860AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWIxu1L-RYT4 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 06:45:53 +0000 (UTC)
Received: from mail-108-mta36.mxroute.com (mail-108-mta36.mxroute.com
 [136.175.108.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD34860A8D
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 06:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD34860A8D
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta36.mxroute.com (ZoneMTA) with ESMTPSA id 18c95679d8f0003727.001
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 23 Dec 2023 06:40:44 +0000
X-Zone-Loop: ea2d75c45b8ac9debe04c5ccf87cb654a503834d1a4c
X-Originating-IP: [136.175.111.2]
Message-ID: <f76c97b6-857a-45d3-b690-5ebe3caba4ef@grantnichol.com>
Date: Sat, 23 Dec 2023 00:40:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Grant Nichol <me@grantnichol.com>
References: <>
Content-Language: en-US
To: buildroot@buildroot.org
In-Reply-To: <>
X-Authenticated-Id: me@grantnichol.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=grantnichol.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 To:References:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9ghIHLnrkT/5JgYqf621Xr9QbZ1P1ZZzQFpQBTjHrs=; b=svY8zA7sUGwYAZv2qGTUA21w8B
 DkhzCt7eSJLd79x2IUozTa/Fa/bQ9498FaZjFStkSiUUT5nfHYn6pjrA8tq4kfG9/ZfcqDSsgzMo8
 HL1REuR51khScRmBtZgQyj8j97KHcmfoMtC8FLjheQN/PB3ilAkGOZAsk0eezSINnInP8PcpwID5O
 FWtJ9/NbzZc0ZBpl0FhEpqwtaPqCrtBYX/1DpGIPn04CKANfZB95O3TiVc8BdoRBSItM2BCkfg0pX
 LJdnQmcMH7BtKHgELNllHkHzOO2BLe1nWtx25TOLc88b5E8NcpYVSUbiLOlf1GzNTz8paF4ybvU5P
 4lT84Ykg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=grantnichol.com header.i=@grantnichol.com
 header.a=rsa-sha256 header.s=x header.b=svY8zA7s
Subject: [Buildroot] [PATCH 2/2] package/libopenssl: Patch for riscv32 builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a mispelling in upstream causing builds for riscv32 to fail when
linking.

Signed-off-by: Grant Nichol <me@grantnichol.com>
---
 ...x-mispelling-of-extension-test-macro.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch

diff --git a/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
new file mode 100644
index 0000000000..aa2a531977
--- /dev/null
+++ b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
@@ -0,0 +1,29 @@
+From 68c549df05892c16b99603b9a831c79c540f268c Mon Sep 17 00:00:00 2001
+From: Grant Nichol <me@grantnichol.com>
+Date: Fri, 22 Dec 2023 23:46:39 -0600
+Subject: [PATCH] riscv: Fix mispelling of extension test macro
+
+When refactoring the riscv extension test macros,
+RISCV_HAS_ZKND_AND_ZKNE was mispelled.
+
+Upstream: https://github.com/openssl/openssl/pull/23139
+---
+ providers/implementations/ciphers/cipher_aes_xts_hw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/providers/implementations/ciphers/cipher_aes_xts_hw.c b/providers/implementations/ciphers/cipher_aes_xts_hw.c
+index b35b71020e..65adc47d1f 100644
+--- a/providers/implementations/ciphers/cipher_aes_xts_hw.c
++++ b/providers/implementations/ciphers/cipher_aes_xts_hw.c
+@@ -285,7 +285,7 @@ static const PROV_CIPHER_HW aes_xts_rv32i_zbkb_zknd_zkne = {                   \
+ # define PROV_CIPHER_HW_select_xts()                                           \
+ if (RISCV_HAS_ZBKB_AND_ZKND_AND_ZKNE())                                        \
+     return &aes_xts_rv32i_zbkb_zknd_zkne;                                      \
+-if (RISCV_HAS_ZKND_ZKNE())                                                     \
++if (RISCV_HAS_ZKND_AND_ZKNE())                                                     \
+     return &aes_xts_rv32i_zknd_zkne;
+ # else
+ /* The generic case */
+--
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
