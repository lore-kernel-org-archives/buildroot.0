Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F22C25B08
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D66B360F68;
	Mon, 15 Aug 2022 09:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66B360F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-SkbdbjJ1Qf; Mon, 15 Aug 2022 09:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0922360EDB;
	Mon, 15 Aug 2022 09:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0922360EDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 042DA1BF995
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D290540A8B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D290540A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeH6Ij4KyreA for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3130D40AA2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3130D40AA2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 32D34875AC; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 587d69236c0f93533ed32b15031677cd7b93379c
X-Git-Newrev: a25026f3b95df36f2d18ab1e1dd5e805c73abb22
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.32D34875AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: fix typo for
 BR2_aarch64_be
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a25026f3b95df36f2d18ab1e1dd5e805c73abb22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The typo was introduced in 2016 by commit
'2f89476ad9 package/libgpg-error: bump to version 1.23'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
