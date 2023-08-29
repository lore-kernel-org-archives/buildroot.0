Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2504BC83F17
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 20:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D8060FA4;
	Tue, 29 Aug 2023 20:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D8060FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Mh4NMv0LSTz; Tue, 29 Aug 2023 20:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2E761131;
	Tue, 29 Aug 2023 20:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2E761131
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B75F1BF97E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 743BE40442
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743BE40442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5ugkRgNmDIt for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 20:19:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8023A403D8
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 20:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8023A403D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D3B9864B5; Tue, 29 Aug 2023 20:19:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 22:17:18 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 01a58f55ea3ba29e961f50887b9bfff8bc685b7b
X-Git-Newrev: 1000321ddf36198c81fa10d724390b9200903796
X-Patchwork-Hint: ignore
Message-Id: <20230829201906.6D3B9864B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/transmission: fix
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=1000321ddf36198c81fa10d724390b9200903796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The wrong condition was added with buildroot commit
80793107a65d95f8dfd0317a726d3a737c78ef67.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3367170667fba95f2b9c45b9b6285bb9cb252df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
