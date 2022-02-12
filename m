Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC043C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E17660AEE;
	Sat, 12 Feb 2022 22:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vdUanjS-cC2; Sat, 12 Feb 2022 22:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB9060AD1;
	Sat, 12 Feb 2022 22:02:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC57D1BF4DD
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A943560AD1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vce3m8O8pEVi for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABB9C60644
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:02:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g7so5519813edb.5
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nsr7bf5wbzUqoJKOik0vhYxNGp0E3uheDBqd5yuscP8=;
 b=GHWqx7fom4JzqKmCqGyY1W3tlWd0na7TzDfcBRfGRFIf+Uucwtoge7V+tJ9uo+xIhn
 t8WJvqXB5EXIimS/Cj+um6aBJwlXp8KVUB2+p/kXv6qSc7UlCJjquUQXIaR1/8OhYmxt
 4zyTh0qACuzoNqSEoXfM8jGmUPse2IopSyVo4oX2X0abo4ab5f9v6mAxqnJjS2D7jUNZ
 khZLjFAWBG78XGLPMTzf0RGKjGEpYBA48WtXsrDfUoDLAf4Vj1D4ii4ulqPA1qfKyEw0
 zEcmRwhx5LroorYfhWyUV/H5MeCCUSYj8MG6nGGbEadsphpEVRvVCez/oKBhtGMp5Ebd
 lqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nsr7bf5wbzUqoJKOik0vhYxNGp0E3uheDBqd5yuscP8=;
 b=zEJ00Ylrlm18h41CBUimQQ16KY1HtD9psjmHqn9b82deHGo6To6CHgCNqFjM+WOUtx
 T3yC1YFT0ocZPJZhEEYVqKy/v2y2Fgr6qUdgOmvc5BcrJtVVRGodw2dvJnJhcLw0muzl
 ciH9dRUZuDrIpBvbSOr127yVLuzJ8iO9TZglXjFklwtd21z3BUD1YVp7pPBwt/aYyB96
 bveKstv/DUP17FcJbI0f7CBM09863CgvMi3DsMxC6euFa3yJW/rHVh1nLqP3U4a5Xfyb
 Kym1Wu4umIQ2Ou10F63p56buub7+z3yVxZAZv9jB0C1opNs70er0bnwE7DrtqVchpBTI
 GdJA==
X-Gm-Message-State: AOAM5329IWdvz8zfygx7cvukI0SlOsivgJ0i2H87irx7XVSGVlGZgYro
 L8JeV4qT0Tm6h/btCMx74W+8zw==
X-Google-Smtp-Source: ABdhPJxwHTRgrUA+eoNZYFtyUhRtG8zR3yvkZnkxDxq2cuNatvMtsAodIg1d/CMrJtVQTetGYXepTw==
X-Received: by 2002:aa7:d69a:: with SMTP id d26mr8099883edr.50.1644703341977; 
 Sat, 12 Feb 2022 14:02:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f16sm9375492eds.0.2022.02.12.14.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 14:02:21 -0800 (PST)
Message-ID: <410007c0-2496-3a06-bb91-19f7acbef174@mind.be>
Date: Sat, 12 Feb 2022 23:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220203212328.264bc948@gmx.net>
 <20220203223124.3017611-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220203223124.3017611-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: improve host build
 failure fix
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/02/2022 23:31, Giulio Benetti wrote:
> As suggested by Peter Seiderer package util-linux doesn't need raw support
> when built for host, so let's remove:
> HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> in favor of:
> HOST_UTIL_LINUX_CONF_OPTS += --disable-raw
> This is a better approach than my commit:
> https://git.buildroot.net/buildroot/commit/?id=d895bd973b35fde10d3dd7db530d9e4782926497
> 
> Suggested-by: Peter Seiderer <ps.report@gmx.net>
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> * move --disable-raw to a dedicated HOST_UTIL_LINUX_CONF_OPTS as suggested
> by Peter Seiderer. This avoid ambiguity since previously it was under the
> comment "# We also don't want the host-python dependency".
> ---
>   package/util-linux/util-linux.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 5a4ff64d01..40fd518a58 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -41,7 +41,6 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>   	touch $(@D)/disk-utils/raw.8
>   endef
>   UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> -HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>   
>   HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>   
> @@ -202,6 +201,11 @@ HOST_UTIL_LINUX_CONF_OPTS += \
>   	--without-ncursesw \
>   	--without-tinfo
>   
> +# Disable raw command since starting from version 2.37 needs a
> +# work-around to build but in the end we don't need at all.
> +HOST_UTIL_LINUX_CONF_OPTS += \
> +	--disable-raw
> +
>   ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
>   HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
>   # disable commands that have ncurses dependency, as well as
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
