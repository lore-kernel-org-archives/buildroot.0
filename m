Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D312ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EFA41C5F;
	Fri, 16 Sep 2022 11:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EFA41C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAUp4v3y-tJN; Fri, 16 Sep 2022 11:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C43741C7B;
	Fri, 16 Sep 2022 11:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C43741C7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3B91BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 384A44195E
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 384A44195E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy7qm_VZFqit for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDE9241C97
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE9241C97
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DB8E983CC0; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:28:40 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d16462b70cd60e9603561a072b08438251c375e7
X-Git-Newrev: ce866e54d2dc2b5567ffcad775729d7a7126259c
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.DB8E983CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cups: drop bogus
 libpaper dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce866e54d2dc2b5567ffcad775729d7a7126259c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The inexistent package libpaper is referenced since 2016, from commit:
'd37ce8e1a4 package/cups: Un-deprecate, and update CUPS to 2.1.2'

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d9369b2cdbeb9c309a8a04518cc14d7f6f43c99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
