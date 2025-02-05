Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B6C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0724860EEF;
	Wed,  5 Feb 2025 14:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEW61NiIH83f; Wed,  5 Feb 2025 14:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9D960FCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9D960FCA;
	Wed,  5 Feb 2025 14:36:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE22C12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0A1060EEF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sq8aAgRPXHA5 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D16C60B49
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D16C60B49
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF9718709C; Wed,  5 Feb 2025 14:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 15:36:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2be7aff30aa1366913fbe2b8d4e132d63895117
X-Git-Newrev: 1155290904be0f0fab4bc964a099884e7fcb77f5
X-Patchwork-Hint: ignore
Message-Id: <20250205143640.EF9718709C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: install D-Bus
 policy to datadir
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1155290904be0f0fab4bc964a099884e7fcb77f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
is deprecated, they should go into datadir (/usr/share) instead
[1]. Follow that policy.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index aef8731341..44cfed495b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -254,7 +254,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 define WPA_SUPPLICANT_INSTALL_DBUS
 	$(INSTALL) -m 0644 -D \
 		$(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
-		$(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
+		$(TARGET_DIR)/usr/share/dbus-1/system.d/wpa_supplicant.conf
 	$(WPA_SUPPLICANT_INSTALL_DBUS_NEW)
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
