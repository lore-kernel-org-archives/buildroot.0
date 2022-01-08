Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27719C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13438176B;
	Sat,  8 Jan 2022 15:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Xkqsq-NFuf7; Sat,  8 Jan 2022 15:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29CBE814B7;
	Sat,  8 Jan 2022 15:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4431BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7843C40103
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6orJHAcZJCEK for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:11:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DE90400F2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:11:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r10so9507128wrc.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=GwMmvUcmmE1ZPPu7hmRspHULJC8/z9lP8QMAJUK7k18=;
 b=M6RQffbDDpQ3mmqxkLXEtv19p7xmJgObktWDjqEhkrELXFGmtNfW29pRnrYFMzzVvg
 GPAFxZIjtZUTGv6HgA9IpOs7tJeS4DOpzDMJSZYPWDd2NUlMr5cH0mQ9n4jgLCFccHLd
 hMmi+gQjXI7tC2CNilFnPO71sVAyjrAFoFplLZj5iHlbPB2J/s6k18GnZh3YfYvYiJSt
 4LyaAUEzo2AO4vJMBRVLyRhS7JBT2wq4u6MTUzJyrHeM1FpfwfrD0hE53PB3R2nMVHFo
 iA2ieQ15Z0H9jKTLnXoRrt+Zsc7JSQtGt4Yx0js16QkdZ0FW6TvBwn2DOwSvRwT6yrHv
 NQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GwMmvUcmmE1ZPPu7hmRspHULJC8/z9lP8QMAJUK7k18=;
 b=kqnH67qdz1gVZkFB6LiHO6Na+xwGmSKoK+P7ObygStMzURpz5N7qsHW+dyO8Hw15sH
 X7rs2iPHhbHiDudbP0GeTl6uG64ORY/Oaur4wBfLpmmNvMRI4Bx5eUdMlda16x+bBe3r
 m+5K4NnkI2GGmB7stpB3tz9/v9xFPnDPBbTqaVSSzoNEpMEajixK432rQoLnuAUf0mg4
 gJVAMDykDgWsEnS/nNdTXv4Igw8gjA5L3pb3KNcE4NMgYsO7l5RapCI5HeBQ2ih+LwSk
 wKYRTfW3iy681Y7UVkG9aFLGYqwkIidiNC9AnG6gKlaSmpzFaWOCcUNTskMMxVaQoWE6
 zd+w==
X-Gm-Message-State: AOAM533CdePvOdxPgGoBrk4XkzVkWWlmkzJZigrQnLB3vWNHU9OK+ux/
 +jwg/HKmyePax9vzCP3cqkfy55eLyHeBGAkv
X-Google-Smtp-Source: ABdhPJy9W/xaiNugwOwIsY233dNW1PQvn95v1QuFnunBH8rbVStCd01CURFJPa5N4bLGDu6PlUcxpw==
X-Received: by 2002:a05:6000:1244:: with SMTP id
 j4mr3637723wrx.585.1641654678816; 
 Sat, 08 Jan 2022 07:11:18 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l26sm1639930wme.36.2022.01.08.07.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:11:18 -0800 (PST)
Message-ID: <fbde1134-a97a-f439-b341-e7fb3295b453@mind.be>
Date: Sat, 8 Jan 2022 16:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220107204754.1462472-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107204754.1462472-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/domoticz: fix build with
 libexecinfo
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



On 07/01/2022 21:47, Fabrice Fontaine wrote:
> Fix build failure raised since the addition of the libexecinfo package
> in commit eea8ba446c10701a273432552108d80fb2224ef4
> 
> Fixes:
>   - Not autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/domoticz/domoticz.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
> index 826e6f5e58..0d1088d395 100644
> --- a/package/domoticz/domoticz.mk
> +++ b/package/domoticz/domoticz.mk
> @@ -41,6 +41,11 @@ DOMOTICZ_CONF_OPTS += \
>   	-DUSE_BUILTIN_SQLITE=OFF \
>   	-DUSE_BUILTIN_MQTT=OFF
>   
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +DOMOTICZ_DEPENDENCIES += libexecinfo
> +DOMOTICZ_CONF_OPTS += -DEXECINFO_LIBRARIES=-lexecinfo
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBUSB),y)
>   DOMOTICZ_DEPENDENCIES += libusb
>   DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
