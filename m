Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE60C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B948740338;
	Sat,  5 Feb 2022 22:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUivc2Il4mbo; Sat,  5 Feb 2022 22:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A25D34010E;
	Sat,  5 Feb 2022 22:50:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1501BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69EEF812E6
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbRzjNNZcGBg for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:50:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83EC081260
 for <buildroot@busybox.net>; Sat,  5 Feb 2022 22:50:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m4so30688211ejb.9
 for <buildroot@busybox.net>; Sat, 05 Feb 2022 14:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uSpuCaoeFGp4bwzKMujUmqern9lgGqmeqFT06DwR0JE=;
 b=XZH4QsOLPH0WBcdHnTu3wUbXpsA1F1czBsCh5PNw4Ywtk5+LDlf4Tu4jmIyzZDVd5n
 3uLhz9AsZy2TeJ5ko5rLuErtIYPJP3wY4dF2AZsPp+KfEF3O4er4srOCwJpWB54DEG22
 BaY13fA6eAek8rSXTJV8RkrVTT4Kr1pAN/tq8pjlfCND2IyOe0VRT5+lILO7aCvfxKJ9
 MR1lcxSbJQEIFNzp4aCr0oQCfvX4kP1YJfmGSPtR032aR30muzBZK39HTRwAZUBOFG0g
 RXC+8/VGn+T7kt1wx6bKuWTVUijei0Z2PjrwSNIrM3jhAidv96XUsgmHhJvzwAuqMqnr
 74Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uSpuCaoeFGp4bwzKMujUmqern9lgGqmeqFT06DwR0JE=;
 b=YG/ZGt/e3l7/9wN0lBJdOZNsrIdAQ6jXJ6whrlPvR3OGs9pm8EbZPvV3BtevcmDSxl
 ODTD494h3zoS6LhTVRp8BqMfJE2cTq+adjNV3TUVGzwvNod7cnjRl+irs76zDGmzJbls
 mQ0Ahh6f7MqNefNhtTgVhe+CNR+Y3TTndGxL/h2I1lD/e5dEDsVZHQ6QjeKvpWxSmsDB
 0IPLhh/8ZsQ5YNzMP9864ehbS4hchk3ijvRslZUQwkd0qG16LocrCbtTtvpacFCs/jMm
 Ia92Lxf+9riVTD5AsB1sGZa+ksEKSr2YHbeuT8l2ibrjhb/N5IffLM9BoEbKwUYXzp5X
 CVNA==
X-Gm-Message-State: AOAM532x68M68RXNvOQLq5XZT1EXbZB8NJ0xHa8U0T5tcX19uzaRMSHq
 HL/TtuX9L6MnMSetS4ZEEkPTFw==
X-Google-Smtp-Source: ABdhPJxRjUWA9AB4HcPeTwtmgs1xemJmMlBlicaflIzd8Radys/zx/HTdOpQyCRyNoZJh+gXqUEdSg==
X-Received: by 2002:a17:907:8a27:: with SMTP id
 sc39mr4610114ejc.314.1644101404518; 
 Sat, 05 Feb 2022 14:50:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w17sm1872114edd.18.2022.02.05.14.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:50:04 -0800 (PST)
Message-ID: <fc77c5b4-dcb2-b020-6b09-7cd1144365ba@mind.be>
Date: Sat, 5 Feb 2022 23:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20220124080107.4094-1-mf@go-sys.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220124080107.4094-1-mf@go-sys.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: bump version to 2.0.20
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



On 24/01/2022 09:01, Michael Fischer wrote:
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>   package/sdl2/sdl2.hash | 6 +++---
>   package/sdl2/sdl2.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
> index 9fa95270c3..26b7ce4102 100644
> --- a/package/sdl2/sdl2.hash
> +++ b/package/sdl2/sdl2.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.18.tar.gz.sig
> -sha256  94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c  SDL2-2.0.18.tar.gz
> +# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.20.tar.gz.sig
> +sha256  c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f04dd06  SDL2-2.0.20.tar.gz
>   # Locally calculated
> -sha256  52d41d0c82507721ca1fd92c20dc2bf9ca531b3a288ef845a8275c550f118804  LICENSE.txt
> +sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt

  When the license hash changes, please explain in the commit message why it 
changed. I added:

     Copyright year updated in LICENSE.txt.


  Applied to master, thanks.

  Regards,
  Arnout



> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 54eec85f5e..e0a817e249 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SDL2_VERSION = 2.0.18
> +SDL2_VERSION = 2.0.20
>   SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>   SDL2_SITE = http://www.libsdl.org/release
>   SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
