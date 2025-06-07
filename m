Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194EFC677C4
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC3740A52;
	Sat,  7 Jun 2025 18:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxtvMR2E1_a8; Sat,  7 Jun 2025 18:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0501740B4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0501740B4F;
	Sat,  7 Jun 2025 18:21:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E9C6C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C23540741
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWJHEMmPgQlE for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.158;
 helo=fhigh-b7-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE5EB40986
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5EB40986
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE5EB40986
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:07 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D514725400F2;
 Sat,  7 Jun 2025 14:12:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sat, 07 Jun 2025 14:12:40 -0400
X-ME-Sender: <xms:F4FEaDbF_dGBWCbFNSXzOpc3I07YfXq3MubonkldxImzZZTaurLptQ>
 <xme:F4FEaCaY-VFpqqDeE2qEisLPTGeJIfsaNkYsbWIzkNRwJzhyMIYhRX7VxI6cMEr5l
 nSeK1pbLxttPnkN8OY>
X-ME-Received: <xmr:F4FEaF9EYFQxOFcKmu0mF8L479eEOdpMCUa9Uorl6eyMzM5kzN4WlMXalF2g7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeikeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihes
 shgvnhiiihhllhgrrdhiohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnih
 essghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihes
 sggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrih
 hnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothes
 sghuihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:F4FEaJri4RicLvFzT6cq2H3CbNwF9kLAYIWhcU8wXwOpE6or_XJzXA>
 <xmx:F4FEaOqb_zc5Tcv1GLxpk-6vfpMT4Ua8C2FU68YJVoAANlgc2DSB6g>
 <xmx:F4FEaPQ6iKZALVA_DaGS9ejmZ-y6PgVJGgygWWcwul1EhpnXOtKgnQ>
 <xmx:F4FEaGrjhbCpgdomxAse3DWZ5lLjHGDNYYGc-CIZe5OG6FzRATwRZA>
 <xmx:F4FEaB3ahWb3VvL0DUsKWLIEk6Ld8Iqf2z3wmRs3fohwSqaA2DXFCHEr>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:38 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:35 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-1-90bc4fda9080@flygoat.com>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
In-Reply-To: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319959;
 x=1749406359; bh=d8h5RVnR81qL4p465ddcmoQCPUpTCi+PmqjviLYhyqQ=; b=
 hzF0hgR8aTM3orNvwQ425LSkHl31DIBfTvZn5Xjz0ReLqljV8pErEP/zvHKKwqe8
 aj94lw1AZJwxG2a/E9Y9gKW2DfoDxE37ARo9oPusgsBBRKPX7K1qBUcCShtAkcGV
 fn9S3Ho78IC5xnCHPjtgWyolgqT884LCqZYg9XmR6moNeOGPHdZSC2Z7x9skrYI+
 sEp564tGi4Rrw/r/8iZdoMHEeoEmXie99Wpyaz9Q+OsRGZfTW7N0PHdxdap7RjhF
 4q7BcDbJ+QiAoJGYpwWA+SYqAbSJnu2rmg3N4aBgvWn0uo5ai932dBXtYThgjuJW
 3RoBzKB2qR1I4P+xPfI/7g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319959; x=
 1749406359; bh=d8h5RVnR81qL4p465ddcmoQCPUpTCi+PmqjviLYhyqQ=; b=Y
 3+wLRASUdQaId2S432Uk1WtgtGEWh0i+oOrFrdaZB0MP+baKAJs0Mve6zEnjB23r
 GKofxB/Fzyw/mJjJj0zntxt+dRwWs0bF9vaX6mOr9B2F8KFLWnqdtMQrVlkvu0/e
 LhNfFa84WgisTAtQHjh/uSITHzjC3bXn+d9gVS7J+gJ3ZKhCGgcV74ahoCekVcj2
 IAjQGZ12L3w8t8+kPWgqhIlnSDSszjI5m0UPBK/gG7nWS8cOjdwlrk+23v3wwe+F
 tJQpm1JIh5hT777g3dF6HGqUcOWPxqHCBrSANXhM6GroQg0pXQ3SyyqfwnkVBMUx
 w2EjGMzDWRL+ph42AKXRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=hzF0hgR8; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Y3+wLRAS
Subject: [Buildroot] [PATCH v2 1/9] package/gcc: Introduce
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
