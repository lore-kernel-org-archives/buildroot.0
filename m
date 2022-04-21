Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C968C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B0B815AD;
	Thu, 21 Apr 2022 20:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tG_Tu9R59xOV; Thu, 21 Apr 2022 20:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB988141B;
	Thu, 21 Apr 2022 20:54:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0A5F1BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE0A48141B
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rc4qsX3TEe1E for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:54:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D007381419
 for <buildroot@busybox.net>; Thu, 21 Apr 2022 20:54:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso4193154wml.5
 for <buildroot@busybox.net>; Thu, 21 Apr 2022 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=C8hjxpUx6Klug2W54G/aTE/Jzj4RlQOPs+xVDa9adig=;
 b=WVZ/raIYDoRtbmdSdf78xuAmohgJSbgDQsXh/zOQcM7Kl+XxG4hWGs44rRkDG+Yfx2
 90yu1rTctzGnS1QaGL+ZjIWL7e19IPOj1YKFaMLomhPhSU5MltSjSUYn2CyEsknGhOP9
 //z88ODzFz23T8ZCAFHQ9veEfrEEhBRhLnYRKMrs0uoJil4cujVnMGOPDsUBUfi7p9B7
 fbvoqvFs3GpVEWnuIoLBQTn0hPBZ9q33LUUPfeRIjzBRSxd9LWf8GIziRFGn7kBFXxba
 3mjvAxGs17QO8bFCiHcfmRdJSkEMqNbDSlEUo5jdy2369laZa4w9DtNQC+sCOlC61Wsg
 SSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C8hjxpUx6Klug2W54G/aTE/Jzj4RlQOPs+xVDa9adig=;
 b=n1er9s69EFNAyydVHdCLMCNtVjVO108P7K1cu7uxKmxfush5n3BIlcB0N0X/qEeXz1
 Q34B9AKmbrnJLWfQ61OIo2wQnOtHNd+7SvXkVmnBzNfdQ30ZIPlmkEniRIv09lN62Rz+
 MwOoXG1QmIampnod/Dbsw3qTVpgfn4sMQKk1Is4ywTcKoT4F6/Nr2sm3XExXbCwEDvJv
 Nycu7CNaCrZ/4TG9/WZrOoGomPDqmKpQ3ftUguX3BCdZdwSPE538/xVBNc2FAmz+g8lX
 4zCmEZpdyjsRhxreHY55GlMEvPh0PTL4PcbwyjGrSctglpsUuOdvjSbvyPJV4df+7DvM
 V5QA==
X-Gm-Message-State: AOAM5302tKqaZ4EsjZNlNXWZHEfGpbnzCJiRv0DAfiRUMXHFCG4vEGRM
 Ov1VKmJkpmZjBOkonzVRcbCPbA==
X-Google-Smtp-Source: ABdhPJzSrO+t2NdsmHBrpBNMQzbkvyEvXavo2t2VjjY0+/ZY0P4C9zkcfUjbZD0oq50k5zhsw/dMJQ==
X-Received: by 2002:a7b:c1cc:0:b0:38e:b876:95d8 with SMTP id
 a12-20020a7bc1cc000000b0038eb87695d8mr10272844wmj.57.1650574471788; 
 Thu, 21 Apr 2022 13:54:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm41997wma.37.2022.04.21.13.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:54:31 -0700 (PDT)
Message-ID: <a80a8b76-cc5f-376e-85c4-3a8702a26adf@mind.be>
Date: Thu, 21 Apr 2022 22:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220417082800.2742525-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220417082800.2742525-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/luarocks: bump to version 3.9.0
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



On 17/04/2022 10:28, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/luarocks/luarocks.hash | 2 +-
>   package/luarocks/luarocks.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
> index d80e08a20..14809402d 100644
> --- a/package/luarocks/luarocks.hash
> +++ b/package/luarocks/luarocks.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  56ab9b90f5acbc42eb7a94cf482e6c058a63e8a1effdf572b8b2a6323a06d923  luarocks-3.8.0.tar.gz
> +sha256  5e840f0224891de96be4139e9475d3b1de7af3a32b95c1bdf05394563c60175f  luarocks-3.9.0.tar.gz
>   sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> index 028e144e2..b28a1bd57 100644
> --- a/package/luarocks/luarocks.mk
> +++ b/package/luarocks/luarocks.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LUAROCKS_VERSION = 3.8.0
> +LUAROCKS_VERSION = 3.9.0
>   LUAROCKS_SITE = https://luarocks.org/releases
>   LUAROCKS_LICENSE = MIT
>   LUAROCKS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
