Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780F5C001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 16:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C63241FAD;
	Thu, 27 Jul 2023 16:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C63241FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLWOkN6fFyAO; Thu, 27 Jul 2023 16:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CA941FAE;
	Thu, 27 Jul 2023 16:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5CA941FAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 873321BF475
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6178A84055
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6178A84055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dY_l8Gh9fgnj for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 16:30:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 427ED8404A
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 16:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 427ED8404A
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9CEC2A4C105D
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 18:30:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40752)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qP3t6-0002ay-17
 for buildroot@buildroot.org; Thu, 27 Jul 2023 18:30:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 18:30:52 +0200
Message-Id: <20230727163052.3306903-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690475452;
 bh=yPvlylgsSsZEwa6U0PO+6x4Pvv6lT6Nqlx9+OwrO29s=;
 h=From:To:Subject:Date:From;
 b=i4thQkbU/wPvM/FI585UMq1j0v2yQ+Ec+Tf5rQYM3JlVmn2bmrDPVTTGUHPh6xjQ0
 zqisJM/lClvVfh63myaLhG9RL0KJ+BS9gmbSWI458gtRejjXBceLBrVyUx3QnQiHbb
 euiGPgJ41D8uYCJGZlSkcjOK3YME01AWhyY0CUl9uKzwnu5cmnI3AxPjY+ba2adBM7
 NwWCbW74CovJIcS/dHufd8XkJZ0CFNoQtdjbDRdFlTSmi/7nCVYHKjgWhS8+hyg7/e
 mdh0MSBvVrvde6l9S0wWMm+Vdoha6BQk/g3mFtnjH2gENEs+6/uj4SQLzopYVQ2kOp
 EealHwijH8mjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=i4thQkbU
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 4}.x series
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
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c8b0d4c5a4..58cc9574a0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a1773ca64b..1236686384 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e1ecc496efc48aaf25a6607a4b8e52d574d6f67a2b0aa1664087d301d3515ea4  linux-6.4.6.tar.xz
-sha256  312809a78eea052a08a6580f47b2ed8dd28e5633461d6731febaf3cb1e570bb7  linux-6.1.41.tar.xz
+sha256  de143cb61dcaa756c05f56ff35144316d810615819518a33e34754f064c4a7d8  linux-6.4.7.tar.xz
+sha256  aaf8261b551c8b76b81eab8780b446e88cea4d551ae517ac3a9b2dbdbd381ed3  linux-6.1.42.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  38755801cd1ce229a8c0a0536d29aa37acea8a8aa13fa438e19fbf9d6293342d  linux-5.15.122.tar.xz
-sha256  f69454210b3e9e00e8b8368aaa897d4ca59f8be3b85399a2fcaecbf17af98bbb  linux-5.10.187.tar.xz
-sha256  0f5b8876526062bf5e346f6b9dde88be873761ee33cf3b8a1586d7d109a091fb  linux-5.4.250.tar.xz
+sha256  2de69544a12e6a059163c58fc901c13bcf22e8cac39c66b56f8fbb633399bf93  linux-5.15.123.tar.xz
+sha256  c9558bab35e23ae67661bfb3192c609c857f78582a035449ae63e33d04ab6112  linux-5.10.188.tar.xz
+sha256  bcb4953ed68131ef17f9f1ba52cac8b9d70007f5ab600bf3dee1fbf8beb218ca  linux-5.4.251.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  118f7411793868db8dcb043cdc82e9ac6f722fbec8dcdde30b07889d941aa3b3  linux-4.19.289.tar.xz
 sha256  ed82679c0c6e600db80050d09e2294fb28b61cf27dc98657296c7eb5250a7625  linux-4.14.320.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 03c99c08cc..98360204f7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -402,11 +402,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.320"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.289"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.250"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.187"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.122"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.41"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.6"		if BR2_KERNEL_HEADERS_6_4
+	default "5.4.251"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.188"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.123"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.42"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.7"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
