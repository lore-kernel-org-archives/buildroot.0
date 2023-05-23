Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9202EC77B75
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 17:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A01B61444;
	Tue, 23 May 2023 17:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A01B61444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdOmPLyQLjBd; Tue, 23 May 2023 17:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D36561423;
	Tue, 23 May 2023 17:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D36561423
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D52511BF318
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEDE741CA2
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEDE741CA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z22Y2n8QMHH7 for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 17:46:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E61E4054B
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E61E4054B
 for <buildroot@buildroot.org>; Tue, 23 May 2023 17:46:10 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout12.t-online.de (Postfix) with SMTP id 594F92104A
 for <buildroot@buildroot.org>; Tue, 23 May 2023 19:46:07 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd88.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q1W5G-1XGLTt0; Tue, 23 May 2023 19:46:06 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:47986)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q1W5G-0006xf-0b
 for buildroot@buildroot.org; Tue, 23 May 2023 19:46:06 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 19:46:06 +0200
Message-Id: <20230523174606.322776-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684863966-12FF9E62-9EAC36E1/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ba3bae0-c1f3-4286-aaab-04ebc8fb476a
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 2, 3}.x series
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index abb4bf922f..7aac19f528 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.3.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fbc166afa2..d3696dddf0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b612ecf282ca3f7989ff6d9f39082833b7dc2d522cb969a05334d3614e9c5328  linux-6.3.2.tar.xz
-sha256  9ffa34921044660c6adb3eb5fd996192e322b15bbf532fe4e4e7a47079ed8fc1  linux-6.2.15.tar.xz
-sha256  7a094c1428b20fef0b5429e4effcc6ed962a674ac6f04e606d63be1ddcc3a6f0  linux-6.1.28.tar.xz
+sha256  8975216a6cee827390586758ed69d19743367098d1fc5dd5694987bb529e44e5  linux-6.3.3.tar.xz
+sha256  06ff0d780a6934b46140f6d8c1a15792c78aa337d8b2411bf90747371d358713  linux-6.2.16.tar.xz
+sha256  1e736cc9bd6036379a1d915e518abd4c2c94ad0fd1ea0da961c3489308b8fcfb  linux-6.1.29.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  77ceea259c0158dd624304871170d09b2e59ed612f3a4d436fe0f07362dcaec2  linux-5.15.111.tar.xz
-sha256  1bbd445c154b053eea46acc883be548a98179988a9ed3a0b81bddfbf30a37e29  linux-5.10.179.tar.xz
-sha256  142f9aed1c9f2e409dd72c5c490ad824dddf31f955ed2097d5989c4b5074fc28  linux-5.4.242.tar.xz
+sha256  b0e8ebdba38e0c369f64ec4dc2a69ec59ffe87a64b82f940dbdf8e752b6ad651  linux-5.15.112.tar.xz
+sha256  da839a4bf1f6c964b9bde593bd58928f106f53690ff677e226bc50cf368b0c29  linux-5.10.180.tar.xz
+sha256  c3cf664feeeee47e0f0c45c53705568f73692c37a3ff7f11c1b15e59610feb04  linux-5.4.243.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  43a514997d3a9052b765a9e1c8fbf7f5a810771937f8754a529ed09e0e02e20b  linux-4.19.282.tar.xz
-sha256  876c01f0d12ad0147b5c9ee2de919bedc7ffb7c2714dbfb7ccf44426f6f49153  linux-4.14.314.tar.xz
+sha256  047316d20c6c97ad41c40477c7e1ab0bea434243e17bfc72155801b123cc51f4  linux-4.19.283.tar.xz
+sha256  a346c5c34c06caeb28063b6379a28ec1f4111fa438ecd933a55f696fe362c99d  linux-4.14.315.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6f9c3b9418..4b31755169 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,14 +400,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.314"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.282"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.242"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.111"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.28"	if BR2_KERNEL_HEADERS_6_1
-	default "6.2.15"	if BR2_KERNEL_HEADERS_6_2
-	default "6.3.2"		if BR2_KERNEL_HEADERS_6_3
+	default "4.14.315"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.283"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.243"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.180"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.112"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.29"	if BR2_KERNEL_HEADERS_6_1
+	default "6.2.16"	if BR2_KERNEL_HEADERS_6_2
+	default "6.3.3"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
