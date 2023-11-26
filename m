Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BEEC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 17:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 310DD60BBB;
	Sun, 26 Nov 2023 17:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 310DD60BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajQ4qZHTcs8p; Sun, 26 Nov 2023 17:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7269460BB5;
	Sun, 26 Nov 2023 17:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7269460BB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5C21BF28A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5792160BB5
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5792160BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vf9A4jFzWSxr for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 17:12:34 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FEE6606F5
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 17:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEE6606F5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6BAC078034E;
 Sun, 26 Nov 2023 18:12:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 18:12:28 +0100
Date: Sun, 26 Nov 2023 18:12:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231126171228.GZ3177259@scaer>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
 <20231125081052.881728-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231125081052.881728-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701018752;
 bh=jeYPjKtUiqVjSxBIptvGMFf/0eiPUwa5iRuf8Y0952w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DKYxa8mge45nHo5Xe+ghztqIhnou5dA0tkplrCyE2zD+Vc2dKbjqbyf1/rzVWWSWT
 PhR52LAZmDcDhABSK+yeYi8URDTUWhJCRmgqFdy/YRI6nuO8gD3zrPi0pmY0ntotMa
 jWAY7GWKb8H8ZZmSI2A82r1FUPyxEGJzlv5sCGfLhcs+MKzMqcHn4hg2n2v0y+fqaf
 SRxg2i0SnnZjqSJEmSc1o5/zh9WdohFiDldVS0UIMSVlux6kvkdwJDUYY9F6mTCf1B
 9+MWwIX2SpPPDXJeK+CIQznGkU7gbslSrWgT0776WuSzIh2uFbojhTTBQYUhPtjI2S
 De0vgI51tbQwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DKYxa8mg
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

Applied to next, after exapnding the commit log with a summary of your
explanations, thanks!

Regards,
Yann E. MORIN.

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
> +	  Core validation logic for pydantic written in rust.
> +
> +	  https://github.com/pydantic/pydantic-core
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
> new file mode 100644
> index 0000000000..4927d816be
> --- /dev/null
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated after vendoring
> +sha256  b54296f8317e7ffd72726836636aa3a6c8c977d8f73b68253c443c0fe3731064  pydantic_core-2.14.5.tar.gz
> +# Locally computed sha256 checksums
> +sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
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
