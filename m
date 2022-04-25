Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D73C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A012840B13;
	Mon, 25 Apr 2022 21:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTXDCa7rlOaL; Mon, 25 Apr 2022 21:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1AEA40B14;
	Mon, 25 Apr 2022 21:32:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 020041BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E44B460E85
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1J9u685Z4YTL for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:32:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B44A60E81
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:32:11 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id i19so490139eja.11
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/a1Hq+rP5z26qHbZyY3OeBiCgWxnsHzKmnOPZ6uK4qY=;
 b=DMb7C+YIt6cYPCNt1XoiGSUCwE5TYk0CWgroUVCzT3oRNFHtNFdVIwtxtL0BJODgoJ
 or3oS62bGVAs2ZAXbEPmZd+5C49J7MPMBE5OOsEzrr9TXPdAJ+yssH4xc8X/5ik2t1Bd
 xeIQ1ghIezti32ORv9D5tzLnbiagBlk1MDhvQRq7hU1JGEJwt6HDyhup3okxe2kP8V/+
 pT0Llv7eclmuT4UK+pQeVXyP6OVyBWPdFvb12H3o6Dkz8j+dpOTQ+HG2bjaFWJmf21dU
 OaFsG7bKCKyK9QFDYlHEPhMuKGFDtaq7jVbr7fxqhhkEJmxhJuTHWcrm+coxh6CUcunv
 kTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/a1Hq+rP5z26qHbZyY3OeBiCgWxnsHzKmnOPZ6uK4qY=;
 b=WngNSx5zfuDV1Q1I9WoJLvIVuS9lLOXBzEn94GBayhDVPfnPOLlTeMVyBbSTDpaHcF
 GWwLqrimPedA+nCS2FC+WXXGwkgMnt1GKdE/KBpPY8ZipCJRYXYFweSX+FJ6RkifWfLU
 96ITHMdw1t1WPdZSua72b+YyuKjufYjDdZAP51XVNL1XkAPBDLx3638RDNzT5ymQJ11Q
 1JycbCzeTF/1HSzvHepO2/Nxd4kYxsSmuqCtp4zKbRKKwEHmoJSEDhBlWpvqkR7f/ubJ
 h9Uh1P4YrUpyfUkXi4DPKQLcsjHSQOBrD89GumXUCMSM/OLmwpWT7qyMwjxBHaYVl8z6
 v8bw==
X-Gm-Message-State: AOAM533Sa6ch4l+v6oGDu9XJoHpAkl5GW7Wwqa3oiq9AIi6G2X2+FL0k
 eGlq2dPOSIn97ndfokJkqvr3zg==
X-Google-Smtp-Source: ABdhPJxT63k8/ufeSQji6a2OP6A8iBBlN8qnqA9Mu8iwCsuwMp3cTeph9yTtk37RoUFfsLgsI9Zkzg==
X-Received: by 2002:a17:907:7fac:b0:6ef:e068:f5aa with SMTP id
 qk44-20020a1709077fac00b006efe068f5aamr11632097ejc.238.1650922329346; 
 Mon, 25 Apr 2022 14:32:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dm11-20020a170907948b00b006cf488e72e3sm4005188ejc.25.2022.04.25.14.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:32:08 -0700 (PDT)
