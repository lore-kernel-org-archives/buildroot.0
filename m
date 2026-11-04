Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B831F60745B3
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I0ZuSOtr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9533F607A3;
	Wed,  4 Nov 2026 21:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BA0zUMw8BlON; Wed,  4 Nov 2026 21:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1CBD3607B4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829283;
	b=ch+biNpVn82usgBCrF3lT5BD0S1032adf4jwabBQ4UKeVhM6tDvTOrmSou9B413eKaRi
	 ArOQ8EJsVtbxgJzjKGDDf624Jp/Azr6avIAxEnu5hp2ppVt/sUWL7V1br6ktqs/aIQQTU
	 b+fuAqOdaPIUbuR7HG8lozCTBBguTTszXv4csAKwmjn2alSFP7bJsps3aqvBxVcUiZG1U
	 pMtPqs5il6O7KesEtuCPwAA8RUHqf0xUdP06dfqQfhwOHUE6b1w27j0XO9SwbORWOYCNj
	 +tLYxzN7vlUjeIEoBdX/+CIFGENB2qEYwjLYkp7eSUaL9Ads2KzCjDzOanZc8jxKRsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gXYDWWTOEav/N+2xJx0d9vqqUwFO9kl50HtVw47OYto=;
	b=eSlTlaFOM8IG2F/+T5C981vXNHmN9Fbl80J/PPobB4fwuWlq2hVXJDAt7SAt0n2pSULW
	 GSzcvvrH5j4xCykijaUtCD1yK1m71XaUqHHAo6lxBId0BMNZTmgHqH71vL3R2GhIYsHsC
	 kQXIYjsUmQ/AQY6dqooI6ZTd73rFPwnSR3uRJVNWUDwAzMf6SwsYRvP76tMbyG0Zncjyr
	 HxzHYtVK84wavF7ACfVLwlvO6Qs7QpkA+tCYKPCNwwSQp9zGXk15CiAyxPfrNJ0SnaPgR
	 jcdNvGYA+A/G1cD6dSH53jknP9a1vKlAZlcwqdoX/Y3Fj7Fpeu6fiPNU0gLohR6xujg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829283;
	bh=gXYDWWTOEav/N+2xJx0d9vqqUwFO9kl50HtVw47OYto=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I0ZuSOtrTG1OAEH6IiJ3tFjH+PnYr1Lxz3wBgjx7bAOOlFMQY7f0WJsTk3r7mhgG/
	 qEZkBhl02dvX+3f47SEPrhWjZ82gcc9v1BeVMYCkfD+6UJU3n2mDjlY1K+n7TcP85w
	 H6uJaCW/gsfo044sIFGQ+eOPbetkfy5d1qS+V60u12udKA11ldMfR5BUheJdhWcrhv
	 rhNWuPM6Dl+9fzLtNTRexz5+1E0Q53SW0ZyDtWxV8LPP9n6p2dRgS5p3CJ7+qlj1ba
	 QWQH2lxpow7OKj5lGc4Fn68Zhb7W0R8Oh8OJClxqVJlSldR4d6ZHGnmb86nCLKgD4o
	 RkgIrbtuOiMEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CBD3607B4;
	Wed,  4 Nov 2026 21:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42B37D3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3458D811A8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z02KVZcMn0Jb for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 375678119A
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 375678119A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D59D9DEF0; Wed,  4 Nov 2026 21:53:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:53:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b820f8e22a936ca80a3c7c8eb862c7476f53a71
X-Git-Newrev: c51942450a639436d8dab52b6dee1dbb99ad9538
X-Patchwork-Hint: ignore
Message-Id: <20261104215310.4D59D9DEF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix build failure with
 Linux >= 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c51942450a639436d8dab52b6dee1dbb99ad9538
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Espressif moved esp-hosted NG driver to a separate repository so let's
point ESP_HOSTED_SITE accordingly(esp-hosted-linux) taking into account
the slight difference of folder structure.
Let's also bump to latest version 2026-11-01 and drop local patch that has
been applied to master branch.
So let's add local patch pending upstream to fix build failure with Linux
7.3.0.

Fixes: https://autobuild.buildroot.net/results/73d/73dfe379673a3ac506ab96ee7bacc9172a3aa66a/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch | 147 ---------------------
 ...ix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch |  86 ++++++++++++
 package/esp-hosted/esp-hosted.hash                 |   4 +-
 package/esp-hosted/esp-hosted.mk                   |   8 +-
 4 files changed, 92 insertions(+), 153 deletions(-)

