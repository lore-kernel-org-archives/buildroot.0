Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEACAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D7E83F7D;
	Fri, 13 May 2022 21:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkyicyK-GDrQ; Fri, 13 May 2022 21:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99BE183F6E;
	Fri, 13 May 2022 21:57:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DFE91BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CC6C410D4
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id To2eSD-WD3ij for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:57:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37C8B41529
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:57:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l18so18590982ejc.7
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9zEMFIgkjci2l57JYTjSqgCTbiEMxm04zVLwr53pU80=;
 b=dxrVzBD6vdopjMQ00deTfRrcYQHbs4S093bkPdB/fySHTU9PkHM4zW81UjbRACeDmf
 AOjBrXQdL5oX5unJi8VKKUFaBsL1vMr/3CzfG0wttZUBw38SmYkfRgrul5VzW38goDll
 S1HCSRyES4YxPFwhpc2Ukrk1ujFS7LbnBu50yvhwR1PRjGNDFWbQIfy7Yfe4pclBcMeA
 /W0aOLOkVc6qcoVI36e0vzDpj4wTca2arqfMB3Ak4Lum86wcLteBCKRoKbWeaqHHeWCU
 KSYLNqVDnaVhKEI5D09SFi/sI19HcdDsSJSgBYN1uq/tv+UzWiMY6fRkQhFKyAsy3YHh
 QKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9zEMFIgkjci2l57JYTjSqgCTbiEMxm04zVLwr53pU80=;
 b=5mMFtT1iAhUXEFHXqwvWiNfYG4Nz6LnhtrQq2OXj9RX3o/s/sK0voge/fYvG728trD
 Q97/iuZuCDs8MAx5N20wSj9HFO+j19w5hU94/35u9MpvMXRvF2UCW2pleqdR+hML+fOV
 YffG76Iy+TyvbPA6QOuvcwvUSEMydHXP3LUCVtNYT/l74yar7paDdI/HspFpnnmS0z2D
 zL2n+d2pl/lld+yL9IofswKaXOGYujvINvF2Lqfuj3geSOKMznhCY8lFOMBEH2d/5Kwg
 NQioU1mM01wh9d3uZoeYF8OceTYwhibb+khAEhjT750kcoXL8J7RXUpCd9xMwquf6JRO
 pOYw==
X-Gm-Message-State: AOAM533audObqm9qGwiF1LzVfQrMmsufXGfFYV9HLzWCVEu2rGmjugHd
 R7ZEoXlBSLfOv2zs53hBX1NZ9Q==
X-Google-Smtp-Source: ABdhPJyzy/n4T7bK7p6EI3lGCZF2AZWeWneuiViF5I/nKGHnnyxsemkr4t7K9Qp0CLYQtUpLRsRp+w==
X-Received: by 2002:a17:906:414f:b0:6f3:e324:4aae with SMTP id
 l15-20020a170906414f00b006f3e3244aaemr6178660ejk.727.1652479056464; 
 Fri, 13 May 2022 14:57:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gx24-20020a1709068a5800b006f3ef214dc2sm1164471ejc.40.2022.05.13.14.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:57:36 -0700 (PDT)
Message-ID: <c574a4d3-b9d0-514b-19c5-6580b9af244f@mind.be>
Date: Fri, 13 May 2022 23:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509062100.3969630-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509062100.3969630-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: do not pass
 -j$(PARALLEL_JOBS) to ninja
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



On 09/05/2022 08:21, James Hilliard wrote:
> Now that we are using ninja with jobserver support we should not pass
> -j$(PARALLEL_JOBS) to ninja.
> 
> Fixes:
> ninja: warning: -jN forced on command line; ignoring GNU make jobserver.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-meson.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 9987fb73bb..0835e08e3a 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -27,7 +27,7 @@
>   #
>   MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
>   NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
> -NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> +NINJA_OPTS	= $(if $(VERBOSE),-v)
>   
>   # https://mesonbuild.com/Reference-tables.html#cpu-families
>   ifeq ($(BR2_arcle)$(BR2_arceb),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
