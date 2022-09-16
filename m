Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43527C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E79CC61226;
	Fri, 16 Sep 2022 11:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E79CC61226
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFUyPakgWGD1; Fri, 16 Sep 2022 11:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C55C61207;
	Fri, 16 Sep 2022 11:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C55C61207
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08A261BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC094195E
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC094195E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7tqnh--rPYB for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60FE141964
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60FE141964
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4FF2B83CC5; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:19:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 627c561a3ff7d95c089abc5456fbfbb03f407dc3
X-Git-Newrev: d0c57ba94cd0a0052e7a90d0f969dab24dc58bdd
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.4FF2B83CC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgpg-error: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0c57ba94cd0a0052e7a90d0f969dab24dc58bdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
