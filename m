Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A80C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C8654033D;
	Fri, 27 May 2022 19:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id keYTPhufflJY; Fri, 27 May 2022 19:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB2E428F2;
	Fri, 27 May 2022 19:13:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4398B1BF296
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADCD742996
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlZStkoDPHlx for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 518414299C
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 634F4866C2; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 20:56:29 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9b5db11a9fabb63a676128ab44fb947eb42b18dc
X-Git-Newrev: e63651aa79ef26e1882ec175b825d34d51f6ed8c
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.634F4866C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/elf2flt: update
 to version 2021.08
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e63651aa79ef26e1882ec175b825d34d51f6ed8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

It contains several fixes and improvements compared to our current
version, and two of our patches have been accepted upstream. Most
notably, it fixes the issue we had in using elf2flt with recent
versions of binutils (upstream commit
ba379d08bb78c9300e84351c11080c26ddcc36b3).

Patch 0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
is upstream as of commit 1c9b454336eaf38f7d037917a3120fae04193fbe

Patch 0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch is
upstream as of commit d7eb73163bcea31168c438fc132a0967ac172e3d

The other two patches are refreshed to apply properly on 2021.08.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 65d78dcfeb8b2eafaebe2d0c3c8c42e7e85f46ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tch => 0001-elf2flt-handle-binutils-2.34.patch} |  78 ++++-----
 ...behave-properly-when-called-with-a-name-d.patch |  79 ---------
 ...> 0002-elf2flt-add-riscv-64-bits-support.patch} |  38 ++---
 ...flt.c-add-new-relocation-types-for-xtensa.patch | 188 ---------------------
 package/elf2flt/elf2flt.hash                       |   2 +-
 package/elf2flt/elf2flt.mk                         |   4 +-
 6 files changed, 57 insertions(+), 332 deletions(-)

diff --git a/package/elf2flt/0003-elf2flt-handle-binutils-2.34.patch b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
similarity index 89%
rename from package/elf2flt/0003-elf2flt-handle-binutils-2.34.patch
rename to package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
index 16d5633385..4aa473c244 100644
--- a/package/elf2flt/0003-elf2flt-handle-binutils-2.34.patch
+++ b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
@@ -1,4 +1,4 @@
-From 26165906f85d82f0a4456f34b5c60fcaaef48535 Mon Sep 17 00:00:00 2001
+From d78acba6510527aaa01a41eaf4c931f7a57e5f44 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Wed, 5 Feb 2020 10:31:32 +0100
 Subject: [PATCH] elf2flt: handle binutils >= 2.34
@@ -30,7 +30,7 @@ Signed-off-by: Romain Naour <romain.naour@smile.fr>
  2 files changed, 61 insertions(+), 36 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e82eb1d..cf7dea8 100644
