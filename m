Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAF9C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A77B60EE4;
	Sat, 13 Jan 2024 21:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A77B60EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxQcOnHDM33e; Sat, 13 Jan 2024 21:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D39E160E91;
	Sat, 13 Jan 2024 21:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D39E160E91
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD69E1BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8339841E18
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8339841E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZaagEIOdwfZw for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A04EE41E12
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04EE41E12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8847086062; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:40:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baacbfdb2bdd23789d9f18cedb1c80115de9c0d2
X-Git-Newrev: 069da87a89da7275389065fd4ca9dbfefb453aad
X-Patchwork-Hint: ignore
Message-Id: <20240113211501.8847086062@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=069da87a89da7275389065fd4ca9dbfefb453aad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 82d46365e7..9f9cf55d96 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4207bd6b2f..2b904c298a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9ee627e4c109aec7fca3eda5898e81d201af2c7eb2f7d9d7d94c1f0e1205546c  linux-6.6.10.tar.xz
-sha256  2df774dd53f9ffd4e57ebf804cf597709295df6a304fe261d25220a134b7f041  linux-6.1.71.tar.xz
+sha256  afe2e5a661bb886d762684ebea71607d1ee8cb9dd100279d2810ba20d9671e52  linux-6.6.11.tar.xz
+sha256  98dce69077c35cffca799dcdbbd32a02242aad6b0950eb931936bb2ef69f0926  linux-6.1.72.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  5a807a5fa2a80ada957d8079681dfb5cc196ec26f43244d1c8a4fd7af592d192  linux-5.15.146.tar.xz
-sha256  c43d613216e6c5197519a4e979de5c1b510100858ff591963931c99e59c7485b  linux-5.10.206.tar.xz
-sha256  4dae99e49f466d4689e128ec023754908147159d7462019a83c7da1f25df9b15  linux-5.4.265.tar.xz
+sha256  86ace9892296bf1534d574894edd27614b68de4085c03fd3f60121751a334f1b  linux-5.10.207.tar.xz
+sha256  da072f7e6fe719c01e517cac1fa9988b2f5fa87d62a8501b7dc16d3b62b2acb6  linux-5.4.266.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  022dce3935eadec7c31093992cc101c905fd4ffbb8afce92f3e41fdd0fa18b36  linux-4.19.303.tar.xz
-sha256  8a1d520cfa71e9faebae9d8c24101f5bffe48fcb897dede4cecad5af67c34a45  linux-4.14.334.tar.xz
+sha256  cdc6a5d51aaff7c50bfe4ac4adf5cc3727043a24641145dc268e858db2a4b598  linux-4.19.304.tar.xz
+sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index df760326dc..f4c1cba23e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -408,13 +408,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.334"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.303"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.265"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.206"	if BR2_KERNEL_HEADERS_5_10
+	default "4.14.336"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.304"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.266"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.207"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.146"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.71"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.10"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.72"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.11"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
