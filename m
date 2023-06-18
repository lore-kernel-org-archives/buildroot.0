Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FDBEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79F2840540;
	Sun, 18 Jun 2023 11:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79F2840540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iah6Umu6bB7t; Sun, 18 Jun 2023 11:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80B3640A8D;
	Sun, 18 Jun 2023 11:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80B3640A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5F741BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A05B760F62
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A05B760F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JR4HyUX_0GyL for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4354060FCA
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4354060FCA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41AB483BAF; Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 13:44:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39ffadd6ae8c472e083c431a957ec575c1cebce2
X-Git-Newrev: 88108f9793f5824fa058b878974f234ebe834325
X-Patchwork-Hint: ignore
Message-Id: <20230618114559.41AB483BAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 3}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=88108f9793f5824fa058b878974f234ebe834325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 69bf91bbf9..70591f4a25 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.3.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 20e67fc4d1..ee510f836d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fe369743996c522a7b473e99dcf8f88847bd5cc88546fd3b7a41d9fe5a5b97a9  linux-6.3.7.tar.xz
-sha256  b87d6ba8ea7328e8007a7ea9171d1aa0d540d95eacfcab09578e0a3b623dd2cd  linux-6.1.33.tar.xz
+sha256  927ba93d3da556c8e30b2640aa3f19c3c3cda66c655754e0798024020e2981b4  patch-6.3.8.xz
+sha256  84c638ee9a36e30ef879e2944c5adfc2523a5a1553951b40e8cf4d873426d90a  patch-6.1.33.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f617c9d1bb5326cc93495938f43eb8cb9aea9d2f451e5a99bce2893f296e179a  linux-5.15.116.tar.xz
-sha256  409497c635caf49614de21950ec091eb621a5d5fe1f63fc418ef68ac38b56119  linux-5.10.183.tar.xz
-sha256  0938790a858fd0af6aa6b27a3bdf4c5d4a46aba60e6178156980d58bef7ed9ea  linux-5.4.246.tar.xz
+sha256  c8c39191dc89ccb8f0fd05e4b06c9bcc77672156bdc64fe445d2109c116a3432  patch-5.15.117.xz
+sha256  1bde9f3d8bace93e634ca0841fca14fcbd7b6d53cf877ee3e7f18778bf842455  patch-5.10.184.xz
+sha256  5e627d9086f539e65c91f6e5c59c8bb66b59f9d369173dc0ccb14f70795d1876  patch-5.4.247.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  aaa1775359c7a066ec70852ea2709fe7e7109517b7d895f34e237132db8edc16  linux-4.19.285.tar.xz
-sha256  8cf28f5aae6f77fa718861c415d646a189a7f9493ef0ccb461575a092af03c30  linux-4.14.317.tar.xz
+sha256  663669feee6ad4814704bf6dcc89ebbf64e1862f4dc231bc6327e33acea99823  patch-4.19.286.xz
+sha256  faa5db19c03aaa96417c2c3e76fbc10886d25b9f26179ff653e3c29f6707840f  patch-4.14.318.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 00ec22d606..5b16e659df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -396,13 +396,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.317"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.285"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.246"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.183"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.116"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.33"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.7"		if BR2_KERNEL_HEADERS_6_3
+	default "4.14.318"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.286"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.247"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.184"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.117"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.34"	if BR2_KERNEL_HEADERS_6_1
+	default "6.3.8"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
