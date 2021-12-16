Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E08AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECE194014B;
	Thu, 16 Dec 2021 18:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uALqMPQGM792; Thu, 16 Dec 2021 18:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83DB840B59;
	Thu, 16 Dec 2021 18:21:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7C1C1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A67417A2
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwehoUaAL5Ht for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:21:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 282044179E
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:21:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z5so90818371edd.3
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lQM7sMTEF9bNyJ6Lxj0CVR0FVdYqGD5KjG+ll6coBeA=;
 b=VJtCyKzOJj1qBaGYeJ503bRq1wHs4zdnyoWJReJww/IThlgOjw7Eshhe9JfoMiBIRb
 reJdD3dwxuF2Rt/tQJR/nuV5ZaPZN6b8jGGTJKOjojW0qLcGLmnWbZAJ1MqLqhExHEZA
 7JNBiV+ryY2RESs952SnPRdVOOp9tSxNj00XEaKzGYzCbIIAHOBrz0Wx/eE64Qoi1Sg0
 I9HhktYllniXTOtXuhyrebm65tF4gocXmNZ1eVafRPpNGiPqxBmpD9yCpLG12eL0PodW
 bXUiBKkw+IBadExKZMZe3ws7m27SyBZfgJfeINItZSyOT7Mh2DapgxE0/09cKE3fqtvq
 se4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lQM7sMTEF9bNyJ6Lxj0CVR0FVdYqGD5KjG+ll6coBeA=;
 b=4iaIePcTWY7L27VQphGYPAShR5oUwO8TOYrOMjzpJBJJTn+AxAkBNY5bJcTPRLSuCM
 s59l48mcFB/M0KuNuoZX4yzjC8DV7jDj1qt0IE3Vxpfhv6yeFUX4zN1W4QFTjPZhPI7x
 iHDXLuKk9dJ7LP+dH48ukM1o8TW8PjkapJqr9D+jWBgj40i0j1yAiwz+9PQInC4HpVil
 9Wr9jQXnh3MIXd0HwliaH6x1kvGmuRNZ2FS2TU1qkFgN9rRzn5LOO7qwIE2dLj1Uoa8T
 Fvdm7uKrlNlx+gQJWe+AYdKJXQS8geko5D9/cDpyWFLMiPpeqG11c7T3p4f/acEeYtlI
 U8QA==
X-Gm-Message-State: AOAM531uRuvTlHZryCZO2yxKvyfa77XAx2bg1tetEtVlPFfPGX9u9Bkk
 wlO6IU2Xl6zz2mNB1OV3Q0cSWA==
X-Google-Smtp-Source: ABdhPJyM7bQ7al2wn8O3N0b2EodT00lnneZ5AFbYjBWYce+UlKFLag7V2zUVE1GKXSlEr3oS1NtwKw==
X-Received: by 2002:a05:6402:3551:: with SMTP id
 f17mr21581968edd.129.1639678876374; 
 Thu, 16 Dec 2021 10:21:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gt7sm862714ejc.180.2021.12.16.10.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:21:15 -0800 (PST)
Message-ID: <19b276bb-92be-c077-91c4-70bd9e583133@mind.be>
Date: Thu, 16 Dec 2021 19:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214222000.2939765-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214222000.2939765-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-rgb-led-matrix: fix build
 with gcc 4.8
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
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/12/2021 23:20, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since the addition
> of the package in commit e821078031e14df69e5142f23e9cb7b5a1ea0e77:
> 
> In file included from framebuffer.cc:20:0:
> framebuffer-internal.h:83:10: error: 'constexpr' does not name a type
>     static constexpr int kBitPlanes = 11;
>            ^
> framebuffer-internal.h:83:10: note: C++11 'constexpr' only available with -std=c++11 or -std=gnu++11
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c035da0d183f21343f19f7dee982e8e73ee781e4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> index 85c1d1a320..e436755121 100644
> --- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> +++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> @@ -12,7 +12,7 @@ RPI_RGB_LED_MATRIX_INSTALL_STAGING = YES
>   
>   RPI_RGB_LED_MATRIX_MAKE_OPTS = \
>   	$(TARGET_CONFIGURE_OPTS) \
> -	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC"
> +	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC -std=c++11"
>   
>   define RPI_RGB_LED_MATRIX_BUILD_CMDS
>   	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) -C $(@D)/lib all
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
