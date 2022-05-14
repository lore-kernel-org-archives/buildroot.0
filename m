Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999DBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4967460F15;
	Sat, 14 May 2022 09:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjlVg_PL9Zb2; Sat, 14 May 2022 09:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 590AF60F0A;
	Sat, 14 May 2022 09:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E83021BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D79C083F99
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWqIfTAS5eO9 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:46:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D52A583F6E
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:46:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c12so12546873edv.10
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4HMES/yR/POXs3Ei0JUtGsNjqJGkxZZygneBqaFtrWw=;
 b=aOqVi+bC/7oKpO4lTLE+eMxXvSYz9QLN/CILOQDWFz5Xo4wmgYU1iBxoxbNwWxuF0B
 Uq3PYd8j/H8cP5EQejp/jq4Mc8i9y7RZLiXIR+wSkYcPNbMdkQvJj7EZznfpT3XM6n+1
 5UUtPWAmevzsJ0UcDf1NZFd6MFWbNb5pqkvvPTBGznhxTk9PgAE0D+5XDh4rs56sK995
 cFMejQbNGWyT/AlXKOD863dvW1TEVhsgxFreJgb5WSA5tZ+iPDU8t8XU9fxWq/OljXv/
 TTjfxwVcqIuPYMyWrAUtLDYZ+JZSWPmZ04/n9Xye3wbAHE7mSLejK1CiOnZzDj5OTHnn
 K0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4HMES/yR/POXs3Ei0JUtGsNjqJGkxZZygneBqaFtrWw=;
 b=3zV2txw3MALlvVm3YWIekyxuJm9BQFyd2KxirC7eLlc4jVab3ytwlqaDXs2DHcI6Ek
 +DivbTGtqvLjJugJqseCHYCaIknjhgztobNJUMAy0ufntQ4QUad3oQCeSb1aDevyLjVo
 NJbos3VsZ/TKeihDAK8eNx32eUxa6/kmyhi/OPXffPERmBIbrhtP+Ruw9uZBVpKdXhGw
 KA77tnAo09LiI+63osC9iaXhBqdrMe4r5D+v8umkfLsyypE9PRE5OO3fv1aPVefExb5V
 RMUXpqQhHb/QeFzVVttASQfOLljjYg8AC69C4r8PcdRziPF+nIWGS7k0+la295V4g4yl
 Ofuw==
X-Gm-Message-State: AOAM5300a431LxGeCLH1fqY6MbhwPU76pC+4AnLn0u3r4/KZb//aA73L
 ef8ylNlhsYh5rN45d+sK1SpGWg==
X-Google-Smtp-Source: ABdhPJzl7f/cUk/HbD0bczKd8nz6/QpeQ1koo5RXVsQpnq24ldaip32gCqf6qYDEzfD2RVwdAQd7MA==
X-Received: by 2002:a05:6402:ca9:b0:425:ff4d:f6fd with SMTP id
 cn9-20020a0564020ca900b00425ff4df6fdmr2889983edb.405.1652521568948; 
 Sat, 14 May 2022 02:46:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hg23-20020a1709072cd700b006f3ef214e0csm1565837ejc.114.2022.05.14.02.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:46:08 -0700 (PDT)
Message-ID: <f8e0cd1d-eb45-e749-9ea2-45f23322e75a@mind.be>
Date: Sat, 14 May 2022 11:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Florian Fainelli <f.fainelli@gmail.com>, buildroot@buildroot.org
References: <20220511001947.2112747-1-f.fainelli@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220511001947.2112747-1-f.fainelli@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Disable build on OpenRISC
 with musl-libc
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
Cc: mmayer@broadcom.com, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/05/2022 02:19, Florian Fainelli wrote:
> As reported in the following autobuild report:
> 
> http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5/
> 
> cpulimit does not build due to a lack of definition for elf_gregset_t
> which is not currently provided in the or1k musl-libc port. While this
> is being worked on, disable the build for or1k and musl-libc.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Fixes: 9e8e80d1e335 ("package: Add cpulimit")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cpulimit/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
> index 7cab152fc0ea..cca74afc9955 100644
> --- a/package/cpulimit/Config.in
> +++ b/package/cpulimit/Config.in
> @@ -1,7 +1,12 @@
> +comment "cpulimit needs a toolchain w/ threads, does not build open openrisc with musl"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || (BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
> +
>   config BR2_PACKAGE_CPULIMIT
>   	bool "cpulimit"
>   	depends on BR2_USE_MMU # fork()
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
>   	help
>   	  Cpulimit is a tool which limits the CPU usage of a process
>   	  (expressed in percentage, not in CPU time)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
