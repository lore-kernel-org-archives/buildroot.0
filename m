Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55425EE4996
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 03:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76D081FFB;
	Sat, 19 Aug 2023 03:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A76D081FFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WcSI6mGR6fO; Sat, 19 Aug 2023 03:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F4A8202D;
	Sat, 19 Aug 2023 03:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F4A8202D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 505C51BF299
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 03:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33EAF420E6
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 03:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33EAF420E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7NHqh9Jap2p for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 03:08:53 +0000 (UTC)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC912420E5
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 03:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC912420E5
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-76d9a79e2fdso14388085a.1
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 20:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692414531; x=1693019331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ua4LGdHFt7y5YYo9x5oilaw0mdIl9n867cZc12yjTYA=;
 b=UlJlTltWEgvSMhaNfQ+PdG9jWUJIX+5bLTlX4ruimsnJBaOoiSxnvLGBkxiOF0RJQL
 gGcsNG09mPuLU6RpdxlokfS/Z8/ge6NZsheE+QaBDnvBz2XFXvI8V2PVJcSYhqVqPTWD
 3xjTs6k51UYOsDlSm+0D6/naSjXsvsfgN/fq2iDDAHXQc3OOk3Lmk4RqjFHpGvstSj/q
 YBzm/So/Om3dDOjN5convBRvlbbOO8NT0UEJiYyE55UGwFG0f8sHX1Ipm+IxQs41CC2b
 ZSvr+rKRCsmQ7y4aLOmDdfrOev/AfEcimTyP4sZurJHkUzk55cNIFfKh3XC1HUW5P9nF
 XFNQ==
X-Gm-Message-State: AOJu0YwCiLNoBuFkVxNGeIcuNH6oEh5govRu8xI92mHRKVqG9IwJvq5n
 URpTGyhlOX9T7fzJG2RlIFFrLKbL4qY=
X-Google-Smtp-Source: AGHT+IHy4k7nSZKXb2CVZov2b7gRrL1WSs3Wj5PtoWSZBNU/zJcELu+KaKwivKMdgJC9umeveLRV+Q==
X-Received: by 2002:a05:620a:e96:b0:766:8b00:940b with SMTP id
 w22-20020a05620a0e9600b007668b00940bmr1024837qkm.48.1692414531118; 
 Fri, 18 Aug 2023 20:08:51 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 ([2600:4040:57a3:100:f24a:f408:75e7:7e13])
 by smtp.gmail.com with ESMTPSA id
 x13-20020ae9f80d000000b007339c5114a9sm929738qkh.103.2023.08.18.20.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 20:08:50 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 23:08:49 -0400
Message-Id: <20230819030849.3966233-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692414531; x=1693019331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ua4LGdHFt7y5YYo9x5oilaw0mdIl9n867cZc12yjTYA=;
 b=hYOf9+pZ3/WfTymRwmZpHnhOsnf07MYi4nd96shxrh5TqfX0C4Tvx74lxu3sjmMdwM
 BorUXArExF14xw7H+Gd/mdFjiLSUZalnKeX+fV+Jpj8cCheYY/NnuWrvXJ0ilvsauzMR
 aqpvR3hgng/izSkp3zr7hYpKEvzuJVxsteVmDYyRTqgZsOx/30BT1MyizvC+uOGnBQIW
 9FO1aj+5fIDCHyC6Pss+GOTdLlzudBzct5/e8ciuyh7yk7v12PNtpznBUoSPXl3xGwty
 4InQ2SAfJfVPSSj2M+XrhDMEB6Mvd85SYhb+YTPDRRqMdxB8LZC6YENPEUEJeutuBjO6
 +UNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hYOf9+pZ
Subject: [Buildroot] [PATCH] package/elf2flt: Fix build by updating to
 v2023.04
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Mr.Bossman075@gmail.com, Greg Ungerer <gerg@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In elf2flt Greg Ungerer committed "elf2flt: remove use of BFD_VMA_FMT":

"In binutils-2.40 the BFD_VMA_FMT definition used for printf style
formatting specifiers has been removed. For reference this was done in
commit b82817674f46 ("Don't use BFD_VMA_FMT in binutils") in the
binutils git development tree.

BFD_VMA_FMT is used in a number of places in the elf2flt code to output
bfd offsets, values and the like. So it is broken when using the bfd
code from binutils-2.40 and newer.

