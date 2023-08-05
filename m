Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F738C00528
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209ED4069B;
	Sat,  5 Aug 2023 22:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209ED4069B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e32HrX-ccYNV; Sat,  5 Aug 2023 22:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C4794092B;
	Sat,  5 Aug 2023 22:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4794092B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32D911BF85D
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFD6760E58
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD6760E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMYWs5CYVftU for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:26:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6C4B60B23
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6C4B60B23
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D290D8425D; Sat,  5 Aug 2023 22:26:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Aug 2023 23:59:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a5a7de82f37c5b6997894f51aff50593b6081cfa
X-Git-Newrev: 09c4a7a35fb0e82f24399dea4507e47242eee27b
X-Patchwork-Hint: ignore
Message-Id: <20230805222637.D290D8425D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gmp: bump version to
 6.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09c4a7a35fb0e82f24399dea4507e47242eee27b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch which is included in this release.

Release notes:
https://gmplib.org/list-archives/gmp-announce/2023-July/000050.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...01-mpz-inp_raw.c-Avoid-bit-size-overflows.patch | 27 ----------------------
 package/gmp/gmp.hash                               |  2 +-
 package/gmp/gmp.mk                                 |  5 +---
 4 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f846cc7a87..3a9329ab71 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -536,7 +536,6 @@ package/gli/0001-Optional-building-tests.patch Upstream
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
