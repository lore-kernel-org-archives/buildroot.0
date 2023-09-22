Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B520E81A60
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBF2A616B5;
	Fri, 22 Sep 2023 19:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBF2A616B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0y5NChEQaUY; Fri, 22 Sep 2023 19:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9527B616BB;
	Fri, 22 Sep 2023 19:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9527B616BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 349FF1BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E0ED419B3
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E0ED419B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkMeJ5WuOoaf for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:33:58 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8D93419AF
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D93419AF
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5AD6A4C0C8C;
 Fri, 22 Sep 2023 21:33:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44318)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qjlu8-0003tt-2B;
 Fri, 22 Sep 2023 21:33:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 21:33:32 +0200
Message-Id: <20230922193332.2345183-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922193332.2345183-1-bernd@kuhls.net>
References: <20230922193332.2345183-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695411212;
 bh=4k3hXpRClwWhvxi/Ee9r5nI0Ih52oFW76qP9A6LTV/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vHllpDeJFTclNZO6T0dF/7zohA4eXNYSgkdiX5bVTeG5G8sAt4doKKOxuyi/wlqCm
 peXzkmPM7sj1Y3KElsjBMr+Bg/zZtMVGYd8hyp4NCjoaSOUQs1Zi03V4KaMvuvsOgH
 nfJ+BNIxfKTSGjhhbp4vobdCr1Nvv+uy4uJNd05jaNjrDBSb/hM000eJXeDAZJjnkN
 g/O/Z5gvd2xx3KZaGOmXKwDnrldApa9+1zxWM3Id0422Ms6QYLhZpJLmCejh3mdsrb
 P9kYQ7bstA/YnbkQorCGnULFZoOiwIGXsrbR/BuJvH6xM/i74t0gzkN89cN/nlS7DT
 qZDGG+ZhFgk7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vHllpDeJ
Subject: [Buildroot] [PATCH 3/3] package/linux-headers: drop 6.4.x option
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

The 6.4.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index daf83dda4a..ca80279212 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_KERNEL_HEADERS_6_4
+	bool "kernel headers version 6.4.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
 	bool "google-material-design-icons removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index d770b77627..f0ab738c3d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  bdf76c15229b241e578046b8486106f09534d754ea4cbf105e0660e551fb1669  linux-6.5.4.tar.xz
-sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
 sha256  a3181e46d407cd6ab15f412402e8220684ff9659b0262b7a3de7384405ce4e27  linux-6.1.54.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  4177b5c4d6e749bb8339ac4aa68eb0932ead9490b956a80d9a597089959618ac  linux-5.15.132.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 77b5d19e2b..986ebb94d5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
-config BR2_KERNEL_HEADERS_6_4
-	bool "Linux 6.4.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
-
 config BR2_KERNEL_HEADERS_6_5
 	bool "Linux 6.5.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
@@ -414,7 +410,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.196"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.132"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.54"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default "6.5.4"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
