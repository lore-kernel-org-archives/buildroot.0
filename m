Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A75C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 10:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1E6640B97;
	Wed, 10 Aug 2022 10:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1E6640B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jz_SftW1mjR2; Wed, 10 Aug 2022 10:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F27340BB2;
	Wed, 10 Aug 2022 10:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F27340BB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DC601BF48C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 494EE60E67
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 494EE60E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XK2_1k7LeQUi for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 10:17:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29ACC61044
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29ACC61044
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 10:17:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,227,1654531200"; d="scan'208";a="208330213"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Aug 2022 18:10:08 +0800
IronPort-SDR: 4/GhE+6VbexCH89qOt3F8vEoPqNfVNAk9gybiAxiXLy/IwinS9QB35UQAWd+DcueC/nu8mIxHe
 TZtSeyyvE9aa+o0NhnCw/Uw8MyWATW1IpJ7u/GVPr0lOxzwairdC+6eeVhqyOISt8a62ul8k2C
 zjdA1MobZbw+rvnB89Yqpw4n4ZHYL3U53jo3DHDr3QhP9PnKzTHvW81MwjHFoEejHb3CxWSDR8
 kYXbdchISCXUXQ1QURhQ73/unDY99oCi9Bgl499VSQUJn1gMp5pPStv16Vwv3ayFY1hDlhGOL9
 ByJv0zOAsf+kSlLDyESIEl+r
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 02:25:44 -0700
IronPort-SDR: nxheKZvxzFVIIWSYxprQKufPZE5uxXP/dgLi1K3Ils+C6VGbS1/5ULME2AFdW8g7aSVW0vttPV
 FQDhArUFVQ6jPENfmN9yq3SifJcSOd5VxQ+gRe8IprGQfXUfsFbLvnnVQE2UGfDdVwaLEBmzfS
 W2+vqI5IDeFGiP2JL+b2kSPukim48OqAlKdpBopbsw8rRowjQgXoafDplJUlGXEUj7kKkg+/0t
 xlHpThRQC1CoxLx+l0mZYBF1/+qlbOUpS0ypz4Qv4fJpIh/SmuzjO+In8iarXhsT9nCIegN9iX
 dwc=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.86])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2022 03:10:08 -0700
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Aug 2022 12:09:59 +0200
Message-Id: <20220810100959.3160670-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810100959.3160670-1-niklas.cassel@wdc.com>
References: <20220810100959.3160670-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660126635; x=1691662635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QpFboHPWPSG2CQasSzSPWxHhXv/BsrdES24CZtO140A=;
 b=Ii/a3tZuV5qQqh8JuZAUq3J0S73v13H+WxHK4Tw0YlFK+Umks0LyoZNa
 m3Z9wo4HGGZD37jPS0xvJpgon16nJcl0+9KGj1gWwjgqafBHZtpcQt/j6
 gAWKZ4eL6rv8I4LM2KC4tkwAoJCFdeI9TENb1+ccZZ8WiLnRLMcZDkfv7
 GXvzbgNhx18BdgXv4jgY/2zbbSWZPCx+YmohmjokcLof2qfniuZQKpRuB
 sJPN/PKUByWu3GK7yDqxyVx7Av6NB3O1/JYhBMjjvX/vWZ+sFzgxmlUy1
 pk01Yerqf0WrgN+Yf7o4Qm7H4SAdg9GHurCFiuEmmk+VEst//q9q1B+sR
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Ii/a3tZu
Subject: [Buildroot] [PATCH 2/2] package/elf2flt: add another .eh_frame
 section handling patch
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds another .eh_frame section handling patch.

Without this patch, both m68k and riscv64 would result in a fatal error:
ERROR: text=0x3bab8 overlaps data=0x33f60 ?

With this patch, qemu_m68k_mcf5208_defconfig and
qemu_riscv64_nommu_virt_defconfig both builds and boots properly.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 ...2flt-create-a-common-helper-function.patch | 76 +++++++++++++++++++
 ...l-error-regression-on-m68k-and-riscv.patch | 72 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
 create mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-and-riscv.patch

