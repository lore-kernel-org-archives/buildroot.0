Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A08C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 08:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 211D4812D1;
	Mon,  6 Jul 2026 08:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xp_mvslvjA8; Mon,  6 Jul 2026 08:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36859812D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783325989;
	bh=J1IeYnlu3zzcTGdz0883tFQ+WNGxvE0UTJ9eXiA/qyw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mPWN+ALtu7RbE4TKuIO9vLpRqtDPc2l7z/XMMJO/tMofljpBdQFUNCa9O2bj1IbKQ
	 iBEary9qSRH2N1aEe8/I98pd48kXeGQUrlTwLE6aWf1+xPAbLFIcM9aVed5JhmDdS/
	 9Pst5kJHUORWAfPZJtplRnvLOmtgvSCc1dodKMsVtdlGwHMMPl+e1giixlv3i8n/mZ
	 0nHASb3jkxSEjnoOvvu2PTVlg43xBluABLejUg36nb1l0hL2eb7LpEMm9gqRjt7QzY
	 cReSx9JCmLh0vTjtpIAA2gNwP6BRmC5qkCQMajNMk8C8tzDfaLo0ryuEKu28JD1CQx
	 WSIcUHYrpZ1Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36859812D2;
	Mon,  6 Jul 2026 08:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD01A2A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B766E40A4C
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nuQUmdzAfRTP for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 08:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 941B640A36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 941B640A36
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 941B640A36
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:19:46 +0000 (UTC)
Received: from L30177.local (unknown [213.36.132.10])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5F1E1B0056A;
 Mon,  6 Jul 2026 10:19:43 +0200 (CEST)
Date: Mon, 6 Jul 2026 10:19:42 +0200
To: Philippe Nunes <nunes.philippe@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aktlHr_H_GNkXLzb@L30177.local>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260701121937.346945-3-nunes.philippe@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701121937.346945-3-nunes.philippe@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783325984;
 bh=ZFi/RtRtnMYGyOfg9IqgzbO0wqlhC9XFucgBmoU/0Tc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SU4y5dmGskK3OfajA/lxoqW7jZws8cV1rFQDl+O+VQ+YGKelyZuV8EMgtxPgEXrmJ
 JQBNXuXHIMbzzzsOeOXnoX8zyrcAzB7JCbkKaYIsWa53yHlnMp6ragVpC3m0OkK5T0
 p4NGIxxLxZyblW4nrluWVBELKVLo9W7D32GDGka/UFcUP8+V9hnxNKg3oTb9zx0B4M
 t/BqfuNygjTxgcw7hIy2vPerETNT+KHRLauxeb58m6e4bHHukeBcpnIf+pCf6mLZYm
 gYT0NqX3iTshHkPRLMGUq0zAHZptKGiuNPMH1GQ1SWcxffY+oRAHg2G8t2SK4F9rVY
 aLhPS2PqxPYrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SU4y5dmG
Subject: Re: [Buildroot] [PATCH 2/3] package/libqoriq-rcw: new package
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

Thanks for leading this packaging into Buildroot.

see below,

Le 01/07/26 14:19, Philippe Nunes via buildroot a =E9crit :
> libqoriq-rcw is a C17 reimplementation of NXP's rcw.py for the
> pbiformat=3D2 QorIQ family (LS1028, LS1088, LS2088, LX2160). It compiles
> and decompiles RCW (Reset Configuration Word) binaries used by the
> SoC bootrom, and exposes the same functionality as a reusable shared
> library + pkg-config + public header.
> =

> Built as a host-only meson package with -Dtests=3Dfalse -Dman=3Ddisabled.
> The upstream tests/ subdir links libcmocka (only validates library
> internals -- never executed by Buildroot), and the man-page step
> requires pandoc (heavy Haskell-runtime tool typically absent from
> packagers' minimal images). The 'tests' option landed upstream in
> v1.0.1, the 'man' feature option in v1.0.2; we pin to v1.0.2.

No need of providing version history on all the versions into the commit lo=
g.

> Depends on host-mcpp for in-process C preprocessor support; the
> library uses libmcpp instead of shelling out to gcc -E so that the
> preprocessing of .rcw sources is hermetic and self-contained.
> =

> +	  Used by the host-qoriq-rcw-c CLI for the actual compile,
> +	  --dump, --dump-flash, and decompile operations.

This help information is not for the library. See my other comment.

> +# Skip both the cmocka-based unit tests and the pandoc-rendered man
> +# page. The tests/ subdir links libcmocka and only validates the
> +# library implementation itself (CRC, bit-packing, parse/decompile
> +# round-trips); Buildroot never executes them. The man-page step
> +# requires pandoc, a heavy Haskell-runtime tool typically absent
> +# from packagers' minimal images, and host packages don't install
> +# man pages anyway. The 'tests' option landed upstream in v1.0.1,
> +# the 'man' feature option in v1.0.2.
> +HOST_LIBQORIQ_RCW_CONF_OPTS =3D -Dtests=3Dfalse -Dman=3Ddisabled

Please, provide shorter coments.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
