Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C122EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69434404FF;
	Thu, 24 Mar 2022 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jczQiiZW7NBG; Thu, 24 Mar 2022 20:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2101A401E1;
	Thu, 24 Mar 2022 20:42:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5251BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B2AB40250
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RygEKstEZfiM for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:41:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 267BF40247
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:41:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bi12so11575747ejb.3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+CXA4SZ/V8stFdCad+LZ8M3MV3OipPdCX1lyloQ+WZU=;
 b=hqOxJfNGbvoSEbeBn3c7fbwhk9FYvPN55oSrs/o+JebeO2hNrBf1zjUuRvAom70Owf
 rFJ7Lj8BlhY5d34vhlqqfqfHFj5e5/q7wbuQYPLWwWVMzI49rjZ6MU5TSAjTfz5JN4d1
 ICbvv5FzHgIqCPq67ZNmhfEXf/nNaAK8cN1Q6iptzVuYUWLD9tPyjBBfSP1wM2+fNjE/
 eKYiwcy39JxGi1I5PSD2OH7d23h6sfZOKUMElzMtuQSIZeKdGuRhJXmCExr08u0TDdfM
 rSUjk0J6evbFGrO1PRqQreEZ1no6o9P238fZqJXhaxtKguVZq/fu17WcZCvVC1vvWYSf
 xNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+CXA4SZ/V8stFdCad+LZ8M3MV3OipPdCX1lyloQ+WZU=;
 b=jPPLaqs89NCt5Nm+YGVimYLxgygMUTzcsmTjywP1MQ5in2bsFSh95DR0HX6JhwVdoD
 cHM9C6pTcKoACoVMWdUJHbBLQeuPBooP3ZZy05B3gWn2PbmJ93KWKjmw07Cwi6Rv3TZa
 PcHaT9JHdCFgxMs94LzZvBIzCbFb8WIUPcygiWeqPzaQFCkBkFwswaDa2CeFJOAFBjOP
 xEjDiz/EIly3YN5u235Yoi8tcuVu3OPlX48CsBea3weIGEJ5g9gxbprE5e9ja2Dl+SUa
 zH+Ie9NFI0POwVc99FCv2UFVlRebh8kjNTCeJTEOLQnZ8Ciq+jB4ObhwaHvtiUNLfQDA
 XVWQ==
X-Gm-Message-State: AOAM533HEIv2r8iA5GhoN9c2eXtfAkaT0K5RNEPM2BcwBOBdTmWCs+nH
 2oS1kzOhnNsc0Yxri584A0RYSw==
X-Google-Smtp-Source: ABdhPJwcI43jvwRMLmCLfdGRIrIf7AU6v0zil0sYz7zADYJozNAt2uxvPPRU7y/EJ+E87EGMGn5ijw==
X-Received: by 2002:a17:907:3f9e:b0:6da:842e:873e with SMTP id
 hr30-20020a1709073f9e00b006da842e873emr7915421ejc.383.1648154517391; 
 Thu, 24 Mar 2022 13:41:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hr13-20020a1709073f8d00b006dfcc331a42sm1509957ejc.203.2022.03.24.13.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:41:56 -0700 (PDT)
Message-ID: <186f7501-bf1e-c896-07e9-e7d439b2a044@mind.be>
Date: Thu, 24 Mar 2022 21:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220314183014.2173419-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220314183014.2173419-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2022 19:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  There's not really much point bumping a host-only package unless it actually 
does something for the build. Still: applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/meson/meson.hash | 4 ++--
>   package/meson/meson.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index c2d53519d4..d909709b24 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.61.1/meson-0.61.1.tar.gz.asc
> -sha256  feb2cefb325b437dbf36146df7c6b87688ddff0b0205caa31dc64055c6da410c  meson-0.61.1.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.61.3/meson-0.61.3.tar.gz.asc
> +sha256  9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b  meson-0.61.3.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 125488dd46..4615e839fe 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 0.61.1
> +MESON_VERSION = 0.61.3
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
