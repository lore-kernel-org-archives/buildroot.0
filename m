Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2050BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E6E60F00;
	Sat, 14 May 2022 09:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbWn8Z3FrOiR; Sat, 14 May 2022 09:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D5BE60AE5;
	Sat, 14 May 2022 09:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA4E71BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97EAA40A30
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oS_8XvK2xCxw for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:31:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4546C400EF
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:31:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dk23so20256138ejb.8
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eyR6xVptuDUN4FHKbb36RqUF3MWgbPc9aMR4usPrnz8=;
 b=SsGXHkDjhNPy2gykn0vCbEa1kqF8VqJoh4XlxXLiG12tIrWClIgYLMBTHo0wg9kaOl
 zEa27ymRQbXY/PR4B76X8soW4d6OXVjHjegdxsD3cVzQqppuOrgR4Ijd8G1DYRsR3Siy
 FHiF24HqCU/M1g0VuokIDwlMNX8QwdXXYvVYh3is0s1gIcxur2qsBDqYs7LCfr4Y14lg
 6zEMisdGUYclEu9zE4Sj6RWKXEnSfdLt+4FzRwMlLPc1BpwHYQbLeBZWfTdyVLBdwcxH
 E2u65z6GrtFhDLw76klUIB0Ek2XNKWPbZGEVtAaSX/jcRNVfV4AIszgBpl5afUMG7mYI
 aFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eyR6xVptuDUN4FHKbb36RqUF3MWgbPc9aMR4usPrnz8=;
 b=KRFEP/ji+pk+6AI4oc+VKRtmkWk7SqcMCML2Jt6KN8RYYd0dFxurevcdoEslIkRJCL
 kOlFWHaQPLnoPiM+cvnFO1HAsmgpBVXEB+DjIducc1pIrBTdlaNz8/x0x2m0uEcQVc8p
 qLJBp1sP6A88ZpqWSLgyEbzNItU1zf36e/Ow/NhQCke050Wa18GkYkw8hHZ21Y48Ljt0
 05+fCq6144Y9+5My42Z02OXXVnnznLARl0diPrrTeLiinf61u8yLAz3KoH5yGjrlYc5x
 gGB5YAn8M0pVYQ8uk0KYfcTEJ+tGgPRsA7c+gtBDZmJFFrDiQmkjdkOu6O7usAc7QBSJ
 bZSw==
X-Gm-Message-State: AOAM532bubJB54oY0/E1pFvWbYvGQmolywCj69UW2Ymdiqhm7Th0rz0k
 E2/TZZPaMwzJdyXfkrCuj0gmOnDdSqa1dA==
X-Google-Smtp-Source: ABdhPJzrtv31Po7hS0G+kb0rXV1bUMsxIcdKW8yr3xy6mgkJ06pLzzvjAfkncfce9z6jk3eD7qqUJg==
X-Received: by 2002:a17:907:9720:b0:6f4:31d4:925f with SMTP id
 jg32-20020a170907972000b006f431d4925fmr7627296ejc.658.1652520666417; 
 Sat, 14 May 2022 02:31:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qp24-20020a170907a21800b006f3ef214e56sm1558179ejc.188.2022.05.14.02.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:31:05 -0700 (PDT)
Message-ID: <3db37c74-150e-24de-462b-58ed7902f5d6@mind.be>
Date: Sat, 14 May 2022 11:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220512202720.1319703-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512202720.1319703-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.0.3
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2022 22:27, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-May/000673.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>   package/mesa3d/mesa3d.hash               | 7 +++----
>   package/mesa3d/mesa3d.mk                 | 2 +-
>   3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 2fa0370f96..fb3763297d 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>   
>   # Not possible to directly refer to mesa3d variables, because of
>   # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 22.0.2
> +MESA3D_HEADERS_VERSION = 22.0.3

  As I wrote earlier, your bump to 22.0.2 was marked as Changes Requested. Could 
you please rebase and fix the issues?

  Regards,
  Arnout

>   MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>   MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>   MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index 6f06c85760..32221b8c89 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,5 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
> -sha256  df4fa560dcce6680133067cd15b0505fc424ca703244ce9ab247c74d2fab6885  mesa-22.0.2.tar.xz
> -sha512  939ddf9acd280e1b20b3540349b3ad07bbeee5d821198f1d667e86634449bf5d0a0df5832753b8b3f8816709c2f02959cce25f3d26a33cc758dd8e25d158ddb8  mesa-22.0.2.tar.xz
> -
> +# From https://lists.freedesktop.org/archives/mesa-announce/2022-May/000673.html
> +sha256  9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9  mesa-22.0.3.tar.xz
> +sha512  3982cd2fadca5349b2513885ed734c2422e3f2dced85f471f245b120ffaf018acafcd929dc5ec317f2c568bb5f619f5a3475d3a92495f766a2eefb225efcac14  mesa-22.0.3.tar.xz
>   # License
>   sha256  4bc15d14dcc134b024cbdca3b5330010136ce8a427b6f8353440ce2ad7aab037  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 41c8d80daf..40b61161d0 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 22.0.2
> +MESA3D_VERSION = 22.0.3
>   MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>   MESA3D_SITE = https://archive.mesa3d.org
>   MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
