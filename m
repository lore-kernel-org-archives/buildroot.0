Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2F2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28EEE404CF;
	Mon,  4 Apr 2022 17:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nhzi1KQiXnnR; Mon,  4 Apr 2022 17:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D281B4017C;
	Mon,  4 Apr 2022 17:39:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7EE1BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97B7E4028C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F72clupv4rNA for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:38:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C84A64025C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:38:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id k2so4787100edj.9
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zlKQ7Fc9KaQr/us5U7LkRWBEIfGkpFIG1nZ5lFHXcyY=;
 b=cFZRACQHVLfTdJ4gUGtO8HF8/J0/09nVcOVzrgrHdKUR3YDwegnluJ2x5Q1tWP8zHe
 QE/W0oGwzoOH3fDmrASGO0EykzmO+lv2Qs8PYH3QNjHBrBeHogpo28D1TN4dUwpRUnKN
 44V7vP+AcrL8/1yCcbU2F2HHCJNSfuuRsCNCBRFHXWLuRttuqqHdXhVLyasrUxkXR1jg
 QMif50nqzY54CigZzNROKLT3++cQtkGBxGp5dfjRFHMZUCbBFUMU2L2ZoD+pCZY2gRJA
 xAsQu41PJb++pUfsDBBk4VeRFPGmkF6M9pidfHZn4Jhh+HEVMJihWHWVphf/twDexU0q
 W0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zlKQ7Fc9KaQr/us5U7LkRWBEIfGkpFIG1nZ5lFHXcyY=;
 b=Wl3z+47KPjDmdGlayvifaml7JYnnVeO4EXBfrNfAwnIwuS8RwwSUHz1OAVYfjHUCK7
 hIPugFi4zmr4BRvWaO4lp8GpgRhkEozhN0ODoxtl5voWI76eB/4kWPJB1tf9Xbv6VoH4
 6XMnGu+/8GwGuMCZE/VYkxDDi2K9oaOq1thR/pde3MGcApcenPIkSTY/SXVQrwnB+5X9
 ZlAzN0Eav5488KG48rV76jtCdxaibpyPjBnaIjH9dO0UJk5kQ2IUdp86Tsm4aMdCOrO/
 kVZbXlZ2qLS3j+tuuRi4ZsCN5oxFXyQEGgeOAJLoE23Zz0cm+yDbQBZ81HOITI+F93Ic
 EIdw==
X-Gm-Message-State: AOAM533rt9GJ0CNGEjBr+eC8BDZbXBtI7ijjesyvu+g4u/jP9dc0UPVf
 hagXxJU/mH12CJDQPo0lWoldxVu8GFyhIw==
X-Google-Smtp-Source: ABdhPJyn0dh8NV86kP5mslfNl9GExdI2JZtJbzte+4C7yA29+FaXolpdnr9cZ7KtakNL7iEveOEhFg==
X-Received: by 2002:a05:6402:2318:b0:413:7645:fa51 with SMTP id
 l24-20020a056402231800b004137645fa51mr1312220eda.201.1649093935977; 
 Mon, 04 Apr 2022 10:38:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm5711819edt.80.2022.04.04.10.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:38:55 -0700 (PDT)
Message-ID: <eb0cfc91-7c2b-875f-9e2d-a8e8a0a8291f@mind.be>
Date: Mon, 4 Apr 2022 19:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20220331132230.227424-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220331132230.227424-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: explicitly disable
 features to avoid collision with host packages
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2022 15:22, Andreas Ziegler wrote:
> Background
> During configuration, the meson build system tries to determine the
> availability of optional dependencies using (host) pkgconfig and cmake in that
> order. If a library does not exist on the target, pkg-config will fail, but
> cmake sometimes finds and reports libraries that exist as host packages. This
> has been observed for host-expat (cmake dependency) and host-zlib. The link
> step subsequently fails, because necessary files are not present in the target
> architecture.
> 
> Unconditionally disable optional features often found in host binaries and
> modify the menu selection processing in mpd.mk to re-enable them where
> necessary. Currently this concerns expat and zlib only.
> 
> This fixes the following build errors:
> 
> [expat]
> /home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: warning: libc.so.6, needed by /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7, not found (try using -rpath or -rpath-link)
> /home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7: undefined reference to `__errno_location@GLIBC_2.2.5'
> 
> [zlib]
> http://autobuild.buildroot.net/results/f0a/f0a9e719114f19dc9d20622ed85dd4f8e968c20f/
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>   package/mpd/mpd.mk | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 12da36098f..4e67c9428c 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -14,6 +14,7 @@ MPD_LICENSE_FILES = COPYING
>   # these refer to the FreeBSD PPP daemon
>   MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
>   MPD_SELINUX_MODULES = mpd
> +# These features are either unwanted or not selectable via the Buildroot menu
>   MPD_CONF_OPTS = \
>   	-Daudiofile=disabled \
>   	-Ddocumentation=disabled \
> @@ -21,6 +22,12 @@ MPD_CONF_OPTS = \
>   	-Dpipewire=disabled \
>   	-Dsnapcast=false
>   
> +# Explicitly disable features where meson's dependency detection picks up host
> +# libraries. These settings can be overridden through menu options later
> +MPD_CONF_OPTS += \
> +	-Dexpat=disabled \
> +	-Dzlib=disabled

  It would be better to make these automatic conditional dependencies, like it's 
done for ICU.

> +
>   # Zeroconf support depends on libdns_sd from avahi.
>   ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
>   MPD_DEPENDENCIES += avahi
> @@ -300,11 +307,11 @@ ifeq ($(BR2_PACKAGE_MPD_UPNP_PUPNP),y)
>   MPD_DEPENDENCIES += \
>   	expat \

  That would also allow to remove this (it will be done implicitly since expat 
is selected in Config.in and the automatic dependency will add it).

>   	libupnp
> -MPD_CONF_OPTS += -Dupnp=pupnp
> +MPD_CONF_OPTS += -Dupnp=pupnp -Dexpat=enabled
>   else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
>   MPD_DEPENDENCIES += \
>   	libnpupnp
> -MPD_CONF_OPTS += -Dupnp=npupnp
> +MPD_CONF_OPTS += -Dupnp=npupnp -Dexpat=enabled

  This is wrong: no dependency on expat is added so expat may not even be 
selected or built at this point.

  Marked as Changes Requested.

  Regards,
  Arnout

>   else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
>   MPD_CONF_OPTS += -Dupnp=disabled
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
