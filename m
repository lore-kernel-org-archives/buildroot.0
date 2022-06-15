Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0163FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 07:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B9B6101E;
	Wed, 15 Jun 2022 07:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DwEjNnxtDYR; Wed, 15 Jun 2022 07:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C818361018;
	Wed, 15 Jun 2022 07:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E15441BF5A9
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD1738308D
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7El7UqHq1iik for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 07:53:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.27])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F30BB83083
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 07:53:05 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se27.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o1Npi-000Eyo-NB; Wed, 15 Jun 2022 02:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CKQ92eCEyr10Ol40rZqxa+BxluYXlqkG3B8XhCg4duY=; b=A2Spffo2smKf8qVy4cDGPQl0E8
 LHROKf3zi8hfeRW8IPTsTpkcB8nZ9+wcS6lpa//ro+xKwVn2jXXFzVRzyVWumyMIKCiNLyQ0Z3YAI
 qv5jcDes7ehWFOkt6lI1k9R/6IY2P+P9XKKQI4CyvILOV1lyZcORLFvli4Ivf0w4o+GZ3A9GAuJgU
 VKso9WEonT/61hCXQT1qTXWkfKSnyAUj9bAo0oDX87SjRFYtq8aW7qTRsUc7+pTkhbspRbeQmytMA
 4cv/cdRZluUTsRG/nCnmOC90LQhoeJAmaRGzE15/KUD2T+fMRoDvUD4Uj/dOSTfkPlNz5LS6xs8b+
 Je+YZQ7g==;
Received: from [127.0.0.1] (port=25172 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o1Npg-000Lw2-II; Wed, 15 Jun 2022 07:52:56 +0000
MIME-Version: 1.0
Date: Wed, 15 Jun 2022 10:52:56 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220615075028.41612-1-dimi@tpm.dev>
References: <20220615074543.41437-1-dimi@tpm.dev>
 <20220615075028.41612-1-dimi@tpm.dev>
Message-ID: <2c1f96f051686a661c0a6a1fbba07e40@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00838331830713)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/eTieQvteJeM8atQ/b+DNWPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJaQ3
 X5SETfFZx2lCB2WAj1xtXyejdruJIhhrFEpAZR0y9yrQrLbydMZMWeV3PLtqT3ZVHOAgiUuCzdAn
 9PwFjat+/aDzW6nKqdJclv+SpoFpOFGYdlnzHCK0ncMXEzJ0VEypCHiqEv2otlD7MhmkqygEybI1
 sOftHmSKUCHCvcq0yXl6FMT6M3aJ/uTYw8+C6f32Pbh8IoWMnTRN/BGQ/k2Kbu4uGlhgkrfHbdZD
 A9RTLsrrQhbj8X91aR7ya6IAIQO2STdBA5Uv2GfAI+eh/+ltON/TTWWZ967bkU57I7RG7DgzTQVm
 jsGWMqZuQKevgUdX9lgZ8EzqS/IY6P98izRbNcSWaVG0PQnjHRAW8jNbZ66lhh3M+bth9ENpQs5T
 aTYms7xC/xECurYzBZo2eH5S4gXbKfTeztNLeCGba+AGlvk+fp+1BlUr0rwQCOffuxSDr14Ng17a
 K0KVPdLtuNBQKjk9kmwtxjkWY2Gn4kPGpt1STXBVt1dWVEn7ayxguK/4dg0fH+IxuHMdn6Aesq/+
 2RocPUuulq9W1PiTENQsQSonZiFodgo9fgcdxbh+YkYMQ9Z+2Got4ab2H7ZQD9xaGU/y5LAAVorG
 kQz2Sdq7Wzvrlqr/siF7kmk0RghWw4zIacMilJyGVyjpEgOg2D+r4KgxnNw+SR321fWDrmpK+qv6
 G3jaf3Yb4RxjRToPGnoZ/cup2uXSfMpPixnQwqcBIkUL/j1Y48GvmeURQjjEtCLLqbK4RR/zvkW3
 UWKTIomzlYoAYnBPHhHGmdOLYBGhvGCAKonVa7ITuxnTjLRocQrbO7uHDjImfZnzvmupG9VB2dcf
 K+b+Zn4Xrg1X+GLdhCCwjbvSHPNuz2dpCGOdqXbA2PB14sFBTHQi16AFSfy2tebwJIn4LGuGA/Pn
 2/jbN+mC7YtR1CA4KtycBqB5UH+AUUuB4dpnvVGq0uayBuWPpij+vi+xInMgTZs8IZWUaY+4s3jy
 8fkkkv/ZQmogbmzgl5q7Sj5mtbYwvEzfeN7BAl2CeV4os8gLa/VaI9tL9YFG/dWoAfXc5c4PFCnG
 2AtH8UrqTqhBR2Q7J+FcnfEcVpFY6CWf3WjHFvYnm+G90vHYP0867qmSn6HwLgz+eA6scZZwpzkC
 o4WoBCri0m3a/fo74mPtmdv83fHzXZKfUBrrJFUF4fKPESnR/E1fdl+RTjptstkzumf7rxP7qw==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH v4 1/1] package/wolftpm: Add config options
 for TPM 2.0 extra capabilities
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

This patch adds new package options that enable extra TPM 2.0 
capabilities.

ps: Please excuse the extra versions, it seems I am still sleepy this 
morning.

Thanks,
Dimi
--
Founder of TPM.dev

On 2022-06-15 10:50 AM, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Some TPM 2.0 chips offer extra capabilities. This patch adds additional
> configuration options to the wolftpm package, so such capabilities can
> be available to the user. For example, the STMicroelectronics ST33 and
> Nuvoton NPCT750 both offer secure GPIO. Due to chip differences, 
> wolfTPM
> requires explicit configuration options to enable the extra 
> capabilities.
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
> Changes v3 -> v4:
> - Fix commit message. For some reason the update was not included in 
> patch v3.
> Changes v2 -> v3:
> - Better commit message
> Changes v1 -> v2:
> - Remove a not needed package description change
> ---
>  package/wolftpm/Config.in  | 12 ++++++++++++
>  package/wolftpm/wolftpm.mk | 12 ++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
> index 0b964c3d7e..3027b7e33d 100644
> --- a/package/wolftpm/Config.in
> +++ b/package/wolftpm/Config.in
> @@ -23,6 +23,18 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
>  	  encryption. Disabling this option is not recommended as it
>  	  could create a security breach in most environments.
> 
> +config BR2_PACKAGE_WOLFTPM_ST33
> +	bool "st33"
> +	default n
> +	help
> +	  Enable support of TPM 2.0 extra functionality offered by the
> STMicroelectronics ST33 chip.
> +
> +config BR2_PACKAGE_WOLFTPM_NUVOTON
> +	bool "npct750"
> +	default n
> +	help
> +	  Enable support of TPM 2.0 extra functionality offered by the
> Nuvoton NPCT750 chip.
> +
>  comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> 
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index a4a9edce85..d0423cd06b 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -35,4 +35,16 @@ else
>  WOLFTPM_CONF_OPTS += --disable-wolfcrypt
>  endif
> 
> +ifeq ($(BR2_PACKAGE_WOLFTPM_ST33),y)
> +WOLFTPM_CONF_OPTS += --enable-st33
> +else
> +WOLFTPM_CONF_OPTS += --disable-st33
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
> +WOLFTPM_CONF_OPTS += --enable-nuvoton
> +else
> +WOLFTPM_CONF_OPTS += --disable-nuvoton
> +endif
> +
>  $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
