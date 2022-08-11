Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616FEC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 09:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A6F361095;
	Thu, 11 Aug 2022 09:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6F361095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hbvfxf8DxcCk; Thu, 11 Aug 2022 09:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D157061001;
	Thu, 11 Aug 2022 09:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D157061001
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA101BF414
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 064CA41820
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 064CA41820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YW5vCjGj9MYv for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 09:40:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A1F4181D
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97A1F4181D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 09:40:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="320529074"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 17:40:59 +0800
IronPort-SDR: uU9/joj+qifmUMDNjvQipu/AolENnDWJhLnYpD1Iv3dbWUTI1U6sYIhjxpIWHeN1WMEQHMmNff
 7UwC5NdBVOhzMPB9shAvted05UOpWe+UoF/DOOZbfceZ/JAGi6Es/yRr+dBQGtv1k4ELcq1K2u
 PWH2IcChdX9rVUPDJn5nz5DrXUx54jBj2M0m7qCXqeWmoDqrVtoi6kmQbHr8/9mwUZv+VHOFAR
 50CT7RnW7oqDKRXZ9j25gple4sA7cE11L0TokZ0j6rgg52NNcTCQKULd6Oqk3IYDjiBZziGuEA
 vd+Ws0AozJCtyxW5proUfyZk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 01:56:33 -0700
IronPort-SDR: 1w64Z8Vsczv7AIGrowfq/Reo0PoOUM1Wlh4tFd66BUpZBnhjxvIJCQ9EHIs5G5CWQq/qm3plfR
 36aNWubhMqpwYzZswKV5klWYxOkimddzkJfyKvBbF+8tL96qXytPubupYwUFxVQd/m06IxZUNE
 +vzp62H+wgWPfXDq0OrvP9xIHEOtPJgduzA2X3i/vLf8+FEVmo3n1QD1vz6/nfHFCJMzcqlYuW
 n183sPS4PP/1zQh7y3cBfpe6tZNb3phPtAb2zxifLPLEjEF8zeFpqlC3rkKmStsBK000GT5kMb
 BCU=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.89])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Aug 2022 02:40:57 -0700
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Aug 2022 11:40:49 +0200
Message-Id: <20220811094049.798010-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811094049.798010-1-niklas.cassel@wdc.com>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660210859; x=1691746859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNWqNimUe3vMUblLRdpqNGl7JOsSTbTQisKwWRujS+Q=;
 b=rzEAa1qolryaQ4i3cATu1WvUIcZT2bjKOjLfSIGYkmjExGzqvGLDK2+b
 peDLgYOqwfbQsvtqsn0fwF6l97T1u7/iRWYl0wwFN0uHXyMTO1Cvpf1Wc
 JDkiSSbAku/i27rJ3X+KkfxD6kcmRKi2ChbsrDeYQImc2pO1s4tFkxCiK
 eeXcbOo4VFIjOVcBYUDlCYz8zaORZ1hYj+wgamv+bp00IGZ4CYl9y0HCw
 zrOVwm419Qd1BAFQvmB6zDaXfevkkGqYDkWU8GIhPZ7AtdLDhBc6EUYev
 qeuk5BKNElItBVSpSmZntfeqzrV5NCtE8KWOrafE4auldV6KarAjCDG6R
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=rzEAa1qo
Subject: [Buildroot] [PATCH v2 2/2] package/elf2flt: fix fatal error
 regression on m68k, xtensa, riscv64
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, damien.lemoal@opensource.wdc.com,
 alistair@alistair23.me, geert@linux-m68k.org, buildroot@buildroot.org,
 romain.naour@smile.fr, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series fixes a fatal error at link time on m68k, xtensa,
and riscv64, caused by a bad upstream elf2flt commit.

Without this patch, m68k, xtensa, and riscv64 would result in
a fatal error:
ERROR: text=0x3bab8 overlaps data=0x33f60 ?

With this patch, qemu_m68k_mcf5208_defconfig,
qemu_riscv64_nommu_virt_defconfig, and
qemu_xtensa_lx60_nommu_defconfig builds properly.

riscv64 and m68k boots to login prompt.
xtensa crashes when loading init, the same behavior as when
reverting the bad upstream elf2flt commit completely.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 ...2flt-create-a-common-helper-function.patch | 76 +++++++++++++++++++
 ...l-error-regression-on-m68k-xtensa-ri.patch | 73 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
 create mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch

diff --git a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
new file mode 100644
index 0000000000..9fa5ff986f
--- /dev/null
+++ b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
@@ -0,0 +1,76 @@
+From 37e1e0ace8ccebf54ec2f5522bfc1f9db86946ad Mon Sep 17 00:00:00 2001
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
diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
new file mode 100644
index 0000000000..4224eacd9f
--- /dev/null
+++ b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
@@ -0,0 +1,73 @@
+From 65ac5f9e69cfb989d970da74c41e478774d29be5 Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Tue, 9 Aug 2022 21:06:05 +0200
+Subject: [PATCH 2/2] elf2flt: fix fatal error regression on m68k, xtensa,
+ riscv64
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
+have the SEC_RELOC flag set, which means that after commit ba379d08bb78
+("elf2flt: fix for segfault on some ARM ELFs"), read-only relocation
+data sections were placed in .text output section, instead of .data
+output section.
+
+This will result in a fatal error on m68k, xtensa and riscv64:
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
+However, for now, add an exception for m68k, xtensa and riscv64
+(specifically for the problematic input section, .eh_frame), so that we
+get the same behavior as older elf2flt releases, where we put read-only
+relocation data in .data, which was working perfectly fine.
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
++#if defined(TARGET_m68k) || defined(TARGET_riscv64) || defined(TARGET_xtensa)
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
