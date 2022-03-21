Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E2CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB77140A67;
	Mon, 21 Mar 2022 21:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mrU7OAORu4O; Mon, 21 Mar 2022 21:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E31640A93;
	Mon, 21 Mar 2022 21:09:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 037AF1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2BBE40A79
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyJxOLksgFxe for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:09:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E71FE40A67
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:09:17 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id j15so18318499eje.9
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=A3DK7W3AGf603RVHo5r3pAEQY8AL/azd698/TM2y/W0=;
 b=dbpXO1BTGY0saLzgJP/83aRPuP8Qg6hWxuq5kZCazaV+u79p5+E2TQH5ha1EhrV5c/
 R3a9BKaAezbuK/yekVZXdekHqZRWIOd/OdP8FT86cbODkyWhFe00VsTqBH92063ErJ35
 gyc2ah5QhMfo9IXZGqOsqASeMZcETrJsuJ9IXcNZVtup/kHLBN+/dwAzG0i8+xEHkhvt
 L2MiYm9/nb1Sbr/Ssq7OLVm0d3YfQXyb5V/xw0cqV+GxmfHdJzzXyfwBFjuHEjjFC9Vo
 EznWAlhxknDeX4i1bz71lEEC5tuJv76kFBzvcW6Ai6ABpha+IfbzDJ37vSEPmcXqxvNS
 F6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=A3DK7W3AGf603RVHo5r3pAEQY8AL/azd698/TM2y/W0=;
 b=XYYUeCv7zxcj1F2FDrUiI1exvn0e1Er2kSCrBKB3KPvSXhUZ4ZybsjGW0dG0vYCMGJ
 gGgK2f9nV5xvbwCn0nMe8zDlu1mdJWjf7L0lF45648tmRxNWKMGEXfmrs83OGfRmo1aU
 YW7mA2iGNQhAW2CAFisjfpoeGEzsERVLGygk/EVOX7AFy9B3R5PWpSlZsQpBrhQD5X/Y
 iq//4bwIDzU5iWRQRyImfxfJMgwA2q/dC8RqIdm8PYzrPckxr0GzAAzTvYAhZWBw6BND
 96WpQiUV1TfvIHYgCZwE0kwzNoSM6FFmunr6uYSrprlER9qLWJ6qN5uXSWHdZwHnCGJA
 GKTQ==
X-Gm-Message-State: AOAM530FMTd2DqiGZAXlUlLP816Yn2YEx/csW0x+ax42/OXih3+zDaH9
 /2f3wR82zmwOyiy8aZj/UqaHkA==
X-Google-Smtp-Source: ABdhPJwWP0N3SLhAKPkoHGvgx5t772IIvoNMkTPn+6LvRxPscJdbYc+p88l01PjXVJt6/er74KgInA==
X-Received: by 2002:a17:906:2b93:b0:6cf:bb48:5a80 with SMTP id
 m19-20020a1709062b9300b006cfbb485a80mr22057803ejg.681.1647896956104; 
 Mon, 21 Mar 2022 14:09:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm8440322edt.15.2022.03.21.14.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:09:15 -0700 (PDT)
Message-ID: <36d042a3-4b87-bd04-8895-3496d1c0b91a@mind.be>
Date: Mon, 21 Mar 2022 22:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
 <20220309220018.786891-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309220018.786891-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 2/3] support/dependencies: requires cmake >= 3.18
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 23:00, Fabrice Fontaine wrote:
> gerbera requires cmake 3.18 since version 1.10.0 and
> https://github.com/gerbera/gerbera/commit/ac05976dda335ce1c28a5cc78e4e009a145e3559
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/dependencies/check-host-cmake.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index dfc252e919..5760e4ded1 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -1,9 +1,9 @@
> -# Set this to either 3.16 or higher, depending on the highest minimum
> +# Set this to either 3.18 or higher, depending on the highest minimum
>   # version required by any of the packages bundled in Buildroot. If a
>   # package is bumped or a new one added, and it requires a higher
>   # version, our cmake infra will catch it and build its own.
>   #
> -BR2_CMAKE_VERSION_MIN = 3.16
> +BR2_CMAKE_VERSION_MIN = 3.18
>   
>   BR2_CMAKE_CANDIDATES ?= cmake cmake3
>   BR2_CMAKE ?= $(call suitable-host-package,cmake,\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
