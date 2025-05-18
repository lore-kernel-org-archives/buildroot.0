Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1D8C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8030E40956;
	Sun, 18 May 2025 13:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnStYNUxqHKT; Sun, 18 May 2025 13:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADCA94092A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCA94092A;
	Sun, 18 May 2025 13:28:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B75E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E58760AC3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsa8X8ETR1-w for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB956064B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFB956064B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:28:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEE2786FE9; Sun, 18 May 2025 13:28:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:28:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53e1772682d86ed681ce41b4027bd34163023871
X-Git-Newrev: 7acb67fc2ba42428f724445b412a46b75bc4ecf0
X-Patchwork-Hint: ignore
Message-Id: <20250518132811.CEE2786FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: add option to
 build deprecated WEP support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7acb67fc2ba42428f724445b412a46b75bc4ecf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Lumbra <brandon.lumbra@sense.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpa_supplicant/Config.in         | 7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index e385d762e6..fd15e95be1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -183,4 +183,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD
 	  Enable the smart card support. Required for OpenSSL engines
 	  to work using PKCS11 and 802.1x
 
+config BR2_PACKAGE_WPA_SUPPLICANT_WEP
+	bool "Enable WEP support (deprecated)"
+	help
+	  Enable support for WEP. WEP support is deprecated due to
+	  security concerns, but some systems may want to support WEP
+	  networks.
+
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9de536b943..fe4bc34d55 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -200,6 +200,10 @@ define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WEP),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WEP
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_BUILD_WPA_CLIENT_SO
 define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
