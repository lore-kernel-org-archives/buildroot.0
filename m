Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5FFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FB183F80;
	Fri, 13 May 2022 22:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQU1OuIP5nlW; Fri, 13 May 2022 22:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A14BE828B3;
	Fri, 13 May 2022 22:09:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCFE1BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AFF560AC1
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X07Sco1gZNj9 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:09:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29B6860806
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:09:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id k27so11471806edk.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZqoTZD/RBz9McHwqP4JisYEpWJ/1pZTWZaY4ptpGBLo=;
 b=Ynx43K8M9hx6a7iRxQTUyI/GJL83LCWo592MJVm6kljMQfrlTKIEUrcTsT9joe9bhW
 yvbptG8RzQCZIZknBj73J1ExtXDf5tRNIv/ycs80u7DoNCmulsVs+IOaOh1NB4REWB8b
 FBWYiUKxil4A0Vjb5sECmMgkPA4ISfLmv1riukZkhG5WF8X3BlI+AekEvZJhlvCNhoBD
 U07YAMmQ5cYLY84qG84W+gFf/dVLtW1RVoh76g1aZlpVWSaKlubx2+xcvzdd/Y/+KxHZ
 kwywqjAviQBcw34MhDTASShFoVdBTSWzj7v/7okmxckdjfkMuapBvHcBU1sIC45j4qNC
 E+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZqoTZD/RBz9McHwqP4JisYEpWJ/1pZTWZaY4ptpGBLo=;
 b=QUbmPJ0uZevlWoItFR7Uh5S1OjCdObxAKUxvrP6O6sE8Nn/V+OjOdNki9tMOh2bGn+
 51YUizPcs51SM6Hc+gEYQulW3yr+413jgH/xG5nevrFKJj2G72PZ14eLZePlumtCX8CL
 LYnMT2jhVCGY81OH5PE7BIRi8FDPUDHpHDCwqpn4UHz0hdvJjdVpphA6O4CRK1zdqkpV
 w1AcZjMba/FrCLT6D2gpGF3vT8B2um+T7ihJnB3eTQtmppZbK9SmhrRO3ACe2iqVITjU
 5RIz3EjpyDBzNHYZEI3Jh3i0VW7FY9N3QcsOq3vQpdsH8w4L4r1Ckovd5+j0s9Xw03ka
 EjOQ==
X-Gm-Message-State: AOAM530SwFqZ8WZn8n5uyiYZMwcavGGX92KnTCKMziOWk7cr1cpWzPNI
 cyMjQWv0PBPWQ6KQcmeZ39b+AQ==
X-Google-Smtp-Source: ABdhPJybhsNZXoBcP3mLNO8V6uv+45xXXNWgeKdr3w4DIH9GCGKvMCZks/MRlXe/PJkVfTfXr8rJEg==
X-Received: by 2002:a05:6402:51d2:b0:428:48d0:5d05 with SMTP id
 r18-20020a05640251d200b0042848d05d05mr811966edd.28.1652479753291; 
 Fri, 13 May 2022 15:09:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a170906749000b006f3ef214debsm1139510ejl.81.2022.05.13.15.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:09:12 -0700 (PDT)
Message-ID: <375348cb-70ba-dff8-e72f-b0974126de77@mind.be>
Date: Sat, 14 May 2022 00:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509010917.1485280-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509010917.1485280-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-python: add setup.cfg-only
 setuptools project support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2022 03:09, James Hilliard wrote:
> Some projects have been removing their setup.py shims under the
> assumption that they are not needed due to setuptools being usable
> via pep517, however this is not actually the case as it is not
> possible to bootstrap setuptools without setup.py style builds as
> setuptools has a dependency on wheel when being used via pep517
> which is itself not installable via pep517 as that would create a
> dependency cycle between wheel and setuptools(which means wheel
> itself must use a legacy setup.py build/installation for itself).

  I found this explanation a bit confusing, but I *think* you're saying "We 
can't simply always use the 'from setuptools import setup' approach".

  Anyway, applied both to master, thanks.

  Regards,
  Arnout

> 
> In addition our pep517 toolchain itself requires setuptools for
> building/installing dependencies, although it would appear these
> dependencies will eventually move to flit. Until this is resolved
> we must use setup.py style builds for setuptools packages.
> 
> Since it is not yet possible to convert setup.py based setuptools
> builds to pep517 based setuptools builds we simply need to execute
> the setuptools shim code directly if the setup.py file is missing.
> 
> See:
> https://setuptools.pypa.io/en/latest/setuptools.html#setup-cfg-only-projects
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/pkg-python.mk | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 452fa0d3ea..5794e3a195 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -86,6 +86,9 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
>   	$(PKG_PYTHON_ENV) \
>   	SETUPTOOLS_USE_DISTUTILS=stdlib
>   
> +PKG_PYTHON_SETUPTOOLS_CMD = \
> +	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
> +
>   PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--prefix=/usr \
> @@ -180,13 +183,13 @@ endif
>   else ifeq ($$($(2)_SETUP_TYPE),setuptools)
>   ifeq ($(4),target)
>   $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
> -$(2)_BASE_BUILD_CMD = setup.py build
> -$(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
> -$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
> +$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
> +$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
> +$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
>   else
>   $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
> -$(2)_BASE_BUILD_CMD = setup.py build
> -$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
> +$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
> +$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
>   endif
>   else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
>   ifeq ($(4),target)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
