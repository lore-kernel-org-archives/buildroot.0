Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8DCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8116481C04;
	Sat,  5 Mar 2022 14:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpOMCIS_cp5L; Sat,  5 Mar 2022 14:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D0FC81BD6;
	Sat,  5 Mar 2022 14:46:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A98FB1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94A25402F6
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbQqvtMbWjuN for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE9744018D
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:46:43 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qx21so23097492ejb.13
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uNEC6gbapZ1g+loJkEidFt4zMyPyJbWsWvll+05Oubw=;
 b=Waa4pVY9ozqd9b0+T4DDh5UiztXYN8K3Xjw0bCk7EwapbyvX6WlubN4iAsCFQZxYSq
 rNvn4ROcjdKWFsqkcm1pOF9W7dys/Fbg+Nz6mWKyjuBkqluZtB10X8kFWaoSjUx+DCu3
 /ObhKeqsQRiNhN2oawfqEhDfIkOqV4zyyfhNQ0L9sVrW38cd5f9MmDdFyPp/Ffvg0RJk
 LjH4tLCU7SvEaZy3h8jvWVtjedYoODjW44JOgMegqA1tBc5rGkSnmOr1xsEAUQbTujDm
 wjxjeCSsi7S03c3vmWwADGXyH2g3PO+CnwnQNvuryrMNdMDoxB7D23JwkGpdFFzgoiO0
 U+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uNEC6gbapZ1g+loJkEidFt4zMyPyJbWsWvll+05Oubw=;
 b=cTYGREH9W2kTKoL8VzIh5rmUIRnCRegdH8Ia59ivNzXUM7tyllqPYFcQT5Mp34ymUj
 pJw+TJdlPSj3SfxzGv3Wt7PQwcnY+tSVHVPhVig03PkRWf/CKt1YNb6GQ5xE89D79rLs
 T+1VQmjX7SQC2TarwzPqWR1J/UD+XK2771Ch9kDw1Y5vi4rQAag4MoPxNktqion/ZQAi
 chUodpO3vWY8iKaoZG934QKZ75LTE3DEEoV6gDPnpgh+9GKF3Bk7arvDPmMwqOK0dzWH
 Vb38a69So0WFRehSgA2UBKwKl4OTyLbj1QVW5M5S5vZJKBCTMxFOYueke3+dZoJlvB9v
 B3kg==
X-Gm-Message-State: AOAM533Hbg5BRebmh3ATIIpTowOvUc92KrJqV7qmam7ircdLvJL0XarN
 OSWtMCXan6nhlWMd0Tk3nCWrhA==
X-Google-Smtp-Source: ABdhPJyXwlRL6FxGmylybu6vJvsMs6YFK0TnXxnHG+ogoK8HHOqrPm97FYFh0w5Hi+qVWEZHXRW0jg==
X-Received: by 2002:a17:907:a414:b0:6da:654c:aa08 with SMTP id
 sg20-20020a170907a41400b006da654caa08mr3085024ejc.756.1646491601757; 
 Sat, 05 Mar 2022 06:46:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 fy1-20020a1709069f0100b006d229ed7f30sm3049505ejc.39.2022.03.05.06.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:46:40 -0800 (PST)
Message-ID: <5a736030-ecc7-6415-2e15-f73f564f6ea5@mind.be>
Date: Sat, 5 Mar 2022 15:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213193336.1102940-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213193336.1102940-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: needs headers >= 4.12
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 20:33, Fabrice Fontaine wrote:
> NETLINK_EXT_ACK is only available since kernel 4.12 and
> https://github.com/torvalds/linux/commit/2d4bc93368f5a0ddb57c8c885cdad9c9b7a10ed5
> resulting in the following build failure since addition of the package
> in commit 3675131e6c654d7536a184db0184fde7a97040e0:
> 
> net.c: In function 'netlink_open':
> net.c:110:36: error: 'NETLINK_EXT_ACK' undeclared (first use in this function); did you mean 'NETLINK_CAP_ACK'?
>    110 |  if (setsockopt(sock, SOL_NETLINK, NETLINK_EXT_ACK,
>        |                                    ^~~~~~~~~~~~~~~
>        |                                    NETLINK_CAP_ACK
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c61678e56bd73609838747048f27068818c21150
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bpftool/Config.in | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
> index 39475aa962..e81d874343 100644
> --- a/package/bpftool/Config.in
> +++ b/package/bpftool/Config.in
> @@ -5,14 +5,16 @@ config BR2_PACKAGE_BPFTOOL
>   	depends on !BR2_STATIC_LIBS # elfutils
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
>   	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
>   	select BR2_PACKAGE_BINUTILS
>   	select BR2_PACKAGE_ELFUTILS
>   	help
>   	  bpftool is a tool for for inspection and simple manipulation
>   	  of eBPF programs and maps.
>   
> -comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
> +comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
>   	depends on !BR2_nios2
>   	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> +		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
> +		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
