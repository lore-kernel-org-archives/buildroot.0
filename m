Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655FFC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 19:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6739E8202C;
	Tue,  8 Aug 2023 19:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6739E8202C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nC6dxsWiJov; Tue,  8 Aug 2023 19:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905DF82001;
	Tue,  8 Aug 2023 19:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905DF82001
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C09ED1BF341
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99ACD401AD
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99ACD401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1yVNB_Ozr7o for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:31:59 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E80240129
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 19:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E80240129
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A68DA4C0354
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:31:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54846)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTSQv-0003oO-0x
 for buildroot@buildroot.org; Tue, 08 Aug 2023 21:31:57 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 21:31:56 +0200
Message-Id: <20230808193157.2042920-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691523117;
 bh=zD7b1soTP+Q0Q6um7un9G3m4/I+HlNyCGatZJm0Fb40=;
 h=From:To:Subject:Date:From;
 b=TaDrWuSOJz4lArB1p2zBtz9znyQtPb2aGp/9/PTBxE31n4/3WVu86xLU2Aim8nmuy
 xnrnxZniRCs3li0LgkA74mxvylU5QJh+aZo+wR97FxHh/liN94qCaulz18Dp8gggKZ
 qZGs1d/Y13nfvEPxUQG3EElBP5i8CIebeCAaUg5gjPMA6AOqMKcbzdDAOpUXlb54Xc
 TBSMExQ6nAoWXKRrC5xFVfwrEam+yhEdLyIle6Er6YwobPQCMtx4CLR0Dq2VyAz4g/
 n0w+a6jFKNq8+WGsZqp125VDXmeHFaH+meTx+uPp4nAhv7DF4eU1vdHmlxHqJOtfNq
 r85cFmPkx2rFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=TaDrWuSO
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: security bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2022-40982:
https://downfall.page/
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00828.html
https://www.phoronix.com/news/Linux-Git-INCEPTION-DOWNFALL

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1501df86e9..32940bc346 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c9a0497d1a..ec879b21d9 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c59f34e19e84db30206b9373041abf893f9d8a08765d163586570a5238c458b6  linux-6.4.8.tar.xz
-sha256  245248470a62d4e94b46f753afc01e19e45b9e6f3a0fa06e7f5da21fe845a808  linux-6.1.43.tar.xz
+sha256  b8b8a29852b999f337c4e93eff6c91fb7fd2d49a6614cbcbeb6fa171ba55cc9f  linux-6.4.9.tar.xz
+sha256  2e51d41fe11d082ae167cee05772bb07ca7f19448d2b46772d8ca2db7673a1a5  linux-6.1.44.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  00036a0260ad012aa832a8698a4afcf23b2410091527738ce48ce3fcc23f22ed  linux-5.15.124.tar.xz
-sha256  c9558bab35e23ae67661bfb3192c609c857f78582a035449ae63e33d04ab6112  linux-5.10.188.tar.xz
-sha256  bcb4953ed68131ef17f9f1ba52cac8b9d70007f5ab600bf3dee1fbf8beb218ca  linux-5.4.251.tar.xz
+sha256  150f3846b76cd23a6135f49cef71372bade5a06e851cb4f8558df8b862d8fec7  linux-5.15.125.tar.xz
+sha256  4c03516ae1d417571faaef175932d0892710bcbe0173e40550014d043d9098c9  linux-5.10.189.tar.xz
+sha256  3a78587523940374a7319089b63357c7dc412b90f5879d512265e59173588267  linux-5.4.252.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  118f7411793868db8dcb043cdc82e9ac6f722fbec8dcdde30b07889d941aa3b3  linux-4.19.289.tar.xz
-sha256  ed82679c0c6e600db80050d09e2294fb28b61cf27dc98657296c7eb5250a7625  linux-4.14.320.tar.xz
+sha256  6ee30a46f3fa6576602085b7b4b0c640586f99d1c110982db411819308b5755c  linux-4.19.250.tar.xz
+sha256  d0e32bd47a547cc20e0ce09ff45514282742edb2af38df5dc0a03f22d4321715  linux-4.14.321.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d528f88745..c7d725aa13 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,13 +400,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.320"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.289"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.251"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.188"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.124"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.43"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.8"		if BR2_KERNEL_HEADERS_6_4
+	default "4.14.321"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.290"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.252"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.189"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.125"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.44"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.9"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