diff --git a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
deleted file mode 100644
index 90076b4956..0000000000
--- a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From fa27d70495e3b4f92c9de43b33aa09813a318495 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 18 May 2026 16:44:57 +0200
-Subject: [PATCH] fix(esp_hosted_ng): Fix build for kernel 7.1
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=033fe322f5852d5144a85978e880e01b1787fd0d
-many functions esp_cfg80211_*() have argument struct netdevice * subsituted
-with struct wireless_dev *. So let's add separate function headers and
-retrieve struct netdev * from struct wireless_dev * if Linux version >= 7.1.
-
-Upstream: https://github.com/espressif/esp-hosted/pull/736
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- esp_hosted_ng/host/esp_cfg80211.c | 50 +++++++++++++++++++++++++++++++
- 1 file changed, 50 insertions(+)
-
-diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
-index c68f7983e6..1009df1fd5 100644
---- a/esp_hosted_ng/host/esp_cfg80211.c
-+++ b/esp_hosted_ng/host/esp_cfg80211.c
-@@ -533,22 +533,38 @@ static int esp_cfg80211_set_default_key(struct wiphy *wiphy,
- }
- 
- static int esp_cfg80211_set_default_mgmt_key(struct wiphy *wiphy,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+					     struct wireless_dev *wdev, INT_LINK_ID u8 key_index)
-+#else
- 					     struct net_device *ndev, INT_LINK_ID u8 key_index)
-+#endif
- {
- 	return 0;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+static int esp_cfg80211_del_key(struct wiphy *wiphy, struct wireless_dev *wdev,
-+#else
- static int esp_cfg80211_del_key(struct wiphy *wiphy, struct net_device *dev,
-+#endif
- 				INT_LINK_ID u8 key_index, bool pairwise,
- 				const u8 *mac_addr)
- {
- 	return 0;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+static int esp_cfg80211_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
-+				INT_LINK_ID u8 key_index, bool pairwise,
-+				const u8 *mac_addr, struct key_params *params)
-+{
-+	struct net_device *dev = wdev->netdev;
-+#else
- static int esp_cfg80211_add_key(struct wiphy *wiphy, struct net_device *dev,
- 				INT_LINK_ID u8 key_index, bool pairwise,
- 				const u8 *mac_addr, struct key_params *params)
- {
-+#endif
- 	struct esp_wifi_device *priv = NULL;
- 
- 	if (!wiphy || !dev || !params) {
-@@ -564,7 +580,11 @@ static int esp_cfg80211_add_key(struct wiphy *wiphy, struct net_device *dev,
- 	esp_dbg("\n");
- 
- 	if (params->key_len == 0) {
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+		return esp_cfg80211_del_key(wiphy, wdev, ZERO_LINK_ID key_index, pairwise, mac_addr);
-+#else
- 		return esp_cfg80211_del_key(wiphy, dev, ZERO_LINK_ID key_index, pairwise, mac_addr);
-+#endif
- 	}
- 	return cmd_add_key(priv, key_index, pairwise, mac_addr, params);
- }
-@@ -783,9 +803,16 @@ static int esp_cfg80211_set_tx_power(struct wiphy *wiphy,
- 	return cmd_set_tx_power(priv, priv->tx_pwr);
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+static int esp_cfg80211_get_station(struct wiphy *wiphy, struct wireless_dev *wdev,
-+				    const u8 *mac, struct station_info *sinfo)
-+{
-+	struct net_device *ndev = wdev->netdev;
-+#else
- static int esp_cfg80211_get_station(struct wiphy *wiphy, struct net_device *ndev,
- 				    const u8 *mac, struct station_info *sinfo)
- {
-+#endif
- 	struct esp_wifi_device *priv = NULL;
- 
- 	priv = netdev_priv(ndev);
-@@ -1034,9 +1061,16 @@ static int esp_cfg80211_probe_client(struct wiphy *wiphy, struct net_device *dev
- 	return 0;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+static int esp_cfg80211_del_station(struct wiphy *wiphy, struct wireless_dev *wdev,
-+					struct station_del_parameters *params)
-+{
-+	struct net_device *dev = wdev->netdev;
-+#else
- static int esp_cfg80211_del_station(struct wiphy *wiphy, struct net_device *dev,
- 					struct station_del_parameters *params)
- {
-+#endif
- 	struct esp_wifi_device *priv = NULL;
- 
- 	if (!wiphy || !dev) {
-@@ -1055,10 +1089,18 @@ static int esp_cfg80211_del_station(struct wiphy *wiphy, struct net_device *dev,
- 	return 0;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+static int esp_cfg80211_add_station(struct wiphy *wiphy, struct wireless_dev *wdev,
-+				    const u8 *mac,
-+				    struct station_parameters *params)
-+{
-+	struct net_device *dev = wdev->netdev;
-+#else
- static int esp_cfg80211_add_station(struct wiphy *wiphy, struct net_device *dev,
- 				    const u8 *mac,
- 				    struct station_parameters *params)
- {
-+#endif
- 	struct esp_wifi_device *priv = NULL;
- 
- 	if (!wiphy || !dev) {
-@@ -1078,10 +1120,18 @@ static int esp_cfg80211_add_station(struct wiphy *wiphy, struct net_device *dev,
- 	return 0;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
-+static int esp_cfg80211_change_station(struct wiphy *wiphy,
-+				       struct wireless_dev *wdev, const u8 *mac,
-+				       struct station_parameters *params)
-+{
-+	struct net_device *dev = wdev->netdev;
-+#else
- static int esp_cfg80211_change_station(struct wiphy *wiphy,
- 				       struct net_device *dev, const u8 *mac,
- 				       struct station_parameters *params)
- {
-+#endif
- 	struct esp_wifi_device *priv = NULL;
- 
- 	if (!wiphy || !dev) {
--- 
-2.47.3
-
diff --git a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch
new file mode 100644
index 0000000000..3614f65b16
--- /dev/null
+++ b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch
@@ -0,0 +1,86 @@
+From f91cb6274e5b13342091a934fadeeb39ea9613d0 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 29 Oct 2026 12:46:52 +0100
+Subject: [PATCH] fix(esp_hosted_ng): Fix build for kernel 7.3
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=914781c72813989b512609a51f8abb68417f722d
+argument u64 *cookie changed into u64 cookie for mgmt_tx callback.
+So let's deal with it when Linux version >= 7.3.0.
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4ab9b637b94a
+probe_client callback has been renamed to probe_peer.
+So let's disable probe_client when Linux version >= 7.3.0.
+
+Upstream: https://github.com/espressif/esp-hosted-linux/pull/6
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ host/esp_cfg80211.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/host/esp_cfg80211.c b/host/esp_cfg80211.c
+index 2edd523..ff61de5 100644
+--- a/host/esp_cfg80211.c
++++ b/host/esp_cfg80211.c
+@@ -1190,7 +1190,12 @@ static int esp_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
+ #else
+ 				struct cfg80211_mgmt_tx_params *params,
+ #endif
+-		u64 *cookie)
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0)
++				u64 cookie
++#else
++				u64 *cookie
++#endif
++)
+ {
+ 	struct esp_wifi_device *priv = NULL;
+ 
+@@ -1207,8 +1212,11 @@ static int esp_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
+ 		esp_err("empty priv\n");
+ 		return -EINVAL;
+ 	}
+-
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0)
++	return cmd_mgmt_request(priv, params, &cookie);
++#else
+ 	return cmd_mgmt_request(priv, params, cookie);
++#endif
+ }
+ 
+ static int esp_cfg80211_set_ap_chanwidth(struct wiphy *wiphy,
+@@ -2444,12 +2452,18 @@ static void esp_cfg80211_mgmt_frame_registrations(struct wiphy *wiphy,
+ }
+ #endif
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0))
++static int esp_cfg80211_probe_peer(struct wiphy *wiphy, struct net_device *dev,
++                                  const u8 *peer, u64 cookie)
++#else
+ static int esp_cfg80211_probe_client(struct wiphy *wiphy, struct net_device *dev,
+                                   const u8 *peer, u64 *cookie)
++#endif
+ {
+ 	return -EOPNOTSUPP;
+ }
+ 
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
+ static int esp_cfg80211_del_station(struct wiphy *wiphy, struct wireless_dev *wdev,
+ 					struct station_del_parameters *params)
+@@ -2675,7 +2689,11 @@ static struct cfg80211_ops esp_cfg80211_ops = {
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 8, 0))
+ 	.update_mgmt_frame_registrations = esp_cfg80211_mgmt_frame_registrations,
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0))
++	.probe_peer = esp_cfg80211_probe_peer,
++#else
+ 	.probe_client = esp_cfg80211_probe_client,
++#endif
+ 	.del_station = esp_cfg80211_del_station,
+ 	.add_station = esp_cfg80211_add_station,
+ 	.change_station = esp_cfg80211_change_station,
+-- 
+2.47.3
+
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index b478d412f4..58fa4acec4 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b8baa6d1c8576f5453e382333bc4aafef1293b4705f073dff5b08d900d10d68c  ng-v1.0.6.tar.gz
-sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
+sha256  02abcfea2bf8e040d7fb6af19de155d19cf0a7f698dc069639ec0ab5f2dedf4b  ng-v54d53676e36850e53d82ee779b6d65dff8e65967.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 5cf6571481..8a9140d07a 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 1.0.6
-ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-$(ESP_HOSTED_VERSION))
+ESP_HOSTED_VERSION = 54d53676e36850e53d82ee779b6d65dff8e65967
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted-linux,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-ESP_HOSTED_LICENSE_FILES = esp_hosted_ng/host/LICENSE
-ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
+ESP_HOSTED_LICENSE_FILES = host/LICENSE
+ESP_HOSTED_MODULE_SUBDIRS = host
 
 define ESP_HOSTED_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
