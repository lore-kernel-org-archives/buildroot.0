Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5425FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F269082468;
	Sat, 12 Mar 2022 17:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWMFzg0QhXwj; Sat, 12 Mar 2022 17:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C4F82451;
	Sat, 12 Mar 2022 17:06:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9A7A1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B902140867
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtSTPGVLHmB5 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8984940866
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:06:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bi12so25461606ejb.3
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lnWIFO2jBWPiyCimxZj3PN9RnOr4bdUDqp2d/hwELHc=;
 b=grVW1LsD4AyRrYv/lqX1QZiEpaVSG9iQ89bRnpqwSBC3xd0uAPfAFGYVmnfTdV0xz2
 84xtFN00RSCgTn/npqNREgZ6QZ87iPbvFN45QEAm4Y4wbi8GvB8FRW3fJI6Qi1g3rEFZ
 4eC8hbZs9cHURWVnHqcOZzKheZBBkIgj7uIni9nVw6YEAnzqsq7bzv+h43ZiTTNYw3SU
 +NKXY+MmmMAFp05IIANMLoVMTj2oO90N9dGrytM2RkimwmhvdAZeFlutdTUc9x5qsk6t
 oaoaDDR9+/3TDkfBfJ3CqZ6J68OkaBaPSfCh9u43c0KFUhe1Mi2A+ZcDnwNIVwG6nK+h
 VYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lnWIFO2jBWPiyCimxZj3PN9RnOr4bdUDqp2d/hwELHc=;
 b=DJ7MYE40GWQGP8rHSloJ/48OGXsk+D5Sc/PocwDrUQMFCj/54Nx5wgw4K0EmqFC1rQ
 cI8q9UN2HyrAQyBfg0Dpyhtbp0iYSz6XyifkiWiUyEKjGQtrUejwJwonm+ykVLTYHg8I
 FVqCnH0XF5Y6mZaPHWKMpnLFBskg6NwE0wfNo60hIUcL5JFd/MExVsbcA+nxm3GKe6wV
 3rPf/8aNBAflowb6AkM55mAuYzMd5yQxRun/VdgnboTdbFm9BiR6Pkdr9RHc61AykJuI
 bvWIBnH9w3aCB+FR0HYucdS73Nxp3RxWgKRT/xbX83NdIwW9+GxLM17gP0uIcvykY/Y6
 sSqg==
X-Gm-Message-State: AOAM532FTvdliEagFu//tDgx/5Sxoj+tEaomvGlfljEwt6Y+5P64rhPs
 WriQvpCZqewGjSljuA/jKbGS3g==
X-Google-Smtp-Source: ABdhPJwOSENG4uS9+rfQB6sj8pHU5OPlkUXaSGQzviKZPe949QBlUB5Trziu8BAHuCQ3SxvHgqi2aw==
X-Received: by 2002:a17:907:7f1d:b0:6da:74b1:fd65 with SMTP id
 qf29-20020a1709077f1d00b006da74b1fd65mr13392809ejc.72.1647104813742; 
 Sat, 12 Mar 2022 09:06:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a1709062a5700b006ccd8fdc300sm4465546eje.180.2022.03.12.09.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:06:53 -0800 (PST)
Message-ID: <31e94ffd-6814-e528-29d8-e140bf95bb55@mind.be>
Date: Sat, 12 Mar 2022 18:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220222113326.2608582-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222113326.2608582-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/python-can: bump to version 4.0.0
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



On 22/02/2022 12:33, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-can/python-can.hash | 2 +-
>   package/python-can/python-can.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
> index 5330e5899c..91b685cc17 100644
> --- a/package/python-can/python-can.hash
> +++ b/package/python-can/python-can.hash
> @@ -1,4 +1,4 @@
>   # sha256 from https://pypi.org/pypi/python-can
> -sha256	2d3c223b7adc4dd46ce258d4a33b7e0dbb6c339e002faa40ee4a69d5fdce9449  python-can-3.3.4.tar.gz
> +sha256	59d92846ffb981e634e9e0f2d14a6b4967a875e3869bd2ba168c92c4db6b8b5d  python-can-4.0.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
> diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
> index 1ab813e2c9..9284a9cf99 100644
> --- a/package/python-can/python-can.mk
> +++ b/package/python-can/python-can.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_CAN_VERSION = 3.3.4
> -PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/97/dd/5e5ae96db41ba57dde127e0600c3d324239ed692e167296c5fdb992cbf41
> +PYTHON_CAN_VERSION = 4.0.0
> +PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/1f/f7/a643cba269d59e108fe4c1854a8e71d5cdadadd4de1b9c8862b190171122
>   PYTHON_CAN_SETUP_TYPE = setuptools
>   PYTHON_CAN_LICENSE = LGPL-3.0
>   PYTHON_CAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
