Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F28C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 497C541133;
	Thu, 21 Apr 2022 20:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NetG3xAy4ms; Thu, 21 Apr 2022 20:58:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43C05410CA;
	Thu, 21 Apr 2022 20:58:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01BD51BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E47878270B
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3KfuyiXjt4i for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:58:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC07681CBA
 for <buildroot@busybox.net>; Thu, 21 Apr 2022 20:58:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so6659325wma.3
 for <buildroot@busybox.net>; Thu, 21 Apr 2022 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=auYY4J5JMY83bgxAb4upjbPSnTmpEtGizLbM3umMQBc=;
 b=eBC0CQdYML2+X7bZzzBELdIW1uX7gz29IKO5OJbrpiQTjQ1Ev0+RufL8PTv53tym3x
 DUmDE0DrU5cecJCICjrumRutAt8iZeVIk3ipoXD/BHZq7DqPjUh7yONlQ6hHsvIRqZqe
 ngBfydNakXOvLWIELDHmlgjC6FaoYrayY15a1/dyJqKXaUBlVhTLOdHxHHWZuhUbMIrU
 74L3DCvSib6Qi9EO+sSVcmiH9nWgWB28kLImfLRUqNgQ1yPORhx0Gt340sUNBvLjHz9b
 37fwWj/wqGa24IMo++D15478AKQAhf2QNWbTYKO9ZU+ZVtMOQu7IiRla87ZrNq9hv97e
 MQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=auYY4J5JMY83bgxAb4upjbPSnTmpEtGizLbM3umMQBc=;
 b=4oikeV9AOyobsMA9Hq2aS0NPIVgposV3FWu+LTEvuzcSJlSR+MCZpPs2LiUZ/EAdKC
 UW48BSJ1bAKVgS1uNDa+AIhULTJpFqxHkYXL8JnMEnDqVehPwZX63cPymoFqsfGbqYUy
 uJl9PBm3Mu9e+tBU40okeQUrI1eE4sc9cHJLpVlHbPy0FxvDNTd54dDkN9QEmwLKAxFK
 vJdEZfZzwOQKpLGlLMw9ADfuxXrXkcRWZ40ibngap39EtpdzAD34JggNfo58qNRDSCoM
 gAoN4G5zJiaka+tlABahxC9iI+MbbFQBXIsf9eQvnOP3Z8ZPOLKKr98V6rJ8db4MPPm8
 Lsig==
X-Gm-Message-State: AOAM5309DvdPuS4PlP1DxX3ArMrKsbU4dou/246jPGFaUJWyvdns+j5s
 vXDRzD4YLaZAWh8Zxss8GlUZKjSx8WGq6w==
X-Google-Smtp-Source: ABdhPJwDA0SQPTq05yUMHL31cjTH2DR80RhP7ik+OaFc4FNYsXXQGP0Fiu94nZICIKYKeMIdeIRLEg==
X-Received: by 2002:a7b:c8cd:0:b0:38e:c2c1:5219 with SMTP id
 f13-20020a7bc8cd000000b0038ec2c15219mr10030865wml.151.1650574698974; 
 Thu, 21 Apr 2022 13:58:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q128-20020a1c4386000000b003915e19d47asm2926103wma.32.2022.04.21.13.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:58:18 -0700 (PDT)
Message-ID: <e6939b88-9c30-ba2e-49bc-750e1176230d@mind.be>
Date: Thu, 21 Apr 2022 22:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <05c2ec866042ea7dd9a215c76c6382f2096199ab.1650274250.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <05c2ec866042ea7dd9a215c76c6382f2096199ab.1650274250.git.baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH] package/dropbear: bump to version 2022.82
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



On 18/04/2022 11:30, Baruch Siach via buildroot wrote:
> Support for the Twofish algorithm is removed upstream.
> 
> The dh_group1 algorithm is now disabled by default. Enable only when
> BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is enabled.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dropbear/dropbear.hash | 2 +-
>   package/dropbear/dropbear.mk   | 6 ++----
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index 82ff454f0a56..ff6e312fde24 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>   # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  48235d10b37775dbda59341ac0c4b239b82ad6318c31568b985730c788aac53b  dropbear-2020.81.tar.bz2
> +sha256  3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1  dropbear-2022.82.tar.bz2
>   
>   # License file, locally computed
>   sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 1cbe63682c5b..bfb80345ece7 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DROPBEAR_VERSION = 2020.81
> +DROPBEAR_VERSION = 2022.82
>   DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>   DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>   DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
> @@ -63,12 +63,12 @@ define DROPBEAR_ENABLE_LEGACY_CRYPTO
>   	echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h
>   	echo '#define DROPBEAR_ENABLE_CBC_MODE 1'       >> $(@D)/localoptions.h
>   	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
>   endef
>   DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
>   else
>   define DROPBEAR_DISABLE_LEGACY_CRYPTO
>   	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
> -	echo '#define DROPBEAR_DH_GROUP1 0'             >> $(@D)/localoptions.h
>   endef
>   DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_LEGACY_CRYPTO
>   endif
> @@ -87,8 +87,6 @@ DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
>   else
>   define DROPBEAR_BUILD_FEATURED
>   	echo '#define DROPBEAR_SMALL_CODE 0'            >> $(@D)/localoptions.h
> -	echo '#define DROPBEAR_TWOFISH128 1'            >> $(@D)/localoptions.h
> -	echo '#define DROPBEAR_TWOFISH256 1'            >> $(@D)/localoptions.h
>   endef
>   DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
>   DROPBEAR_DEPENDENCIES += zlib libtomcrypt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