diff --git a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
new file mode 100644
index 0000000000..49d305f35a
--- /dev/null
+++ b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
@@ -0,0 +1,76 @@
+From d1dde619e277369782ccf50e4b54484520e3a6b6 Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Tue, 9 Aug 2022 12:13:50 +0200
+Subject: [PATCH 1/2] elf2flt: create a common helper function
+
+In order to make the code more maintainable,
+move duplicated code to a common helper function.
+
+No functional change intended.
+
+Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
+---
+ elf2flt.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 669591e..9c32f9a 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -337,6 +337,13 @@ compare_relocs (const void *pa, const void *pb)
+ }
+ #endif
+ 
++static bool
++ro_reloc_data_section_should_be_in_text(asection *s)
++{
++  return (s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
++	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
++}
++
+ static uint32_t *
+ output_relocs (
+   bfd *abs_bfd,
+@@ -428,8 +435,7 @@ output_relocs (
+ 	 */
+ 	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
+ 	    ((a->flags & SEC_CODE) ||
+-	    ((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-		         (SEC_DATA | SEC_READONLY | SEC_RELOC))))
++	     ro_reloc_data_section_should_be_in_text(a)))
+ 		sectionp = text + (a->vma - text_vma);
+ 	else if (a->flags & SEC_DATA)
+ 		sectionp = data + (a->vma - data_vma);
+@@ -1893,8 +1899,7 @@ int main(int argc, char *argv[])
+     bfd_vma sec_vma;
+ 
+     if ((s->flags & SEC_CODE) ||
+-       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-                    (SEC_DATA | SEC_READONLY | SEC_RELOC))) {
++	ro_reloc_data_section_should_be_in_text(s)) {
+       vma = &text_vma;
+       len = &text_len;
+     } else if (s->flags & SEC_DATA) {
+@@ -1932,8 +1937,7 @@ int main(int argc, char *argv[])
+    * data sections.*/
+   for (s = abs_bfd->sections; s != NULL; s = s->next)
+     if ((s->flags & SEC_CODE) ||
+-       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-                    (SEC_DATA | SEC_READONLY | SEC_RELOC)))
++	ro_reloc_data_section_should_be_in_text(s))
+       if (!bfd_get_section_contents(abs_bfd, s,
+ 				   text + (s->vma - text_vma), 0,
+ 				   bfd_section_size(abs_bfd, s)))
+@@ -1962,8 +1966,7 @@ int main(int argc, char *argv[])
+    * data sections already included in the text output section.*/
+   for (s = abs_bfd->sections; s != NULL; s = s->next)
+     if ((s->flags & SEC_DATA) &&
+-       ((s->flags & (SEC_READONLY | SEC_RELOC)) !=
+-                    (SEC_READONLY | SEC_RELOC)))
++	!ro_reloc_data_section_should_be_in_text(s))
+       if (!bfd_get_section_contents(abs_bfd, s,
+ 				   data + (s->vma - data_vma), 0,
+ 				   bfd_section_size(abs_bfd, s)))
+-- 
+2.37.1
+
diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-and-riscv.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-and-riscv.patch
new file mode 100644
index 0000000000..d2c9cbd2e2
--- /dev/null
+++ b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-and-riscv.patch
@@ -0,0 +1,72 @@
+From 0285d5093798eaaba1069db1b36272ac1975c205 Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Tue, 9 Aug 2022 21:06:05 +0200
+Subject: [PATCH 2/2] elf2flt: fix fatal error regression on m68k and riscv64
+
+Commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
+changed the condition of which input sections that should be included
+in the .text output section from:
+((a->flags & (SEC_DATA | SEC_READONLY)) == (SEC_DATA | SEC_READONLY))
+to:
+((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+(SEC_DATA | SEC_READONLY | SEC_RELOC))
+
+On ARM, the .eh_frame input section does not have the SEC_RELOC flag
+set, so this specific change had no effect on ARM.
+
+However, on e.g. m68k and riscv64, the .eh_frame input section does
+have the SEC_RELOG flag set, which means that after commit ba379d08bb78
+("elf2flt: fix for segfault on some ARM ELFs"), read-only relocation
+data sections were placed in .text output section, instead of .data
+output section.
+
+This will result in a fatal error on m68k and riscv64:
+ERROR: text=0x3bab8 overlaps data=0x33f60 ?
+
+This is because elf2flt cannot append to .text after .data has been
+appended to.
+
+Note that the binutils maintainer says that the correct thing is
+to put read-only relocation data sections in .text:
+https://sourceware.org/legacy-ml/binutils/2019-10/msg00132.html
+
+So the proper fix is probably to rewrite elf2flt so that it can append
+to .text after .data has been appended to (which will require elf2flt
+to move/relocate everything that has already been appended to .data,
+since the virtual addresses are contiguous).
+
+However, for now, add an exception for m68k and riscv64 (specifically
+for the problematic input section, .eh_frame), so that we get the same
+behavior as older elf2flt releases, where we put read-only relocation
+data in .data, which was working perfectly fine.
+
+Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
+---
+ elf2flt.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 9c32f9a..a680c89 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -340,8 +340,15 @@ compare_relocs (const void *pa, const void *pb)
+ static bool
+ ro_reloc_data_section_should_be_in_text(asection *s)
+ {
+-  return (s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
++  if ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
++      (SEC_DATA | SEC_READONLY | SEC_RELOC)) {
++#if defined(TARGET_m68k) || defined(TARGET_riscv64)
++    if (!strcmp(".eh_frame", s->name))
++      return false;
++#endif
++    return true;
++  }
++  return false;
+ }
+ 
+ static uint32_t *
+-- 
+2.37.1
+
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
