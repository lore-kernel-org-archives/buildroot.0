Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA879C25B79
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 633AF41B80;
	Fri, 24 May 2024 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdfmt9Wwchca; Fri, 24 May 2024 19:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF3F9409A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF3F9409A7;
	Fri, 24 May 2024 19:37:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95A2D1CFD34
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8159D400F5
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AduBwHiqmELp for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.145;
 helo=fout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA20340447
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA20340447
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA20340447
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:36:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id D915313800A6;
 Fri, 24 May 2024 15:36:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 24 May 2024 15:36:49 -0400
X-ME-Sender: <xms:UexQZrSdsXAa46KMDYxdTa25MDpRANz7UQsJ2us4dhE8Rj-uN-qUUA>
 <xme:UexQZsz5NVGp1Dj5Okv-vSDaWCKFJaKG2quwVEqy5mvwEP_UhUACT0iBo0eHrSxCJ
 wql2uF_8VRRw8dBmDY>
X-ME-Received: <xmr:UexQZg382DnidBBFPmY_yTfgatA3Ow2ZMpFyMDu1X1T6KjV-gU7NARA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgudefiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
 ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:UexQZrBrtno9lyOGsAbOTXHPpM4k9jymIMmHXtGwyiLyFZz_1uvhCg>
 <xmx:UexQZki-70ZpWoW1WPfwwtDHZypNRHRssAVJT9_AWyax-xVRe5zXVQ>
 <xmx:UexQZvpQT_RW9wKOG7zT9SlsoGeGCLj7GsdMUWUG_KRmbsvFesZ3Fg>
 <xmx:UexQZvinmy1ecajv7H2R0iczBqW3TQg30Owdbe0tWWsiMvYNuaOz9A>
 <xmx:UexQZuYNgby2LcmJ2o8DrSyum83A43ocAnX0CR3trJkkqxFV4hOJSPYZ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 15:36:48 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 24 May 2024 20:36:40 +0100
MIME-Version: 1.0
Message-Id: <20240524-loongarch64-v1-6-d24078d79cd5@flygoat.com>
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
In-Reply-To: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=3j6OWBVIbMmvfpgLPrx7kKnZ91JBVWVTStaUuhwFnDU=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSAN97X98Sfnp8cdqbA1rylKshzSZ3Ppesf1ATn6OXwd
 fLe3enVUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPxVGH4HyOxptDzXq3CI/6O
 B3l2znyHH2c+eK3JO3/vVIb63zd1JjP8lTU2OvIwfILHfBYbUxMtzekW0zhNi5q2VZcZTktg2T+
 HAwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1716579409;
 x=1716665809; bh=fSY05B9B62hyED0WPJS+dJLxGWor7F0LEkylhOnE4gw=; b=
 rHtm/iRv3YXBuwy5n34v/iw4S8h7aaZ1vvaVrSFfws32rM7l3+X9zznX6FtVkwdP
 pZoqyfRvTGx7prn+1vgmkdu0KH8fwHqeKgAi/f5lfdMiLPGBZsDHGvCL0ORwKPOc
 afWpWt1CsNnUsM8mYArV1OG7R+ea2PlL+Ea8Wob6kNxmw64Lm26eIRGkxE4YfsoK
 Cgi4EvSZxWf527IpTSGwePCXLDdoAujls5PlN3QF2oW/YuYCYmkIPV0V0CTRj1db
 I3NkCzdu6lQUC3bAQ0UIwABe4WVkyxh+2219WtgIk7dON8s2QbKL9lKzPvPjxWRX
 ALzdR42TTKUzA5ER3jQRPQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716579409; x=
 1716665809; bh=fSY05B9B62hyED0WPJS+dJLxGWor7F0LEkylhOnE4gw=; b=k
 vMMYv9arGjOcmDc+8yR1p7svDDkJ+JqrETqA4+rYBf+PtXGNnCBKf1gPD7RgtJ6q
 Z/DCW0c8dnh9d38CYCjvrGnoM2cQLkI4YNvjbkJE+4DLp3xKDkbZP8Ih9vaAkG6O
 E2Lx9zv90BX4kci/pJ96yXuOFbn1g3EZ8smMUFWRMT2O2k+eqsQE1Yh5Q5r69Wkj
 Z+bKwwedPn0+HdTurIdgNwdC9yEK9B9bzN48WWbbEHQ2ZU4g1zFCcLTfNNhslbXM
 QAqDJ+1A4E1DAfq+zr3w/3mlM0+H3Tr82T1SlUNq6QtqhBvfCu04EIB2NWG4Rd26
 eB+mEqDqokWMvRdc8AvFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=rHtm/iRv; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kvMMYv9a
Subject: [Buildroot] [PATCH RESEND 6/7] boot/grub2: Introduce
 loongarch64-efi target
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

loongarch64-efi target presents in GRUB can be utilised
by any EFI compatible LoongArch64 machine to boot kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 boot/grub2/Config.in | 10 ++++++++++
 boot/grub2/grub2.mk  |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7c235e96f71d..8bf193d4a86c 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -5,6 +5,7 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_aarch64
 	default y if BR2_RISCV_64
+	default y if BR2_loongarch64
 	depends on BR2_USE_MMU
 
 config BR2_TARGET_GRUB2
@@ -112,6 +113,15 @@ config BR2_TARGET_GRUB2_RISCV64_EFI
 	  64bit RISC-V platform and you want to boot Grub 2 as an EFI
 	  application.
 
+config BR2_TARGET_GRUB2_LOONGARCH64_EFI
+	bool "loongarch64-efi"
+	depends on BR2_loongarch64
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
+	help
+	  Select this option if the platform you're targetting is a
+	  64bit LoongArch platform and you want to boot Grub 2 as an EFI
+	  application.
+
 if BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
 comment "Options for the x86 legacy BIOS or ARM U-Boot support"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 6d0d71c47d08..347915431fd0 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -102,6 +102,15 @@ GRUB2_BUILTIN_CONFIG_riscv64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
 GRUB2_BUILTIN_MODULES_riscv64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
 GRUB2_TUPLES-$(BR2_TARGET_GRUB2_RISCV64_EFI) += riscv64-efi
 
+GRUB2_IMAGE_loongarch64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootloongarch64.efi
+GRUB2_CFG_loongarch64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_loongarch64-efi = /EFI/BOOT
+GRUB2_TARGET_loongarch64-efi = loongarch64
+GRUB2_PLATFORM_loongarch64-efi = efi
+GRUB2_BUILTIN_CONFIG_loongarch64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_loongarch64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_LOONGARCH64_EFI) += loongarch64-efi
+
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
 # TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
