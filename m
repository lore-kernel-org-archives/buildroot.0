Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D040C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0840A40162;
	Mon,  5 Feb 2024 18:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0840A40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiHoVDLmRfmu; Mon,  5 Feb 2024 18:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C5584018B;
	Mon,  5 Feb 2024 18:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C5584018B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD9E1BF379
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41D481E38
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41D481E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IC8FsYQOzLgg for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:04:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D7A981E33
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D7A981E33
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 267BD13F8D7;
 Mon,  5 Feb 2024 19:04:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 19:04:30 +0100
Date: Mon, 5 Feb 2024 19:04:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: gsmecher@threespeedlogic.com
Message-ID: <ZcEjLpAWFjQuYCWc@landeda>
References: <20240129204032.1980414-1-gsmecher@threespeedlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129204032.1980414-1-gsmecher@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707156274;
 bh=f/PtKzunLqqtJfbGweQVN9reayTYG0CeeGEnJSJ4ndk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lu1zcycL/lTzsPfClBt/a/w8OviDEk1nlUs4McgFywGHqIfRW1pCGo86wox+4ddFW
 gFW9IvBWjdibKJRpHzjInSdUAIWc8C8Vm0lNHhCcVDOd6NX1c/HXGcBaijcnaBGl5k
 4x4zsW8uLeaAbv0oxCvyZk70Jfq07sioVnT3IIx+hRLxtKHRBkSJKwvS8wxL5wrJu4
 jOK0VxC1sP9eHmzGgwIzCEtzYtbRnPQ4NXS/P88c0pHzydkJvR9VpbD2W5ODjMB68r
 sKrju+X0Y008JlPW/aLi7Lfvn8CmR0ZuUYDLpE6kcNKAaj33M4J1hUvh+SVVn4VaIK
 96s4E68+NJvGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lu1zcycL
Subject: Re: [Buildroot] [PATCH] host-python-numpy: correct implied
 host-lapack/host-blas dependency.
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Graeme, All,

On 2024-01-29 12:40 -0800, gsmecher@threespeedlogic.com spake thusly:
> From: Graeme Smecher <gsmecher@threespeedlogic.com>
> 
> Before this patch, host-python-numpy attempted (and failed) to detect
> OpenBLAS as follows:
> 
>     buildroot$ make
>     >>> host-python-numpy 1.25.0 Configuring
>     [...]
>     Run-time dependency openblas found: NO (tried pkgconfig and cmake)
>     WARNING: CMake Toolchain: Failed to determine CMake compilers state
>     Run-time dependency openblas found: YES 0.3.21
>     Dependency openblas found: YES 0.3.21 (cached)
>     Program _build_utils/process_src_template.py found: YES (/path/to/buildroot/output/host/bin/python3 /path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/process_src_template.py)
>     Program _build_utils/tempita.py found: YES (/path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/tempita.py)
> 
>     output/build/host-python-numpy-1.25.0/numpy/meson.build:201:44: ERROR: Could not get cmake variable and no default provided for <CMakeDependency OpenBLAS: True None>
>     [...]

So I dug in the Numpy git history, and before we bumped to 1.25, it was
using distutils, which would only warn and disable BLAS support if not
found, but the meson switch made the default to fail.

> Two obvious ways to correct this:
> 
> - Add some kind of host-lapack / host-openblas dependency to
>   host-python-numpy, or
> - Tell host-python-numpy not to look for (or rely on) external code.
> 
> Because the host numpy environment shouldn't be doing any numerical
> heavy lifting, we opt for the latter here.
> 
> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>

Applied to master, with an extended commit log about the history,
thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-numpy/python-numpy.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index b52e0da17d..cc5dfc9224 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -36,6 +36,10 @@ else
>  PYTHON_NUMPY_CONF_OPTS += -Dblas=""
>  endif
>  
> +# Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
> +# in-tree code.
> +HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
> +
>  # Fixup the npymath.ini prefix path with actual target staging area where
>  # numpy core was built. Without this, target builds using numpy distutils
>  # extensions like python-scipy, python-numba cannot find -lnpymath since
> -- 
> 2.39.2
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
