Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795C1C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED802607C1;
	Wed,  3 Aug 2022 20:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED802607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9fOCeSYDw_l; Wed,  3 Aug 2022 20:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036BE606C6;
	Wed,  3 Aug 2022 20:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 036BE606C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7E31BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 747A040996
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747A040996
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1aniSxvFYXq for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 413144035F
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 413144035F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6268F86DC9; Wed,  3 Aug 2022 20:12:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 22:26:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ec022c7e49408b3f697f7bcab74a5382458ca9f2
X-Git-Newrev: c2dea34143ffb48c41511f04a3ed4f7320d57000
X-Patchwork-Hint: ignore
Message-Id: <20220803201257.6268F86DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{4, 10, 15, 17}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2dea34143ffb48c41511f04a3ed4f7320d57000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5645990b8827c6344c76c4fbd41be715519229b3)
[Peter: drop 5.17.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9880db0a66..d306365876 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.45" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.53" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 315da71967..1c1f541c4c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  b2390d7d977c66036ef0ceb294e408f2bdaab6dfeeb8ff4f4e0a84b71f8d8754  linux-5.15.45.tar.xz
-sha256  5b7a756004158ece2f5e41795ba523ec201743a736e34ce41cbe09177f7d0e8b  linux-5.10.120.tar.xz
-sha256  c2ad17b3fc70cd05d9e0766abe9b5aa9409fc2cc86a200eaa57c8f837afe36a8  linux-5.4.197.tar.xz
+sha256  f3aa717243051f3fcca90ebfe26fe5c3a596c2f6047846e8d1724ea90df77b07  linux-5.15.53.tar.xz
+sha256  aae72f052b80858f77d40009faf9ccf09c38c8b33f56346d16c05f7e6a429cfe  linux-5.10.129.tar.xz
+sha256  fdc1b10a19d85b37eb0957ddd81acec1d5484f36c496493d8cdad75278737a47  linux-5.4.204.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  7ea3369b915c99b38528dbf68c491f3f9324b2f4e56eac980dd7524d2fc30d1b  linux-4.9.317.tar.xz
-sha256  6637c8470c3093a477d2de6fa9e0f63c55810438a411c73bcd723634371657a3  linux-4.14.282.tar.xz
-sha256  00ad2f5a36c91221a2ade0078b93bf84b60d494bd1ef51eaccb5bdb6277dba3a  linux-4.19.246.tar.xz
+sha256  621978d371b8f0a64e28e3b734af74d5a8d99b81298a99f336b17883e3a4e409  linux-4.9.322.tar.xz
+sha256  78b5494c205d9839b1905b2553c22596dee57c87586a8124186415c8b8f8f616  linux-4.14.287.tar.xz
+sha256  3787c8adccea6e35928dea855af0eb2e849966553505448972d6b3cf037acaf4  linux-4.19.251.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 82c13fd10f..1d5eaa5194 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -382,12 +382,12 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.317"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.282"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.246"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.197"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.120"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.45"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.322"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.287"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.251"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.204"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.129"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.53"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
