Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AA0C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E4AC404D3;
	Fri, 24 May 2024 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ee5-mePJegzu; Fri, 24 May 2024 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA6F4048B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA6F4048B;
	Fri, 24 May 2024 19:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6911B1CFD2F
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62C60408D0
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoSKJJU_tKfN for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.159;
 helo=fhigh8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8476B408FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8476B408FD
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8476B408FD
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:36:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id B66E3114014A;
 Fri, 24 May 2024 15:36:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 May 2024 15:36:47 -0400
X-ME-Sender: <xms:T-xQZk-csKvBout4UPT-gc4Si9b0pKOMYIsGrPEb7HD8hhkXfKLVvg>
 <xme:T-xQZsuja6k_QATvA6FXwmCV3wexKAIao6GSm1IvaU573aCQtCJO0j0sRt1kIb-bs
 bkhHL6K4zfPl8vKATM>
X-ME-Received: <xmr:T-xQZqB3gdi03evAwRqILfb_c0Y0QaHq3r75SmDowr-GjrSUyqpKUxc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
 ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:T-xQZkcb_cz8QJ0zwF6PncdOzksucOeuWm9t0BKAHDVxDVE2-_RSVA>
 <xmx:T-xQZpMr_qGjD9gqA0ebLgEKm2qrW29B_WJs75tBAlmSx7Z5Pp_WVQ>
 <xmx:T-xQZuk7yXrKtc24W0G2kzoXm3-ck707wxCYB0U4-b93L06zOTQ1cQ>
 <xmx:T-xQZrtp684m_hQQ8BcOCe-bCCYX9KenankEVigWm9Krl-mZwBkE7w>
 <xmx:T-xQZs1Zu1sVzac_mGk2OwpV1buw3ZkJFT0Ymaiy_3CRmfnDpI64V7TS>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 15:36:46 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 24 May 2024 20:36:38 +0100
MIME-Version: 1.0
Message-Id: <20240524-loongarch64-v1-4-d24078d79cd5@flygoat.com>
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
In-Reply-To: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2424;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=iWQ5rpnrHtVTcpJyGqOQjqAkacjKPu/PTL4+VMb7Xbg=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSAN97FVZxbahsSH4oViZh8PB20sjHVpeC6s9YCAf/j2
 6ol7RI7SlkYxLgYZMUUWUIElPo2NF5ccP1B1h+YOaxMIEMYuDgFYCLbvRn+h1+evvOSffmXB9k3
 c2fcsS3Wn+HsZjjvQrKKilni1NTuAEaG998f3p7lG6TE2jv1nZGIwNx5dx6FdEbfubvohsicuWt
 +MQMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1716579407;
 x=1716665807; bh=Xgr/1OzmP6tsZWx42Yd4mRoGJpT+ml9xXdUM9P+GqzU=; b=
 wLWktxtoW5MYJcEx56LAyuiTXQsIjYYbMtKwlczXCkwE2DQ+GiB44v+wtg0yA27n
 lsWddAq4aG/TbeWh1Wza8hJkBGYoNidnLvR2cNFG/TDAQaGtAUSkL84Sq+PElBa/
 Y/5OC9wo3m7nu6iA+9VAth6/2bpxwQGGcS+QHH5v0oiTcuNyqigvkV9nU1UwWY4x
 OkESo/a0JKT9KuZexfe4X9hJKXeFnLMmoKmhMzkJKdhdfeLIqPSkIpznuqjNhORg
 t+nwaxouquN05+5W+wM08ONHCMvkNl/U+hAbk3+rNWHyjQNNuawEbu+tpUNscG1d
 XNJzjBj6+rc/02Koc5WveQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716579407; x=
 1716665807; bh=Xgr/1OzmP6tsZWx42Yd4mRoGJpT+ml9xXdUM9P+GqzU=; b=H
 X714hT0doHigqIsWWHftpw9zCxg6wu+hKvCxGz73BSAUZeYd44dnWt3A/yGdEWwz
 zh2FhEJ+HTcXfhIghWFtcfYuoTPtXYsv0bkqHa6FZ77V31ddi9bBTOQPGyniug/5
 n6r5LNgFXCfYa07THM3TEygKsUt3+W9c9mFQ/0b+xj00LsuTur0zJtRH+7oD646p
 x2Rc0QoAp97AiUaS2O16b3Hcdf4si+VjJTro9ZwSpVH9Lk5e+0A5Hjhqi0foGJ+d
 apUcxlkVJtqs2Jf9G2KI9SyaVpcqz7RHang+G5rlc1f1K6/tKgpluHkW2E5FFN8Z
 pmuepWdxWMQ0o0svlzpbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=wLWktxto; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HX714hT0
Subject: [Buildroot] [PATCH RESEND 4/7] package/{glibc,
 musl}: Enable LoongArch64 support
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

Both musl and glibc have proper LoongArch support.
They all require kernel header from at least 5.19 to build.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 package/glibc/Config.in                 | 2 ++
 package/musl/Config.in                  | 1 +
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 81c64083f473..484ea394a2f2 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
@@ -34,6 +35,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	# toolchain/toolchain-buildroot/Config.in
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19 || !BR2_loongarch64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
diff --git a/package/musl/Config.in b/package/musl/Config.in
index a6e2af054c35..70475326f5b2 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_microblaze
 	default y if BR2_mips
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0173f40d9768..0bccdc817cc9 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,6 +48,10 @@ comment "glibc needs a toolchain w/ kernel headers >= 3.2"
 	depends on BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
+comment "glibc on LoongArch64 needs a toolchain w/ headers >= 5.19"
+	depends on BR2_loongarch64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
 # glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
 comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
 	depends on BR2_powerpc64le

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
