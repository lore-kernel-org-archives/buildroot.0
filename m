Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BADC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 09:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 115844148F;
	Tue, 16 Aug 2022 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 115844148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jS7Cc6PR5mhS; Tue, 16 Aug 2022 09:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F55410E5;
	Tue, 16 Aug 2022 09:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F55410E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D13A91BF2A2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD43E60D78
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD43E60D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkuCtNjGHq_C for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 09:39:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008F960B8A
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 09:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008F960B8A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B2718877EE; Tue, 16 Aug 2022 09:24:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 11:33:39 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ac74ab30c16c5101fdfdfeaf7bb85564392c937b
X-Git-Newrev: a5d709287f7167420d7dfd37bc6398fa429d7b93
X-Patchwork-Hint: ignore
Message-Id: <20220816092437.B2718877EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5d709287f7167420d7dfd37bc6398fa429d7b93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
