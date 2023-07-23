Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2118DC001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 14:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A9360B1D;
	Sun, 23 Jul 2023 14:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A9360B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9D53z6SaCwR; Sun, 23 Jul 2023 14:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA5860AEE;
	Sun, 23 Jul 2023 14:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA5860AEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32B8D1BF575
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CA4A60AEE
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CA4A60AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lB6lFNQopLEF for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 14:01:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A1DF60AAF
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 14:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1DF60AAF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36F91826D6; Sun, 23 Jul 2023 14:01:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 16:00:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09d1bbde47ecfe6512ebec05d170097f894d4bb5
X-Git-Newrev: f3367170667fba95f2b9c45b9b6285bb9cb252df
X-Patchwork-Hint: ignore
Message-Id: <20230723140100.36F91826D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: fix comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3367170667fba95f2b9c45b9b6285bb9cb252df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wrong condition was added with buildroot commit
80793107a65d95f8dfd0317a726d3a737c78ef67.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/transmission/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 84bd85eeff..fd4c897497 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -49,4 +49,4 @@ comment "transmission needs a toolchain w/ dynamic library, threads, C++, gcc >=
 	depends on BR2_USE_MMU
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
