Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CF7C79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 12:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5987405F6;
	Tue,  8 Sep 2026 12:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbyeKJLkcQG2; Tue,  8 Sep 2026 12:54:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 490FA40568
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788872041;
	b=LMs/Eh6tlzBiVuecQ2/8US++NOlXK4H11ptjbwfMzEdBVkI/718rhPlTSUjHBEVPDz+A
	 Tb3TxntyBbUSJs5tBAy/22eDZasB3w+RA8zEZf2On2D3hBjDEqTLvikPqhPR4vNQA9HIt
	 udr/TZUtEnmub5Qe0xXC2X+n9D2arUQ6dKNUTL1I7Rbqz3GobtQQ32jb98zs9aHyxZPHz
	 2pwtdT6nNT3qJwKY2pt7Jo5k0WGyCeW6hvCSkySTXN9wGLHNWVaYM/HODom5PluQQ4DQg
	 dYtf6bKzgNFBzd06GeDdHAW5pQiMx5hqUmNYseGT81bNuUoyaT8eRSJ9UyuNxfaHXkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788872041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:X-Mailman-Approved-At:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xOF3wgqx4gHbSAXRG0oANZecQWam9/U1q/vMCOm3m3o=;
	b=gVvgPxdYV/qABdSepLalDpM/MNiOFDcoWQjshNACZd/f2ENqqUF3MkIqoK7kVc2EQoIj
	 N+wr9u/XLE3Ic2za36v7+DI+SXLXtN93oyNslQ10z61jwz9u1k16CKEESlZmgUkA/KvOb
	 FAJegeUjbWKdFEzNPfvZGa2rZHkm//USXOdm5in7pSjEjsh46uYXLOGO/q4+yr3Vui6pr
	 vjabeeS1Et++oa/Fh6mhVJb65BmZ5KjxldzijWgGls+Ylm140HtO7ZDTOd00QviAHD5Y5
	 2jX5lDTAKtUSIktePFcQl+fxbHz3vvP+xTr39BkwGI+xPXU5vv9JRE+HTbc13ftZvHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788872041;
	bh=xOF3wgqx4gHbSAXRG0oANZecQWam9/U1q/vMCOm3m3o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dfJbyaQsm7gLHq+Hc31RNQ0VQs6CoC4BbXFWken0mNEYb6EFWvtz4qdzjHtqbpHtZ
	 bc4KIIlg5s14laPzg35fTl2A0n2jZ/hfdw7ZhPc+9Z+/C/ijCOtBUGJTa+Kwycqpto
	 FkR0bBxtRxXFe7yfhqskKK0658dWYROehUdqwttVvjkOuruObHiXgVRfLTkYDqKbQe
	 oV+uuSo99Yffico5gYK6E2orwFo/+2D6OKUQ0kTz9ROB6IhL924HKGI8U7bmrWWZ/u
	 ziFwDRcrsQrSCmDDrrysDtdI99peChecCkXeLyVtd0h3rHa1/w4wvHREZiUdCn12d4
	 dQHGmJCKUvlkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490FA40568;
	Tue,  8 Sep 2026 12:54:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70BA22C7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 18:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B6556062A
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 18:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r84ukPxeSkqb for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 18:08:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 61FAD605F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788718093;
 b=f9SFbFYhfoMEkDTGzXyT8Rbx4qbSTmC5a1I62AFjDBBbDP+YmUkgIybMGJDI1uwF6V8G
 ME5fX7jzNomc5OMFXwSToEnOz0jg8FBrStCb1XfDcJ6zZMyBASCLKDS4yplAY35mxqV6a
 W55dE1qENgEQtqv2AwHrhM5S79RPbpkpFYwx3jtIH40fualf/KYHk3ZwiptSAQGtRWXIh
 G2zK4RtTvoBOaSmkPBdqOpiEsXL5BaY1VR8mbn7NeUWwxc5NSRcL7edHdEP6GRZBD3SoK
 9wMxvsCa4LGzdFbSPBy2wvjX2XXTMk0IOPNkBeuHYzQD3c9kWH0MupOGSH5sTs5lpLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788718093;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=RmGNIwRdRBsvEVHcS3cgAzlbkbFKQ2km66wonLhAoss=;
 b=fUyW4vOCfHl73dxvMQyYEl3L/COygVTO/FfaFm17lDZK3ppg5pFaTE/t76rIK+lVMdzs
 UBO3CPKUBz5FniPbMmbTAzPMaI/4zukGRZj7F/t5WlRQdEFw6EJxGVCHOTkDGQzYHbkt6
 4w/g4srKXbrBrd/ZoQYHEwikW+rLbm7HsSWG476bAgCdD4H3QW59kv/um/tllLh6IgHaR
 EKk6St9USJmByMgYw8q/0I+uxsghUqZiVAfvmrzSic3OS74wKDL9oZqh7Vli3E4TH3tFt
 wYaK7knaKB8+O9/jFK3tdNjTmU39oSWTPgx23ldRmOxhZUFSdhmEh2rutFZtd0SlkkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jOCUtFFx; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61FAD605F0
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 18:08:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E30281A19F9;
 Sun,  6 Sep 2026 18:08:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A62C760288;
 Sun,  6 Sep 2026 18:08:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CFC6211C79FF0; 
 Sun,  6 Sep 2026 20:08:00 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Sep 2026 20:07:57 +0200
Message-ID: <20260906180758.971695-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 08 Sep 2026 12:54:00 +0000
Subject: [Buildroot] [PATCH] tooolchain/toolchain-external: update
 toolchain-external-bootlin to 2026.08
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All toolchains have been rebuilt based on Buildroot 2026.08, which
means:

* The bleeding-edge toolchains are based on gcc 16.2, binutils 2.46.1,
  gdb 17.1, kernel headers 6.12, glibc 2.44, musl 1.2.6 or uclibc-ng
  1.0.59.

* The stable toolchains are based on gcc 15.3, binutils 2.45.1, gdb
  16.3, kernel headers 5.10, glibc 2.44, musl 1.2.6 or uclibc-ng 1.0.59.

The runtime tests related to those toolchains all pass fine:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/2824569690

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../Config.in.options                         | 1814 +++++++++--------
 .../toolchain-external-bootlin.hash           |  872 ++++----
 .../toolchain-external-bootlin.mk             |  436 ++--
 3 files changed, 1594 insertions(+), 1528 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index f59c6aed5e..86d951e8a6 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -57,12 +57,12 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Bootlin toolchain variant"
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
-	bool "aarch64 glibc bleeding-edge 2025.08-1"
+	bool "aarch64 glibc bleeding-edge 2026.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -80,12 +80,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
-	bool "aarch64 glibc stable 2025.08-1"
+	bool "aarch64 glibc stable 2026.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -102,12 +102,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
-	bool "aarch64 musl bleeding-edge 2025.08-1"
+	bool "aarch64 musl bleeding-edge 2026.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -125,12 +125,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
-	bool "aarch64 musl stable 2025.08-1"
+	bool "aarch64 musl stable 2026.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -146,16 +146,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
-	bool "aarch64 uclibc bleeding-edge 2025.08-1"
+	bool "aarch64 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -169,15 +170,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
-	bool "aarch64 uclibc stable 2025.08-1"
+	bool "aarch64 uclibc stable 2026.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -191,12 +193,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
-	bool "aarch64be glibc bleeding-edge 2025.08-1"
+	bool "aarch64be glibc bleeding-edge 2026.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -214,12 +216,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
-	bool "aarch64be glibc stable 2025.08-1"
+	bool "aarch64be glibc stable 2026.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -236,12 +238,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
-	bool "aarch64be musl bleeding-edge 2025.08-1"
+	bool "aarch64be musl bleeding-edge 2026.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -259,12 +261,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
-	bool "aarch64be musl stable 2025.08-1"
+	bool "aarch64be musl stable 2026.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -280,16 +282,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
-	bool "aarch64be uclibc bleeding-edge 2025.08-1"
+	bool "aarch64be uclibc bleeding-edge 2026.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -303,15 +306,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
-	bool "aarch64be uclibc stable 2025.08-1"
+	bool "aarch64be uclibc stable 2026.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -325,17 +329,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
-	bool "arcle-750d uclibc bleeding-edge 2025.08-1"
+	bool "arcle-750d uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -349,16 +354,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
-	bool "arcle-750d uclibc stable 2025.08-1"
+	bool "arcle-750d uclibc stable 2026.08-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -372,13 +378,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 glibc bleeding-edge 2025.08-1"
+	bool "arcle-hs38 glibc bleeding-edge 2026.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -395,13 +401,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
-	bool "arcle-hs38 glibc stable 2025.08-1"
+	bool "arcle-hs38 glibc stable 2026.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -417,16 +423,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 uclibc bleeding-edge 2025.08-1"
+	bool "arcle-hs38 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -440,15 +447,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
-	bool "arcle-hs38 uclibc stable 2025.08-1"
+	bool "arcle-hs38 uclibc stable 2026.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -462,14 +470,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
-	bool "armv5-eabi glibc bleeding-edge 2025.08-1"
+	bool "armv5-eabi glibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -487,14 +495,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
-	bool "armv5-eabi glibc stable 2025.08-1"
+	bool "armv5-eabi glibc stable 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -511,14 +519,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
-	bool "armv5-eabi musl bleeding-edge 2025.08-1"
+	bool "armv5-eabi musl bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -536,14 +544,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
-	bool "armv5-eabi musl stable 2025.08-1"
+	bool "armv5-eabi musl stable 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -560,18 +568,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
-	bool "armv5-eabi uclibc bleeding-edge 2025.08-1"
+	bool "armv5-eabi uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -585,17 +594,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
-	bool "armv5-eabi uclibc stable 2025.08-1"
+	bool "armv5-eabi uclibc stable 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -609,14 +619,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf glibc bleeding-edge 2025.08-1"
+	bool "armv6-eabihf glibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -634,14 +644,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
-	bool "armv6-eabihf glibc stable 2025.08-1"
+	bool "armv6-eabihf glibc stable 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -658,14 +668,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv6-eabihf musl bleeding-edge 2025.08-1"
+	bool "armv6-eabihf musl bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -683,14 +693,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
-	bool "armv6-eabihf musl stable 2025.08-1"
+	bool "armv6-eabihf musl stable 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -707,18 +717,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf uclibc bleeding-edge 2025.08-1"
+	bool "armv6-eabihf uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -732,17 +743,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
-	bool "armv6-eabihf uclibc stable 2025.08-1"
+	bool "armv6-eabihf uclibc stable 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -756,13 +768,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf glibc bleeding-edge 2025.08-1"
+	bool "armv7-eabihf glibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -780,13 +792,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
-	bool "armv7-eabihf glibc stable 2025.08-1"
+	bool "armv7-eabihf glibc stable 2026.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -803,13 +815,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv7-eabihf musl bleeding-edge 2025.08-1"
+	bool "armv7-eabihf musl bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -827,13 +839,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
-	bool "armv7-eabihf musl stable 2025.08-1"
+	bool "armv7-eabihf musl stable 2026.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -850,17 +862,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf uclibc bleeding-edge 2025.08-1"
+	bool "armv7-eabihf uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -874,16 +887,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
-	bool "armv7-eabihf uclibc stable 2025.08-1"
+	bool "armv7-eabihf uclibc stable 2026.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -897,13 +911,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf glibc bleeding-edge 2025.08-1"
+	bool "armebv7-eabihf glibc bleeding-edge 2026.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -921,13 +935,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
-	bool "armebv7-eabihf glibc stable 2025.08-1"
+	bool "armebv7-eabihf glibc stable 2026.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -944,13 +958,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armebv7-eabihf musl bleeding-edge 2025.08-1"
+	bool "armebv7-eabihf musl bleeding-edge 2026.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -968,13 +982,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
-	bool "armebv7-eabihf musl stable 2025.08-1"
+	bool "armebv7-eabihf musl stable 2026.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -991,17 +1005,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf uclibc bleeding-edge 2025.08-1"
+	bool "armebv7-eabihf uclibc bleeding-edge 2026.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1015,16 +1030,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
-	bool "armebv7-eabihf uclibc stable 2025.08-1"
+	bool "armebv7-eabihf uclibc stable 2026.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1038,18 +1054,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
-	bool "armv7m uclibc bleeding-edge 2025.08-1"
+	bool "armv7m uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
 	depends on BR2_BINFMT_FLAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -1062,17 +1078,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
-	bool "armv7m uclibc stable 2025.08-1"
+	bool "armv7m uclibc stable 2026.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
 	depends on BR2_BINFMT_FLAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -1085,12 +1102,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx glibc bleeding-edge 2025.08-1"
