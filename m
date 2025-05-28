Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AFEC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F75440B59;
	Wed, 28 May 2025 14:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qalBk1JCD6_C; Wed, 28 May 2025 14:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3910040BB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3910040BB6;
	Wed, 28 May 2025 14:58:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2E0FB66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBE6540EFD
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5KyJ2quaTbc for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8601840F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8601840F93
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8601840F93
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBC4A43D79;
 Wed, 28 May 2025 14:58:09 +0000 (UTC)
Date: Wed, 28 May 2025 16:58:00 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license_toolchain-v1-3-34295630709b@bootlin.com>
References: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
In-Reply-To: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghil
 hdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748444290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwjHT8x+bjEMRlNYiP/DEjz7AGJXDvMd5x2OYW1DtZk=;
 b=RRZZo59xPPCcdyBqmoAjkSpQuMfrt4G1Ri0C5i0LLD67KZk6QMRYEOfzi8OQgGANP6tuHL
 oVAHRpQ9xkXFIyDBdFYlNc3RnvsdXUubb3M+nGwxVfWYEIXD8SsJXmZ6gMUOKn2FAQUeYt
 SzcctGj5jSt6+gGxj1tieavDTdm8Jt7T75YmLV8YYwzSwxYcWD26UVImsC0EClASjLxkVD
 HDVCbYNAFzLwtED7MBylOmUQ6BBY5vbviLtI0LVeX73/uiiI/nJZaC6nzlqoeEy7hNieC7
 wLozSePNi+q4kTu50DFHu/urWoTIboO8p6wqsw3JBsWaQG4dJuvEZ3S06QlRpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RRZZo59x
Subject: [Buildroot] [PATCH 3/5] toolchain-external-linaro*: Add support for
 license file description
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for Linaro toolchain license description using the
files in share/info/ as the licenses metadata. This ensures license compliance
when using external Linaro toolchains.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 .../toolchain-external-linaro-aarch64-be.hash      | 21 +++++++++++++++++++
 .../toolchain-external-linaro-aarch64-be.mk        | 24 ++++++++++++++++++++++
 .../toolchain-external-linaro-aarch64.hash         | 21 +++++++++++++++++++
 .../toolchain-external-linaro-aarch64.mk           | 23 +++++++++++++++++++++
 .../toolchain-external-linaro-arm.hash             | 21 +++++++++++++++++++
 .../toolchain-external-linaro-arm.mk               | 23 +++++++++++++++++++++
 .../toolchain-external-linaro-armeb.hash           | 21 +++++++++++++++++++
 .../toolchain-external-linaro-armeb.mk             | 23 +++++++++++++++++++++
 8 files changed, 177 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
index 53b6966e7b..cec843a2c6 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
@@ -1,3 +1,24 @@
 # Locally calculated
 sha256  412da19c1d1bff0f3172bc19fd2c024207d8d716dbe7a8dad4bf9e3d6b71d149  gcc-linaro-7.3.1-2018.05-i686_aarch64_be-linux-gnu.tar.xz
 sha256  277c1483f8dbd6007c945ffeb706fa1ba1da8ec1c397cf5cf1e29c25081426e5  gcc-linaro-7.3.1-2018.05-x86_64_aarch64_be-linux-gnu.tar.xz
