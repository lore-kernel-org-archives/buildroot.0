Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9CAC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36AD783D50;
	Sat, 27 Jan 2024 18:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36AD783D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWUWY_72BypU; Sat, 27 Jan 2024 18:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ECCD83CC3;
	Sat, 27 Jan 2024 18:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ECCD83CC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF86D1BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8CF441705
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8CF441705
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_vxtbKiKxJb for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:12:40 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44BA1415AB
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44BA1415AB
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E70E2A4C1068
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 19:12:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47652)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rTnAT-000000003DF-2pFa
 for buildroot@buildroot.org; Sat, 27 Jan 2024 19:12:37 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 19:12:37 +0100
Message-Id: <20240127181237.9359-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706379157;
 bh=c/hOuy/NEMra6pA1knLz6DOpjfJcr2WCCgy33vPgBFw=;
 h=From:To:Subject:Date:From;
 b=tOqnoNt2p6JVhXHKVbp9aV1Pjsr+SO+0Ky5LopgtA+e24K/Zqpwnd+bHuvX19YDES
 IXGW9NaWDWe14bYRV6gjkMn9FIs1Y8TYoDoXD1zfMbn/mIfW/eAgD2k0/+BRdTPHdH
 FCgAxxF4aZrRTUm7DCBuF5F49BadJv5yd0gNadBB6Hscvx8vZzlYLESWh/A3l9XBWq
 q/Z7vQ9qvHORDXrT/TR9n8Yqr6ODe2N+erqNYodWLMXVbHwybhPyNVPG8/Z+f+/h7H
 q/SDZKvckJsWeVdUTjGlKh8ORdwJQ4O/i+SdUN63v3b/7lH9gsZOlDBDtmskHu6z96
 l9H8Oe+lQYL5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=tOqnoNt2
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6}.x series
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
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ed865c6f5b..662bd09162 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6067b595ac..d7082aa629 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  88b89e7dd41ead4e3ab1e411c8bb8d592575acf815cf1df3c0dc57e2e882c0bc  linux-6.6.13.tar.xz
-sha256  b7fbd1d79faed2ce3570ef79dc1223e4e19c868b86326b14a435db56ebbb2022  linux-6.1.74.tar.xz
+sha256  fbe96b2db3f962cd2a96a849d554300e7a4555995160082d4f323c2a1dfa1584  linux-6.6.14.tar.xz
+sha256  6cd19410330c13ec4c18fd28a83d3e40fc12a152815fb7c3e1b0764329093a56  linux-6.1.75.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  56c1e65625d201db431efda7a3816e7b424071e7cb0245b2ba594d15b1fdfcd4  linux-5.15.147.tar.xz
-sha256  9025147a09547f28ec8f496c12efc30bd2fc03b2824a668e8636b2ca0ef1fb6e  linux-5.10.208.tar.xz
-sha256  42d28def2cc1502251edbfeaca3b25ee764ad1e471b6c703ccb2267f38471c43  linux-5.4.267.tar.xz
+sha256  c48575c97fd9f4767cbe50a13b1b2b40ee42830aba3182fabd35a03259a6e5d8  linux-5.15.148.tar.xz
+sha256  44e22fad647c638726a8eae23703c4263bead612d17c89ca7ad7ab32b5ce88d5  linux-5.10.209.tar.xz
+sha256  afc8aca6cb56fea489f6508bc24357df1cf8a8f3d7dcfbcccd94b7f968492620  linux-5.4.268.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  da82425c7410623dfb2405915347ee9617fc0e33a63ca821c33aeed160cddae8  linux-4.19.305.tar.xz
+sha256  b91be40fa61ff7d42958e2154a4b7602dc071982128b9b58b6d911dec111be19  linux-4.19.306.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9845ef7c2b..bf55c8714a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.305"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.267"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.208"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.147"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.74"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.13"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.306"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.75"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.14"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
