Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA8C4167B
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 19:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3189741C53;
	Wed,  8 Nov 2023 19:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3189741C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gmn4aBBe9FFF; Wed,  8 Nov 2023 19:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C47B4185E;
	Wed,  8 Nov 2023 19:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C47B4185E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1E01BF281
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 19:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52ED38140B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 19:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52ED38140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxHoYCXK3LSf for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 19:25:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EA0B81406
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 19:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EA0B81406
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F02A86D30; Wed,  8 Nov 2023 19:25:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 20:12:06 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 648d91888ac6159fe062c5d87a07cc9b23c3dc18
X-Git-Newrev: 0431681d7b11ddbc6b46cf4a83ab5e0bc231c572
X-Patchwork-Hint: ignore
Message-Id: <20231108192530.6F02A86D30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] {linux,
 linux-headers}: bump 6.{1, 5}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=0431681d7b11ddbc6b46cf4a83ab5e0bc231c572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4eb9c5d4511e47be56574b874253a273a6f4d8ba)
[Peter: drop 6.5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 506e3ead7b..5b51ac7d41 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
-sha256  58520e7ae5a6af254ddf7ddbfc42e4373b0d36c67d467f6e35a3bd1672f5fb0a  linux-6.1.60.tar.xz
+sha256  ad2c9d12fc36e2dde4796a3eec8f4ddca2e278098f4e555b6e6f5f03ef6964ce  linux-6.1.61.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  9749b21609f9e7ad9c46160c2c107db823b99cef77fa6cb080b6c2dc685fb2f7  linux-5.15.137.tar.xz
 sha256  a0ea77a1f5eeb1387d62e7a8df585ffc53758e4da153d98224ccd833bd2624c1  linux-5.10.199.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 51f29a0d8c..135f0f952f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -405,7 +405,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.259"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.199"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.60"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.61"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
