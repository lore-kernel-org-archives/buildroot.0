Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD994EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 09:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C8FA611D7;
	Wed, 14 Jun 2023 09:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C8FA611D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcuJm6ZZjZQa; Wed, 14 Jun 2023 09:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6F4611D1;
	Wed, 14 Jun 2023 09:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C6F4611D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE321BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32ECB611FC
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32ECB611FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EUfOj4cl4bf for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3723D6115A
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3723D6115A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23B0F8357E; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 11:14:39 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 942b715a851a3321398d14372708d0f96182e0fe
X-Git-Newrev: 072b93d6fb136d007ab4e4c54bb31b2498a8747f
X-Patchwork-Hint: ignore
Message-Id: <20230614092354.23B0F8357E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 3}.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=072b93d6fb136d007ab4e4c54bb31b2498a8747f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 073d6dbcb19bd7bce3be203ccfa88524ea61af6e)
[Peter: drop 6.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6337e098b4..c62f85e644 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.30" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.31" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 19066fcbdb..550a3a5cec 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1bf254c4ca9ebccb25328296584fb5e87ad635ae0c1cc1deb0b5bb37a4608813  linux-6.1.30.tar.xz
+sha256  e86917bba1990e967943645484182a64ba325f98b114a1906cc1d50992e073c1  linux-6.1.31.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4a4e98d21149d781867a6d44855f708b02f03cfe233d8026a0af9c9841b3b9ca  linux-5.15.113.tar.xz
-sha256  da839a4bf1f6c964b9bde593bd58928f106f53690ff677e226bc50cf368b0c29  linux-5.10.180.tar.xz
-sha256  c3cf664feeeee47e0f0c45c53705568f73692c37a3ff7f11c1b15e59610feb04  linux-5.4.243.tar.xz
+sha256  e981ea5d219f77735bf5a3f7e84a8af578df8ac3e1c4ff1b0649e2b0795277d2  linux-5.15.114.tar.xz
+sha256  ace6ceb73f5f2504bc1bcb9b8cd5b55d6ff8e90a81ee244ad2315fdd671ba4e7  linux-5.10.181.tar.xz
+sha256  90f5280e95ed7b374ad6f3979ed08008e29a051e5f372d367c06ed75b002a21b  linux-5.4.244.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  047316d20c6c97ad41c40477c7e1ab0bea434243e17bfc72155801b123cc51f4  linux-4.19.283.tar.xz
-sha256  a346c5c34c06caeb28063b6379a28ec1f4111fa438ecd933a55f696fe362c99d  linux-4.14.315.tar.xz
+sha256  7fb9ee20c7e52f9be6d9f501e8498a22f4b364abfde136143749a77e597fd03e  linux-4.19.284.tar.xz
+sha256  ac8318f1c1d387e23ccfa760ec042943372df23e3c4e2408177fb5a3f6488f76  linux-4.14.316.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 98e60d74f8..fe7d9330c6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.315"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.283"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.243"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.180"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.113"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.30"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.316"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.284"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.244"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.181"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.114"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.31"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
