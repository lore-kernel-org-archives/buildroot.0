Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DB5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7DDF81D11;
	Fri, 13 May 2022 20:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Of7RUQOpYx7u; Fri, 13 May 2022 20:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7B758196A;
	Fri, 13 May 2022 20:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32D301BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2015740160
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCSr4atlzvFI for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:52:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06739400EA
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:52:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bv19so18404755ejb.6
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lPfpGIBNMw4SsA79jqOF2hFJpRbLXFhlurtnrHODqVE=;
 b=HIPqbnOJwS5a1f6d+j0ZwK4XJccNjtQiIATzcDcVCgHyhZ+msnzDyErbNIwM1G6YVc
 Yom4h0khIjAJ4hxftq6sM/jMUhnXiNbtKae2d57UfNMfuqkVGYHg7nAlRJHBXp/oiNeY
 0J/fIv1kQl1aUo7ekr2rekNeckKZ/KSoHd/DvefzWPyMDELs2yTtJnSJXp0jSM1uOpn4
 cQAh8ZqufhWq1UQs5Dg4kw0tklFvQFbDjfPvdELv3j8PPpri7Kp7oBW2fdw9Msi7zLhT
 HXmMYgHSt/aMwo6I4B6W+9YxstQJGTjxnN04PtEc27OwKrCeOTR9eotgSBegJXgpObMu
 SFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lPfpGIBNMw4SsA79jqOF2hFJpRbLXFhlurtnrHODqVE=;
 b=BZ66Rd8ZvwBHLVbp3Ughej0JTYBuH7kP8HVAuAeG193OJK+s3MY9KDEwxlkpvcMlba
 XbKCbrRhIygTz3Hu8QN0MeMmKCxVXFQAqQdhk6THdpzf0nz4uBOh28l7lPUdaKzb6I4R
 TgOhSR9Xipt9/x+th0+qAQh+sz2Twu1Ff+dWLgmQ3ekIue4KLuX22ol1DYYyVapJBBTI
 exAUfExKLhrFyV6+FriGJBoj9urYb5p6B3D0Mr6VCOlJRUGWWEqr6ZS2DeyqjX05QgGe
 g7XWjrBH856Z6e4rrCPw62LqX/nSEy20qXL7IYftLFfQXIzEwyxGXzc+FraFaFdzQr7u
 jedQ==
X-Gm-Message-State: AOAM531GtpC4khWfh7n1hZ13f/chxw8N38WY0WRlo2xE7Vn0ZuKFEO7l
 rC+NHNsnwLBD8PFtQr31f3UjXogcrAJGhQ==
X-Google-Smtp-Source: ABdhPJw+Yx8d0nDYq1eHOf3ub5oaETe/sM2wHX8kz6V1g2mW+viEfpGQc0E4WyHjwdTD8D9Qffo41w==
X-Received: by 2002:a17:907:6d24:b0:6f4:bc43:e7d1 with SMTP id
 sa36-20020a1709076d2400b006f4bc43e7d1mr5634482ejc.581.1652475139077; 
 Fri, 13 May 2022 13:52:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gz13-20020a170907a04d00b006f3ef214deasm1106987ejc.80.2022.05.13.13.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:52:18 -0700 (PDT)
Message-ID: <a3cf303d-93e2-f11d-1d37-6799f1f0f10e@mind.be>
Date: Fri, 13 May 2022 22:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220507202905.397732-1-geomatsi@gmail.com>
 <20220507202905.397732-3-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220507202905.397732-3-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/3] package/xr819-xradio: enable required
 kernel options
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2022 22:29, Sergey Matyukevich wrote:
> Enable Linux kernel configuration options required by xradio driver.
> Those are wireless networking support, sdio support, and power
> management core functions.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/7ad4a4b6b1612460427e667d98efc6df7b4a2153/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>   package/xr819-xradio/xr819-xradio.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
> index d4b9826f64..835e229347 100644
> --- a/package/xr819-xradio/xr819-xradio.mk
> +++ b/package/xr819-xradio/xr819-xradio.mk
> @@ -9,5 +9,13 @@ XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
>   XR819_XRADIO_LICENSE = GPL-2.0
>   XR819_XRADIO_LICENSE_FILES = LICENSE
>   
> +define XR819_XRADIO_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_PM)

  I've applied to master. However, these options have dependencies that need to 
be checked as well. E.g. WIRELESS depends on NET (which is usually enabled, but 
you can't count on it). But it also depends on !S390 - in other words, you 
simply can't build this package for s390x, so that dependency has to be added to 
Config.in.

  Could you check this stuff and update the options?

  Regards,
  Arnout

> +endef
> +
>   $(eval $(kernel-module))
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
