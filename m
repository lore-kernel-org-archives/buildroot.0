Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EDFC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 16:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53B7243729;
	Fri,  5 Jan 2024 16:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53B7243729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g382kWy88lOp; Fri,  5 Jan 2024 16:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261074373D;
	Fri,  5 Jan 2024 16:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261074373D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74B5D1BF847
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8B760AED
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 16:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8B760AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsnBQluI7Gja for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 16:25:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8704860AE1
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 16:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8704860AE1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7697C845A9; Fri,  5 Jan 2024 16:25:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 16:53:09 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 8bedbdf1fef5c3ff8dbf1e84549bbe30ab8f6617
X-Git-Newrev: 8a7f607ccf09b25ccd9b8e42009095a4beb953b5
X-Patchwork-Hint: ignore
Message-Id: <20240105162549.7697C845A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a7f607ccf09b25ccd9b8e42009095a4beb953b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7d8585605ef7eb18bcfc21f18a4e3cb9c0146b5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ae734c49a0..f076ef5b5e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ed9c6143db..bb3be6ae21 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  28edfc3d4f90cd738f2a20f5a2d68510268176d6111f6278d8f495edfd9495a7  linux-6.6.3.tar.xz
+sha256  0ce68ec6019019140043263520955ecd04839e55a1baab2fa9155b42bb6fd841  linux-6.6.7.tar.xz
 sha256  78fbd43822f4c56bc16e89e8874767f592532e1a0ffcd1af4dd279559b5fcbb5  linux-6.5.13.tar.xz
-sha256  629daa38f3ea67f29610bfbd53f9f38f46834d3654451e9474100490c66dc7e7  linux-6.1.64.tar.xz
+sha256  365ff26a30e206de9b18489f45d38582a0a61b7c5919f8ab89295a47316784e1  linux-6.1.68.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  be2bee8b346f3ccb35879f16c80a323edda571e36190403805c14a9ea24e4a47  linux-5.15.140.tar.xz
-sha256  3212e0299d699dd6089505b1428bcb00643fbf19af69806e37fad22bfe12fa8b  linux-5.10.202.tar.xz
-sha256  7d3eaa0744456ab4b062e6da8764f776b6939b89a1dfccbe11fbeef9c6e864dc  linux-5.4.262.tar.xz
+sha256  096bb16ec07232f27f6a07998c41b655883a8d0a6bb613d39bf524a9ffd99e02  linux-5.15.143.tar.xz
+sha256  ff950750b1060f65c0dde7d4d89238937d80faddf3bcf9ba28189d917daccaee  linux-5.10.204.tar.xz
+sha256  d39c90dd9297a36aab7246b516f61e21493826004011f161090bce84db21b6b0  linux-5.4.264.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  a8419582886120407f57d39280ef8a9b22aab9725c83c4fe25ecca4712d59346  linux-4.19.300.tar.xz
-sha256  39dcdceecad2ca7347e2b2e7e30a189558c0a1700f793822389bb1fd9a40530f  linux-4.14.331.tar.xz
+sha256  53d33c0042eff3700b7f59bdac06295c98c50056fce72f630438974b46bd73ce  linux-4.19.302.tar.xz
+sha256  66337a2afdc32e5935294139765c99ef878eedbfe1495f3f3625c23cadcab648  linux-4.14.333.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 344acc9cde..bf8e1dae16 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -412,14 +412,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.331"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.300"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.262"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.202"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.140"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.64"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.333"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.302"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.264"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.204"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.143"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.68"	if BR2_KERNEL_HEADERS_6_1
 	default "6.5.13"	if BR2_KERNEL_HEADERS_6_5
-	default "6.6.3"		if BR2_KERNEL_HEADERS_6_6
+	default "6.6.7"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
