Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110BECD6E4D
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC3E44183E;
	Wed, 11 Oct 2023 09:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC3E44183E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiW0wWok4a2F; Wed, 11 Oct 2023 09:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C9D341894;
	Wed, 11 Oct 2023 09:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C9D341894
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76D9C1BF362
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B03F82393
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B03F82393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lV3HUbrLdtWe for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 09:04:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67247823E3
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 09:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67247823E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64606844F6; Wed, 11 Oct 2023 09:04:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 11:01:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c8ff426744d5c4977e06b1554185fde69a2f146
X-Git-Newrev: 003cdd5de31dd6558b02d0a719bc779bb1fc8db5
X-Patchwork-Hint: ignore
Message-Id: <20231011090437.64606844F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.15.x / 6.{1,
 5}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=003cdd5de31dd6558b02d0a719bc779bb1fc8db5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8dcc493e2e..a6b4967a8c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.5.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.5.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index bdd27eb600..dfcc87802b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8cf10379f7df8ea731e09bff3d0827414e4b643dd41dc99d0af339669646ef95  linux-6.5.5.tar.xz
-sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
+sha256  78e36d4214547051c24df2140f4ce09428d6c515ad9a71b38b28e8094a95d2f6  linux-6.5.6.tar.xz
+sha256  9edefdde32c2298389dcd19566402332b3c2016f5ada17e5820f500b908d478c  linux-6.1.56.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ef845e7934897b88e4448378ea9daacac19e07f156fe904844fab0a7d8ff5ddd  linux-5.15.133.tar.xz
+sha256  f37182aecb57ed6853d01e1074d3a60a653331e35f3115728381e08be050b9d3  linux-5.15.134.tar.xz
 sha256  183a4507b0ebec7816a79ceba6253aa7ad345e25b0fcd4e834ee154be9a993ab  linux-5.10.197.tar.xz
 sha256  2e775970521ea7ff6eb613fc85a6e34cec73feaeb67b88a77a2fbd4f75483df0  linux-5.4.257.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d1023a15e6..e2e2655964 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -408,9 +408,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.295"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.257"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.5"		if BR2_KERNEL_HEADERS_6_5
+	default "5.15.134"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.56"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.6"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
