Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F2C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D129822E0;
	Thu, 21 Mar 2024 21:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3qxmbRyoiVT; Thu, 21 Mar 2024 21:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC246822F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC246822F6;
	Thu, 21 Mar 2024 21:02:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23E2D1BF980
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2D0D82244
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2q4l-LAiqtt for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F4092821E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F4092821E5
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E754D83760; Thu, 21 Mar 2024 21:02:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:23:40 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: d4169b9dbf77890d5a223f462566d2dbf4e5da46
X-Git-Newrev: acf013b600aa860794bd20d09881453fa6a80d6b
X-Patchwork-Hint: ignore
Message-Id: <20240321210220.E754D83760@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=acf013b600aa860794bd20d09881453fa6a80d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bb8766cc5463e59b931a10ec67793a79fb06eda7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 07d6b2b5ec..df84cce539 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.21" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 9b726ef7da..a13ce5e6af 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
+sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
 sha256  78fbd43822f4c56bc16e89e8874767f592532e1a0ffcd1af4dd279559b5fcbb5  linux-6.5.13.tar.xz
-sha256  faa49ca22fb55ed4d5ca2a55e07dd10e4e171cfc3b92568a631453cd2068b39b  linux-6.1.79.tar.xz
+sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  bd84809a367eb400eb04e0e70294e6ba12fc03b6bfb5a7dfaca548f8947501b0  linux-5.15.149.tar.xz
-sha256  4ea63c5a90fdc3c459ab35c11ee8c93d2364a7cdbfb101100f8cab70d490ef6d  linux-5.10.210.tar.xz
-sha256  ff54bec6d053c7994f3bb8c45021de2858ff9f740d2ccbbcf072b87821a918cf  linux-5.4.269.tar.xz
+sha256  8a1e760bf2660947234109aa4fdbbe3686238b4e852157b96c59356689107e49  linux-5.15.151.tar.xz
+sha256  0cf3e467bd8d35533888327e9f8a9a9d354fdf83e8f82e9fe5a234f896a07493  linux-5.10.212.tar.xz
+sha256  cdbc61334cdadbd3945b08f03ed197c65bdf358c3383a4334b3e5b483bd95850  linux-5.4.271.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  83eeff613405d0045d0f717c6ac14c178678fe0a163c41d9dd8878ac0f73e352  linux-4.19.307.tar.xz
+sha256  95ada7aa6ef1c69d7a469432f936365e35b004d24e751d82c21a371edd2c84f9  linux-4.19.309.tar.xz
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b974ab298e..3fac62c536 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -413,13 +413,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.336"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.307"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.269"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.210"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.149"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.79"	if BR2_KERNEL_HEADERS_6_1
+	default "4.19.309"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.271"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.212"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.151"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
 	default "6.5.13"	if BR2_KERNEL_HEADERS_6_5
-	default "6.6.18"	if BR2_KERNEL_HEADERS_6_6
+	default "6.6.21"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
