Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF0607BDCA
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=To9v65Gr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=BG6o2W08
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE6D405F8;
	Mon,  2 Nov 2026 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZxRCx_FKC9D; Mon,  2 Nov 2026 14:39:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 55DBE405AD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793630363;
	b=IROXXshrFBi0zzDaT7TKiwEzKzO4TyYeqPC1/nHM5KY7YbL4AcZ2xvImO/g94226lCJQ
	 GyrRhqFnFnUitrN6VYMKNnMHuE12ZuGa8PPDXuIBV+IQAImGiEbKA+Qqn1KbwPemuTh2M
	 0A0wk0XG544Jf9atUm616brdzKSZ88PGd+qCXXGv228DKWDrh7IAvu/LZTjwmVrV4iEQo
	 nFBAYzQ1vCGDB7H3yXDt1ebg9GPX/PyFej40JoDLKaXXqDDRPHR8J5Ey78fWxLiAhaQE3
	 5yI3o4R1kfOPVGZN+lysOSt5SR/cmwg5ivvCstSQ4kh+fgUDMrCuvBHP7GSYC+LXkvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793630363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:From:In-Reply-To:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=IbP/cW+UujXLkCsoE6nGu/iG5wiKz0UfAXj61AGHLkY=;
	b=MTiRKtIhvIRrYQhGdNMTqVjY6iEIpLY+L6DMYDEEnN+KTxjzctpNmXu7dKPSUZsgVkYT
	 U0curKjZUhsvuOYoXtzo5EBNHl8pAIjVsefgNaNz9JYBFj9c08q7lDpBwZ17pL47aTXKE
	 bHnKeP5CCIsT1P8Q5S8eO0P5GM+kmr5r1QXzTqNTehV3Q0N+WqRz+LjPMRmVyI2LLa385
	 R2n3pu2yC3FMNcDueUVNH1EK+0npjwA8SI3C+3UragJePFWL0Vecz2/g1cShMtOnB24Ls
	 oJMZ9G9oRAeVkBTQCHR2Imvu8mJE8zWAysVrE95B+wKKeUVBXZuUmuC8OvXiqEEAtWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793630363;
	bh=IbP/cW+UujXLkCsoE6nGu/iG5wiKz0UfAXj61AGHLkY=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=To9v65Grh2m+xwRcBcY5EY5YpgIsbQuxMWFK3zIdEo0I99IQErI/KcK9POZaCy6Aj
	 9d0mCuvx+asFiawIb6lVUL00pFZWr3DrhRhvTdX7yhBSSc90jyKBVEZoWWnMLON+ww
	 ulhfk8Vmpk0zJ48SadNVhGMDMTPRU8QTaiVJaAjsspOkJX0NVGWw7U2so9WCse+lsI
	 Gkd+rvHAClfHexhA02XXqefICJ9kEtTSutEcBw+u2h1cg1wDK//Y06XeFT1mATAoUQ
	 HyhyTda4r076qUpnpKGD/OH2WhHYJHvV8gBNQG43Iq7NYM99dH2a8fLiHwdmapf+Kx
	 uBJhCMymvorwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55DBE405AD;
	Mon,  2 Nov 2026 14:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 405DAD3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2630E606D4
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29Dhvp6pfetU for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:39:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 47B7860658
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.149.156.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793630360;
 b=IMoyl4UfW/97LFM+jDs8lm1Z1b+FjZf+pDEaBaRgdKai/3ARz1Cd3obT2l/dkibF380/
 ZHqkuGCW6ua2TQql4jEEtCR8CUqsyG1Wr+mRP7Nyxu8x37nM9g3sIA5k0xSaX4NrmosfU
 k96Dc60G93TKI7PsuLmdqVvwP1FSjFS5SkrECZ+sJHhqyvH7Ld9ey3kFYUZ4TO97+Ss3a
 1fpI9lf4isdpzEx1SY+lZdS4vZMsnHSipkFfEmXi9qV47kIy+dDTD2Z42k+eg9g5U1CGC
 AK1xOUa0aixmqcQnJiv0Bv5uJzzH8KqVf46KdOQmNT+qPvbNmDeDRJVTZjiZBNG86iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793630360;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=yKjpeFyvTjOKQy4bbxzZs7lPCHU3U5EeEa8bdGwqRJI=;
 b=K1QVfIxIIJL6UTPrii4fFySOcKLUosusPeseBAYgG31yh09qygRJ2OdGnT9/6cU0mCOZ
 FUh5JPGm0myTnYtgF5etU7BfdSW0zvVu2zKqgBmXiGx74Z0539JWJzObhBb4CzU2MFqB1
 Ic2HYMeP7IcOLg8AmLN39v0Ad3LShP8dpZJ50BXcmvX5vIFM4tJqaFaoh1aTwAKHVi0eY
 6Qtw64ef9ur2xeeH+1im2yPip7UK3PRUUL5czgCcSb9hYcZUDe16zll5H29+oVVc0IvJJ
 NvrsOCJSkWy5RwSt+CGcGnRpDOAVzGNv1MS5hR4Jhbk4264KBlw4P7fn1m8qHG7UzHA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=BG6o2W08; 
 arc=none smtp.remote-ip=62.149.156.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BG6o2W08
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47B7860658
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:39:18 +0000 (UTC)
Received: from [192.168.1.115] ([151.95.84.63]) by Aruba SMTP with ESMTPSA
 id NtBsxZ0NKuuRMNtBsx5qiJ; Mon, 02 Nov 2026 15:39:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793630356; bh=+hZIVoxh/bXIWC7WS2JuMeRNdq/ByVKawXYU8cSNUuE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BG6o2W08KrwSLy4EFIMKgY81zz9hBqiyET2Cx1Bn7KdMWM5yYK9GZbJeRLCf4HjFG
 uEh7mO4HjOUQyxWrfdXuEM1G0iqf65/g5UfFcgicuZ1EYIHmutycOR71rqvwAeg9Pu
 bC/8dL4s32/DCC7jUGiQHMS/4Xt5c8jy10V5V5NjxsZC+eq3J1VO3Y2fG+7Kvk/e2G
 BDJBVCPie84cdrj8CaQyc0i9Q3fcM56rODXWHXhTgc4hABgoeBrq0JxQiq+mZl0Xps
 SSL5su0xDpsdCXZGmF5sn8AndxRambZIU/rgUqzvLIFjZRR9opgEf69bo1MWP/LpWs
 A7ma5pESLIOQA==
