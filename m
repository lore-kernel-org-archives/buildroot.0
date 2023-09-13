Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC9FEDEC7C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAE328144A;
	Wed, 13 Sep 2023 16:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE328144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goqSnk92lE29; Wed, 13 Sep 2023 16:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D81F18135D;
	Wed, 13 Sep 2023 16:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D81F18135D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E45E1BF2AB
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46CEA41DE9
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46CEA41DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_0mOG-P7ch1 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:10:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B41E41DE7
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B41E41DE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A6BE86E40; Wed, 13 Sep 2023 16:10:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 18:06:57 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4e4df2044aaee476e383be736b83851d3ca41555
X-Git-Newrev: 703675b84522dda6e17793ef58f7a1f19b756016
X-Patchwork-Hint: ignore
Message-Id: <20230913161016.2A6BE86E40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=703675b84522dda6e17793ef58f7a1f19b756016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 47ac12bd4ee4025e94e82a5484c2a2a60cb59281)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 67b85f8363..98822b0ec0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.46" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.47" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 272331c785..e8f97127a7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f5f67bcfccd47f8d9db2d5ba24e33af7778f40a777577d1fba424f4a1712a296  linux-6.1.46.tar.xz
+sha256  93d58b6af007a5f44dd26831ff310707deb1ab9380c5136a534287eb3fddfcab  linux-6.1.47.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  add0a575341b263a06e93599fc220a5dd34cb4ca5b9d05097a5db2a061928f26  linux-5.15.127.tar.xz
 sha256  cb54660ed4917cc4f9a9ab93d117defefd8bcbe745ec6082d909bbfd5ae962c2  linux-5.10.191.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 54bd74534a..9d7ece452f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -389,7 +389,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.191"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.127"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.46"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.47"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
