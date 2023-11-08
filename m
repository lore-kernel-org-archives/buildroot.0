Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB752C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 13:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3ED81992;
	Wed,  8 Nov 2023 13:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3ED81992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93TksStXCMva; Wed,  8 Nov 2023 13:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E018198A;
	Wed,  8 Nov 2023 13:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E018198A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 941021BF3DE
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A8DE610B0
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8DE610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIJ3yP6BF6P7 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 13:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC50F61087
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 13:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC50F61087
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6E4F86CE2; Wed,  8 Nov 2023 13:45:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 14:40:59 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9239fc105e316a90570f8fa8b69e55d766ca24ac
X-Git-Newrev: d797aee1411b5687b19f50a1c6b8ece5dbe5b671
X-Patchwork-Hint: ignore
Message-Id: <20231108134559.A6E4F86CE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/zabbix: add
 missing BR2_OPTIMIZE_FAST
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

commit: https://git.buildroot.net/buildroot/commit/?id=d797aee1411b5687b19f50a1c6b8ece5dbe5b671
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add missing BR2_OPTIMIZE_FAST dependency to BR2_PACKAGE_ZABBIX_SERVER
to avoid the following build failure raised since commit
e702a05d8998a1f2416225eb62b43b6585738fe9:

checking for Zabbix server/proxy database selection... error
configure: error: No database selected for Zabbix server/proxy. Use --with-mysql or --with-oracle or --with-postgresql or --with-sqlite3.

Fixes:
 - http://autobuild.buildroot.org/results/ab403b45761c82f49a9380564bf10d3e7ae935f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6da2b51a66a848cc9a7346302227fd4740fc7e67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
