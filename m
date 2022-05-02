Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412BFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F23A481414;
	Mon,  2 May 2022 21:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cv3kDSUJtBLx; Mon,  2 May 2022 21:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B39813D8;
	Mon,  2 May 2022 21:57:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF991BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CAEC813D8
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mogO1jhxBPvE for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:57:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21E3981398
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:57:48 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i27so30155529ejd.9
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8fqYc5TJXK9x6KV/vl6IKo01wJ9400h82Py+yYr6F6Y=;
 b=YbeBhFF3EYnnBDfgzOYUF2Yi3sjfKEXwIKTTW1cLzYIt005VTE6cBFdYDL7IejhLBB
 V++DwIFeLf7gZToQN1Q4Id8IsVT1imyY+eyTYolUQjlBdlsM8namooR0WxtCs3to9GGn
 ReSUKd/x6jSQzzTEdfQmqWsUQPpUdioXoXAtAm4KQIZ75dfNC2bJ74DPaU8cTJyNFW3D
 xPE2UfErctut2sMaDn0zvwsgxtoBPszJktKvxWXTooiLPYl6CUk4m5Gnyru8D7EjxRb0
 FJsA+CEqy/rhn/CynT9HNs47Ev62QZ2HNuL20I93IH2dETj6+K5bHbPW6AS2/zb1+TA2
 4WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8fqYc5TJXK9x6KV/vl6IKo01wJ9400h82Py+yYr6F6Y=;
 b=kTMH8LLAjDf6jKOBZxFEyq5+DmxRLud3PRSdJI/TwWdzkp4SiW2+FVMH4+uA+qzs5j
 0YS6DDXHruJD3E9Lz0JyHofEl7C0IM3zeLdD8/Hc3EnjwoVbYemwIjF35zPA1cImH8UG
 lt9vywrJ7keRlmhtohk5FQvLHz2UoN9Cj5+fm9JknjYrvi6DWWKd5LTUU6B3+3IYwdA9
 2o5UMODo6doFF21QZRbi+v9KlGmSgZRSWCQaSiUZwhh0qCmLdaeXPnIz9nJYYe5l7Zy9
 FFIi7or+oXFMr8533m9/0JK/D2TbqHiO0BBVoVw+MSwPw/r3guN7TFBUVvCf9UU27y+h
 8bIg==
X-Gm-Message-State: AOAM5305Nq5kqk6WYmWuHCKn8ESSOmqZpv0riagJQjCsEq6V9AVgO0WD
 YhYbWASz9DLG1Q5CsDssJ7dbsQ==
X-Google-Smtp-Source: ABdhPJwEgErFAd6MRROcTyOKyYlmFrLuOGxtqCnBQbVmwmZPKRqo3B4kNI9/nFcbXY67YRrn0Ya+HQ==
X-Received: by 2002:a17:907:7287:b0:6f3:8414:74f1 with SMTP id
 dt7-20020a170907728700b006f3841474f1mr13031577ejc.123.1651528666328; 
 Mon, 02 May 2022 14:57:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f23-20020aa7d857000000b0042617ba63b4sm7067088eds.62.2022.05.02.14.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:57:45 -0700 (PDT)
Message-ID: <11297ab4-6cc1-68c7-9a01-e5610061aec0@mind.be>
Date: Mon, 2 May 2022 23:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220502185506.34664-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502185506.34664-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.2.7
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



On 02/05/2022 20:55, Julien Olivain wrote:
> For change log since v2.2.6, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Package tested with:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     ./utils/test-pkg -a -p fluidsynth
>     ...
>     45 builds, 7 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   package/fluidsynth/fluidsynth.hash | 2 +-
>   package/fluidsynth/fluidsynth.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
> index 20eb9ec49f..12e67404fa 100644
> --- a/package/fluidsynth/fluidsynth.hash
> +++ b/package/fluidsynth/fluidsynth.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  ca90fe675cacd9a7b442662783c4e7fa0e1fd638b28d64105a4e3fe0f618d20f  fluidsynth-2.2.6.tar.gz
> +sha256  460d86d8d687f567dc4780890b72538c7ff6b2082080ef2f9359d41670a309cf  fluidsynth-2.2.7.tar.gz
>   sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index d7c72ed059..c4c9883102 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLUIDSYNTH_VERSION = 2.2.6
> +FLUIDSYNTH_VERSION = 2.2.7
>   FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
>   FLUIDSYNTH_LICENSE = LGPL-2.1+
>   FLUIDSYNTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
