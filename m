Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEFFEE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 14:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3276410C7;
	Mon, 21 Aug 2023 14:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3276410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjRovI2KduDR; Mon, 21 Aug 2023 14:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C993D414DE;
	Mon, 21 Aug 2023 14:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C993D414DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 826E81BF3E8
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 14:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31EDC81E8B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 14:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31EDC81E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMtK5CDiKNT1 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 14:22:27 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6579D81CE9
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 14:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6579D81CE9
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BC6253520BD8; Mon, 21 Aug 2023 16:22:24 +0200 (CEST)
Date: Mon, 21 Aug 2023 16:22:24 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZONzIHca509hXEbx@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692627745; bh=9K3vUwu5Sf+L9kc7KXec49rZZeK7NlCWv70uQUcSwno=;
 h=Date:From:To:Subject:From;
 b=rgMYUow+B7bKHoNXcgqFstiZiSaVKLPNDgOZY6Odk0M7YKJX1XRuA8uPxjsvYYQ+9
 9zgeYBZsuIxvtyc389WGxvR7+OKP0T/vnvKWi6O+1QepGyJ9MDJnvyvJkS0ElwzSxj
 w5vM76rWSsM+gwAsLR84e8fTru0dG8OZ137UvWyBgAa0DYOF/14tsDA2av0EWwZiHt
 XowK2k8zT3q2D4H8ih45ah+l0q1P42ChZZqCpNiYGo7JeoIyUBJ5oSOFqMSZFGlX1Z
 ujvtufM3uy/F4VyJKwLhVzMrwf4pN0JBxNQwcGG7gXxsBfAMZnWC/H4WTt84KGr/gA
 Emm5P0y9U0SlA==
Subject: [Buildroot] [PATCH] package/gmp: bump version to 6.3.0
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

See the Changelog here:
https://gmplib.org/gmp6.3

Patch is applied upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                           |  1 -
 ...z-inp_raw.c-Avoid-bit-size-overflows.patch | 27 -------------------
 package/gmp/gmp.hash                          |  2 +-
 package/gmp/gmp.mk                            |  2 +-
 4 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index e5c06b1e0a..7dce7bc3d7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -526,7 +526,6 @@ package/gli/0001-Optional-building-tests.patch Upstream
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
index 9b402767fd..cb2b6b9be9 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
