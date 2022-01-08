Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1CFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6CEE81450;
	Sat,  8 Jan 2022 23:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgUBt4Cv2bE1; Sat,  8 Jan 2022 23:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E54BA814B8;
	Sat,  8 Jan 2022 23:18:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7974B1BF27E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 681134028F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FhFsuRQSMdsy for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:18:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B1DB4056A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:18:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CBE3913F80A;
 Sun,  9 Jan 2022 00:17:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641683878;
 bh=5S4Lep0kTI2FPW5XHcnMPMbadXqrLbWNLety+ssPjFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iixj1yupySwX/5NeXLpT+pc8FRRXVu8mtFfrwcWytd98TXG4gp+Sc2QSs6mJGhMEf
 kl7w9U76EMOTzxonoMeTg1my1XyAgd2S/7p+kEsqauBoNXth+4489rrvADle2Z74+n
 fdwZlG9VWmFdFkj+t9BOPnSPvdEkYAXDf63O5j74qUquGnmAsqEyVcexYBI7qPISa4
 tLfht4x3rhsqWTDBX8G+42M9Y48h9Vh/36Lm35SOqztOfFtfni5O5FZ83BZMuIGL0b
 0Tby6U2Xm/huz16huZ8jMTzbaAwSWBjp9vpvNYhhIc24JI6wTPAUnt9J6BklblFktO
 QuhuuhUxTwRVQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 00:17:54 +0100
Date: Sun, 9 Jan 2022 00:17:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108231754.GI1881783@scaer>
References: <20220108223829.3701891-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108223829.3701891-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/libmd: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-08 23:38 +0100, Fabrice Fontaine spake thusly:
> This library provides message digest functions found on BSD systems
> either on their libc (NetBSD, OpenBSD) or libmd (FreeBSD, DragonflyBSD,
> macOS, Solaris) libraries and lacking on others like GNU systems.
> 
> https://www.hadrons.org/software/libmd/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 2 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/libmd/Config.in  |  9 +++++++++
>  package/libmd/libmd.hash |  5 +++++
>  package/libmd/libmd.mk   | 14 ++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/libmd/Config.in
>  create mode 100644 package/libmd/libmd.hash
>  create mode 100644 package/libmd/libmd.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cb06de820d..c1ccab966c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -899,6 +899,7 @@ F:	package/libidn2/
>  F:	package/libjpeg/
>  F:	package/liblockfile/
>  F:	package/libmatroska/
> +F:	package/libmd/
>  F:	package/libmpdclient/
>  F:	package/libnetfilter_conntrack/
>  F:	package/libnetfilter_queue/
> diff --git a/package/Config.in b/package/Config.in
> index ad542ac8bc..d8ee96a588 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1412,6 +1412,7 @@ menu "Crypto"
>  	source "package/libgpgme/Config.in"
>  	source "package/libkcapi/Config.in"
>  	source "package/libksba/Config.in"
> +	source "package/libmd/Config.in"
>  	source "package/libmhash/Config.in"
>  	source "package/libnss/Config.in"
>  	source "package/libolm/Config.in"
> diff --git a/package/libmd/Config.in b/package/libmd/Config.in
> new file mode 100644
> index 0000000000..63139ad69b
> --- /dev/null
> +++ b/package/libmd/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBMD
> +	bool "libmd"
> +	help
> +	  This library provides message digest functions found on BSD
> +	  systems either on their libc (NetBSD, OpenBSD) or libmd
> +	  (FreeBSD, DragonflyBSD, macOS, Solaris) libraries and lacking
> +	  on others like GNU systems.
> +
> +	  https://www.hadrons.org/software/libmd/
> diff --git a/package/libmd/libmd.hash b/package/libmd/libmd.hash
> new file mode 100644
> index 0000000000..1a3c9d80df
> --- /dev/null
> +++ b/package/libmd/libmd.hash
> @@ -0,0 +1,5 @@
> +# From https://lists.freedesktop.org/archives/libbsd/2021-October/000311.html
> +sha512  731553ecc5e0e1eb228cced8fccd531fe31fb5c7627ca30013d287e1aeb8222959cf7498fbb7414bbabb967b25d4e8b0edd54fc47f6ccf55fc91087db0725ce3  libmd-1.0.4.tar.xz
> +
> +# Hash for license file
> +sha256  4365ef6255ad553fce69dd4bc0e093472c5d0e41b8ea493a545cc926ce171aa6  COPYING
> diff --git a/package/libmd/libmd.mk b/package/libmd/libmd.mk
> new file mode 100644
> index 0000000000..19a2458982
> --- /dev/null
> +++ b/package/libmd/libmd.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libmd
> +#
> +################################################################################
> +
> +LIBMD_VERSION = 1.0.4
> +LIBMD_SOURCE = libmd-$(LIBMD_VERSION).tar.xz
> +LIBMD_SITE = https://archive.hadrons.org/software/libmd
> +LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, Public Domain
> +LIBMD_LICENSE_FILES = COPYING
> +LIBMD_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.34.1
> 

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
