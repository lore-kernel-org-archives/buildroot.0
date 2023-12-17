Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24373C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 17:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D3A41523;
	Sun, 17 Dec 2023 17:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D3A41523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TA_59Ov_bcoX; Sun, 17 Dec 2023 17:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5EF5408E1;
	Sun, 17 Dec 2023 17:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5EF5408E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1AE41BF422
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB1188175B
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB1188175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yLFBKs8ZkH5 for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 17:18:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 720F681759
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 17:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720F681759
Received: from fli4l.lan.fli4l (p5b3a0598.dip0.t-ipconnect.de [91.58.5.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B4C7A4C0334
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 18:18:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46646)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rEumT-0005Df-0M
 for buildroot@buildroot.org; Sun, 17 Dec 2023 18:18:21 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 18:18:21 +0100
Message-Id: <20231217171821.1893522-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217171821.1893522-1-bernd@kuhls.net>
References: <20231217171821.1893522-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1702833501;
 bh=KqxFpedWwlfsabB6QGaNx5EzTgiXUC12iSkMWOqEOZo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=xNaNSB2MplPLWXJys6b516iFF3nAJv5ILOOs39tVFEEsWcE8LSG7CI2jMzN5elYSP
 Wt7nrgIEeCtRZkn0o+y4dQI/LCbSanyUQnUoDCLcyS2iycfrUP3uieXss4VsEHobew
 aq3zodHkW8QvGi7amVu0uOkdtoxHY8kqDNyf7tmewgtmiyVXxgKuvsIa01PpMI33Iq
 KWFaFHTTBQh29fFWybR5Ainxfi5Rwm9Zu8Qup+v8hF62wzPgJ3WyXOPp/b/+mXlQEh
 zfJR5SlY65fOYryQdpy5K1ew5m9U54pqhs8F0KGsV+AJvVzbh2NdwCYC0JUnniuBZh
 FxQXzMykSN+bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=xNaNSB2M
Subject: [Buildroot] [PATCH 2/2] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ae734c49a0..f076ef5b5e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 9572acda2d..4bd5261439 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  28edfc3d4f90cd738f2a20f5a2d68510268176d6111f6278d8f495edfd9495a7  linux-6.6.3.tar.xz
-sha256  629daa38f3ea67f29610bfbd53f9f38f46834d3654451e9474100490c66dc7e7  linux-6.1.64.tar.xz
+sha256  0ce68ec6019019140043263520955ecd04839e55a1baab2fa9155b42bb6fd841  linux-6.6.7.tar.xz
+sha256  365ff26a30e206de9b18489f45d38582a0a61b7c5919f8ab89295a47316784e1  linux-6.1.68.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  be2bee8b346f3ccb35879f16c80a323edda571e36190403805c14a9ea24e4a47  linux-5.15.140.tar.xz
-sha256  3212e0299d699dd6089505b1428bcb00643fbf19af69806e37fad22bfe12fa8b  linux-5.10.202.tar.xz
-sha256  7d3eaa0744456ab4b062e6da8764f776b6939b89a1dfccbe11fbeef9c6e864dc  linux-5.4.262.tar.xz
+sha256  096bb16ec07232f27f6a07998c41b655883a8d0a6bb613d39bf524a9ffd99e02  linux-5.15.143.tar.xz
+sha256  ff950750b1060f65c0dde7d4d89238937d80faddf3bcf9ba28189d917daccaee  linux-5.10.204.tar.xz
+sha256  d39c90dd9297a36aab7246b516f61e21493826004011f161090bce84db21b6b0  linux-5.4.264.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  a8419582886120407f57d39280ef8a9b22aab9725c83c4fe25ecca4712d59346  linux-4.19.300.tar.xz
-sha256  39dcdceecad2ca7347e2b2e7e30a189558c0a1700f793822389bb1fd9a40530f  linux-4.14.331.tar.xz
+sha256  53d33c0042eff3700b7f59bdac06295c98c50056fce72f630438974b46bd73ce  linux-4.19.302.tar.xz
+sha256  66337a2afdc32e5935294139765c99ef878eedbfe1495f3f3625c23cadcab648  linux-4.14.333.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ab923cbb95..574b9be84f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -412,13 +412,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.331"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.300"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.262"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.202"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.140"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.64"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.3"		if BR2_KERNEL_HEADERS_6_6
+	default "4.14.333"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.302"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.264"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.204"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.143"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.68"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.7"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
