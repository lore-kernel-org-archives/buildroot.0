Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E9C7619A
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 20:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB3F140E47;
	Sun, 26 Mar 2023 20:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3F140E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oct-jqb8SRg; Sun, 26 Mar 2023 20:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3261416C8;
	Sun, 26 Mar 2023 20:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3261416C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05C5A1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFB0540999
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB0540999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DsAscTOJiYJ for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 20:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5C3A41690
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C3A41690
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3EC882D99; Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 21:59:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e81ca405164fbef1c43fc01aa2f95f67090d3bde
X-Git-Newrev: 9611a3b323676637b9bc463268cfead66c8146fb
X-Patchwork-Hint: ignore
Message-Id: <20230326200116.D3EC882D99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: fix double space in
 Config.in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=9611a3b323676637b9bc463268cfead66c8146fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
