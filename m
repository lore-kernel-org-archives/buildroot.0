Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F4DC60F89;
	Thu, 21 Apr 2022 18:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKpiXB-4yk8n; Thu, 21 Apr 2022 18:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD9B60EC8;
	Thu, 21 Apr 2022 18:01:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33A9D1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBD7583148
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9jeDnwQ_bqG for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2440783689
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2C29183FE8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:31:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd1dfdf69a9939039c0a45ed97fb96a600752db7
X-Git-Newrev: d1e207f976018e44c964cbe661d5fa315f529527
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.2C29183FE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/startup-notification: bump to
 version 0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1e207f976018e44c964cbe661d5fa315f529527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xcb-util is mandatory since
https://cgit.freedesktop.org/startup-notification/commit/?id=15c0bae76e0bcd5d2839a791cf51c8b22e615fe2
https://cgit.freedesktop.org/startup-notification/commit/?id=57816a46aa32d0bd667661ce6aaaa187f84ec889

https://cgit.freedesktop.org/startup-notification/tree/NEWS?h=STARTUP_NOTIFICATION_0_12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/startup-notification/Config.in                 | 1 +
 package/startup-notification/startup-notification.hash | 2 +-
 package/startup-notification/startup-notification.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 88d18174bc..606276e484 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Startup-notification is a library used to monitor
diff --git a/package/startup-notification/startup-notification.hash b/package/startup-notification/startup-notification.hash
index 474c8bd92c..9c5713213b 100644
--- a/package/startup-notification/startup-notification.hash
+++ b/package/startup-notification/startup-notification.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c2fa09f9a49d8b319e79638e49e967c682df8726006e03059b1ffca5ab82099c  startup-notification-0.9.tar.gz
+sha256  3c391f7e930c583095045cd2d10eb73a64f085c7fde9d260f2652c7cb3cfbe4a  startup-notification-0.12.tar.gz
 sha256  29935974beae046f50da806b5f4e54532401dd7bcfbc696a0b645f4cbcce9dbb  COPYING
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index b3314087f5..4a9e33e5ed 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-STARTUP_NOTIFICATION_VERSION = 0.9
+STARTUP_NOTIFICATION_VERSION = 0.12
 STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
-STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
+STARTUP_NOTIFICATION_DEPENDENCIES = xcb-util xlib_libX11
 STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
 STARTUP_NOTIFICATION_CONF_OPTS = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
