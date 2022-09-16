Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D53ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B80041CA8;
	Fri, 16 Sep 2022 11:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B80041CA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybjRHCiA4acx; Fri, 16 Sep 2022 11:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475FA4193B;
	Fri, 16 Sep 2022 11:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475FA4193B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0830F1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A811C842BC
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A811C842BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1STs0ir3XBv for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44327842C0
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44327842C0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 333C583CC5; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:19:20 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a351bf7ab6b820ec64fd87ab6a103359da79917e
X-Git-Newrev: 8f7e720f33d6125f4be79cf8baeb1c4047192329
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.333C583CC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libgpg-error: fix
 typo for BR2_aarch64_be
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f7e720f33d6125f4be79cf8baeb1c4047192329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The typo was introduced in 2016 by commit
'2f89476ad9 package/libgpg-error: bump to version 1.23'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a25026f3b95df36f2d18ab1e1dd5e805c73abb22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 03157dd9fe..5a2c14ead8 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	bool
 	# see src/syscfg/
 	default y if \
-		BR2_aarch64	|| BR2_aarch64_eb	|| \
+		BR2_aarch64	|| BR2_aarch64_be	|| \
 		BR2_arm		|| BR2_armeb		|| \
 		BR2_i386	|| BR2_mips		|| \
 		BR2_mipsel	|| BR2_mips64		|| \
@@ -28,7 +28,7 @@ config BR2_PACKAGE_LIBGPG_ERROR
 config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 	string
 	default "aarch64-unknown-linux-gnu" \
-		if BR2_aarch64 || BR2_aarch64_eb
+		if BR2_aarch64 || BR2_aarch64_be
 	default "arm-unknown-linux-gnueabi" \
 		if BR2_arm || BR2_armeb
 	default "i686-pc-linux-gnu" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
