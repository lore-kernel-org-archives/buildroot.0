Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D98C53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E1C782057;
	Wed,  4 Jan 2023 22:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E1C782057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEQtTixrjh09; Wed,  4 Jan 2023 22:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C0F82049;
	Wed,  4 Jan 2023 22:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C0F82049
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB471BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E9040911
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E9040911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zV_rN2AWdvxh for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:11:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5128D400D9
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5128D400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40C2D875CE; Wed,  4 Jan 2023 22:11:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 23:09:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca5cd8d67554c568daee4da1f058bcf3b35b2976
X-Git-Newrev: 11479db32c5ea6bbdd7ce9b77873561a2ca07cfb
X-Patchwork-Hint: ignore
Message-Id: <20230104221108.40C2D875CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: drop dangling
 WPA_SUPPLICANT_{LDFLAGS, MAKE_ENV}
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

commit: https://git.buildroot.net/buildroot/commit/?id=11479db32c5ea6bbdd7ce9b77873561a2ca07cfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "0340b45da0 wpa_supplicant: bump to version 1.0" from 2012
converted the package to use the generic infra, but added a bogus
WPA_SUPPLICANT_LDFLAGS end left a dangling WPA_SUPPLICANT_MAKE_ENV.

Drop the symbols that are not used since 2012.

Cc: Matt Weber <matthew.weber@collins.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e5e3938be1..42c6f772ac 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -13,7 +13,6 @@ WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_DBUS_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
-WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
 
 # install the wpa_client library
@@ -157,9 +156,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
 WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
-WPA_SUPPLICANT_MAKE_ENV = \
-	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
-	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
 	$(INSTALL) -m 0644 -D \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
