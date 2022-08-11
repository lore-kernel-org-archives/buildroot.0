Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801E1C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 09:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D8E60F3C;
	Thu, 11 Aug 2022 09:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D8E60F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpK72wr7Vtzg; Thu, 11 Aug 2022 09:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269E560B5B;
	Thu, 11 Aug 2022 09:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 269E560B5B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC6E1BF414
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D679C41820
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D679C41820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OclDx6zo3oz for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 09:40:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C553E4181D
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C553E4181D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 09:40:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="320529070"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 17:40:56 +0800
IronPort-SDR: T23Y+1MLQK7XnwrPbqdtr2EhhOEvZa5L0fFWsa3r2OLuILkDZpPa3e/al9r0E1fPwdn3FpfVEj
 l9kVSgZQKFjNnLz7ZinT28gOe1KRqkIAKMlyV1AeDXXSdVnb6KcZ0WZlkstcNwKO87drhVCizx
 JD9vM+xsqEp0MWTmIn60xQAK2wKhmkZZa0tx03G0eU8EYQ21edHeOnSoa4OW8inOtkTmUxnaXg
 w0xMkAo6B1VbdpnEti2YJG+jBW98PGkly9rkjCbRHAU0MFQM6yNL+GJwyG6m5sln+iGdQrVXS3
 rrpPOBy8n/nKvNcw74Wle6Yg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 01:56:30 -0700
IronPort-SDR: etyxmRKSMxBp0ymuvM1ILPzgF1D/OLVJLo2dTYxMnyDZh3uWUBmD134tUjOReBpSw6Y0FAY1aR
 YQ+wR6zqEiIimNrO58a/o0SbpFdOrA0P20/ldcrZ6qZMxgZwWGa4lngAakhUzaapUuxyLLHsIL
 /lXzOQHdVkTGMIIp7Ffd3wRyMYEQwlb5SVZYnSH0qaDFSaM+oZu7XTNfp62QSi9NJKd6FwCwil
 umFVL0wfkv5iECUX+f+zPoxRpltSlN76+rofcNU4l1KJFnLEYjUZqSOjoqSfAKNPMwnDgIPm1q
 fpc=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.89])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Aug 2022 02:40:54 -0700
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Aug 2022 11:40:48 +0200
Message-Id: <20220811094049.798010-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811094049.798010-1-niklas.cassel@wdc.com>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660210856; x=1691746856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8Uk/Sh2oNZIQ+8lVuHhSXi3zIMGHKJ/vNkPfIdX+10=;
 b=MG0a4osJAMrDwAd/1QU1NuklK8f0U3rPKwkwM3ey3JVHhEOkUfYtmMU5
 KqpNpBHeYaYoL+FtFLNYJ8VR4rBtkLOTDlG0MTsbIWvV5pODf6HtMgVvy
 4HndMTG6wDUWvzKpWZ3+pPYabfOmLD+UhY/xwG5mfsPw4IWGkzNWXo/Mh
 ig0c2w5hKsEcycc2tV7tfNf8aoYz/4HD/7BNnT82DXiLgyxZYaalgSAXH
 0lcss/G3uQTNoq7xjMqORERFl2itFd2XHeNjZE/HkJfLZDc8MwxOTbQXS
 UrNn/4l9BD1xfTPw58gFmnAd1bUU0Jwh4MhVHQORmp5GwXN81qYoTUjbq
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=MG0a4osJ
Subject: [Buildroot] [PATCH v2 1/2] package/elf2flt: remove broken patch
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

Note that even with this patch reverted, elf2flt is still broken
on archs like m68k and xtensa, resulting in the fatal error:
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
