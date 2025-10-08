Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B14CCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 16:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47D260ECC;
	Wed,  8 Oct 2025 16:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOHblJZhUv82; Wed,  8 Oct 2025 16:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CFAA60EBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CFAA60EBC;
	Wed,  8 Oct 2025 16:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 051E6119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 613AF40B5F
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STfnzQbwmTLl for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 16:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1549C40B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1549C40B60
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1549C40B60
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6WwrvyUuj3rWi6Wwsve6oE; Wed, 08 Oct 2025 18:23:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  8 Oct 2025 18:23:28 +0200
Message-ID: <20251008162328.3569687-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
References: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFlVDbbvg+bPFUlgXQ3mw7gBLxD3lCQhAeExq1/JVU5EUbAcwb5R73K9/jK/MJFpgKdESFuvva7mJ79xlcJz3lgfkJAXeKGqvfqY92zPflms45CkZBHN
 9t2tYoBnnXCx38oJtrB60E1MTiNisaZnks+wttmPKQJ67YjG59QDALYqsaxR+tnvHgsFpR2BBpeapw/3f8xrIB83QRogGPepx6EtSqknOu/Pv8MK5rfG6mnA
 hyD1e6CNW/RdVMA9RRHWsq5vGTnPAJaD/DOvSWuCG8JCM3WGJ1NOx51GU+Ms9QuCHXsu22uNq9UtEjfatZdpFVxDzPbehHCgwWa5ItOT/Kc7HpAQ8TCcWdym
 5kBD7jGR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759940610; bh=W15MUVQo72z4QYzX0MgklRglooBQ8uUs6upw/dzV4YA=;
 h=From:To:Subject:Date:MIME-Version;
 b=CRtFFRD40eekGZa+t17ny0dVkkDRvGAEYlNMryzChX/s+ZzdrWThPTu2QUae7x/Wq
 x3IFONiQ9oAKYzr0uFaCenIcWdHVaQx/DC64OVuYGziwRosZF8Z4h7TIKKcspD1faD
 nJjdd91/8VhXjaDBcXpSw+PvDQhbEVuNnAakY8DRrHGmnEs2JjF5IqvD2JJjZmn25O
 OgF9RxIrEIkBuRIf9EaIYy5lVkExxqUE7kxwvppzkM4jK77q0uQNsjrvp+7RJXgF+x
 exhl5jTywX8g47FzoK+iUyGBimsXwwheCQx/fTCOZ/UMYrnlds/OK+S47WNmiGh4kA
 FO6exiO76mr3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CRtFFRD4
Subject: [Buildroot] [PATCH] package/rtl8821cu: fix build failure with Linux
 6.17
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

* Bump to version 2025-09-10
* Drop upstreamed local patch
* Add local patch to fix build with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-for-kernel-6.16.patch      | 34 -----------
 .../0001-Fix-build-for-kernel-6.17.patch      | 57 +++++++++++++++++++
 package/rtl8821cu/rtl8821cu.hash              |  2 +-
 package/rtl8821cu/rtl8821cu.mk                |  2 +-
 4 files changed, 59 insertions(+), 36 deletions(-)
 delete mode 100644 package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
 create mode 100644 package/rtl8821cu/0001-Fix-build-for-kernel-6.17.patch

diff --git a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
deleted file mode 100644
index 311d4fcd4c..0000000000
--- a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 13f85e370c265b782a801cd22f86cea6f6cda876 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 8 Sep 2025 21:04:30 +0200
-Subject: [PATCH] Fix build for kernel 6.16
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
-from_timer() has been renamed to timer_container_of() so let's rename
-according to linux version >= 6.16.
-
-Upstream: https://github.com/morrownr/8821cu-20210916/pull/187
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- include/osdep_service_linux.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
-index ed1e19b..c25f6a2 100644
---- a/include/osdep_service_linux.h
-+++ b/include/osdep_service_linux.h
-@@ -210,6 +210,10 @@ typedef void	*thread_context;
- typedef void timer_hdl_return;
- typedef void *timer_hdl_context;
- 
-+#if (LINUX_VERSION_CODE > KERNEL_VERSION(6, 16, 0))
-+#define from_timer     timer_container_of
-+#endif
-+
- #if (LINUX_VERSION_CODE > KERNEL_VERSION(2, 5, 41))
- 	typedef struct work_struct _workitem;
- #else
--- 
-2.43.0
-
diff --git a/package/rtl8821cu/0001-Fix-build-for-kernel-6.17.patch b/package/rtl8821cu/0001-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..73e55564ce
--- /dev/null
+++ b/package/rtl8821cu/0001-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,57 @@
+From 9ebb828281a04ca5f46b7913201e1f884bc39962 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 8 Oct 2025 18:11:07 +0200
+Subject: [PATCH] Fix build for kernel 6.17
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_wiphy_params() and set/get_tx_power() gain argument radio_idx to get
+radio index. So let's add that argument according to linux version >=
+6.17.
+
+Upstream: https://github.com/morrownr/8821cu-20210916/pull/191
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/linux/ioctl_cfg80211.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 7961df0..e8372b1 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -3603,7 +3603,12 @@ static void cfg80211_rtw_abort_scan(struct wiphy *wiphy,
+ }
+ #endif
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, int radio_idx,
++					 u32 changed)
++#else
+ static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, u32 changed)
++#endif
+ {
+ #if 0
+ 	struct iwm_priv *iwm = wiphy_to_iwm(wiphy);
+@@ -4588,6 +4593,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 36)) || defined(COMPAT_KERNEL_RELEASE)
+ 	enum nl80211_tx_power_setting type, int mbm)
+ #else
+@@ -4650,6 +4658,9 @@ static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
+ 	unsigned int link_id,
+ #endif
+-- 
+2.47.3
+
diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index e7418b4cd0..ad59dfedfd 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b4bf57959d14ad1a2637a0385876c6fb319d6e4951986bbba18de3c0e65bb86  rtl8821cu-d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf.tar.gz
+sha256  9ec641bb8005ac6f8fb7f5e941bf07496f0c78618c61bce084e66cb94544cff4  rtl8821cu-07fa9cf0fa8b0c08920c359c725dfc250e91422b.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index ac53b65fda..9010ec389b 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf
+RTL8821CU_VERSION = 07fa9cf0fa8b0c08920c359c725dfc250e91422b
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