Message-ID: <9e61fbdb-aeb1-d493-afc2-87372d479fb7@mind.be>
Date: Mon, 25 Apr 2022 23:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424213958.1747120-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v7 1/5] package/pkg-python: migrate flit to
 new bootstrapping sequence
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 23:39, James Hilliard wrote:
> There are a number of flit toolchain dependencies currently in the
> process of deprecating distutils based fallbacks.
> 
> This will be needed in order to update tomli.
> 
> We need to migrate these to use a new bootstrap based build+install
> sequence which relies on flit's bootstrap wheel build+install
> features to build and install host-python-pypa-build and
> host-python-installer which gives us a full pep517 toolchain.
> 
> Note that one can run host-python-flit-core commands for building
> and installing itself since the package build directory is the cwd.
> 
> We need to add a special flit-bootstrap SETUP_TYPE for dependencies
> of host-python-pypa-build and host-python-installer which can not
> use the normal flit SETUP_TYPE which would cause a circular dependency
> issue.
> 
> We need to special case dependency exclusions for
> host-python-flit-core and host-python-installer to avoid circular
> dependencies in the flit-bootstrap SETUP_TYPE.
> 
> We also need to special case the installation command for
> host-python-flit-core since it can not depend on host-python-installer
> due to host-python-installer requiring host-python-flit-core.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> Changes v3 -> v4:
>    - rebase
> Changes v2 -> v3:
>    - add special flit-bootstrap SETUP_TYPE
>    - don't change package SETUP_TYPE's yet
> Changes v1 -> v2:
>    - formatting/cleanup
>    - add comments
> ---
>   package/pkg-python.mk | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 867341fc7b..2e7704a0a9 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -154,6 +154,9 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
>   	--scripts=$(HOST_DIR)/bin \
>   	--data=$(HOST_DIR)
>   
> +HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
> +	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> +
>   ################################################################################
>   # inner-python-package -- defines how the configuration, compilation
>   # and installation of a Python package should be done, implements a
> @@ -203,7 +206,7 @@ $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
>   $(2)_BASE_BUILD_CMD = setup.py build
>   $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
>   endif
> -else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> +else ifneq ($$(filter flit flit-bootstrap pep517,$$($(2)_SETUP_TYPE)),)
>   ifeq ($(4),target)
>   $(2)_BASE_ENV = $$(PKG_PYTHON_PEP517_ENV)
>   $(2)_BASE_BUILD_CMD = -m build -n -w
> @@ -211,9 +214,24 @@ $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $
>   $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
>   else
>   $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
> +# Use flit built in wheel builder for packages that are flit-bootstrap packages.
> +# This is needed to avoid a circular with host-python-pypa-build and those dependencies.
> +#
> +ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
> +$(2)_BASE_BUILD_CMD = -m flit_core.wheel
> +ifeq ($(1),host-python-flit-core)
> +# Use flit built in bootstrap_install for installing host-python-flit-core.
> +# This is due to host-python-installer depending on host-python-flit-core.
> +#
> +$(2)_BASE_INSTALL_CMD = -m bootstrap_install dist/* $$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS)
> +else
> +$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
> +endif

  I still think this is too complicated. And I'm stubborn, so I changed it and 
committed to master [1]. I've basically done two things:

- Treat flit-bootstrap as a completely separate setup type. Only the _BASE_ENV 
is exactly the same as in the other cases; the conditional flow becomes a lot 
easier to understand by making it explicit. This also allows an $(error ...) 
when it's used for a target package.

  The special-casing for flit-core I solved by using ?= and overriding it in 
python-flit-core.mk

> +else
>   $(2)_BASE_BUILD_CMD = -m build -n -w
>   $(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
>   endif
> +endif
>   else
>   $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
>   endif
> @@ -239,6 +257,12 @@ $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
>   ifeq ($$($(2)_SETUP_TYPE),flit)
>   $(2)_DEPENDENCIES += host-python-flit-core
>   endif
> +else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
> +ifneq ($$(filter host-python-flit-core host-python-installer,$(1)),)
> +$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)

  Again, too complicated for me. I just removed this conditional branch. So for 
host-python-flit-core and host-python-installer, no dependencies are added. 
host-python-flit-core in fact doesn't need any. host-python-installer has to add 
it manually.

  Regards,
  Arnout

[1] 
https://git.buildroot.org/buildroot/commit/?id=8b4f831f36cd653504f38023f909f76912730534


> +else
> +$(2)_DEPENDENCIES += host-python-flit-core host-python-installer
> +endif
>   endif # SETUP_TYPE
>   
>   # Python interpreter to use for building the package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
