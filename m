Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25539C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B0E409BA;
	Tue, 19 Apr 2022 20:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rf51kpY5InLA; Tue, 19 Apr 2022 20:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E63164025B;
	Tue, 19 Apr 2022 20:35:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E772D1BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D486A41717
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqsUhPFRZ_GT for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:34:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08E97415DB
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:34:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5441C83DDC; Tue, 19 Apr 2022 20:24:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 22:33:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bfe7edc4b1b9074385edd03c3ac1e7e6df0889c
X-Git-Newrev: 6ec4824aa486c3b9fe91b68d224300099cdac0c1
X-Patchwork-Hint: ignore
Message-Id: <20220419202453.5441C83DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: add overrides
 configuration option
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
Content-Type: multipart/mixed; boundary="===============5371675291020164024=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5371675291020164024==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6ec4824aa486c3b9fe91b68d224300099cdac0c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Overrides configuration possibility enabled through
wpa_supplicant configuration file.

Signed-off-by: Mika Joenpera <mika.joenpera@unikie.com>
Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/Config.in         |  7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index f2b0754ee1..7e2432985c 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -89,6 +89,13 @@ config BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING
 	  Enable support for open and secured mesh networking
 	  (IEEE 802.11s)
 
+config BR2_PACKAGE_WPA_SUPPLICANT_OVERRIDES
+	bool "Enable HT/VHT/HE overrides"
+	help
+	  Enable wpa_supplicant overrides for HT, VHT and HE (disable
+	  HT/HT40, mask MCS rates, etc.) in wpa_supplicant
+	  configuration file.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN
 	bool "Enable autoscan"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 8b807fdfbe..c4cfe03371 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -105,6 +105,18 @@ else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_MESH
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OVERRIDES),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += \
+	CONFIG_HT_OVERRIDES \
+	CONFIG_VHT_OVERRIDES \
+	CONFIG_HE_OVERRIDES
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += \
+	CONFIG_HT_OVERRIDES \
+	CONFIG_VHT_OVERRIDES \
+	CONFIG_HE_OVERRIDES
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_AUTOSCAN_EXPONENTIAL \

--===============5371675291020164024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5371675291020164024==--
