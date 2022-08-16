Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DFCC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 09:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5444099B;
	Tue, 16 Aug 2022 09:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C5444099B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWfgEzmps9PN; Tue, 16 Aug 2022 09:38:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F1744038C;
	Tue, 16 Aug 2022 09:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1744038C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E6A71BF9B9
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 460944038C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460944038C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5zYmdHaifob for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 09:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50F3540358
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 09:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F3540358
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D2A1877DB; Tue, 16 Aug 2022 09:24:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 11:34:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dcd43bdf16f7c5af695b7d12897f04888b190ecc
X-Git-Newrev: 04e37b9a4946c9c7add323145a008d26b7080c56
X-Patchwork-Hint: ignore
Message-Id: <20220816092409.0D2A1877DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/x11r7/xserver_xorg-server: drop unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=04e37b9a4946c9c7add323145a008d26b7080c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

dmx has been dropped since version 21.1.0 and
https://gitlab.freedesktop.org/xorg/xserver/-/commit/b3b81c8c2090cd49410960a021baf0d27fdd2ab3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit da7b8726692ee8f0fede8118ad06a4aa938e67e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index fa5d2a802d..43d2038a8d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -45,7 +45,6 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--disable-config-hal \
 	--enable-record \
 	--disable-xnest \
-	--disable-dmx \
 	--disable-unit-tests \
 	--with-builder-addr=buildroot@buildroot.org \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
@@ -165,10 +164,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-screensaver
 endif
 
-ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dmx
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libcrypto
 XSERVER_XORG_SERVER_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
