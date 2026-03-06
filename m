Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA3F0182F
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 12:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86CFC60BA9;
	Fri,  6 Mar 2026 12:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTZhucgSJ9hB; Fri,  6 Mar 2026 12:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9772E60BAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772800557;
	bh=xELVU8qHdz+eav8ikR4TwZ54JnHxhw10cUrC1S7UE5M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S2Z4NYscisF4zOMztzbEItRV4mGZy98K7aqKk48vnP2qQZPI5AgLxQQXNcR6zkZE9
	 okYDsqcjY7C7ELWkQVHRNqROAS2/9cIYidXcX5f86jwFrec5/ePw91JBz4CcgOXD4T
	 7RWfJRo8tJhpOU8KwNuRgETQO547Ioh945NHH/8iwDJnLewnL85kv0i29kQr6v2XXE
	 n5MQpuItCQ58fNNryGw/E7TglXUG7qgMFzFC86Hj/+dTqlsVwZ+9idguGfsx8U6l1w
	 x8WvkAeZq2CUpH1vJoG1bon88ZVET0U4JjWKGzwGl9HzHHK+qrTEZ9qQBpxPSAm069
	 UgBNWHsqXEQkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9772E60BAB;
	Fri,  6 Mar 2026 12:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89DB7223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F0FF60BAB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlG-UyPd_wSg for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 12:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD3460BA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD3460BA9
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:35:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F7568651E; Fri,  6 Mar 2026 12:35:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:34:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea5d82f1f69dd856afc08cdc940249019cc6447a
X-Git-Newrev: 5e6c424cac5703a232f84e14ae360fae9cd166f1
X-Patchwork-Hint: ignore
Message-Id: <20260306123555.4F7568651E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edk2-platforms: fix package patch
 newline characters
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e6c424cac5703a232f84e14ae360fae9cd166f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit [1] was applied without fixing the edk2-platform patch
newlines which are changed by the mailing list. As a result,
the patch fails to apply.

This commit fixes the issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/21baec5ef57077cc7b4ce98dbd863c5f5a6d8380

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...icon-Marvell-fix-SMBIOS-type-7-structures.patch | 80 +++++++++++-----------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/package/edk2-platforms/0001-Silicon-Marvell-fix-SMBIOS-type-7-structures.patch b/package/edk2-platforms/0001-Silicon-Marvell-fix-SMBIOS-type-7-structures.patch
index 9a12580a69..533b325796 100644
--- a/package/edk2-platforms/0001-Silicon-Marvell-fix-SMBIOS-type-7-structures.patch
+++ b/package/edk2-platforms/0001-Silicon-Marvell-fix-SMBIOS-type-7-structures.patch
@@ -32,49 +32,49 @@ index 16fe05a46c..d348bbb458 100644
 --- a/Silicon/Marvell/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.c
 +++ b/Silicon/Marvell/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.c
 @@ -227,8 +227,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l1i = {
-   CacheTypeInstruction,    //instruction cache
-   CacheAssociativityOther, //three way
-   // SMBIOS 3.1.0 fields
--  48,    //48k I-cache max
--  48,    //48k installed
-+  {48,0},//48k I-cache max
-+  {48,0},//48k installed
- };
- 
- STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l1d = {
+   CacheTypeInstruction,    //instruction cache
+   CacheAssociativityOther, //three way
+   // SMBIOS 3.1.0 fields
+-  48,    //48k I-cache max
+-  48,    //48k installed
++  {48,0},//48k I-cache max
++  {48,0},//48k installed
+ };
+ 
+ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l1d = {
 @@ -248,8 +248,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l1d = {
-   CacheTypeData,           //data cache
-   CacheAssociativity2Way,  //two way
-   // SMBIOS 3.1.0 fields
--  32,    //32k D-cache max
--  32,    //32k installed
-+  {32,0},//32k D-cache max
-+  {32,0},//32k installed
- };
- 
- STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l2 = {
+   CacheTypeData,           //data cache
+   CacheAssociativity2Way,  //two way
+   // SMBIOS 3.1.0 fields
+-  32,    //32k D-cache max
+-  32,    //32k installed
++  {32,0},//32k D-cache max
++  {32,0},//32k installed
+ };
+ 
+ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l2 = {
 @@ -269,8 +269,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l2 = {
-   CacheTypeUnified,        //instruction cache
-   CacheAssociativity16Way, //16 way associative
-   // SMBIOS 3.1.0 fields
--  512,   //512k D-cache max
--  512,   //512k installed
-+  {512,0},//512k D-cache max
-+  {512,0},//512k installed
- };
- 
- STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_l3 = {
+   CacheTypeUnified,        //instruction cache
+   CacheAssociativity16Way, //16 way associative
+   // SMBIOS 3.1.0 fields
+-  512,   //512k D-cache max
+-  512,   //512k installed
++  {512,0},//512k D-cache max
++  {512,0},//512k installed
+ };
+ 
+ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_l3 = {
 @@ -290,8 +290,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_l3 = {
-   CacheTypeUnified,        //instruction cache
-   CacheAssociativity8Way,  //8 way associative
-   // SMBIOS 3.1.0 fields
--  1024,  //1M cache max
--  1024,  //1M installed
-+  {1024,0},//1M cache max
-+  {1024,0},//1M installed
- };
- 
- STATIC CONST CHAR8 *mArmadaDefaultType7Strings[] = {
+   CacheTypeUnified,        //instruction cache
+   CacheAssociativity8Way,  //8 way associative
+   // SMBIOS 3.1.0 fields
+-  1024,  //1M cache max
+-  1024,  //1M installed
++  {1024,0},//1M cache max
++  {1024,0},//1M installed
+ };
+ 
+ STATIC CONST CHAR8 *mArmadaDefaultType7Strings[] = {
 -- 
 2.52.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
