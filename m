Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C8EECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EA86121C;
	Fri, 16 Sep 2022 11:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EA86121C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPQdQR9QF1su; Fri, 16 Sep 2022 11:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D5276120B;
	Fri, 16 Sep 2022 11:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5276120B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5101C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C63F161212
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63F161212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCnJ13PFW8iB for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD1C61224
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD1C61224
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB46D83CC2; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:28:32 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: eb9e9145d21d83632f6812502968d82c173bf0d3
X-Git-Newrev: cdf1e6a0b10b92a6c5f51aa7611efb5729161335
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.BB46D83CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/cups: drop bogus
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdf1e6a0b10b92a6c5f51aa7611efb5729161335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
