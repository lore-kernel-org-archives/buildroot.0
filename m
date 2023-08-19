Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECEBEE49A3
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 14:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CA083BE2;
	Sat, 19 Aug 2023 14:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CA083BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_sOytVgONo6; Sat, 19 Aug 2023 14:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C613183BF4;
	Sat, 19 Aug 2023 14:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C613183BF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 980341BF36F
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71C4F4152D
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71C4F4152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnLQaWK1yjPJ for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 14:52:03 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0FD6414C3
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 14:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0FD6414C3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 07F2620039E;
 Sat, 19 Aug 2023 16:51:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Aug 2023 16:51:55 +0200
Date: Sat, 19 Aug 2023 16:51:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230819145155.GC1778688@scaer>
References: <20230722073533.3072853-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230722073533.3072853-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692456720;
 bh=UhrEuqhlGmg53kESdmDInGjPcV4Gm4zRa+yCEHdoHQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WZmcgQHf1wirTguCP8t54TF/U7MpGd8DyMe+Bne5fkHcNFND/VK2ac8uWWcSCjQMh
 1WpFwbmzkYpMcrxUHYkV4R+yx1eDMHADhGuOTGSWFiBFhbfAgv3jgB198To+sRYS2N
 zacOZJ6hsc2+g1VFMmIALGBCJ2NRzBM+GuLxdmu24P0EMMM2OFbcWdMN7F1508YFfE
 tHqKAbg2Mj2OfUdm0YGXnNZUARgfBWysZPyYnyNYCBeNSs/GW9RaU1YeHEZSo0f/pZ
 LiHKBWZWFOHeGvfKXpaxprcyZchrgdmbsHOqT7UIH85tTVPTXCzbApPnq6ExPsuj2u
 pv96pa6n0JHaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WZmcgQHf
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.2.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

+James who previously looked at a lot of meson changes

On 2023-07-22 09:35 +0200, Bernd Kuhls spake thusly:
> Release notes: https://mesonbuild.com/Release-notes-for-1-2-0.html

Unfortunately, we've had to revert this change, as it caused unforeseen
breakage that is not easily fixed.

Specifically, the way the library search paths are forced into the link
step for native builds, like we've seen in host-qemu.

So, let's try to bump later, when we can have a better understanding on
why the change was made and how we can fix it.

One lead could be to udnerstand why some libs are linked by full apth
while others are linked by name:

    /path/to/host/lib/libgio-2.0.so -L /path/to/host/lib/ -lgmodule-2.0

So, if you or James could look into that and take the matter with
upstream as a follow up to Romain's and others' reports [0] [1], that
would be awesome.

[0] https://github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566
[1] https://github.com/mesonbuild/meson/issues/12140

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index cb36b674fa..02fa1535ef 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
> -sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/1.2.0/meson-1.2.0.tar.gz.asc
> +sha256  1c0b634fe6b6a7072e398647f1bf392048577068a5c92ae44d04085dab0ded6f  meson-1.2.0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 503aca8c25..8eabe108c4 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MESON_VERSION = 1.1.1
> +MESON_VERSION = 1.2.0
>  MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>  MESON_LICENSE = Apache-2.0
>  MESON_LICENSE_FILES = COPYING
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
