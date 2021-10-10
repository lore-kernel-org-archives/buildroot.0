Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352F8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0B360724
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B0B360724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=iodev.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7B1D401CD;
	Sun, 10 Oct 2021 19:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqTmGOnwehSz; Sun, 10 Oct 2021 19:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F09AE40179;
	Sun, 10 Oct 2021 19:19:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C00B21BF3BE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE0A040179
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czdaNBe8t9Nu for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 19:19:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9879340101
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 19:19:57 +0000 (UTC)
Received: from localhost (120.red-79-146-76.dynamicip.rima-tde.net
 [79.146.76.120]) by iodev.co.uk (Postfix) with ESMTPSA id 2A9205EAD7;
 Sun, 10 Oct 2021 21:19:55 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 21:19:36 +0200
Message-Id: <20211010191936.15090-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [RESEND PATCH] package/x11r7/xserver_xorg-server: Add
 support for Xephyr
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
Cc: Ismael Luceno <ismael@iodev.co.uk>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/x11r7/xserver_xorg-server/Config.in              | 5 +++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4dc15435a8aa..7f37f2f1acd4 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -82,4 +82,9 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
 	help
 	  Virtual frame buffer X server.
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR
+	bool "Xephyr server"
+	help
+	  Xephyr nested X server; successor to Xnest.
+
 endif
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2d276f90d56b..6d0876f1fdbe 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -47,12 +47,12 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--disable-config-hal \
 	--enable-record \
 	--disable-xnest \
-	--disable-xephyr \
 	--disable-dmx \
 	--disable-unit-tests \
 	--with-builder-addr=buildroot@buildroot.org \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
 	--with-fontrootdir=/usr/share/fonts/X11/ \
+	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR),en,dis)able-xephyr \
 	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
