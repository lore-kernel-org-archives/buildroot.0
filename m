Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0C7C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B724086C;
	Sat, 29 Jul 2023 20:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B724086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHyAW-fu9Tv6; Sat, 29 Jul 2023 20:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0996740893;
	Sat, 29 Jul 2023 20:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0996740893
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 757C21BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4576C40BC9
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4576C40BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjvDBEQZNLFr for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:37:56 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF886404B9
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF886404B9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c5ce:3d4d:976d:f60a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8E18513F8AA;
 Sat, 29 Jul 2023 22:37:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 29 Jul 2023 22:37:49 +0200
Date: Sat, 29 Jul 2023 22:37:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230729203749.GA421096@scaer>
References: <20230729154615.559891-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230729154615.559891-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690663072;
 bh=RPHxq/yNz7klpsOuYdZPj5h8NNYZ4TPebYN5wiCEruk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UiM/oFz6X/53y3S+BUlD/vthlpNfLuyz3AbhTPqkNV7FAZTFPqx4S0dvLu75Wkrhm
 o3DzB1M+vtp4HXnG6W3yxS6ENLMLSEGct5Q5wGL693yO5/4iNU3G+o6PwDJEE1ED+j
 kiyldYVD+YSGd0w8Oyx6uN33ub3jIxy+SWnt+IxLoSRfFpXHgAyPHm8Uji1vCQGzYJ
 JZdQwptNVpAN9JU0S4Kc/JHZJ9vns69YVYhrQNp8RfhuE5pK4pmtOjEBv5ZhBDRjvM
 JcrkLr4rC0VtDbyfRm3uqGWlakptLutVZyWybtBTzpG1Xzx2YNdjCe1pPZXLIvQm67
 eEdG4Lco4Stgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UiM/oFz6
Subject: Re: [Buildroot] [PATCH 1/1] package/libglu: bump version to 9.0.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-07-29 17:46 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2023-July/000725.html
> 
> Upstream dropped autoconf, switch to meson.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

But see below, please.

> ---
[--SNIP--]
> diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
> index 8820e75d8b..b30187884a 100644
> --- a/package/libglu/libglu.mk
> +++ b/package/libglu/libglu.mk
> @@ -4,12 +4,13 @@
>  #
>  ################################################################################
>  
> -LIBGLU_VERSION = 9.0.2
> +LIBGLU_VERSION = 9.0.3
>  LIBGLU_SITE = https://mesa.freedesktop.org/archive/glu
>  LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.xz
>  LIBGLU_LICENSE = SGI-B-2.0
>  LIBGLU_LICENSE_FILES = include/GL/glu.h

There's been a recent discussion about using source file as license
files, and it turns out that this is generally a bad idea overall,
because it does not allow to easily apply patches from a global
patch-dir, and makes it a bit more complex to also add a patch in
Buildroot:

    https://lore.kernel.org/buildroot/20230727125123.927568-1-herve.codina@bootlin.com/T/#u

So, it would be nice if you could update libglu to use a post-extract
hook to generate a license file, something like;

    LIBGLU_LICENSE_FILES = LICENSE.br-extracted

    define LIBGLU_EXTRA_LICENSE
        awk '
            BEGIN { doprint=1; }
            doprint == 1 { print; }
            $0 ~ /\*\// { doprint = 0; }
        ' "$(@S)/include/GL/glu.h \
        > $(@D)/LICENSE.br-extracted
    endef
    LIBGLU_POST_EXTRACT_HOOKS += LIBGLU_EXTRA_LICENSE

Could you see into it, please?

Regards,
Yann E. MORIN.

>  LIBGLU_INSTALL_STAGING = YES
>  LIBGLU_DEPENDENCIES = libgl host-pkgconf
> +LIBGLU_CONF_OPTS = -Dgl_provider=gl
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
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
