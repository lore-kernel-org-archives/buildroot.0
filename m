Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685ABC001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FDE160009;
	Sat,  5 Aug 2023 21:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FDE160009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Omj4fIGLh9DB; Sat,  5 Aug 2023 21:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3836060899;
	Sat,  5 Aug 2023 21:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3836060899
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32A421BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDD2440449
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD2440449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03ScECMDruIn for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:33:30 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFAD3400C6
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFAD3400C6
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5C4EA4C00C6
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 23:33:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41934)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSOtq-0000YK-1O
 for buildroot@buildroot.org; Sat, 05 Aug 2023 23:33:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:33:26 +0200
Message-Id: <20230805213326.3588196-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691271206;
 bh=qAv5eHekT+JkCnHpwe0omN4GcEjAlH8qOU4ASyA3fq8=;
 h=From:To:Subject:Date:From;
 b=LNSTqatOy4fVgpPk1rLQM/GxsHe1v4kyUMzJ4h37J614XOv2TkGNpnQv4Vc19yPBR
 puIP4B2auFyAWcJVPj1Gxv5n1iFifHTR7EFf/Q+LXZWh6l30irZFMb/eQtnWspus4m
 uDOBz4HdSFOtUDu7xJWt4z4OJnZSB/vbMISMd2YD6wq9zXJVG8eBhi8XKkZnQik00Z
 0xZgXa1dY7AL2T4PKzy3OV53zorEy+C+XaVFdpQR66kNJ29FhuVqEUhIuKc+d4wJ4b
 at8Ru7JxIiPOiFxP4a5QqbkcqytUjIJH44PZDDELDKMeTielLFEYkajMzWQvINTYKa
 oF2427s6TS7rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=LNSTqatO
Subject: [Buildroot] [PATCH 1/1] package/gmp: bump version to 6.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Release notes:
https://gmplib.org/list-archives/gmp-announce/2023-July/000050.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...z-inp_raw.c-Avoid-bit-size-overflows.patch | 27 -------------------
 package/gmp/gmp.hash                          |  2 +-
 package/gmp/gmp.mk                            |  5 +---
 4 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index ff884081eb..8d5e291e8b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -534,7 +534,6 @@ package/gli/0001-Optional-building-tests.patch Upstream
 package/glog/0001-added-emscripten-support.patch Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
-package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch Upstream
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch Upstream
diff --git a/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch b/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
deleted file mode 100644
index 0003f342c3..0000000000
--- a/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-# HG changeset patch
-# User Marco Bodrato <bodrato@mail.dm.unipi.it>
-# Date 1634836009 -7200
-# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
-# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
-mpz/inp_raw.c: Avoid bit size overflows
-
-[Retrieved from: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
---- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
-+++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
-@@ -88,8 +88,11 @@
- 
-   abs_csize = ABS (csize);
- 
-+  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
-+    return 0; /* Bit size overflows */
-+
-   /* round up to a multiple of limbs */
--  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
-+  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
- 
-   if (abs_xsize != 0)
-     {
-
diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
index d55e312bbb..8c8b4d1151 100644
--- a/package/gmp/gmp.hash
+++ b/package/gmp/gmp.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2  gmp-6.2.1.tar.xz
+sha256  a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898  gmp-6.3.0.tar.xz
 
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 9b402767fd..c52a5214a6 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMP_VERSION = 6.2.1
+GMP_VERSION = 6.3.0
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
@@ -14,9 +14,6 @@ GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
-# 0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
-GMP_IGNORE_CVES += CVE-2021-43618
-
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
 ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
