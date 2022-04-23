Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C864DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63D5E40AAC;
	Sat, 23 Apr 2022 16:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXqE_f4uGjK3; Sat, 23 Apr 2022 16:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57ACF404A3;
	Sat, 23 Apr 2022 16:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A73E1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68ABF41925
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiqdBmDTTzvQ for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:28:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42DD7417CA
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:28:03 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id g13so21861140ejb.4
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Bp1zmsIF91iO7VVm5tI3xVmGS+TKCrcW4W0s15ptdQM=;
 b=Gh0E1glbbJLhntbJwv2Nw3KZJ0HQ3PeHXuiGwQ6Uokj/1x+WLDDj1CYByp37t9DFgC
 8hOi6aiA3XnsL4ft8ihidIfzp0JSWoOxP9kb0gSrHa3xqc5GyI5MW1KyBQdUrarIE8E8
 FfN0bZO7BBTGCqfTmscZ4mnAfGitn32NtgH0plzxhrXbnxHojmasFRUO8UY9XOlODCr2
 sq9Z8zpfblT5AV0WPRAWx44qZ7YI2fyk0iHh/VPUqb/NrcreX3gmKdapemh2t5UGniS6
 TdDEILkS718Bpr6tcgnkxcSwxeiGYVh8iPCBzuzpIe2adty/+HhrHg847sAQbm6FZpPC
 HBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Bp1zmsIF91iO7VVm5tI3xVmGS+TKCrcW4W0s15ptdQM=;
 b=xbwmST0o5hotKtk7PEpuf+BvfL9HOMynqLvl0VLaevju05Uo3ZnKvrJDWykCdpgnvP
 2gFV/vMcMyS5njHdsSSevpEzX61+GeqxfJuUvem25+p/6ZNTgyiX/ZGQubirED7FLEdP
 L5tpGf7HinF3FzEyEuu48+b0AzpF2vw3ktf40gusLrgjMVJ+FTalNd223vcb9QQKyxgn
 ynDGanlm6PuO+X0I0Lty3A4ovYk/h8xEBRqmxlA0AHL78Uu346EZoxDjnaUGDsfBdugB
 TilHZrDWSioBfTQg+ai6MubMg9vNV8DmBQ37q6EeCUOMLd5weBH8YMOiroLcPwKPLd+l
 2CCg==
X-Gm-Message-State: AOAM531OBbsl0S88FMRwQ3dXEZieL6vF28zYPPdldyrobdD9Lbe31uec
 sQkSjS5xwq+qmowpuz6vE/K+umkiBD04YQ==
X-Google-Smtp-Source: ABdhPJwcg7tuToRoHaeSPWk+7rk5fuQirnkhCJzTOMnOF2kWl8DeXhLCCK+wNdT9l4LWlUL/6vT96A==
X-Received: by 2002:a17:907:6d27:b0:6f0:c67:c0bc with SMTP id
 sa39-20020a1709076d2700b006f00c67c0bcmr8823814ejc.432.1650731281485; 
 Sat, 23 Apr 2022 09:28:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a1709063c5600b006e8a8a48baesm1798859ejg.99.2022.04.23.09.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:28:01 -0700 (PDT)
Message-ID: <430efc4e-c0e5-e2a6-e540-4849d0628cbf@mind.be>
Date: Sat, 23 Apr 2022 18:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220420203720.1002314-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420203720.1002314-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.2.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/04/2022 22:37, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
>   package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
> index 6bb42d918c..ae3a3463a5 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.hash
> +++ b/package/python-setuptools-rust/python-setuptools-rust.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
> -md5  479fcd267ff48929bec9a7270e1a96d7  setuptools-rust-1.1.2.tar.gz
> -sha256  a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1  setuptools-rust-1.1.2.tar.gz
> +md5  50c85a5d19ebb7985dc548c76a3bcc25  setuptools-rust-1.2.0.tar.gz
> +sha256  0a4ada479e8c7e3d8bd7cb56e1a29acc2b2bb98c2325051b0cdcb57d7f056de8  setuptools-rust-1.2.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
> index 394789b056..c2d8c6d9a7 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.mk
> +++ b/package/python-setuptools-rust/python-setuptools-rust.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_RUST_VERSION = 1.1.2
> +PYTHON_SETUPTOOLS_RUST_VERSION = 1.2.0
>   PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a
> +PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/4e/02/2fc4c83b4f816fdd30f38c0c4837a322d21967f953bb9a51bce91b4511f6
>   PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
>   PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
>   PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
