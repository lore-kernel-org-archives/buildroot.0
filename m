Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8905CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC1060C02;
	Sun, 13 Feb 2022 15:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xde1XF7hcvIP; Sun, 13 Feb 2022 15:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7640260BF1;
	Sun, 13 Feb 2022 15:32:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD201BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E96781656
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24P0wOk20Q0R for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:30:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16135815CA
 for <buildroot@busybox.net>; Sun, 13 Feb 2022 15:30:32 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a8so32624889ejc.8
 for <buildroot@busybox.net>; Sun, 13 Feb 2022 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=UwIaBzIyyr0AvNWx+8K38FBZSJXo5cUz6C8kNKSZRo8=;
 b=EgLj+G+m93QAUodMxWogMUF2CLivN1bHiDs0ErfT9i5PQ/sm1L9lzV+EC5FXtUfvxf
 91ot7iMOXGKlGG/IXM8GJBX0zE25gSb0vqMRsO1K/Wi+BuZfse2OQalEMpVP9OyLNgiu
 wBolqagzt+U+5lZZ5X37UeShAcwUbpwEWbagNqeSt3yT5LlfyKcKao6LiTLXAN3OJoIy
 CnbvitkCiqHVJ5jNq7IFUVtieFcHypcxzMYAY9KFiO3KmtsUK1ReIS/8c5B+DchEb32h
 Lc3j6Tt7jiKTWEqV2M5ZsNUx1sgqFsS7QxWpOF7YWRp+klOOuO4MNNi62ZjFa3aXbqjS
 /xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UwIaBzIyyr0AvNWx+8K38FBZSJXo5cUz6C8kNKSZRo8=;
 b=U9nXGrTeimPhRYTWrcb89c9FDYY66bKVltBQnxefEG/eZ+ye5r+ee+PtrjHcAzdh6c
 KW83Mp4yshxOefi5abK+dV8QlEhZhZnd9EqZVHjtZJEeEiZhLn/XcEdj4C8ajif1SVNV
 VbWbUDEGYQoF+MPTfDIAXjmUYI3O33YpeyzWk0WqJNrChQ4blcd4Oisv2bdH1DR37Zf0
 WR2bB7Xvx/FFOSHW40akTCdfPzz7iv5c+IWvHu/hY0jVjyihvYSMpCBuQLZxOW64VAQT
 W3kjyMN1iLc86aW4T9esH0OI3hbZEIaaJ0hFgYeDKJTZBINXDvywg00pxW9KO6vTM3HS
 rehg==
X-Gm-Message-State: AOAM532Uh+7fXHTlyrwU2ABeF2TClw4bXWKLCRa/hFHLUkdD4R891Re6
 uB4vf7VFJ09H8fGU8xYs6zR0KA==
X-Google-Smtp-Source: ABdhPJw0QFe4ixYAK83A1rSQ8da75G8hivgcbPhfq7t2bjji3T0bo7YdQXCNBh1pHvt20GhSSgkLlw==
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr7825243ejc.89.1644766230180; 
 Sun, 13 Feb 2022 07:30:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e18sm14235016edj.85.2022.02.13.07.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:30:29 -0800 (PST)
Message-ID: <d3e2c1da-fe84-26d1-179c-60e12a9cb37c@mind.be>
Date: Sun, 13 Feb 2022 16:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220207120946.1553618-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220207120946.1553618-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/libbsd: bump to version 0.11.5
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



On 07/02/2022 13:09, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/libbsd/libbsd.hash | 8 +++++---
>   package/libbsd/libbsd.mk   | 2 +-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
> index 17bb32e01..435ea5470 100644
> --- a/package/libbsd/libbsd.hash
> +++ b/package/libbsd/libbsd.hash
> @@ -1,3 +1,5 @@
> -# From https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html
> -sha512  a7015ea1ffa3766b1a4690526a25231898ad8275149b31fb6801082450172249997c36165626d101ffce53b59767a46676eebc0806426922fe4e773a0376c1f5  libbsd-0.11.3.tar.xz
> -sha256  ff2fdeeb0fe8bcb9045fe91d69e8312a5b477c54db48dffe34dd1c0d730c5864  COPYING
> +# From https://lists.freedesktop.org/archives/libbsd/2022-January/000322.html
> +sha512  c52c19eddd53630aca14f9f6221f7b84aa9cc798b4bb91e867822b161793313aab872ac1c0350d29312a72fee6e2061f3910ff918b724ec171d8c9de5837c841  libbsd-0.11.5.tar.xz
> +
> +# License files (locally computed)
> +sha256  3761714adb9c45fa588b77b372d6e75dcc9e6822cc2d6baa712007241aec714e  COPYING

  Please explain in the commit message why the license hash changed, and if 
necessary, update _LICENSE. There's a reason we have these hashes, you know.

  Patch marked as Changes Requested.

  Regards,
  Arnout

> diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
> index 86df8a97a..0654bef82 100644
> --- a/package/libbsd/libbsd.mk
> +++ b/package/libbsd/libbsd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBBSD_VERSION = 0.11.3
> +LIBBSD_VERSION = 0.11.5
>   LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
>   LIBBSD_SITE = https://libbsd.freedesktop.org/releases
>   LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
