Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784C44059D;
	Sun,  1 May 2022 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mK9lEYxQj6ev; Sun,  1 May 2022 20:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E9A1403B7;
	Sun,  1 May 2022 20:13:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA08D1BF311
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 20:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9301583E76
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 20:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oD5JuCF3QA5F for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 20:13:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78ECB83E74
 for <buildroot@buildroot.org>; Sun,  1 May 2022 20:13:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9448:1aca:a169:bea6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A4CD27802B2;
 Sun,  1 May 2022 22:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651436028;
 bh=3Gm34TtfvSdyRsKLzGTKZ+eIqxCmSnjgJsHutHW2g6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3Fs3e+HEoSNFxwssF2Malx1F+aL4Zx5UgDKQHzmRqW6FhzGGcZgKXPKJJ+RIUkEk
 DD8yaiVMUEJhBx3QDmtuR4digyXQocyx5/2J9uLG0h9c+KCP9phDTiQeZS37Ixajwp
 hx+F67fwtudi2X0X94H0atHfT7eWd+t5bQQO/yFoJ0oY+Em63SJASxgmAOrjUQAyzc
 vpCIOouTBQAkmuTIPZNcMcLJUj8SuuNSrSKHDnGn99UGvq/V1jymPzb+mF7OWwn2Y/
 x5/glQroa4zOgVtAJKvVgbnu6WN6LgF9PV8NMT5npLli1LmXUFGufrhr/eBICZokfT
 yRsQ3TUhM8L0Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 May 2022 22:13:44 +0200
Date: Sun, 1 May 2022 22:13:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220501201344.GS3624965@scaer>
References: <20220501074401.1135229-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501074401.1135229-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/2] package/pkg-python: add
 setuptools-rust infrastructure
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-05-01 01:44 -0600, James Hilliard spake thusly:
> The setuptools-rust package infrastructure is essentially a variant
> of the setuptools package infrastructure which sets up the env
> and download hooks required for building setuptools-rust packages.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

First, thanks a lot for working on this topic; this is greatly
appreciated.

However, I believe this one is going a bit too far, at least for now.
Indeed, in Buildroot, we try to wait for until we have a few examples
of a specific package type before we add infrastructure support for it.
Usually, that rounds at about 5-ish packages.

For now, we have a single python package that is partly written in rust,
and it is not very complex, so we can live with it for now, and it
serves as a pretty good example of what is needed.

However, what I am afraid of, is that even non-python packages may end
having parts of them written in rust, and so maybe we would need a more
generic solution, with something that's be used like $(kernel-module)
or just with variables...

Until we have more such examples, then it is hard to be sure that a new
type of python packages is ther good approach or not.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 46 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index b86e12423f..a9bb12550c 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -110,6 +110,24 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>  	--root=/ \
>  	--single-version-externally-managed
>  
> +# Target setuptools-rust-based packages
> +PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
> +	$(PKG_PYTHON_SETUPTOOLS_ENV) \
> +	$(PKG_CARGO_ENV) \
> +	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> +
> +PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
> +	$(PKG_CARGO_ENV)
> +
> +# Host setuptools-rust-based packages
> +HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
> +	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> +	$(HOST_PKG_CARGO_ENV) \
> +	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> +
> +HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
> +	$(HOST_PKG_CARGO_ENV)
> +
>  # Target pep517-based packages
>  PKG_PYTHON_PEP517_ENV = \
>  	$(PKG_PYTHON_ENV)
> @@ -177,14 +195,30 @@ $(2)_BASE_BUILD_CMD   = setup.py build
>  $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
>  endif
>  # Setuptools
> -else ifeq ($$($(2)_SETUP_TYPE),setuptools)
> +else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
>  ifeq ($(4),target)
> +ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> +$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
> +$(2)_DL_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
> +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
> +else
>  $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
> +endif
>  $(2)_BASE_BUILD_CMD = setup.py build
>  $(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
>  $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
>  else
> +ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> +$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
> +$(2)_DL_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
> +ifndef $(2)_CARGO_MANIFEST_PATH
> +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(3)_CARGO_MANIFEST_PATH)
> +else
> +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
> +endif
> +else
>  $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
> +endif
>  $(2)_BASE_BUILD_CMD = setup.py build
>  $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
>  endif
> @@ -208,7 +242,7 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
>  $(2)_BASE_INSTALL_CMD ?= -m installer dist/*
>  endif
>  else
> -$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
> +$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
>  endif
>  
>  # Target packages need both the python interpreter on the target (for
> @@ -225,8 +259,14 @@ endif # ($(4),target)
>  # Setuptools based packages will need setuptools for the host Python
>  # interpreter (both host and target).
>  #
> -ifeq ($$($(2)_SETUP_TYPE),setuptools)
> +ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
>  $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
> +ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> +$(2)_DEPENDENCIES += host-python-setuptools-rust host-rustc
> +# We need to vendor the Cargo crates at download time
> +$(2)_DOWNLOAD_POST_PROCESS = cargo
> +$(2)_DOWNLOAD_DEPENDENCIES = host-rustc
> +endif
>  else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
>  $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
>  ifeq ($$($(2)_SETUP_TYPE),flit)
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
