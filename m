Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F0DC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B8F740925;
	Mon, 22 Aug 2022 09:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B8F740925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nG9ZYSqUsR0u; Mon, 22 Aug 2022 09:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3778D4048D;
	Mon, 22 Aug 2022 09:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3778D4048D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED6551BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C87FA4048D
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C87FA4048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1G_C_azFqjXO for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:56:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78296400D2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78296400D2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:56:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 38C2160145;
 Mon, 22 Aug 2022 11:55:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 11:55:55 +0200
Date: Mon, 22 Aug 2022 11:55:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220822095555.GZ2167049@scaer>
References: <20220822075418.903230-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822075418.903230-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661162160;
 bh=Oe68ioWxpeaQ4lulJDUCUOqc2R7IfUfBflYVedvlBvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E2GsGnpNnHk0opYA63Vh52VxZr7jRmCtnxB9JUsuyUzvoaopKkrrOviyt8Zbrdw++
 ZNM05aLeT9Iw5up0WrONb3pzx8niQvUA8p7rWd0Y+17bZj6u/u/KoyKdPU6rDc97th
 eGcSQXKEjwqCEyifj4+aZ2YUMcWqVT7aR+GPIWXkrAKDKMEnrXyuDimlj1I0VcmDL7
 DdffBYFi6jpNFN7Yy7KLM8Z2ttc5QsJJUpLtC7qlWMcvbFCD/GLrvxou9pRmHyN+wO
 Fq/i1O8SA+ke6V3rsMRX21vdtmBLWSvCExGVBibltWngWp1jGXzPijpk/HiIuc/47c
 ckIhBAHcHxRng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E2GsGnpN
Subject: Re: [Buildroot] [PATCH v3 1/2] package/pkg-python: use
 pyinstaller.py for host python packages
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-08-22 01:54 -0600, James Hilliard spake thusly:
> The python installer cli isn't able to overwrite files of packages
> that already exist, this causes problems when doing a rebuild or
> update without a full clean.
> 
> Since we need to add functionality to our pyinstaller.py script to fix
> this issue we must also use pyinstaller.py for host python packages.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - set interpreter to $(HOST_DIR)/bin/python
> ---
>  package/pkg-python.mk          | 12 ++++++++++--
>  support/scripts/pyinstaller.py |  0
>  2 files changed, 10 insertions(+), 2 deletions(-)
>  mode change 100755 => 100644 support/scripts/pyinstaller.py
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 5794e3a195..c15a168f60 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -139,6 +139,14 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>  HOST_PKG_PYTHON_PEP517_ENV = \
>  	$(HOST_PKG_PYTHON_ENV)
>  
> +HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> +	--interpreter=$(HOST_DIR)/bin/python \
> +	--script-kind=posix \
> +	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(HOST_DIR)/bin \
> +	--data=$(HOST_DIR)
> +
>  HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
>  	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
>  
> @@ -200,7 +208,7 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
>  else
>  $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
>  $(2)_BASE_BUILD_CMD = -m build -n -w
> -$(2)_BASE_INSTALL_CMD = -m installer dist/*
> +$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
>  endif
>  else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
>  ifeq ($(4),target)
> @@ -208,7 +216,7 @@ $$(error flit-bootstrap setup type only supported for host packages)
>  else
>  $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
>  $(2)_BASE_BUILD_CMD = -m flit_core.wheel
> -$(2)_BASE_INSTALL_CMD ?= -m installer dist/*
> +$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
>  endif
>  else
>  $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
> diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
> old mode 100755
> new mode 100644
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
