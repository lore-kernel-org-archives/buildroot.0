Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B14C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 14:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 905A1406FA;
	Wed, 18 Jun 2025 14:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxuYyupwYy1w; Wed, 18 Jun 2025 14:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75706406F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75706406F7;
	Wed, 18 Jun 2025 14:59:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9094116B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A3CF606D0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKeocBmQdVzt for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 14:59:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37582608FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37582608FD
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37582608FD
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:59:00 +0000 (UTC)
Received: from localhost.localdomain ([151.79.164.54])
 by Aruba SMTP with ESMTPSA
 id RuFduXGg8loieRuFduhlel; Wed, 18 Jun 2025 16:58:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Jun 2025 16:58:57 +0200
Message-Id: <20250618145857.1206836-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBxBpST7J0F+ADK7nykwP5sJeByb/Pc5/6SlWoJ/BuZ0C27I44zSFkNKWIUPmbGNZ1iS1bdbRU+kRYef3/jiZ2uqzocD2JCmzH4L+hr2VCAn17yBa9sg
 DYxLyMLDdDO4Z5SsAfB+QFV5u5KLzT8Q7pZEum4tihjhD54JugvBmqyRIJ+HdA2kDjkWTxMWTbJsob5SQsmqTtTJbX76aQRlkijM6HPVBJSu1Kf8vDUIvmCO
 cUG/mLnM4JCjJp42d+/mLZAY02xBn4Tqr8V6hEjoS0dPb/X4I5qlDeWSCK9VrZSGTaIfBD77xEuf7EyZItO5gA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1750258738; bh=dSaGZEWZSNQZf8RgQBvS8Fj1FaK0GjUwbP0CPpAgoKE=;
 h=From:To:Subject:Date:MIME-Version;
 b=IJWohJCPs5ReK8TyeRC7JIhI6PR/BRfP7LikdUBxE0hpIWm7/wFtMiyNP6cjRPXDw
 wwn/lizbfNMVAIyxpOH2HhKghABGFA78VRNgKLrFNWqoD3unyg3k6xE/mcFbt5IbJf
 xkwqe8W7SugqgjRy/ye+mViRgNYwNDK7X5aOf7BueznR9TV0hcP731z/4Js/KaKp1/
 AGI0U5HakPAUAIJwY/QI9n/vUiTqLIsRvlJzINWA6O6qMWU9jJDDog574uQPpiVt/W
 F9t1XxpbGnCUSrl9NE+SSEg+G6uA5OY26QxIU38EDTbL1uZimlD1m2IrhqS8T1nJwW
 MWQEsoIxZhDEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=IJWohJCP
Subject: [Buildroot] [PATCH] package/rtl8188eu: move upstream to Benetti
 Engineering Github to fix Linux 6.15 build failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Benetti Engineering just took over Larry Finger(lwfinger)'s repository
rtl8188eu since Larry unfortunately passed away[0](RIP) and there are
pending PRs that will never be checked as stated here[1]. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And let's drop local patches
that are now upstreamed as well. Let's also drop obsolete Config.in
informations since as stated here[2]: "This driver is under development
and has a limited feature set. In particular it does not yet support 40MHz
channels and power management". At the same time drop other suggestions
like enabling CONFIG_WIRELESS_EXT or "this package needs a firmware loading
mechanism to load the binary blob for the chip to work" since they are now
part of the package. And of course let's update package's URL due to the
moving.

[0]: https://lwn.net/Articles/979419/
[1]: https://github.com/lwfinger/rtl8188eu/pull/464

Fixes:
https://autobuild.buildroot.org/results/d59537da8eb27d737718885dc81ec257a2791455/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
NOTE: Luca Ceresoli, do you want to remain listed in the DEVELOPERS file as
maintainer of this driver?
---
 .../0001-Fix-build-with-Linux-6.13.patch      | 35 -------------------
 .../0002-Fix-build-with-Linux-6.14.patch      | 33 -----------------
 package/rtl8188eu/Config.in                   | 11 +-----
 package/rtl8188eu/rtl8188eu.hash              |  2 +-
 package/rtl8188eu/rtl8188eu.mk                |  4 +--
 5 files changed, 4 insertions(+), 81 deletions(-)
 delete mode 100644 package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
 delete mode 100644 package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch

diff --git a/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
deleted file mode 100644
index 3594283ff1..0000000000
--- a/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 408ac4abdd1e187624ebef9f6a45ecc437525de5 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 16 Apr 2025 17:34:54 +0200
-Subject: [PATCH] Fix build with Linux 6.13
-
-Commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
-adds struct net_device *dev as argument to set_monitor_channel(), so let's
-add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
-
-Upstream: https://github.com/lwfinger/rtl8188eu/pull/463
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- ioctl_cfg80211.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
-index c6ae5aa..270cfce 100644
---- a/ioctl_cfg80211.c
-+++ b/ioctl_cfg80211.c
-@@ -4404,7 +4404,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
- }
- 
- static int cfg80211_rtw_set_monitor_channel(struct wiphy *wiphy
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
-+	, struct net_device *dev
-+	, struct cfg80211_chan_def *chandef
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
- 	, struct cfg80211_chan_def *chandef
- #else
- 	, struct ieee80211_channel *chan
--- 
-2.39.5
-
diff --git a/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
deleted file mode 100644
index a05a760d22..0000000000
--- a/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0363681349f683050bc9a265db8310e8c4eb6534 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 15 May 2025 22:32:48 +0200
-Subject: [PATCH] Fix build with Linux 6.14
-
-Commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
-adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
-cfg80211_rtw_get_txpower() according to Linux version.
-
-Upstream: https://github.com/lwfinger/rtl8188eu/pull/464
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- ioctl_cfg80211.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
-index 270cfce..04434fa 100644
---- a/ioctl_cfg80211.c
-+++ b/ioctl_cfg80211.c
-@@ -3240,6 +3240,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
- static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
- 	struct wireless_dev *wdev,
-+#endif
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
-+	unsigned int link_id,
- #endif
- 	int *dbm)
- {
--- 
-2.39.5
-
diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 76d9085297..5acef3cd32 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -4,17 +4,8 @@ config BR2_PACKAGE_RTL8188EU
 	depends on BR2_LINUX_KERNEL
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
-	  This is needed only for Linux kernels before 3.12.
-	  Since 3.12, there is a (staging) driver in mainline, with a
-	  similar codebase.
 
-	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
-	  config option enabled.
-
-	  Note: this package needs a firmware loading mechanism to load
-	  the binary blob for the chip to work.
-
-	  https://github.com/lwfinger/rtl8188eu
+	  https://github.com/benetti-engineering-sas/rtl8188eu
 
 comment "rtl8188eu needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 4f8f83e78c..204ee9406b 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  507d32eb91d3d407c7758319c81a36a9dc69e2b89378cabcd382411153927b7b  rtl8188eu-f42fc9c45d2086c415dce70d3018031b54a7beef.tar.gz
+sha256  e1e39a5e2682b799ec113e4d7db4b4e30259ab7d2525add8a1530da87ced0fdc  rtl8188eu-702a90b02edca722cc0d139260ba02c23f406333.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index eca0fb8007..1ad9452f82 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = f42fc9c45d2086c415dce70d3018031b54a7beef
-RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
+RTL8188EU_VERSION = 702a90b02edca722cc0d139260ba02c23f406333
+RTL8188EU_SITE = $(call github,benetti-engineering-sas,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
