Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64E5CA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 11:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D780418F2;
	Tue, 12 Sep 2023 11:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D780418F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Doq6uuCs69Rc; Tue, 12 Sep 2023 11:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91F8841929;
	Tue, 12 Sep 2023 11:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F8841929
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6A231BF842
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 11:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCACD41929
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 11:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCACD41929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLDxd2DVCWVw for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 11:11:40 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 Sep 2023 11:11:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E06418F2
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64E06418F2
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 11:11:40 +0000 (UTC)
X-CSE-ConnectionGUID: iBuTigNLR2Ktr/KD4bd7hQ==
X-CSE-MsgGUID: qCUaFFetTmSElcA0X6c/+Q==
X-IronPort-AV: E=Sophos;i="6.02,139,1688400000"; d="scan'208";a="349033499"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2023 19:04:32 +0800
IronPort-SDR: ySv8nKIYVECgwzy9mMhLFzXmuDmCLVy5dA3tF49yVXbNkiG81z7e429F3JbKz6anldOs33uchg
 pSbYJ1hW5YJgOcDa3YqM8LFxLk4jXfh3xxNIrWU/8YiIx98rFm6dZbgeuKJyLRhviof73XJs74
 ouf5AayR8M2JZnsZZpVKtsM6geEWSHWWdjd7+Dwd1DOl7rFtTXWnF5iekXNMkhTEtZsDmn1+1P
 SarXwAyxKSQbF3uQO1HUVTmfkFvJBfcDY4fWCSveGaXjZzC/mBU+mTnEcM7zizrtSKOBSBVFrS
 GJk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Sep 2023 03:11:36 -0700
IronPort-SDR: nTp9MXcVJRVy9KIsv/GrBDnZQgrVp5X2C8M4dLptvII5SPYctvrcAsOWta58e4dxBajoA4KHTC
 e19KQ3r3Maqm6Lsi7NXUeCip+i5jXJ1LuiVMTWSxDKBhK9QOy5c55BFKOdUF8PKzKy2nN1nPyd
 zZfV2y58Re6/MIfs40FLnjL2oOyHgNto+EdGESUCEk2nTMlFK/aUMb3pIPm6BrE2YNVGpIlJdC
 1VXqTkWXtulD9depRGwKU2pNaBDAq0WCAV10QigFgYFAReGQITC/h3kqbCdaY3BDH+GByu8PQV
 gLk=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.163.64])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Sep 2023 04:04:28 -0700
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Sep 2023 13:04:20 +0200
Message-ID: <20230912110420.1111238-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1694517100; x=1726053100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z2qBP0V0zK3D+fzsxcn4K2OXuh+fauXWjGDRhOe87AQ=;
 b=mwGItIx8oPSSu34nTolfMSgWAD6B/1WTCRAG5lKUoIljHj2TjxvokzqQ
 Cl6C4PMHJJn4v7xvN/dIElkVa6JbCLSCoXh0D8ZBdHEWf5Cny9D0fUK32
 oOfp06kENpJiUol+i1EIkPUtjprBnhoeYA7XnbI2F9Z6L5ArPMlrNVfrQ
 PNeL91r0PTkfqapv+Jbh1rqZdijb1QqrREwoNAFMBD/LfNAWmrFOj7kCS
 2gW5ieKdp4WdLnU8LoDP/U9qALXKO6vjgg0wRPITlhNv7Q3OdkzXH+YQA
 az2e/ZzV/l2vM2dYrg7s/rhZrkCQVPsaXwBUh1fd8wPN88shdYMxuftp8
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=mwGItIx8
Subject: [Buildroot] [PATCH] package/elf2flt: update to version 2023.09
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Greg Ungerer <gregungerer@westnet.com.au>,
 Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 Jesse T <mr.bossman075@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Several of our patches have been accepted upstream and are included in
elf2flt version 2023.09.

Patch 0001-elf2flt-handle-binutils-2.34.patch is upstream as of commit
c70b9f208979 ("elf2flt: handle binutils >= 2.34").

