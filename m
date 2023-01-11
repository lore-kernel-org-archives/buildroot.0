Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E5C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4254840135;
	Wed, 11 Jan 2023 09:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4254840135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzEJefxHUz3e; Wed, 11 Jan 2023 09:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9947F40134;
	Wed, 11 Jan 2023 09:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9947F40134
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80AF31BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD09540351
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD09540351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3pVOnhAtqlD for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB39403D8
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB39403D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6F0A878DD; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:25:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1b9afbd64f6a702f5a99f41ca6597e25745b4734
X-Git-Newrev: 0bd18549c896f4773085447288c83141886fec34
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.E6F0A878DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wpa_supplicant:
 drop dangling WPA_SUPPLICANT_{LDFLAGS, MAKE_ENV}
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bd18549c896f4773085447288c83141886fec34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "0340b45da0 wpa_supplicant: bump to version 1.0" from 2012
converted the package to use the generic infra, but added a bogus
WPA_SUPPLICANT_LDFLAGS end left a dangling WPA_SUPPLICANT_MAKE_ENV.

Drop the symbols that are not used since 2012.

Cc: Matt Weber <matthew.weber@collins.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 11479db32c5ea6bbdd7ce9b77873561a2ca07cfb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 5c79abe0ef..05abf61e83 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -13,7 +13,6 @@ WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_DBUS_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
-WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
 
 # install the wpa_client library
@@ -143,9 +142,6 @@ endif
 
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