+index b7db2cb..fdc0876 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -229,6 +229,22 @@ AC_CHECK_FUNCS([ \
@@ -57,7 +57,7 @@ index e82eb1d..cf7dea8 100644
  	CFLAGS="-Wall $CFLAGS"
  	if test "$werror" = 1 ; then
 diff --git a/elf2flt.c b/elf2flt.c
-index b93aecd..3bcf4fe 100644
+index 7ac0617..ea6b5a1 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
 @@ -149,6 +149,17 @@ const char *elf2flt_progname;
@@ -100,7 +100,7 @@ index b93aecd..3bcf4fe 100644
  
  	if (verbose)
  		printf("SECTION: %s [%p]: flags=0x%x vma=0x%"PRIx32"\n",
-@@ -442,7 +451,7 @@ output_relocs (
+@@ -443,7 +452,7 @@ output_relocs (
  	  continue;
  	if (verbose)
  	  printf(" RELOCS: %s [%p]: flags=0x%x vma=0x%"BFD_VMA_FMT"x\n",
@@ -109,7 +109,7 @@ index b93aecd..3bcf4fe 100644
    	if ((r->flags & SEC_RELOC) == 0)
    	  continue;
  	relsize = bfd_get_reloc_upper_bound(rel_bfd, r);
-@@ -694,7 +703,7 @@ output_relocs (
+@@ -695,7 +704,7 @@ output_relocs (
  				case R_BFIN_RIMM16:
  				case R_BFIN_LUIMM16:
  				case R_BFIN_HUIMM16:
@@ -118,7 +118,7 @@ index b93aecd..3bcf4fe 100644
  				    sym_addr += sym_vma + q->addend;
  
  				    if (weak_und_symbol(sym_section->name, (*(q->sym_ptr_ptr))))
-@@ -727,7 +736,7 @@ output_relocs (
+@@ -728,7 +737,7 @@ output_relocs (
  				    break;
  
  				case R_BFIN_BYTE4_DATA:
@@ -127,7 +127,7 @@ index b93aecd..3bcf4fe 100644
  				    sym_addr += sym_vma + q->addend;
  
  				    if (weak_und_symbol (sym_section->name, (*(q->sym_ptr_ptr))))
-@@ -885,7 +894,7 @@ output_relocs (
+@@ -886,7 +895,7 @@ output_relocs (
  #if defined(TARGET_m68k)
  				case R_68K_32:
  					relocation_needed = 1;
@@ -136,7 +136,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					break;
  				case R_68K_PC16:
-@@ -910,7 +919,7 @@ output_relocs (
+@@ -911,7 +920,7 @@ output_relocs (
  							q->address, sym_addr,
  							(*p)->howto->rightshift,
  							*(uint32_t *)r_mem);
@@ -145,7 +145,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					break;
  				case R_ARM_GOT32:
-@@ -938,7 +947,7 @@ output_relocs (
+@@ -939,7 +948,7 @@ output_relocs (
  #ifdef TARGET_v850
  				case R_V850_ABS32:
  					relocation_needed = 1;
@@ -154,7 +154,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					break;
  				case R_V850_ZDA_16_16_OFFSET:
-@@ -960,7 +969,7 @@ output_relocs (
+@@ -961,7 +970,7 @@ output_relocs (
  					sym_addr = (*(q->sym_ptr_ptr))->value;
  					q->address -= 1;
  					r_mem -= 1; /* tracks q->address */
@@ -163,7 +163,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					sym_addr |= (*(unsigned char *)r_mem<<24);
  					break;
-@@ -973,7 +982,7 @@ output_relocs (
+@@ -974,7 +983,7 @@ output_relocs (
  					/* Absolute symbol done not relocation */
  					relocation_needed = !bfd_is_abs_section(sym_section);
  					sym_addr = (*(q->sym_ptr_ptr))->value;
@@ -172,7 +172,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					break;
  				case R_H8_DIR32:
-@@ -986,7 +995,7 @@ output_relocs (
+@@ -987,7 +996,7 @@ output_relocs (
  					}
  					relocation_needed = 1;
  					sym_addr = (*(q->sym_ptr_ptr))->value;
@@ -181,7 +181,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					break;
  				case R_H8_PCREL16:
-@@ -1012,7 +1021,7 @@ output_relocs (
+@@ -1013,7 +1022,7 @@ output_relocs (
  #ifdef TARGET_microblaze
  				case R_MICROBLAZE_64:
  					/* work out the relocation */
@@ -190,7 +190,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					/* Write relocated pointer back */
  					r_mem[2] = (sym_addr >> 24) & 0xff;
-@@ -1026,7 +1035,7 @@ output_relocs (
+@@ -1027,7 +1036,7 @@ output_relocs (
  					pflags = 0x80000000;
  					break;
  				case R_MICROBLAZE_32:
@@ -199,7 +199,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					relocation_needed = 1;
  					break;
-@@ -1058,7 +1067,7 @@ output_relocs (
+@@ -1059,7 +1068,7 @@ output_relocs (
  				case R_NIOS2_BFD_RELOC_32:
  					relocation_needed = 1;
  					pflags = (FLAT_NIOS2_R_32 << 28);
@@ -208,25 +208,25 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					/* modify target, in target order */
  					*(unsigned long *)r_mem = htoniosl(sym_addr);
-@@ -1068,7 +1077,7 @@ output_relocs (
+@@ -1069,7 +1078,7 @@ output_relocs (
  					unsigned long exist_val;
  					relocation_needed = 1;
  					pflags = (FLAT_NIOS2_R_CALL26 << 28);
 -					sym_vma = bfd_section_vma(abs_bfd, sym_section);
 +					sym_vma = elf2flt_bfd_section_vma(sym_section);
  					sym_addr += sym_vma + q->addend;
- 					
+ 
  					/* modify target, in target order */
-@@ -1099,7 +1108,7 @@ output_relocs (
+@@ -1100,7 +1109,7 @@ output_relocs (
  								? FLAT_NIOS2_R_HIADJ_LO : FLAT_NIOS2_R_HI_LO;
  							pflags <<= 28;
- 						
+ 
 -							sym_vma = bfd_section_vma(abs_bfd, sym_section);
-+							sym_vma = elf2flt_bfd_section_vma(sym_section);
++							sym_vma = elf2flt_bfd_section_vma(abs_bfd, sym_section);
  							sym_addr += sym_vma + q->addend;
  
  							/* modify high 16 bits, in target order */
-@@ -1132,7 +1141,7 @@ output_relocs (
+@@ -1133,7 +1142,7 @@ output_relocs (
  						goto NIOS2_RELOC_ERR;
  					}
  					/* _gp holds a absolute value, otherwise the ld cannot generate correct code */
@@ -235,7 +235,7 @@ index b93aecd..3bcf4fe 100644
  					//printf("sym=%x, %d, _gp=%x, %d\n", sym_addr+sym_vma, sym_addr+sym_vma, gp, gp);
  					sym_addr += sym_vma + q->addend;
  					sym_addr -= gp;
-@@ -1213,7 +1222,7 @@ NIOS2_RELOC_ERR:
+@@ -1214,7 +1223,7 @@ NIOS2_RELOC_ERR:
  				case R_SPARC_32:
  				case R_SPARC_UA32:
  					relocation_needed = 1;
@@ -244,7 +244,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					break;
  				case R_SPARC_PC22:
-@@ -1232,7 +1241,7 @@ NIOS2_RELOC_ERR:
+@@ -1233,7 +1242,7 @@ NIOS2_RELOC_ERR:
  				case R_SPARC_HI22:
  					relocation_needed = 1;
  					pflags = 0x80000000;
@@ -253,7 +253,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					sym_addr |= (
  						htonl(*(uint32_t *)r_mem)
-@@ -1242,7 +1251,7 @@ NIOS2_RELOC_ERR:
+@@ -1243,7 +1252,7 @@ NIOS2_RELOC_ERR:
  				case R_SPARC_LO10:
  					relocation_needed = 1;
  					pflags = 0x40000000;
@@ -262,7 +262,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					sym_addr &= 0x000003ff;
  					sym_addr |= (
-@@ -1256,7 +1265,7 @@ NIOS2_RELOC_ERR:
+@@ -1257,7 +1266,7 @@ NIOS2_RELOC_ERR:
  #ifdef TARGET_sh
  				case R_SH_DIR32:
  					relocation_needed = 1;
@@ -271,7 +271,7 @@ index b93aecd..3bcf4fe 100644
  					sym_addr += sym_vma + q->addend;
  					break;
  				case R_SH_REL32:
-@@ -1288,7 +1297,7 @@ NIOS2_RELOC_ERR:
+@@ -1289,7 +1298,7 @@ NIOS2_RELOC_ERR:
  				case R_E1_CONST31:
  						relocation_needed = 1;
  						DBG_E1("Handling Reloc <CONST31>\n");
@@ -280,7 +280,7 @@ index b93aecd..3bcf4fe 100644
  						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x], q->address : [0x%x]\n",
  										sec_vma, sym_addr, q->address);
  						sym_addr = sec_vma + sym_addr;
-@@ -1303,7 +1312,7 @@ NIOS2_RELOC_ERR:
+@@ -1304,7 +1313,7 @@ NIOS2_RELOC_ERR:
  						relocation_needed = 0;
  						DBG_E1("Handling Reloc <CONST31_PCREL>\n");
  						DBG_E1("DONT RELOCATE AT LOADING\n");
@@ -289,7 +289,7 @@ index b93aecd..3bcf4fe 100644
  						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x], q->address : [0x%x]\n",
  										sec_vma, sym_addr, q->address);
  						sym_addr =  sec_vma + sym_addr;
-@@ -1330,7 +1339,7 @@ NIOS2_RELOC_ERR:
+@@ -1331,7 +1340,7 @@ NIOS2_RELOC_ERR:
  						relocation_needed = 0;
  						DBG_E1("Handling Reloc <DIS29W_PCREL>\n");
  						DBG_E1("DONT RELOCATE AT LOADING\n");
@@ -298,7 +298,7 @@ index b93aecd..3bcf4fe 100644
  						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x], q->address : [0x%x]\n",
  										sec_vma, sym_addr, q->address);
  						sym_addr =  sec_vma + sym_addr;
-@@ -1363,7 +1372,7 @@ NIOS2_RELOC_ERR:
+@@ -1364,7 +1373,7 @@ NIOS2_RELOC_ERR:
  						DBG_E1("Handling Reloc <DIS29B>\n");
  DIS29_RELOCATION:
  						relocation_needed = 1;
@@ -307,7 +307,7 @@ index b93aecd..3bcf4fe 100644
  						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%08x]\n",
  										sec_vma, sym_addr);
  						sym_addr =  sec_vma + sym_addr;
-@@ -1380,7 +1389,7 @@ DIS29_RELOCATION:
+@@ -1381,7 +1390,7 @@ DIS29_RELOCATION:
  						relocation_needed = 0;
  						DBG_E1("Handling Reloc <IMM32_PCREL>\n");
  						DBG_E1("DONT RELOCATE AT LOADING\n");
@@ -316,7 +316,7 @@ index b93aecd..3bcf4fe 100644
  						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x]\n",
  										sec_vma, sym_addr);
  						sym_addr =  sec_vma + sym_addr;
-@@ -1406,7 +1415,7 @@ DIS29_RELOCATION:
+@@ -1407,7 +1416,7 @@ DIS29_RELOCATION:
  				case R_E1_IMM32:
  						relocation_needed = 1;
  						DBG_E1("Handling Reloc <IMM32>\n");
@@ -325,7 +325,7 @@ index b93aecd..3bcf4fe 100644
  						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x]\n",
  										sec_vma, sym_addr);
  						sym_addr =  sec_vma + sym_addr;
-@@ -1422,7 +1431,7 @@ DIS29_RELOCATION:
+@@ -1423,7 +1432,7 @@ DIS29_RELOCATION:
  				case R_E1_WORD:
  						relocation_needed = 1;
  						DBG_E1("Handling Reloc <WORD>\n");
@@ -334,7 +334,7 @@ index b93aecd..3bcf4fe 100644
  						DBG_E1("sec_vma : [0x%x], sym_addr : [0x%x]\n",
  										sec_vma, sym_addr);
  						sym_addr =  sec_vma + sym_addr;
-@@ -1449,7 +1458,7 @@ DIS29_RELOCATION:
+@@ -1450,7 +1459,7 @@ DIS29_RELOCATION:
  			}
  
  			sprintf(&addstr[0], "+0x%lx", sym_addr - (*(q->sym_ptr_ptr))->value -
@@ -343,7 +343,7 @@ index b93aecd..3bcf4fe 100644
  
  
  			/*
-@@ -1887,8 +1896,8 @@ int main(int argc, char *argv[])
+@@ -1890,8 +1899,8 @@ int main(int argc, char *argv[])
      } else
        continue;
  
@@ -354,8 +354,8 @@ index b93aecd..3bcf4fe 100644
  
      if (sec_vma < *vma) {
        if (*len > 0)
-@@ -1913,7 +1922,7 @@ int main(int argc, char *argv[])
-     if (s->flags & SEC_CODE) 
+@@ -1920,7 +1929,7 @@ int main(int argc, char *argv[])
+                     (SEC_DATA | SEC_READONLY | SEC_RELOC)))
        if (!bfd_get_section_contents(abs_bfd, s,
  				   text + (s->vma - text_vma), 0,
 -				   bfd_section_size(abs_bfd, s)))
@@ -363,8 +363,8 @@ index b93aecd..3bcf4fe 100644
        {
  	fatal("read error section %s", s->name);
        }
-@@ -1939,7 +1948,7 @@ int main(int argc, char *argv[])
-     if (s->flags & SEC_DATA) 
+@@ -1950,7 +1959,7 @@ int main(int argc, char *argv[])
+                     (SEC_READONLY | SEC_RELOC)))
        if (!bfd_get_section_contents(abs_bfd, s,
  				   data + (s->vma - data_vma), 0,
 -				   bfd_section_size(abs_bfd, s)))
@@ -373,5 +373,5 @@ index b93aecd..3bcf4fe 100644
  	fatal("read error section %s", s->name);
        }
 -- 
-2.25.4
+2.35.1
 
diff --git a/package/elf2flt/0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch b/package/elf2flt/0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
deleted file mode 100644
index a27c4913fb..0000000000
--- a/package/elf2flt/0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From b31e9b1bff6832063816b972395179859d1d4619 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 13 Aug 2017 16:03:20 +0200
-Subject: [PATCH] ld-elf2flt: behave properly when called with a name different
- from TARGET_ALIAS
-
-ld-elf2flt currently handles two cases:
-
- 1 It is called as the wrapper for <TARGET_ALIAS>-ld, generally
-   installed in the bin/ directory of a toolchain.
-
- 2 It is called as the wrapper for "ld", generally installed in the
-   TARGET_ALIAS/bin/ directory of a toolchain.
-
-Unfortunately, if for some reason it gets called using a FOOBAR-ld
-name that is different from <TARGET_ALIAS>-ld, it assumes it is in
-case (2), while it really is in case (1). Due to this, the path
-mangling logic doesn't work, and it doesn't find ld.real.
-
-This happens for example when the binary program in bin/ is named
-arm-buildroot-uclinux-uclibcgnueabi-ld, but also has a simpler symlink
-named arm-linux-ld. In this case,
-arm-buildroot-uclinux-uclibcgnueabi-ld is recognized by ld-elf2flt as
-containing TARGET_ALIAS, and therefore the proper logic to find
-ld.real is applied. However, when arm-linux-ld is used, ld-elf2flt
-doesn't find TARGET_ALIAS, and therefore assumes we're being called as
-TARGET_ALIAS/bin/ld.. and searches for a program called ld.real in
-bin/, which doesn't exist.
-
-See:
-
-$ ./output/host/bin/arm-buildroot-uclinux-uclibcgnueabi-ld
-/home/thomas/buildroot/buildroot/output/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: no input files
-
-$ ./output/host/bin/arm-linux-ld
-arm-linux-ld (ld-elf2flt): error trying to exec '/home/thomas/buildroot/buildroot/output/host/bin/ld.real': execvp: No such file or directory
-
-$ ./output/host/arm-buildroot-uclinux-uclibcgnueabi/bin/ld
-/home/thomas/buildroot/buildroot/output/host/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: no input files
-
-This commit fixes that by inverting the logic: if we're being called
-as just "ld", then we assume it's the program in
-TARGET_ALIAS/bin/. Otherwise, we're called through some variant of
-TARGET-ld.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream: https://github.com/uclinux-dev/elf2flt/pull/8
----
- ld-elf2flt.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/ld-elf2flt.c b/ld-elf2flt.c
-index de39fe0..c187c2e 100644
---- a/ld-elf2flt.c
-+++ b/ld-elf2flt.c
-@@ -506,15 +506,15 @@ int main(int argc, char *argv[])
- 	   the host while those in <TARGET_ALIAS>/lib are for the target.
- 	   Make bindir point to the bin dir for bin/<TARGET_ALIAS>-foo.
- 	   Make tooldir point to the bin dir for <TARGET_ALIAS>/bin/foo.  */
--	if (streqn(elf2flt_progname, TARGET_ALIAS)) {
--		tmp = concat(argv0_dir, "../" TARGET_ALIAS "/bin", NULL);
-+	if (streqn(elf2flt_progname, "ld")) {
-+		tmp = concat(argv0_dir, "../../bin", NULL);
- 		if (stat(tmp, &buf) == 0 && S_ISDIR(buf.st_mode)) {
--			tooldir = concat(tmp, "/", NULL);
-+			bindir = concat(tmp, "/", NULL);
- 		}
- 	} else {
--		tmp = concat(argv0_dir, "../../bin", NULL);
-+		tmp = concat(argv0_dir, "../" TARGET_ALIAS "/bin", NULL);
- 		if (stat(tmp, &buf) == 0 && S_ISDIR(buf.st_mode)) {
--			bindir = concat(tmp, "/", NULL);
-+			tooldir = concat(tmp, "/", NULL);
- 		}
- 	}
- 
--- 
-2.9.4
-
diff --git a/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
similarity index 83%
rename from package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
rename to package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
index 4b00758446..c530bc020d 100644
--- a/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
+++ b/package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
@@ -1,4 +1,4 @@
-From 1dea576eac4289602adc4a37f48c80330bf82e63 Mon Sep 17 00:00:00 2001
+From 3879965dfda08a24e7d44ed76bbcc2f4a41df1fa Mon Sep 17 00:00:00 2001
 From: Damien Le Moal <damien.lemoal@wdc.com>
 Date: Wed, 9 Sep 2020 17:31:33 +0900
 Subject: [PATCH] elf2flt: add riscv 64-bits support
@@ -26,15 +26,15 @@ This patch is based on earlier work by Christoph Hellwig <hch@lst.de>.
 Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
 ---
  elf2flt.c     | 23 +++++++++++++++++++++++
- elf2flt.ld.in |  9 +++++----
+ elf2flt.ld.in |  1 +
  ld-elf2flt.c  | 16 ++++++++++++++++
- 3 files changed, 44 insertions(+), 4 deletions(-)
+ 3 files changed, 40 insertions(+)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index f87f1fc..dbce467 100644
+index ea6b5a1..7100c20 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
-@@ -80,6 +80,8 @@ const char *elf2flt_progname;
+@@ -81,6 +81,8 @@ const char *elf2flt_progname;
  #include <elf/v850.h>
  #elif defined(TARGET_xtensa)
  #include <elf/xtensa.h>
@@ -43,7 +43,7 @@ index f87f1fc..dbce467 100644
  #endif
  
  #if defined(__MINGW32__)
-@@ -122,6 +124,8 @@ const char *elf2flt_progname;
+@@ -123,6 +125,8 @@ const char *elf2flt_progname;
  #define ARCH	"nios2"
  #elif defined(TARGET_xtensa)
  #define ARCH	"xtensa"
@@ -52,7 +52,7 @@ index f87f1fc..dbce467 100644
  #else
  #error "Don't know how to support your CPU architecture??"
  #endif
-@@ -797,6 +801,16 @@ output_relocs (
+@@ -821,6 +825,16 @@ output_relocs (
  					goto good_32bit_resolved_reloc;
  				default:
  					goto bad_resolved_reloc;
@@ -69,7 +69,7 @@ index f87f1fc..dbce467 100644
  #else
  				default:
  					/* The default is to assume that the
-@@ -1806,6 +1820,15 @@ int main(int argc, char *argv[])
+@@ -1841,6 +1855,15 @@ int main(int argc, char *argv[])
    if (!load_to_ram && !pfile)
      load_to_ram = 1;
  
@@ -86,27 +86,19 @@ index f87f1fc..dbce467 100644
  
    if (pfile) {
 diff --git a/elf2flt.ld.in b/elf2flt.ld.in
-index ec1fe6f..c0c44b8 100644
+index 0df999d..f1eed1f 100644
 --- a/elf2flt.ld.in
 +++ b/elf2flt.ld.in
-@@ -70,10 +70,11 @@ W_RODAT		*(.gnu.linkonce.r*)
+@@ -109,6 +109,7 @@ W_RODAT:	*(.gnu.linkonce.r*)
  		. = ALIGN(0x20) ;
  		LONG(-1)
  		. = ALIGN(0x20) ;
--R_RODAT		*(.rodata)
--R_RODAT		*(.rodata1)
--R_RODAT		*(.rodata.*)
--R_RODAT		*(.gnu.linkonce.r*)
 +RISCV_GP:	__global_pointer$ = . + 0x800 ;
-+R_RODAT 	*(.rodata)
-+R_RODAT 	*(.rodata1)
-+R_RODAT 	*(.rodata.*)
-+R_RODAT 	*(.gnu.linkonce.r*)
- 		*(.data)
- 		*(.data1)
- 		*(.data.*)
+ R_RODAT:	*(.rodata)
+ R_RODAT:	*(.rodata1)
+ R_RODAT:	*(.rodata.*)
 diff --git a/ld-elf2flt.c b/ld-elf2flt.c
-index e5de506..31b565f 100644
+index 7cb02d5..1a503dd 100644
 --- a/ld-elf2flt.c
 +++ b/ld-elf2flt.c
 @@ -324,6 +324,22 @@ static int do_final_link(void)
@@ -133,5 +125,5 @@ index e5de506..31b565f 100644
  	if (!linker_script)
  		linker_script = concat(ldscriptpath, "/elf2flt.ld", NULL);
 -- 
-2.31.1
+2.35.1
 
diff --git a/package/elf2flt/0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch b/package/elf2flt/0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch
deleted file mode 100644
index 953bd79ccf..0000000000
--- a/package/elf2flt/0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From d7eb73163bcea31168c438fc132a0967ac172e3d Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 7 May 2020 21:11:43 -0700
-Subject: [PATCH] elf2flt.c: add new relocation types for xtensa
-
-Xtensa have added new relocation types R_XTENSA_[NP]DIFF{8,16,32} with
-the same properties as the existing types R_XTENSA_DIFF{8,16,32}.
-Add them to the list of ignored relocation types.
-
-This fixes the following error when invoking elf2flt on xtensa binaries
-built with the recent binutils:
-
-  ERROR: reloc type R_XTENSA_PDIFF32 unsupported in this context
-
-Reported-by: Romain Naour <romain.naour@gmail.com>
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Backported from: d7eb73163bcea31168c438fc132a0967ac172e3d
----
- Makefile.in  |  3 ++-
- configure    | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
- configure.ac | 14 ++++++++++++
- elf2flt.c    |  8 +++++++
- 4 files changed, 88 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 52b3347d7f43..0529c7f0a25a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -30,7 +30,8 @@ DEFS = @DEFS@ \
- 	-DNO_GOT_CHECK=@got_check@ \
- 	-DUSE_EMIT_RELOCS=@emit_relocs@ \
- 	-DEMIT_CTOR_DTOR=@emit_ctor_dtor@ \
--	-DALWAYS_RELOC_TEXT=@always_reloc_text@
-+	-DALWAYS_RELOC_TEXT=@always_reloc_text@ \
-+	-DHAVE_BFD_XTENSA_PDIFF_RELOCS=@HAVE_BFD_XTENSA_PDIFF_RELOCS@
- EXEEXT = @EXEEXT@
- OBJEXT = @OBJEXT@
- 
-diff --git a/configure b/configure
-index bb8e33f9cb28..bca38c34247e 100755
---- a/configure
-+++ b/configure
-@@ -621,6 +621,7 @@ ac_includes_default="\
- 
- ac_subst_vars='LTLIBOBJS
- LIBOBJS
-+HAVE_BFD_XTENSA_PDIFF_RELOCS
- SYMBOL_PREFIX
- always_reloc_text
- emit_ctor_dtor
-@@ -1729,6 +1730,52 @@ fi
- 
- } # ac_fn_c_try_link
- 
-+# ac_fn_c_check_decl LINENO SYMBOL VAR INCLUDES
-+# ---------------------------------------------
-+# Tests whether SYMBOL is declared in INCLUDES, setting cache variable VAR
-+# accordingly.
-+ac_fn_c_check_decl ()
-+{
-+  as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-+  as_decl_name=`echo $2|sed 's/ *(.*//'`
-+  as_decl_use=`echo $2|sed -e 's/(/((/' -e 's/)/) 0&/' -e 's/,/) 0& (/g'`
-+  { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether $as_decl_name is declared" >&5
-+$as_echo_n "checking whether $as_decl_name is declared... " >&6; }
-+if eval \${$3+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+$4
-+int
-+main ()
-+{
-+#ifndef $as_decl_name
-+#ifdef __cplusplus
-+  (void) $as_decl_use;
-+#else
-+  (void) $as_decl_name;
-+#endif
-+#endif
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  eval "$3=yes"
-+else
-+  eval "$3=no"
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+fi
-+eval ac_res=\$$3
-+	       { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
-+$as_echo "$ac_res" >&6; }
-+  eval $as_lineno_stack; ${as_lineno_stack:+:} unset as_lineno
-+
-+} # ac_fn_c_check_decl
-+
- # ac_fn_c_check_func LINENO FUNC VAR
- # ----------------------------------
- # Tests whether FUNC exists, setting the cache variable VAR accordingly
-@@ -4272,6 +4319,22 @@ $as_echo "#define const /**/" >>confdefs.h
- fi
- 
- 
-+HAVE_BFD_XTENSA_PDIFF_RELOCS=0
-+case $target in
-+	xtensa*)
-+		OLD_CPPFLAGS=$CPPFLAGS
-+		CPPFLAGS="-I$bfd_include_dir -I$binutils_include_dir $CPPFLAGS"
-+		ac_fn_c_check_decl "$LINENO" "R_XTENSA_PDIFF8" "ac_cv_have_decl_R_XTENSA_PDIFF8" "#include \"bfd.h\"
-+			       #include \"elf/xtensa.h\"
-+"
-+if test "x$ac_cv_have_decl_R_XTENSA_PDIFF8" = xyes; then :
-+  HAVE_BFD_XTENSA_PDIFF_RELOCS=1
-+fi
-+
-+		CPPFLAGS=$OLD_CPPFLAGS
-+		;;
-+esac
-+
- for ac_func in vprintf
- do :
-   ac_fn_c_check_func "$LINENO" "vprintf" "ac_cv_func_vprintf"
-@@ -4333,6 +4396,7 @@ fi
- 
- 
- 
-+
- ac_config_files="$ac_config_files ld-elf2flt.sh:ld-elf2flt.in Makefile elf2flt.ld"
- 
- cat >confcache <<\_ACEOF
-diff --git a/configure.ac b/configure.ac
-index d6b4119eb18a..19969b1045f6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -202,6 +202,19 @@ AC_CHECK_HEADERS(fcntl.h unistd.h bfd.h)
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
- 
-+HAVE_BFD_XTENSA_PDIFF_RELOCS=0
-+case $target in
-+	xtensa*)
-+		AS_VAR_COPY([OLD_CPPFLAGS], [CPPFLAGS])
-+		AS_VAR_SET([CPPFLAGS], ["-I$bfd_include_dir -I$binutils_include_dir $CPPFLAGS"])
-+		AC_CHECK_DECL([R_XTENSA_PDIFF8],
-+			      [HAVE_BFD_XTENSA_PDIFF_RELOCS=1],,
-+			      [#include "bfd.h"
-+			       #include "elf/xtensa.h"])
-+		AS_VAR_COPY([CPPFLAGS], [OLD_CPPFLAGS])
-+		;;
-+esac
-+
- dnl Checks for library functions.
- AC_FUNC_VPRINTF
- 
-@@ -235,6 +248,7 @@ AC_SUBST(emit_relocs)
- AC_SUBST(emit_ctor_dtor)
- AC_SUBST(always_reloc_text)
- AC_SUBST(SYMBOL_PREFIX)
-+AC_SUBST(HAVE_BFD_XTENSA_PDIFF_RELOCS)
- 
- AC_OUTPUT(ld-elf2flt.sh:ld-elf2flt.in Makefile elf2flt.ld)
- 
-diff --git a/elf2flt.c b/elf2flt.c
-index b7c4a490df02..961534973f56 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -776,6 +776,14 @@ output_relocs (
- 				case R_XTENSA_DIFF8:
- 				case R_XTENSA_DIFF16:
- 				case R_XTENSA_DIFF32:
-+#if HAVE_BFD_XTENSA_PDIFF_RELOCS
-+				case R_XTENSA_PDIFF8:
-+				case R_XTENSA_PDIFF16:
-+				case R_XTENSA_PDIFF32:
-+				case R_XTENSA_NDIFF8:
-+				case R_XTENSA_NDIFF16:
-+				case R_XTENSA_NDIFF32:
-+#endif
- 				case R_XTENSA_32_PCREL:
- 					continue;
- 				case R_XTENSA_32:
--- 
-2.20.1
-
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index c4b0697fcd..c576f65cdb 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d63baae6fe0d7fcc50a635be151a6f9e1e83dba30568046a869a395c15bf6284  elf2flt-7e33f28df198c46764021ed14408bd262751e148.tar.gz
+sha256  6637432ed58dee2d42d09e3b9a902a0dd3b9975acba0c0b24ef9e4e9253159a9  elf2flt-2021.08.tar.gz
 sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 3239af1b9a..11cacaf9e0 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 7e33f28df198c46764021ed14408bd262751e148
-ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
+ELF2FLT_VERSION = 2021.08
+ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
