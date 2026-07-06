Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9453BC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 08:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F3A6063A;
	Mon,  6 Jul 2026 08:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssBrRGFjBYGL; Mon,  6 Jul 2026 08:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D8076066D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783325736;
	bh=hvSMwX/fPw9Y/ltQPrNYkR9UEolUmJbOCZPoLu726RU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZCw5Hs95G1oLa5Sc+NciL7AtLXS2odMPUlW78gJ8pvqV4kRaiO2z/4EA4S3bbKSVd
	 HAUl1ItYVOpvxs9305CX6GAo58aKUrHOqVcZ9gHOndZILNY5nqv7hoOwoWJZkzwC4w
	 0MRJKxr0Pds95OGuzpcIz4egLAIb2HVAawHKIJguTdXLOqim953fVJj9e9dHTmCQec
	 y0FSwFLcJIA2NI380P63LEXHOaRgGlQs1zR8uR7WVqHOap4aZ5TjLCrTQxODgtSssr
	 DZPDOKzwRC3Q2L2+THJvmlhacXS5HvcVN3CAeaws1IhVtoIPPNtaFs+6++q7uk3dVH
	 ktr5yhyd/DSLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D8076066D;
	Mon,  6 Jul 2026 08:15:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BDF7316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41E70400A6
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-hZHqSziSjq for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 08:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E6CE40093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E6CE40093
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E6CE40093
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:15:32 +0000 (UTC)
Received: from L30177.local (unknown [213.36.132.10])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EC8B9B00563;
 Mon,  6 Jul 2026 10:15:28 +0200 (CEST)
Date: Mon, 6 Jul 2026 10:15:27 +0200
To: Philippe Nunes <nunes.philippe@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aktkH6d2PPTgO3XE@L30177.local>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260701121937.346945-4-nunes.philippe@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701121937.346945-4-nunes.philippe@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783325730;
 bh=rYx0UPHQTDwqFOaBmUvTyJqXe8GtUb9MINNZ1G6q5ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=seEOktlq3JcrUV1b9vmzvyLQrZbiBK+EeeA2EktAXry6Vs5MN9yXz+OSCn/4ctXjt
 hWlKaT4Gv3OXDkCjQQL+RXC2kHOlSJAk5d/Sn6ff9sWPHOwO115U43e0Bsf4Y/uP5t
 Kg4z2bDCbWrtMNAVp2tqIVRcRC7oPEdYxZ+RRM/Y50COKvkgRWQmiArk/v8tv1FHbq
 6FXlRHsDIsTCNbg6wYzTJGyOuIe7z1oV65yfWVIzxOICV2RtGd9HskabqufbhAQmC9
 chDQaEZSMNGcfkyBv23vCEAXspnPcmiOrYE2o24JPZUQBTvjOeupe+hmRnX8f9OGJK
 kAEFG1/C/LLPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=seEOktlq
Subject: Re: [Buildroot] [PATCH 3/3] package/qoriq-rcw-c: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Philippe,

Thanks for leading a Buildroot package on this tool.

See below some few comments,

Le 01/07/26 14:19, Philippe Nunes via buildroot a =E9crit :
> qoriq-rcw-c is a C reimplementation of NXP's rcw.py CLI for the
> pbiformat=3D2 QorIQ family (LS1028, LS1088, LS2088, LX2160). Built on
> top of libqoriq-rcw, it compiles a .rcw source file (preprocessed
> in-process via libmcpp) to the binary RCW + PBI image consumed by
> the SoC bootrom.
> =

> Beyond the rcw.py reference, qoriq-rcw-c adds two recovery features:
> =

>   --dump        read the live RCW from /dev/mem on a running board
>                 (post-PLL-lock RCWSR state; no PBI commands)
>   --dump-flash  recover the PBL preamble + PBI commands from the
>                 bootrom slot(s) in NOR / SD / eMMC

Right, but it means that the tool has to be compiled and run on the target,
not the host only.

> +++ b/package/qoriq-rcw-c/Config.in.host
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_HOST_QORIQ_RCW_C
> +	bool "host qoriq-rcw-c (C implementation)"
> +	select BR2_PACKAGE_HOST_LIBQORIQ_RCW
> +	help
> +	  C CLI built on top of libqoriq-rcw -- a faster drop-in
> +	  replacement for NXP's rcw.py for the pbiformat=3D2 SoC family
> +	  (LS1028, LS1088, LS2088, LX2160).

The main benefit (aka faster) to that it avoid pulling/compiling
a full python framework for the host mode, so we get a quick build.

> +
> +	  Adds two capabilities beyond rcw.py:
> +	    --dump          read live RCW from /dev/mem on a running
> +	                    board (post-PLL-lock RCWSR state, no PBI)
> +	    --dump-flash    recover PBL + PBI from the bootrom slot(s)
> +	                    in NOR / SD / eMMC

No, those options are not for the host. Moreover, the Config.in does
not need to detail all the runtime options.

> +# The upstream project is named "qoriq-rcw"; the "-c" suffix in the
> +# Buildroot package name distinguishes it from the existing
> +# host-qoriq-rcw package (which wraps NXP's rcw.py reference).

No need to duplicaate many time the same information.

> +QORIQ_RCW_C_VERSION =3D 1.0.1
> +QORIQ_RCW_C_SITE =3D $(call github,vjardin,qoriq-rcw,v$(QORIQ_RCW_C_VERS=
ION))
> +QORIQ_RCW_C_SOURCE =3D qoriq-rcw-$(QORIQ_RCW_C_VERSION).tar.gz
> +
> +QORIQ_RCW_C_LICENSE =3D BSD-3-Clause
> +QORIQ_RCW_C_LICENSE_FILES =3D LICENSE
> +
> +HOST_QORIQ_RCW_C_DEPENDENCIES =3D host-libqoriq-rcw
> +
> +# Skip the pandoc-rendered man page: pandoc is a heavy Haskell-
> +# runtime build-time tool typically absent from packagers' minimal
> +# images, and host packages don't install man pages anyway. The
> +# 'man' feature option landed upstream in v1.0.1.
> +HOST_QORIQ_RCW_C_CONF_OPTS =3D -Dman=3Ddisabled

A short comment such as:
> +# Skip the pandoc-rendered man page: pandoc requires a full Haskell

would be better.


Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
