Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5617C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 20:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E4B683FC7;
	Wed,  4 May 2022 20:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcttwYRldGlO; Wed,  4 May 2022 20:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4724A83FEB;
	Wed,  4 May 2022 20:00:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 294E81BF215
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23ABE40BB7
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDOse8ySSnDb for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:59:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EAC940BB9
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:59:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bv19so4919711ejb.6
 for <buildroot@buildroot.org>; Wed, 04 May 2022 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9AHRWEWGx/CwtgdvX0EpUqnRCOLIqasw+f/pAT7Uo1M=;
 b=LhKupUYDlhseHTux03OOZnwCXL4ITrAEYY+xsOe7NgNM3Lz2NGBKcCWPp/Z0D14Mky
 xm2dakT1ZXKmvQxjhRn2vrhx6CzJ/lRiliQ/QjvwAEbCskNjvb8+tC+yBzwhgn4rwUg5
 fC5YU8Yetpn+I98/VcpJOcGZ3LpFXBvSOAXKbG9Jm3npdlazhHtiL1JymeARNEgbq7tq
 3saauVgyp1Wb4tMxt0fl1giiqovYKTT2mqk/jazYUBXouGkgR9ANu0egSl6rx//MJr9h
 e3Ru1u0USLBKQNnNTvNwpsYU1ZUOM/zKLpN6uUK3S4SHn8XWYk3bevw4bUxbUEDDve62
 +2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9AHRWEWGx/CwtgdvX0EpUqnRCOLIqasw+f/pAT7Uo1M=;
 b=5xnAZd0Z4MT61z1Y37WJkJZ9oyekh3yp8sAMmq/jlYe2ywATtouoxgsy3s5/H7fpHM
 n6HsSIvVngmYd0eRVVN0PvooSsqUiwQPqmpl8J1vlniYz/RaBSQkpyRfYvrhtb2BImU2
 1b31mFbMXKwS69Wc0PsY92JyLJkBHFcJNiYDpyry1JSKh/kfIipyhbb0EscRvASGWCMs
 36/oBKWkCvV+5S/fxUNYnWZkUuXhxTYjh7HrBaPmFoUdChTu39HZg8NpyTsRavAjwM1m
 FnqpUZuc1WNJMfNCGInvi9Kg5z7yLCuKXmsN13OmE/fCD44Z+GEBUcjEQ5x/VVddmwHU
 fQVA==
X-Gm-Message-State: AOAM533Wyi1rjlU5Zl9V+Jo8BOBig31yJeLwo7iu+pT8PAUysgSWE/J4
 X2tKAd6QZ7aQvCRWM768ZeWy9g==
X-Google-Smtp-Source: ABdhPJxO7oQFp+1+cxErxf3DRrBTScL2v1Su+16E3ONE1c8RyctJ0hUROsjMePVkBpgX8fqypFRMTQ==
X-Received: by 2002:a17:906:fccc:b0:6f3:7569:77fd with SMTP id
 qx12-20020a170906fccc00b006f3756977fdmr21842357ejb.266.1651694386873; 
 Wed, 04 May 2022 12:59:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a056402029800b0042617ba63a7sm9627287edv.49.2022.05.04.12.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 12:59:46 -0700 (PDT)
