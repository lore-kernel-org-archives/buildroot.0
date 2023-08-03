Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94544EB64DD
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 18:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E50E82E9C;
	Thu,  3 Aug 2023 18:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E50E82E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOY57s_WkNWn; Thu,  3 Aug 2023 18:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F62E83F1D;
	Thu,  3 Aug 2023 18:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F62E83F1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 417DE1BF2E3
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 18:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32CD960B91
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 18:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32CD960B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFnNDBX20FMf for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 18:15:48 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0CB260B50
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 18:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0CB260B50
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 824FBA4C0D76
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 20:15:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49266)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRcrQ-0004fV-0m
 for buildroot@buildroot.org; Thu, 03 Aug 2023 20:15:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 20:15:44 +0200
Message-Id: <20230803181544.3064901-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691086544;
 bh=qFeVLXF6P74onf8PHIf/rpX2e0f6s49/WM682fWvKlw=;
 h=From:To:Subject:Date:From;
 b=G681OkL93ZCb1bYtwZjLW+O1PzqPnogr4RvFQ3N9ubfkQ13BbsQTFBnc4GTHSN51y
 RbV/q1/d2PG3sALMM2EKXqMAoUJ5jagtzhlxhYSV38AS78T+Z0qUCzMVr09TmxqP9a
 uQwYml+ua4JJ6t8S5P+X/tFsIwDTKUElSItVK6Bz4/SoJDyoXawQqPBKontIifTqDX
 YjKwRRNy8VVv82+TmYAhjXge45Q7ZiTtFuPCh7DRyOTrPwjhtGPoRSnY7ttrUeB2YB
 NiGxmKQG3T2Jdu8J3A2bBMFk0KhoLgCJPIp68IyJSsyTFIVwC9+x3Sj4slLKOGc+iO
 8ebaXwLtYLgYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=G681OkL9
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
 4}.x series
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
index 58cc9574a0..1501df86e9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 1236686384..c9a0497d1a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  de143cb61dcaa756c05f56ff35144316d810615819518a33e34754f064c4a7d8  linux-6.4.7.tar.xz
-sha256  aaf8261b551c8b76b81eab8780b446e88cea4d551ae517ac3a9b2dbdbd381ed3  linux-6.1.42.tar.xz
+sha256  c59f34e19e84db30206b9373041abf893f9d8a08765d163586570a5238c458b6  linux-6.4.8.tar.xz
+sha256  245248470a62d4e94b46f753afc01e19e45b9e6f3a0fa06e7f5da21fe845a808  linux-6.1.43.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  2de69544a12e6a059163c58fc901c13bcf22e8cac39c66b56f8fbb633399bf93  linux-5.15.123.tar.xz
+sha256  00036a0260ad012aa832a8698a4afcf23b2410091527738ce48ce3fcc23f22ed  linux-5.15.124.tar.xz
 sha256  c9558bab35e23ae67661bfb3192c609c857f78582a035449ae63e33d04ab6112  linux-5.10.188.tar.xz
 sha256  bcb4953ed68131ef17f9f1ba52cac8b9d70007f5ab600bf3dee1fbf8beb218ca  linux-5.4.251.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 98360204f7..d528f88745 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -404,9 +404,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.289"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.251"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.188"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.123"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.42"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.7"		if BR2_KERNEL_HEADERS_6_4
+	default "5.15.124"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.43"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.8"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
