Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC0607A899
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ObR8/gyR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=VJukwHXR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98DB2406A5;
	Mon,  2 Nov 2026 14:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46JPi4iztDCs; Mon,  2 Nov 2026 14:38:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77E11405D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793630284;
	b=ASd0TpYG2gf4UxN1aSIfPA5tg40FsB6pA3Zs6BWxcnlFS3GYZg2nxm+c2oGGISiDtjXB
	 kX36eTovvGsm0PQB4VMazx9yJaFnFD6sPAvdYzG0h+ZeDj3/9u9/IWRfkbYv1q9j4Isqm
	 U27ojEB0jbTAK+uo/exH7qyf4zHobeF0dU5zZrU3lml72Nwx1a68N1RGvSKYIgD7Ti/4k
	 UZe5QG5sLApJ0Kz8ncTsfCsSc2kluyY+W3GKcjCHnQeawzOmC+tuGV/AWwnTwWXFVxUvV
	 A6F3qppR2XfuHZBXASSkw5XcK6CvhM+Xy4rCXd7XNNLWY9jQ4BgIOdWkZ952LCfNGuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793630284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=AFK5hNX90IiO9DG4Bqek4vOk4zppeJWCozCvmNRGrmc=;
	b=S2ZEf6vlhI6WvmiibBthoZgH+F3hHJYf3/zxVkFKIm3+GhRRVE9fcnBcwRzubxqh5k+N
	 MoMIsjw2M+EYNIo/1knYVLp0wJX+Cim3kptDUClpFa54P9fCfTAvriTy38/O5tgGN2T5x
	 r7x4QedZ9ZzE5/bJB0scKoua4NcrL9SvR38d7IOwQLgcH+Sd8YydhNpGPhuhmljSq7TZJ
	 uWh1B0/pl432ptt4uY1Q8we1PwxkQigvgik+C7aH2KhpQXRGMXydyhK3NFYPWXYKGPvkr
	 wFUTDGfVASdsjZUWQS5QiBhXgVy02w1j4Zi4NFWZefyFOsy5Bif9bEAWkDiKkLP8p0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793630284;
	bh=AFK5hNX90IiO9DG4Bqek4vOk4zppeJWCozCvmNRGrmc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ObR8/gyRT4f/joiFgBo3eXsQBP5gHoOYYCAc343bHYMwNLYOoEhxKJHgmSUMZo6CH
	 Sigxp3RBQYrQurAg6frol0aO8ITdBF1XShHcJSxTDOwxgbrDK45tdKqjI7KXjFvSEp
	 uq/GklNOxjqiTKvhCijKBZolzom5UmUkb9e21o119oIDwTeVhT25V7RV2VMDhfhaYv
	 l6+ODMGc8la+/CymkNVD4fl0/E78A5RXHdoxTlMgCcxO1rgX9a3VeM3VuJtbWH6Cyt
	 LYEIfMVG8THzROqEbSR1oBxAvI+gJQnQy/uAwfehUownpG6GfoFfM52KJyk/J3qsAt
	 5TNpyNok4NH0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E11405D7;
	Mon,  2 Nov 2026 14:38:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BEC54BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4939B400D7
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p61d9-YJMQKQ for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:38:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4297A400D6
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=62.149.156.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793630280;
 b=mcURkIgIBGsk4bi9mFPSSRdtGl99o77uTONpeelzR5KxnMktS9dalurItPXGbHFFde03
 3l33aP9y56jVhL5nZPz5hHm6V18cr9L9utrz3+r7iSlBXOHAmfZaB9QKfmf96GdF1sKOt
 tY04+YF6soTE8oFw1fCxSG79pzjTqkAJrtGaSozYLdLCvMkp8vakv2W2QoRU1aA9hXSJT
 I3rmSHu6SqGarAqafNQ1ZF6BKNZM5EZG55UhAKNygNdweue947iPEi9/zMrmd0KnFD2+Y
 GeHFpEwBTgM6Dz0c8nY9v7qxP39Q7s60n96LmWUNn+jvYdnGgxVA8Widhs7dndo1x1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793630280;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=p1oDjpQWiKogJeVohBREMTxanRXcRqEF8nLSTjiX1rM=;
 b=Wny1gBgFXmqSeKSgj4ejvCMEuEIfiLKhQxCK5GlogshS0ULoYyICywtEOz8LRxrhsH1y
 modbNpanTnv/yUxbC+5dD4k9if7XgZkOxfiHeso9SqHskLvgX7konxxSCPkADA20YqSJg
 mnRs1g6p+qDH8W38cYZ+6GVHQh24ZJ8RK8PlWv1GaBvY8uesARpwMqJwq+eO6D1WFbvNz
 ZLX0xw37MmVo7JuBkNbBm1QCy53nUDW8FLhjqoEFWM2fcpOOfpwyM3UBMRdXhEw+Odo1x
 t6vU5F46xXZvZvtHbFFSchdN5hzQFZIKVN6aSiAs2TwnwIys6u4Bii+QgOuw0mRcCQw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=VJukwHXR; 
 arc=none smtp.remote-ip=62.149.156.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VJukwHXR
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4297A400D6
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:37:57 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id NtAZxYzWhuuRMNtAZx5q5f; Mon, 02 Nov 2026 15:37:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793630275; bh=1f1LarMJ36szO9xlrpdieiT3fYOmC6+JTkF4wTcWAuI=;
 h=From:To:Subject:Date:MIME-Version;
 b=VJukwHXRI2CIAE//zgjqEKeBOY/OAa/A/VtdLfLTlwWi8TJvpFQgOPc/ckRwryzVm
 UjBdEEm76dYF7zTIzKNqbQQZ6/Hr8bWx+QyfWGZQaS46r0LXtoINcWNE4ssEX+STam
 vGGcIRfm/4JgDMSeNKUxy6fuFcKowMuh05a1VgQT1Yh4ZnE8iT5VFNSpj//rcRrLSE
 bdAIQ599Z3iyajBwYk+z9RqUv0K3bI9ZA0ssRErwHvrZyUTaQ68DODqniqLWtQYK0n
 qv9+K8RxaLbxX8ddIclferTEDMm3C5agkIuErlwK0PXvgXMYsnZMXznXWoMXrKdrAR
 XDbFtCsd34qpQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  2 Nov 2026 15:37:54 +0100