Message-ID: <a4fb2225-79e2-c6b5-bcad-44cdba22d3fd@mind.be>
Date: Wed, 4 May 2022 21:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220504070700.961561-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504070700.961561-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: document flit/pep517
 python package infrastructure
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/05/2022 09:07, James Hilliard wrote:
> Note that the flit-bootstrap SETUP_TYPE is deliberately not
> documented as it is used only for bootstrapping the host pep517
> toolchain and should not be used anywhere else.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/adding-packages-directory.txt |  4 +-
>   docs/manual/adding-packages-python.txt    | 74 ++++++++++++++---------
>   2 files changed, 46 insertions(+), 32 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 749e2d43b9..04f5241d05 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -429,8 +429,8 @@ different way, using different infrastructures:
>      and xref:cmake-package-reference[reference].
>   
>   * *Makefiles for Python modules*: We have a dedicated infrastructure
> -   for Python modules that use either the +distutils+ or the
> -   +setuptools+ mechanism. We cover them through a
> +   for Python modules that use the +distutils+, +flit+, +pep517+ or
> +   +setuptools+ mechanisms. We cover them through a
>      xref:python-package-tutorial[tutorial] and a
>      xref:python-package-reference[reference].
>   
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index 0141fea85b..500967f235 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -4,8 +4,9 @@
>   === Infrastructure for Python packages
>   
>   This infrastructure applies to Python packages that use the standard
> -Python setuptools mechanism as their build system, generally
> -recognizable by the usage of a +setup.py+ script.
> +Python setuptools or pep517 mechanisms as their build system, generally
> +recognizable by the usage of a +setup.py+ script or +pyproject.toml+
> +file.
>   
>   [[python-package-tutorial]]
>   
> @@ -50,8 +51,8 @@ On line 13, we declare our dependencies, so that they are built
>   before the build process of our package starts.
>   
>   On line 14, we declare the specific Python build system being used. In
> -this case the +distutils+ Python build system is used. The two
> -supported ones are +distutils+ and +setuptools+.
> +this case the +distutils+ Python build system is used. The four
> +supported ones are +distutils+, +flit+, +pep517+ and +setuptools+.
>   
>   Finally, on line 16, we invoke the +python-package+ macro that
>   generates all the Makefile rules that actually allow the package to be
> @@ -97,11 +98,13 @@ Note that:
>   One variable specific to the Python infrastructure is mandatory:
>   
>   * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
> -  by the package. The two supported values are +distutils+ and
> -  +setuptools+. If you don't know which one is used in your package,
> -  look at the +setup.py+ file in your package source code, and see
> -  whether it imports things from the +distutils+ module or the
> -  +setuptools+ module.
> +  by the package. The four supported values are +distutils+, +flit+,
> +  +pep517+ and +setuptools+. If you don't know which one is used in
> +  your package, look at the +setup.py+ or +pyproject.toml+ file in your
> +  package source code, and see whether it imports things from the
> +  +distutils+, +flit+ module or the +setuptools+ module. If the package
> +  is using a +pyproject.toml+ file without any build-system requires
> +  and with a local in-tree backend-path one should use +pep517+.
>   
>   A few additional variables, specific to the Python infrastructure, can
>   optionally be defined, depending on the package's needs. Many of them
> @@ -109,37 +112,48 @@ are only useful in very specific cases, typical packages will
>   therefore only use a few of them, or none.
>   
>   * +PYTHON_FOO_SUBDIR+ may contain the name of a subdirectory inside the
> -  package that contains the main +setup.py+ file. This is useful,
> -  if for example, the main +setup.py+ file is not at the root of
> -  the tree extracted by the tarball. If +HOST_PYTHON_FOO_SUBDIR+ is not
> -  specified, it defaults to +PYTHON_FOO_SUBDIR+.
> +  package that contains the main +setup.py+ or +pyproject.toml+ file.
> +  This is useful, if for example, the main +setup.py+ or +pyproject.toml+
> +  file is not at the root of the tree extracted by the tarball. If
> +  +HOST_PYTHON_FOO_SUBDIR+ is not specified, it defaults to
> +  +PYTHON_FOO_SUBDIR+.
>   
>   * +PYTHON_FOO_ENV+, to specify additional environment variables to
> -  pass to the Python +setup.py+ script (for both the build and install
> -  steps). Note that the infrastructure is automatically passing
> -  several standard variables, defined in +PKG_PYTHON_DISTUTILS_ENV+
> -  (for distutils target packages), +HOST_PKG_PYTHON_DISTUTILS_ENV+
> -  (for distutils host packages), +PKG_PYTHON_SETUPTOOLS_ENV+ (for
> -  setuptools target packages) and +HOST_PKG_PYTHON_SETUPTOOLS_ENV+
> -  (for setuptools host packages).
> +  pass to the Python +setup.py+ script (for distutils/setuptools
> +  packages) or the +support/scripts/pyinstaller.py+ script (for
> +  flit/pep517 packages) for both the build and install steps. Note
> +  that the infrastructure is automatically passing several standard
> +  variables, defined in +PKG_PYTHON_DISTUTILS_ENV+ (for distutils
> +  target packages), +HOST_PKG_PYTHON_DISTUTILS_ENV+ (for distutils
> +  host packages), +PKG_PYTHON_SETUPTOOLS_ENV+ (for setuptools target
> +  packages), +HOST_PKG_PYTHON_SETUPTOOLS_ENV+ (for setuptools host
> +  packages), +PKG_PYTHON_PEP517_ENV+ (for flit/pep517 target packages)
> +  and +HOST_PKG_PYTHON_PEP517_ENV+ (for flit/pep517 host packages).
>   
>   * +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to the
> -  Python +setup.py+ script during the build step. For target distutils
> -  packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPTS+ options are already
> -  passed automatically by the infrastructure.
> +  Python +setup.py+ script during the build step, this generally only
> +  makes sense to use for distutils/setuptools based packages as
> +  flit/pep517 based packages do not pass these options to a +setup.py+
> +  script but instead pass them to +support/scripts/pyinstaller.py+.
> +  For target distutils packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPTS+
> +  options are already passed automatically by the infrastructure.
>   
>   * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
>     +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
> -  to the Python +setup.py+ script during the target installation step,
> -  the staging installation step or the host installation,
> -  respectively. Note that the infrastructure is automatically passing
> -  some options, defined in +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+
> -  or +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS+ (for target distutils
> +  to the Python +setup.py+ script (for distutils/setuptools packages)
> +  or +support/scripts/pyinstaller.py+ (for flit/pep517 packages) during
> +  the target installation step, the staging installation step or the
> +  host installation, respectively. Note that the infrastructure is
> +  automatically passing some options, defined in
> +  +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+ or
> +  +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS+ (for target distutils
>     packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS+ (for host
>     distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS+ or
>     +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS+ (for target setuptools
> -  packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
> -  setuptools packages).
> +  packages), +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
> +  setuptools packages) and +PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS+ or
> +  +PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS+ (for target flit/pep517
> +  packages).
>   
>   With the Python infrastructure, all the steps required to build and
>   install the packages are already defined, and they generally work well
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
