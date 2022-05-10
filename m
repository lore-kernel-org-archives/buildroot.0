Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2675C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 12:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84B38405E3;
	Tue, 10 May 2022 12:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSAffHMn9dSp; Tue, 10 May 2022 12:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D37940144;
	Tue, 10 May 2022 12:19:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CBC41BF255
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 12:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 142F7823CB
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 12:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 731eM80wHDXX for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 12:19:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4DCE8239A
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:19:21 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id i20so18320920ion.0
 for <buildroot@buildroot.org>; Tue, 10 May 2022 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jem2BYXQvr30nTE3Aqb9q54qGVZ2gOl7VrnuiUUBuMM=;
 b=I+PJlMbf5y6wVfydkwqiiI3LTRG98U7ph5tepSIvhRzh3gnOqYVbNut9KWp3SAy5iV
 k7vmPUeaUxuyDl3ULpwnO3p/FQGz8PphPZNuvIgQ74fo744eXG0mnCPsmLIDtiv5b7L4
 v7L1t5z5fYIn+I5Rz719KhVY1kWiHq4hwLbYGByRsrtRiQXPxIkj3gVOO8Syy0D5hDm8
 huJcEievCmIOKRtV2eeO7bNaE9ahWvbLgK1MHhyQ03EVkjJWcZIJGuhRBSl4ePu942TA
 hs6wqhOYd5AWMd6g6u6qwRu9DdKesZpJ5CtgdAadIeeCW5Uk4mHC0GvulKy2QdVRu/az
 Y7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jem2BYXQvr30nTE3Aqb9q54qGVZ2gOl7VrnuiUUBuMM=;
 b=v+UvuskFxf1hACJo1oDdwRJYVU77UPNoV9/0vc2mwbZKdR8mHUeO6HSm5B0yi0uFJB
 QzIjIROtWXc29c/0r6uoq8WWky0dVWLfxbMQbdchh04GKpLCwlJjvCAgz5LtQBh9Bwm9
 dGtnfCYQoM91TQ57t8YADpmfJzBQgWxXL1GzjdxueJFjayAvWFYSEVwyduNLLGqORUl8
 b4JWek3utUBWLc2824+BXBjg84OT4sHgdRqJNnEee7STvPJyGn3VRoN1XICy/RuXFiRe
 Gt5FCvPNEsZu+VhcLdkRSYsoViLQOvrZUB8qW0dPwZpdn2RsYCSGBGMsxBTe/YD2RYNX
 Xo8g==
X-Gm-Message-State: AOAM532x3llAbEq1PH8wHJHk3St1VAEYSo0k7iHI6X6HELaO5Lr6XJhw
 tG/cMVifJIaDs8ngR1FiLfIX9qMOmdwXRX+FkhU=
X-Google-Smtp-Source: ABdhPJzugdgxqYpaIrhJ1RJoHOK0gNRPOm+gz0K9Vn8wwR8rq817q93lg8IeHNnzkukfNE+Vq79ev2xVYrSJ7KBYiCI=
X-Received: by 2002:a05:6638:1446:b0:32b:75b9:7ff8 with SMTP id
 l6-20020a056638144600b0032b75b97ff8mr9790228jad.242.1652185160716; Tue, 10
 May 2022 05:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220509010917.1485280-1-james.hilliard1@gmail.com>
In-Reply-To: <20220509010917.1485280-1-james.hilliard1@gmail.com>
Date: Tue, 10 May 2022 14:15:43 +0200
Message-ID: <CAGm1_kvp1rHf-=KNEP+Qwy=WjK5imi51D8YzfC61ToWORwuy_w@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Mon, May 9, 2022 at 3:09 AM James Hilliard <james.hilliard1@gmail.com> wrote:
>
> Some projects have been removing their setup.py shims under the
> assumption that they are not needed due to setuptools being usable
> via pep517, however this is not actually the case as it is not
> possible to bootstrap setuptools without setup.py style builds as
> setuptools has a dependency on wheel when being used via pep517
> which is itself not installable via pep517 as that would create a
> dependency cycle between wheel and setuptools(which means wheel
> itself must use a legacy setup.py build/installation for itself).
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

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

Regards,
Yegor

> ---
>  package/pkg-python.mk | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 452fa0d3ea..5794e3a195 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -86,6 +86,9 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
>         $(PKG_PYTHON_ENV) \
>         SETUPTOOLS_USE_DISTUTILS=stdlib
>
> +PKG_PYTHON_SETUPTOOLS_CMD = \
> +       $(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
> +
>  PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>         --install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>         --prefix=/usr \
> @@ -180,13 +183,13 @@ endif
>  else ifeq ($$($(2)_SETUP_TYPE),setuptools)
>  ifeq ($(4),target)
>  $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
> -$(2)_BASE_BUILD_CMD = setup.py build
> -$(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
> -$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
> +$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
> +$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
> +$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
>  else
>  $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
> -$(2)_BASE_BUILD_CMD = setup.py build
> -$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
> +$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
> +$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
>  endif
>  else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
>  ifeq ($(4),target)
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
