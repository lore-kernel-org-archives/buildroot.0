Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81076C5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4909260E46;
	Sat,  7 Jun 2025 18:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6WLaYk_10Ou; Sat,  7 Jun 2025 18:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C1760E36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C1760E36;
	Sat,  7 Jun 2025 18:21:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB861F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DCAF40986
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVIZJKqZLWkZ for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.158;
 helo=fhigh-b7-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9D8B407D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D8B407D2
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9D8B407D2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:07 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id ECC462540119;
 Sat,  7 Jun 2025 14:12:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sat, 07 Jun 2025 14:12:51 -0400
X-ME-Sender: <xms:IoFEaC5aCIkaTvuBngKkatSSq02lSFwWbno0wAmxI-z5MSgvpF1t2g>
 <xme:IoFEaL7V8ScWa9cx1ZXaciqPzKN15A_0Vgicmzv3Vk3Wk_vLvo3RU42s_30p2wRc4
 rKkTJTntRBr1wmQm2Y>
X-ME-Received: <xmr:IoFEaBcOiQ5bdebpbdsLqFphj5F0Ems2AGt39o2_4wboqk16JAx-jTKjQDUjTg>
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
X-ME-Proxy: <xmx:IoFEaPIVG4f721QnTpV545UPdkCb9WtNuRzeyZHZ-U3YNBj8Z9iEaw>
 <xmx:IoFEaGKImy8OxQg8OEBdHQZ5UxUyY7xT7DII14RLCoYjV3d0XT994Q>
 <xmx:IoFEaAy6_zgmu-wyG26k0sXnSMLrhpzjHYk5TZ4_VkX0mLmzDPav-A>
 <xmx:IoFEaKKQtmOW9jARW1k75cdrsv9UHavjtV16oBtvg53b9RmegmgngA>
 <xmx:IoFEaFV3ptOQSdt_9YI2ivb85p15XFEO_7paYTd9pNyNNatE18KyzBLZ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:49 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:42 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-8-90bc4fda9080@flygoat.com>
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
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319970;
 x=1749406370; bh=xd2uOSaPA+/oBu2TdKBIQ3FPxMioLxse6wtMAMAkW4s=; b=
 Y+/s3TIPWr3eDmbKVXIFIRrqTrS3HVB+1njEWw0oIEo8cmE7L0eYGZg3aaJlCWzi
 O455iCpFc3QqQU9d8/sx6dnfNs/4ZdXTKcaVdilp8Fqx2rTl7dPj2LD69rfrCjym
 JvrzabkUX0kHNWnn5tnFKPG5lzvQXZwKfRMV5S8DsnNMWXympLxYhJIlq1WG5D7t
 5ETCpunUCev1Z9bxQ31RoomS3zEkzCi7iEx2Eeqzxh3us/iuDk5gfvyXmTZ77NEn
 VM5KirRuVkqxs5VFXEBX0DYxGuqrBHmSl/50pjvQ4MCVjojxe67Prqe4D7bSPag8
 OWyh7ttK1vRqWpJlvFt1FA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319970; x=
 1749406370; bh=xd2uOSaPA+/oBu2TdKBIQ3FPxMioLxse6wtMAMAkW4s=; b=E
 qp9KcWV0VCOkmpb/vAgzkgZ87izF2oRZIPHAHbsR/MPDyToFv1P2VQHp4b0y39OA
 zU2DD1wB2k1S56Y4LioOIS67yDR4JqhuvZvwXYqv+kv8c0MbfmHpqY1xrlb4+Ibx
 r/ATbsZlBlVrUvBmaBD/BAOyip38B2iyS7tRdL8oZltLx7Qeugyov77HjbJ4VC2H
 puznBCcTgSRTfWfPGUEl8DPPPsG0ntfqx08qceyPGnMoER1jXSmCOT4HV9cEpsTH
 mtR69c/zne9efUBHKq/g+SFxKas71RDdsWUcc/eh3IW7FA5uj2AKfvUGQO8r254d
 KAJW4fKfL9Izrh+fI8Crg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=Y+/s3TIP; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Eqp9KcWV
Subject: [Buildroot] [PATCH v2 8/9] boot/edk2: Add LoongArch64 OVMF support
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

LoongArch64 OVMF target is introduced to EDK2 in edk2-202408.

Enable architecture support here.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 boot/edk2/Config.in | 14 +++++++++++++-
 boot/edk2/edk2.mk   |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 4e6e7d122cb550cbf57ce8fde31779e2d2cbc9a9..734826a8be722c1c45ab157b43fee60ebb4a30a0 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_EDK2_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 
@@ -21,6 +22,8 @@ if BR2_TARGET_EDK2
 choice
 	prompt "Platform"
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
+	default BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64 if \
+		BR2_loongarch64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV if BR2_RISCV_64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
 	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
@@ -31,7 +34,15 @@ config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	help
 	  Platform configuration for a generic i386 target.
 	  This platform will boot from flash address 0x0.
-	  It should therefore be used as the first bootloader.
+
+config BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
+	bool "LoongArch64"
+	depends on BR2_loongarch64
+	help
+	  Platform configuration for LoongArch QEMU targeting the
+	  Virt machine. This platform will only boot from flash
+	  address 0x1c000000. It should therefore be used as the first
+	  bootloader.
 
 config BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV
 	bool "RISC-V"
@@ -139,6 +150,7 @@ config BR2_TARGET_EDK2_FD_NAME
 	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
+	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
 	default "BL33_AP_UEFI" if BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
 	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
 	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index bc4049b2def3e75a1e95ba85696de77d58335a3e..4540a9bdea88e682dedd02ab43937127e3e464e7 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -142,6 +142,12 @@ EDK2_PACKAGE_NAME = OvmfPkg/RiscVVirt
 EDK2_PLATFORM_NAME = RiscVVirtQemu
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
 
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64),y)
+EDK2_ARCH = LOONGARCH64
+EDK2_PACKAGE_NAME = OvmfPkg/LoongArchVirt
+EDK2_PLATFORM_NAME = LoongArchVirtQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+
 endif
 
 EDK2_BASETOOLS_OPTS = \

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
