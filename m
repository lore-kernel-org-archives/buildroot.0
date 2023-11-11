Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A98BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 10:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B7360A98;
	Sat, 11 Nov 2023 10:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B7360A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jc47s7xNssXL; Sat, 11 Nov 2023 10:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1B360F91;
	Sat, 11 Nov 2023 10:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF1B360F91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17E801BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 10:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C0E40B03
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 10:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8C0E40B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffQ9y6iDvyMB for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 10:33:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1544440ADD
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 10:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1544440ADD
Received: from fli4l.lan.fli4l (p4fd6c5aa.dip0.t-ipconnect.de [79.214.197.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98F97A4C089C
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 11:33:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57580)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r1lIu-0001dP-2o
 for buildroot@buildroot.org; Sat, 11 Nov 2023 11:33:28 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 11:33:28 +0100
Message-Id: <20231111103328.2633193-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699698809;
 bh=h3DK3xUkc9K7qmAHTKVIeSttauSuH4+HOC0bKSdv7No=;
 h=From:To:Subject:Date:From;
 b=tvV0D4XoAAAEemG75GIEFPzRjdrMMJol4ZKxMUpz/XkEG7BoEASN9Vd8992l2VWob
 ZP60kChZzEgzwbe6LEbCiilaZS/WeBTJ84hQ6oyQq82m56EaWAhKt+vQPUAAZlknxQ
 YJ9c3nXMspncBDkajpOOj96TN2yB7o4mfIG+5r9HRVH68cmBR1rGwOyDtEyY0cGBgv
 n0+YidSrXyl7HPjCQ5p1KJbbD9u4ZnDccpPCCVSYXjXhUhvJGaOcvfnHqY2TgD/vmM
 i/aPyJGmC7vmB2O3OT1xafB47CW+9FFzVF1fj9T+e47ScZsEJeq3sC3rkSIQgBU0lz
 U9MpM5fnvlqTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tvV0D4Xo
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 5, 6}.x series
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
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f0951df7a2..d6e563212b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 9159f7294a..aa94a4ca91 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0  linux-6.6.tar.xz
-sha256  a15f498604adf8f6ac842f1733a694083f23e578b48c8e97d94b6d8968e55a8b  linux-6.5.10.tar.xz
-sha256  ad2c9d12fc36e2dde4796a3eec8f4ddca2e278098f4e555b6e6f5f03ef6964ce  linux-6.1.61.tar.xz
+sha256  da1ed7d47c97ed72c9354091628740aa3c40a3c9cd7382871f3cedbd60588234  linux-6.6.1.tar.xz
+sha256  2ee24af9282b80923b2da56b70aad7df2e8ee4e3f076452e05ba66be2059b519  linux-6.5.11.tar.xz
+sha256  b9fd616facd6becfceef88b9be718d0f16625cab3fe81d11384802a7091e85ec  linux-6.1.62.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9749b21609f9e7ad9c46160c2c107db823b99cef77fa6cb080b6c2dc685fb2f7  linux-5.15.137.tar.xz
-sha256  a0ea77a1f5eeb1387d62e7a8df585ffc53758e4da153d98224ccd833bd2624c1  linux-5.10.199.tar.xz
-sha256  ffe6e4fa1266d5480e529fc8659f572c57030040c548face30f56fd5a223bba4  linux-5.4.259.tar.xz
+sha256  af84e54164e1c01f59764ba528448ed36b377d22aafbd81b4b0cf47792ef4aaa  linux-5.15.138.tar.xz
+sha256  9d2d961fbf87486e48b0087326ee35cb0af4dec03c770737b098652457205104  linux-5.10.200.tar.xz
+sha256  9830820714c8f5985c50071cc9e1b40533ee81a4f6c704916c7148d16e54ebfe  linux-5.4.260.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9d89e0bc6503c0d61178fd1605f6ed04b016873b9f370372866644b11fee3d31  linux-4.19.297.tar.xz
-sha256  1db5926e02dc29b30d77f731228d3bd31402e2feba3aa59bfb2c730eedbeecc5  linux-4.14.328.tar.xz
+sha256  9da816bce896024c96b6c846be8f3e6315dd6ae82925698f534153d6a0c10f56  linux-4.19.298.tar.xz
+sha256  de36689d713ed17f8bc1286fe4b9afcdb9a3de3b6f1d6aff52569f055c276bb7  linux-4.14.329.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 236f6f5d62..81bd9f9380 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -412,14 +412,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.328"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.297"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.259"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.199"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.61"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.10"	if BR2_KERNEL_HEADERS_6_5
-	default "6.6"		if BR2_KERNEL_HEADERS_6_6
+	default "4.14.329"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.298"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.260"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.200"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.138"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.62"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.11"	if BR2_KERNEL_HEADERS_6_5
+	default "6.6.1"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