According to the binutils change PRIx64 (and friends) is used to replace
it, with appropriate casts to keep it clean for 32 and 64 bit platforms.
Change the elf2flt.c use of it in the same way to fix."

This patch updates elf2flt to version v2023.04, and rebases all the
Buildroot patches.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
Commit elf2flt-handle-binutils-2.34 was added in v2023.04
Unfortunately "elf2flt.ld: reinstate 32 byte alignment for .data section"
and "elf2flt: fix fatal error regression on m68k, xtensa, riscv64"
did not merge cleanly, but the second seems to be implemented in a different
way in v2023.04.

If bumping the version is not an option we can add Greg's patch here or add
+	--disable-werror CFLAGS='-DBFD_VMA_FMT=PRIx64'
to elf2flt.mk to allow building with binutils-2.40.
---
 .../0001-elf2flt-handle-binutils-2.34.patch   | 377 ------------------
 ...ate-32-byte-alignment-for-.data-sec.patch} |  20 +-
 ...2-elf2flt-add-riscv-64-bits-support.patch} |  12 +-
 ...=> 0003-xtensa-fix-text-relocations.patch} |  10 +-
 ...2flt-create-a-common-helper-function.patch |  76 ----
 ...l-error-regression-on-m68k-xtensa-ri.patch |  74 ----
 package/elf2flt/elf2flt.hash                  |   2 +-
 package/elf2flt/elf2flt.mk                    |   5 +-
 8 files changed, 21 insertions(+), 555 deletions(-)
 delete mode 100644 package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
 rename package/elf2flt/{0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch => 0001-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch} (88%)
 rename package/elf2flt/{0003-elf2flt-add-riscv-64-bits-support.patch => 0002-elf2flt-add-riscv-64-bits-support.patch} (93%)
 rename package/elf2flt/{0006-elf2flt-xtensa-fix-text-relocations.patch => 0003-xtensa-fix-text-relocations.patch} (88%)
 delete mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
 delete mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch

