Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2B6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DF4610A4
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4DF4610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8561481D47;
	Wed, 27 Oct 2021 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmJG4cbKgNiq; Wed, 27 Oct 2021 20:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DCF80EDD;
	Wed, 27 Oct 2021 20:15:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B74BC1BF3D4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A242E60B23
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ki5ZDaEWEVU for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:15:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F14AA607AF
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:15:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A4D3C88FEF; Wed, 27 Oct 2021 20:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:10:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e694cc0a25906a7ca40ab95fd862940930500699
X-Git-Newrev: eedbd6f97d51a0049ec512de26541465403ab06f
X-Patchwork-Hint: ignore
Message-Id: <20211027201222.A4D3C88FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: Add
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eedbd6f97d51a0049ec512de26541465403ab06f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xserver_xorg-server/Config.in              | 5 +++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4dc15435a8..7f37f2f1ac 100644
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
index 2d276f90d5..6d0876f1fd 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
