Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED0BEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 16:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A429A4158E;
	Thu,  6 Jul 2023 16:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A429A4158E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5AcSDHcN8Xt; Thu,  6 Jul 2023 16:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2AD44158D;
	Thu,  6 Jul 2023 16:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2AD44158D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5C841BF3DE
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 16:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF69E60E3C
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 16:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF69E60E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrgbPYWRdYSL for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 16:50:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEC760BD8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FEC760BD8
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 16:50:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07D83A4C0946
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 18:49:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42010)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHSB3-00060J-1H
 for buildroot@buildroot.org; Thu, 06 Jul 2023 18:49:57 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 18:49:57 +0200
Message-Id: <20230706164957.5171-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688662198;
 bh=l763NmF1JE72eJt2ppwP2fGWqDeSlncWFN9TfJPp3ME=;
 h=From:To:Subject:Date:From;
 b=hkX595N3x/1EIOFjhOVoHWP9wEH1m5F6KPQBtTQPImr2r1c9kWDGTU6c0DxLGSAu/
 QhlNEL16msi12hIi2mvDhnjfTwpF/Au0mDP9peztXFl+x4wm1ZnJtb3G2mcqCgAlOH
 d146coHzuTLDcWn1TFzdMu5gqmKxqPFGGtWypUScYQlW1ebUKYdmCRLYkMAtNL5tpR
 xP0Sdnw8kwSjlddKX/qX8+dArdSsE2U342+xjLX2hC8EgIi+df4jqyzyVzu567ocbP
 /ZoiQs7zc3ICbmPg/0Eez0U9MaQzUIrMpMXnjPpLW5w+SunENXyINgLDqc4jZzxKle
 GasLIpZn16RvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hkX595N3
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
 3, 4}.x series
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
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 359adf3bee..17bf808cdc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a300d7e9f2..a4542b94b6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8fa0588f0c2ceca44cac77a0e39ba48c9f00a6b9dc69761c02a5d3efac8da7f3  linux-6.4.tar.xz
-sha256  e0a9ad8692b2191cbd33db371a780a3fe375de90123a307ecd874c0860cd46e3  linux-6.3.10.tar.xz
-sha256  d8ca0e300f30b9ff70c6e1497c638a1dac1407f45d3655e9c62c6e45a08afe6b  linux-6.1.36.tar.xz
+sha256  a326ab224176c5b17c73c9ccad85f32e49b6e4e764861d57595727b7ef10062c  linux-6.4.2.tar.xz
+sha256  cb7fdefc207dd4e8ef947fccd687126425edce0138ca11191bc0590c678e6cd7  linux-6.3.12.tar.xz
+sha256  f9a4f91b609f7d332a5f2be01ab86336fa00149fae6bdc19f16fa19f78802d43  linux-6.1.38.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7aa5a0fd3520947e5599e811d28acdc30e36446c016c7dcee3793e6d1cbecfcf  linux-5.15.119.tar.xz
+sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
 sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
 sha256  dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d  linux-5.4.249.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e7175faf70..1944d47e4e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -408,10 +408,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.288"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.119"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.36"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.10"	if BR2_KERNEL_HEADERS_6_3
-	default "6.4"		if BR2_KERNEL_HEADERS_6_4
+	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.38"	if BR2_KERNEL_HEADERS_6_1
+	default "6.3.12"	if BR2_KERNEL_HEADERS_6_3
+	default "6.4.2"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
