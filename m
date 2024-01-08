Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE754C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 19:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 555D641B91;
	Mon,  8 Jan 2024 19:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 555D641B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fBXHrMHWyby; Mon,  8 Jan 2024 19:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C82C41D7F;
	Mon,  8 Jan 2024 19:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C82C41D7F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCEAF1BF2B4
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 951DC41B91
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 19:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951DC41B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4xocjcOSw_P for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 19:47:30 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EC8341B61
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 19:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC8341B61
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 119C9A4C027C;
 Mon,  8 Jan 2024 20:47:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36232)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rMvab-000000000O4-1ciI;
 Mon, 08 Jan 2024 20:47:13 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 20:47:11 +0100
Message-Id: <20240108194713.1375752-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704743234;
 bh=GmYOvL/La3QwSLvRlfSPWePELNHPvoFtwtLCJyTZms4=;
 h=From:To:Cc:Subject:Date:From;
 b=uAw/cPN6E0qIUPsvieptsEwFoB5AmOt9/+F0BgRqcrr3aOoOo6+1W/v4ltDDKbglr
 cVFtqtR6PA+0NFSElsffhROKLWyzh5/XPFQhaXNGiBdo1E6fqNErKW0/AMtGaBPpY2
 Tgh5nS5Rfv1CskaURHRWq2DwcERCHgaMgXkoNY6C5xxRy/ZPJiHsJErlL5bJX1tcYP
 MDPkktJ8eU87RnnhmIvypWb/Co//CqlbKeVVUjr3vcNvrRYUE5BXIHtFs0KcUHJ5Fm
 fQIrVOcXFDUg/fPJuISNKkUuL0xApN3n+MliTOb4Nt2sfU2y3VP9MZwa+Ii8Okadky
 jCtZTf0nwpgIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=uAw/cPN6
Subject: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.4.x series
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 4207bd6b2f..ff2ca2d6fe 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,10 +4,10 @@ sha256  2df774dd53f9ffd4e57ebf804cf597709295df6a304fe261d25220a134b7f041  linux-
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  5a807a5fa2a80ada957d8079681dfb5cc196ec26f43244d1c8a4fd7af592d192  linux-5.15.146.tar.xz
 sha256  c43d613216e6c5197519a4e979de5c1b510100858ff591963931c99e59c7485b  linux-5.10.206.tar.xz
-sha256  4dae99e49f466d4689e128ec023754908147159d7462019a83c7da1f25df9b15  linux-5.4.265.tar.xz
+sha256  da072f7e6fe719c01e517cac1fa9988b2f5fa87d62a8501b7dc16d3b62b2acb6  linux-5.4.266.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  022dce3935eadec7c31093992cc101c905fd4ffbb8afce92f3e41fdd0fa18b36  linux-4.19.303.tar.xz
-sha256  8a1d520cfa71e9faebae9d8c24101f5bffe48fcb897dede4cecad5af67c34a45  linux-4.14.334.tar.xz
+sha256  cdc6a5d51aaff7c50bfe4ac4adf5cc3727043a24641145dc268e858db2a4b598  linux-4.19.304.tar.xz
+sha256  29688745ab20b1fdf77a3cb50fbfcb266a9834b87dd707594c3c13ab43ec4029  linux-4.14.335.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index df760326dc..b0dcbd3011 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -408,9 +408,9 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.334"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.303"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.265"	if BR2_KERNEL_HEADERS_5_4
+	default "4.14.335"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.304"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.266"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.206"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.146"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.71"	if BR2_KERNEL_HEADERS_6_1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
