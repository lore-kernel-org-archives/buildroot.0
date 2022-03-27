Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04127C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C8BA60E2E;
	Sun, 27 Mar 2022 15:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8E_w006PHdTE; Sun, 27 Mar 2022 15:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB3A6068D;
	Sun, 27 Mar 2022 15:36:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A212C1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E2A96068D
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEVf3yfqMKaq for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:36:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9D14605E3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:36:49 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bg10so23997425ejb.4
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DxP4vUguII60nxd2YDckdSLmcXgk2j8PjQNVjwtBf+M=;
 b=VFKJnZDuD4x+5KoeBhrY9kPcypp7HITyFzBqFpYMHxR1STKT/enr7nDOh4U3xWrwQX
 hVjYIx8SNpWn10iNUVLI9N4wf/sugVFAETfG6DA972qTfMiBb7ojIphF76vee07paUm0
 yRmScZLbwsXzsAI505ku9yayiOXx5MZCZuNca09jz72El5F4iZTRY04ntXz8Bfpk8yKX
 iwPZDaqegz6kjeYDG5IVyujW5kUY9YpAoEshmueaQfuyFNVeal8Uju5GkI1rgpjTDx03
 Q1x3OzIQfyIJv7UP+ja0WN7Ubu0FWcY7hpbT+2/rYOU8fXViuW8HBwJGK02heFo+Ewmn
 jqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DxP4vUguII60nxd2YDckdSLmcXgk2j8PjQNVjwtBf+M=;
 b=u51OxGX0rqgBupp76v9MCpDsn0sSuR0kXew1AnIE6XG7FLwog5zsxVetu0xUyno5tE
 6XNIZFV3NKHnuANAaoFH4TsbwTt+oq8/T8EzGNqT1yatp90C42lLM98J4swaAgtEUMxb
 BAwoPXEyjaq9TZ0cnHMngh03FyLt7PUq4f0/kIKKvA3q1pZTAHtsIYOhrV+hbnHDCgj6
 JjHH7GglFCfZuXbVDiztHrH4XZbClsbo1HUd8wcwsaj+AynYp3mfdHkAyrmZ9l9RQdh6
 3fB75ELkFYvxe3TfnG6PWczKUxBtto/5XZdTskrdenhfXVbJ6mzZe229m6ATwvdRkFZe
 zJ0A==
X-Gm-Message-State: AOAM533jhz8GHHlbJkEq56BvXWXd/uLY7LZLeppslTfLNEU0ZCs2T1Me
 XJ4MOb2PXx84QCvumiyMusuCoA==
X-Google-Smtp-Source: ABdhPJyF/yrLpTLZYkRxh1AZAPQCGY6bUswKI7I1KvsuhfWweFVaMu/H8ZycwaMDVZRYClO3O/qG4A==
X-Received: by 2002:a17:907:961f:b0:6db:c8f3:dc72 with SMTP id
 gb31-20020a170907961f00b006dbc8f3dc72mr22380705ejc.92.1648395408072; 
 Sun, 27 Mar 2022 08:36:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a50bf4d000000b00410d407da2esm5931655edk.13.2022.03.27.08.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:36:47 -0700 (PDT)
Message-ID: <41c83efd-fef0-2462-befa-de14a47dc5e7@mind.be>
Date: Sun, 27 Mar 2022 17:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Yair Ben-Avraham <yairba@protonmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <m8NCoWfElcFVVs6rJ5aCIPGaUztk0BOtLtImkjPWh0hVSsTMeKi8UxpeX71YI_AuRCYpynLSeSrBZ6avQPcmu9iqPseHAKLKLSzRq2_0lx8=@protonmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <m8NCoWfElcFVVs6rJ5aCIPGaUztk0BOtLtImkjPWh0hVSsTMeKi8UxpeX71YI_AuRCYpynLSeSrBZ6avQPcmu9iqPseHAKLKLSzRq2_0lx8=@protonmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: bump version to 3.2.0
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



On 18/03/2022 10:03, Yair Ben-Avraham via buildroot wrote:
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tpm2-tss/tpm2-tss.hash | 2 +-
>   package/tpm2-tss/tpm2-tss.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
> index b6eb3c1f97..db6b3b7ad0 100644
> --- a/package/tpm2-tss/tpm2-tss.hash
> +++ b/package/tpm2-tss/tpm2-tss.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8  tpm2-tss-3.1.0.tar.gz
> +sha256  48305e4144dcf6d10f3b25b7bccf0189fd2d1186feafd8cd68c6b17ecf0d7912  tpm2-tss-3.2.0.tar.gz
>   sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 060883c377..568ac35c8f 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
> 
> -TPM2_TSS_VERSION = 3.1.0
> +TPM2_TSS_VERSION = 3.2.0
>   TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>   TPM2_TSS_LICENSE = BSD-2-Clause
>   TPM2_TSS_LICENSE_FILES = LICENSE
> --
> 2.30.2
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
