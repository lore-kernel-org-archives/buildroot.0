Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6DFC07CA9
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 17:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3686E41752;
	Tue, 28 Nov 2023 17:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3686E41752
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ytx6bFOZNF9p; Tue, 28 Nov 2023 17:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 868FE4175B;
	Tue, 28 Nov 2023 17:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 868FE4175B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8CA61BF419
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 17:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8002941752
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 17:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8002941752
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V49R4Mim_BGx for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 17:51:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B55C2416C2
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 17:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55C2416C2
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E573A4C00B4
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 18:51:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40076)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r82F3-0002a6-2Y
 for buildroot@buildroot.org; Tue, 28 Nov 2023 18:51:25 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 18:51:25 +0100
Message-Id: <20231128175125.581858-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701193886;
 bh=7jVF7dRs6+ymk4r86sfB6rLnNPbLecHkCu5mm7ix+Kw=;
 h=From:To:Subject:Date:From;
 b=j4SrN5tzxSJoGUEJ759f8CrqzQmos5tQ7Tl6HK2vvMa7vuosF/yCwIJrTTb+t9fFi
 oI6Wsh2r7zTcMKTaI4Wtpx7Q6MTeEtcoUhv4yRwbMtsyn9PdmzbJATQdzH2zOFGW4X
 KFe1hQ9uwRoP9l4vjZK7hpcD04VTd1RY3BFllpTPwP/3z5ZsE9pxXsfcUF1zExzvJo
 hvST7NhOH7KMD7pGDP3Z1tARoffMvzD17pwFU/muQjJcgJnNT6EyXW1zdvEVUojO1p
 CBo0qifvbNRajdFHFHdr66roDZlMHZ5Mwiw6Y5b8zYVNQZueRKJDfN8EBpCWrv7jGQ
 59JX7f9JHRzWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=j4SrN5tz
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
index d6e563212b..ae734c49a0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index aa94a4ca91..ed9c6143db 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  da1ed7d47c97ed72c9354091628740aa3c40a3c9cd7382871f3cedbd60588234  linux-6.6.1.tar.xz
-sha256  2ee24af9282b80923b2da56b70aad7df2e8ee4e3f076452e05ba66be2059b519  linux-6.5.11.tar.xz
-sha256  b9fd616facd6becfceef88b9be718d0f16625cab3fe81d11384802a7091e85ec  linux-6.1.62.tar.xz
+sha256  28edfc3d4f90cd738f2a20f5a2d68510268176d6111f6278d8f495edfd9495a7  linux-6.6.3.tar.xz
+sha256  78fbd43822f4c56bc16e89e8874767f592532e1a0ffcd1af4dd279559b5fcbb5  linux-6.5.13.tar.xz
+sha256  629daa38f3ea67f29610bfbd53f9f38f46834d3654451e9474100490c66dc7e7  linux-6.1.64.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  af84e54164e1c01f59764ba528448ed36b377d22aafbd81b4b0cf47792ef4aaa  linux-5.15.138.tar.xz
-sha256  9d2d961fbf87486e48b0087326ee35cb0af4dec03c770737b098652457205104  linux-5.10.200.tar.xz
-sha256  9830820714c8f5985c50071cc9e1b40533ee81a4f6c704916c7148d16e54ebfe  linux-5.4.260.tar.xz
+sha256  be2bee8b346f3ccb35879f16c80a323edda571e36190403805c14a9ea24e4a47  linux-5.15.140.tar.xz
+sha256  3212e0299d699dd6089505b1428bcb00643fbf19af69806e37fad22bfe12fa8b  linux-5.10.202.tar.xz
+sha256  7d3eaa0744456ab4b062e6da8764f776b6939b89a1dfccbe11fbeef9c6e864dc  linux-5.4.262.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9da816bce896024c96b6c846be8f3e6315dd6ae82925698f534153d6a0c10f56  linux-4.19.298.tar.xz
-sha256  de36689d713ed17f8bc1286fe4b9afcdb9a3de3b6f1d6aff52569f055c276bb7  linux-4.14.329.tar.xz
+sha256  a8419582886120407f57d39280ef8a9b22aab9725c83c4fe25ecca4712d59346  linux-4.19.300.tar.xz
+sha256  39dcdceecad2ca7347e2b2e7e30a189558c0a1700f793822389bb1fd9a40530f  linux-4.14.331.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 81bd9f9380..344acc9cde 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -412,14 +412,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.329"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.298"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.260"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.200"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.138"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.62"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.11"	if BR2_KERNEL_HEADERS_6_5
-	default "6.6.1"		if BR2_KERNEL_HEADERS_6_6
+	default "4.14.331"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.300"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.262"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.202"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.140"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.64"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.13"	if BR2_KERNEL_HEADERS_6_5
+	default "6.6.3"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
