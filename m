Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC380C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 10:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87B8460762;
	Mon, 25 Mar 2024 10:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9MzrzVoRoFK; Mon, 25 Mar 2024 10:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A2A6068F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A2A6068F;
	Mon, 25 Mar 2024 10:13:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFD361BF2E4
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 10:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A903340174
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 10:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1j3GuqF6zMbm for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 10:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 813224012E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 813224012E
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 10:13:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73BAF83DE6; Mon, 25 Mar 2024 10:13:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 11:12:11 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: aaaeff35506af1ba775074ef0aeeb57a3b5d7e6c
X-Git-Newrev: 26c53a47bc29ae832d7cdc9b5e6d1693ddb733a9
X-Patchwork-Hint: ignore
Message-Id: <20240325101328.73BAF83DE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=26c53a47bc29ae832d7cdc9b5e6d1693ddb733a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 75bad69099dfb66433feaf4accf1105e1f8a4319)
[Peter: update BR2_LINUX_KERNEL_LATEST_VERSION to match, drop 6.6.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6464251608..2d535e0afe 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.81" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.82" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 2ecfa476ea..eacdccecce 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
+sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  8a1e760bf2660947234109aa4fdbbe3686238b4e852157b96c59356689107e49  linux-5.15.151.tar.xz
-sha256  0cf3e467bd8d35533888327e9f8a9a9d354fdf83e8f82e9fe5a234f896a07493  linux-5.10.212.tar.xz
-sha256  cdbc61334cdadbd3945b08f03ed197c65bdf358c3383a4334b3e5b483bd95850  linux-5.4.271.tar.xz
+sha256  f0805225f4a5b24d0bba9302c2c2f261c04f737ac5dd931da9b112e9f3e4a47e  linux-5.15.152.tar.xz
+sha256  84cf30223239ec3333a5f7b2a7fba2042bba70d1582a139f7543956af871ad80  linux-5.10.213.tar.xz
+sha256  3599d5959a403e64be407d7f05e56cb270d6ddd154e89a596609919ab1e2e366  linux-5.4.272.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  95ada7aa6ef1c69d7a469432f936365e35b004d24e751d82c21a371edd2c84f9  linux-4.19.309.tar.xz
+sha256  95ec94c4ab8f46d8a54430893f9bd653c46b0f1587d216818aa8f52fd313de69  linux-4.19.310.tar.xz
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 24840c2f37..2383f45a71 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -385,11 +385,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.336"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.309"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.271"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.212"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.151"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
+	default "4.19.310"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.272"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.213"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.152"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.82"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
