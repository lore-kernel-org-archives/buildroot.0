Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5122BC7115B
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2134740BAB;
	Wed, 18 Jun 2025 18:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JndKRguJM_5; Wed, 18 Jun 2025 18:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DEA840BAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DEA840BAA;
	Wed, 18 Jun 2025 18:26:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39761D94
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC70B60B7C
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ji3u9Xj3oJtu for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.147;
 helo=fout-a4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0406960B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0406960B6B
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0406960B6B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:11 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 9EDE91380381;
 Wed, 18 Jun 2025 14:20:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 18 Jun 2025 14:20:45 -0400
X-ME-Sender: <xms:fQNTaKos4iGZQSkfQhFtqp17a7myyi4L3sxnWJFCbErQT3XmZYkuZA>
 <xme:fQNTaIrcG4JMkHNGKBXbtUPjfjfmhUCszHg34hzQOCRc7bHxuc2b7Nc7HAb-kvPfG
 Ac293mYMrX8JcC7BJk>
X-ME-Received: <xmr:fQNTaPM6mWBbokuUwtJ7uFkDKWC-m5XVk6PfvA-GxSR6FI2JxZAi2fuc6gZcCPYF-yTc7VJtuNaoIHigR_hW0u4Z5omqfeQf_eJy2CFA3lj9LJV4kUoh_veT_cmnV0lAJGUiJtubkUfOkUU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthht
 ohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehroh
 hmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehgihhulhhiohdr
 sggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpth
 htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehh
 ihesshgvnhiiihhllhgrrdhiohdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhessh
 hmihhlvgdrfhhr
X-ME-Proxy: <xmx:fQNTaJ7XGyPyJCyknvzuwe2gKNdpaqQV5mt_rurh8V_bVoc4lwF80w>
 <xmx:fQNTaJ6Gfvy4fEG7pqaGUV9e67bPPWhqHtoMXkFSbb9ZsJ-ruj3YwA>
 <xmx:fQNTaJjhX83UGEarMP-Pn5C9b6o9-Pmkdbvag2J7_-OjvnBpeH6Rbw>
 <xmx:fQNTaD4vP9EULptaySzAkMQbFI9R2I7ObvHy2LLTO1LZG8YWFummkA>
 <xmx:fQNTaHQYYAtFy0gzNYszd1EIjo9xZ2HKXu3sOiodWY5PzuVWHCbd9nmD>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:44 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:26 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-1-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3859;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=NHUD2AMzifptQNcxu5/fQ/qpS9FVTVQe6stG0X+PcuY=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5opraaEW/zy3rnxSWbBQZrXn+u3Z8dMqJL++K4+a0
 RO+KnJJRykLgxgHg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzk9XeG/3nzmLZzLSixfbzA
 20Bd+e+8E+nLlhXGOdzRqam+azVP9wUjw4YVO09btWnmysZ9iVDamLn4qdSLA09NNucZWO/zM37
 vxA8A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270845;
 x=1750357245; bh=zkgXGtX4oUVmLboeSB6XnBf/rMM7JAIfS42+x0XNaNg=; b=
 lmDrMHr65YUY9D6JiygTa8TncBdePE1iS7/MuUqrOfxwYH2On+LLgZVdTZ4QUJPK
 doVRMrMJIqg00k3ySPlPEd+ToKKM4oSGEgzNPa2BcMyCkUx0KAFtc+ShokvedNPF
 YeVxgrc3Xw463qSXUwZliNMeeNYGLiuQbyw/+oioiIP2+tEwZcw2Ri6q8D7aXWbL
 lbg2So0nhRK3ZlSxtBaPin/0dZFopNoCz6xLqt94aBc6Kfk91GgrHJbEgpnn9gQH
 UYQsYRq7l6Js6oREkn2m1r+uyUb6Y2UNEZaJG8kPOINJ6SbiCz0YuVYqHlKFdqm1
 sjFtHLHgoBofR/m3qyz5ug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270845; x=
 1750357245; bh=zkgXGtX4oUVmLboeSB6XnBf/rMM7JAIfS42+x0XNaNg=; b=l
 LU5dqWcm6slgVQDrKZWC/EnyRFDcVZdvks38psRTtEO9RRnrRDW3ldwZPXc6Xrfy
 lX6DxJcre3BiC4f0T8MI9k/0wak+ntnMFKBe3igP/zGBPPaenhYbPEk36updF5LO
 SBCfB+Elg1bpMkmiqjzinSjg1e2nc8XNGV5foVZ7D0FiSLGVKQtDjZfZ80dQiDNS
 G3VArDbPdiuYG4JPMnJO+m8tVMXCPk3olD3Y0rJmOWWNT6yv8CpojczoQI1/wrWH
 lHR3Y3+3r4azLG9ppRn7pdMyo4+x4JPozBUguWsB+Px2WySeNIsQB4sw+/V71NOs
 JV6IKEt1SrmFo7NBKvwUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=lmDrMHr6; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lLU5dqWc
