Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4151DC47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AFA40981;
	Mon, 29 Jan 2024 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57AFA40981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g_clxyXQwWJX; Mon, 29 Jan 2024 20:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8A0F40949;
	Mon, 29 Jan 2024 20:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8A0F40949
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6F11BF287
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D427403B3
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D427403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUDpuCWU-UHW for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 20:59:03 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0283440025
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 20:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0283440025
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B1EE313F838;
 Mon, 29 Jan 2024 21:58:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Jan 2024 21:58:57 +0100
Date: Mon, 29 Jan 2024 21:58:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: gsmecher@threespeedlogic.com
Message-ID: <ZbgRkbFtZf-COmmZ@landeda>
References: <ZbgJAacXmCx1x_kT@landeda>
 <20240129204032.1980414-1-gsmecher@threespeedlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129204032.1980414-1-gsmecher@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706561940;
 bh=8H42TkFl/LA/KVWaYLOMadcHY8bFOlUQgadxg4D57EI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKdrpc1d9yCBAPlFbX0mOvtl2aKID5RgQS8bNpq2KIlT03imRflkZvv2RSwLhAH2V
 H+Kd3raQh3KxbJh18jbiwbhKriMsvVG9qIct/zY8JCTVo8rDOYbtVP9Ss0n9q7iMiw
 aak/gFY0OPy/M4MjiWi1vYmOT3DVBqnoJ6xwN1MU9gRU2NX/AAkmDdgEcjyFZSvRA3
 sOMj5iUJuUsiCeku24nkLgOs7v2KNyAnsMsHdqPhWumczXu5Qh5dqHYYN1sZK+mdvx
 nYfewhOL/3V4yEDRuERQn4VF1CwzWQbTVgKynn96tlG2u8BKaTwScupx5nkctmTSqC
 K36MYWYEeMOkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fKdrpc1d
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Graeme, All,

+James

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
> 
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

Good commit log, but there is a missing piece to it, see below...

James: as far as I understand, this was the situation before the bump to
1.25.0 and the switch to meson, because we did not have the BLAS=None
and LAPACK=None options before that either, but had no such failure
report.

So I guess the defaults changed with the switch to meson, which might
explain why we did not notice before?

If so, we need to add that info to the commit log, to decide whether
this needs backporting to 2023.11, and what to do about 2023.02 LTS that
does not have 1.25.

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
