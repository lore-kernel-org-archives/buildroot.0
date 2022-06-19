Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3058BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE8BD4136C;
	Sun, 19 Jun 2022 16:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE8BD4136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yr9Kqijz7PdI; Sun, 19 Jun 2022 16:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A909D410D8;
	Sun, 19 Jun 2022 16:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A909D410D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2E51BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F7E408E9
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F7E408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fx1Qpgjfawfn for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FCDF404C9
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FCDF404C9
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C8FFD873C0; Sun, 19 Jun 2022 15:45:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c79d8cb72c9042c950336a3978504925570bd759
X-Git-Newrev: a76294cd6cf4c06a37b326585cb118d561322315
X-Patchwork-Hint: ignore
Message-Id: <20220619154529.C8FFD873C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: fixing "Invalid
 configuration line"
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

commit: https://git.buildroot.net/buildroot/commit/?id=a76294cd6cf4c06a37b326585cb118d561322315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Default configuration file is wrong for the default compiling options.

Fixes:

Successfully initialized wpa_supplicant
Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
Line 1: Invalid configuration line
'ctrl_interface=/var/run/wpa_supplicant'.
Failed to read or parse configuration '/etc/wpa_supplicant.conf'.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/wpa_supplicant.conf | 2 +-
 package/wpa_supplicant/wpa_supplicant.mk   | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
index 1994a6c739..20e9f7f842 100644
--- a/package/wpa_supplicant/wpa_supplicant.conf
+++ b/package/wpa_supplicant/wpa_supplicant.conf
@@ -1,4 +1,4 @@
-ctrl_interface=/var/run/wpa_supplicant
+#ctrl_interface=/var/run/wpa_supplicant
 ap_scan=1
 
 network={
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index c4cfe03371..14f6a6e271 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -184,6 +184,12 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
+define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
+	sed -i '/ctrl_interface/s/^#//g' $(TARGET_DIR)/etc/wpa_supplicant.conf
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_BUILD_WPA_CLIENT_SO
 define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
@@ -259,6 +265,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
+	$(WPA_SUPPLICANT_ENABLE_CTRL_IFACE)
 endef
 
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