+sha256  c069e5dfe15e372d25b17c4124a5f8dd55b9f191d633f5954cdb766f8f23eaa9  share/info/annotate.info
+sha256  2551fc28dc6c6b756f9612b3f89c4fb485c9694fc5966aa214d7f408bce80519  share/info/as.info
+sha256  0c1abdf8a8f14779464095c0713012d84c7f953a07cb95e3bc96a82a9cdbf53d  share/info/bfd.info
+sha256  e941845f6e6b949fe7108fb37e12d69618c194242ee3b4a017a9f83de9dd6413  share/info/binutils.info
+sha256  c391849998371cfcb37f9b2be89a05741c575a4393334b7592496aa560074b1b  share/info/cpp.info
+sha256  37275dbe06c98068171b22a0ae42ef081e2e9ad46b362f858cd20b92681ea208  share/info/cppinternals.info
+sha256  c17fe3000a0567e1d8222b3ea84c0486a6ddce560751ca52a8114f9da698cacf  share/info/gcc.info
+sha256  0bdd496d8869610781ce7597d416b5e0766201a400e8e07189303d385a9f57a7  share/info/gccinstall.info
+sha256  25b3fa627982d60491253dc54babb1181ea48d428a433fc4a6526ec20831f5d4  share/info/gccint.info
+sha256  1aa3708b21aef829201ddc1905269ae4e9878a55519c71bc1cb95e5a4acdfcff  share/info/gdb.info
+sha256  b4d8ce068704b9ea8f3a53e2854665dc79faa368ccfc2378e02145a8600372f8  share/info/gfortran.info
+sha256  bc690ceaef812eb24ff78db7c126c7c437e4ac28735b574f0a26156bfa1d1814  share/info/gmp.info
+sha256  2c6c34554dc0510af68276ec25ac40aec8c60adb9d342754a4ecf91af31c3d96  share/info/gmp.info-1
+sha256  68920853733f61b4c7bfd1136a7590da2dd6d131f2c2e87e271cd32415b477e3  share/info/gmp.info-2
+sha256  4d9f0af46c653b9a5a67c472b08cf25723ff717c138691ac6616e583544aba84  share/info/gprof.info
+sha256  b84087feb8b8fae12f74a66aa047b662c7b792cee730cc82fd3a614fe613b6af  share/info/ld.info
+sha256  e55fcf49ee60c48fa5890df1c39fb49660c24c56768c7025f531e02513eb64d2  share/info/libgomp.info
+sha256  6217bcbd1f2e626ad11ec95b660eb3ee46ed643e17eb91c191c075ca4bf753cd  share/info/libitm.info
+sha256  231a4ff2f3dc0f01091f3ca0720dbcf1374441a5c9fc82a4903d8b07e85dd8fa  share/info/mpc.info
+sha256  9d125638fe0cb17b98434af9ed52630fd443653d87a88d1e5be42c92abca355f  share/info/mpfr.info
+sha256  83a110dcc363139c652eef0a6d8061e91df3d0e56e3cb46b172ea6c61638364e  share/info/stabs.info
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
index 7a01151bf1..96a5fded37 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
@@ -13,4 +13,28 @@ else
 TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)-x86_64_aarch64_be-linux-gnu.tar.xz
 endif
 
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_LICENSE = multiple
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_LICENSE_FILES = \
+	share/info/annotate.info \
+	share/info/as.info \
+	share/info/bfd.info \
+	share/info/binutils.info \
+	share/info/cpp.info \
+	share/info/cppinternals.info \
+	share/info/gcc.info \
+	share/info/gccinstall.info \
+	share/info/gccint.info \
+	share/info/gdb.info \
+	share/info/gfortran.info \
+	share/info/gmp.info \
+	share/info/gmp.info-1 \
+	share/info/gmp.info-2 \
+	share/info/gprof.info \
+	share/info/ld.info \
+	share/info/libgomp.info \
+	share/info/libitm.info \
+	share/info/mpc.info \
+	share/info/mpfr.info \
+	share/info/stabs.info
+
 $(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
index 70841a4fa2..cff0141251 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,24 @@
 # Locally calculated
 sha256  466b801a60491ae1e2ce9952e0615cf04cf611596c6ffd5bfe8a89ef5be47e03  gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu.tar.xz
 sha256  73eed74e593e2267504efbcf3678918bb22409ab7afa3dc7c135d2c6790c2345  gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz
+sha256  c069e5dfe15e372d25b17c4124a5f8dd55b9f191d633f5954cdb766f8f23eaa9  share/info/annotate.info
+sha256  2551fc28dc6c6b756f9612b3f89c4fb485c9694fc5966aa214d7f408bce80519  share/info/as.info
+sha256  0c1abdf8a8f14779464095c0713012d84c7f953a07cb95e3bc96a82a9cdbf53d  share/info/bfd.info
+sha256  e941845f6e6b949fe7108fb37e12d69618c194242ee3b4a017a9f83de9dd6413  share/info/binutils.info
+sha256  c391849998371cfcb37f9b2be89a05741c575a4393334b7592496aa560074b1b  share/info/cpp.info
+sha256  37275dbe06c98068171b22a0ae42ef081e2e9ad46b362f858cd20b92681ea208  share/info/cppinternals.info
+sha256  c17fe3000a0567e1d8222b3ea84c0486a6ddce560751ca52a8114f9da698cacf  share/info/gcc.info
+sha256  0bdd496d8869610781ce7597d416b5e0766201a400e8e07189303d385a9f57a7  share/info/gccinstall.info
+sha256  25b3fa627982d60491253dc54babb1181ea48d428a433fc4a6526ec20831f5d4  share/info/gccint.info
+sha256  1aa3708b21aef829201ddc1905269ae4e9878a55519c71bc1cb95e5a4acdfcff  share/info/gdb.info
+sha256  b4d8ce068704b9ea8f3a53e2854665dc79faa368ccfc2378e02145a8600372f8  share/info/gfortran.info
+sha256  bc690ceaef812eb24ff78db7c126c7c437e4ac28735b574f0a26156bfa1d1814  share/info/gmp.info
+sha256  2c6c34554dc0510af68276ec25ac40aec8c60adb9d342754a4ecf91af31c3d96  share/info/gmp.info-1
+sha256  68920853733f61b4c7bfd1136a7590da2dd6d131f2c2e87e271cd32415b477e3  share/info/gmp.info-2
+sha256  4d9f0af46c653b9a5a67c472b08cf25723ff717c138691ac6616e583544aba84  share/info/gprof.info
+sha256  b84087feb8b8fae12f74a66aa047b662c7b792cee730cc82fd3a614fe613b6af  share/info/ld.info
+sha256  e55fcf49ee60c48fa5890df1c39fb49660c24c56768c7025f531e02513eb64d2  share/info/libgomp.info
+sha256  6217bcbd1f2e626ad11ec95b660eb3ee46ed643e17eb91c191c075ca4bf753cd  share/info/libitm.info
+sha256  231a4ff2f3dc0f01091f3ca0720dbcf1374441a5c9fc82a4903d8b07e85dd8fa  share/info/mpc.info
+sha256  9d125638fe0cb17b98434af9ed52630fd443653d87a88d1e5be42c92abca355f  share/info/mpfr.info
+sha256  83a110dcc363139c652eef0a6d8061e91df3d0e56e3cb46b172ea6c61638364e  share/info/stabs.info
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
index 1015d63014..439d94a0e7 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -12,5 +12,28 @@ TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL
 else
 TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
 endif
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_LICENSE = multiple
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_LICENSE_FILES = \
+	share/info/annotate.info \
+	share/info/as.info \
+	share/info/bfd.info \
+	share/info/binutils.info \
+	share/info/cpp.info \
+	share/info/cppinternals.info \
+	share/info/gcc.info \
+	share/info/gccinstall.info \
+	share/info/gccint.info \
+	share/info/gdb.info \
+	share/info/gfortran.info \
+	share/info/gmp.info \
+	share/info/gmp.info-1 \
+	share/info/gmp.info-2 \
+	share/info/gprof.info \
+	share/info/ld.info \
+	share/info/libgomp.info \
+	share/info/libitm.info \
+	share/info/mpc.info \
+	share/info/mpfr.info \
+	share/info/stabs.info
 
 $(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
index 7169e0b936..77f1d1b36b 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,24 @@
 # Locally calculated
 sha256  0613b5be14eb7d50a772bbd72069c428558e6e53fa5fce7201d75a13a475ffff  gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabihf.tar.xz
 sha256  7248bf105d0d468887a9b8a7120bb281ac8ad0223d9cb3d00dc7c2d498485d91  gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
+sha256  c069e5dfe15e372d25b17c4124a5f8dd55b9f191d633f5954cdb766f8f23eaa9  share/info/annotate.info
+sha256  2551fc28dc6c6b756f9612b3f89c4fb485c9694fc5966aa214d7f408bce80519  share/info/as.info
+sha256  0c1abdf8a8f14779464095c0713012d84c7f953a07cb95e3bc96a82a9cdbf53d  share/info/bfd.info
+sha256  e941845f6e6b949fe7108fb37e12d69618c194242ee3b4a017a9f83de9dd6413  share/info/binutils.info
+sha256  c391849998371cfcb37f9b2be89a05741c575a4393334b7592496aa560074b1b  share/info/cpp.info
+sha256  37275dbe06c98068171b22a0ae42ef081e2e9ad46b362f858cd20b92681ea208  share/info/cppinternals.info
+sha256  c17fe3000a0567e1d8222b3ea84c0486a6ddce560751ca52a8114f9da698cacf  share/info/gcc.info
+sha256  0bdd496d8869610781ce7597d416b5e0766201a400e8e07189303d385a9f57a7  share/info/gccinstall.info
+sha256  25b3fa627982d60491253dc54babb1181ea48d428a433fc4a6526ec20831f5d4  share/info/gccint.info
+sha256  1aa3708b21aef829201ddc1905269ae4e9878a55519c71bc1cb95e5a4acdfcff  share/info/gdb.info
+sha256  b4d8ce068704b9ea8f3a53e2854665dc79faa368ccfc2378e02145a8600372f8  share/info/gfortran.info
+sha256  bc690ceaef812eb24ff78db7c126c7c437e4ac28735b574f0a26156bfa1d1814  share/info/gmp.info
+sha256  2c6c34554dc0510af68276ec25ac40aec8c60adb9d342754a4ecf91af31c3d96  share/info/gmp.info-1
+sha256  68920853733f61b4c7bfd1136a7590da2dd6d131f2c2e87e271cd32415b477e3  share/info/gmp.info-2
+sha256  4d9f0af46c653b9a5a67c472b08cf25723ff717c138691ac6616e583544aba84  share/info/gprof.info
+sha256  b84087feb8b8fae12f74a66aa047b662c7b792cee730cc82fd3a614fe613b6af  share/info/ld.info
+sha256  e55fcf49ee60c48fa5890df1c39fb49660c24c56768c7025f531e02513eb64d2  share/info/libgomp.info
+sha256  6217bcbd1f2e626ad11ec95b660eb3ee46ed643e17eb91c191c075ca4bf753cd  share/info/libitm.info
+sha256  231a4ff2f3dc0f01091f3ca0720dbcf1374441a5c9fc82a4903d8b07e85dd8fa  share/info/mpc.info
+sha256  9d125638fe0cb17b98434af9ed52630fd443653d87a88d1e5be42c92abca355f  share/info/mpfr.info
+sha256  83a110dcc363139c652eef0a6d8061e91df3d0e56e3cb46b172ea6c61638364e  share/info/stabs.info
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index fda356bcea..cd6c077733 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -12,5 +12,28 @@ TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LIN
 else
 TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
 endif
+TOOLCHAIN_EXTERNAL_LINARO_ARM_LICENSE = multiple
+TOOLCHAIN_EXTERNAL_LINARO_ARM_LICENSE_FILES = \
+	share/info/annotate.info \
+	share/info/as.info \
+	share/info/bfd.info \
+	share/info/binutils.info \
+	share/info/cpp.info \
+	share/info/cppinternals.info \
+	share/info/gcc.info \
+	share/info/gccinstall.info \
+	share/info/gccint.info \
+	share/info/gdb.info \
+	share/info/gfortran.info \
+	share/info/gmp.info \
+	share/info/gmp.info-1 \
+	share/info/gmp.info-2 \
+	share/info/gprof.info \
+	share/info/ld.info \
+	share/info/libgomp.info \
+	share/info/libitm.info \
+	share/info/mpc.info \
+	share/info/mpfr.info \
+	share/info/stabs.info
 
 $(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
index 2b80f396d1..784610cfdf 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -1,3 +1,24 @@
 # Locally calculated
 sha256  60bf9924a0c039c94deb85cb9b129d0f28b28eadbb1fb3f7e2e227679cc43fc9  gcc-linaro-7.3.1-2018.05-i686_armeb-linux-gnueabihf.tar.xz
 sha256  c1bbd598b78458d6b7ea1c971fddf736c00d57890c7131fdafd4e789289c42f9  gcc-linaro-7.3.1-2018.05-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256  c069e5dfe15e372d25b17c4124a5f8dd55b9f191d633f5954cdb766f8f23eaa9  share/info/annotate.info
+sha256  2551fc28dc6c6b756f9612b3f89c4fb485c9694fc5966aa214d7f408bce80519  share/info/as.info
+sha256  0c1abdf8a8f14779464095c0713012d84c7f953a07cb95e3bc96a82a9cdbf53d  share/info/bfd.info
+sha256  e941845f6e6b949fe7108fb37e12d69618c194242ee3b4a017a9f83de9dd6413  share/info/binutils.info
+sha256  c391849998371cfcb37f9b2be89a05741c575a4393334b7592496aa560074b1b  share/info/cpp.info
+sha256  37275dbe06c98068171b22a0ae42ef081e2e9ad46b362f858cd20b92681ea208  share/info/cppinternals.info
+sha256  c17fe3000a0567e1d8222b3ea84c0486a6ddce560751ca52a8114f9da698cacf  share/info/gcc.info
+sha256  0bdd496d8869610781ce7597d416b5e0766201a400e8e07189303d385a9f57a7  share/info/gccinstall.info
+sha256  25b3fa627982d60491253dc54babb1181ea48d428a433fc4a6526ec20831f5d4  share/info/gccint.info
+sha256  1aa3708b21aef829201ddc1905269ae4e9878a55519c71bc1cb95e5a4acdfcff  share/info/gdb.info
+sha256  b4d8ce068704b9ea8f3a53e2854665dc79faa368ccfc2378e02145a8600372f8  share/info/gfortran.info
+sha256  bc690ceaef812eb24ff78db7c126c7c437e4ac28735b574f0a26156bfa1d1814  share/info/gmp.info
+sha256  2c6c34554dc0510af68276ec25ac40aec8c60adb9d342754a4ecf91af31c3d96  share/info/gmp.info-1
+sha256  68920853733f61b4c7bfd1136a7590da2dd6d131f2c2e87e271cd32415b477e3  share/info/gmp.info-2
+sha256  4d9f0af46c653b9a5a67c472b08cf25723ff717c138691ac6616e583544aba84  share/info/gprof.info
+sha256  b84087feb8b8fae12f74a66aa047b662c7b792cee730cc82fd3a614fe613b6af  share/info/ld.info
+sha256  e55fcf49ee60c48fa5890df1c39fb49660c24c56768c7025f531e02513eb64d2  share/info/libgomp.info
+sha256  6217bcbd1f2e626ad11ec95b660eb3ee46ed643e17eb91c191c075ca4bf753cd  share/info/libitm.info
+sha256  231a4ff2f3dc0f01091f3ca0720dbcf1374441a5c9fc82a4903d8b07e85dd8fa  share/info/mpc.info
+sha256  9d125638fe0cb17b98434af9ed52630fd443653d87a88d1e5be42c92abca355f  share/info/mpfr.info
+sha256  83a110dcc363139c652eef0a6d8061e91df3d0e56e3cb46b172ea6c61638364e  share/info/stabs.info
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
index b8ea80ff60..ab130d08d1 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -13,5 +13,28 @@ TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_L
 else
 TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_LICENSE = multiple
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_LICENSE_FILES = \
+	share/info/annotate.info \
+	share/info/as.info \
+	share/info/bfd.info \
+	share/info/binutils.info \
+	share/info/cpp.info \
+	share/info/cppinternals.info \
+	share/info/gcc.info \
+	share/info/gccinstall.info \
+	share/info/gccint.info \
+	share/info/gdb.info \
+	share/info/gfortran.info \
+	share/info/gmp.info \
+	share/info/gmp.info-1 \
+	share/info/gmp.info-2 \
+	share/info/gprof.info \
+	share/info/ld.info \
+	share/info/libgomp.info \
+	share/info/libitm.info \
+	share/info/mpc.info \
+	share/info/mpfr.info \
+	share/info/stabs.info
 
 $(eval $(toolchain-external-package))

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
