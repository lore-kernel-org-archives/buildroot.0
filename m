Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F17606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fh0r+iVo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C79440641;
	Sat, 24 Oct 2026 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGFb3W4zFrnx; Sat, 24 Oct 2026 21:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4094140639
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792878843;
	b=Qp894Tr9Oih4BELbVP8m7YppAWKwwJ3AdACZmwFhq5Eehs63np7UugirX3a8Gtdfu3T9
	 C0vtmHm8WT/xRu+VFP49kCQToqjjyv81HiiRjMZ0mEcQaixzGN7L6AGj8LdG12MHfVg87
	 fEmrqQ5bbrANUYHE7EY59SOY9hTs1lhRuWfA/4D1MLD0RPBMmmIzHccNRWyTL14CAi4ao
	 l/PXayuMG9PzzSHIVEEU8HeN9PXYnrmWhy9Uj8UvRvxZeiI0StY+fwl7pw3VE493co2+/
	 gl/yE+9MzpeQ+S38sx0ImXLmwhJCAmcje+Xdxn8gHKVhN7rgL1dXy3zN6VHFF+pUSYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792878843;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+lumCLvfOooUZVb2DZAFXZhgkN4s2l3nfe+zNGnH8S8=;
	b=FYfpApxrbquQaMc/Va52+3424C1m+g5C5WbXBlTG5BJo8LFiIvSD8qFg5egVPeQl/jhj
	 4jt2xoSc5jIBwHFZdkKU6SCeADv4/3uX/TwEcIlUkvtJ/AI7YQ6r0NLKw6vAIJLtCiaeX
	 rTgTW5dLxoRuIDwtFZIimUztg3EOC2KuPSGYut23QN19ri+yXHf3RmLVnWYRqEqL9uQ7b
	 dneDwy6aSd0Zvy71zKReF2eCuBD2u1ivk4boZA2vjrWqJPOYYItoQtLpLKOWszduTk5FD
	 THDf4AwxloBm3iwrf8TwqMGaYzYxPvURymVtPLpY/an8MpgfZx6ytHpI4xK7+/jNI9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792878843;
	bh=+lumCLvfOooUZVb2DZAFXZhgkN4s2l3nfe+zNGnH8S8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fh0r+iVooYmV4V/slD7xBkT6CatLEXJ9h7FP+sT1XPUi7AkdtGEJ0Bxr7cHjLF1/f
	 B0bJ8WTtZ8Yp846uPs50FNlPvU0i64SkbR+aczqdrR59XlVMJARPZKWHVtUxBJrLVa
	 r0Rksq7PObRNjr1IacnTGTjtMP70I6QWsgX14k94qZyqWzwfktv2uzNlgqyVJoLIYK
	 9favS/8gR9gwr9z38lr6HouhKvNnN7xuNcnBPqUhWIsdAShq3yYVz0t5x4/OVeG/47
	 ibugD9jfiN+4H5FpEFtFmfD8BUyWZxliY+czBlZm1SNYAtuvDkSkwmxNHv+bWLhUFg
	 unOxT/Ki2bsUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4094140639;
	Sat, 24 Oct 2026 21:54:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0402143
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E5860614
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4lcfoDQdEFs for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:54:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7BB6F60611
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792878840;
 b=DZZPjy16/l921qYb/ojbDw9FmsCRXeZp5qH86X4eZwa0jjEbdkGyZfzdKvV1RHP3fXWH
 O6BGYPZXcoc9R9Tobf8tAd9yZHj08DnQlP440CD38XEtZyMjWfWN8H8T1EzeaSitTXYAR
 DNE1C1S1rIvr9qAIRJaWRScJ1PA3ouLDTYGvP8KZIbkgJU3k+dz5VfjwdLv8d8kUuCySa
 gzLlp/eq08C3cfngX7u2fm2kC0FDs1XC57W8DKmUrZKLzgL97dlOkp8USHYrcHgK4Gav1
 o091hafRRtx7Vc6sUlfOcUCQqubkyQcbdFcmxdmGez9l83uGfn7GwqE+/jqNIlvq8wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792878840;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=n+VawOAi4WT4S5bt/c3lx50O6KvWiiEucpYkn3RqFmA=;
 b=iKAlQVaGcykxiCskX2wIXfx3m5FPtQvPVYBFq19I/Jonck79lPxenxn/W1TvVXiMzM17
 jBoIF6JZAf6fXsQXXCD55CTDJrKxEImgMZIQZ5GiQVa8u11arRegbb6M8amnbnRTrnCP5
 EEc7bO983mSK6LJ5xKo4UF9GbeheWvvpgZMCJXFPrMVeS1lYrdM9cdptVCl26tyD0gvVz
 D1KjNxNjA9QIm/+kTJcC6MO6nEE+DN4hagxyv/elCTawBCUFJFOYGNfSfj1W/GFJO2kPd
 ZMaMfpHuqVIXmWFf7vuqX19Mi4dBZzzlXQqxFYjgRe6dEZBBUlLaVhwgRPvvbpmh9cQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PlORyj2p; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BB6F60611
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:53:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1wjSzM3X4a-00oHb6; Sat, 24
 Oct 2026 23:53:49 +0200
