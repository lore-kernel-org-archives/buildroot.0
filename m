Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567A5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D229C40598;
	Thu, 10 Mar 2022 20:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6UY9j1ggBTR; Thu, 10 Mar 2022 20:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A64440192;
	Thu, 10 Mar 2022 20:44:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B91FD1BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B57EA41674
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_vCNQyLRQ5d for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:44:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5D6441588
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:44:41 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qt6so14691153ejb.11
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NfDOJ9JG5QdkBVq0xM9mx7s6AmZ9AH0OTihrlqzfVRM=;
 b=P7s2imaLNnT0ulK/zFXkoaY7Zr6W3RCYLrWTUNcAbiKVWfU+MIis3I37bxhruDKG9x
 RgKT46P5pF+Qf5piaKI7b9AoVUXO2QD5SEHmdGMQBlpvhi7PojdELF2oopNO8CRtkgn8
 CllBk+AOK2cjEoA1igNUBC4Vo2e/M5STaQLvz7z8xh7JzQ75o1x00MmXmJhHsM3xEZpY
 Qu8xu61lj1om93k2kDRvDS/yNAujwdcaobS26KsY7qvfn9bmRdV8e41lkXi1yV6/xB1y
 UFq4z4qFSlgbOyEy3ibSM45iHEZSrCPz2ug2QrTo1PhQlCVUUmN5ATRg9XKtnTEH2scB
 Z6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NfDOJ9JG5QdkBVq0xM9mx7s6AmZ9AH0OTihrlqzfVRM=;
 b=KB2n/Vy5p5TZGlZTQKfwSRPk+PtRce+CdwY+nkMF6D7VKTITY4BIU4ZBTK61iA3iVj
 SDLSwyN67F3jbCcq/n8CXtuDJhZkr70AdLlj2FPm/wFg1UNzQGk8WrvsL3DM8huLrgLH
 AZdVkEYV3/sFjDoVsrB7EgiGNfG/tnsF70H1afYHtkCaj2MiONTtR+nu9R/fuUI8Ed92
 MpvyCXgWl5IN+y5ROTUOhAZNM+MNslRsouiTaoM7sDTdBxFSFwmBEQAN1sPSS8dC1OKj
 eZRtkRuX/renB82rodEWDhHHKObHM8VHkTWT3y1bujjxinsQUO0Y4tXHk45wCf5RPa8e
 Wr6g==
X-Gm-Message-State: AOAM530wU33XaOeFaZVn8Hiydh13cuOgl1zn3T8Eu6FqIwNgblN1bTT9
 H9SAAb9T/1rw30fBrrlybSvUGFCMtbq0lA==
X-Google-Smtp-Source: ABdhPJwWFT5Npi9Kz15V+/AYcB6cg204WTqRbAc9PfUOjhbqxU3AxaeI7L2Q4z5jcp92nUFpGYPvHQ==
X-Received: by 2002:a17:907:3f10:b0:6da:818d:4525 with SMTP id
 hq16-20020a1709073f1000b006da818d4525mr5690604ejc.47.1646945079838; 
 Thu, 10 Mar 2022 12:44:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056402280d00b00416d2f2b8a1sm50729ede.79.2022.03.10.12.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:44:39 -0800 (PST)
Message-ID: <777b2ce3-bf0a-3b3e-896a-00bc9525b65a@mind.be>
Date: Thu, 10 Mar 2022 21:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220225072622.3584480-1-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220225072622.3584480-1-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 0/6] orangepi/linksprite: convert more
 allwinner boards to extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2022 08:26, Sergey Matyukevich wrote:
> Hi all,
> 
> Recently extlinux infrastructure has been added for  orangepi boards by
> Sergey Kuzminov: see commit c0312f71cc89 ("configs/orangepi_zero_defconfig:
> switch to extlinux"). This patch series converts to extlinux some of the
> boards that I have at my disposal:
> - orangepi-zero-plus2
> - orangepi-pc-plus
> - orangepi-one
> - linksprite-pcduino
> 
> All these changes have been build- and boot- tested. Also I added
> orangepi-zero-plus2 to my list in DEVELOPERS file to keep an eye
> on its build failures.
> 
> Regards,
> Sergey

  Series applied to master, thanks.

  Regards,
  Arnout

> 
> v1 -> v2
> - add linksprite-pcduino changes
> - update commit messages according to Giulio Benetti comments
> 
> 
> Sergey Matyukevich (6):
>    board/orangepi/orangepi-zero-plus2: switch to extlinux
>    board/orangepi/orangepi-pc-plus: switch to extlinux
>    board/orangepi/orangepi-one: switch to extlinux
>    board/linksprite/pcduino: switch to extlinux
>    configs/linksprite_pcduino_defconfig: update Linux/U-Boot versions
>    DEVELOPERS: add Sergey Matyukevich for orangepi-zero-plus2
> 
>   DEVELOPERS                                    |  2 +
>   board/linksprite/pcduino/boot.cmd             |  8 ----
>   board/linksprite/pcduino/genimage.cfg         | 43 -------------------
>   board/linksprite/pcduino/post-build.sh        | 11 -----
>   board/linksprite/pcduino/post-image.sh        | 16 -------
>   board/orangepi/orangepi-one/boot.cmd          |  8 ----
>   board/orangepi/orangepi-one/genimage.cfg      | 37 ----------------
>   board/orangepi/orangepi-pc-plus/boot.cmd      |  8 ----
>   board/orangepi/orangepi-pc-plus/genimage.cfg  | 43 -------------------
>   board/orangepi/orangepi-zero-plus2/boot.cmd   |  6 ---
>   .../orangepi/orangepi-zero-plus2/genimage.cfg | 41 ------------------
>   configs/linksprite_pcduino_defconfig          | 18 ++++----
>   configs/orangepi_one_defconfig                |  9 ++--
>   configs/orangepi_pc_plus_defconfig            |  9 ++--
>   configs/orangepi_zero_plus2_defconfig         | 14 +++---
>   15 files changed, 24 insertions(+), 249 deletions(-)
>   delete mode 100644 board/linksprite/pcduino/boot.cmd
>   delete mode 100644 board/linksprite/pcduino/genimage.cfg
>   delete mode 100755 board/linksprite/pcduino/post-build.sh
>   delete mode 100755 board/linksprite/pcduino/post-image.sh
>   delete mode 100644 board/orangepi/orangepi-one/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-one/genimage.cfg
>   delete mode 100644 board/orangepi/orangepi-pc-plus/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-pc-plus/genimage.cfg
>   delete mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
