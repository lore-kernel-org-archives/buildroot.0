Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9390C7EE22
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 17:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 343F670143;
	Thu, 11 May 2023 17:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 343F670143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYlt9XjvUDmb; Thu, 11 May 2023 17:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E61610F4;
	Thu, 11 May 2023 17:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E61610F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1851BF28F
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 17:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15315610F4
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 17:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15315610F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64DhHpg6E6c9 for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 17:03:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B081860F3B
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B081860F3B
 for <buildroot@buildroot.org>; Thu, 11 May 2023 17:03:45 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout02.t-online.de (Postfix) with SMTP id 3B0AD10DA9
 for <buildroot@buildroot.org>; Thu, 11 May 2023 19:03:30 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.197.49]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1px9hQ-25txRp0; Thu, 11 May 2023 19:03:28 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34440)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1px9hQ-00036Q-0I
 for buildroot@buildroot.org; Thu, 11 May 2023 19:03:28 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 19:03:27 +0200
Message-Id: <20230511170327.2998168-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683824608-0AFC8714-2E1F5ABF/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e8f3a22-c5d0-4b65-9c68-6ec60d6185e0
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: 5.15.x / 6.{1, 2,
 3}.x series
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
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 65d3dc53c6..abb4bf922f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 75158437c7..fbc166afa2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  78620fb4a7d5e0db1d4eb8d5b1c6e207ba5d19564efa63967a59b6daf89b3f2a  linux-6.3.1.tar.xz
-sha256  0ebc9fa309d496d474b06682578c5f7b42f0cf330365102b2feaab65ba296729  linux-6.2.14.tar.xz
-sha256  c2b74b96dd3d0cc9f300914ef7c4eef76d5fac9de6047961f49e69447ce9f905  linux-6.1.27.tar.xz
+sha256  b612ecf282ca3f7989ff6d9f39082833b7dc2d522cb969a05334d3614e9c5328  linux-6.3.2.tar.xz
+sha256  9ffa34921044660c6adb3eb5fd996192e322b15bbf532fe4e4e7a47079ed8fc1  linux-6.2.15.tar.xz
+sha256  7a094c1428b20fef0b5429e4effcc6ed962a674ac6f04e606d63be1ddcc3a6f0  linux-6.1.28.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9829fcc77b9978dce97a26980dec445caf2410024696625dbb2314ead4830b5b  linux-5.15.110.tar.xz
+sha256  77ceea259c0158dd624304871170d09b2e59ed612f3a4d436fe0f07362dcaec2  linux-5.15.111.tar.xz
 sha256  1bbd445c154b053eea46acc883be548a98179988a9ed3a0b81bddfbf30a37e29  linux-5.10.179.tar.xz
 sha256  142f9aed1c9f2e409dd72c5c490ad824dddf31f955ed2097d5989c4b5074fc28  linux-5.4.242.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2934b0f64..6f9c3b9418 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -404,10 +404,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.282"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.242"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.110"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.27"	if BR2_KERNEL_HEADERS_6_1
-	default "6.2.14"	if BR2_KERNEL_HEADERS_6_2
-	default "6.3.1"		if BR2_KERNEL_HEADERS_6_3
+	default "5.15.111"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.28"	if BR2_KERNEL_HEADERS_6_1
+	default "6.2.15"	if BR2_KERNEL_HEADERS_6_2
+	default "6.3.2"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
