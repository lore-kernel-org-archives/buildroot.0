Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E601C83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 10:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C04C83B74;
	Thu, 10 Jul 2025 10:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SoEr-R_1bLr; Thu, 10 Jul 2025 10:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E33B83B1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E33B83B1A;
	Thu, 10 Jul 2025 10:42:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E16D212E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE74961193
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U39R7Nn8iXjn for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 10:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.157;
 helo=fhigh-b6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63C1360761
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C1360761
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63C1360761
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:07 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 91CDE7A01CF;
 Thu, 10 Jul 2025 06:42:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 10 Jul 2025 06:42:06 -0400
X-ME-Sender: <xms:_phvaFrsUjfOqixfBSaDbN2BqeQ3o1LRWkGAPYckYdlERNpwEc36bw>
 <xme:_phvaBQxNNlhTznAiNYDcsZJDhunLKlvzzjyajLAxKLS0azU-dUtOpm9-BLV0M0-B
 _5IDGIWkbrlMFbkWKI>
X-ME-Received: <xmr:_phvaCPVkqf9Meju5PH_GnaxgbzzUB0MDQrOASe_bOVaUTgut93x1ETynv83IuNM6IufotJDPfOQVu2B5vzEV16cXlBCyN69GJOj8C1LQCEXsKjZvdaksiV_Os3JYrKdJMkHMiaw_K-ecY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertd
 ertdejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfe
 elffekgedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepjhhirgiguhhnrdihrghngh
 esfhhlhihgohgrthdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgu
 rhhoohhtrdhorhhg
X-ME-Proxy: <xmx:_phvaEM6xE_AFXlb5zwUDQkFFHY_hLel4NUZ5xVIQJ1e1CfPlX6jyg>
 <xmx:_phvaCuEc_tLEgxDeGJZe0PwGyv01Ys4I7a1kSxrb7Y7MLu6CUeLiA>
 <xmx:_phvaOVj82R8GpozsasFb6Sj-cUlBAioSZm6pmHY90W4U1rl1RYXBw>
 <xmx:_phvaKvHDl8EetMBoBy5J2gfixJ2LvjPfpodoQMwjoQpXyuE2TpMXg>
 <xmx:_phvaItEgbfvtoWne4GYgs-ddoksQL8gSO8lkKipVQtunZGhZ7C0AYwE>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 06:42:05 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 10 Jul 2025 11:41:57 +0100
MIME-Version: 1.0
Message-Id: <20250710-loongarch-fabi-v2-2-72fcf95c8b65@flygoat.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
In-Reply-To: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=nOm4fEKFxWETiP8j9W39FBZs+OKaHFP0iclY757s4N8=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoz8Gb/a/pScL34x9U2Y/Nwzx89otOS8K/r65dsCsaLO1
 h0CiwLXdJSyMIhxMMiKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEllUw/DNdsnJGt+n2LbOF
 lvne4rtR3dTssbmL7WnnJ5vtERvk6hgY/go//6Pw34ixecYEnwU8O9RjF+Qq+ptyf2pemn3keF/
 jJ2YA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1752144126;
 x=1752230526; bh=jcf4iW1Enxi1Jqw3OWs0RTZWvf7h4JgVCvoHvW1gXrM=; b=
 DS4ohjiJ2F1gwUerI9olV2PEwMJsZCNXEqHMRhv9wznNQCgKm4jppZaZlQkKpJIN
 Rts/jG/I9SBJ52iNn5wCj8+sXzPsIEqgQ7WAl32RIxH8oQ+vWxdaNlrUcRGDnOA2
 CiRdh9IY2Ju977u7gYcJrnlTUl+O5KE+HwnU0ZIVAGJQEb/+KYoIg8mJNkBvJqHW
 D/tkO3g17VVPNhTakOwptKLHSadseUW0fVx94dtCi1JwyVyXUVO1NWsdK5d3H9ff
 +mQCjS521JBEF52yf1MgCYNx9ECnLEgfJ/ESRDiqe7rKSa/WO64z6gCGJZZUTNKz
 RY6v6Smoc/UF/HW9AHPaTA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752144126; x=
 1752230526; bh=jcf4iW1Enxi1Jqw3OWs0RTZWvf7h4JgVCvoHvW1gXrM=; b=f
 R2Yj+HreqM+9XVGI4E73BWazD7GKMbhiEySb5B6H/9tYpq4kEvn/6wYbXikmA+dU
 wApT6Tft9CFTi8/yXWumoyV39fTITtUVoFTTHIk5VimZspQvN0OQtpC1QgkmUzXH
 KYjGa9MQUfsg+zr0EVo8VQnIIMUOS9HzYK5DwCaKjYWjd7fenaUw9BkQnc4p8bCB
 oXVx2o49pHh2p5hFLhwyPeM6bN+GgmBdYH8eZNbusaLdY6WXq+r3mW7LcuYP2TA/
 drTBZAOou36NATMXfPZ5L2JhYiGeFdUUhWF6aVP0anQkUHdOlJl7Mnu8DwTi/jpF
 8bkW1Icxr8qPvXpREAd8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=DS4ohjiJ; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fR2Yj+Hr
Subject: [Buildroot] [PATCH v2 2/3] arch/loongarch: Mark lp64f and lp64s as
 broken
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

Toolchain failed to bootstrap with LP64F and LP64S toolchain.

Mark it as broken at the moment to allow time for investigation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/Config.in.loongarch | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
index 1f302364b13b10183638da230a4735a7d7b7f46e..c11d8dc79f0e76526948d2befbfae722fbc1b0ed 100644
--- a/arch/Config.in.loongarch
+++ b/arch/Config.in.loongarch
@@ -87,11 +87,15 @@ config BR2_LOONGARCH_ABI_LP64D
 config BR2_LOONGARCH_ABI_LP64F
 	bool "lp64f"
 	depends on BR2_ARCH_IS_64
+	# Failed to build host GCC initial, pending investigation
+	depends on BR2_BROKEN
 	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
 
 config BR2_LOONGARCH_ABI_LP64S
 	bool "lp64s"
 	depends on BR2_ARCH_IS_64
+	# GCC can't find the right library path, pending investigation
+	depends on BR2_BROKEN
 endchoice
 
 config BR2_ARCH

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
