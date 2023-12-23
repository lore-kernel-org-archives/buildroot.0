Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C6BC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 07:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6885B83CE4;
	Sat, 23 Dec 2023 07:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6885B83CE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYX6YrVakK6a; Sat, 23 Dec 2023 07:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B184983CF7;
	Sat, 23 Dec 2023 07:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B184983CF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 700FE1BF2BD
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 07:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 543AF4020B
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 07:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 543AF4020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3lDLOOmz78n for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 07:07:52 +0000 (UTC)
Received: from mail-108-mta40.mxroute.com (mail-108-mta40.mxroute.com
 [136.175.108.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E139240169
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 07:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E139240169
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta40.mxroute.com (ZoneMTA) with ESMTPSA id 18c95805f560003727.001
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 23 Dec 2023 07:07:47 +0000
X-Zone-Loop: 3320b116ff977ed1098adb16b582f624d7325fd0830a
X-Originating-IP: [136.175.111.2]
From: Grant Nichol <me@grantnichol.com>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 01:07:30 -0600
Message-ID: <20231223070730.2417463-1-me@grantnichol.com>
In-Reply-To: <f76c97b6-857a-45d3-b690-5ebe3caba4ef@grantnichol.com>
References: <f76c97b6-857a-45d3-b690-5ebe3caba4ef@grantnichol.com>
MIME-Version: 1.0
X-Authenticated-Id: me@grantnichol.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=grantnichol.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HBPYHFiNNkdwqNM1w2ufKB9FSd/Kp3a/Zbi8oxeP9qo=; b=UhOSKRVC9+jMdZ+cdvfgeGlW8+
 m1V3i10mNCOLbELMqmzPd2HNBP5Z8qVge1ZMYnibyVjoX3KZDRWWeqWZ/ChnTQcS2VTcwXPzNvGq+
 Yob2mBV2CZolRDqnvxpkIaflvV3dK2qkYc5sNF7rGDp1T9hhnHBQEjn5TDEWb39AyzoOBX7WRxjRJ
 uwisjlgMT4etwVPBdaPTmEv33nJdHiJk0fS7U5jg+uWVtP41PA2Mfvm+QCx7nyHq6caj+O+9eP8Ew
 JO3CH9q/rneX9xwt/lQZSCgZqbnzuWj/HEnAQKiCknU8BytiVKNoR4CVNLt2QoTl9ldnKD+vYkKrL
 y+ZrQHOA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grantnichol.com header.i=@grantnichol.com
 header.a=rsa-sha256 header.s=x header.b=UhOSKRVC
Subject: [Buildroot] [PATCH v2 2/2] package/libopenssl: Patch for riscv32
 builds
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
Cc: Grant Nichol <me@grantnichol.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a mispelling in upstream causing builds for riscv32 to fail when
linking.

Signed-off-by: Grant Nichol <me@grantnichol.com>
---
Changes v1 -> v2:
  - Adding missing signoff in the patch file.

 ...x-mispelling-of-extension-test-macro.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch

diff --git a/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
new file mode 100644
index 0000000000..93b191a61c
--- /dev/null
+++ b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
@@ -0,0 +1,30 @@
+From 68c549df05892c16b99603b9a831c79c540f268c Mon Sep 17 00:00:00 2001
+From: Grant Nichol <me@grantnichol.com>
+Date: Fri, 22 Dec 2023 23:46:39 -0600
+Subject: [PATCH] riscv: Fix mispelling of extension test macro
+
+When refactoring the riscv extension test macros,
+RISCV_HAS_ZKND_AND_ZKNE was mispelled.
+
+Upstream: https://github.com/openssl/openssl/pull/23139
+Signed-off-by: Grant Nichol <me@grantnichol.com>
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
