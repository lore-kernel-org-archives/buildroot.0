Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F8AC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3DB61404;
	Mon, 10 Apr 2023 19:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E3DB61404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Gel0N5No_5o; Mon, 10 Apr 2023 19:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77CDD613D5;
	Mon, 10 Apr 2023 19:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77CDD613D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 178571C3BA3
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E908761409
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E908761409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIdHtGSJ98m9 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C2D613FC
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C2D613FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C76F83DC7; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:19:28 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 737d2217530992f9cf6d0d2e575d9105485b4a9f
X-Git-Newrev: 786756e423865ebd7043bbaf0963a0b861f9d91f
X-Patchwork-Hint: ignore
Message-Id: <20230410193723.0C76F83DC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/osm2pgsql: fix
 double space in Config.in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=786756e423865ebd7043bbaf0963a0b861f9d91f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9611a3b323676637b9bc463268cfead66c8146fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/osm2pgsql/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index e903e92c49..3e73572a80 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_OSM2PGSQL
 
 	  https://osm2pgsql.org
 
-comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.9"
+comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
