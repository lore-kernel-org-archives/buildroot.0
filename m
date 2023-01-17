Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A5BC677F1
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 15:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C944173F;
	Tue, 17 Jan 2023 15:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C944173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBfRwdA3UQhF; Tue, 17 Jan 2023 15:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5764176C;
	Tue, 17 Jan 2023 15:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5764176C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD8D81BF836
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 15:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B865781EA6
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 15:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B865781EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rv9z_UIDy7AA for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 15:42:46 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE871819D6
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE871819D6
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 15:42:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.97,224,1669046400"; d="scan'208";a="325324511"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jan 2023 23:35:09 +0800
IronPort-SDR: 6rPxVr4C7pUPuphHzljFHFVSGHdCO5yvOXbbN7dw25ET6wym0QDXJuWtL+tsXlBnUzspnYFVIw
 rxk8zpFtu2XH8hXdFTkomeN3q2HdjJjJIPuezq/dMTtYA5AMlHH0ipHfcXAT1s82yEayGfeWxL
 2+YwwtC6k7B6h5/qjSBU1BR/P2EkkeSoIBL+ZfMUyCKUezrhVEyjniYhgHDggqo1uEHWcIVK+i
 3wC+q4/bJg5OGivh9ybsKCW8CgilhRwGEu4tr86iXEU4OOgNiLHN5wIbyIsVWmRdr4j5q9mhGk
 bhc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 06:47:05 -0800
IronPort-SDR: QsFZHlTrAV9Sf+WIzYmDqz8xrP7mNrCkfidBsb5Rdo8T0aDG8j8TbBrroc6UJF/mqomKmSqCct
 tOQq4zCtH0XWp/JoS8dDggl6rcAxqgDd8BBgwDaA1PHFnKnS+u5B9vweoBAr8IIjJs5M7EUmAh
 Jy9fghty6RGpWfIJvRlrdFsUS+MxzUXGXEDo5i2Jr15HdYJjWNazd9DXm054cauc4mTWUIIkqx
 nPo+pfXYcH36L1VyMnzz0uwc6HfIP+d8ZjibtOk92UmNvEmbSMyCbdAgp0cZGT1jWDMuk4g0+q
 lYY=
WDCIronportException: Internal
Received: from dellx5.wdc.com (HELO x1-carbon.cphwdc) ([10.200.210.81])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2023 07:35:08 -0800
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jan 2023 16:35:03 +0100
Message-Id: <20230117153503.2075602-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1673970165; x=1705506165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3hyr8oELU50Uy/012VODPG/GYNV1tPoUQMX8TaRhIro=;
 b=TwT5dcn2OKs/rY5qxxs8ZjOAEKoKVj/tlEDn0PJTSlPwSRFVzkD0PSyg
 bNlBK3AW+8YTI5feSZWtt39TruQX4SNht86ayMHa5h7TUOgrx7zS9lOjp
 FiebQpG4ZleYH1FSfguE4xRc5QfmQvG1mFylaWnmQQt6l2t/D8jSBta7b
 h89uJ3sM4ZOBLijSjSg7kCqloYqCsi0qCGGlrbrJjl4wnqdgQAJ4hgLdL
 oKpkuC27/ZDzHjO/WXgP2hJ78CHSCmlIntinekYXzmvCgYoRCz9ziIS24
 zJtBpi1uYod2zG/IYN1LUWLdpRzaSlxFlz/KzGZTJ++ddXQE8Dw11MUBz
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=TwT5dcn2
Subject: [Buildroot] [PATCH] package/elf2flt: fix error when building gdb
 for target on m68k
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

Thomas reported that m68k fails to build when enabling BR2_PACKAGE_GDB.

It fails when building gdb for the target with the following error:
elf2flt: ERROR: text=0x3c826 overlaps data=0x256e0 ?

It turns out that the gdb binary has another problematic input section
(.gcc_except_table), which causes elf2flt to try to append to the .text
output section, after it has already moved on with appending sections
to the .data output section.

elf2flt cannot append to a previous output section once it has moved on
to another output section.

