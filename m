Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDF1C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD9E60C00;
	Sun, 26 Nov 2023 21:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD9E60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbX9a7yHItiB; Sun, 26 Nov 2023 21:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F5C60BE7;
	Sun, 26 Nov 2023 21:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F5C60BE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 066F41BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D33CB40492
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33CB40492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kq3R42h67fCl for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:39:29 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8765240345
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8765240345
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CE9B978032A;
 Sun, 26 Nov 2023 22:39:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:39:25 +0100
Date: Sun, 26 Nov 2023 22:39:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231126213925.GJ3177259@scaer>
References: <20231126201227.15014-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126201227.15014-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701034767;
 bh=HVF48HWC6Vb1z/vWmiRlKilMWBe8zADL9p33Qugfs9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OmRKtrh9VOHuYfIuezhdzyn2TIfty8qRVHkvDozYCObNGiitcBxxaCa3AT+a7unxk
 ErY3oTkb3zW7ucuITOpIMj0COSaR+v0hZ3g/6OkXyQs+/+2nSfhEMNMjiHqOaz7rzd
 Vct6DXuorOk51GMGfqdWYen/4OvHqvbcwu7OgMVDrBpqwjPCjXWf9N5lyWP8B7cJso
 XhpzvDtLITu0q0hQrqLPT+i5PdB6u2tduz+ijiLYAOh+55I8ZMIqBgHAYudbeYwEkC
 LLzuqSatG8CL/yZOdY9x39ves3xF9HYjLizss2bGBTk+dhlMpjNk9YUKwplkpuwZSv
 0W1Iarw+rWULw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OmRKtrh9
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 2023-11-23
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-11-26 21:12 +0100, Giulio Benetti spake thusly:
> Drop local patch applied upstream:
> https://github.com/espressif/esp-hosted/commit/12b0ca9c46094c86eb76b5f0eaa626f868efaec8
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...st-fix-build-failure-when-CONFIG_PM-.patch | 33 -------------------
>  package/esp-hosted/esp-hosted.hash            |  2 +-
>  package/esp-hosted/esp-hosted.mk              |  2 +-
>  3 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
> 
> diff --git a/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch b/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
> deleted file mode 100644
> index abbc64a434..0000000000
> --- a/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 56920e3ce04aa2eadb529a6787200789bf1c3925 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Wed, 9 Aug 2023 23:16:52 +0200
> -Subject: [PATCH] esp_hosted_ng: host: fix build failure when CONFIG_PM is not
> - defined
> -
> -wiphy->wowlan is not defined when CONFIG_PM is not enabled so let's
> -guard the assignment to wiphy->wowlan according to option CONFIG_PM.
> -
> -Upstream: https://github.com/espressif/esp-hosted/pull/254
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - esp_hosted_ng/host/esp_cfg80211.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
> -index 70fdbb9773..d3c4108c29 100644
> ---- a/esp_hosted_ng/host/esp_cfg80211.c
> -+++ b/esp_hosted_ng/host/esp_cfg80211.c
> -@@ -638,7 +638,9 @@ int esp_cfg80211_register(struct esp_adapter *adapter)
> - 	wiphy->max_scan_ie_len = 1000;
> - 	wiphy->max_sched_scan_ssids = 10;
> - 	wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;
> -+#ifdef CONFIG_PM
> - 	wiphy->wowlan = &esp_wowlan_support;
> -+#endif
> - 
> - 	/* Advertise SAE support */
> - 	wiphy->features |= NL80211_FEATURE_SAE;
> --- 
> -2.34.1
> -
> diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
> index c17fe262a1..b129bb42f9 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3310845b2324bda5774b91bcdd3f47621126f4a0011a0f61e31b0ad4a44db2f5  esp-hosted-11e90f185a5a9922343e73e44032816a0e3ddedb.tar.gz
> +sha256  6e023c26355643f2aaf6d79d5910f64c49ea638063235d519075629643518a71  esp-hosted-ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404.tar.gz
>  sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
> index 7491c46512..578108c91d 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ESP_HOSTED_VERSION = 11e90f185a5a9922343e73e44032816a0e3ddedb
> +ESP_HOSTED_VERSION = ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404
>  ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
>  ESP_HOSTED_DEPENDENCIES = linux
>  ESP_HOSTED_LICENSE = GPL-2.0
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
