Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC2DC4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 15:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1760E414C5;
	Sat, 25 Nov 2023 15:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1760E414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iz0DvuJ_ocIM; Sat, 25 Nov 2023 15:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAFA41834;
	Sat, 25 Nov 2023 15:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAFA41834
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE241BF423
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D786F403BE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D786F403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKPMDnlbTJcF for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 15:36:17 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 013E1400C6
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 15:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 013E1400C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9E57013F81D;
 Sat, 25 Nov 2023 16:36:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 16:36:09 +0100
Date: Sat, 25 Nov 2023 16:36:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231125153609.GJ3177259@scaer>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
 <20231125081052.881728-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231125081052.881728-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700926574;
 bh=OVVD5TSSc+9MKyaZEGzSUqvDH5pghgGBKlaGJiGySso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ng7iFW7jzLa1zeWnneZU8W5LA/Za5mR5/qPkMq9dFZxetuUIwyPynFxWSYBur+Rsd
 qVLAhaOx9/5+JMU1Af7K7SX6zgSC8UrDreLUzsfLexOT+7CKOhnkkJycZXydfCV+D8
 3AbCCweBiLwhmquuMTgv3HH5bUKemv2rbNWi8pw40hNyylFo721T7+NavVbSGNTOJ8
 nOzvh82ECK9rZQMUuXW4fZ+cEOVILyeihGqa8EF5IBNIFrxeJvPo8ps5S2wbgJ3jty
 2/FgpcRMiDA/ZP1a4LoKHpDu4oYgmzTl+/EjLnp848K9XMQ0K0X9KlkSuXL03Z9JKp
 wPy945O1Sugww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ng7iFW7j
Subject: Re: [Buildroot] [PATCH 2/3] package/python-pydantic-core: new
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-11-25 01:10 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                 |  1 +
>  package/python-pydantic-core/Config.in            |  8 ++++++++
>  .../python-pydantic-core.hash                     |  4 ++++
>  .../python-pydantic-core/python-pydantic-core.mk  | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-pydantic-core/Config.in
>  create mode 100644 package/python-pydantic-core/python-pydantic-core.hash
>  create mode 100644 package/python-pydantic-core/python-pydantic-core.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 68e6e29a4d..fcc09b07c4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1228,6 +1228,7 @@ menu "External python modules"
>  	source "package/python-pycups/Config.in"
>  	source "package/python-pydal/Config.in"
>  	source "package/python-pydantic/Config.in"
> +	source "package/python-pydantic-core/Config.in"
>  	source "package/python-pydevmem/Config.in"
>  	source "package/python-pydyf/Config.in"
>  	source "package/python-pyelftools/Config.in"
> diff --git a/package/python-pydantic-core/Config.in b/package/python-pydantic-core/Config.in
> new file mode 100644
> index 0000000000..3eeb1844a2
> --- /dev/null
> +++ b/package/python-pydantic-core/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PYDANTIC_CORE
> +	bool "python-pydantic-core"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> +	help

So what happens if I apply this patch, which adds pydantic-core, but I
do not apply the next one, which bumps pydantic, so we end up in a
situation with an old pydantic, with the new core also installed?

Do the two conflict, or is it an OK situation (obviously the
pydantic-core would be of little use)?

If there is a conflict, then we will want to introduce the new package
at the same time we do the bump, and that should be explained int he
commit log.

If there is no conflict, then just say, we can ammend the commit log
accordignly.

> +	  Core validation logic for pydantic written in rust.

As it is written in rust, I was wondering... [0]

[--SNIP--]
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
> new file mode 100644
> index 0000000000..8b61323ab3
> --- /dev/null
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pydantic-core
> +#
> +################################################################################
> +
> +PYTHON_PYDANTIC_CORE_VERSION = 2.14.5
> +PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> +PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245
> +PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
> +PYTHON_PYDANTIC_CORE_LICENSE = MIT
> +PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
> +PYTHON_PYDANTIC_CORE_DEPENDENCIES = host-python-typing-extensions

[0] ... why there was dependency on the rust toolchain.

So I looked at the manual [1] to check the maturin setup type, but... It
is *not* documented (although I seem to remember I already asked that it
be, I can't find that mail, so let's say this is the first time I bring
up the subject...)

So I had to look at the code, and see that the rust toolchain is
automatically added when the setup type is maturin.

As I had no idea that maturin was explicitly about python-packages-
written-in-rust, the dependency on rust was not obvious to me... :-/

Could you please extend the manual to descrbe the additional setup types
that are currently supported by Buildroot, please?

[1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packages

Regards,
Yann E. MORIN.

> +
> +$(eval $(python-package))
> -- 
> 2.34.1
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
