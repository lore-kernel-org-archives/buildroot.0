Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9A3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4551640528;
	Wed, 27 Apr 2022 18:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gn-fU4wWUaD6; Wed, 27 Apr 2022 18:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24D39405C2;
	Wed, 27 Apr 2022 18:53:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85BC81BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72966828A9
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_rDBiAHNLXh for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:53:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C653A82768
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:53:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id y3so5163760ejo.12
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=FrbkkkYjlaUYYbSyMJCqYyMV9GN+Gr1hDDQ5LHhU6zs=;
 b=LG8n/MyHzBkOrqHJogtoK/SHO2Udm3J5UEFDW6FUDNk4daE085So7RZAbRHztpCBwv
 FQ9OnJEd+xLXqpOdGzEan5RpSfO8JisrjcnDjlLvY8BqNR4JgXKVVJKa49+SDRY+/Wpf
 OO32ZUmlaAjXXYMpe7l9LYTqNCLjw2QUOTkdkvhh3YJDNgSVI4EOXBG2UcfTEPT8qamd
 mpfE+eMevJ19vUKk/TMGmDyKHRz9wTcJnlpQtrnesnSzAUcK0F8m/4yyV4lSNuczCgkM
 T71DXwWnDAauYgnZZ7p/+f9QYui5B/wucdX4/kGQdsuUSiT+FbKpxEA68ouxzwB3oBM0
 Vu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FrbkkkYjlaUYYbSyMJCqYyMV9GN+Gr1hDDQ5LHhU6zs=;
 b=vbuXN9G9fYoTA8zKu1OnWjrE7k9cWv72KQU4v8mhSaZIMjluQ/uPNXLmXSKFSUFx2r
 AVgPMpbBMcagcZcailOeuwvMHxnhbqWGGunzfcVgjQV3DXV2pyuaCevvDRcR7iqUnsv/
 JOol2SqnkCbT/YgoOGU5aAiRXhr9VDVJEAuVcErnAh+qe+iObQmxtpJHThXz2TrjnvBu
 kyHiBcXKLiCZ4g6hb0jwHCYvcdHjxz7R9dysle9i8uM2CMZBhO97qNLaZCQSyDHISV2S
 G5DIX3RvbGWNyZyJKQFp0f97tJCCeelUxDHuHvCHYSJBGgJCnwFDtKsi5z20/nDGYQye
 ARFQ==
X-Gm-Message-State: AOAM532Vx0R4Tgt4lm3HcsYX6eMabi/W2GyefAUcpM8O2cvnHDgWEuZf
 8ajCs4Za/TYVnyPEgh4AmgR31A==
X-Google-Smtp-Source: ABdhPJzL5Fh02TPbP4KfibO/UGBC8Hx4mFO1+wfC4GrpYIdsLjKzjUKIvA7E6GNHroFnOoVVAlZLEg==
X-Received: by 2002:a17:906:130c:b0:6f3:8bbd:740a with SMTP id
 w12-20020a170906130c00b006f38bbd740amr18401007ejb.621.1651085607073; 
 Wed, 27 Apr 2022 11:53:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a17090681d900b006f3c0b43eacsm1987264ejx.91.2022.04.27.11.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:53:26 -0700 (PDT)
Message-ID: <7e3589fc-7061-a68d-57b4-67beb3587258@mind.be>
Date: Wed, 27 Apr 2022 20:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220425202205.17362-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425202205.17362-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 19.0.4-Matrix
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



On 25/04/2022 22:22, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
>   package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> index 74aefe2138..36294274f2 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  1549422ac1386929dfc1a479898d6311440d1f8bfd1bc94e1fe5da9cc2db805c  kodi-inputstream-adaptive-19.0.3-Matrix.tar.gz
> +sha256  eef7660e9306854282ccc8b994ffc38b2fe1e62e155d883cfa346bddc84b595b  kodi-inputstream-adaptive-19.0.4-Matrix.tar.gz
>   sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index 83ac897037..ed85d21684 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.3-Matrix
> +KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.4-Matrix
>   KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
>   KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
>   KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