+	bool "m68k-68xxx glibc bleeding-edge 2026.08-1"
 	depends on BR2_m68k_m68k
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1108,12 +1125,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
-	bool "m68k-68xxx glibc stable 2025.08-1"
+	bool "m68k-68xxx glibc stable 2026.08-1"
 	depends on BR2_m68k_m68k
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1130,12 +1147,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
-	bool "m68k-68xxx musl bleeding-edge 2025.08-1"
+	bool "m68k-68xxx musl bleeding-edge 2026.08-1"
 	depends on BR2_m68k_m68k
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1153,12 +1170,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
-	bool "m68k-68xxx musl stable 2025.08-1"
+	bool "m68k-68xxx musl stable 2026.08-1"
 	depends on BR2_m68k_m68k
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1175,17 +1192,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx uclibc bleeding-edge 2025.08-1"
+	bool "m68k-68xxx uclibc bleeding-edge 2026.08-1"
 	depends on BR2_m68k_m68k
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1199,16 +1217,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
-	bool "m68k-68xxx uclibc stable 2025.08-1"
+	bool "m68k-68xxx uclibc stable 2026.08-1"
 	depends on BR2_m68k_m68k
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1222,16 +1241,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
-	bool "m68k-coldfire uclibc bleeding-edge 2025.08-1"
+	bool "m68k-coldfire uclibc bleeding-edge 2026.08-1"
 	depends on BR2_m68k_cf
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -1244,15 +1263,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
-	bool "m68k-coldfire uclibc stable 2025.08-1"
+	bool "m68k-coldfire uclibc stable 2026.08-1"
 	depends on BR2_m68k_cf
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -1265,13 +1285,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
-	bool "microblazebe glibc bleeding-edge 2025.08-1"
+	bool "microblazebe glibc bleeding-edge 2026.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1286,13 +1306,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
-	bool "microblazebe glibc stable 2025.08-1"
+	bool "microblazebe glibc stable 2026.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1307,13 +1327,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
-	bool "microblazebe musl bleeding-edge 2025.08-1"
+	bool "microblazebe musl bleeding-edge 2026.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1328,13 +1348,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
-	bool "microblazebe musl stable 2025.08-1"
+	bool "microblazebe musl stable 2026.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1349,12 +1369,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
-	bool "microblazebe uclibc bleeding-edge 2025.08-1"
+	bool "microblazebe uclibc bleeding-edge 2026.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1371,12 +1391,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
-	bool "microblazebe uclibc stable 2025.08-1"
+	bool "microblazebe uclibc stable 2026.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1393,13 +1413,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
-	bool "microblazeel glibc bleeding-edge 2025.08-1"
+	bool "microblazeel glibc bleeding-edge 2026.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1414,13 +1434,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
-	bool "microblazeel glibc stable 2025.08-1"
+	bool "microblazeel glibc stable 2026.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1435,13 +1455,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
-	bool "microblazeel musl bleeding-edge 2025.08-1"
+	bool "microblazeel musl bleeding-edge 2026.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1456,13 +1476,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
-	bool "microblazeel musl stable 2025.08-1"
+	bool "microblazeel musl stable 2026.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1477,12 +1497,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
-	bool "microblazeel uclibc bleeding-edge 2025.08-1"
+	bool "microblazeel uclibc bleeding-edge 2026.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1499,12 +1519,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
-	bool "microblazeel uclibc stable 2025.08-1"
+	bool "microblazeel uclibc stable 2026.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1521,14 +1541,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
-	bool "mips32 glibc bleeding-edge 2025.08-1"
+	bool "mips32 glibc bleeding-edge 2026.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1546,14 +1566,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
-	bool "mips32 glibc stable 2025.08-1"
+	bool "mips32 glibc stable 2026.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1570,14 +1590,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
-	bool "mips32 musl bleeding-edge 2025.08-1"
+	bool "mips32 musl bleeding-edge 2026.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1595,14 +1615,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
-	bool "mips32 musl stable 2025.08-1"
+	bool "mips32 musl stable 2026.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1618,18 +1638,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
-	bool "mips32 uclibc bleeding-edge 2025.08-1"
+	bool "mips32 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1643,17 +1664,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
-	bool "mips32 uclibc stable 2025.08-1"
+	bool "mips32 uclibc stable 2026.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1667,14 +1689,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
-	bool "mips32el glibc bleeding-edge 2025.08-1"
+	bool "mips32el glibc bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1692,14 +1714,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
-	bool "mips32el glibc stable 2025.08-1"
+	bool "mips32el glibc stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1716,14 +1738,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
-	bool "mips32el musl bleeding-edge 2025.08-1"
+	bool "mips32el musl bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1741,14 +1763,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
-	bool "mips32el musl stable 2025.08-1"
+	bool "mips32el musl stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1764,18 +1786,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32el uclibc bleeding-edge 2025.08-1"
+	bool "mips32el uclibc bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1789,17 +1812,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
-	bool "mips32el uclibc stable 2025.08-1"
+	bool "mips32el uclibc stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1813,14 +1837,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r5el glibc bleeding-edge 2025.08-1"
+	bool "mips32r5el glibc bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1838,14 +1862,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
-	bool "mips32r5el glibc stable 2025.08-1"
+	bool "mips32r5el glibc stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1862,14 +1886,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
-	bool "mips32r5el musl bleeding-edge 2025.08-1"
+	bool "mips32r5el musl bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1887,14 +1911,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
-	bool "mips32r5el musl stable 2025.08-1"
+	bool "mips32r5el musl stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1911,18 +1935,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r5el uclibc bleeding-edge 2025.08-1"
+	bool "mips32r5el uclibc bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1936,17 +1961,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
-	bool "mips32r5el uclibc stable 2025.08-1"
+	bool "mips32r5el uclibc stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -1960,14 +1986,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r6el glibc bleeding-edge 2025.08-1"
+	bool "mips32r6el glibc bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -1985,14 +2011,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
-	bool "mips32r6el glibc stable 2025.08-1"
+	bool "mips32r6el glibc stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2009,14 +2035,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
-	bool "mips32r6el musl bleeding-edge 2025.08-1"
+	bool "mips32r6el musl bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2034,14 +2060,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
-	bool "mips32r6el musl stable 2025.08-1"
+	bool "mips32r6el musl stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2058,18 +2084,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r6el uclibc bleeding-edge 2025.08-1"
+	bool "mips32r6el uclibc bleeding-edge 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2083,17 +2110,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
-	bool "mips32r6el uclibc stable 2025.08-1"
+	bool "mips32r6el uclibc stable 2026.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2107,15 +2135,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64-n32 glibc bleeding-edge 2025.08-1"
+	bool "mips64-n32 glibc bleeding-edge 2026.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2133,15 +2161,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
-	bool "mips64-n32 glibc stable 2025.08-1"
+	bool "mips64-n32 glibc stable 2026.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2158,15 +2186,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
-	bool "mips64-n32 musl bleeding-edge 2025.08-1"
+	bool "mips64-n32 musl bleeding-edge 2026.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2184,15 +2212,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
-	bool "mips64-n32 musl stable 2025.08-1"
+	bool "mips64-n32 musl stable 2026.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2209,19 +2237,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64-n32 uclibc bleeding-edge 2025.08-1"
+	bool "mips64-n32 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2235,18 +2264,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
-	bool "mips64-n32 uclibc stable 2025.08-1"
+	bool "mips64-n32 uclibc stable 2026.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2260,15 +2290,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 glibc bleeding-edge 2025.08-1"
+	bool "mips64el-n32 glibc bleeding-edge 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2286,15 +2316,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
-	bool "mips64el-n32 glibc stable 2025.08-1"
+	bool "mips64el-n32 glibc stable 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2311,15 +2341,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64el-n32 musl bleeding-edge 2025.08-1"
+	bool "mips64el-n32 musl bleeding-edge 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2337,15 +2367,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
-	bool "mips64el-n32 musl stable 2025.08-1"
+	bool "mips64el-n32 musl stable 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2362,19 +2392,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 uclibc bleeding-edge 2025.08-1"
+	bool "mips64el-n32 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2388,18 +2419,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
-	bool "mips64el-n32 uclibc stable 2025.08-1"
+	bool "mips64el-n32 uclibc stable 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2413,15 +2445,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 glibc bleeding-edge 2025.08-1"
+	bool "mips64r6el-n32 glibc bleeding-edge 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2439,15 +2471,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
-	bool "mips64r6el-n32 glibc stable 2025.08-1"
+	bool "mips64r6el-n32 glibc stable 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2464,15 +2496,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64r6el-n32 musl bleeding-edge 2025.08-1"
+	bool "mips64r6el-n32 musl bleeding-edge 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2490,15 +2522,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
-	bool "mips64r6el-n32 musl stable 2025.08-1"
+	bool "mips64r6el-n32 musl stable 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2515,19 +2547,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 uclibc bleeding-edge 2025.08-1"
+	bool "mips64r6el-n32 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2541,18 +2574,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
-	bool "mips64r6el-n32 uclibc stable 2025.08-1"
+	bool "mips64r6el-n32 uclibc stable 2026.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2566,13 +2600,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
-	bool "openrisc glibc bleeding-edge 2025.08-1"
+	bool "openrisc glibc bleeding-edge 2026.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2590,13 +2624,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
-	bool "openrisc glibc stable 2025.08-1"
+	bool "openrisc glibc stable 2026.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2613,13 +2647,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
-	bool "openrisc musl bleeding-edge 2025.08-1"
+	bool "openrisc musl bleeding-edge 2026.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2637,13 +2671,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
-	bool "openrisc musl stable 2025.08-1"
+	bool "openrisc musl stable 2026.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2659,17 +2693,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
-	bool "openrisc uclibc bleeding-edge 2025.08-1"
+	bool "openrisc uclibc bleeding-edge 2026.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2683,16 +2718,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
-	bool "openrisc uclibc stable 2025.08-1"
+	bool "openrisc uclibc stable 2026.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2706,13 +2742,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp glibc bleeding-edge 2025.08-1"
+	bool "powerpc-440fp glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2730,13 +2766,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
-	bool "powerpc-440fp glibc stable 2025.08-1"
+	bool "powerpc-440fp glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2753,13 +2789,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
-	bool "powerpc-440fp musl bleeding-edge 2025.08-1"
+	bool "powerpc-440fp musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2776,13 +2812,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
-	bool "powerpc-440fp musl stable 2025.08-1"
+	bool "powerpc-440fp musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2798,17 +2834,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp uclibc bleeding-edge 2025.08-1"
+	bool "powerpc-440fp uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2822,16 +2859,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
-	bool "powerpc-440fp uclibc stable 2025.08-1"
+	bool "powerpc-440fp uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2845,13 +2883,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 glibc bleeding-edge 2025.08-1"
+	bool "powerpc-e300c3 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2869,13 +2907,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
-	bool "powerpc-e300c3 glibc stable 2025.08-1"
+	bool "powerpc-e300c3 glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2892,13 +2930,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
-	bool "powerpc-e300c3 musl bleeding-edge 2025.08-1"
+	bool "powerpc-e300c3 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2915,13 +2953,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
-	bool "powerpc-e300c3 musl stable 2025.08-1"
+	bool "powerpc-e300c3 musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2937,17 +2975,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 uclibc bleeding-edge 2025.08-1"
+	bool "powerpc-e300c3 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2961,16 +3000,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
-	bool "powerpc-e300c3 uclibc stable 2025.08-1"
+	bool "powerpc-e300c3 uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -2984,13 +3024,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc glibc bleeding-edge 2025.08-1"
+	bool "powerpc-e500mc glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3008,13 +3048,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
-	bool "powerpc-e500mc glibc stable 2025.08-1"
+	bool "powerpc-e500mc glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3031,13 +3071,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
-	bool "powerpc-e500mc musl bleeding-edge 2025.08-1"
+	bool "powerpc-e500mc musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3054,13 +3094,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
-	bool "powerpc-e500mc musl stable 2025.08-1"
+	bool "powerpc-e500mc musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3076,17 +3116,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc uclibc bleeding-edge 2025.08-1"
+	bool "powerpc-e500mc uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3100,16 +3141,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
-	bool "powerpc-e500mc uclibc stable 2025.08-1"
+	bool "powerpc-e500mc uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3123,13 +3165,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e5500 glibc bleeding-edge 2025.08-1"
+	bool "powerpc64-e5500 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3147,13 +3189,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
-	bool "powerpc64-e5500 glibc stable 2025.08-1"
+	bool "powerpc64-e5500 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3170,13 +3212,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e6500 glibc bleeding-edge 2025.08-1"
+	bool "powerpc64-e6500 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3194,13 +3236,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
-	bool "powerpc64-e6500 glibc stable 2025.08-1"
+	bool "powerpc64-e6500 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3217,13 +3259,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
-	bool "powerpc64-e6500 musl bleeding-edge 2025.08-1"
+	bool "powerpc64-e6500 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3241,13 +3283,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
-	bool "powerpc64-e6500 musl stable 2025.08-1"
+	bool "powerpc64-e6500 musl stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3264,13 +3306,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-power8 glibc bleeding-edge 2025.08-1"
+	bool "powerpc64-power8 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3288,13 +3330,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
-	bool "powerpc64-power8 glibc stable 2025.08-1"
+	bool "powerpc64-power8 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3311,13 +3353,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64-power8 musl bleeding-edge 2025.08-1"
+	bool "powerpc64-power8 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3335,13 +3377,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
-	bool "powerpc64-power8 musl stable 2025.08-1"
+	bool "powerpc64-power8 musl stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3358,13 +3400,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64le-power8 glibc bleeding-edge 2025.08-1"
+	bool "powerpc64le-power8 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3382,13 +3424,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
-	bool "powerpc64le-power8 glibc stable 2025.08-1"
+	bool "powerpc64le-power8 glibc stable 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3405,13 +3447,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64le-power8 musl bleeding-edge 2025.08-1"
+	bool "powerpc64le-power8 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3429,13 +3471,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
-	bool "powerpc64le-power8 musl stable 2025.08-1"
+	bool "powerpc64le-power8 musl stable 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3452,15 +3494,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
-	bool "riscv32-ilp32d glibc bleeding-edge 2025.08-1"
+	bool "riscv32-ilp32d glibc bleeding-edge 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3478,15 +3520,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
-	bool "riscv32-ilp32d glibc stable 2025.08-1"
+	bool "riscv32-ilp32d glibc stable 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3503,15 +3545,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
-	bool "riscv32-ilp32d musl bleeding-edge 2025.08-1"
+	bool "riscv32-ilp32d musl bleeding-edge 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3529,15 +3571,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
-	bool "riscv32-ilp32d musl stable 2025.08-1"
+	bool "riscv32-ilp32d musl stable 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3554,20 +3596,21 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
-	bool "riscv32-ilp32d uclibc bleeding-edge 2025.08-1"
+	bool "riscv32-ilp32d uclibc bleeding-edge 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3581,19 +3624,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
-	bool "riscv32-ilp32d uclibc stable 2025.08-1"
+	bool "riscv32-ilp32d uclibc stable 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3607,15 +3651,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d glibc bleeding-edge 2025.08-1"
+	bool "riscv64-lp64d glibc bleeding-edge 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3633,15 +3677,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
-	bool "riscv64-lp64d glibc stable 2025.08-1"
+	bool "riscv64-lp64d glibc stable 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3658,15 +3702,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
-	bool "riscv64-lp64d musl bleeding-edge 2025.08-1"
+	bool "riscv64-lp64d musl bleeding-edge 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3684,15 +3728,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
-	bool "riscv64-lp64d musl stable 2025.08-1"
+	bool "riscv64-lp64d musl stable 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3709,20 +3753,21 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d uclibc bleeding-edge 2025.08-1"
+	bool "riscv64-lp64d uclibc bleeding-edge 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3736,19 +3781,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
-	bool "riscv64-lp64d uclibc stable 2025.08-1"
+	bool "riscv64-lp64d uclibc stable 2026.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3762,13 +3808,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
-	bool "s390x-z13 glibc bleeding-edge 2025.08-1"
+	bool "s390x-z13 glibc bleeding-edge 2026.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3786,13 +3832,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
-	bool "s390x-z13 glibc stable 2025.08-1"
+	bool "s390x-z13 glibc stable 2026.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3809,13 +3855,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE
-	bool "s390x-z13 musl bleeding-edge 2025.08-1"
+	bool "s390x-z13 musl bleeding-edge 2026.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3833,13 +3879,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE
-	bool "s390x-z13 musl stable 2025.08-1"
+	bool "s390x-z13 musl stable 2026.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3855,13 +3901,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4 glibc bleeding-edge 2025.08-1"
+	bool "sh-sh4 glibc bleeding-edge 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3879,13 +3925,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
-	bool "sh-sh4 glibc stable 2025.08-1"
+	bool "sh-sh4 glibc stable 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3902,13 +3948,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
-	bool "sh-sh4 musl bleeding-edge 2025.08-1"
+	bool "sh-sh4 musl bleeding-edge 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3926,13 +3972,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
-	bool "sh-sh4 musl stable 2025.08-1"
+	bool "sh-sh4 musl stable 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3948,17 +3994,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
-	bool "sh-sh4 uclibc bleeding-edge 2025.08-1"
+	bool "sh-sh4 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3972,16 +4019,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
-	bool "sh-sh4 uclibc stable 2025.08-1"
+	bool "sh-sh4 uclibc stable 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -3995,13 +4043,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4aeb glibc bleeding-edge 2025.08-1"
+	bool "sh-sh4aeb glibc bleeding-edge 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4019,13 +4067,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
-	bool "sh-sh4aeb glibc stable 2025.08-1"
+	bool "sh-sh4aeb glibc stable 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4042,13 +4090,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
-	bool "sh-sh4aeb musl bleeding-edge 2025.08-1"
+	bool "sh-sh4aeb musl bleeding-edge 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4066,13 +4114,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
-	bool "sh-sh4aeb musl stable 2025.08-1"
+	bool "sh-sh4aeb musl stable 2026.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4088,13 +4136,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
-	bool "sparc64 glibc bleeding-edge 2025.08-1"
+	bool "sparc64 glibc bleeding-edge 2026.08-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4112,13 +4160,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
-	bool "sparc64 glibc stable 2025.08-1"
+	bool "sparc64 glibc stable 2026.08-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4135,17 +4183,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
-	bool "sparcv8 uclibc bleeding-edge 2025.08-1"
+	bool "sparcv8 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4159,16 +4208,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
-	bool "sparcv8 uclibc stable 2025.08-1"
+	bool "sparcv8 uclibc stable 2026.08-1"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4182,15 +4232,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
-	bool "x86-64 glibc bleeding-edge 2025.08-1"
+	bool "x86-64 glibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4208,15 +4258,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
-	bool "x86-64 glibc stable 2025.08-1"
+	bool "x86-64 glibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4233,15 +4283,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
-	bool "x86-64 musl bleeding-edge 2025.08-1"
+	bool "x86-64 musl bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4259,15 +4309,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
-	bool "x86-64 musl stable 2025.08-1"
+	bool "x86-64 musl stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4283,19 +4333,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
-	bool "x86-64 uclibc bleeding-edge 2025.08-1"
+	bool "x86-64 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4309,18 +4360,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
-	bool "x86-64 uclibc stable 2025.08-1"
+	bool "x86-64 uclibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4334,7 +4386,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 glibc bleeding-edge 2025.08-1"
+	bool "x86-64-v2 glibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4343,10 +4395,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4364,7 +4416,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
-	bool "x86-64-v2 glibc stable 2025.08-1"
+	bool "x86-64-v2 glibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4373,10 +4425,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4393,7 +4445,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
-	bool "x86-64-v2 musl bleeding-edge 2025.08-1"
+	bool "x86-64-v2 musl bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4402,10 +4454,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4423,7 +4475,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
-	bool "x86-64-v2 musl stable 2025.08-1"
+	bool "x86-64-v2 musl stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4432,10 +4484,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4451,7 +4503,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 uclibc bleeding-edge 2025.08-1"
+	bool "x86-64-v2 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4460,14 +4512,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4481,7 +4534,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
-	bool "x86-64-v2 uclibc stable 2025.08-1"
+	bool "x86-64-v2 uclibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4490,13 +4543,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4510,7 +4564,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 glibc bleeding-edge 2025.08-1"
+	bool "x86-64-v3 glibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4521,10 +4575,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4542,7 +4596,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
-	bool "x86-64-v3 glibc stable 2025.08-1"
+	bool "x86-64-v3 glibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4553,10 +4607,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4573,7 +4627,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
-	bool "x86-64-v3 musl bleeding-edge 2025.08-1"
+	bool "x86-64-v3 musl bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4584,10 +4638,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4605,7 +4659,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
-	bool "x86-64-v3 musl stable 2025.08-1"
+	bool "x86-64-v3 musl stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4616,10 +4670,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4635,7 +4689,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 uclibc bleeding-edge 2025.08-1"
+	bool "x86-64-v3 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4646,14 +4700,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4667,7 +4722,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
-	bool "x86-64-v3 uclibc stable 2025.08-1"
+	bool "x86-64-v3 uclibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4678,13 +4733,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4698,7 +4754,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 glibc bleeding-edge 2025.08-1"
+	bool "x86-64-v4 glibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4710,10 +4766,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4731,7 +4787,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
-	bool "x86-64-v4 glibc stable 2025.08-1"
+	bool "x86-64-v4 glibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4743,10 +4799,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4763,7 +4819,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
-	bool "x86-64-v4 musl bleeding-edge 2025.08-1"
+	bool "x86-64-v4 musl bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4775,10 +4831,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4796,7 +4852,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
-	bool "x86-64-v4 musl stable 2025.08-1"
+	bool "x86-64-v4 musl stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4808,10 +4864,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4827,7 +4883,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 uclibc bleeding-edge 2025.08-1"
+	bool "x86-64-v4 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4839,14 +4895,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4860,7 +4917,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
-	bool "x86-64-v4 uclibc stable 2025.08-1"
+	bool "x86-64-v4 uclibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4872,13 +4929,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -4892,7 +4950,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 glibc bleeding-edge 2025.08-1"
+	bool "x86-64-core-i7 glibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4901,10 +4959,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4922,7 +4980,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
-	bool "x86-64-core-i7 glibc stable 2025.08-1"
+	bool "x86-64-core-i7 glibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4931,10 +4989,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4951,7 +5009,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
-	bool "x86-64-core-i7 musl bleeding-edge 2025.08-1"
+	bool "x86-64-core-i7 musl bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4960,10 +5018,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -4981,7 +5039,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
-	bool "x86-64-core-i7 musl stable 2025.08-1"
+	bool "x86-64-core-i7 musl stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4990,10 +5048,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5010,7 +5068,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 uclibc bleeding-edge 2025.08-1"
+	bool "x86-64-core-i7 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5019,14 +5077,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -5040,7 +5099,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
-	bool "x86-64-core-i7 uclibc stable 2025.08-1"
+	bool "x86-64-core-i7 uclibc stable 2026.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5049,13 +5108,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -5069,17 +5129,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
-	bool "x86-core2 glibc bleeding-edge 2025.08-1"
+	bool "x86-core2 glibc bleeding-edge 2026.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -5097,17 +5157,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
-	bool "x86-core2 glibc stable 2025.08-1"
+	bool "x86-core2 glibc stable 2026.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5124,17 +5184,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
-	bool "x86-core2 musl bleeding-edge 2025.08-1"
+	bool "x86-core2 musl bleeding-edge 2026.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -5151,17 +5211,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
-	bool "x86-core2 musl stable 2025.08-1"
+	bool "x86-core2 musl stable 2026.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5176,21 +5236,22 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
-	bool "x86-core2 uclibc bleeding-edge 2025.08-1"
+	bool "x86-core2 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -5204,20 +5265,21 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
-	bool "x86-core2 uclibc stable 2025.08-1"
+	bool "x86-core2 uclibc stable 2026.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -5231,7 +5293,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
-	bool "x86-i686 glibc bleeding-edge 2025.08-1"
+	bool "x86-i686 glibc bleeding-edge 2026.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5241,10 +5303,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -5262,7 +5324,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
-	bool "x86-i686 glibc stable 2025.08-1"
+	bool "x86-i686 glibc stable 2026.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5272,10 +5334,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5292,7 +5354,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
-	bool "x86-i686 musl bleeding-edge 2025.08-1"
+	bool "x86-i686 musl bleeding-edge 2026.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5302,10 +5364,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -5322,7 +5384,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
-	bool "x86-i686 musl stable 2025.08-1"
+	bool "x86-i686 musl stable 2026.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5332,10 +5394,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5350,7 +5412,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
-	bool "x86-i686 uclibc bleeding-edge 2025.08-1"
+	bool "x86-i686 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5360,14 +5422,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -5381,7 +5444,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
-	bool "x86-i686 uclibc stable 2025.08-1"
+	bool "x86-i686 uclibc stable 2026.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5391,13 +5454,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -5411,19 +5475,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
-	bool "xtensa-lx60 uclibc bleeding-edge 2025.08-1"
+	bool "xtensa-lx60 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -5437,18 +5502,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
-	bool "xtensa-lx60 uclibc stable 2025.08-1"
+	bool "xtensa-lx60 uclibc stable 2026.08-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index c2a0034907..75adc26320 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -1,438 +1,438 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2025.08-1.sha256
-sha256  54875d12829a792b8d4d1c9fb1f736afc60f514b0d260616f188eafafaac7cb5  aarch64--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2025.08-1.sha256
-sha256  dfb47eee874eef9e8a7fc042eee4e0a183f444b6bcde6a82fef8f009918389c9  aarch64--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2025.08-1.sha256
-sha256  e102fe06809440bbca3b6d0d8837ffdb5122b07386d1d2ac023084d898aafe7b  aarch64--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2025.08-1.sha256
-sha256  defba831ffa1175236f137069333e21ed46d4d19feb5080a90cf248b6fc2cb08  aarch64--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  61e07fcd9e5e114e417d4c1fccf5cda5c75b1d5a1c005f848a6868ea4a0ba4e1  aarch64--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2025.08-1.sha256
-sha256  e2f636f61d9eddbb503f7c9b04db1d9000c3c9281d9943afe373a61cbf944e3a  aarch64--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2025.08-1.sha256
-sha256  9ad606eae73d7b48a1f7f658a9cd4af48916855f8fa27f7c6d0ded20ee5e9d9a  aarch64be--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2025.08-1.sha256
-sha256  4eca1a03d3d73bd31427d0f231d40a9f00a682a50c6ae5b31f6738a4675f9dd8  aarch64be--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2025.08-1.sha256
-sha256  e9152e550b0382df90ac177f9463d62ea2f7301372d71397db6205c7e7c6565a  aarch64be--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2025.08-1.sha256
-sha256  27c3196d69457ff201613eacb4764eb0f6dca8a2b56c4d4d13ee62c2fd3e18c7  aarch64be--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  d575f74461619f072bf394d784fb1e68d07cebb21ebf4ef07a40856152bffd92  aarch64be--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2025.08-1.sha256
-sha256  6d95a432130f38ddaffd04e08e2e21e3f58124e695d4c4ead7879a936d8333f9  aarch64be--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  2e38f7bcd0b7f81bfb54357b2fbd327300fb14f5977414f1f3dcb871dae5c75c  arcle-750d--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2025.08-1.sha256
-sha256  dd0fb263ec10ffd15a4743974af6509a66e705c1da1dc1a72a270702e4567be0  arcle-750d--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2025.08-1.sha256
-sha256  9f871ad3a93ce027adb66b4239396fba8da021924877f6dd0fef5ee2e7c7b9a4  arcle-hs38--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2025.08-1.sha256
-sha256  c854f2339336662b02f8f440c348e25fa98eb80eb6c78405863b9ee5baa73a79  arcle-hs38--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  99086c8f5d779f1b19c57686778793020c7bb3af527604f132e2bda252915627  arcle-hs38--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2025.08-1.sha256
-sha256  acf19ed3f1fd6b633cd4ef0e84bb5df8c20890ac4efc7312de4c00221ba7a774  arcle-hs38--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2025.08-1.sha256
-sha256  bea49b0a172d318c9eb08a568e5a94ffac0d5f320aa88625e4c8126bc0dcd1fc  armv5-eabi--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2025.08-1.sha256
-sha256  53f3d7c2b0ce32f120043bf4b338b3ea3f3375015ed63f5b382a5f62894baeec  armv5-eabi--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2025.08-1.sha256
-sha256  e8cc7d8033291da63a5390b3450c027d2722594f606d465d5303cb35186ef974  armv5-eabi--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2025.08-1.sha256
-sha256  8cdb4ad70c6b5a66427fa3315fe3ddde1c19c90232674dec59045e04d2a36cf1  armv5-eabi--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  b0a04c35aa32a5722dc4f3f73288685855b932e501bad9397a9a3da7a5a1f637  armv5-eabi--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2025.08-1.sha256
-sha256  e5415d32b39e94bf7b990ea4ead3619bf7055e338309d2cce2b6de2dd7307f12  armv5-eabi--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2025.08-1.sha256
-sha256  a9c2557e48c010361411c0c42ebacb35543ff0aa3377211be3bd049414267d16  armv6-eabihf--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2025.08-1.sha256
-sha256  062c148a62785ce583f32e2e69bb1e8fc5dbb598bf4baacce0df118de4066de8  armv6-eabihf--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2025.08-1.sha256
-sha256  4159a6456e6cf2858fc3356da135d34db489d446cea6edf943a2e6a2e342de11  armv6-eabihf--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2025.08-1.sha256
-sha256  1a283f0936953c139d7171187414839c119997ea816de201f97e79ea3cfd6947  armv6-eabihf--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  925c12a0c1c3d4e9f86b9c94947546e9c4f786c0b5cedce7e55bdd68e3aedb08  armv6-eabihf--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2025.08-1.sha256
-sha256  8977f8e657518955d685263d527aa05ea502c5cf937fff926c2e1abbe2150299  armv6-eabihf--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2025.08-1.sha256
-sha256  eed0e672d305ac08d444685b48eafb291c63387ef7916c1615354ebfb3d1ebdc  armv7-eabihf--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2025.08-1.sha256
-sha256  97d6fbaf19832002f3d6aa8fd31b2d29c1dc7b0752f4ae8ed35860fd33c1f9b4  armv7-eabihf--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2025.08-1.sha256
-sha256  d3ec56feaeb5ffcb9c953b54acfcf99d32ad16542fe9206574f5cd1d11a74b48  armv7-eabihf--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2025.08-1.sha256
-sha256  2f3a34458c3a8b961bd09f89669130fcdc4c1dbc6e31ada720527e4ad3741c11  armv7-eabihf--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  4a2c03247bc9bdedf72bdd4cd4e3f1859fb9b915a92e16fdeedbeb6d6d6b3399  armv7-eabihf--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2025.08-1.sha256
-sha256  1368328e9214ec71f0f9cea5229559fdd477e614b1e85c062fb562357b0a00ba  armv7-eabihf--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2025.08-1.sha256
-sha256  1380971b9c480a7b5ed704e33e6e5d77974ad3a1e4a3b9d525f63e150387f7a4  armebv7-eabihf--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2025.08-1.sha256
-sha256  98150dbf42927fe33a1ce51f48d13fcd83e04ba7c3d8c9ad0fc1837a3fa971ce  armebv7-eabihf--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2025.08-1.sha256
-sha256  8e724c1a763d23a5ad107ddbb77cc34e534b7aeceecbd6f9e65ee0b133b7ebeb  armebv7-eabihf--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2025.08-1.sha256
-sha256  6429155d88514c508181483616ff23ec2307af5fa24ff55e340ff9a84acbb37d  armebv7-eabihf--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  fc9fb31cf07e3bd6d1206765b93250ae44fb09c535ac182619c9d1612d926c1c  armebv7-eabihf--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2025.08-1.sha256
-sha256  e048d4a7022b07cc585c5ef0c78842479bfcddcb521734f3278acb08a9f8dc99  armebv7-eabihf--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  13ebf698a4bfcdbb41d8e619cf76fbeb15224fe7c5239436a7e9c558ed7852db  armv7m--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2025.08-1.sha256
-sha256  8024e0e353c85eb9c0a70aa258a0b6a2023e619e4d8cde082578742a80e1278c  armv7m--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--bleeding-edge-2025.08-1.sha256
-sha256  7e59552b90bf7ac1d122977d68e8a67f00e56d4aa591f0690d7d7742f611fe19  m68k-68xxx--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--stable-2025.08-1.sha256
-sha256  0ad3bde066917d3d57b05b89fd13529acd401f4bef4a2afdd0c14452d039ca77  m68k-68xxx--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--bleeding-edge-2025.08-1.sha256
-sha256  defaa92f0a236c32384b681c07511e3cdc6dc7350ee570dd79bc64427fa8380c  m68k-68xxx--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--stable-2025.08-1.sha256
-sha256  356551e95045f9f3ead162d9966ae02c914049c2512e4fbf8ea81d06edd5f2fd  m68k-68xxx--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  a6566dd60e1f483d9eda0ffb6aa881e9995ee23f9f04bdb69924462a7903a5a4  m68k-68xxx--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2025.08-1.sha256
-sha256  bd065f2539e8ac03fdbe6fbb8b94f02c73337a828e958cc8e6fe27219c0b919e  m68k-68xxx--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  7bb582b01d02d01533019e949dfbee163a45b998d9c59d08832002efc46c9642  m68k-coldfire--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2025.08-1.sha256
-sha256  ae1f50f6b274464208ebd291dbd9a6b2fa35682c16ed390eab4d8f6607006a77  m68k-coldfire--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2025.08-1.sha256
-sha256  0afdbfa599ea51e29242d2e3c2dc4e89f29e8d908ba988cee27eb51084660fda  microblazebe--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2025.08-1.sha256
-sha256  dd0851e3e95feaebac2e078b8ad49bea9a82007443808d054e09f0a10a43dcc6  microblazebe--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2025.08-1.sha256
-sha256  f4ea28fd3e6651bf3044d08abe7816046da4898ca5d7611f3102bd6103930473  microblazebe--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2025.08-1.sha256
-sha256  99c6105e256a5a928595e18496996949201479fe9ea88aadcac8036d8be6d350  microblazebe--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  15f279cf63289f88ebac16772463e49d0d18d859d3e3bfe2c6ebe07dbc2cb9b7  microblazebe--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2025.08-1.sha256
-sha256  33eb906e9620604690986767be46cd0f516dc2b425a90d97b99f0977ff209557  microblazebe--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2025.08-1.sha256
-sha256  9ce246743ac66207e76c3649a9880f5a727e46e58d5384283af8b9a369060b2f  microblazeel--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2025.08-1.sha256
-sha256  d171dcc14e21103636b4e6e9f59986303678d8a02435bde3453c3407fbe61424  microblazeel--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2025.08-1.sha256
-sha256  515adfc96b617e57d5e0b0a2d552c55e014c3ba7ea0961ec205739015804bdea  microblazeel--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2025.08-1.sha256
-sha256  85654de9dff94aa016510ef1700e90ae25ea4c74a15d9bdde3bb543d2662f09a  microblazeel--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  add7bd4c6eed777af458fe84a5716005a10859528642dd8185b0293157cf10fa  microblazeel--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2025.08-1.sha256
-sha256  8ec6f521b5ca9ecb3eb98afd0c7bba7b42ba07329d08331aabe2300d9881a3b5  microblazeel--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2025.08-1.sha256
-sha256  6594fd0af39c24e8c1dafb40b39aa7beb6d1bb51d54d525acf7088022ce9c318  mips32--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2025.08-1.sha256
-sha256  23d0f36aa7962230ef43338ba14ac2a7fa6eb68e15ef39cb9114ac711b907f70  mips32--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2025.08-1.sha256
-sha256  a0a868d17980f80d1e40f81d4caa88b72f27dbad2b7c2119521a9bcc78969abe  mips32--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2025.08-1.sha256
-sha256  35b434d3ae1a46065d9e37de56b71bcf0e72bcda652f96d185e51dbea7ef045c  mips32--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  f6b86ced93fdd4de9d97db2a30aa0545822223c7be4a5dc043aa67b05b8dbe84  mips32--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2025.08-1.sha256
-sha256  0218bfa5ef4624350e48cc372632fb4bac60db54822a56f5565d4144c180f095  mips32--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2025.08-1.sha256
-sha256  cee17e45c3c40255796b7ea80e0499aead00504ff51d0f8201ab10f18ff5e4eb  mips32el--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2025.08-1.sha256
-sha256  1085fe6b13d74205ef6e92d1d40fb3960bf6e4bad50555c723fa07416cb53c1c  mips32el--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2025.08-1.sha256
-sha256  94dc82f94e87eb143d0959b3bf9e2bdd1d6d99e51752977e5cf1f249de69e46d  mips32el--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2025.08-1.sha256
-sha256  12a5e2f50b94b5c619730914db380ce9679798fb3c7460a40d480f77bb50628f  mips32el--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  075ba385cee0a40e32dbd658a517373488536150b6e2ebb9042ff6d4450257ff  mips32el--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2025.08-1.sha256
-sha256  3911658253cf2e4b6168f0dca1511b96dae355979cbe4aa457a3bfe8116b9d97  mips32el--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2025.08-1.sha256
-sha256  5ed7b512c4b36244bfbaaccfc88b0f8cb81031ad6b709a18005ba8187d79114f  mips32r5el--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2025.08-1.sha256
-sha256  47e4a737c7f820c4f490ac7ffb54adf2c853d7a05e450ef1e6da3f44e663b487  mips32r5el--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2025.08-1.sha256
-sha256  78c2942feb0bb1ee9f19060871fc320f33856abd1d9717a5c6aa8d9e0355bf20  mips32r5el--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2025.08-1.sha256
-sha256  c68ba5c5122c8df26c96348249467d3fdb4b1405a4ef316a365c1e8c82594edc  mips32r5el--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  14f6b101aba02a4978deddd4a9dc91d84e0145bba0b2c7204e439e036ab1b684  mips32r5el--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2025.08-1.sha256
-sha256  7ce96fc3e0fe7409de3db1a205d74c0c9cbd30ad1371fb54bcee5f50cb517c72  mips32r5el--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2025.08-1.sha256
-sha256  3594f3dbc57ee3901af3c3f262969e633a57991e2b7b6ec7bd4ca6eed2b7c677  mips32r6el--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2025.08-1.sha256
-sha256  a43b136dcfc081a3c5cfe411cf9b47b7c1e8dd98d133e5afca72869e59c4794c  mips32r6el--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2025.08-1.sha256
-sha256  3a64473a8a58e71bbaa45cb0eba9b7c079f34a2e153af23fee0f90f7bfd65da4  mips32r6el--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2025.08-1.sha256
-sha256  402aaf0420e728f45ee8702d05b84519d7f423944c59942cd17f65bb4cff75d2  mips32r6el--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  f840342d1775c349476c76cb2375c036c6a2061cc34c4fe7e22b1b1fbc993cf3  mips32r6el--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2025.08-1.sha256
-sha256  1731fc7edec2e39b5040bf09e1d8212c2b9ce9fee337148324134163f265e497  mips32r6el--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2025.08-1.sha256
-sha256  fcf828be016eb08f67cdfa27caf6253bb61cb51a1ca1fff88881aa6dd8fa1771  mips64-n32--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2025.08-1.sha256
-sha256  4f6220f1ea1afe900dd0f014dedfaa7b216fb05b002bac0e5bf2377a50d198c6  mips64-n32--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2025.08-1.sha256
-sha256  ebee97042671dee23107ea950a8a828219d66f28705376d46e8d71c5c4b8aff6  mips64-n32--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2025.08-1.sha256
-sha256  e84dfee1d90952396065d2bcd0f28dac3d315bb59012b6f7568a63f3789b853c  mips64-n32--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  cc4e36fc1f959fb0529376de5a6a70f25adb822fa0db4f876e070ded82599ca3  mips64-n32--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2025.08-1.sha256
-sha256  9938c76f4a65aaa79494237597cc751479e66938375abcd8a7bdddd39f04ccd0  mips64-n32--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2025.08-1.sha256
-sha256  b2195ffc091a2ebd2027e5c06d2b68e4f294877b5352fc6b84982d9b67723a65  mips64el-n32--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2025.08-1.sha256
-sha256  3c370fb4ea2015ffe77ed69ec6af2b33bdb74be88d4ca544fe0588fed9762c7f  mips64el-n32--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2025.08-1.sha256
-sha256  cdcf1e6852326aab2f3573a669e92aafd053c3c02256d382183f0cecbad4a3d8  mips64el-n32--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2025.08-1.sha256
-sha256  772712d2f0278f53bfde0e954cc7ad01d25ac837f9c40af2f25823b28e23aaef  mips64el-n32--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  5b62273a90a887dc3e0fdc08a07ab6ec792e32d69709e5e929bb073b5ba378fe  mips64el-n32--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2025.08-1.sha256
-sha256  da101611d048cfaf3f0df98da92da091286630dfcec6a794022713c7024a94e6  mips64el-n32--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2025.08-1.sha256
-sha256  c5d55a8c3c18056faac6316bfc9d8adaf8a8b8f73bcb96477b36a56f79c5a1b6  mips64r6el-n32--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2025.08-1.sha256
-sha256  f2a449cbed813b357a1c327630d61e4e24aab33e1bccd64985e90a69e13b087a  mips64r6el-n32--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2025.08-1.sha256
-sha256  d485e5984da474bc67e72626968db9f719e07c007aa71881aa48943c484e2072  mips64r6el-n32--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2025.08-1.sha256
-sha256  7c76ef9502a9b53fb17f3c6f0604b88de9f2bf5e3dad2d73536041e6473232bd  mips64r6el-n32--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  79289935bcfaa4929daf75a86cda8025eb4227aaaa9a81b768cdd0d7c5ba7251  mips64r6el-n32--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2025.08-1.sha256
-sha256  9a2a97e1ef4b2e320e053cc9918be5a9d10f460096827ef61c378a2347ccc522  mips64r6el-n32--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2025.08-1.sha256
-sha256  87b78b6129470e687414e37dc14f025349574cf2c224047f9c1bc2f0779daaee  openrisc--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2025.08-1.sha256
-sha256  03b6e025b372970d4daf6879900b19df6fe23c9feb2c130c6743f36a48cb7d70  openrisc--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2025.08-1.sha256
-sha256  00a26576bafeccd7a4bdd7e8da649c7a8b465160c1dbade8a9b2559dc112ec0d  openrisc--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2025.08-1.sha256
-sha256  fcaa1ed86b5fddfb7c0b2e7ec507a54d4723a0468de466fbbc0331d14d37a3cc  openrisc--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  e877168c4eb637157e8dd9c4ac14de8d9492dcab8013434d9b62987014c8e534  openrisc--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2025.08-1.sha256
-sha256  c4554431ebbb615afaf12cdca0c9938ae41d77f45405e572be1ca91a52d19bd4  openrisc--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2025.08-1.sha256
-sha256  218af0ca2d46430e73e0773472d575b8e17f605df41887c12983af66438946c4  powerpc-440fp--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2025.08-1.sha256
-sha256  ff9425efff6ea7f9853fd2c0df7cf8f6c86d7a4cbd4f58605f3794e51237acfb  powerpc-440fp--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2025.08-1.sha256
-sha256  5c9f9a07aa2dbaab33289c81911eda55b7ed6f392a632df68c9d7e31b61af57a  powerpc-440fp--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2025.08-1.sha256
-sha256  5faa42457f06ded74f524074d73330f8156e53b4eb1e929069dc5df94d9a0868  powerpc-440fp--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  d4910ba94e356867bf7ae2e55e394a4419685d33c344a643ae1b8ccee3374457  powerpc-440fp--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2025.08-1.sha256
-sha256  864d99426acdccaa2787dcecffb800c502c0c5f4a344a6d2e2c609314631fbfe  powerpc-440fp--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2025.08-1.sha256
-sha256  e9da6e9ac7864b16f07bac4d2454eca41baac027aac3ff29b36c7cf21fff7373  powerpc-e300c3--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2025.08-1.sha256
-sha256  581d0441a31bff4f3a0996b824afb3fe35c6c32f543765b28a6b63a5684fc116  powerpc-e300c3--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2025.08-1.sha256
-sha256  9533c785819a5ee3d7075532de3b97cd57cd5290f2977b0de9ea5fa0174d1b02  powerpc-e300c3--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2025.08-1.sha256
-sha256  5f628b374b6857f4b4ceabe5e41b2565b07985a7e444978c87b0f864bb5a47fc  powerpc-e300c3--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  6b499b08a54ede805b3952ec2998868f1bbbf16a1ff6a3fe03a4e920bbd1786b  powerpc-e300c3--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2025.08-1.sha256
-sha256  397a57de82491dab311e0305e6c49ef7623abc8b9257333f4c41b8c854c963e2  powerpc-e300c3--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2025.08-1.sha256
-sha256  2e0e681f684d0e2ef1ecdc187dc9dcbb91f64bcc940bb0e2255c2a3bf9e25383  powerpc-e500mc--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2025.08-1.sha256
-sha256  0232c110f2e47dcab4834ab375015a1a7a19379b059c352e5a95b5578f74a0a9  powerpc-e500mc--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2025.08-1.sha256
-sha256  3901ee890ac5e3a4064cf4a6611d8bc6ec3124988c770d305830719ddfcb0065  powerpc-e500mc--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2025.08-1.sha256
-sha256  a863d426495f89a7732d7e1e8a9862854a9823c5c95ac79ea0d082f8be357e34  powerpc-e500mc--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  bf657e82026449af48b3b2c2199ac2752824ee621c8546d4619a0da0434f2024  powerpc-e500mc--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2025.08-1.sha256
-sha256  6a1e0c0a7bcbfde645a8d432711ccf2a223fde3c99a774c3938064d1ab955ef7  powerpc-e500mc--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2025.08-1.sha256
-sha256  2351cf635eed3fd47a5655fdb918807136b90d2f4f4c83e51e73af064546f9a6  powerpc64-e5500--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2025.08-1.sha256
-sha256  0334d8c2b52043abc4ca5075af22ca9192b4c624ab7d4f31c8a6e1ed48c9f167  powerpc64-e5500--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2025.08-1.sha256
-sha256  8af79b874733206e3b8ed2156c7bedf6359723370e145f8d8d51bf5ecf677bec  powerpc64-e6500--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2025.08-1.sha256
-sha256  7341a030bda89b7784d40a9d6df5725eb927fff39bf7990668bf919a9c68b65d  powerpc64-e6500--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2025.08-1.sha256
-sha256  26eaed61de5538f16cb558ac5f64a860e325891dd194687e91b01ac9069309bf  powerpc64-e6500--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2025.08-1.sha256
-sha256  2df7bf4878887c8be4daa41521bff14281bd0163f3bf15c0652ddb7f34b1d803  powerpc64-e6500--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2025.08-1.sha256
-sha256  56051f6fe8059eb5c4fa225767c816cf29c7f1de99d5dd012c671755f7f5baa2  powerpc64-power8--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2025.08-1.sha256
-sha256  5d4504754d9a1c6fe0385f4d32f83523a3c69d1e1f9926edd677139fed16e278  powerpc64-power8--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2025.08-1.sha256
-sha256  c2ee0fe6036f30e00d42758b367d1f8dba3a6fb2fd8548c8d54caccf307d8ddb  powerpc64-power8--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2025.08-1.sha256
-sha256  37b16e86732696c6d30f4ac41ac6e279567ed1014c05dc44899600a9c8ada8ab  powerpc64-power8--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2025.08-1.sha256
-sha256  c37471e3688d1a2232bd9b29bf3ba6fa833b0f683e45174d7eed36b901353392  powerpc64le-power8--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2025.08-1.sha256
-sha256  819c8dee94b1baff33943f3b01d669ea794a825e7b4cbead340ad5de8cff6baa  powerpc64le-power8--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2025.08-1.sha256
-sha256  92758192acda8f5ab17448c702af906023fc60cc7d7808cab1e5731aec3c4453  powerpc64le-power8--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2025.08-1.sha256
-sha256  c32887d632e86da99a1c4efcc4358aa803b89d0d9651df65fb9d241c8edcd6cc  powerpc64le-power8--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2025.08-1.sha256
-sha256  85befad773c292e4b356514d924eeb202c1078d3c2c6bb6ca35037f5b9ab79da  riscv32-ilp32d--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--stable-2025.08-1.sha256
-sha256  d42680e926542595c4c87629d33f5f90aac1e9a964c8955089e0514caa01b78f  riscv32-ilp32d--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--bleeding-edge-2025.08-1.sha256
-sha256  f8227ec5579f4861f9293b6aeb4c14d5e0321bfe2485e20c15fc9647e4d608df  riscv32-ilp32d--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--stable-2025.08-1.sha256
-sha256  f15e9ed67724b249eb149126eb6ed945648c3cdcd3c1c484b23c1a12df368391  riscv32-ilp32d--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  5c7f5dd0f146a575191c954459dd912d4301d4ef22dfb4a99b555bf6a5380399  riscv32-ilp32d--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--stable-2025.08-1.sha256
-sha256  48e97598eb2fdf11e9d79e4aa93fa47a3404ec2e6bbd7e84acad6579cc9fee97  riscv32-ilp32d--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2025.08-1.sha256
-sha256  4040cd45c13ff03e8daac0ef69caf4322ed10e9843914d628b315c5dc27bf9c9  riscv64-lp64d--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2025.08-1.sha256
-sha256  45209041e9ba5054aa9787c40bce0ac1e48b78528b6635b79dfb4253e1491ff0  riscv64-lp64d--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2025.08-1.sha256
-sha256  5100cea9083aa2339113a61a64f857d4c8c68981d0a973e8fa1cd918a06b4854  riscv64-lp64d--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2025.08-1.sha256
-sha256  2c5155ce133c9c8dddde8f69b0715aa07e0520d99b1fd0131d915357c6fbce39  riscv64-lp64d--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  3c99d7f2f6c705e8bdc59c3e156f14e65d23fb933c2d968a1cef70a1d4a2817c  riscv64-lp64d--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2025.08-1.sha256
-sha256  04b82356a5956ebb58e03d163e958e9201071c24481102f18ac4e18efe1dc549  riscv64-lp64d--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2025.08-1.sha256
-sha256  dbd0a4a2ce4cbdb9481baad78ed33d08fdd5ef6d660f2fb8aa4da97a0d5419a8  s390x-z13--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2025.08-1.sha256
-sha256  4e67f2751487493c2d68aab643de22a6e8cf81e6d918125b96b50eb5e02a85d5  s390x-z13--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--bleeding-edge-2025.08-1.sha256
-sha256  c7f9a94ba17985d3c5608c93b22b920f65bf1e46e465d4588dfd20c2f7393905  s390x-z13--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--stable-2025.08-1.sha256
-sha256  23f536ff2bf1a9d3b93210465471996bc7c918fbb5702a277d8e1e42ffab8559  s390x-z13--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2025.08-1.sha256
-sha256  173a40ac99693a4b41749468f8f00c26511ffb2515bef0782c6074a9aebabe21  sh-sh4--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2025.08-1.sha256
-sha256  0bf080d351d4a97a412a7068baf75e036f071de323c5e04a71be6992576f79ce  sh-sh4--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2025.08-1.sha256
-sha256  9c23e9504fedc250def212bdffd462bcbf1d0750d3914ade74ab5620e6534d23  sh-sh4--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2025.08-1.sha256
-sha256  cd08c2335b4676c3f51a8dd3b1b43cb02a8148b5c118b9c439f481ddb51bacf6  sh-sh4--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  cf2bdd8c2de851c6be0f830677abf8b8edd315fc5ab366b3450a022027b1b8d5  sh-sh4--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2025.08-1.sha256
-sha256  e8c2065017a3cd2355dcbb12773edfa6b8078e963178f047ccdfa493ccef1f6a  sh-sh4--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2025.08-1.sha256
-sha256  a06a9b61d07f78510f17def530ee428e1a0db6ab430a0cbc65d2445523995b70  sh-sh4aeb--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2025.08-1.sha256
-sha256  3816efda0e543ce8fdb22ef830df3bf8de32c8bca42122f830f2f10d2f6000de  sh-sh4aeb--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2025.08-1.sha256
-sha256  08f0f9d416214e1ef6abeaebe6f5298809895bf3575f568a76a7abadfd609b22  sh-sh4aeb--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2025.08-1.sha256
-sha256  85d562535d9f2e377086296df44b87c11cfa751c1112bdb09921cd2c11055457  sh-sh4aeb--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2025.08-1.sha256
-sha256  43cf9403feec9299a0d61d6aa0a7360dedc25187b0c5383cfb69cf2ac703be5c  sparc64--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2025.08-1.sha256
-sha256  39c2a3ec9865bcdcdc4eb77a149283d92124761bcdacda347a12dbc1d4e6eb1d  sparc64--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  0bf2103e45611de427294b51beda4ac6a404cda34622f7670534dcbc80f98d37  sparcv8--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2025.08-1.sha256
-sha256  5d099c4ecdac8e030e04e5b5139e635a9a1faa64bb77f452b33ef469f93b6e46  sparcv8--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2025.08-1.sha256
-sha256  dc986211c6a8701868277d52e8f5061ea13d119ce0d9f23b61f1b0373984479b  x86-64--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2025.08-1.sha256
-sha256  760acd5c3159448b618e237b61935335baada74fe0cdc0d7611826cb49b41c8c  x86-64--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2025.08-1.sha256
-sha256  830644a5f9c921fd8df2d40ab80dd81f03a662e5a7ad3cee20dbe2fde0de272e  x86-64--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2025.08-1.sha256
-sha256  09fca3aa89540f1b01b5f4210d488cbeb00f522044c53e9989b1dd8a38076912  x86-64--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  8afb195a0aaa5c83d539d28bb4efcd6f5a3442d02e0e48318df7f495d0749140  x86-64--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2025.08-1.sha256
-sha256  39499bcca6c50e39ed61c2afbf0b4005fc676df72b9b68fff75347439061eb2c  x86-64--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2025.08-1.sha256
-sha256  9461ecd9f2b2f99d3ac7c52d49d9491b35d732f6c8fc60c8f226e34541ed9e3d  x86-64-v2--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2025.08-1.sha256
-sha256  fcbf8a7ce1c1c5dbd8d322a54f0fa8d5e18dec7511df66032d553a0a8639a076  x86-64-v2--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2025.08-1.sha256
-sha256  edaef4802e3891f44a466a1c3cfbe84215815996fd606494fbffa9c7fdfe01fc  x86-64-v2--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2025.08-1.sha256
-sha256  d1ee83f905eaf2c4853d8102f408be0c3bf627531e71ab8fd796d94684077316  x86-64-v2--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  dbd93aa8318e1b04aa6678aea8791c781bff06cee98a9f4a300e88ebb170ce40  x86-64-v2--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2025.08-1.sha256
-sha256  d6422faad1384b3b58177149b257b814528058bba210a3fd2e70ebbc4272bfe4  x86-64-v2--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2025.08-1.sha256
-sha256  f055e7c1c5725dd4fbb7cf5d929b3c3d363a4c25c29070fc25041ba56086b2ac  x86-64-v3--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2025.08-1.sha256
-sha256  fd63f95fa5eb52ef891da434bd3deada493d78fc11e42144f02d8806d7b47504  x86-64-v3--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2025.08-1.sha256
-sha256  3f352161c60f7a0ae1784bf429b849a70862f00d5154758d48f384bfda561234  x86-64-v3--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2025.08-1.sha256
-sha256  57324b3e06559a0e03ecb0a64faf7d4996c6f8e60d82f9222c479877ff5717cb  x86-64-v3--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  99da8fd247b96495e02405879b2bed096deae97e7d426c3ef79144cd66aa52d0  x86-64-v3--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2025.08-1.sha256
-sha256  08b0b8cff1aea69bda3e88917a3c8deb3e05ec71c55c31079dc7780126f2bfb5  x86-64-v3--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2025.08-1.sha256
-sha256  de960c26eda01fd0e68c30f3041ffe1a68deb3a9d9dde57e1a7c17b3954135a0  x86-64-v4--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2025.08-1.sha256
-sha256  8f1a5623cb0a0b7814d7b87495685f5e98338f78062ea749c31648554a58ddc2  x86-64-v4--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2025.08-1.sha256
-sha256  35b38a6281f1f22c1fe5a2bdfae94dd999ad32c4e61e12c34d5ca1cd6c2b9436  x86-64-v4--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2025.08-1.sha256
-sha256  e259c0a51b4fc3c43c254a2e7446abafe38f01f00cf5d7f8f46183dd768eb223  x86-64-v4--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  ffbeb7be63eccc921d51561cfaf105b7939c0a5b71a141baf953d4ae64bfce6c  x86-64-v4--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2025.08-1.sha256
-sha256  7df276b2409c57175586b132bb058babbd724a06dddf0b3dad548ff82aa7a1f2  x86-64-v4--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2025.08-1.sha256
-sha256  3777ad89e6d60bc8fafb83b6b74284b6c56aee20ea00e51dfa466800e98dcdb9  x86-64-core-i7--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2025.08-1.sha256
-sha256  f40b098d0435485a76307347e36e8f11727d25c8f5ba09a1c048d5e9e1edb2f0  x86-64-core-i7--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2025.08-1.sha256
-sha256  a7d861e2a1575d427d9572a78e7f01ba83cc11e544255c5fac54d4a4421b4d1e  x86-64-core-i7--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2025.08-1.sha256
-sha256  780df995a9f389541f15abff72672c9b68ea86793c34b1dba16c0271a8e392d8  x86-64-core-i7--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  ac4cc4f555b04a44bb9ff6f8358720d40df50d6b894bceb49ce733ab3283faa4  x86-64-core-i7--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2025.08-1.sha256
-sha256  46166ced0ec5e8c7a5fc85ac2c732f2b26c465c00a5d4c9967ebb22eb4e0a08e  x86-64-core-i7--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2025.08-1.sha256
-sha256  517a90df28fadcaf95c10f062d7860439c2485fa68cb40a8d56c00835d7b8a39  x86-core2--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2025.08-1.sha256
-sha256  69eb5c2dfc9e1dc594feda5e5f61d60d60de830ab4390751b4f2c07b084e939f  x86-core2--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2025.08-1.sha256
-sha256  e70163fa62426347762c3a36e8cf8343086c7e4ca36e2a159b91828e3b096a69  x86-core2--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2025.08-1.sha256
-sha256  c3225387d2e30e4612066ad15d7303f352a0f55c981b8f8b32fd3bc7102be409  x86-core2--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  f65287b7c609c5fd92c10f69a1f0a088df9c15fd7aa8c6f2c9ad375f5dbaa5a0  x86-core2--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2025.08-1.sha256
-sha256  25b4d942afbdb4c4f943f93ce87de494f0308f9cfce540e650a02ff70ab0439f  x86-core2--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2025.08-1.sha256
-sha256  db558ce3aeb76d0e3f8c177f8ddd9efaeeacacfb02f1ce7491d537697eb1939e  x86-i686--glibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2025.08-1.sha256
-sha256  f9b365d7fd8f8860dfb1845ff731013550f071ca4a8de0e5074abc995296b26c  x86-i686--glibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2025.08-1.sha256
-sha256  5f8a7a097d33c33bab851b8fd43ef352a3184feb2a322584fb80a0a84cf9793f  x86-i686--musl--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2025.08-1.sha256
-sha256  3a340ebc386a057f5ddb24d8f4bbde07d2c013c99cebc02ac38565e2849bfda0  x86-i686--musl--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  dbc61fc1b20b83fb11e872276eeab42988bc01d07b063297ce7a8dcf6a965381  x86-i686--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2025.08-1.sha256
-sha256  42ae08d2440d73a9d25442b1499c0f5e3a10fd278f79439c849dbc3a0f16eb42  x86-i686--uclibc--stable-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2025.08-1.sha256
-sha256  83c13b7ea8ae433da2fe3f3fd7f723bcb692ec168e9e284534ac1999ef553197  xtensa-lx60--uclibc--bleeding-edge-2025.08-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2025.08-1.sha256
-sha256  a77b21ea3ef1b8d14a78103a645f23b5290b6ed1e8a9f95fd5eee669ffe258d2  xtensa-lx60--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2026.08-1.sha256
+sha256  7314a5ba34253ad4b1a507badb322124cc2c5ca2313c6c6b78dad9d7e76b8c80  aarch64--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2026.08-1.sha256
+sha256  0213efac9b5577f20d58de9431960a191347ffc2257b27ffe7250522bf1f7867  aarch64--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2026.08-1.sha256
+sha256  aa465cba276340e377b881dfdd1429db01d8b2f170a309ed2c25158d3b44f447  aarch64--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2026.08-1.sha256
+sha256  b388c480a48e8e9f9b99e3d14e69219c4d61e5a2424a82faecb88a015b781a60  aarch64--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  1a55bea1fb315a1898911be21f30e788b5eca74a05a915fdbd4053e63be65f3c  aarch64--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2026.08-1.sha256
+sha256  0ff5ef22c17463e9135eacddf95aa0b04e50d6328b848e488c739d0c7403da7c  aarch64--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2026.08-1.sha256
+sha256  59185391c06ec9cf016c2a775292289abe7932228529a13f544cea18516e5e95  aarch64be--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2026.08-1.sha256
+sha256  82aef57aec7bc4d0da48b5a045bef2b4d48b2d9c32f4876563009e43829476a7  aarch64be--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2026.08-1.sha256
+sha256  dd1138485683ca71d543c256295f8a2228870cc806810c71a441486157ef0b9a  aarch64be--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2026.08-1.sha256
+sha256  7b9d66ac63f409d18517bd169767572fd86d0dfd79fb1fa4f6f38d83979c5ec6  aarch64be--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  407e3efb131c1c715564d696ad9ec0adfafdb9355987217ef00b1dfc34cc39ad  aarch64be--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2026.08-1.sha256
+sha256  e240f77c33a003950e66afa56c619dfd70700194839343163f2af0c909987640  aarch64be--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  2ffcdae9e6d13222057ee4906e365e77b0d83dd3e458c2b74213e180c5db58e3  arcle-750d--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2026.08-1.sha256
+sha256  adbeae37880bc24cb0b158969235a0adf45b27214988b639e4fcac437504ef97  arcle-750d--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2026.08-1.sha256
+sha256  f89cd213a7cb643a63181efb608cab5dbd6059b71e549cdcc5fb3046ff9fcc3f  arcle-hs38--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2026.08-1.sha256
+sha256  0386bc307d39e4ce8702d01ef7039205f6b59ee766dc0edc2e8034d91caf5b2c  arcle-hs38--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  ffc8955a047d9b3c26054b7067077a931e7abf1dd7f2b6e20424d3567c5b5810  arcle-hs38--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2026.08-1.sha256
+sha256  ee36e61a30b7106092f5537ac14220db49cbc04bc5380d05aa80660494e2b76a  arcle-hs38--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2026.08-1.sha256
+sha256  77d27bd3c1b70ea90a384e74035333c9558ca387e46cda115666370e12804f80  armv5-eabi--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2026.08-1.sha256
+sha256  80165643bfcbeace9f0fd783399d1f61dcfa7b0b97d3af8f55f9ae855b4cbcec  armv5-eabi--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2026.08-1.sha256
+sha256  38b9a12163098540bd9ef2c74fd57bef5faf35e73399b27ec76090d4dda4062b  armv5-eabi--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2026.08-1.sha256
+sha256  a7db571eaa0f1ba2eea9a3932e8ad64bfaf33bfb7e7b96dd09702fe3ecedcf1a  armv5-eabi--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  c97d079476ca1c780651b3612b00bfe756a1c98901644b2e332374099a67a56f  armv5-eabi--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2026.08-1.sha256
+sha256  2e78440c4b37a9c84d6165f12fd2525e72bf88c32445e1c3400d1e01384c92ce  armv5-eabi--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2026.08-1.sha256
+sha256  9652c58ac0c0e6202ec44af6b09da232994434942436ba4aff77ade0be07f23d  armv6-eabihf--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2026.08-1.sha256
+sha256  b766622e0338afac3cc1ce000f717231b2ea9902544e27ee973be79b79caa814  armv6-eabihf--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2026.08-1.sha256
+sha256  d2836b44d850f1fd31f3b2da7c140f5a8a4ff46f265ed8b4e8c966f92867e819  armv6-eabihf--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2026.08-1.sha256
+sha256  73521cb071ef27c529c223caf5e8f157d3b87a6d862d20f3a7a01b3e0eb3139e  armv6-eabihf--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  8aa408b134889189666d729092cc27bb40f067ae8b80b9ac0c75459949f1ee23  armv6-eabihf--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2026.08-1.sha256
+sha256  0ca3810d0225de2072b9eb21ff1ac46a11e2798ad2f127891bf3d5e56d439238  armv6-eabihf--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2026.08-1.sha256
+sha256  49bfc3b120c95f8e44981c656b267ae3a378eddaf0e14998e1ed848f67490c1c  armv7-eabihf--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2026.08-1.sha256
+sha256  9b7e25a74e87dac1e05d399444295e254a3073a056101e3197a859490e5701cd  armv7-eabihf--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2026.08-1.sha256
+sha256  ec1219d12c7d63c680331589a37eba8479d3c93983d34f9f6c46fea990388742  armv7-eabihf--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2026.08-1.sha256
+sha256  9147bafae4aa272321a3c6440d04d83b7e23411b2d344f875541d84c4444ba9b  armv7-eabihf--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  caa6f93aea75849c80db27af8bcbf2e248d905fbd166809bce6422b285c73f96  armv7-eabihf--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2026.08-1.sha256
+sha256  39b1cf655c46d824158d9dae544700fa2ccdd1aa9bc20494c7cbd44170e50321  armv7-eabihf--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2026.08-1.sha256
+sha256  d4e891befb795ce2cd48d35b41ab6e3d1ade617898979540990a62dd9819067c  armebv7-eabihf--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2026.08-1.sha256
+sha256  4d93a7b26c0909ea7574e98246522cf6b77491d43a7ca7aa08ae1c29ecf07b0d  armebv7-eabihf--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2026.08-1.sha256
+sha256  0d12aa0af91469cc1b3ff1b2b3faaa4b6340ad6d6760f490ce89cb772a910928  armebv7-eabihf--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2026.08-1.sha256
+sha256  434cb1a53429b70035250a7fdd4f5d20cdc349a07a143485409460002a3f7ae5  armebv7-eabihf--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  7683df023ce8901dc5867b6ff3e28b13e8bc2a465f369fbe44392439d1f435dd  armebv7-eabihf--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2026.08-1.sha256
+sha256  0391eb162f8e8a4cbcfcd934777d340edf8019e21d671a685c61a6a53ef9c194  armebv7-eabihf--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  43d263a6847747a2a31a43192df282b7895fbf1f439a462d77f9eb75519179f1  armv7m--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2026.08-1.sha256
+sha256  51de448edea10ddb3a5a8cd4628d4f86bf84c8150774675e277419a00e23f06b  armv7m--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--bleeding-edge-2026.08-1.sha256
+sha256  eb8d701017aded5288f0e7ac25c3246d1b53bb52e3f392ccff4609b4ab61405e  m68k-68xxx--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--stable-2026.08-1.sha256
+sha256  c92f32f48cdbaf5fcc80723ef957cb062fd1dbaa6189cc93834a02d59d7082e9  m68k-68xxx--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--bleeding-edge-2026.08-1.sha256
+sha256  5ead678d8415bf7370295f632b7014bf929353d6091f62c965736606b28b1c73  m68k-68xxx--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--stable-2026.08-1.sha256
+sha256  0106d2a0ec1af1f6d80188d9a89433d6637dd28fc59d5511ff34ba87d05feab4  m68k-68xxx--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  32ae959b1de1bc809e70764546d20aa74bfef38d1f167f56935099d2bd7b5315  m68k-68xxx--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2026.08-1.sha256
+sha256  d19eabafc2fa81bb931cf7cebe867ee55946ce60815b4f799b0dd04efeb7d5b8  m68k-68xxx--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  e9a28b9c1e0befe717cec5e77bd174fb78d87b15d4e4c2ec56ac7771844a1fd8  m68k-coldfire--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2026.08-1.sha256
+sha256  331db2981e9a548fba721d84369c4d566093cbdd3097b158f92ca4e321e1cc6a  m68k-coldfire--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2026.08-1.sha256
+sha256  7ca57268d51a2e245c3f7574e1660db9a6930b67fa53e5b22f4a00cd8c8fb7b0  microblazebe--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2026.08-1.sha256
+sha256  c51a52b8ee712851b30490ffc9fe618f6ac4c1692c82cbb7226a2f89ee9a31f9  microblazebe--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2026.08-1.sha256
+sha256  1bf34ea6dab1425ae075efd53ee200e471f58565439ebd33cc9b1acdcc18a152  microblazebe--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2026.08-1.sha256
+sha256  e7ca52afacf78f748a3a097adf1de3c5d595ef2026a5002c16ceeb0965f1d946  microblazebe--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  12ea8665ec0ff1f4f72e8c4fd5100ee5dd647a1cada26b77ba4690cb279d2078  microblazebe--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2026.08-1.sha256
+sha256  1a378fcc17780477c261ff7f2687515be4c16760a77d85a95bdb16dde9509478  microblazebe--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2026.08-1.sha256
+sha256  62b4f0d2c670bcb75c32449e9ac0d368985556b5050b4f08dca27b974bdbae78  microblazeel--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2026.08-1.sha256
+sha256  3b05f0c3bff1bd3aa9f84bb285c44b25456a13c2ff36cf16f784d6790d890b68  microblazeel--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2026.08-1.sha256
+sha256  411df8ab60f53b7c26f9c6272629d287bdb82e75c89466f6e7d84d699b915fe6  microblazeel--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2026.08-1.sha256
+sha256  7883cadf05320f767479199e8bffdf3b2b27abecedd27b48543b8704fd2176b5  microblazeel--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  b798722668a7c9a400ab96f7ed4955c7ce728af11d225c392b333e177dd6a023  microblazeel--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2026.08-1.sha256
+sha256  e750424c05b178eb1805ad17063f5ab3d75ec5db1fc7f6fc8d3f3a49733d9596  microblazeel--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2026.08-1.sha256
+sha256  3ba932d26173cfaee8b69f41344f07bbb534510698a2834c1439680621fb5198  mips32--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2026.08-1.sha256
+sha256  f3d2ca00826b5cf159a0486edf8179bbe3df10eb275acf332c6c0614ff8b8500  mips32--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2026.08-1.sha256
+sha256  fd3984ee63e46c20356ef35022751113809b909177b2cf519b5909df51b6ace9  mips32--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2026.08-1.sha256
+sha256  0190387211125195f71b8397d02ccaaa15c6eb4ecbb94533d8a904065c0cc410  mips32--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  d407b883bbc366fc46b0c7a229a988589c683044bb714519fb2e7d74ee367bfb  mips32--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2026.08-1.sha256
+sha256  bc4529aec62251d2dc59215944354b571dd8a66c4cfb17a552663f50a6d9e290  mips32--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2026.08-1.sha256
+sha256  2fca4051b20d88a60a7600803e3a777710cc482cbd2e86ba7cc6e7bb1fd93ad5  mips32el--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2026.08-1.sha256
+sha256  259b97ffc97050a5373a4f2ead0f91f20a08f97eb38a5594865e7c966e1504fd  mips32el--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2026.08-1.sha256
+sha256  2671353af80f2c679ecd60c2d0a06a99f53aac9fe9fa85b102370a155fcf950c  mips32el--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2026.08-1.sha256
+sha256  e8517d51ba86699d5efaac62fc50fd9267dbdbc8b2cd3eb5b658db3582286778  mips32el--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  ab0ea27a907e97eff175e9aa4006c6ab16128ad220df4a92b66f1594607dce4a  mips32el--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2026.08-1.sha256
+sha256  b59099a368af639a1ff5fd3ba58d0d86c0ab61f1a89d13ae343a6127f2fba787  mips32el--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2026.08-1.sha256
+sha256  1f584f5f0480f326b32bb838ab7fb7873025b203c77239a7d97f3d85623c9f06  mips32r5el--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2026.08-1.sha256
+sha256  73aa4ce260b8604f7858a73874df425683a4e6ae2758c5ed275747126bf364fe  mips32r5el--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2026.08-1.sha256
+sha256  50107819cc1f40921a55040db26b41505a66886b7260758bb738c4d12be921e0  mips32r5el--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2026.08-1.sha256
+sha256  35bb199ea34d5c839f99374ed21ba81cd27fdc7c856efa76c71889cafe27200c  mips32r5el--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  28037afed3e73e021a3c4a4fc83b28937b341e467c85827e4606f22acf1f226c  mips32r5el--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2026.08-1.sha256
+sha256  8ed452f684ff37cef63693afd9dc42d9f260e91e98b1af86033cf3d19894a752  mips32r5el--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2026.08-1.sha256
+sha256  1eeceee9835587ac64958ebecd9d22dca18046570e3bd40cdde6337d30c2e987  mips32r6el--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2026.08-1.sha256
+sha256  dfb0f561343a659b3b0be8f1a68ef290d7b377ae91752111566cca57b43920ae  mips32r6el--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2026.08-1.sha256
+sha256  ac0d824e2a7a37ff02a6eb2787b21bb933b7ae1a1a97b3451f055745dee0ae46  mips32r6el--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2026.08-1.sha256
+sha256  e552c18c852d96392a9b0081579a0075124a41d0d58d0d1e1bb402124dc75d17  mips32r6el--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  9ecec726b164f96b30c3c877158949d769e2450937fe186b13e1bd108dd083de  mips32r6el--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2026.08-1.sha256
+sha256  c2a7a9ff1dc385b1f9da6166bae1bed0069f07c268a792fa789a3796d4099b31  mips32r6el--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2026.08-1.sha256
+sha256  485c8f50df6e7cd1d4fe8fcdd8ab8ce3f4c83e814b5f0a417d335cd348e6cab1  mips64-n32--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2026.08-1.sha256
+sha256  7efb02627d7312581aca68fd72fb5c67bff76515bd98f7b4d1d0dd7c88fb6ef0  mips64-n32--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2026.08-1.sha256
+sha256  3342d51c1571728b3d7fc525a56a63d3ad6b79d38ae0923866b768541bd62eae  mips64-n32--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2026.08-1.sha256
+sha256  ade9e079c841157ba6fbe8ff5c9082a800912f06cbcb50f4b1e03a26fd1ed3ba  mips64-n32--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  0a528e8b1741a9f90b5ed13b3254156448e7e52b154809cb1eda39fca4132176  mips64-n32--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2026.08-1.sha256
+sha256  9d05cfaa5ced4c313c5dc604ed69c2e6d7e641bc24e3545d993aefe287e35dd8  mips64-n32--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2026.08-1.sha256
+sha256  382a15f7719a718172ae5d77e0a8e4b19a260b21c9fc9a0ebd82d2e770b9db0d  mips64el-n32--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2026.08-1.sha256
+sha256  22f31fc2b32634d5f959d5cc449bb2000fc70420767cd7d01a64f1ad54bca515  mips64el-n32--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2026.08-1.sha256
+sha256  52058927fb8a7c45aaa0e30ed1f96e71cc1ed42b96ed0fec76fa71191d051f3c  mips64el-n32--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2026.08-1.sha256
+sha256  65b37ec87c41f65e21c4eac126a5e41cc19a60d7365b1cc1bb24cd1a0060614e  mips64el-n32--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  c9a51b32953e6bd08a52cbf80778c6e050c53958eca224b7e2409ae892276bc1  mips64el-n32--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2026.08-1.sha256
+sha256  f7a2c7dc9ec7ed2ea560be9120d79070394b4e0e212c1debedae5dd5756bfb98  mips64el-n32--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2026.08-1.sha256
+sha256  c68db668ac94d3531739eea3c4521832a6d6a2a2d08d5a89e4dd5f14f84dfecf  mips64r6el-n32--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2026.08-1.sha256
+sha256  2699c3481869e3edfe35d9f4270221d263fae3b68a74857b92ddb8fa4d3e3a90  mips64r6el-n32--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2026.08-1.sha256
+sha256  d45cd8618610e90af376c6908fc09cabb46c9f8d34065b85271824928948fc92  mips64r6el-n32--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2026.08-1.sha256
+sha256  81893ea7d37f6966de3b0cf49dfe09f9c1de90682d31731e273e314d93d622ec  mips64r6el-n32--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  4891a0c49411b2d3929851de54ec1f3d72fb78d6de5f2120c898a8feca1b506b  mips64r6el-n32--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2026.08-1.sha256
+sha256  700df3e6736bf1e32066df51d929ef8ba82727132286c646b1cecc64443a0047  mips64r6el-n32--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2026.08-1.sha256
+sha256  11e7ceb4c4605ffcad2bf739b0e0d1fa467acf4e812fdb6725070aeedf24166a  openrisc--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2026.08-1.sha256
+sha256  f94ffed1b33a028ecbadf049616ddf56c137267d8be293c1984e0eddd8d357c7  openrisc--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2026.08-1.sha256
+sha256  ea7944952ec5a89ce3f24f242d3181596cf59eebb38ef7e72c8291367988d4aa  openrisc--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2026.08-1.sha256
+sha256  5ab8ecde0742bb0e80eafeebf6bdefb3685e8832f744e286689e47ee51db955d  openrisc--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  a31c34af7fd128e246aa513823545bd58b7ac0a3441528d1aece3ae2422aecaf  openrisc--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2026.08-1.sha256
+sha256  07d38f4eb48fe46db8f10f9384fc78ab93dbe8d2e346415cccd34672c6bcf7db  openrisc--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2026.08-1.sha256
+sha256  5859da8fd05c35013e69998eff6898ade745752d766dc3676a93581a8c28e621  powerpc-440fp--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2026.08-1.sha256
+sha256  c4bf5c8ccc7bc4d3c261f50ca3769388693b00946d58a7cc3482f2b0810992c1  powerpc-440fp--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2026.08-1.sha256
+sha256  a24a5ae8be13ce337927b192c8ac6a36cf78a5c40bfafba549837c722d9b87bf  powerpc-440fp--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2026.08-1.sha256
+sha256  fa5d4f3634a3ba678ff8aa4d99b61438120ee1bc7cc6fdda99e4559eff264042  powerpc-440fp--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  5e2abc64a6949921ac5f18d566850935f44827378d3d702e8ebfdfd588f2477e  powerpc-440fp--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2026.08-1.sha256
+sha256  d7b58c4776843d545bb6b6e5b588aaf73e4dfece9a30933cd3de2d6a8c819040  powerpc-440fp--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2026.08-1.sha256
+sha256  5e4c013b621eb5144542ad897d1c2ec6423f1472e9f67ceb96855c854355f4a0  powerpc-e300c3--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2026.08-1.sha256
+sha256  623c15594a4be26c63a2090a0b3ce9efcf15809c9b9a8bfb95773240c70d8403  powerpc-e300c3--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2026.08-1.sha256
+sha256  a59e8f7a779d567c9ca7d262e22e68d6f98aa19dee20efa50f0acf3958fd1480  powerpc-e300c3--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2026.08-1.sha256
+sha256  65f2bdf7b1557bae9fa929d03546e511b1699cb8287d6776ed59da57299ca747  powerpc-e300c3--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  446417bd27dc25c35586da06c9090db8c1140243db8386b1b1fa27981cdd80d2  powerpc-e300c3--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2026.08-1.sha256
+sha256  c084ea9c4be50182847a6dfec11478f57952fbde114c68198929b83a45283264  powerpc-e300c3--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2026.08-1.sha256
+sha256  026f599908359cc5365d29fa7f8d70f43b4b31f921830c0a766843e87bde2e25  powerpc-e500mc--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2026.08-1.sha256
+sha256  8bcf4e6a518de59f76fda59b4cbc7c4f536f1bdd38fb897bb2e4cf28be0c8a7a  powerpc-e500mc--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2026.08-1.sha256
+sha256  1878f05248827fa37c701636c84383c5bccc812954bd512f2ba9dd9e5ca9968a  powerpc-e500mc--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2026.08-1.sha256
+sha256  349a979ef7714030063871293149df80b28225ae7d3d94c1029120de5cc21bd4  powerpc-e500mc--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  d3517fc47e4b9258062992f04eb9fb84238c2e4a8a39645141e3a0a415959657  powerpc-e500mc--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2026.08-1.sha256
+sha256  cc367b6332ab3504e0a63f6ac5832c62d4426aa4ff99b894cb7fb05480023b02  powerpc-e500mc--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2026.08-1.sha256
+sha256  012862374c52f64bbb6cf92c8037c5eb9bdda2e22e5a81ed6b7c780a5f373997  powerpc64-e5500--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2026.08-1.sha256
+sha256  79c677c768aeb6dadd77260d3f8fdf1f7e3d5d105b28d2b686d2b5d7e9c8c903  powerpc64-e5500--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2026.08-1.sha256
+sha256  8300546716faccc3cd3c8523c083402feb895f3ed31dda24b7a47381a09766de  powerpc64-e6500--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2026.08-1.sha256
+sha256  74f783c3a272e54736717532a4038ac047ec0f1a0ab3eeec0f4bd4f289ae16b2  powerpc64-e6500--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2026.08-1.sha256
+sha256  e8ccae936cbe793a2ff96e94b041d0172fdbcf3f6338085fd419408920e53f79  powerpc64-e6500--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2026.08-1.sha256
+sha256  ba7419f5b38125f0cdc4113b6cb8309c01ea9e5ff3bca53b45735e751162f9f6  powerpc64-e6500--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2026.08-1.sha256
+sha256  b73e86b4c639c6f73a1d8d5f26102c533f1beb1e67adb083f38ae572f64e9421  powerpc64-power8--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2026.08-1.sha256
+sha256  4ae8bd61815a5396ffd193a61e1770f113b7ba15fcc8b3dab83bcfe7eddb5e5e  powerpc64-power8--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2026.08-1.sha256
+sha256  3cafecb20bb69be7dfd38441e7c54bc59245689f60ca985f4adc16e467a5b315  powerpc64-power8--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2026.08-1.sha256
+sha256  18118fa46ced60331055e0a6ffd383bb8e0b19b0fd0431a0a5b26fa3da61184b  powerpc64-power8--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2026.08-1.sha256
+sha256  b728644f689631f90a7bd775ea41b91a630f0323edb3d6499fe8075cb4e43d1f  powerpc64le-power8--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2026.08-1.sha256
+sha256  a9d5bed14e2472d607653f5b5bb2e27079b24f350db221def03f0ebacd72927e  powerpc64le-power8--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2026.08-1.sha256
+sha256  19d91fe25cdd020ff0c87b306ede53282579e205a83b8f845ee8f7ec8df01283  powerpc64le-power8--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2026.08-1.sha256
+sha256  e4fdfc2a4d218177ea5b2972cc70099f6112c356cf35421e8a674057f8b5c4c0  powerpc64le-power8--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2026.08-1.sha256
+sha256  54d1f11a42569c4e0a471312a1d0f9fdd8961495945c826b0bf65062641a9980  riscv32-ilp32d--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--stable-2026.08-1.sha256
+sha256  716cdf72fbac22707547691c656c50f8c0011d5251668d0aa1bb72ec48083192  riscv32-ilp32d--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--bleeding-edge-2026.08-1.sha256
+sha256  3d060e9dc4b5f45650e1402e4f141a473d8e1a08c3bd72a2c0baafb3e6c2a39d  riscv32-ilp32d--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--stable-2026.08-1.sha256
+sha256  0ac6a31fcd10c67a8345c7200b20cb2ef26636b28effcb863fb9e8b398d9ff17  riscv32-ilp32d--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  255d546b16fcd16c1eb3c626e509eb7af2756a4506fbca9df468407b2795bc8f  riscv32-ilp32d--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--stable-2026.08-1.sha256
+sha256  bbdcbb034df04016e9022bd558b52fb4f7e7462e9e29d24e5cf5f987e388e2a9  riscv32-ilp32d--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2026.08-1.sha256
+sha256  5cc6eddede7a9d374d767d55dae1e76d9579a1eeb65bc19f53fab46b5a2b6f98  riscv64-lp64d--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2026.08-1.sha256
+sha256  5807565bd7af28d6be94d3e1a7da9f40d9a1875c741191a62c4c8024fd9467df  riscv64-lp64d--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2026.08-1.sha256
+sha256  f8d96c08c00141280103aaf17ed7c19ccbc9b79a35baf94ede05e7f97f37182a  riscv64-lp64d--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2026.08-1.sha256
+sha256  747286a6aec5def762a68491a884195a3a415352c76f70140e36eac48c77b73c  riscv64-lp64d--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  68e724376750eae84d1fce44b1284c91fefd62986001797628d8cb1583c09014  riscv64-lp64d--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2026.08-1.sha256
+sha256  b666baeb1c8023df1ef58df1e444beccfa64949e3d81d886a36d1b89347d0288  riscv64-lp64d--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2026.08-1.sha256
+sha256  8dace983a28a3c30fd66cb465b185a893ef5f669b51dc73475405248d0e40a1c  s390x-z13--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2026.08-1.sha256
+sha256  8ea818863d492190c3681d143c96f8aca249709699c3652bd4661ff2b6ace621  s390x-z13--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--bleeding-edge-2026.08-1.sha256
+sha256  1f7cea6804658ce4bc98946424e57b0c4d7ed844b50e59fa7e7ea5e60771ccf5  s390x-z13--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--stable-2026.08-1.sha256
+sha256  dca99e4af2b62b128bff81fc0d72a8b372e8565c6925c3693543632da9554a48  s390x-z13--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2026.08-1.sha256
+sha256  05ac6025f8d91877c50cafd33205d3aeb286f9ad7d1835874292c16f6e0635ca  sh-sh4--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2026.08-1.sha256
+sha256  3795f9f56a8fbf0d7546d4120d06820657404477c3481f2de59fba55ab58ca16  sh-sh4--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2026.08-1.sha256
+sha256  b7f84b7c9e4be4d0df37ebc05507c00826278967133c1627ba49e24c35be4ddc  sh-sh4--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2026.08-1.sha256
+sha256  7084f5e5a381d6bb2e7ddbcc831c45488fd1fae322bac8d0cea8417efecec396  sh-sh4--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  6aad485dca60eed77f5ad6273c649a35820af0d1e58a863b484f1f0e678212ee  sh-sh4--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2026.08-1.sha256
+sha256  b5d6d77f7fa7daf7f44b211b2d1ab737370cc4c17d9bb76724050f94119394ef  sh-sh4--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2026.08-1.sha256
+sha256  fdcb0b77082249346de48a4125aeb36c24268ceffa790a7765b6c93d74cb1244  sh-sh4aeb--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2026.08-1.sha256
+sha256  730876fa30925ed17bd5e23d337474c6a3ab8afafd7b35fb5e78adfc865e9e05  sh-sh4aeb--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2026.08-1.sha256
+sha256  b066500bbcd99a55dd7f6463cf325f3a1e9860d7b4749abd62110f35ab1bc843  sh-sh4aeb--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2026.08-1.sha256
+sha256  c42ff4be836af7f4888e8986982d8773f064bd7f734b6d991ab1deb1d5cb7672  sh-sh4aeb--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2026.08-1.sha256
+sha256  5494525363bf097a95c37a2f209fe52064939a0ec9aa7cc64e6b62f851bd38d8  sparc64--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2026.08-1.sha256
+sha256  cba59637a5a7507164ff73160f5c2c8970ebfce282fc33a00432c0c616de1d40  sparc64--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  bd76698478a1eb339a8a2065509b1ff40e531c538c84962b450164046fe4b23b  sparcv8--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2026.08-1.sha256
+sha256  1654a9173b8138c101facf59708ea736029ae3cca2f27fe2e084257fc8815cbb  sparcv8--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2026.08-1.sha256
+sha256  a063ac8c15c39608a80e5d99f95d23f8d48119b0fcb93a41e88997734728c360  x86-64--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2026.08-1.sha256
+sha256  cde893afab04ac7dcd15c46aac214ff550441b982536124c88a71146a0eeedd3  x86-64--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2026.08-1.sha256
+sha256  dc133b525ea545c887692b784a146e377f6b7afaed72997b7c77314cf079702b  x86-64--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2026.08-1.sha256
+sha256  78d3a4683d6ac47b5ee73bd5bce210b55eb93dff1b137c61298af97eb0d2b5a6  x86-64--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  f6e0732ee463d48108ba4c635732cd80b003a1feef8b97d6f8d94071f2d1eebc  x86-64--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2026.08-1.sha256
+sha256  744dabae2230e8c13fdf338717d9e48201c844a00792e0eed18bb406c4cf149b  x86-64--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2026.08-1.sha256
+sha256  53d9a25c300a049e56897d02e36b9becf737609b3c8e66eb1314ac8d8f51ed1d  x86-64-v2--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2026.08-1.sha256
+sha256  e9b4ac15dae9058dbc39a35953808b34c813832933f5968fda6c64f18a667667  x86-64-v2--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2026.08-1.sha256
+sha256  165b88e942c960b33c8a609f210b0b5a7167c1a1fc5ad8d4a561c3e00eb63f85  x86-64-v2--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2026.08-1.sha256
+sha256  350c86c32fb30a6e1fcdbf8146906b2c88b0e603304b23cbffb07d1fed1fd1f5  x86-64-v2--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  12cd3fc2b668b55f87b780869f24b789e7ef636bbb2f3463790c34fadcd7c0a7  x86-64-v2--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2026.08-1.sha256
+sha256  c7933b194f11043190b526a29e234dcae64ea8f1a3a5af7dba02d4dfd58e04b8  x86-64-v2--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2026.08-1.sha256
+sha256  0f3290c5f5ef8cd75cfe8b3a9f6803f10bd30dc59031d50a14e519d300a3581d  x86-64-v3--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2026.08-1.sha256
+sha256  433f5511fde952e264d474e40e008222c0b0b879c923dcdf3faf268d8d2ec45a  x86-64-v3--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2026.08-1.sha256
+sha256  c80d7f3370c1b4f2342ea52b46fd885766091c9e7520951cb8490fb213e401df  x86-64-v3--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2026.08-1.sha256
+sha256  ebfc45812a6d8e52265c15a268bb1c5dbf32ce57060a11395b5a2d0362426384  x86-64-v3--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  588156d7865d171584780851cbb36dae47f76eb72ece4751fb77daf25c84d227  x86-64-v3--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2026.08-1.sha256
+sha256  7bdc7e84b7b4c407531fce573227d49992e0f886c14db51427e125ff5efda472  x86-64-v3--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2026.08-1.sha256
+sha256  80ae5bd2ba6fba6cd5f1ee0affe475be8274f45d77ea241fefc4764bf4175c05  x86-64-v4--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2026.08-1.sha256
+sha256  c9d2c852d94a3ddb81c4ab8595857fb2305f1b954f10c6ff3a3a16dcd72f4507  x86-64-v4--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2026.08-1.sha256
+sha256  70b0180e66471329aff6e62080c228f1c59595f6b9a515bc5e3fdf04990239c0  x86-64-v4--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2026.08-1.sha256
+sha256  41d13c7341b64a0aaf2583de661743fde1168787af485e843771a2e8db94be05  x86-64-v4--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  e1b2516119ff835d277a96ee68f0de16c30c8e6c5cfe283f54c29a1dc4d0e841  x86-64-v4--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2026.08-1.sha256
+sha256  7cb8e738a03a1d9f1b87cf965863d87cb0d2f73b8550a8cc86099d3d3eaecfd8  x86-64-v4--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2026.08-1.sha256
+sha256  14acf90e0d8e8149a9845f536745a609e1fb63d6d3f75b3e1aaa8f7fe334b432  x86-64-core-i7--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2026.08-1.sha256
+sha256  154d14496896fb2d016fa338bcddd205055f6964d10e85721b338c1587c8dc36  x86-64-core-i7--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2026.08-1.sha256
+sha256  169d75c852f310b0c6bf87049dc491b22536a5d8b511acbcdc4b9e7c019402a6  x86-64-core-i7--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2026.08-1.sha256
+sha256  f2f3311e978481e9c6f574a46bbd0bca5c7fa9696c15db3f20ded6b80b25f7b1  x86-64-core-i7--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  c4aafd5fba7cdf214849243756198610bcdd02846837b844662b3ede893cb7cc  x86-64-core-i7--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2026.08-1.sha256
+sha256  de1f3cc9810c5f0b9e4532e0f14fc80ae8ea777a9f0cbd345f66f74d5094d09b  x86-64-core-i7--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2026.08-1.sha256
+sha256  48420fcf266ada9d65944901aa1431bf086af15d98f382a3ba12d9d6a8ddea89  x86-core2--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2026.08-1.sha256
+sha256  be0c5832feafdb1792040375bc30a3525dfe7975d02690563ddae4f2f909a927  x86-core2--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2026.08-1.sha256
+sha256  b0588e6cb050ba3c396d8a652eab4634db4fc7aa26b3700797053b725aaba2d0  x86-core2--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2026.08-1.sha256
+sha256  91357ce133ddb3ada2f867e0f900509ac5508d8a3794e3f9df26a679b427d9f0  x86-core2--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  353d49012d66bedbc8e83bb4394749b906c58de3d45290e05725e028dd4f5f9a  x86-core2--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2026.08-1.sha256
+sha256  990fec29496ba458bd9829d39a0b93636d61921df3ba13e04a63f0b7523cb214  x86-core2--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2026.08-1.sha256
+sha256  fa86d62e3a62dd20512392a0a8a02f0f5c6700e9a29d21675b47c936f02dcbbb  x86-i686--glibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2026.08-1.sha256
+sha256  33809234a5cf466b2d438980c26b952fb8c58c89d1877232abae9cb096756644  x86-i686--glibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2026.08-1.sha256
+sha256  18bc85d9fedf50c0b612dee92d8ebb0203a927f6fef9d46a216b705ace892c42  x86-i686--musl--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2026.08-1.sha256
+sha256  72f5e80c6d5b47eac20d63634b56d49600600230bbb33c621f83250a9d6b3cb4  x86-i686--musl--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  639c9962ef4c9dc6e6df6518fdeefbfcf2a987ae35b9ee6b10b1cc8a3008b92d  x86-i686--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2026.08-1.sha256
+sha256  53021b5d9ec5c895e3e087a80a3ca6f9a1533b2a24b5c5a94331b4b47b7ca300  x86-i686--uclibc--stable-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2026.08-1.sha256
+sha256  80ad3ffaeb0194afcfc62b8b828545be1a0cc766169ad4eab6cd9f47b84d26f5  xtensa-lx60--uclibc--bleeding-edge-2026.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2026.08-1.sha256
+sha256  9a67deec92245f785625a68f904edff3c1d7365f7de8f90fb20018f7b6e42b96  xtensa-lx60--uclibc--stable-2026.08-1.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 7087e2cadf..078548a2f8 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -7,1309 +7,1309 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2026.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
