Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3744BC678D4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 14:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C976360F99;
	Mon,  6 Mar 2023 14:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C976360F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikdixogOmrWi; Mon,  6 Mar 2023 14:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B3A60FB2;
	Mon,  6 Mar 2023 14:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B3A60FB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5891BF3B9
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 14:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 742E84046D
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 14:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742E84046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zw96SMZFCSy8 for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 14:07:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 058A2400C4
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 058A2400C4
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 14:07:16 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pZBUf-00041S-CE;
 Mon, 06 Mar 2023 14:07:13 +0000
Date: Mon, 6 Mar 2023 14:07:11 +0000
From: John Keeping <john@metanate.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZAXzj+otrp04YukT@donbot>
References: <20230221130040.868693-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221130040.868693-1-fontaine.fabrice@gmail.com>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=JO/irRq3PQq/SFj+Dl5BxArwnzw/KTdndAiLt0sK2kg=; b=LWCf1
 t3yq0hmP5AIXeT2cQkx/++cg0Ni/CLcs39D5+M9JpHAQvskEi8gAY3K5d0NFXSn599AgMaF4sM0rC
 0g2IQzIq5PUJUJUubQzl+BAvg3DQ+0wzfuFc5szfDaICheV8TVamWwRBv4cYQ2EBHOOPOU+df/EQS
 OCsZ6shhZTiH8g1TF0nCprx8YkNR1UmQ7Rms3JE32RjlxtoSJe/kCCj/kY6U2p4GSLQsMq3cu8Ly2
 dvxq99piRRK4JsSOB32U2k/BqEsuXImnQa7SD/RAuiCPT8vM84MIEiXtfGMQZWjKihk5x2qOtOyQF
 Wab1jjLp/RVAyQ+o16OaH5ucuKysg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=LWCf1t3y
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: fix build with
 -Dmodem_manager=false
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

On Tue, Feb 21, 2023 at 02:00:40PM +0100, Fabrice Fontaine wrote:
> Fix the following build failure with -Dmodem_manager=false raised since
> commit c36f6938858d3246ca493dacc925717586e2ea0f:
> 
> ../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: John Keeping <john@metanate.com>

I hit the network-manager failure in 2023.02-rc2, this patch fixes it.

> ---
>  ...build-failure-with-Dmodem_manager-fa.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> 
> diff --git a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> new file mode 100644
> index 0000000000..648be027e0
> --- /dev/null
> +++ b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> @@ -0,0 +1,38 @@
> +From 736a2c356c1c4871e8c4e70be622c65c87d3bca8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 21 Feb 2023 13:03:00 +0100
> +Subject: [PATCH] meson.build: fix build failure with -Dmodem_manager=false
> +
> +Fix the following build failure with -Dmodem_manager=false raised since
> +https://gitlab.freedesktop.org/ffontaine/NetworkManager/-/commit/03ba04d4784fa4fc7ec31455070fb5ecf25ade23:
> +
> +../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1544]
> +---
> + meson.build | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 84ce52c736..b79240efc0 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1057,7 +1057,9 @@ output += '  jansson: ' + jansson_msg + '\n'
> + output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
> + output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
> + output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
> +-output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
> ++if enable_modem_manager
> ++  output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
> ++endif
> + output += '  ofono: ' + enable_ofono.to_string() + '\n'
> + output += '  concheck: ' + enable_concheck.to_string() + '\n'
> + output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
> +-- 
> +2.39.0
> +
> -- 
> 2.39.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