Subject: [Buildroot] [PATCH v3 01/11] package/gcc: Introduce
 BR2_GCC_TARGET_SIMD option
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

Introduce BR2_GCC_TARGET_SIMD for gcc to handle --with-simd/-msimd
present at loongarch's gcc options.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
v2: Add missing toolchain wrapper code
---
 arch/Config.in                                         | 6 ++++++
 arch/arch.mk                                           | 1 +
 package/gcc/gcc.mk                                     | 4 ++++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
 toolchain/toolchain-wrapper.c                          | 3 +++
 5 files changed, 18 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 6b54c65df9cc7430e9d99e0dd9e29fef3cc527e4..ec720e74e193021ed01749945aed1457ec0789a1 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -349,6 +349,12 @@ config BR2_GCC_TARGET_FPU
 config BR2_GCC_TARGET_FLOAT_ABI
 	string
 
+# The value of this option will be passed as --with-simd=<value> when
+# building gcc (internal backend) or -simd=<value> in the toolchain
+# wrapper (external toolchain)
+config BR2_GCC_TARGET_SIMD
+	string
+
 # The value of this option will be passed as --with-mode=<value> when
 # building gcc (internal backend) or -m<value> in the toolchain
 # wrapper (external toolchain)
diff --git a/arch/arch.mk b/arch/arch.mk
index 4174d33df548b0f7bc754c89076142c41fe3f867..4a7851a9fdcebc4720415f5b0fba771bb4993ef6 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -16,6 +16,7 @@ GCC_TARGET_FP32_MODE := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 GCC_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU))
 GCC_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 GCC_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+GCC_TARGET_SIMD := $(call qstrip,$(BR2_GCC_TARGET_SIMD))
 GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 
 # Explicitly set LD's "max-page-size" instead of relying on some defaults
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 658f5a6b4fe21fb302333fcff3012e624ce241a7..ea96286c322f6aac0ad26ad633db6b73c544dac0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -251,6 +251,10 @@ ifneq ($(GCC_TARGET_FLOAT_ABI),)
 HOST_GCC_COMMON_CONF_OPTS += --with-float=$(GCC_TARGET_FLOAT_ABI)
 endif
 
+ifneq ($(GCC_TARGET_SIMD),)
+HOST_GCC_COMMON_CONF_OPTS += --with-simd=$(GCC_TARGET_SIMD)
+endif
+
 ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c08bf0a65391833de840c2f5ca112bb0b7802471..2c2afa76c06920389f10595ddbecb9e0455cecce 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -217,6 +217,10 @@ ifneq ($(GCC_TARGET_FLOAT_ABI),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(GCC_TARGET_FLOAT_ABI)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(GCC_TARGET_FLOAT_ABI)"'
 endif
+ifneq ($(GCC_TARGET_SIMD),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -msimd=$(GCC_TARGET_SIMD)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SIMD='"$(GCC_TARGET_SIMD)"'
+endif
 ifneq ($(GCC_TARGET_MODE),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m$(GCC_TARGET_MODE)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(GCC_TARGET_MODE)"'
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index e644c1e7bb906caa24ea673a865c934f9094a030..a6974ba78f8a53535c6cd6517e1af1bb5ec12431 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -74,6 +74,9 @@ static char *predef_args[] = {
 #ifdef BR_SOFTFLOAT
 	"-msoft-float",
 #endif /* BR_SOFTFLOAT */
+#ifdef BR_SIMD
+	"-msimd=" BR_SIMD,
+#endif
 #ifdef BR_MODE
 	"-m" BR_MODE,
 #endif

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
