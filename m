Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC083C7115D
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF51060AF2;
	Wed, 18 Jun 2025 18:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ee38m8jGnZvB; Wed, 18 Jun 2025 18:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B9960BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B9960BA8;
	Wed, 18 Jun 2025 18:26:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE47E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7BAA60B6B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HitnM2-xyryD for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFD9660AF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFD9660AF2
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFD9660AF2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:09 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id DF6B711401B4;
 Wed, 18 Jun 2025 14:20:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 14:20:46 -0400
X-ME-Sender: <xms:fgNTaJsU6HLBUH7cELxSYdSV_-8l7GBnj6891PD5OXWRbzAoi8Wa5g>
 <xme:fgNTaCckLiAqb0R0fs7SRwzhaWry5GBTtYROFM38oaPNetc0FmMUFvODBTqVDkJc0
 oYwrTaPhi47wfikkmE>
X-ME-Received: <xmr:fgNTaMzGdEUcMrDbVRfo6t16-8VMOv6_Llkko6kX7V_YYTZEAP_JHjUPy3LxFvh8n66ANkTj-3snAHDsqevaqkNUbfYPvwLSwzvdm5G7tK80qIesxzNtmEWdRG52H9-rMLg_S9jeD_7TZ3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgeeljefgtdekjeefhffhueethfeu
 udeuveeiiedvffejuddttedvteelheegheeinecuffhomhgrihhnpeifihhkihhpvgguih
 grrdhorhhgpdhlohhonhhgshhonhdrtghnnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
 homhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
 thhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoh
 epsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhm
 rghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsg
 gvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthht
 ohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehhih
 esshgvnhiiihhllhgrrdhioh
X-ME-Proxy: <xmx:fgNTaANZR-6GVI7nsL6nvlJ_xlNPY91-81mP7dNd1rJbza9CvIU0DA>
 <xmx:fgNTaJ9cYXNSZhWKtooWB8JtrKWVu4JZPUB1qF3A6egjecmdk6s_RQ>
 <xmx:fgNTaAXmJV_a7EVG2piOiY22VdyDLpZ6jilrm8i9l9SPZTeVVi6hsQ>
 <xmx:fgNTaKf_BGWX5PpDrXtWVG1mhA4fesK5G2sYqCX_xM6kloNO_nMOkQ>
 <xmx:fgNTaFoASO-dM7c_uJAbgFX_6NV7ESrd1_a-64rHOBpZQoBvJYWZ4JVA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:45 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:27 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-2-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5938;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=d+FLDtHymye2D8+0CW+chuFvr6sLsR9l6CerBAm1RQM=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5oo7ctG7dnlNnr367menihXswo9vr71ceerD0RTW5
 D8+3YKJHaUsDGIcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRwgCG/6Xnfpw+/eKdk0Gm
 b9sDtvMhL5br2ZXn7jvOblK4P67R8Aojw+WmgENvt3YULHzC0W12eeXFwOeNnG3VaZYKH9a6iIW
 fYwQA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270846;
 x=1750357246; bh=jhyxKIeluMEuafER31MqztoGtzSwatZIXHYApE4CJwc=; b=
 u29hjs9kuu2eV3ocQN6tYVtYv4nTqwNQG/954CZrsZedqcVnK7vMAYX+42gbrzMe
 Ja6QaE+7rcpvuelg6jxbmSzTdtZkYL6DikKffDYRitfdnVGr6M7GGFTYOLLJrOUf
 qYdfb0051VXMoVhN31/D97M3/KSQZEbaCmkt4xx+nUw8vvy/IiIFOYZuneQNTumH
 eVva14Y0V3qxE4OTqfHCkhdvqVZprgz8dlFhZnfI/cBNNxlxEVMHjIINC4xqh53c
 F+WTHO+ilnJV1XZ7zMKYQfSmKHBqurSpIgWaUMPwNKPMIZ7WN+EjwsD/OiDw/AKB
 km+CWoZYmj3AmWW59c80Vg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270846; x=
 1750357246; bh=jhyxKIeluMEuafER31MqztoGtzSwatZIXHYApE4CJwc=; b=P
 qXkiLcW0MHq5Wsk1QdkxAAU3Wjihlzb2G9mFL2zm+4MBhJPthqT+Bm6xvn+SH6Nz
 W3pOIJSY6Z3ZCCX4uMyGG/n1gCzrN7MitgsCYQJv/trvHDhWT3JQChNHo+vJVkQz
 KAgeqHgU43Q7sRyyrY+Qd9prak3sYjrsnGuLDX4cI1HZ8YvqxdR5Seg4RDxF7zVN
 Nd0ubjfAIEB7GL2GfNFukFoth0ZU+rXRoU9r3C2vSVankawSbmFdk6TV2zkELw2D
 UczwpIJXJRzuOtPrZFYptgGiF+CRBe4VnLXjn98fHpsq3p6/QvL5yP4tsF373KJi
 gcYfuhqFPcrY922PVRNqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=u29hjs9k; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PqXkiLcW
Subject: [Buildroot] [PATCH v3 02/11] arch: Introduce LoongArch64
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

Introduce LoongArch64 at architecture level.

