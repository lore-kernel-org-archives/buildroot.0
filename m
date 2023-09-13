Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E166BEDEC7C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B3582288;
	Wed, 13 Sep 2023 16:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B3582288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcDw-MBiCXqU; Wed, 13 Sep 2023 16:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E484682268;
	Wed, 13 Sep 2023 16:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E484682268
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D81271BF2AB
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEA5A82265
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA5A82265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYdNvaQeU8lF for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D4D8223A
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00D4D8223A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E06A986E2A; Wed, 13 Sep 2023 16:09:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 18:05:30 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c8e676ca8ab85edd9ffc3ba0cc345774cdc51781
X-Git-Newrev: e48b285188435edd055246e79da84a79ce68940b
X-Patchwork-Hint: ignore
Message-Id: <20230913160910.E06A986E2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=e48b285188435edd055246e79da84a79ce68940b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 47ac12bd4ee4025e94e82a5484c2a2a60cb59281)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1c31820f04..aca9041688 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  f5f67bcfccd47f8d9db2d5ba24e33af7778f40a777577d1fba424f4a1712a296  linux-6.1.46.tar.xz
+sha256  93d58b6af007a5f44dd26831ff310707deb1ab9380c5136a534287eb3fddfcab  linux-6.1.47.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  add0a575341b263a06e93599fc220a5dd34cb4ca5b9d05097a5db2a061928f26  linux-5.15.127.tar.xz
 sha256  cb54660ed4917cc4f9a9ab93d117defefd8bcbe745ec6082d909bbfd5ae962c2  linux-5.10.191.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index aa6e3a4788..abd4013da2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -401,7 +401,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.191"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.127"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.46"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.47"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
