Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F124DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A255160BAD;
	Wed, 27 Apr 2022 19:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqjiWIRxiaUA; Wed, 27 Apr 2022 19:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B175260B3D;
	Wed, 27 Apr 2022 19:38:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 195371BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0777B60B3D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2Avoo2gIy8L for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E518D60A75
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:38:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i27so5394882ejd.9
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IgW3s5P8yoKog61bWHToas6GV5Qbz97uT88kHHFbuIU=;
 b=TfQLSfuy02Frd9t9zEBqP25U9hwGnznRwMwtLpWe+3KoSsalOrfBBQllYdPnJT1aX/
 NosH2fM3XDrItWdMXgg0FnfgLN5Nu1wVj/ZD4bWw+kEvcRPcIedeuj/O4OILG9Z1QU3u
 H8V8yNA/ioJc1uWwF/lj1aUZA9l1v0+5YJRaGDWndpZ9IwphlzS/5vnwcZO//CFrxP1J
 PuFhar2mItoaPLNO0bWUBqHfY5OJXfjkq0PgQF3DQldve6KvIPgVkQ0N2dElKwlMMM/h
 6OUdZel5C0Q3blFqhl4wzcC7ga1jsFOQCevBwNKTzpmgECzdf+ihCRHk65ueU2l9UEg+
 FSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IgW3s5P8yoKog61bWHToas6GV5Qbz97uT88kHHFbuIU=;
 b=f3s0eEY3ksnW0UiBbE06C6QAeO6+K0Z+8KA6FSvsJOUoxjjhdy/4C8OX8ackcPOoHX
 IrQpGifaIZPviMO307FqxK5DxsX2//N19yVFjZyjAkZdzeYyyyyykieV8EG3/jtnvDQf
 jzsetea/3tqJBbpClerzLiaRcG6q9tlVPIwuDq9VGUDWUcjdPs4sdRox2+926238ST4Z
 s96IQAXIhvfQDPzczmSK5OYWmX8QL3+BYktLd22kMUyN3VVeSOurT174DUXMr4dhlbo8
 V+ZMVz7/TX9kAq0MnDtz/FCY6ck0cVIGZaNok+2aujICjdo5vtnShAyKgVI8WdiC9l5b
 62ng==
X-Gm-Message-State: AOAM532DvEL/R1vZRz3t/cblxr1/S6gRyrtTccDDl1dD7raVQa5dJiqn
 BgSfb7B5mwBJsps0ktaL1Izetdo1Fnj6VQ==
X-Google-Smtp-Source: ABdhPJyFNhr9EUQGCZib/124bEI7ivsP9ug5FW4LekMHs7f5dkF7Sxqfd30tgfXAD8W/r0yqat/FLQ==
X-Received: by 2002:a17:907:105d:b0:6f3:a3ea:cdfd with SMTP id
 oy29-20020a170907105d00b006f3a3eacdfdmr12831778ejb.704.1651088313142; 
 Wed, 27 Apr 2022 12:38:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a056402070700b0042617ba63bbsm87270edx.69.2022.04.27.12.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:38:32 -0700 (PDT)
Message-ID: <986d8b1e-202d-e6df-01b0-bb80519805dc@mind.be>
Date: Wed, 27 Apr 2022 21:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220427072541.4082648-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427072541.4082648-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/wilc-driver: add missing
 BR2_LINUX_KERNEL dependency
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
Cc: Kris Bahnsen <kris@embeddedTS.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 09:25, James Hilliard wrote:
> Fixes:
>   - http://autobuild.buildroot.net/results/40b/40b8aa0c19917f64c3f272f5479068e7631ffcc3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - add comment when !BR2_LINUX_KERNEL
> ---
>   package/wilc-driver/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
> index caf46ae281..24a7b05b17 100644
> --- a/package/wilc-driver/Config.in
> +++ b/package/wilc-driver/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_WILC_DRIVER
>   	bool "wilc kernel module"
> +	depends on BR2_LINUX_KERNEL
>   	help
>   	  External kernel module for WILC1000/3000 devices.
>   
> @@ -16,6 +17,9 @@ config BR2_PACKAGE_WILC_DRIVER
>   
>   	  https://github.com/embeddedTS/wilc3000-external-module
>   
> +comment "wilc kernel module needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
>   if BR2_PACKAGE_WILC_DRIVER
>   
>   config BR2_PACKAGE_WILC_DRIVER_SPI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
