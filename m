Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55580EDEC50
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 13:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA59B8233E;
	Wed, 13 Sep 2023 13:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA59B8233E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bc80lpTEgTMF; Wed, 13 Sep 2023 13:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E08F82335;
	Wed, 13 Sep 2023 13:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E08F82335
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BFC91BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 13:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42B74400FD
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 13:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B74400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuYCa74crPRM for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 13:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B080400CF
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 13:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B080400CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48C8F86DE5; Wed, 13 Sep 2023 13:17:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 13:03:41 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 26888aa64e42c0ccfb3b1e9ed402ca439822a0cd
X-Git-Newrev: b62a6dbd100c685452e06c034f8802b4fb00ef06
X-Patchwork-Hint: ignore
Message-Id: <20230913131738.48C8F86DE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=b62a6dbd100c685452e06c034f8802b4fb00ef06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 20c5bae6fa0acbb18124959e35d19d0780ffd57a)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7ac8a413d2..67b85f8363 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.44" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.46" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 623992cfa8..272331c785 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2e51d41fe11d082ae167cee05772bb07ca7f19448d2b46772d8ca2db7673a1a5  linux-6.1.44.tar.xz
+sha256  f5f67bcfccd47f8d9db2d5ba24e33af7778f40a777577d1fba424f4a1712a296  linux-6.1.46.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  150f3846b76cd23a6135f49cef71372bade5a06e851cb4f8558df8b862d8fec7  linux-5.15.125.tar.xz
-sha256  4c03516ae1d417571faaef175932d0892710bcbe0173e40550014d043d9098c9  linux-5.10.189.tar.xz
-sha256  3a78587523940374a7319089b63357c7dc412b90f5879d512265e59173588267  linux-5.4.252.tar.xz
+sha256  add0a575341b263a06e93599fc220a5dd34cb4ca5b9d05097a5db2a061928f26  linux-5.15.127.tar.xz
+sha256  cb54660ed4917cc4f9a9ab93d117defefd8bcbe745ec6082d909bbfd5ae962c2  linux-5.10.191.tar.xz
+sha256  51608da961b5e34d6a9452a7b302699e109633f769a4253c74b1048abba8d9c7  linux-5.4.254.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9fa5e24b7d791583f8cd001bcf02b52f569f261e276dc1dab2552974dca20ecf  linux-4.19.290.tar.xz
-sha256  d0e32bd47a547cc20e0ce09ff45514282742edb2af38df5dc0a03f22d4321715  linux-4.14.321.tar.xz
+sha256  349728d3d143fcee484b34e34e536fe48dfb8bb71263f81a66fd572cc9162137  linux-4.19.292.tar.xz
+sha256  6f0a9010b2451e7ab5b28e38c81b3c5149277ab5fe0e08059e60eb602b804ebc  linux-4.14.323.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3d32db1144..54bd74534a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.321"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.290"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.252"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.189"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.125"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.44"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.323"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.292"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.191"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.127"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.46"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
