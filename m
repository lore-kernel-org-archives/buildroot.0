Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCE0C83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 10:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75CB811A1;
	Thu, 10 Jul 2025 10:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2u-miZ-7j9e; Thu, 10 Jul 2025 10:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04455811C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04455811C3;
	Thu, 10 Jul 2025 10:42:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F27114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF719811C8
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XTCjVfGzXbM for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 10:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.157;
 helo=fhigh-b6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECE4F811A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE4F811A1
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECE4F811A1
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:05 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 12C127A0182;
 Thu, 10 Jul 2025 06:42:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 10 Jul 2025 06:42:05 -0400
X-ME-Sender: <xms:_JhvaCDJn6NpRLBe6B3BrnSfK2mECwHU5-BX6fovSnnxNZoSUIrD0Q>
 <xme:_JhvaGIV0D6ZaCT2JnX1FGJm1EbEvVocUnsOrusFqjbI_bzbcN5WHCvu5P65JrwFe
 RfLUCCezxry5CEem58>
X-ME-Received: <xmr:_JhvaFke-RU9y00hU-xOZ2KLe4NhkxkYG-hD146RyaPkSn0hxYBumQwK1RbNdXvRv2BMkD7ZH4pzG_xrAXEAxqeQfLgDHXXJFFHNeW9zLN8PdwOQ0TdkyhwSyvL0hoI5Jwqrruk9POOnlvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjug
 hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeetfffhtedutdegteefhfffhfeujeetvedutdevhfejffevheffveef
 jedttdfgleenucffohhmrghinhepghhithhhuhgsrdhiohdpkhgvrhhnvghlrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
 uhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepfedpmhhoug
 gvpehsmhhtphhouhhtpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthht
 ohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegsuh
 hilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-ME-Proxy: <xmx:_JhvaEHq34htUXFO5PtZdm_gXWz4EKlzyNCb-OBgEA4x-se46IW64Q>
 <xmx:_JhvaFGng6512m0YfaYhnZyT8-fzIq5wx4wcQBg9B4aFIcy05MS0ew>
 <xmx:_JhvaBN_bn0FMRdqNFudBiNt6mjFuNw9qTqAV2DIQZBuNoAF7PncKA>
 <xmx:_JhvaEGuTFjgWCAdazPhHXvmkJlz7wL7P-AOk51LvH4QoQqyMuxmjA>
 <xmx:_JhvaPm95QP9F8JYB-ROB8x49zKtqXNJ6nmMN4lUKYxZtzk2ENLqwNOB>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 06:42:03 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 10 Jul 2025 11:41:56 +0100
MIME-Version: 1.0
Message-Id: <20250710-loongarch-fabi-v2-1-72fcf95c8b65@flygoat.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
In-Reply-To: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=rAas07Y2b5GyzeQ18iEF+MLpYbwRZCClDSIwavUsRdg=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoz8GT+nW8gaVV8+HLEoStDg0m37p2fLumVlRU02XOJ3i
 kl2OZbaUcrCIMbBICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABNZncvwP4dRX513Fm/IpJO8
 wrOnT9y2YME9wxP7ZOdHnmq0n/Vuvg7D/2iFOemGSdJRUt1rpnurGXwrbg21eX5DxmROhmM9j90
 2DgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1752144124;
 x=1752230524; bh=SiuZuw/oKq9oH0uxPaNPBSYqAjZon8+jww7B7GvwITI=; b=
 EOKplA/AaBBFs6VrBpkRD2LX69F5ELwiGesfuQi/SKVZabrtM1fwCnqCX4/sPoel
 IJ95HBbd7iQtvOQkhL1qO6ZiY2kmU4e+IhZ6YhYA4aPn7WRFC7+je220U92MFM/y
 OlVijHtj7ajp8IWe0MWtHuUWre6vlGMTnYOBuuBF4AL1Kql2pcF48JeeGXmBbVhR
 ri7K+hmFsg3qwsbioLSjqAn5Td0A8OhaJW9eFLJA4BI9MYqyh7r5CGExcu929EEl
 RMoK9FOVqaaDRSEnCvp7iEHeOhvEu9cXT//PEOc9bdoulDAWspj4am4dwMUOoUor
 VycSO7dJzj67d16hywsdug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752144124; x=
 1752230524; bh=SiuZuw/oKq9oH0uxPaNPBSYqAjZon8+jww7B7GvwITI=; b=O
 XLPF1gU/ekuyyDjxGPdB1GQQvH19pZVuhxAeXJicUHK1Vx3CKLaQs+WEhOXKgQ2z
 Jrr/ozF0J+aMUNbhVwLhPUzt1d+RYmBkjONdkbq/OwwwAxerb7DnrrDDshIhsZQX
 upp8V48RDSTFw9+xXKuug1T+sZXy/+DdXtgDVAJ11nwb5aj/80ne430ixhjgDt34
 INn7OGJa/xmC/zsDkboQtFoQyhH8Pg5M5lPLO3wreOY+zIOFW8KmE8yfWaRdhHX3
 59mzj5ZQHStoUZGYLyIeYTVGMoZKrY+b2+eFaWpYIOiR74zxqFiYtzTlaRlpqdSf
 +nddqgKvqGYL7b7iCGhgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=EOKplA/A; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=OXLPF1gU
Subject: [Buildroot] [PATCH v2 1/3] arch/loongarch: Fix toolchain triple ABI
 suffix
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

LoongArch GCC infers ABI from triple suffix, thus it's necesessary
to set up proper triple ABI suffixes for different ABI types.

Adjust ABI suffix as per Table 10. List of possible <fabi-suffix>
in "LoongArch Toolchain Conventions Version 1.00".

Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-toolchain-conventions-EN.html
Link: https://lore.kernel.org/all/20250706105859.292908-1-ju.o@free.fr/
Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 package/Makefile.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 829636900ba950f4e2af4e070b7f979646600bcc..5ebb5f9ba8abd55cf9519cf3eb2a9a774ef9e271 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -83,6 +83,14 @@ ABI := $(ABI)hf
 endif
 endif
 
+# LoongArch Float ABI suffixes
+ifeq ($(BR2_LOONGARCH_ABI_LP64F),y)
+ABI = f32
+endif
+ifeq ($(BR2_LOONGARCH_ABI_LP64S),y)
+ABI = sf
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 ABI = spe

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
