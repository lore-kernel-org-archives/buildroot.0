Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF36D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883038057F;
	Sun, 27 Oct 2024 18:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q306-Fk2EtcE; Sun, 27 Oct 2024 18:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7384580574
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7384580574;
	Sun, 27 Oct 2024 18:46:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4D7971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8EE607DA
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9gzgJCBPgB6 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A386607EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A386607EC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:46:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11C838427B; Sun, 27 Oct 2024 18:46:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:45:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d52ba28fbe40e42ccf68c50ec12f04ce9fde7734
X-Git-Newrev: 2417d0cf81ee54329aa941d1a588baf601711978
X-Patchwork-Hint: ignore
Message-Id: <20241027184601.11C838427B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: add configuration
 for WPA3-Entreprise
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

commit: https://git.buildroot.net/buildroot/commit/?id=2417d0cf81ee54329aa941d1a588baf601711978
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extend the set of options enabled when BR2_PACKAGE_WPA_SUPPLICANT_WPA3
by also enabling:

 - CONFIG_SUITEB: WPA3-Enterprise
 - CONFIG_SUITEB192: WPA3-Enterprise (SuiteB 192 bits security)

While at it, document the options that are enabled.

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 984959f679..aef8731341 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -126,18 +126,29 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),)
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WPS
 endif
 
+# WPA3 configurations:
+# - CONFIG_DPP: Easy Connect (Device Provisioning Protocol - DPP R1 & R2)
+# - CONFIG_SAE: Simultaneous Authentication of Equals (SAE), WPA3-Personal
+# - CONFIG_SAE_PK: SAE Public Key, WPA3-Personal
+# - CONFIG_OWE: Opportunistic Wireless Encryption (OWE)
+# - CONFIG_SUITEB: WPA3-Enterprise
+# - CONFIG_SUITEB192: WPA3-Enterprise (SuiteB 192 bits security)
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
 	CONFIG_SAE_PK \
-	CONFIG_OWE
+	CONFIG_OWE \
+	CONFIG_SUITEB \
+	CONFIG_SUITEB192
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
 	CONFIG_SAE_PK \
-	CONFIG_OWE
+	CONFIG_OWE \
+	CONFIG_SUITEB \
+	CONFIG_SUITEB192
 endif
 
 # Try to use openssl if it's already available
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
