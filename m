Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9873C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3381681145;
	Fri, 28 Feb 2025 17:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc5nB4b_csnA; Fri, 28 Feb 2025 17:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F068817C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F068817C0;
	Fri, 28 Feb 2025 17:14:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11BA068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BD1F42F7A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIuaxSz5kHQu for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E517436C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E517436C3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46E3785E25; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 15:36:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a2be7aff30aa1366913fbe2b8d4e132d63895117
X-Git-Newrev: 1155290904be0f0fab4bc964a099884e7fcb77f5
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.46E3785E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wpa_supplicant:
 install D-Bus policy to datadir
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