Config.in.loongarch is prepared for possible loongarch32
enablement in future, thus BR2_ARCH_IS_64 is being depended
by some 64bit only options.

Internal toolchain is supported, as our minimal binutils
version is already beyond LoongArch minimal version and
GCC option is limited by BR2_ARCH_NEEDS_GCC_AT_LEAST_12.

BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT is selected temporary
and it's going to be rmoved after we gain libc support.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
	- Style fixes
	- add commit message about internal toolchain

v3:
	- Move GCC dependency to top level
	- Select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
	- Clarify why we depend on BR2_ARCH_IS_64
---
 DEVELOPERS               |   3 ++
 arch/Config.in           |  15 ++++++
 arch/Config.in.loongarch | 128 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a7bb3bd83460017a183f59d05f6a560d7316a6ac..a406ca6a3de4b46243118c3e1e0363a2c1708836 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1642,6 +1642,9 @@ F:	package/libuhttpd/
 F:	package/libuwsc/
 F:	package/rtty/
 
+N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
+F:	arch/Config.in.loongarch
+
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
diff --git a/arch/Config.in b/arch/Config.in
index ec720e74e193021ed01749945aed1457ec0789a1..744874362ca73a35d347d3895dd3db7d5e79242b 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -80,6 +80,17 @@ config BR2_i386
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
+config BR2_loongarch64
+	bool "LoongArch64"
+	select BR2_USE_MMU
+	select BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	help
+	  LoongArch64 is 64-bit architecture developed by Loongson.
+	  http://www.loongson.cn/
+	  https://en.wikipedia.org/wiki/Loongson
+
 config BR2_m68k
 	bool "m68k"
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
@@ -379,6 +390,10 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
+if BR2_loongarch64
+source "arch/Config.in.loongarch"
+endif
+
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
new file mode 100644
index 0000000000000000000000000000000000000000..4d1f071ca1c390277136fc9536c452a3295e1bc4
--- /dev/null
+++ b/arch/Config.in.loongarch
@@ -0,0 +1,128 @@
+# LoongArch CPU
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_loongarch64_generic if BR2_ARCH_IS_64
+
+config BR2_loongarch64_generic
+	bool "Generic LoongArch 64-bit"
+	depends on BR2_ARCH_IS_64
+	help
+	  Generic LoongArch 64-bit processor.
+
+config BR2_loongarch64_v1_0
+	bool "LoongArch64 ISA version 1.0"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.0 processor.
+
+config BR2_loongarch64_v1_1
+	bool "LoongArch64 ISA version 1.1"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.1 processor.
+
+endchoice
+
+choice
+	prompt "FPU Type"
+	default BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_FPU_64
+	bool "64"
+	help
+	  Allow the use of hardware floating-point instructions for
+	  32-bit and 64-bit operations.
+
+config BR2_LOONGARCH_FPU_32
+	bool "32"
+	help
+	  Allow the use of hardware floating-point instructions for
+	  32-bit operations only.
+
+config BR2_LOONGARCH_FPU_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware floating-point instructions.
+endchoice
+
+choice
+	prompt "SIMD Type"
+	default BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_SIMD_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware SIMD instructions.
+
+config BR2_LOONGARCH_SIMD_LSX
+	bool "LSX"
+	help
+	  Enable generating instructions from the 128-bit LoongArch SIMD
+	  Extension (LSX).
+
+config BR2_LOONGARCH_SIMD_LASX
+	bool "LASX"
+	help
+	  Enable generating instructions from the 256-bit LoongArch
+	  Advanced SIMD Extension (LASX) and the 128-bit LoongArch
+	  SIMD Extension (LSX).
+endchoice
+
+choice
+	prompt "Target ABI"
+	default BR2_LOONGARCH_ABI_LP64D if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_64
+	default BR2_LOONGARCH_ABI_LP64F if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_32
+	default BR2_LOONGARCH_ABI_LP64S if BR2_ARCH_IS_64 && BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_ABI_LP64D
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_ABI_LP64F
+	bool "lp64f"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
+
+config BR2_LOONGARCH_ABI_LP64S
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64
+endchoice
+
+config BR2_ARCH
+	default "loongarch64" if BR2_ARCH_IS_64
+
+config BR2_NORMALIZED_ARCH
+	default "loongarch"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_ARCH
+	default "loongarch64" if BR2_loongarch64_generic
+	default "la64v1.0" if BR2_loongarch64_v1_0
+	default "la64v1.1" if BR2_loongarch64_v1_1
+
+config BR2_GCC_TARGET_FPU
+	default "64" if BR2_LOONGARCH_FPU_64
+	default "32" if BR2_LOONGARCH_FPU_32
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_SIMD
+	default "lasx" if BR2_LOONGARCH_SIMD_LASX
+	default "lsx" if BR2_LOONGARCH_SIMD_LSX
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_ABI
+	default "lp64d" if BR2_LOONGARCH_ABI_LP64D
+	default "lp64f" if BR2_LOONGARCH_ABI_LP64F
+	default "lp64s" if BR2_LOONGARCH_ABI_LP64S
+
+config BR2_READELF_ARCH_NAME
+	default "LoongArch"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