Update the existing elf2flt patch to also add an exception for
.gcc_except_table.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 ...l-error-regression-on-m68k-xtensa-ri.patch | 47 ++++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
index 278709cb1c..616bbc891f 100644
--- a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
+++ b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
@@ -1,8 +1,7 @@
-From 65ac5f9e69cfb989d970da74c41e478774d29be5 Mon Sep 17 00:00:00 2001
+From a8c9f650b82109abf7aa730f298ea5182ed62613 Mon Sep 17 00:00:00 2001
 From: Niklas Cassel <niklas.cassel@wdc.com>
 Date: Tue, 9 Aug 2022 21:06:05 +0200
-Subject: [PATCH] elf2flt: fix fatal error regression on m68k, xtensa,
- riscv64
+Subject: [PATCH] elf2flt: fix fatal error regression on m68k, xtensa, riscv64
 
 Commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
 changed the condition of which input sections that should be included
@@ -12,16 +11,15 @@ to:
 ((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
 (SEC_DATA | SEC_READONLY | SEC_RELOC))
 
-On ARM, the .eh_frame input section does not have the SEC_RELOC flag
-set, so this specific change had no effect on ARM.
+On ARM, the .eh_frame input section does not have the SEC_RELOC flag set,
+so on ARM, this change caused .eh_frame to move from .text to .data.
 
-However, on e.g. m68k and riscv64, the .eh_frame input section does
-have the SEC_RELOC flag set, which means that after commit ba379d08bb78
-("elf2flt: fix for segfault on some ARM ELFs"), read-only relocation
-data sections were placed in .text output section, instead of .data
-output section.
+However, on e.g. m68k, xtensa and riscv64, the .eh_frame input section
+does have the SEC_RELOC flag set, which means that the change in
+commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
+caused .eh_frame to move in an opposite way, i.e. from .data to .text.
 
-This will result in a fatal error on m68k, xtensa and riscv64:
+This resulted in a fatal error on m68k, xtensa and riscv64:
 ERROR: text=0x3bab8 overlaps data=0x33f60 ?
 
 This is because elf2flt cannot append to .text after .data has been
@@ -36,21 +34,26 @@ to .text after .data has been appended to (which will require elf2flt
 to move/relocate everything that has already been appended to .data,
 since the virtual addresses are contiguous).
 
-However, for now, add an exception for m68k, xtensa and riscv64
-(specifically for the problematic input section, .eh_frame), so that we
-get the same behavior as older elf2flt releases, where we put read-only
-relocation data in .data, which was working perfectly fine.
+However, for now, add an exception for input sections which have all
+three flags SEC_DATA, SEC_READONLY, and SEC_RELOC set, and which have a
+name equal to a problematic input section (.eh_frame, .gcc_except_table).
+That way, we get the same behavior as older elf2flt releases for m68k,
+xtensa and riscv64, where we put read-only relocation data in .data,
+which was working perfectly fine.
+
+This exception will not change any behavior on ARM, as the .eh_frame
+input section does not have flag SEC_RELOC set.
 
 Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
 ---
- elf2flt.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
+ elf2flt.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index 9c32f9a..a680c89 100644
+index e0d7891..39d035f 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
-@@ -340,8 +340,15 @@ compare_relocs (const void *pa, const void *pb)
+@@ -341,8 +341,13 @@ compare_relocs (const void *pa, const void *pb)
  static bool
  ro_reloc_data_section_should_be_in_text(asection *s)
  {
@@ -58,10 +61,8 @@ index 9c32f9a..a680c89 100644
 -	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
 +  if ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
 +      (SEC_DATA | SEC_READONLY | SEC_RELOC)) {
-+#if defined(TARGET_m68k) || defined(TARGET_riscv64) || defined(TARGET_xtensa)
-+    if (!strcmp(".eh_frame", s->name))
++    if (!strcmp(".eh_frame", s->name) || !strcmp(".gcc_except_table", s->name))
 +      return false;
-+#endif
 +    return true;
 +  }
 +  return false;
@@ -69,5 +70,5 @@ index 9c32f9a..a680c89 100644
  
  static uint32_t *
 -- 
-2.37.1
+2.39.0
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
