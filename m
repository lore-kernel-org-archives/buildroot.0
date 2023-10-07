Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18532E95A60
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 10:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EEA540AA3;
	Sat,  7 Oct 2023 10:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EEA540AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gizAkwmKWY1j; Sat,  7 Oct 2023 10:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64A2D4013F;
	Sat,  7 Oct 2023 10:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A2D4013F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F54A1BF419
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 10:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F26B083B4A
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 10:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F26B083B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gACqSTqHandb for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 10:28:52 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC15983B48
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 10:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC15983B48
Received: from fli4l.lan.fli4l (p54a1bb33.dip0.t-ipconnect.de [84.161.187.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA83FA4C0A40
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 12:28:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55334)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qp4YE-0001Nh-1Q
 for buildroot@buildroot.org; Sat, 07 Oct 2023 12:28:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 12:28:50 +0200
Message-Id: <20231007102850.1303053-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696674530;
 bh=o8vSU1qKcxt7UqW+Gb7Glqy91xApFc02+5rTPAaEpKc=;
 h=From:To:Subject:Date:From;
 b=lKZJ4rJR57WJ0XIiZq8gyf8comM+rbFjgPp/LZ1Xehjr8q91wFoEhQOsUtZki0+qG
 besj7Wy7ytW/fgQOjDbP7HqYqAJJsp0pb+JX7LCq0Bn3jPHKSIgLl9p6Uonnv/9yhs
 w+8fqxWa5HASba2X8sZ/LR2XWabNf7nwePSHhdbiOfFEnv783/VQvrfTB6eAg8p/us
 i9slXTpCfQYQcSrN5gvLsRjyDyzhZGU/qAgHQBxfX4kWFfgUMfRJFaSKXh8fX14+qA
 h/dJj8Yo5gfDEg+wFQfSbEAJtG92rROLr+oAwAv/vXwzfk+EjPFfaoFyFn7gDmh0M8
 H2A+sFBm0NzsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=lKZJ4rJR
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
 5}.x series
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
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8dcc493e2e..a6b4967a8c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.5.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.5.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index bdd27eb600..dfcc87802b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8cf10379f7df8ea731e09bff3d0827414e4b643dd41dc99d0af339669646ef95  linux-6.5.5.tar.xz
-sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
+sha256  78e36d4214547051c24df2140f4ce09428d6c515ad9a71b38b28e8094a95d2f6  linux-6.5.6.tar.xz
+sha256  9edefdde32c2298389dcd19566402332b3c2016f5ada17e5820f500b908d478c  linux-6.1.56.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ef845e7934897b88e4448378ea9daacac19e07f156fe904844fab0a7d8ff5ddd  linux-5.15.133.tar.xz
+sha256  f37182aecb57ed6853d01e1074d3a60a653331e35f3115728381e08be050b9d3  linux-5.15.134.tar.xz
 sha256  183a4507b0ebec7816a79ceba6253aa7ad345e25b0fcd4e834ee154be9a993ab  linux-5.10.197.tar.xz
 sha256  2e775970521ea7ff6eb613fc85a6e34cec73feaeb67b88a77a2fbd4f75483df0  linux-5.4.257.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d1023a15e6..e2e2655964 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -408,9 +408,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.295"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.257"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.5"		if BR2_KERNEL_HEADERS_6_5
+	default "5.15.134"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.56"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.6"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
