Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05699C6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 17:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C2C9403E7;
	Sun, 26 Feb 2023 17:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C2C9403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqoG3IPML0ru; Sun, 26 Feb 2023 17:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF9940547;
	Sun, 26 Feb 2023 17:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF9940547
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7475C1BF59B
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 17:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E5C360E76
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 17:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5C360E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqjJVHznODmT for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 17:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CF0E60E6F
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 17:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CF0E60E6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A33786A91; Sun, 26 Feb 2023 17:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 18:44:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b9dda434f9b0fa48c817fe29f949fea0abc53ac
X-Git-Newrev: a34ac4453553a5d86b91e038db3acf0e7eb6931f
X-Patchwork-Hint: ignore
Message-Id: <20230226174443.1A33786A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uccp420wlan: drop package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7296523095794931060=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7296523095794931060==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a34ac4453553a5d86b91e038db3acf0e7eb6931f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uccp420wlan is not maintained anymore (no commit since 2017) and fails
to build with any "recent" kernel (e.g. >= 4.7 which includes
https://github.com/torvalds/linux/commit/57fbcce37be7c1d2622b56587c10ade00e96afa3
or
https://github.com/torvalds/linux/commit/8552a434b6a05cc38006733afe6a239ad4d600a2):

/home/thomas/autobuild/instance-1/output-1/build/uccp420wlan-6.9.1/./src/tx.c: In function ‘uccp420wlan_tx_free_buff_req’:
/home/thomas/autobuild/instance-1/output-1/build/uccp420wlan-6.9.1/./src/tx.c:1142:49: error: ‘IEEE80211_BAND_2GHZ’ undeclared (first use in this function); did you mean ‘IEEE80211_CHAN_2GHZ’?
 1142 |                                 if (ets_band == IEEE80211_BAND_2GHZ)
      |                                                 ^~~~~~~~~~~~~~~~~~~
      |                                                 IEEE80211_CHAN_2GHZ

[...]

/home/thomas/autobuild/instance-1/output-1/build/uccp420wlan-6.9.1/./src/core.c:428:29: error: implicit declaration of function ‘ieee80211_csa_is_complete’; did you mean ‘ieee80211_scan_completed’? [-Werror=implicit-function-declaration]
  428 |                         if (ieee80211_csa_is_complete(uvif->vif))
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                             ieee80211_scan_completed

Fixes:
 - http://autobuild.buildroot.org/results/7cd7151e390b8f7a0df3e647fe4cd5d6319a830b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/uccp420wlan/Config.in        | 16 ----------------
 package/uccp420wlan/uccp420wlan.hash |  4 ----
 package/uccp420wlan/uccp420wlan.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 39 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index af1d8cc1dc..381e1e3a8c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_UCCP420WLAN
+	bool "uccp420wlan removed"
+	select BR2_LEGACY
+	help
+	  The uccp420wlan package is unmaintained and doesn't build
+	  with any "recent" kernel (e.g. >= 4.7).
+
 config BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES
 	bool "imx-gpu-g2d examples removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 6c5238a9b0..3ace25c665 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -621,7 +621,6 @@ endmenu
 	source "package/triggerhappy/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
-	source "package/uccp420wlan/Config.in"
 	source "package/udev/Config.in"
 	source "package/udev-gentoo-scripts/Config.in"
 	source "package/udisks/Config.in"
diff --git a/package/uccp420wlan/Config.in b/package/uccp420wlan/Config.in
deleted file mode 100644
index ef6a9db865..0000000000
--- a/package/uccp420wlan/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_UCCP420WLAN
-	bool "uccp420wlan"
-	depends on BR2_LINUX_KERNEL
-	help
-	  SoftMAC (mac80211) based WiFi driver for Imagination's
-	  Explorer RPU uccp420. This supports Dual Band WiFi with
-	  2.4GHz - 2x2 b/g/n 40MHz, 5GHz - 2x2 a/n/11ac 80MHz modes
-
-	  Used in creator ci40 board.
-
-	  This module needs a Linux kernel >= v4.2.
-
-	  https://github.com/CreatorDev/uccp420wlan
-
-comment "uccp420wlan needs a Linux kernel >= 4.2 to be built"
-	depends on !BR2_LINUX_KERNEL
diff --git a/package/uccp420wlan/uccp420wlan.hash b/package/uccp420wlan/uccp420wlan.hash
deleted file mode 100644
index 905fa4299d..0000000000
--- a/package/uccp420wlan/uccp420wlan.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# locally computed hash
-sha256  1d4de62fc842dbab739708cf0d9ebce270fcdf63c1c13ac676cbc253acdaa3bb  uccp420wlan-6.9.1.tar.gz
-sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
-sha256  9ac431585fddfe624b08cf7464876a5e96061047ff26a9e926da3d89d21a2a73  firmware/LICENSE.imagination
diff --git a/package/uccp420wlan/uccp420wlan.mk b/package/uccp420wlan/uccp420wlan.mk
deleted file mode 100644
index 7256b92774..0000000000
--- a/package/uccp420wlan/uccp420wlan.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# uccp420wlan
-#
-################################################################################
-
-UCCP420WLAN_VERSION = 6.9.1
-UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,v$(UCCP420WLAN_VERSION))
-UCCP420WLAN_LICENSE = GPL-2.0 (kernel module), proprietary (firmware blob)
-UCCP420WLAN_LICENSE_FILES = COPYING firmware/LICENSE.imagination
-
-define UCCP420WLAN_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/lib/firmware/img/uccp420wlan
-	cp $(@D)/firmware/*.ldr $(TARGET_DIR)/lib/firmware/img/uccp420wlan
-endef
-
-$(eval $(kernel-module))
-$(eval $(generic-package))

--===============7296523095794931060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7296523095794931060==--
