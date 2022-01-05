Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07DFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 22:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6498D60E44;
	Wed,  5 Jan 2022 22:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpv9sKbdKRMx; Wed,  5 Jan 2022 22:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9612C60D89;
	Wed,  5 Jan 2022 22:29:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17B681BF267
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B5B4162C
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvV-ogiD4wNN for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 22:29:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC49341620
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 22:29:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91d2:d1c6:5626:51cd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6D019780306;
 Wed,  5 Jan 2022 23:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641421761;
 bh=13FWJe3i/Fgrj7SO3exGdTsgrpfmoZMoRkP6yGb99bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eqgkBx/ZtwKOVuV1hGhIgXgjrathABrBWFR+WskLlmgzTHS/gYlS0RuzQ6LiaNqht
 4lum75AiY/bNWik8aoGBO7RjRc44nuX5zJySoJEy4qmKiHUgMGX/MEl4JxvYtFzZib
 Yy+S31AFzLXlxlXOA5r7PQc1wwpP/W/9nzZFAjbWEkQe47lCqlw35Hg+oDafexcNgk
 L/8jt1adjapU2TYRfWA597KtENToG1zcwnvEnb/VekTR14SdiZqJdBJ1+bfXFcvR5W
 QBBZx5Tod3GQqzV7nfl27/I0dn6G9jScZH353ImhT3WK+JLe5PHibFB5vpCsUs0j1n
 qtB85oKe2i9/Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 23:29:18 +0100
Date: Wed, 5 Jan 2022 23:29:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20220105222918.GK614810@scaer>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/3] package/cross-ldd: new package
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

Thierry, All,

On 2021-12-23 12:13 +0100, Thierry Bultel spake thusly:
> cross-ldd works just as ldd, but supports
> other architectures. It is needed by dracut, for instance.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> ---
[--SNIP--]
> diff --git a/package/cross-ldd/Config.in b/package/cross-ldd/Config.in
> new file mode 100644
> index 0000000000..3858fbc5fe
> --- /dev/null
> +++ b/package/cross-ldd/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_CROSS_LDD
> +	bool "cross-ldd"

I don't think this tool warrants a Kconfig entry. I.e. it should be a
blind host-only package, with no Config.in.

> +	help
> +	  ldd drop-in replacement for cross-compilation
> +	  toolchains.
> +	  This is the officially supported version mentioned
> +	  in the dracut documentation

It would have been nice to add a pointer to that documentation (I spent
quite some time look for it...). It's in: docs/README.cross

> diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
> new file mode 100644
> index 0000000000..fc0752adff
> --- /dev/null
> +++ b/package/cross-ldd/cross-ldd.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# cross-ldd
> +#
> +################################################################################
> +
> +CROSS_LDD_VERSION = 6c9c724ebd6a29c279c6e5734e44c07f067808ec
> +CROSS_LDD_SOURCE = $(CROSS_LDD_VERSION).tar.gz
> +CROSS_LDD_SITE = https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f/archive

I find it really sad that we have to use a random gist without proper
packaging or repository... :-( But I guess we don't have much options...

You are missing the license for that script:

    CROSS_LDD_LICENSE = GPL-2.0

(I should know, I wrote it! ;-) And incidentally, it is also mentioned
in the help text.)

> +# Notice that we change the name to '-ldd-cross', in order to avoid conflict
> +# with some external toolchains that implement it

-ldd-cross is still too generic. Make it really specific to buildroot, by
calling it -ldd-buildroot

> +define HOST_CROSS_LDD_INSTALL_CMDS
> +	$(SED) 's/-ldd}/-ldd-cross}'/g $(@D)/cross-compile-ldd
> +	install -D -m 755 $(@D)/cross-compile-ldd $(TARGET_CROSS)ldd-cross
> +endef

This install comand does two things:

  - modify the source script
  - install the modified script

Semantically, we want to separate actions that happen in the source tree
into one of the extract, patch, configure, or build commands.

Also, usually, we shy away from patching with sed expressions, and we
prefer actual patches.

Regards,
Yann E. MORIN.

> +
> +$(eval $(host-generic-package))
> -- 
> 2.25.1
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
