Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2C8C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3236C40523;
	Fri, 24 May 2024 19:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-QXuYfmLVRT; Fri, 24 May 2024 19:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA2D400F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA2D400F5;
	Fri, 24 May 2024 19:36:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7341CFD2F
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B9EE401B7
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7nOsRCkatow for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.145;
 helo=fout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AF0E40441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF0E40441
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AF0E40441
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:36:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id 8E72E13800A1;
 Fri, 24 May 2024 15:36:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 May 2024 15:36:45 -0400
X-ME-Sender: <xms:TexQZlCXx2xXL6Ya-HsP6vmlt08hFZewxalKr1mM3SPSzm84HKaAmA>
 <xme:TexQZjhpo8i22RZa-drHJUS2Ekgv3CW9qUOSZpJkSgW3uZumaPxkHLpdEe0mYive-
 5IMuSSkzNQh8qlpxaw>
X-ME-Received: <xmr:TexQZgl1HMU9DeGVmTndU-_AaqktLmGcsDZ4iMoYT6QCo5c0FQrYhCU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
 ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:TexQZvxWc3Up_4ot7ASWxVP7hEPyzuOVVinB9dFEsPDbN6StjwFITQ>
 <xmx:TexQZqQ11pZ-CIHrOO5sM_8oDnZpey-rZRx4VAMgNJ6_4F2atMaq0Q>
 <xmx:TexQZibLfNl5JeyqBa_rIhvxcvqWm4BPcWWdBeRqgwEJd-LU1rhktA>
 <xmx:TexQZrQ0TGae3DXagjr3wpqkH252HC_J52M5o2cV9amWurZcitv_KQ>
 <xmx:TexQZnLXd1L4a8yDjXrNA5AqhDH7CkQ_6TQugiUwPHUEJOj2TxAb0nf->
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 15:36:44 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 24 May 2024 20:36:36 +0100
MIME-Version: 1.0
Message-Id: <20240524-loongarch64-v1-2-d24078d79cd5@flygoat.com>
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
In-Reply-To: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=dEVKDIHabvokgngIFQG3juCvbnJudDCjOHdZpiPjr+8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSAN97dS6pisy9+nWvk/olVPblVM8E4+Iy05euF+gprv
 0hHR8h2lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwETEpRkZVj7RzT/Z7LL2pn7U
 zXcXxeti1kvdtVKesnfthrJJLNeuT2P4H/mt8E6njUDTd62epcov9/yu971rekR+mkzOlzM9Vdf
 8eAE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1716579405;
 x=1716665805; bh=7S/SGOvEUWU8iYiMTqdUly9LasmYNfMDAtl33+6QnOE=; b=
 xb2hGaB5OoyU/OP4L1WApPISfO8gpBTLyvysX2qv4nZ5IZLa10B56YeElV2osOqm
 2JITw6VqPs7VtwHa1ngdz2YLUUBb2+LJTvFs9YDtihTpXc4YcSk6hqLb2tGQkeNH
 ozYKVCDpZXRI7DaCX2AJz4TP+Jfv9wmnZFjqtdw6lnifsBlaSw8Mnor0d1GwBz8r
 GrT0VOSY8Z1XTT6UE/LvNyFIQ0RxZ21gI+mDfLHA/My1dnz9RMpQo4WqC8W/fRWj
 u8owUmgv87CPm6q+cuzbk8bSjSF/eb/HWZILwweDfD89H8UpqW15CueyrgEvp8pJ
 HrK5TXjzByUYWpi6pPgo7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716579405; x=
 1716665805; bh=7S/SGOvEUWU8iYiMTqdUly9LasmYNfMDAtl33+6QnOE=; b=E
 DMAHCNLyQg6Ungg4Dum3uMjSi62WE1ljJiW3lyU3TcZkxAuuw/QbvoNdzylwiD71
 84f0VZjaE2RHUwadbDUmtSi6V4YyNJ/NbXxXBNPG3F2s5XNFIuJ55mM1S+uioiH8
 4FOZbB7zZsPj1t0+8tmLprDoVf9YCqoKg3ENdJnefg/Sm/leQ3ekDt9Jjd6nyGAG
 KN/6+uic+/1CHijIkLNxH/o5ZBwBHZj21whT4GXdxZPz/bfJmHzxsS1U7wXLPhJ0
 xpA3Clg1UyJ1aLYIQgY08TkKqjJH/SMOas0meDWNxPmVNKbK3SOQG+da53H7aQwC
 exL3VJR1tyYPXZJOeEHJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=xb2hGaB5; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=EDMAHCNL
Subject: [Buildroot] [PATCH RESEND 2/7] package/gcc: Introduce
 BR2_GCC_TARGET_SIMD option
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce BR2_GCC_TARGET_SIMD for gcc to handle --with-simd/-msimd
present at loongarch's gcc options.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/Config.in                                         | 6 ++++++
 arch/arch.mk                                           | 1 +
 package/gcc/gcc.mk                                     | 4 ++++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
 4 files changed, 15 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index f39c33ef7fff..cc902446bfd9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -350,6 +350,12 @@ config BR2_GCC_TARGET_FPU
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
index 4174d33df548..4a7851a9fdce 100644
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
index 672f9472a947..394559479ce1 100644
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
index c08bf0a65391..2c2afa76c069 100644
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

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
