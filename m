Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0067C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DA4542A92;
	Mon,  8 May 2023 19:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA4542A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHJ4_aVOAQP7; Mon,  8 May 2023 19:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A7D941D28;
	Mon,  8 May 2023 19:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A7D941D28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F40781BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDE466FF70
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE466FF70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZPgcv7aC4kN for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:22:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C005C60DED
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C005C60DED
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:22:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 093412005A6;
 Mon,  8 May 2023 21:22:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 21:22:02 +0200
Date: Mon, 8 May 2023 21:22:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230508192202.GF252090@scaer>
References: <20230508054134.570140-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508054134.570140-1-marcus.folkesson@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683573726;
 bh=hTim6d5j/4wTzJwxw8K/Cuwn0/EkSaimeVTZM2gRQN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvsJw4FdsAcHkHVU2AFNSDTrXW71bqUoR881/ZcL8uS6PxjNrZAthZnSdv1JuPoYF
 TlumA+yhLoRQtivKVaUlWwqMa4lijjzAKFDDQYPAFUhPxGhW0X5N6t/0yoaoPX6oX1
 cKH5ILUIqPkFd8zActsxRxP2q+0dWMdUcr4L7StTbiXdx+BWq4InyZ0JtsMCMEzSOq
 oKyB7ud8WZRoE9P2GhxoNT0k0XJZprM68Jk28SjJ8v7Ttlb7QiLPbfvsS+dKz3q9Sj
 RdfcOx+dZdoXfVtI48xjYcG6m+uZV836kFUALMV7N8/HMfWXVelyKPl2TJhJSOFkHD
 LfhTYVeB+JKmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LvsJw4Fd
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to version 0.0.5
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2023-05-08 07:41 +0200, Marcus Folkesson spake thusly:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index ea204aee98..01505aa02e 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  13e53b33652b16454264b6eff0a6f032aa9331f919b07b6d0e622917ed7f7dd8  libcamera-v0.0.4-br1.tar.gz
> +sha256  0cad66dc09520dddd47510603e053cc9913dc968db4cebe2ac5ddd43fd08fef6  libcamera-v0.0.5-br1.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 01c4cb2ff2..2e30077e20 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = v0.0.4
> +LIBCAMERA_VERSION = v0.0.5
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>  	host-openssl \
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
