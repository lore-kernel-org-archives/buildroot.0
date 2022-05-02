Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C403C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 582F3405A3;
	Mon,  2 May 2022 21:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Io1ecRmHuirQ; Mon,  2 May 2022 21:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FFBE40445;
	Mon,  2 May 2022 21:58:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7103C1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F884414CE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9g1tT6vf2V-q for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FCB3409F7
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:58:46 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id p18so18039199edr.7
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dkzHqXTiaBDvxG6pFkc4ZacwzOr/Nah21svemrDiJZk=;
 b=Z2I0NaP3VMvf0Vsd8NiresY36UlXDMyvI/gPP0jjKKVDzuJxsJWQKCKwJCjhc0sBrH
 sjapcVww3GZ5TJRNVIyBlx4Qy27kJUMsaJJRZ2ktMR1GjYf9ubKJXoRMCl4bfex5b7e3
 vuj3cDTlg9MgE4nLEzJF7A8c42x2HUe6o3MKeK24pQtNbY/89aQPZtG4PtHRcSVo1iK8
 kF3hBUfv2tMhOddE3N3jCwRFvrEwAxewrggMOSfOvapJ4vCGLzkUVj7I4R+RK1HHjBWP
 jgNCk4ELnHmRwnYQaf/4nP56kzp5xcosm41YApXfHcRb09p3a1xcNpIX7etTwTABwBQn
 WnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dkzHqXTiaBDvxG6pFkc4ZacwzOr/Nah21svemrDiJZk=;
 b=6QCymuvsABK+rBmRiH1X5yyoAgMeveUO1Je1YifjPgy6uf1eJOWYE3WOONrrDh07Mg
 vVYvCgLecak+ki7wAZfS8CN9Ofp6aNNYYgWhO4UGRBCBEH7Q9ZV30mgatM30/KWx7Iy3
 e8/lY/tMY71G2QBKiIbmMHU/X2H/qDiDJIxtNe5pERmRo0eEzOeU5YRXaVK8Nm/dhvpN
 V5rkLKJwV+o+9Kd4ouHYPTmB49+kEY8mk3bUnstrCAHasnQODTEDqrxrGy5fAuhe4wn7
 +R7hdKmWOw8Rw3D3xWzKWF+I1Np4ONL8ganIpgVLeXMpS7nUOS0KZD62TsCpo4Dm+t8l
 +g7Q==
X-Gm-Message-State: AOAM531yafiqi8M1r4kLmKxlj6OtSDx1y2I15//vA9u0XKq1lFrEi1EN
 GDHaNznyYFHKXzc8IWGyNEGUlQ==
X-Google-Smtp-Source: ABdhPJxbZ+g9Ke8PUG4qjgHmOLIIiJXpBN8rAck+rbvmAEPD2e8cOQ/1shFXOPnc+LYKpk1AQNNAeA==
X-Received: by 2002:aa7:d416:0:b0:425:f5c7:d633 with SMTP id
 z22-20020aa7d416000000b00425f5c7d633mr15069938edq.105.1651528724701; 
 Mon, 02 May 2022 14:58:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 em20-20020a170907289400b006f3ef214e04sm3973308ejc.106.2022.05.02.14.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:44 -0700 (PDT)
Message-ID: <2bc9f168-ce7b-c99d-708a-070c8da5820c@mind.be>
Date: Mon, 2 May 2022 23:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220502212519.75249-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502212519.75249-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: rewrite
 BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET to be more readable
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



On 02/05/2022 23:25, Romain Naour wrote:
> Use the same format introduced for BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> in commit 65e05cd914c895461a65ebdf901f991585529005.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/qemu/Config.in | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 7bb203a177..1afbc6c364 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -1,9 +1,14 @@
>   config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>   	bool
>   	# Only tested on these architectures
> -	default y if BR2_aarch64 || BR2_i386 || BR2_mips || BR2_mipsel \
> -		|| BR2_x86_64 || BR2_arm \
> -		|| BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_i386
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_powerpc64
> +	default y if BR2_powerpc64le
> +	default y if BR2_x86_64
>   
>   comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
>   	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