Patch 0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch is
upstream as of commit 679c94adf27c ("elf2flt.ld: reinstate 32 byte
alignment for .data section").

Patch 0003-elf2flt-add-riscv-64-bits-support.patch is upstream as of
commit c5c8043c4d79 ("elf2flt: add riscv 64-bits support").

Patch 0008-riscv64-add-more-relocations-required-to-be-handled.patch was
squashed into upstream commit c5c8043c4d79 ("elf2flt: add riscv 64-bits
support") during upstreaming.

Patch 0006-xtensa-fix-text-relocations.patch is upstream as of commit
26dfb54a59c8 ("elf2flt: xtensa: fix text relocations").

Patch 0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch is upstream as of
commit a36df7407d9e ("elf2flt: remove use of BFD_VMA_FMT").

Patch 0004-elf2flt-create-a-common-helper-function.patch simply added
a helper function to make the changes in the follow-up patch
0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
less intrusive.

Patch 0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
is no longer needed as upstream has reverted the commit that necessitated
this patch, see upstream commit 35c692ca4546 ("Revert "elf2flt: fix for
segfault on some ARM ELFs""). The problem that the reverted upstream patch
solved is now instead solved by the combination of upstream commits
7a59b265c2dc ("Revert "elf2flt: fix relocations for read-only data"") and
a934fb42cf59 ("elf2flt: force ARM.exidx section into text").

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
Resending from an email address that is subscribed to the buildroot
mailing list, since my previous mail got rejected.

 .../0001-elf2flt-handle-binutils-2.34.patch   | 377 ------------------
 ...tate-32-byte-alignment-for-.data-sec.patch |  81 ----
 ...03-elf2flt-add-riscv-64-bits-support.patch | 103 -----
 ...2flt-create-a-common-helper-function.patch |  76 ----
 ...l-error-regression-on-m68k-xtensa-ri.patch |  74 ----
 .../0006-xtensa-fix-text-relocations.patch    |  51 ---
 ...07-elf2flt-remove-use-of-BFD_VMA_FMT.patch | 169 --------
 ...e-relocations-required-to-be-handled.patch |  40 --
 package/elf2flt/elf2flt.hash                  |   2 +-
 package/elf2flt/elf2flt.mk                    |   2 +-
 10 files changed, 2 insertions(+), 973 deletions(-)
 delete mode 100644 package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
 delete mode 100644 package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
 delete mode 100644 package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
 delete mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
 delete mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
 delete mode 100644 package/elf2flt/0006-xtensa-fix-text-relocations.patch
 delete mode 100644 package/elf2flt/0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch
 delete mode 100644 package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch

diff --git a/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
deleted file mode 100644
index f9e493a761..0000000000
--- a/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
+++ /dev/null
@@ -1,377 +0,0 @@
-From 2821fcb55cbe0f2b77237d89b5b3467fb3ad058b Mon Sep 17 00:00:00 2001
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
-2.41.0
-
diff --git a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch b/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
deleted file mode 100644
index 8bd0383683..0000000000
--- a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 37b281e4dd0fb5832181e51943a4eb3c74d4f618 Mon Sep 17 00:00:00 2001
-From: Niklas Cassel <niklas.cassel@wdc.com>
-Date: Mon, 4 Apr 2022 15:30:24 +0200
-Subject: [PATCH] elf2flt.ld: reinstate 32 byte alignment for .data section
-
-Commit 8a3e74446fe7 ("allow to build arm flat binaries") moved the
-following commands:
-	. = ALIGN(0x20) ;
-	@SYMBOL_PREFIX@_etext = . ;
-from the .text section to the top level in the SECTIONS node.
-
-The .text output section is being directed to a memory region using the
-"> flatmem :text" output section attribute. Commands in the top level in
-the SECTIONS node are not.
-
-This means that the ALIGN() command is no longer being appended to the
-flatmem memory region, it will simply update the Location Counter.
-
-The heuristic for placing an output section is described here:
-https://sourceware.org/binutils/docs-2.38/ld.html#Output-Section-Address
-
-"If an output memory region is set for the section then it is added to this
-region and its address will be the next free address in that region."
-
-Since the .data section is being directed to the same memory region as the
-.text section, this means that the Location Counter is not used when
-assigning an address to the .data output section, it will simply use the
-next free address.
-
-No longer directing these commands to the flatmem memory region means that
-the .data output section is no longer aligned to a 32 byte boundary.
-
-Before commit 8a3e74446fe7 ("allow to build arm flat binaries"):
-$ readelf -S busybox_unstripped.gdb | grep data
-  [ 3] .data             PROGBITS         0000000000035ac0  00036ac0
-$ readelf -s busybox_unstripped.gdb | grep _etext
- 19286: 0000000000035ac0     0 NOTYPE  GLOBAL DEFAULT    1 _etext
-
-After commit 8a3e74446fe7 ("allow to build arm flat binaries"):
-$ readelf -S busybox_unstripped.gdb | grep data
-  [ 3] .data             PROGBITS         0000000000035ab0  00036ab0
-$ readelf -s busybox_unstripped.gdb | grep _etext
- 19287: 0000000000035ac0     0 NOTYPE  GLOBAL DEFAULT    3 _etext
-
-The .data output section has to be aligned to a 32 byte boundary, see the
-FLAT_DATA_ALIGN 0x20 macro and its usage in fs/binfmt_flat.c:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/binfmt_flat.c?h=v5.17#n59
-
-Readd an explicit ALIGN attribute on the .data section itself, since the
-linker will obey this attribute regardless if being directed to a memory
-region or not. Also remove the ALIGN() command before the .data section,
-since this misleads the reader to think that the Location Counter is used
-when assigning an address to the .data section, when it actually is not.
-
-Fixes: 8a3e74446fe7 ("allow to build arm flat binaries")
-Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
----
- elf2flt.ld.in | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/elf2flt.ld.in b/elf2flt.ld.in
-index 0df999d..e5aea14 100644
---- a/elf2flt.ld.in
-+++ b/elf2flt.ld.in
-@@ -94,12 +94,9 @@ W_RODAT:	*(.gnu.linkonce.r*)
- 		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
- 	} > flatmem
- 	@SYMBOL_PREFIX@__exidx_end = .;
--
--	. = ALIGN(0x20) ;
- 	@SYMBOL_PREFIX@_etext = . ;
- 
--	.data : {
--		. = ALIGN(0x4) ;
-+	.data ALIGN(0x20): {
- 		@SYMBOL_PREFIX@_sdata = . ;
- 		@SYMBOL_PREFIX@__data_start = . ;
- 		@SYMBOL_PREFIX@data_start = . ;
--- 
-2.41.0
-
diff --git a/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
deleted file mode 100644
index c2aa538d02..0000000000
--- a/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 1498503bde2a6055a83f1e9f3eaa6f2a104bd597 Mon Sep 17 00:00:00 2001
-From: Damien Le Moal <damien.lemoal@wdc.com>
-Date: Wed, 9 Sep 2020 17:31:33 +0900
-Subject: [PATCH] elf2flt: add riscv 64-bits support
-
-Add support for riscv 64bits ISA by defining the relocation types
-R_RISCV_32_PCREL, R_RISCV_ADD32, R_RISCV_SUB32, R_RISCV_32 and
-R_RISCV_64. riscv64 support also needs the __global_pointer$ symbol to
-be defined right after the relocation tables in the data section. To
-define this symbol, the "RISCV_GP" line prefix is added. The "RISCV_GP"
-string is removed if the target CPU type is riscv64 and the definition
-line is dropped for other CPU types.
-
-With these changes, buildroot and busybox build and run on riscv NOMMU
-systems with Linux kernel including patch 6045ab5fea4c
-("binfmt_flat: do not stop relocating GOT entries prematurely on riscv")
-fixing the binfmt_flat loader. Tested on QEMU and Canaan Kendryte K210
-boards.
-
-This patch is based on earlier work by Christoph Hellwig <hch@lst.de>.
-
-Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
----
- elf2flt.c     | 16 ++++++++++++++++
- elf2flt.ld.in |  1 +
- ld-elf2flt.c  |  8 ++++++++
- 3 files changed, 25 insertions(+)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index ea6b5a1..c2816b6 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -81,6 +81,8 @@ const char *elf2flt_progname;
- #include <elf/v850.h>
- #elif defined(TARGET_xtensa)
- #include <elf/xtensa.h>
-+#elif defined(TARGET_riscv64)
-+#include <elf/riscv.h>
- #endif
- 
- #if defined(__MINGW32__)
-@@ -123,6 +125,8 @@ const char *elf2flt_progname;
- #define ARCH	"nios2"
- #elif defined(TARGET_xtensa)
- #define ARCH	"xtensa"
-+#elif defined(TARGET_riscv64)
-+#define ARCH	"riscv64"
- #else
- #error "Don't know how to support your CPU architecture??"
- #endif
-@@ -821,6 +825,18 @@ output_relocs (
- 					goto good_32bit_resolved_reloc;
- 				default:
- 					goto bad_resolved_reloc;
-+#elif defined(TARGET_riscv64)
-+				case R_RISCV_32_PCREL:
-+				case R_RISCV_ADD32:
-+				case R_RISCV_ADD64:
-+				case R_RISCV_SUB32:
-+				case R_RISCV_SUB64:
-+					continue;
-+				case R_RISCV_32:
-+				case R_RISCV_64:
-+					goto good_32bit_resolved_reloc;
-+				default:
-+					goto bad_resolved_reloc;
- #else
- 				default:
- 					/* The default is to assume that the
-diff --git a/elf2flt.ld.in b/elf2flt.ld.in
-index e5aea14..950849e 100644
---- a/elf2flt.ld.in
-+++ b/elf2flt.ld.in
-@@ -106,6 +106,7 @@ W_RODAT:	*(.gnu.linkonce.r*)
- 		. = ALIGN(0x20) ;
- 		LONG(-1)
- 		. = ALIGN(0x20) ;
-+RISCV_GP:	__global_pointer$ = . + 0x800 ;
- R_RODAT:	*(.rodata)
- R_RODAT:	*(.rodata1)
- R_RODAT:	*(.rodata.*)
-diff --git a/ld-elf2flt.c b/ld-elf2flt.c
-index 7cb02d5..75ee1bb 100644
---- a/ld-elf2flt.c
-+++ b/ld-elf2flt.c
-@@ -324,6 +324,14 @@ static int do_final_link(void)
- 		append_option(&other_options, concat(got_offset, "=", buf, NULL));
- 	}
- 
-+	/* riscv adds a global pointer symbol to the linker file with the
-+	   "RISCV_GP:" prefix. Remove the prefix for riscv64 architecture and
-+	   the entire line for other architectures. */
-+	if (streq(TARGET_CPU, "riscv64"))
-+		append_sed(&sed, "^RISCV_GP:", "");
-+	else
-+		append_sed(&sed, "^RISCV_GP:", NULL);
-+
- 	/* Locate the default linker script, if we don't have one provided. */
- 	if (!linker_script)
- 		linker_script = concat(ldscriptpath, "/elf2flt.ld", NULL);
--- 
-2.41.0
-
diff --git a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
deleted file mode 100644
index be8d57affa..0000000000
--- a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 4f28e4329897b7f23d828b375fb365d0e30c9cb5 Mon Sep 17 00:00:00 2001
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
-index c2816b6..8cd48d9 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -346,6 +346,13 @@ compare_relocs (const void *pa, const void *pb)
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
-@@ -437,8 +444,7 @@ output_relocs (
- 	 */
- 	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
- 	    ((a->flags & SEC_CODE) ||
--	    ((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--		         (SEC_DATA | SEC_READONLY | SEC_RELOC))))
-+	     ro_reloc_data_section_should_be_in_text(a)))
- 		sectionp = text + (a->vma - text_vma);
- 	else if (a->flags & SEC_DATA)
- 		sectionp = data + (a->vma - data_vma);
-@@ -1902,8 +1908,7 @@ int main(int argc, char *argv[])
-     bfd_vma sec_vma;
- 
-     if ((s->flags & SEC_CODE) ||
--       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--                    (SEC_DATA | SEC_READONLY | SEC_RELOC))) {
-+	ro_reloc_data_section_should_be_in_text(s)) {
-       vma = &text_vma;
-       len = &text_len;
-     } else if (s->flags & SEC_DATA) {
-@@ -1941,8 +1946,7 @@ int main(int argc, char *argv[])
-    * data sections.*/
-   for (s = abs_bfd->sections; s != NULL; s = s->next)
-     if ((s->flags & SEC_CODE) ||
--       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--                    (SEC_DATA | SEC_READONLY | SEC_RELOC)))
-+	ro_reloc_data_section_should_be_in_text(s))
-       if (!bfd_get_section_contents(abs_bfd, s,
- 				   text + (s->vma - text_vma), 0,
- 				   elf2flt_bfd_section_size(s)))
-@@ -1971,8 +1975,7 @@ int main(int argc, char *argv[])
-    * data sections already included in the text output section.*/
-   for (s = abs_bfd->sections; s != NULL; s = s->next)
-     if ((s->flags & SEC_DATA) &&
--       ((s->flags & (SEC_READONLY | SEC_RELOC)) !=
--                    (SEC_READONLY | SEC_RELOC)))
-+	!ro_reloc_data_section_should_be_in_text(s))
-       if (!bfd_get_section_contents(abs_bfd, s,
- 				   data + (s->vma - data_vma), 0,
- 				   elf2flt_bfd_section_size(s)))
--- 
-2.41.0
-
diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
deleted file mode 100644
index 96befd53d8..0000000000
--- a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 87d45736a6855f2147ef9c88d2bce2cabc84cb52 Mon Sep 17 00:00:00 2001
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
-index 8cd48d9..60bfa57 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -349,8 +349,13 @@ compare_relocs (const void *pa, const void *pb)
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
-2.41.0
-
diff --git a/package/elf2flt/0006-xtensa-fix-text-relocations.patch b/package/elf2flt/0006-xtensa-fix-text-relocations.patch
deleted file mode 100644
index 19c47cca90..0000000000
--- a/package/elf2flt/0006-xtensa-fix-text-relocations.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 7e1c17d7fe72a0889d56d5e6a1390d493d1de144 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 29 Nov 2022 17:47:54 -0800
-Subject: [PATCH] xtensa: fix text relocations
-
-The commit 5e08f1968316 ("Don't always update text in !pic_with_got case")
-changed good_32bit_resolved_reloc to not do endianness swapping for
-relocated entries in the text segment. This broke little-endian xtensa
-FLAT images which after this change fail to start with the following
-message:
-
-  binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)
-
-Fix it by preserving 'update_text' when building for xtensa.
-
-Fixes: 5e08f1968316 ("Don't always update text in !pic_with_got case")
-Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- elf2flt.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 60bfa57..0fcb747 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -833,7 +833,20 @@ output_relocs (
- 					continue;
- 				case R_XTENSA_32:
- 				case R_XTENSA_PLT:
--					goto good_32bit_resolved_reloc;
-+					if (bfd_big_endian (abs_bfd))
-+						sym_addr =
-+							(r_mem[0] << 24)
-+							+ (r_mem[1] << 16)
-+							+ (r_mem[2] << 8)
-+							+ r_mem[3];
-+					else
-+						sym_addr =
-+							r_mem[0]
-+							+ (r_mem[1] << 8)
-+							+ (r_mem[2] << 16)
-+							+ (r_mem[3] << 24);
-+					relocation_needed = 1;
-+					break;
- 				default:
- 					goto bad_resolved_reloc;
- #elif defined(TARGET_riscv64)
--- 
-2.41.0
-
diff --git a/package/elf2flt/0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch b/package/elf2flt/0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch
deleted file mode 100644
index 82e693f35f..0000000000
--- a/package/elf2flt/0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From 9ec7dd9dead2f3c4c73c3ab2166a1f81bfb41825 Mon Sep 17 00:00:00 2001
-From: Greg Ungerer <gerg@kernel.org>
-Date: Thu, 13 Apr 2023 22:58:20 +1000
-Subject: [PATCH] elf2flt: remove use of BFD_VMA_FMT
-
-In binutils-2.40 the BFD_VMA_FMT definition used for printf style
-formatting specifiers has been removed. For reference this was done in
-commit b82817674f46 ("Don't use BFD_VMA_FMT in binutils") in the
-binutils git development tree.
-
-BFD_VMA_FMT is used in a number of places in the elf2flt code to output
-bfd offsets, values and the like. So it is broken when using the bfd
-code from binutils-2.40 and newer.
-
-According to the binutils change PRIx64 (and friends) is used to replace
-it, with appropriate casts to keep it clean for 32 and 64 bit platforms.
-Change the elf2flt.c use of it in the same way to fix.
-
-This does not change the output in any way in normal use. This fix can
-be used on all versions of binutils (older and newer), there is no
-need to only do this on 2.40 and newer.
-
-Signed-off-by: Greg Ungerer <gerg@kernel.org>
-Upstream: https://github.com/uclinux-dev/elf2flt/commit/a36df7407d9e3f93ca6449841ff0821b0d980438
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- elf2flt.c | 58 ++++++++++++++++++++++++++++---------------------------
- 1 file changed, 30 insertions(+), 28 deletions(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 0fcb747..6685bff 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -220,8 +220,8 @@ dump_symbols(asymbol **symbol_table, long number_of_symbols)
-   long i;
-   printf("SYMBOL TABLE:\n");
-   for (i=0; i<number_of_symbols; i++) {
--	printf("  NAME=%s  VALUE=0x%"BFD_VMA_FMT"x\n",
--		symbol_table[i]->name, symbol_table[i]->value);
-+	printf("  NAME=%s  VALUE=0x%"PRIx64"\n",
-+		symbol_table[i]->name, (uint64_t) symbol_table[i]->value);
-   }
-   printf("\n");
-   return(0);
-@@ -466,8 +466,8 @@ output_relocs (
- 	if (r == NULL)
- 	  continue;
- 	if (verbose)
--	  printf(" RELOCS: %s [%p]: flags=0x%x vma=0x%"BFD_VMA_FMT"x\n",
--			r->name, r, r->flags, elf2flt_bfd_section_vma(r));
-+	  printf(" RELOCS: %s [%p]: flags=0x%x vma=0x%"PRIx64"\n",
-+			r->name, r, r->flags, (uint64_t) elf2flt_bfd_section_vma(r));
-   	if ((r->flags & SEC_RELOC) == 0)
-   	  continue;
- 	relsize = bfd_get_reloc_upper_bound(rel_bfd, r);
-@@ -952,12 +952,13 @@ output_relocs (
- 					if (verbose)
- 						fprintf(stderr,
- 							"%s vma=0x%x, "
--							"value=0x%"BFD_VMA_FMT"x, "
--							"address=0x%"BFD_VMA_FMT"x "
-+							"value=0x%"PRIx64", "
-+							"address=0x%"PRIx64" "
- 							"sym_addr=0x%x rs=0x%x, opcode=0x%x\n",
- 							"ABS32",
--							sym_vma, (*(q->sym_ptr_ptr))->value,
--							q->address, sym_addr,
-+							sym_vma, 
-+							(uint64_t) (*(q->sym_ptr_ptr))->value,
-+							(uint64_t) q->address, sym_addr,
- 							(*p)->howto->rightshift,
- 							*(uint32_t *)r_mem);
- 					sym_vma = elf2flt_bfd_section_vma(sym_section);
-@@ -971,12 +972,13 @@ output_relocs (
- 					if (verbose)
- 						fprintf(stderr,
- 							"%s vma=0x%x, "
--							"value=0x%"BFD_VMA_FMT"x, "
--							"address=0x%"BFD_VMA_FMT"x "
-+							"value=0x%"PRIx64", "
-+							"address=0x%"PRIx64" "
- 							"sym_addr=0x%x rs=0x%x, opcode=0x%x\n",
- 							"PLT32",
--							sym_vma, (*(q->sym_ptr_ptr))->value,
--							q->address, sym_addr,
-+							sym_vma,
-+							(uint64_t) (*(q->sym_ptr_ptr))->value,
-+							(uint64_t) q->address, sym_addr,
- 							(*p)->howto->rightshift,
- 							*(uint32_t *)r_mem);
- 				case R_ARM_PC24:
-@@ -994,8 +996,8 @@ output_relocs (
- 				case R_V850_ZDA_16_16_OFFSET:
- 				case R_V850_ZDA_16_16_SPLIT_OFFSET:
- 					/* Can't support zero-relocations.  */
--					printf ("ERROR: %s+0x%"BFD_VMA_FMT"x: zero relocations not supported\n",
--							sym_name, q->addend);
-+					printf ("ERROR: %s+0x%"PRIx64": zero relocations not supported\n",
-+							sym_name, (uint64_t) q->addend);
- 					continue;
- #endif /* TARGET_v850 */
- 
-@@ -1194,12 +1196,12 @@ output_relocs (
- 					temp |= (exist_val & 0x3f);
- 					*(unsigned long *)r_mem = htoniosl(temp);
- 					if (verbose)
--						printf("omit: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
-+						printf("omit: offset=0x%"PRIx64" symbol=%s%s "
- 								"section=%s size=%d "
--								"fixup=0x%x (reloc=0x%"BFD_VMA_FMT"x) GPREL\n",
--								q->address, sym_name, addstr,
-+								"fixup=0x%x (reloc=0x%"PRIx64") GPREL\n",
-+								(uint64_t) q->address, sym_name, addstr,
- 								section_name, sym_reloc_size,
--								sym_addr, section_vma + q->address);
-+								sym_addr, (uint64_t) section_vma + q->address);
- 					continue;
- 				}
- 				case R_NIOS2_PCREL16:
-@@ -1214,12 +1216,12 @@ output_relocs (
- 					exist_val |= ((sym_addr & 0xFFFF) << 6);
- 					*(unsigned long *)r_mem = htoniosl(exist_val);
- 					if (verbose)
--						printf("omit: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
-+						printf("omit: offset=0x%"PRIx64" symbol=%s%s "
- 								"section=%s size=%d "
--								"fixup=0x%x (reloc=0x%"BFD_VMA_FMT"x) PCREL\n",
--								q->address, sym_name, addstr,
-+								"fixup=0x%x (reloc=0x%"PRIx64") PCREL\n",
-+								(uint64_t) q->address, sym_name, addstr,
- 								section_name, sym_reloc_size,
--								sym_addr, section_vma + q->address);
-+								sym_addr, (uint64_t) section_vma + q->address);
- 					continue;
- 				}
- 
-@@ -1231,9 +1233,9 @@ output_relocs (
- 					    && (p[-1]->sym_ptr_ptr == p[0]->sym_ptr_ptr)
- 					    && (p[-1]->addend == p[0]->addend)) {
- 						if (verbose)
--							printf("omit: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
-+							printf("omit: offset=0x%"PRIx64" symbol=%s%s "
- 								"section=%s size=%d LO16\n",
--								q->address, sym_name, addstr,
-+								(uint64_t) q->address, sym_name, addstr,
- 								section_name, sym_reloc_size);
- 						continue;
- 					}
-@@ -1646,13 +1648,13 @@ DIS29_RELOCATION:
- 			 */
- 			if (relocation_needed) {
- 				if (verbose)
--					printf("  RELOC[%d]: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
-+					printf("  RELOC[%d]: offset=0x%"PRIx64" symbol=%s%s "
- 						"section=%s size=%d "
--						"fixup=0x%x (reloc=0x%"BFD_VMA_FMT"x)\n",
-+						"fixup=0x%x (reloc=0x%"PRIx64")\n",
- 						flat_reloc_count,
--						q->address, sym_name, addstr,
-+						(uint64_t) q->address, sym_name, addstr,
- 						section_name, sym_reloc_size,
--						sym_addr, section_vma + q->address);
-+						sym_addr, (uint64_t) section_vma + q->address);
- 
- #ifndef TARGET_bfin
- 				flat_relocs = realloc(flat_relocs,
--- 
-2.41.0
-
diff --git a/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
deleted file mode 100644
index 74d3085d08..0000000000
--- a/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5acfed0012f2fff9801b25403bd8a5e1c2ccfea2 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 7 Aug 2023 09:30:34 +0200
-Subject: [PATCH] riscv64: add more relocations required to be handled
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/uclinux-dev/elf2flt/pull/24
----
- elf2flt.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 6685bff..6b3bea4 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -850,11 +850,21 @@ output_relocs (
- 				default:
- 					goto bad_resolved_reloc;
- #elif defined(TARGET_riscv64)
-+				case R_RISCV_NONE:
- 				case R_RISCV_32_PCREL:
-+				case R_RISCV_ADD8:
-+				case R_RISCV_ADD16:
- 				case R_RISCV_ADD32:
- 				case R_RISCV_ADD64:
-+				case R_RISCV_SUB6:
-+				case R_RISCV_SUB8:
-+				case R_RISCV_SUB16:
- 				case R_RISCV_SUB32:
- 				case R_RISCV_SUB64:
-+				case R_RISCV_SET6:
-+				case R_RISCV_SET8:
-+				case R_RISCV_SET16:
-+				case R_RISCV_SET32:
- 					continue;
- 				case R_RISCV_32:
- 				case R_RISCV_64:
--- 
-2.39.2
-
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index c576f65cdb..4dc040645e 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6637432ed58dee2d42d09e3b9a902a0dd3b9975acba0c0b24ef9e4e9253159a9  elf2flt-2021.08.tar.gz
+sha256  735482d8c5fd76191e86ff2d6985dd68c232a7b8bdac11fdb480385c6a75ca8f  elf2flt-2023.09.tar.gz
 sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index b970de48f2..0def282c02 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 2021.08
+ELF2FLT_VERSION = 2023.09
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
-- 
2.41.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

