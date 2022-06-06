Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57328C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E865860C03;
	Mon,  6 Jun 2022 13:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNVUy4zm9so9; Mon,  6 Jun 2022 13:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B76C60BDC;
	Mon,  6 Jun 2022 13:01:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B80501BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A72B683F49
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rtcJA2FtR00 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B08383F45
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:01:22 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bg6so8980791ejb.0
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MwAuMSKIieiMHUxFRHIqJt0aieLi8/EBk9jrw/k9Bhc=;
 b=UiplXGqOU42wotsa4u9pOxXlAZ8H03AsbA5ZH84tQdk7g6o9a4kDP1b8Vd9HlLsDRh
 sV7UykSaFxH7QwNbthfTtcGx/ZLPDTyfnKw9V8Y2nAtq2HeZLTQZUE5So2AwbJP9TPSa
 3N36Vr2ZuGfZJY4dObAPgVI/F+x5bzI2DVvlniOvyNySejptBCB59GMMTlgKv5j1ECUT
 Q+qoEhU4bedNWjsJhcoS9NJ3Hou063GhMhaTu7lMReS6bn06zeCxZkuuMQQ0FBYRUzMz
 sjtcn+sjhWtvJY4thHuxgryTkXEiwpOhtjHUyqcUs/r2LFo423+iiQrQ19LoxEE7oGVl
 dUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MwAuMSKIieiMHUxFRHIqJt0aieLi8/EBk9jrw/k9Bhc=;
 b=leWzoNs9czH+gqps5vDJlXsmHwTL4bmq0atpWzDmlT9gUV25+fhnTHRhRDuRaDvQKd
 9LEzNlo4kT3g1aYFnY6llluj7wKckCI9AmfGrNNt/MSkelHj3zreUAC8qScC4kuw2sQd
 b5eC+JNgepE0dxdPfCHZtrbtID2KrXGQ/V/zWh7+3rN3ozDyHIHwoMeOAYeTkFQvVAaZ
 UsxchY7t4w/Kmoai4lF4QiRSPgHaZ8Xc93c3YZfrM8LzCQbqXTB8LPW9QLGw5gstf9ZR
 kFdwGngmAHH1oi3g7UTBEqwDe5Lncxx3adLJOFE4OcVeGCrkXJY/WZ/kpMIrHvLIga7p
 KJpg==
X-Gm-Message-State: AOAM533hzdGVEGhMaES2u3EmNfndY0QGq6qDK0DTwwHICsQHsWl8SNq3
 GnGoXoyUe8igvvFkhlkc9APC3vDNcR/FXg==
X-Google-Smtp-Source: ABdhPJyl7SGqr/LDRQFiSRLlOa7xshi+pbLApRAX7GnXMDkR25M9t+xepiQICzGDVpEn1WC8/jWMlA==
X-Received: by 2002:a17:907:96ab:b0:6ff:127:65a9 with SMTP id
 hd43-20020a17090796ab00b006ff012765a9mr20791380ejc.603.1654520480594; 
 Mon, 06 Jun 2022 06:01:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 yz17-20020a170906dc5100b0070b1ecdc12bsm5118044ejb.112.2022.06.06.06.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:01:20 -0700 (PDT)
Message-ID: <10848621-8384-77da-3945-481a691086c5@mind.be>
Date: Mon, 6 Jun 2022 15:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220605152001.1669567-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220605152001.1669567-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: needs atomic
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2022 17:20, Fabrice Fontaine wrote:
> gensio needs atomic since bump to version 2.0.1 in commit
> 0f8d4a6ecd874770ce677b617b2c7f459eb1505d and
> https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:
> 
> /nvmedata/autobuild/instance-7/output-1/per-package/gensio/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libgensio.a(gensio_osops.o): in function `gensio_addr_dup':
> gensio_osops.c:(.text+0x1558): undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/229e4bd1ba1787953899875ab56721c9609f035a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gensio/Config.in  | 1 +
>   package/ser2net/Config.in | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/package/gensio/Config.in b/package/gensio/Config.in
> index f874d1a469..fd0e476970 100644
> --- a/package/gensio/Config.in
> +++ b/package/gensio/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_GENSIO
>   	bool "gensio"
>   	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>   	help
>   	  A library to abstract stream I/O like serial port, TCP,
>   	  telnet, UDP, SSL, IPMI SOL, etc.
> diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
> index 3d110b70f2..1859d42c8f 100644
> --- a/package/ser2net/Config.in
> +++ b/package/ser2net/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_SER2NET
>   	bool "ser2net"
>   	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # gensio
>   	select BR2_PACKAGE_GENSIO
>   	select BR2_PACKAGE_LIBYAML
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
