Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F12C8303C
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25735611D2;
	Tue,  1 Jul 2025 19:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcuJvSH35Uv7; Tue,  1 Jul 2025 19:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A69C61204
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A69C61204;
	Tue,  1 Jul 2025 19:37:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEE41197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D10BF611E4
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUhWPMjJquQ0 for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 90FC660DD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FC660DD1
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90FC660DD1
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgmvuUCdh8eo9WgmwuM2G4; Tue, 01 Jul 2025 21:37:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  1 Jul 2025 21:37:04 +0200
Message-Id: <20250701193705.761121-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701193705.761121-1-giulio.benetti@benettiengineering.com>
References: <20250701193705.761121-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNM7FXeX9BVs6OmrdUjdkvdjK5vDf7NoZXFNYfM0U2YLAHoAss4K4ZJsfxSkMvFqZasYpGxZTg8T/OmMlXzJ6ZdvGaf8deaxjAc18aq/vz30SmpUwKMI
 wrQloefsk39aEkxmQq3tLjIO8Dh96KxgtVZU3QQXXz/Mla15HOrSaLGuYjQlcj2TTMtRNKtmYEoJdR6/F2jaYJ43Hw2uKtiOgz3hqhzRJr0nQvpTihfvQ217
 kIwfc9md7sbUbbYV9lAuqE1Tgt2TCDZLoJ2cj6hmuzy+zq/rfJgtBxesXRt9dUENadkxpv0S24od7ui4nwum1506RIhtDPvJEgVcEt7ORyWeeKsfkhzeFNbb
 qB8/jaJA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751398626; bh=Y7fFt/CbZBakOmi504w2dsMzchS6UAzFWHUl5zlG+LU=;
 h=From:To:Subject:Date:MIME-Version;
 b=cTxJhwYHVcj7EXmbHPz2V6A0oVdKhAKhfqEph8PHDsRyPoAOfKCKDiKJpbBYgRosS
 zmkHFN6wDf+yZOAtUPl+4/kDzhR+pwcZFf/fDNrt8iZ1R5bKbI700J9/6RUze7xtgX
 LAYL7nwpNTonXZWLuYu6jH9pw4+yTK1ba4wKbnAHjstcnfdOuXKX4DdY7I51fyN/E5
 nVgIfk289DDb9PORzSZDqL1qJIw62WJx23NYeHsOPGupuu+Lnm/+zZrYtWoywGAwNj
 cJzh7KE3ZcCXX4T08zsVP/Loj/exPGnqrtDALDSiztpnWhMZSI9XiWGR9/ivB9NoFJ
 +YmsGYed6q58Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cTxJhwYH
Subject: [Buildroot] [PATCH] package/rtl8723ds: fix build failure with Linux
 6.15
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

Benetti Engineering just took over Larry Finger(lwfinger)'s repository [0]
rtl8723ds since Larry unfortunately passed away[1](RIP) and there are
pending PRs that will never be checked as stated here. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And let's drop local patches
that are now upstreamed as well. And of course let's update package's
URL due to the moving.

[0]: https://github.com/lwfinger/rtl8723ds/issues/53
[1]: https://lwn.net/Articles/979419/

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-with-Linux-6.13.patch      | 35 -------------------
 .../0002-Fix-build-with-Linux-6.14.patch      | 33 -----------------
 package/rtl8723ds/Config.in                   |  2 +-
 package/rtl8723ds/rtl8723ds.hash              |  2 +-
 package/rtl8723ds/rtl8723ds.mk                |  4 +--
 5 files changed, 4 insertions(+), 72 deletions(-)
 delete mode 100644 package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
 delete mode 100644 package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch

diff --git a/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
deleted file mode 100644
index 2350dc2e5e..0000000000
--- a/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d71ab09447d9c3043203b5c3b5868e99bc4e0ca8 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 16 Apr 2025 22:00:59 +0200
-Subject: [PATCH] Fix build with Linux 6.13
-
-Commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
-adds struct net_device *dev as argument to set_monitor_channel(), so let's
-add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
-
-Upstream: https://github.com/lwfinger/rtl8723ds/pull/51
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- os_dep/linux/ioctl_cfg80211.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
-index 53ccef4..75391e7 100644
---- a/os_dep/linux/ioctl_cfg80211.c
-+++ b/os_dep/linux/ioctl_cfg80211.c
-@@ -4520,7 +4520,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
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
diff --git a/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch
deleted file mode 100644
index 3027489e33..0000000000
--- a/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d75e35dea1b2551c12e54d5997a1db946ab06080 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sun, 18 May 2025 01:24:26 +0200
-Subject: [PATCH] Fix build with Linux 6.14
-
-Commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
-adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
-cfg80211_rtw_get_txpower() according to Linux version.
-
-Upstream: https://github.com/lwfinger/rtl8723ds/pull/52/commits/d75e35dea1b2551c12e54d5997a1db946ab06080
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- os_dep/linux/ioctl_cfg80211.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
-index 75391e7..adc1fec 100644
---- a/os_dep/linux/ioctl_cfg80211.c
-+++ b/os_dep/linux/ioctl_cfg80211.c
-@@ -3362,6 +3362,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
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
diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
index e5123a2aae..0921a55d37 100644
--- a/package/rtl8723ds/Config.in
+++ b/package/rtl8723ds/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723DS
 	help
 	  rtl8723bs wifi driver
 
-	  https://github.com/lwfinger/rtl8723ds
+	  https://github.com/benetti-engineering-sas/rtl8723ds
 
 comment "rtl8723ds needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index f2829d3f04..d647f9ff28 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f3006ffc1604854edbd6d25ad468ca57f6bcfd7814e4dab57725f144f00aa94  rtl8723ds-52e593e8c889b68ba58bd51cbdbcad7fe71362e4.tar.gz
+sha256  97231efcd0e36b8a95c7baf2aa387fd9cf8303ddd66ce463f25c83f9f989e405  rtl8723ds-97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 2536450d80..f1b345d548 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 52e593e8c889b68ba58bd51cbdbcad7fe71362e4
-RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
+RTL8723DS_VERSION = 97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a
+RTL8723DS_SITE = $(call github,benetti-engineering-sas,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