To: buildroot@buildroot.org
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 24 Oct 2026 23:53:29 +0200
Message-ID: <20261024215330.2067282-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:c+2nairTouSZzC95bB2r8IZwt7HVcKRD6ZN0CoFuyL4cdRwLMqG
 d86HDRdWLxwrva+Rm9vx3ijGNLqCSwdjcDPBaGSk7+FnTjcjSo4USbFuezhoQqoyOnF1e0F
 wxiXyxuhi4r6S7JhQ+3Tm4win91UvNGRUm39BnojRhVa97x+ND1gK0HRaIW4CntxWJeckW0
 kFAvt1e16/SS+662RW8tw==
UI-OutboundReport: notjunk:1;M01:P0:fbGLr9dofP4=;ovUexP7LV99Zu7+TYzaABW73V5S
 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
 wQ=
Subject: [Buildroot] [PATCH v2 1/2] boot/uboot: make binman dependency on
 host-python-pkg-resources optional
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Binman needs pkg_resources only in U-Boot versions before 2025.10,
otherwise the dependency is unnecessary and best avoided.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Tested with engicam_px30_core_defconfig, which uses U-Boot
2025.04. With BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES=y the build
works, without it binman fails because it cannot import pkg_resources.

engicam_px30_core_defconfig appears to be the only defconfig that uses
binman *and* a U-Boot version < 2025.10 according to output of:

grep UBOOT_CUSTOM $(grep -R -l BR2_TARGET_UBOOT_USE_BINMAN configs/)

Nonetheless, if any defconfigs you care about use binman, please
verify and if needed (preferably) update U-Boot or enable
BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES=y.

 boot/uboot/Config.in | 14 ++++++++++++++
 boot/uboot/uboot.mk  |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 381a12197d..3e46293796 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -379,6 +379,20 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 
 	  https://docs.u-boot.org/en/v2026.10/develop/package/binman.html
 
+if BR2_TARGET_UBOOT_USE_BINMAN
+
+config BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES
+	bool "Binman needs pkg-resources (U-Boot version < 2025.10)"
+	depends on BR2_TARGET_UBOOT_USE_BINMAN
+	help
+	  In U-Boot versions before 2025.10 binman uses the Python
+	  module pkg_resources, which used to be provided by
+	  python-setuptools before version 82.0.0. Select this option
+	  to use backported pkg_resources when building old U-Boot
+	  versions.
+
+endif
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a7e831f6c3..ed66feafd1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -312,10 +312,12 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+ifeq ($(BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES),y)
+UBOOT_DEPENDENCIES += host-python-pkg-resources
+endif
 endif
 
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