Message-ID: <83e08f43-c4b1-4a7c-90bd-b2a86c7b38ed@benettiengineering.com>
Date: Mon, 2 Nov 2026 15:39:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20261102143754.18923-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261102143754.18923-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfGIo5c+8V9CzCf7LvJRi7fY4V5gSJodOTJJKlLTxG8rwDjMDbv7/3z3F0pffouHs5+D3XPzlNx6nsFRaO5ifGi3HWW4z5ujuNrQYBMS2ntbMz6L07mQK
 APW8ec6Wka1syHJJndNwrlo/OYqimlBl9RJDbQXJy+iesHfxHHUy2dpOducEwlAifMFXC1pjtuFJfdvUjGZ5nXIIZPA8U+VybWtpBNw//yiIAxTwuC0S6qrr
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes:
https://autobuild.buildroot.net/results/73d/73dfe379673a3ac506ab96ee7bacc9172a3aa66a/

On 11/2/26 15:37, Giulio Benetti wrote:
> Espressif moved esp-hosted NG driver to a separate repository so let's
> point ESP_HOSTED_SITE accordingly(esp-hosted-linux) taking into account
> the slight difference of folder structure.
> Let's also bump to latest version 2026-11-01 and drop local patch that has
> been applied to master branch.
> So let's add local patch pending upstream to fix build failure with Linux
> 7.3.0.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...p_hosted_ng-Fix-build-for-kernel-7.1.patch | 147 ------------------
>   ...p_hosted_ng-Fix-build-for-kernel-7.3.patch |  86 ++++++++++
>   package/esp-hosted/esp-hosted.hash            |   2 +-
>   package/esp-hosted/esp-hosted.mk              |   8 +-
>   4 files changed, 91 insertions(+), 152 deletions(-)
>   delete mode 100644 package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
>   create mode 100644 package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch
> 
> diff --git a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
> deleted file mode 100644
> index 90076b4956..0000000000
> --- a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
> +++ /dev/null
> @@ -1,147 +0,0 @@
> -From fa27d70495e3b4f92c9de43b33aa09813a318495 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Mon, 18 May 2026 16:44:57 +0200
> -Subject: [PATCH] fix(esp_hosted_ng): Fix build for kernel 7.1
> -
> -With commit:
> -https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=033fe322f5852d5144a85978e880e01b1787fd0d
> -many functions esp_cfg80211_*() have argument struct netdevice * subsituted
> -with struct wireless_dev *. So let's add separate function headers and
> -retrieve struct netdev * from struct wireless_dev * if Linux version >= 7.1.
> -
> -Upstream: https://github.com/espressif/esp-hosted/pull/736
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - esp_hosted_ng/host/esp_cfg80211.c | 50 +++++++++++++++++++++++++++++++
> - 1 file changed, 50 insertions(+)
> -
> -diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
> -index c68f7983e6..1009df1fd5 100644
> ---- a/esp_hosted_ng/host/esp_cfg80211.c
> -+++ b/esp_hosted_ng/host/esp_cfg80211.c
> -@@ -533,22 +533,38 @@ static int esp_cfg80211_set_default_key(struct wiphy *wiphy,
> - }
> -
> - static int esp_cfg80211_set_default_mgmt_key(struct wiphy *wiphy,
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+					     struct wireless_dev *wdev, INT_LINK_ID u8 key_index)
> -+#else
> - 					     struct net_device *ndev, INT_LINK_ID u8 key_index)
> -+#endif
> - {
> - 	return 0;
> - }
> -
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+static int esp_cfg80211_del_key(struct wiphy *wiphy, struct wireless_dev *wdev,
> -+#else
> - static int esp_cfg80211_del_key(struct wiphy *wiphy, struct net_device *dev,
> -+#endif
> - 				INT_LINK_ID u8 key_index, bool pairwise,
> - 				const u8 *mac_addr)
> - {
> - 	return 0;
> - }
> -
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+static int esp_cfg80211_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
> -+				INT_LINK_ID u8 key_index, bool pairwise,
> -+				const u8 *mac_addr, struct key_params *params)
> -+{
> -+	struct net_device *dev = wdev->netdev;
> -+#else
> - static int esp_cfg80211_add_key(struct wiphy *wiphy, struct net_device *dev,
> - 				INT_LINK_ID u8 key_index, bool pairwise,
> - 				const u8 *mac_addr, struct key_params *params)
> - {
> -+#endif
> - 	struct esp_wifi_device *priv = NULL;
> -
> - 	if (!wiphy || !dev || !params) {
> -@@ -564,7 +580,11 @@ static int esp_cfg80211_add_key(struct wiphy *wiphy, struct net_device *dev,
> - 	esp_dbg("\n");
> -
> - 	if (params->key_len == 0) {
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+		return esp_cfg80211_del_key(wiphy, wdev, ZERO_LINK_ID key_index, pairwise, mac_addr);
> -+#else
> - 		return esp_cfg80211_del_key(wiphy, dev, ZERO_LINK_ID key_index, pairwise, mac_addr);
> -+#endif
> - 	}
> - 	return cmd_add_key(priv, key_index, pairwise, mac_addr, params);
> - }
> -@@ -783,9 +803,16 @@ static int esp_cfg80211_set_tx_power(struct wiphy *wiphy,
> - 	return cmd_set_tx_power(priv, priv->tx_pwr);
> - }
> -
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+static int esp_cfg80211_get_station(struct wiphy *wiphy, struct wireless_dev *wdev,
> -+				    const u8 *mac, struct station_info *sinfo)
> -+{
> -+	struct net_device *ndev = wdev->netdev;
> -+#else
> - static int esp_cfg80211_get_station(struct wiphy *wiphy, struct net_device *ndev,
> - 				    const u8 *mac, struct station_info *sinfo)
> - {
> -+#endif
> - 	struct esp_wifi_device *priv = NULL;
> -
> - 	priv = netdev_priv(ndev);
> -@@ -1034,9 +1061,16 @@ static int esp_cfg80211_probe_client(struct wiphy *wiphy, struct net_device *dev
> - 	return 0;
> - }
> -
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+static int esp_cfg80211_del_station(struct wiphy *wiphy, struct wireless_dev *wdev,
> -+					struct station_del_parameters *params)
> -+{
> -+	struct net_device *dev = wdev->netdev;
> -+#else
> - static int esp_cfg80211_del_station(struct wiphy *wiphy, struct net_device *dev,
> - 					struct station_del_parameters *params)
> - {
> -+#endif
> - 	struct esp_wifi_device *priv = NULL;
> -
> - 	if (!wiphy || !dev) {
> -@@ -1055,10 +1089,18 @@ static int esp_cfg80211_del_station(struct wiphy *wiphy, struct net_device *dev,
> - 	return 0;
> - }
> -
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+static int esp_cfg80211_add_station(struct wiphy *wiphy, struct wireless_dev *wdev,
> -+				    const u8 *mac,
> -+				    struct station_parameters *params)
> -+{
> -+	struct net_device *dev = wdev->netdev;
> -+#else
> - static int esp_cfg80211_add_station(struct wiphy *wiphy, struct net_device *dev,
> - 				    const u8 *mac,
> - 				    struct station_parameters *params)
> - {
> -+#endif
> - 	struct esp_wifi_device *priv = NULL;
> -
> - 	if (!wiphy || !dev) {
> -@@ -1078,10 +1120,18 @@ static int esp_cfg80211_add_station(struct wiphy *wiphy, struct net_device *dev,
> - 	return 0;
> - }
> -
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> -+static int esp_cfg80211_change_station(struct wiphy *wiphy,
> -+				       struct wireless_dev *wdev, const u8 *mac,
> -+				       struct station_parameters *params)
> -+{
> -+	struct net_device *dev = wdev->netdev;
> -+#else
> - static int esp_cfg80211_change_station(struct wiphy *wiphy,
> - 				       struct net_device *dev, const u8 *mac,
> - 				       struct station_parameters *params)
> - {
> -+#endif
> - 	struct esp_wifi_device *priv = NULL;
> -
> - 	if (!wiphy || !dev) {
> ---
> -2.47.3
> -
> diff --git a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch
> new file mode 100644
> index 0000000000..3614f65b16
> --- /dev/null
> +++ b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch
> @@ -0,0 +1,86 @@
> +From f91cb6274e5b13342091a934fadeeb39ea9613d0 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 29 Oct 2026 12:46:52 +0100
> +Subject: [PATCH] fix(esp_hosted_ng): Fix build for kernel 7.3
> +
> +With commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=914781c72813989b512609a51f8abb68417f722d
> +argument u64 *cookie changed into u64 cookie for mgmt_tx callback.
> +So let's deal with it when Linux version >= 7.3.0.
> +
> +With commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4ab9b637b94a
> +probe_client callback has been renamed to probe_peer.
> +So let's disable probe_client when Linux version >= 7.3.0.
> +
> +Upstream: https://github.com/espressif/esp-hosted-linux/pull/6
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + host/esp_cfg80211.c | 22 ++++++++++++++++++++--
> + 1 file changed, 20 insertions(+), 2 deletions(-)
> +
> +diff --git a/host/esp_cfg80211.c b/host/esp_cfg80211.c
> +index 2edd523..ff61de5 100644
> +--- a/host/esp_cfg80211.c
> ++++ b/host/esp_cfg80211.c
> +@@ -1190,7 +1190,12 @@ static int esp_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
> + #else
> + 				struct cfg80211_mgmt_tx_params *params,
> + #endif
> +-		u64 *cookie)
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0)
> ++				u64 cookie
> ++#else
> ++				u64 *cookie
> ++#endif
> ++)
> + {
> + 	struct esp_wifi_device *priv = NULL;
> +
> +@@ -1207,8 +1212,11 @@ static int esp_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
> + 		esp_err("empty priv\n");
> + 		return -EINVAL;
> + 	}
> +-
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0)
> ++	return cmd_mgmt_request(priv, params, &cookie);
> ++#else
> + 	return cmd_mgmt_request(priv, params, cookie);
> ++#endif
> + }
> +
> + static int esp_cfg80211_set_ap_chanwidth(struct wiphy *wiphy,
> +@@ -2444,12 +2452,18 @@ static void esp_cfg80211_mgmt_frame_registrations(struct wiphy *wiphy,
> + }
> + #endif
> +
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0))
> ++static int esp_cfg80211_probe_peer(struct wiphy *wiphy, struct net_device *dev,
> ++                                  const u8 *peer, u64 cookie)
> ++#else
> + static int esp_cfg80211_probe_client(struct wiphy *wiphy, struct net_device *dev,
> +                                   const u8 *peer, u64 *cookie)
> ++#endif
> + {
> + 	return -EOPNOTSUPP;
> + }
> +
> ++
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
> + static int esp_cfg80211_del_station(struct wiphy *wiphy, struct wireless_dev *wdev,
> + 					struct station_del_parameters *params)
> +@@ -2675,7 +2689,11 @@ static struct cfg80211_ops esp_cfg80211_ops = {
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 8, 0))
> + 	.update_mgmt_frame_registrations = esp_cfg80211_mgmt_frame_registrations,
> + #endif
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0))
> ++	.probe_peer = esp_cfg80211_probe_peer,
> ++#else
> + 	.probe_client = esp_cfg80211_probe_client,
> ++#endif
> + 	.del_station = esp_cfg80211_del_station,
> + 	.add_station = esp_cfg80211_add_station,
> + 	.change_station = esp_cfg80211_change_station,
> +--
> +2.47.3
> +
> diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
> index b478d412f4..8b8347ebf4 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  b8baa6d1c8576f5453e382333bc4aafef1293b4705f073dff5b08d900d10d68c  ng-v1.0.6.tar.gz
> +sha256  02abcfea2bf8e040d7fb6af19de155d19cf0a7f698dc069639ec0ab5f2dedf4b  ng-v54d53676e36850e53d82ee779b6d65dff8e65967.tar.gz
>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
> index 5cf6571481..8a9140d07a 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -4,13 +4,13 @@
>   #
>   ################################################################################
>   
> -ESP_HOSTED_VERSION = 1.0.6
> -ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-$(ESP_HOSTED_VERSION))
> +ESP_HOSTED_VERSION = 54d53676e36850e53d82ee779b6d65dff8e65967
> +ESP_HOSTED_SITE = $(call github,espressif,esp-hosted-linux,$(ESP_HOSTED_VERSION))
>   ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
>   ESP_HOSTED_DEPENDENCIES = linux
>   ESP_HOSTED_LICENSE = GPL-2.0
> -ESP_HOSTED_LICENSE_FILES = esp_hosted_ng/host/LICENSE
> -ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
> +ESP_HOSTED_LICENSE_FILES = host/LICENSE
> +ESP_HOSTED_MODULE_SUBDIRS = host
>   
>   define ESP_HOSTED_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
