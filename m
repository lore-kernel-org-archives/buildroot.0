Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CE6C4167B
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD6A041F31;
	Thu,  2 Nov 2023 18:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD6A041F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0y7JhHQwP1S0; Thu,  2 Nov 2023 18:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E665C42032;
	Thu,  2 Nov 2023 18:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E665C42032
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9F1E1BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C028E70709
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C028E70709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8EBTKU-d2XN for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:04:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07BBE705D2
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07BBE705D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB3F08654F; Thu,  2 Nov 2023 18:04:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Nov 2023 19:03:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68dbb0082adea69b571039447fa3ad036467787d
X-Git-Newrev: 6da2b51a66a848cc9a7346302227fd4740fc7e67
X-Patchwork-Hint: ignore
Message-Id: <20231102180410.DB3F08654F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: add missing
 BR2_OPTIMIZE_FAST
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

commit: https://git.buildroot.net/buildroot/commit/?id=6da2b51a66a848cc9a7346302227fd4740fc7e67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing BR2_OPTIMIZE_FAST dependency to BR2_PACKAGE_ZABBIX_SERVER
to avoid the following build failure raised since commit
e702a05d8998a1f2416225eb62b43b6585738fe9:

checking for Zabbix server/proxy database selection... error
configure: error: No database selected for Zabbix server/proxy. Use --with-mysql or --with-oracle or --with-postgresql or --with-sqlite3.

Fixes:
 - http://autobuild.buildroot.org/results/ab403b45761c82f49a9380564bf10d3e7ae935f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zabbix/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 377c0ff692..af677f782e 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_ZABBIX_SERVER
 	depends on BR2_USE_MMU # mysql, postgresql
 	depends on \
 		(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS) || \
-		(BR2_USE_WCHAR && !BR2_STATIC_LIBS)
+		(BR2_USE_WCHAR && !BR2_STATIC_LIBS && !BR2_OPTIMIZE_FAST)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBEVENT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
