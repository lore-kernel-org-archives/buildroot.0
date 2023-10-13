Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FFBCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32D96414EA;
	Fri, 13 Oct 2023 18:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D96414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5VIMt81J8KS; Fri, 13 Oct 2023 18:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE92F40BFC;
	Fri, 13 Oct 2023 18:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE92F40BFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE451BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70AA94018B
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70AA94018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZjaeYLfxsQw for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF0C1401D8
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF0C1401D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0D0D84C4A; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:21:58 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: d982e4b6daadc3840733386f2a04bfe28be2c482
X-Git-Newrev: 0f95c3b4c2ee8f70d4288e3205db7510a4abc589
X-Patchwork-Hint: ignore
Message-Id: <20231013184521.C0D0D84C4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 5}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f95c3b4c2ee8f70d4288e3205db7510a4abc589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 003cdd5de31dd6558b02d0a719bc779bb1fc8db5)
[Peter: drop 6.5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index cac7fba207..9330900b13 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
-sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
+sha256  9edefdde32c2298389dcd19566402332b3c2016f5ada17e5820f500b908d478c  linux-6.1.56.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ef845e7934897b88e4448378ea9daacac19e07f156fe904844fab0a7d8ff5ddd  linux-5.15.133.tar.xz
+sha256  f37182aecb57ed6853d01e1074d3a60a653331e35f3115728381e08be050b9d3  linux-5.15.134.tar.xz
 sha256  183a4507b0ebec7816a79ceba6253aa7ad345e25b0fcd4e834ee154be9a993ab  linux-5.10.197.tar.xz
 sha256  2e775970521ea7ff6eb613fc85a6e34cec73feaeb67b88a77a2fbd4f75483df0  linux-5.4.257.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a0bdbe8555..d106e99f98 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -404,8 +404,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.295"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.257"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
+	default "5.15.134"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.56"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