Message-ID: <20261102143754.18923-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJA2IloZjPwbthgqKzk1lGved/RDkjeVM3logLuEDEZSL+FKxx+E2KfS5503aCa6s66gHiXsxewh1EZrY3OJQ0oEjttI3N2g7RxLDozk9EFIG2COCfzd
 Wba1jwcDxp7I5SlQmuya/C/VbtwVpa342olBDWdA/VeSvkVoRyWD9xuSOF+mFc4zJPPVcIS1kiI7H8ZafBRoVjAbkzJlbpTWivliZKskwrOgtrc/NZDUIMkm
 mIuUVMICQ9NqcltdhO6oUMUYO+amSL3WwyqpFnCexpU=
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Espressif moved esp-hosted NG driver to a separate repository so let's
point ESP_HOSTED_SITE accordingly(esp-hosted-linux) taking into account
the slight difference of folder structure.
Let's also bump to latest version 2026-11-01 and drop local patch that has
been applied to master branch.
So let's add local patch pending upstream to fix build failure with Linux
7.3.0.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...p_hosted_ng-Fix-build-for-kernel-7.1.patch | 147 ------------------
 ...p_hosted_ng-Fix-build-for-kernel-7.3.patch |  86 ++++++++++
 package/esp-hosted/esp-hosted.hash            |   2 +-
 package/esp-hosted/esp-hosted.mk              |   8 +-
 4 files changed, 91 insertions(+), 152 deletions(-)
 delete mode 100644 package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
 create mode 100644 package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch

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
index b478d412f4..8b8347ebf4 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b8baa6d1c8576f5453e382333bc4aafef1293b4705f073dff5b08d900d10d68c  ng-v1.0.6.tar.gz
+sha256  02abcfea2bf8e040d7fb6af19de155d19cf0a7f698dc069639ec0ab5f2dedf4b  ng-v54d53676e36850e53d82ee779b6d65dff8e65967.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
