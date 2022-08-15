Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579C9C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F34F760F89;
	Mon, 15 Aug 2022 09:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34F760F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxD8xeBoZSNP; Mon, 15 Aug 2022 09:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C7160F54;
	Mon, 15 Aug 2022 09:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C7160F54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36BD31BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 872E6408D0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872E6408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0pbhv_ERlRX for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB1C340A97
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1C340A97
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BEEC2875A7; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b828d531ae1c72466e2f45cd59aea686e0ae7322
X-Git-Newrev: 8d9369b2cdbeb9c309a8a04518cc14d7f6f43c99
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.BEEC2875A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: drop bogus libpaper
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d9369b2cdbeb9c309a8a04518cc14d7f6f43c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The inexistent package libpaper is referenced since 2016, from commit:
'd37ce8e1a4 package/cups: Un-deprecate, and update CUPS to 2.1.2'

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/cups.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 2bd5f3bbb6..fed2aa809f 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -27,6 +27,7 @@ CUPS_CONF_OPTS = \
 	--with-cups-user=lp \
 	--with-cups-group=lp \
 	--with-system-groups="lpadmin sys root" \
+	--disable-libpaper \
 	--without-rcdir
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
@@ -63,13 +64,6 @@ else
 CUPS_CONF_OPTS += --disable-libusb
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPAPER),y)
-CUPS_CONF_OPTS += --enable-libpaper
-CUPS_DEPENDENCIES += libpaper
-else
-CUPS_CONF_OPTS += --disable-libpaper
-endif
-
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 CUPS_DEPENDENCIES += avahi
 CUPS_CONF_OPTS += --enable-avahi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
