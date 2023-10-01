Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEE8E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4302400DC;
	Sun,  1 Oct 2023 14:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4302400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEtJylfvLQpT; Sun,  1 Oct 2023 14:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4DDB40129;
	Sun,  1 Oct 2023 14:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4DDB40129
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0869E1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A390A82084
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A390A82084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9f15TXz0Rpo for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:09:18 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01FBD82082
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01FBD82082
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6B6233520D2D; Sun,  1 Oct 2023 16:09:14 +0200 (CEST)
Date: Sun, 1 Oct 2023 16:09:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZRl9ikAM2+k82PiI@waldemar-brodkorb.de>
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
 <20221217051337.3778405-5-Mr.Bossman075@gmail.com>
 <603887d9-3c48-b7de-3e5d-a472e6c08ed2@smile.fr>
 <ZRlajuI6BnIemOoO@waldemar-brodkorb.de>
 <3f01b947-21f8-d573-a8fe-b7ca6d044170@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ARPFnjOPhPxQE4af"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f01b947-21f8-d573-a8fe-b7ca6d044170@smile.fr>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1696169354; bh=JCx+2hUG5Amo1guwuIIpM906sGpGYcw+5Temqg4WSJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbgsmKsIQ0FZiYPACmoolY/AFzJvdICV0taT0WdFJ20qaeMos4J+Z4zu+gsNN6cT4
 v3YVnPImSWZGdr/9lcbfB3PZ1TFf8+Dy76w5wmH7xaS3H5UaF7tFSnJKVsAlMpAZy0
 VV92KRnsPbaFM2jq7qE1+Oj2semgbGWP3T2OB/BU9YeVhDz7AdfLWYHUT4ccREtSna
 PNF9xII7QHMPoejUBiygzsjZPdWV1zoa6/8paIMOOCCg8QKlxHNaxcN5msaFsfW8eQ
 QHD1KXZEsYKpy0zmRMdQ4ZkQsY83jQM39HEnPmGhqxmGTHR0shEdzhjGwGp3IyDzZR
 agZf4N9G1jVqQ==
Subject: Re: [Buildroot] [PATCH v2 4/4]
 configs/qemu_riscv32_nommu_virt_defconfig: New defconfig
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <mr.bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--ARPFnjOPhPxQE4af
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Romain,
Romain Naour wrote,

> Hi Waldemar,
> 
> Le 01/10/2023 à 13:39, Waldemar Brodkorb a écrit :
> > Hi Romain,
> > 
> > Romain Naour wrote,
> > 
> >> Hello,
> >>
> >> Le 17/12/2022 à 06:13, Jesse Taube a écrit :
> >>> Add RISC-V 32-bit nommu defconfig for QEMU virt machine with MMU
> >>> disabled.
> >>>
> >>> Unlike qemu_riscv32_virt, qemu_riscv32_nommu_virt does not use OpenSBI,
> >>> since the kernel is running in machine mode (M-mode).
> >>>
> >>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> >>> Cc: Yimin Gu <ustcymgu@gmail.com>
> >>
> >> I rebased the elf2flt patch for risc32 [1] on top of elf2flt 2023.09 release,
> >> then I enabled the risc32 uclibc-ng support [2] without patching it since we use
> >> the latest release (v1.0.44) containing this commit [3].
> >>
> >> But the system doesn't boot due to a reloc issue:
> >>
> >> binfmt_flat: reloc outside program 0xfff7b6dc (0 - 0x9cec0/0x8a180), killing sh!
> >> Starting init: /bin/sh exists but couldn't execute it (error -8)
> >>
> >> This issue may be related to the toolchain used to build this defconfig (gcc
> >> 12.3.0 and binutils 2.40) that is newer than the toolchain used at the time this
> >> series was tested.
> > 
> > Can you share your elf2flt patch, please. 
> 
> Sure, It the initial patch from Jesse Taube but without the relocation part that
> was part of riscv64 commit:
> 
> https://github.com/uclinux-dev/elf2flt/commit/c5c8043c4d79a1cdd9bd359a542e6fdf3b04d5a1
> 
> I hope this can help.

See attached patch I am using, there is one change missing in your
patch.

best regards
 Waldemar

--ARPFnjOPhPxQE4af
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0001-riscv32.patch"

diff -Nur elf2flt-v2023.04.orig/elf2flt.c elf2flt-v2023.04/elf2flt.c
--- elf2flt-v2023.04.orig/elf2flt.c	2023-09-04 11:29:05.952417209 +0200
+++ elf2flt-v2023.04/elf2flt.c	2023-09-04 11:30:05.371065966 +0200
@@ -81,7 +81,7 @@
 #include <elf/v850.h>
 #elif defined(TARGET_xtensa)
 #include <elf/xtensa.h>
-#elif defined(TARGET_riscv64)
+#elif defined(TARGET_riscv64) || defined(TARGET_riscv32)
 #include <elf/riscv.h>
 #endif
 
@@ -127,6 +127,8 @@
 #define ARCH	"xtensa"
 #elif defined(TARGET_riscv64)
 #define ARCH	"riscv64"
+#elif defined(TARGET_riscv32)
+#define ARCH	"riscv32"
 #else
 #error "Don't know how to support your CPU architecture??"
 #endif
@@ -822,7 +824,7 @@
 					goto good_32bit_resolved_reloc_update_text;
 				default:
 					goto bad_resolved_reloc;
-#elif defined(TARGET_riscv64)
+#elif defined(TARGET_riscv64) || defined(TARGET_riscv32)
 				case R_RISCV_NONE:
 				case R_RISCV_32_PCREL:
 				case R_RISCV_ADD8:
diff -Nur elf2flt-v2023.04.orig/ld-elf2flt.c elf2flt-v2023.04/ld-elf2flt.c
--- elf2flt-v2023.04.orig/ld-elf2flt.c	2023-09-04 11:28:59.072573514 +0200
+++ elf2flt-v2023.04/ld-elf2flt.c	2023-09-04 11:29:32.507813592 +0200
@@ -327,7 +327,7 @@
 	/* riscv adds a global pointer symbol to the linker file with the
 	   "RISCV_GP:" prefix. Remove the prefix for riscv64 architecture and
 	   the entire line for other architectures. */
-	if (streq(TARGET_CPU, "riscv64"))
+	if (streq(TARGET_CPU, "riscv64") || streq(TARGET_CPU, "riscv32"))
 		append_sed(&sed, "^RISCV_GP:", "");
 	else
 		append_sed(&sed, "^RISCV_GP:", NULL);

--ARPFnjOPhPxQE4af
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--ARPFnjOPhPxQE4af--