diff --git a/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
deleted file mode 100644
index 4aa473c244..0000000000
--- a/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
+++ /dev/null
@@ -1,377 +0,0 @@
-From d78acba6510527aaa01a41eaf4c931f7a57e5f44 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Wed, 5 Feb 2020 10:31:32 +0100
-Subject: [PATCH] elf2flt: handle binutils >= 2.34
-
-The latest Binutils release (2.34) is not compatible with elf2flt due
-to a change in bfd_section_* macros [1]. The issue has been reported
-to the Binutils mailing list but Alan Modra recommend to bundle
-libbfd library sources into each projects using it [2]. That's
-because the API is not stable over the time without any backward
-compatibility guaranties.
-
-On the other hand, the elf2flt tools needs to support modified
-version of binutils for specific arch/target [3].
-
-Add two tests in the configure script to detect this API change
-in order to support binutils < 2.34 and binutils >= 2.34.
-
-Upstream status: [4]
-
-[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=fd3619828e94a24a92cddec42cbc0ab33352eeb4
-[2] https://sourceware.org/ml/binutils/2020-02/msg00044.html
-[3] https://github.com/uclinux-dev/elf2flt/issues/14
-[4] https://github.com/uclinux-dev/elf2flt/pull/15
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- configure.ac | 16 +++++++++++
- elf2flt.c    | 81 +++++++++++++++++++++++++++++-----------------------
- 2 files changed, 61 insertions(+), 36 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b7db2cb..fdc0876 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -229,6 +229,22 @@ AC_CHECK_FUNCS([ \
- 	strsignal \
- ])
- 
-+dnl Various bfd section macros and functions like bfd_section_size() have been
-+dnl modified starting with binutils >= 2.34.
-+dnl Check if the prototypes take a bfd argument.
-+if test "$binutils_build_dir" != "NONE"; then
-+    CFLAGS="-I$binutils_include_dir -I$bfd_include_dir $CFLAGS"
-+fi
-+
-+AC_TRY_COMPILE([#include <bfd.h>],
-+ [const asection *sec; bfd_section_size(sec);],
-+ bfd_section_api_takes_bfd=no,
-+ bfd_section_api_takes_bfd=yes)
-+if test "$bfd_section_api_takes_bfd" = "yes" ; then
-+  AC_DEFINE(HAVE_BFD_SECTION_API_TAKES_BFD, 1,
-+   [define to 1 for binutils < 2.34])
-+fi
-+
- if test "$GCC" = yes ; then
- 	CFLAGS="-Wall $CFLAGS"
- 	if test "$werror" = 1 ; then
-diff --git a/elf2flt.c b/elf2flt.c
-index 7ac0617..ea6b5a1 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -149,6 +149,17 @@ const char *elf2flt_progname;
- #define O_BINARY 0
- #endif
- 
-+/*
-+ * The bfd parameter isn't actually used by any of the bfd_section funcs and
-+ * have been removed since binutils 2.34.
-+ */
-+#ifdef HAVE_BFD_SECTION_API_TAKES_BFD
-+#define elf2flt_bfd_section_size(s) bfd_section_size(NULL, s)
-+#define elf2flt_bfd_section_vma(s)  bfd_section_vma(NULL, s)
-+#else
-+#define elf2flt_bfd_section_size(s) bfd_section_size(s)
-+#define elf2flt_bfd_section_vma(s)  bfd_section_vma(s)
-+#endif
- 
- /* Extra output when running.  */
- static int verbose = 0;
-@@ -323,10 +334,8 @@ compare_relocs (const void *pa, const void *pb)
- 	else if (!rb->sym_ptr_ptr || !*rb->sym_ptr_ptr)
- 		return 1;
- 
--	a_vma = bfd_section_vma(compare_relocs_bfd,
--				(*(ra->sym_ptr_ptr))->section);
--	b_vma = bfd_section_vma(compare_relocs_bfd,
--				(*(rb->sym_ptr_ptr))->section);
-+	a_vma = elf2flt_bfd_section_vma((*(ra->sym_ptr_ptr))->section);
-+	b_vma = elf2flt_bfd_section_vma((*(rb->sym_ptr_ptr))->section);
- 	va = (*(ra->sym_ptr_ptr))->value + a_vma + ra->addend;
- 	vb = (*(rb->sym_ptr_ptr))->value + b_vma + rb->addend;
- 	return va - vb;
-@@ -403,7 +412,7 @@ output_relocs (
-   }
- 
-   for (a = abs_bfd->sections; (a != (asection *) NULL); a = a->next) {
--  	section_vma = bfd_section_vma(abs_bfd, a);
-+	section_vma = elf2flt_bfd_section_vma(a);
- 
- 	if (verbose)
- 		printf("SECTION: %s [%p]: flags=0x%x vma=0x%"PRIx32"\n",
-@@ -443,7 +452,7 @@ output_relocs (
- 	  continue;
- 	if (verbose)
- 	  printf(" RELOCS: %s [%p]: flags=0x%x vma=0x%"BFD_VMA_FMT"x\n",
--			r->name, r, r->flags, bfd_section_vma(abs_bfd, r));
-+			r->name, r, r->flags, elf2flt_bfd_section_vma(r));
-   	if ((r->flags & SEC_RELOC) == 0)
-   	  continue;
- 	relsize = bfd_get_reloc_upper_bound(rel_bfd, r);
-@@ -695,7 +704,7 @@ output_relocs (
- 				case R_BFIN_RIMM16:
- 				case R_BFIN_LUIMM16:
- 				case R_BFIN_HUIMM16:
--				    sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+				    sym_vma = elf2flt_bfd_section_vma(sym_section);
- 				    sym_addr += sym_vma + q->addend;
- 
- 				    if (weak_und_symbol(sym_section->name, (*(q->sym_ptr_ptr))))
-@@ -728,7 +737,7 @@ output_relocs (
- 				    break;
- 
- 				case R_BFIN_BYTE4_DATA:
--				    sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+				    sym_vma = elf2flt_bfd_section_vma(sym_section);
- 				    sym_addr += sym_vma + q->addend;
- 
- 				    if (weak_und_symbol (sym_section->name, (*(q->sym_ptr_ptr))))
-@@ -886,7 +895,7 @@ output_relocs (
- #if defined(TARGET_m68k)
- 				case R_68K_32:
- 					relocation_needed = 1;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					break;
- 				case R_68K_PC16:
-@@ -911,7 +920,7 @@ output_relocs (
- 							q->address, sym_addr,
- 							(*p)->howto->rightshift,
- 							*(uint32_t *)r_mem);
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					break;
- 				case R_ARM_GOT32:
-@@ -939,7 +948,7 @@ output_relocs (
- #ifdef TARGET_v850
- 				case R_V850_ABS32:
- 					relocation_needed = 1;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					break;
- 				case R_V850_ZDA_16_16_OFFSET:
-@@ -961,7 +970,7 @@ output_relocs (
- 					sym_addr = (*(q->sym_ptr_ptr))->value;
- 					q->address -= 1;
- 					r_mem -= 1; /* tracks q->address */
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					sym_addr |= (*(unsigned char *)r_mem<<24);
- 					break;
-@@ -974,7 +983,7 @@ output_relocs (
- 					/* Absolute symbol done not relocation */
- 					relocation_needed = !bfd_is_abs_section(sym_section);
- 					sym_addr = (*(q->sym_ptr_ptr))->value;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					break;
- 				case R_H8_DIR32:
-@@ -987,7 +996,7 @@ output_relocs (
- 					}
- 					relocation_needed = 1;
- 					sym_addr = (*(q->sym_ptr_ptr))->value;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					break;
- 				case R_H8_PCREL16:
-@@ -1013,7 +1022,7 @@ output_relocs (
- #ifdef TARGET_microblaze
- 				case R_MICROBLAZE_64:
- 					/* work out the relocation */
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					/* Write relocated pointer back */
- 					r_mem[2] = (sym_addr >> 24) & 0xff;
-@@ -1027,7 +1036,7 @@ output_relocs (
- 					pflags = 0x80000000;
- 					break;
- 				case R_MICROBLAZE_32:
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					relocation_needed = 1;
- 					break;
-@@ -1059,7 +1068,7 @@ output_relocs (
- 				case R_NIOS2_BFD_RELOC_32:
- 					relocation_needed = 1;
- 					pflags = (FLAT_NIOS2_R_32 << 28);
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					/* modify target, in target order */
- 					*(unsigned long *)r_mem = htoniosl(sym_addr);
-@@ -1069,7 +1078,7 @@ output_relocs (
- 					unsigned long exist_val;
- 					relocation_needed = 1;
- 					pflags = (FLAT_NIOS2_R_CALL26 << 28);
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 
- 					/* modify target, in target order */
-@@ -1100,7 +1109,7 @@ output_relocs (
- 								? FLAT_NIOS2_R_HIADJ_LO : FLAT_NIOS2_R_HI_LO;
- 							pflags <<= 28;
- 
--							sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+							sym_vma = elf2flt_bfd_section_vma(abs_bfd, sym_section);
- 							sym_addr += sym_vma + q->addend;
- 
- 							/* modify high 16 bits, in target order */
-@@ -1133,7 +1142,7 @@ output_relocs (
- 						goto NIOS2_RELOC_ERR;
- 					}
- 					/* _gp holds a absolute value, otherwise the ld cannot generate correct code */
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					//printf("sym=%x, %d, _gp=%x, %d\n", sym_addr+sym_vma, sym_addr+sym_vma, gp, gp);
- 					sym_addr += sym_vma + q->addend;
- 					sym_addr -= gp;
-@@ -1214,7 +1223,7 @@ NIOS2_RELOC_ERR:
- 				case R_SPARC_32:
- 				case R_SPARC_UA32:
- 					relocation_needed = 1;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					break;
- 				case R_SPARC_PC22:
-@@ -1233,7 +1242,7 @@ NIOS2_RELOC_ERR:
- 				case R_SPARC_HI22:
- 					relocation_needed = 1;
- 					pflags = 0x80000000;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					sym_addr |= (
- 						htonl(*(uint32_t *)r_mem)
-@@ -1243,7 +1252,7 @@ NIOS2_RELOC_ERR:
- 				case R_SPARC_LO10:
- 					relocation_needed = 1;
- 					pflags = 0x40000000;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					sym_addr &= 0x000003ff;
- 					sym_addr |= (
-@@ -1257,7 +1266,7 @@ NIOS2_RELOC_ERR:
- #ifdef TARGET_sh
- 				case R_SH_DIR32:
- 					relocation_needed = 1;
--					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+					sym_vma = elf2flt_bfd_section_vma(sym_section);
- 					sym_addr += sym_vma + q->addend;
- 					break;
- 				case R_SH_REL32:
-@@ -1289,7 +1298,7 @@ NIOS2_RELOC_ERR:
- 				case R_E1_CONST31:
- 						relocation_needed = 1;
- 						DBG_E1("Handling Reloc <CONST31>\n");
--						sec_vma = bfd_section_vma(abs_bfd, sym_section);
-+						sec_vma = elf2flt_bfd_section_vma(sym_section);
- 						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x], q->address : [0x%x]\n",
- 										sec_vma, sym_addr, q->address);
- 						sym_addr = sec_vma + sym_addr;
-@@ -1304,7 +1313,7 @@ NIOS2_RELOC_ERR:
- 						relocation_needed = 0;
- 						DBG_E1("Handling Reloc <CONST31_PCREL>\n");
- 						DBG_E1("DONT RELOCATE AT LOADING\n");
--						sec_vma = bfd_section_vma(abs_bfd, sym_section);
-+						sec_vma = elf2flt_bfd_section_vma(sym_section);
- 						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x], q->address : [0x%x]\n",
- 										sec_vma, sym_addr, q->address);
- 						sym_addr =  sec_vma + sym_addr;
-@@ -1331,7 +1340,7 @@ NIOS2_RELOC_ERR:
- 						relocation_needed = 0;
- 						DBG_E1("Handling Reloc <DIS29W_PCREL>\n");
- 						DBG_E1("DONT RELOCATE AT LOADING\n");
--						sec_vma = bfd_section_vma(abs_bfd, sym_section);
-+						sec_vma = elf2flt_bfd_section_vma(sym_section);
- 						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x], q->address : [0x%x]\n",
- 										sec_vma, sym_addr, q->address);
- 						sym_addr =  sec_vma + sym_addr;
-@@ -1364,7 +1373,7 @@ NIOS2_RELOC_ERR:
- 						DBG_E1("Handling Reloc <DIS29B>\n");
- DIS29_RELOCATION:
- 						relocation_needed = 1;
--						sec_vma = bfd_section_vma(abs_bfd, sym_section);
-+						sec_vma = elf2flt_bfd_section_vma(sym_section);
- 						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%08x]\n",
- 										sec_vma, sym_addr);
- 						sym_addr =  sec_vma + sym_addr;
-@@ -1381,7 +1390,7 @@ DIS29_RELOCATION:
- 						relocation_needed = 0;
- 						DBG_E1("Handling Reloc <IMM32_PCREL>\n");
- 						DBG_E1("DONT RELOCATE AT LOADING\n");
--						sec_vma = bfd_section_vma(abs_bfd, sym_section);
-+						sec_vma = elf2flt_bfd_section_vma(sym_section);
- 						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x]\n",
- 										sec_vma, sym_addr);
- 						sym_addr =  sec_vma + sym_addr;
-@@ -1407,7 +1416,7 @@ DIS29_RELOCATION:
- 				case R_E1_IMM32:
- 						relocation_needed = 1;
- 						DBG_E1("Handling Reloc <IMM32>\n");
--						sec_vma = bfd_section_vma(abs_bfd, sym_section);
-+						sec_vma = elf2flt_bfd_section_vma(sym_section);
- 						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x]\n",
- 										sec_vma, sym_addr);
- 						sym_addr =  sec_vma + sym_addr;
-@@ -1423,7 +1432,7 @@ DIS29_RELOCATION:
- 				case R_E1_WORD:
- 						relocation_needed = 1;
- 						DBG_E1("Handling Reloc <WORD>\n");
--						sec_vma = bfd_section_vma(abs_bfd, sym_section);
-+						sec_vma = elf2flt_bfd_section_vma(sym_section);
- 						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x]\n",
- 										sec_vma, sym_addr);
- 						sym_addr =  sec_vma + sym_addr;
-@@ -1450,7 +1459,7 @@ DIS29_RELOCATION:
- 			}
- 
- 			sprintf(&addstr[0], "+0x%lx", sym_addr - (*(q->sym_ptr_ptr))->value -
--					 bfd_section_vma(abs_bfd, sym_section));
-+					 elf2flt_bfd_section_vma(sym_section));
- 
- 
- 			/*
-@@ -1890,8 +1899,8 @@ int main(int argc, char *argv[])
-     } else
-       continue;
- 
--    sec_size = bfd_section_size(abs_bfd, s);
--    sec_vma  = bfd_section_vma(abs_bfd, s);
-+    sec_size = elf2flt_bfd_section_size(s);
-+    sec_vma  = elf2flt_bfd_section_vma(s);
- 
-     if (sec_vma < *vma) {
-       if (*len > 0)
-@@ -1920,7 +1929,7 @@ int main(int argc, char *argv[])
-                     (SEC_DATA | SEC_READONLY | SEC_RELOC)))
-       if (!bfd_get_section_contents(abs_bfd, s,
- 				   text + (s->vma - text_vma), 0,
--				   bfd_section_size(abs_bfd, s)))
-+				   elf2flt_bfd_section_size(s)))
-       {
- 	fatal("read error section %s", s->name);
-       }
-@@ -1950,7 +1959,7 @@ int main(int argc, char *argv[])
-                     (SEC_READONLY | SEC_RELOC)))
-       if (!bfd_get_section_contents(abs_bfd, s,
- 				   data + (s->vma - data_vma), 0,
--				   bfd_section_size(abs_bfd, s)))
-+				   elf2flt_bfd_section_size(s)))
-       {
- 	fatal("read error section %s", s->name);
-       }
--- 
-2.35.1
-
diff --git a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch b/package/elf2flt/0001-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
similarity index 88%
rename from package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
rename to package/elf2flt/0001-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
index 4df3ea5929..44201ab8d1 100644
--- a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
+++ b/package/elf2flt/0001-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
@@ -1,4 +1,4 @@
-From 85ba5664eb368eb1cbd2c30b7cd574acd75edd4c Mon Sep 17 00:00:00 2001
+From c74cb29c1ef32e0e8c72a12930b96cb5a9ee1988 Mon Sep 17 00:00:00 2001
 From: Niklas Cassel <niklas.cassel@wdc.com>
 Date: Mon, 4 Apr 2022 15:30:24 +0200
 Subject: [PATCH] elf2flt.ld: reinstate 32 byte alignment for .data section
@@ -55,20 +55,16 @@ when assigning an address to the .data section, when it actually is not.
 Fixes: 8a3e74446fe7 ("allow to build arm flat binaries")
 Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
 ---
- elf2flt.ld.in | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
+ elf2flt.ld.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/elf2flt.ld.in b/elf2flt.ld.in
-index 0df999d..e5aea14 100644
+index d86c0ba..02db66e 100644
 --- a/elf2flt.ld.in
 +++ b/elf2flt.ld.in
-@@ -94,12 +94,9 @@ W_RODAT:	*(.gnu.linkonce.r*)
- 		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
- 	} > flatmem
- 	@SYMBOL_PREFIX@__exidx_end = .;
--
--	. = ALIGN(0x20) ;
- 	@SYMBOL_PREFIX@_etext = . ;
+@@ -95,8 +95,7 @@ W_RODAT:	*(.gnu.linkonce.r*)
+ 		@SYMBOL_PREFIX@_etext = . ;
+ 	} > flatmem :text
  
 -	.data : {
 -		. = ALIGN(0x4) ;
@@ -77,5 +73,5 @@ index 0df999d..e5aea14 100644
  		@SYMBOL_PREFIX@__data_start = . ;
  		@SYMBOL_PREFIX@data_start = . ;
 -- 
-2.35.1
+2.40.0
 
diff --git a/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
similarity index 93%
rename from package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
rename to package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
index 15c191c83d..67e7863728 100644
--- a/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
+++ b/package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
@@ -1,4 +1,4 @@
-From 3f1f323feb5cf25d8c80861991d0360784f4d2e6 Mon Sep 17 00:00:00 2001
+From bbae74541319a7b846cfb21d7228a55227d6f329 Mon Sep 17 00:00:00 2001
 From: Damien Le Moal <damien.lemoal@wdc.com>
 Date: Wed, 9 Sep 2020 17:31:33 +0900
 Subject: [PATCH] elf2flt: add riscv 64-bits support
@@ -27,7 +27,7 @@ Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
  3 files changed, 25 insertions(+)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index da25e93..a03ea3a 100644
+index 3c9f4d0..a7157ce 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
 @@ -81,6 +81,8 @@ const char *elf2flt_progname;
@@ -48,7 +48,7 @@ index da25e93..a03ea3a 100644
  #else
  #error "Don't know how to support your CPU architecture??"
  #endif
-@@ -812,6 +816,18 @@ output_relocs (
+@@ -818,6 +822,18 @@ output_relocs (
  					goto good_32bit_resolved_reloc;
  				default:
  					goto bad_resolved_reloc;
@@ -68,10 +68,10 @@ index da25e93..a03ea3a 100644
  				default:
  					/* The default is to assume that the
 diff --git a/elf2flt.ld.in b/elf2flt.ld.in
-index e5aea14..950849e 100644
+index 02db66e..886fa19 100644
 --- a/elf2flt.ld.in
 +++ b/elf2flt.ld.in
-@@ -106,6 +106,7 @@ W_RODAT:	*(.gnu.linkonce.r*)
+@@ -105,6 +105,7 @@ W_RODAT:	*(.gnu.linkonce.r*)
  		. = ALIGN(0x20) ;
  		LONG(-1)
  		. = ALIGN(0x20) ;
@@ -99,5 +99,5 @@ index 7cb02d5..75ee1bb 100644
  	if (!linker_script)
  		linker_script = concat(ldscriptpath, "/elf2flt.ld", NULL);
 -- 
-2.36.1
+2.40.0
 
diff --git a/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch b/package/elf2flt/0003-xtensa-fix-text-relocations.patch
similarity index 88%
rename from package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
rename to package/elf2flt/0003-xtensa-fix-text-relocations.patch
index 3664775906..5eb294e326 100644
--- a/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
+++ b/package/elf2flt/0003-xtensa-fix-text-relocations.patch
@@ -1,4 +1,4 @@
-From e248d9774506fdd8698b14a7edead113f19ecdb0 Mon Sep 17 00:00:00 2001
+From 630314cf3b16288f959288a341051c27b18ef964 Mon Sep 17 00:00:00 2001
 From: Max Filippov <jcmvbkbc@gmail.com>
 Date: Tue, 29 Nov 2022 17:47:54 -0800
 Subject: [PATCH] xtensa: fix text relocations
@@ -21,10 +21,10 @@ Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
  1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index b93aecdaced3..cec3f4a22239 100644
+index a7157ce..f08bede 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
-@@ -808,7 +808,20 @@ output_relocs (
+@@ -819,7 +819,20 @@ output_relocs (
  					continue;
  				case R_XTENSA_32:
  				case R_XTENSA_PLT:
@@ -45,7 +45,7 @@ index b93aecdaced3..cec3f4a22239 100644
 +					break;
  				default:
  					goto bad_resolved_reloc;
- #else
+ #elif defined(TARGET_riscv64)
 -- 
-2.30.2
+2.40.0
 
diff --git a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
deleted file mode 100644
index 6fee99d45a..0000000000
--- a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 37e1e0ace8ccebf54ec2f5522bfc1f9db86946ad Mon Sep 17 00:00:00 2001
-From: Niklas Cassel <niklas.cassel@wdc.com>
-Date: Tue, 9 Aug 2022 12:13:50 +0200
-Subject: [PATCH] elf2flt: create a common helper function
-
-In order to make the code more maintainable,
-move duplicated code to a common helper function.
-
-No functional change intended.
-
-Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
----
- elf2flt.c | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 669591e..9c32f9a 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -337,6 +337,13 @@ compare_relocs (const void *pa, const void *pb)
- }
- #endif
- 
-+static bool
-+ro_reloc_data_section_should_be_in_text(asection *s)
-+{
-+  return (s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-+	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
-+}
-+
- static uint32_t *
- output_relocs (
-   bfd *abs_bfd,
-@@ -428,8 +435,7 @@ output_relocs (
- 	 */
- 	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
- 	    ((a->flags & SEC_CODE) ||
--	    ((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--		         (SEC_DATA | SEC_READONLY | SEC_RELOC))))
-+	     ro_reloc_data_section_should_be_in_text(a)))
- 		sectionp = text + (a->vma - text_vma);
- 	else if (a->flags & SEC_DATA)
- 		sectionp = data + (a->vma - data_vma);
-@@ -1893,8 +1899,7 @@ int main(int argc, char *argv[])
-     bfd_vma sec_vma;
- 
-     if ((s->flags & SEC_CODE) ||
--       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--                    (SEC_DATA | SEC_READONLY | SEC_RELOC))) {
-+	ro_reloc_data_section_should_be_in_text(s)) {
-       vma = &text_vma;
-       len = &text_len;
-     } else if (s->flags & SEC_DATA) {
-@@ -1932,8 +1937,7 @@ int main(int argc, char *argv[])
-    * data sections.*/
-   for (s = abs_bfd->sections; s != NULL; s = s->next)
-     if ((s->flags & SEC_CODE) ||
--       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--                    (SEC_DATA | SEC_READONLY | SEC_RELOC)))
-+	ro_reloc_data_section_should_be_in_text(s))
-       if (!bfd_get_section_contents(abs_bfd, s,
- 				   text + (s->vma - text_vma), 0,
- 				   bfd_section_size(abs_bfd, s)))
-@@ -1962,8 +1966,7 @@ int main(int argc, char *argv[])
-    * data sections already included in the text output section.*/
-   for (s = abs_bfd->sections; s != NULL; s = s->next)
-     if ((s->flags & SEC_DATA) &&
--       ((s->flags & (SEC_READONLY | SEC_RELOC)) !=
--                    (SEC_READONLY | SEC_RELOC)))
-+	!ro_reloc_data_section_should_be_in_text(s))
-       if (!bfd_get_section_contents(abs_bfd, s,
- 				   data + (s->vma - data_vma), 0,
- 				   bfd_section_size(abs_bfd, s)))
--- 
-2.37.1
-
diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
deleted file mode 100644
index 616bbc891f..0000000000
--- a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From a8c9f650b82109abf7aa730f298ea5182ed62613 Mon Sep 17 00:00:00 2001
-From: Niklas Cassel <niklas.cassel@wdc.com>
-Date: Tue, 9 Aug 2022 21:06:05 +0200
-Subject: [PATCH] elf2flt: fix fatal error regression on m68k, xtensa, riscv64
-
-Commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
-changed the condition of which input sections that should be included
-in the .text output section from:
-((a->flags & (SEC_DATA | SEC_READONLY)) == (SEC_DATA | SEC_READONLY))
-to:
-((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-(SEC_DATA | SEC_READONLY | SEC_RELOC))
-
-On ARM, the .eh_frame input section does not have the SEC_RELOC flag set,
-so on ARM, this change caused .eh_frame to move from .text to .data.
-
-However, on e.g. m68k, xtensa and riscv64, the .eh_frame input section
-does have the SEC_RELOC flag set, which means that the change in
-commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
-caused .eh_frame to move in an opposite way, i.e. from .data to .text.
-
-This resulted in a fatal error on m68k, xtensa and riscv64:
-ERROR: text=0x3bab8 overlaps data=0x33f60 ?
-
-This is because elf2flt cannot append to .text after .data has been
-appended to.
-
-Note that the binutils maintainer says that the correct thing is
-to put read-only relocation data sections in .text:
-https://sourceware.org/legacy-ml/binutils/2019-10/msg00132.html
-
-So the proper fix is probably to rewrite elf2flt so that it can append
-to .text after .data has been appended to (which will require elf2flt
-to move/relocate everything that has already been appended to .data,
-since the virtual addresses are contiguous).
-
-However, for now, add an exception for input sections which have all
-three flags SEC_DATA, SEC_READONLY, and SEC_RELOC set, and which have a
-name equal to a problematic input section (.eh_frame, .gcc_except_table).
-That way, we get the same behavior as older elf2flt releases for m68k,
-xtensa and riscv64, where we put read-only relocation data in .data,
-which was working perfectly fine.
-
-This exception will not change any behavior on ARM, as the .eh_frame
-input section does not have flag SEC_RELOC set.
-
-Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
----
- elf2flt.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index e0d7891..39d035f 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -341,8 +341,13 @@ compare_relocs (const void *pa, const void *pb)
- static bool
- ro_reloc_data_section_should_be_in_text(asection *s)
- {
--  return (s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
-+  if ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-+      (SEC_DATA | SEC_READONLY | SEC_RELOC)) {
-+    if (!strcmp(".eh_frame", s->name) || !strcmp(".gcc_except_table", s->name))
-+      return false;
-+    return true;
-+  }
-+  return false;
- }
- 
- static uint32_t *
--- 
-2.39.0
-
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index c576f65cdb..ff97f84c7d 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6637432ed58dee2d42d09e3b9a902a0dd3b9975acba0c0b24ef9e4e9253159a9  elf2flt-2021.08.tar.gz
+sha256  58eebd94f7de6d8c5a71d1a677d9e236732c20e4258413d28b378a8624e77e10  elf2flt-2023.04.tar.gz
 sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 6cd0786c3d..852082f6d3 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 2021.08
+ELF2FLT_VERSION = 2023.04
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
 HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
 
-# 0001-elf2flt-handle-binutils-2.34.patch
-HOST_ELF2FLT_AUTORECONF = YES
-
 # It is not exactly a host variant, but more a cross variant, which is
 # why we pass a special --target option.
 HOST_ELF2FLT_CONF_OPTS = \
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
