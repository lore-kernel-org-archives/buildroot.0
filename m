Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E41C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15ECB419C9;
	Thu,  5 May 2022 20:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8EtR_fdRjjF; Thu,  5 May 2022 20:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC5E419AB;
	Thu,  5 May 2022 20:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCEE21BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B95F4419AB
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRkgS5Rd-dIh for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:00:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7020F4198E
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:00:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j6so10669302ejc.13
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Sy+6559WP9FOM4CEPyyccJY2pJGyC42wovkV0OiF8Lw=;
 b=E5ppySR3WNDlpRiDABRbG1xeOyVRY8FtIyj5s/AaKluAbr+aBj05l4Oy/2iPUbr7U0
 8EkcpXiFDfOsoj8kNEsiZhlV67PRNgmf1PPJWrLQXQUjI5aYRDQNgM0LAhN/6uf7LuQH
 NRfMopY8pXM76V2sRTIhybJ4fJht9T20RJ+kQOFNleQwZn9rQRU0EfF+dI6LZXobShYG
 dzT7K0pZKSGFyPZwJ5m+C5Q01ilPiHBK8SAQa4QvrbtNxuo1oDXBdRRZrzUhtkFQZAs2
 vrIqhMvSbVWzw/BBOHgnkVHTr5S5c3/ai6HSYnR4UljtJNRKNF7SiZH5zsPAiC7lGUQu
 uPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Sy+6559WP9FOM4CEPyyccJY2pJGyC42wovkV0OiF8Lw=;
 b=Lm5P3dvGxHb56CNnxyFT3Wsp9pgTdUB0V+cr0N8pmHiFMjrGjadx+UAVhlIpClsF83
 luEM4LZswV+Q0KA5+N5PEZCKttTI+To0rBflMqrVj9nHQD0HrTc2Y5CSt5MjlSzzzR7X
 0S3sYedVtHNA8RMi145xNOl+8qzEP9UuceQ54rCXeMOTkog4/wLdH/gMohipjMRL4IcZ
 Mw3DoRxav+5+hFdPn57EywQv8TMQJ29QfT0ObA+hTzB+pG/BdcD6hWM4IgodLCILmiBX
 3dNzQoLAV0uIyaNLmw+QAtIiOTGIB32rGDYujoGxFToAYZgbhK7xlOVWwiUReLJjm6xx
 b99g==
X-Gm-Message-State: AOAM533E+a6EqJJVoyhZq6J1a7Kv3SVnt3F2OCrwnSfJUVSJDBnYEAdi
 /u2r+n8DnNP1EjsTPJMxifnrak+oPw8MNg==
X-Google-Smtp-Source: ABdhPJyOL7rq6C7/C5FFxxKYz2S2FHSPK3gzyy9S1uBelyAJ70SyOAmqWTB/F7b9Tth5SCg4HQbJTQ==
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id
 mp32-20020a1709071b2000b006da649bd99emr27639628ejc.712.1651780854362; 
 Thu, 05 May 2022 13:00:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a1709070b1700b006f3ef214e3fsm1081593ejl.165.2022.05.05.13.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:00:53 -0700 (PDT)
Message-ID: <6f68a303-eece-ca78-0bcf-b92915183a03@mind.be>
Date: Thu, 5 May 2022 22:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220505042226.2216083-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505042226.2216083-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: add support for new
 cpu families
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



On 05/05/2022 06:22, James Hilliard wrote:
> Add mappings for new cpu families based on the reference table:
> https://mesonbuild.com/Reference-tables.html#cpu-families
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-meson.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index f1390a18d0..ff850fa79f 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -36,6 +36,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
>   PKG_MESON_TARGET_CPU_FAMILY = arm
>   else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
>   PKG_MESON_TARGET_CPU_FAMILY = aarch64
> +else ifeq ($(BR2_csky),y)
> +PKG_MESON_TARGET_CPU_FAMILY = csky
>   else ifeq ($(BR2_i386),y)
>   PKG_MESON_TARGET_CPU_FAMILY = x86
>   else ifeq ($(BR2_m68k),y)
> @@ -50,8 +52,12 @@ else ifeq ($(BR2_powerpc),y)
>   PKG_MESON_TARGET_CPU_FAMILY = ppc
>   else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
>   PKG_MESON_TARGET_CPU_FAMILY = ppc64
> -else ifeq ($(BR2_riscv),y)
> +else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
> +PKG_MESON_TARGET_CPU_FAMILY = riscv32
> +else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
>   PKG_MESON_TARGET_CPU_FAMILY = riscv64
> +else ifeq ($(BR2_s390x),y)
> +PKG_MESON_TARGET_CPU_FAMILY = s390x
>   else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
>   PKG_MESON_TARGET_CPU_FAMILY = sh4
>   else ifeq ($(BR2_sparc),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
