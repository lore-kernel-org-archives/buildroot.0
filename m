Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A861C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 10:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFAD040BA3;
	Wed, 10 Aug 2022 10:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFAD040BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmPkjCAcHQsw; Wed, 10 Aug 2022 10:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0D0440B97;
	Wed, 10 Aug 2022 10:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0D0440B97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC0421BF48C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 953A661054
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953A661054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8DTvI3vNJ0Y for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 10:17:15 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6BE360E67
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6BE360E67
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 10:17:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,227,1654531200"; d="scan'208";a="208330209"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Aug 2022 18:10:07 +0800
IronPort-SDR: brrJ16LqEQP/ebwPTP/8wmrngGSeLJOBrVM5MtEgiJYuKNkhCS9Dpz8JOFAVpP3v+Q3HvI0Cza
 TkkraDSU3ezWcFg6qRJQqEcUHr1TN7j5LuXDSuqyztEsWADlhGo+iHW0c/xDytlR/HknNG7ESN
 mnf5yPQdaL+2eGY//LXM03cMEx6TG3AHmCt6+mTcz5rdhoNECdy1Qwwf09yW6NLZJIDIMIw/nB
 HatddLInqCCxVLliLDO1w0JU/gWziAJZSp4u8FndWOmneFBSIaKnPVZ0eYSn0bzrMug9NczfKR
 b8z7DW4B7/Y+mGATHW8OFWA1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 02:25:43 -0700
IronPort-SDR: tLX3WjtVyEqYeeYVuRzDkiDl3SDHXD5AFvXz+MNB668banifvYd0igItc/4BmXj43F2/pofW1q
 sHVkvxhGsxlsdPAyTEb4+a9PDWYIpTri2D7DMrporDtTIbC7B2gvVzK/NQ1BO/ZGi9OMyj9e9K
 nnAOEWiistd268ZeZbdvSg3xGDiByyWJYboyuXSP10NULTB0GnmMCkaN1xo1jJbipyKxhtXLVE
 CMQ0dShdC+rpBpWu+xcES0uLvvimWLMHlbQNmKyzmB7mAjWwEBNH+E0maumkPo/O+/bc3d1Mfr
 JJk=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.86])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2022 03:10:07 -0700
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Aug 2022 12:09:58 +0200
Message-Id: <20220810100959.3160670-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810100959.3160670-1-niklas.cassel@wdc.com>
References: <20220810100959.3160670-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660126635; x=1691662635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+YmdP7Gob78HyYQ+4Ezy40V+9lP/0jfbQudnuMxguuQ=;
 b=A7HvWiMmN4ILNMatgqSQRiUX+LyRui7uYbFkN9HOw1B457oWzuy9KreT
 1gTJ7Jsy/sDwLD5/sgJ5z/0xO1jpMZC4UmwJmiV3gZoAs+OKKhmQB7SFR
 VM+cgrtREes4j1fmT2MO4SWQa4CAA3HPxbvKrSuT5mwHSJcF8WHfU5O81
 qcpb2Vu0yL8oU1pRGp+FWE3zvdTSHigBV3a67pNEEQxDO3GFZDmjVyEEg
 oEC82HqyPcGuSuwCRnanopj6sFnI4HCQoHXtRj/ZpNZ3SIwdTLOC8y8vw
 ee8JNpOrdnbBL9fKSwHhB548A6q+M1/3rRsWCvrUaphYftI3aFChfoasJ
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=A7HvWiMm
Subject: [Buildroot] [PATCH 1/2] package/elf2flt: remove broken patch
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

Remove broken elf2flt patch:
package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch

The patch modifies main(), but does not perform a similar change in
output_relocs(), which might cause sectionp in output_relocs() to be
initialized with an invalid address, causing random memory to be
overwritten.

This leads to a segfault when linking e.g. busybox for m68k.

We cannot perform a similar change in output_relocs(), since at this
point in time, data_len will always be non-zero.

Revert this patch completely, so that we can add a working patch.

Note that even with this patch reverted, m68k results in a fatal error:
ERROR: text=0x3bab8 overlaps data=0x33f60 ?

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 ...3-elf2flt-add-riscv-64-bits-support.patch} |  0
 ...f2flt-fix-.eh_frame-section-handling.patch | 73 -------------------
 2 files changed, 73 deletions(-)
 rename package/elf2flt/{0004-elf2flt-add-riscv-64-bits-support.patch => 0003-elf2flt-add-riscv-64-bits-support.patch} (100%)
 delete mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch

diff --git a/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
similarity index 100%
rename from package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
rename to package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
diff --git a/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch b/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
deleted file mode 100644
index e7e8c6f25b..0000000000
--- a/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 8b7fdb1dedfb8a6e858b46e5af33029fe0462ab8 Mon Sep 17 00:00:00 2001
-From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-Date: Tue, 10 May 2022 23:14:36 +0900
-Subject: [PATCH] elf2flt: fix .eh_frame section handling
-
-elf2flt.ld linker script positions the .eh_frame section in an output
-section after the .text and .data output sections.
-
-However, when elf2flt.c is supplied the ELF linked using the elf2flt.ld
-linker script, it only looks at the flags for each input section, and
-then puts it in either a bFLT text, data or bss output section.
-
-Commit ba379d08bb7 ("elf2flt: fix for segfault on some ARM ELFs")
-modified the section scanning loop of elf2flt main() function to put
-read-only relocation data sections in the bFLT text output section so
-that the .ARM.exidx section is placed in the .text flat output section.
-Previously a read-only relocation data section would be put in the data
-output section.
-
-On ARM, the .eh_frame section does not have the SEC_RELOC flag set, so
-it will still end up in the data output section. However, on
-architectures that generates the .eh_frame section with the SEC_RELOC
-flag set, this section will now be placed in the text output section.
-
-The logic in elf2flt will handle all sections in order, and since the
-input order is .text, .data, and .eh_frame, putting .eh_frame in text
-output section does not work, since elf2flt.c has already put the .data
-input section in the bFLT data output section. This leads to the
-following print (example for riscv64 architecture):
-
-buildroot/output/host/riscv64-buildroot-linux-uclibc/bin/elf2flt:
-ERROR: text=0x3bab8 overlaps data=0x33f60 ?
-
-The way that elf2flt is written, we cannot append to the text output
-section after an input section has been added to the data output
-section. It might be possible to change this, but that would require
-moving all the code the was already placed in the data output section.
-
-Instead, let's allow putting a read-only relocation data section in the
-text output section (so that .ARM.exidx will still be placed correctly),
-but only if there has not yet been anything placed in the data output
-section.
-
-That way .ARM.exidx will still be placed correctly, and .eh_frame will
-be placed correctly in the .data output section, regardless if it has
-flag SEC_RELOC set or not.
-
-Fixes: ba379d08bb7 ("elf2flt: fix for segfault on some ARM ELFs")
-Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
----
- elf2flt.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 7ac0617..da25e93 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -1877,8 +1877,9 @@ int main(int argc, char *argv[])
-     bfd_vma sec_vma;
- 
-     if ((s->flags & SEC_CODE) ||
--       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--                    (SEC_DATA | SEC_READONLY | SEC_RELOC))) {
-+        (((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-+                     (SEC_DATA | SEC_READONLY | SEC_RELOC)) &&
-+          !data_len)) {
-       vma = &text_vma;
-       len = &text_len;
-     } else if (s->flags & SEC_DATA) {
--- 
-2.35.1
-
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
