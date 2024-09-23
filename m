Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B784CF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 462D581C56;
	Mon, 23 Sep 2024 19:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpWAcBDfgyMU; Mon, 23 Sep 2024 19:42:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 480F381C93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 480F381C93;
	Mon, 23 Sep 2024 19:42:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17E631BF3C3
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 075B281C93
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4vXiKTGwvh9 for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:42:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED49081C56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED49081C56
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED49081C56
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:42:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CE9E85FFAF;
 Mon, 23 Sep 2024 21:42:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 21:42:33 +0200
Date: Mon, 23 Sep 2024 21:42:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZvHEqZmL8v430pLz@landeda>
References: <ZvDoZ4PekjMKl+bs@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvDoZ4PekjMKl+bs@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727120556;
 bh=5HrFVd2KS3itPpyanN1xkrDXLnygBBtx4K8t/28ZgAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D3cODlLmTYhkuYS0lBcM6dvzYp4mbtAm2I7iBnqENrK7uNoI+SSQmcRkNeKhU2+u4
 sNo/gyit6quYidAHtJqJADWHf08fZtLgZCoDUwE0XCNG0Wfb3+F5lMDTNn/be0/M4/
 UfgngJWqThdMc5ItO5Ah/1EnBtT70yVhFbqgCvCTsmzP5V9oC6FkoODLtV06QYX3ou
 GZKW/edt1Bu+nNXUgnGtPwgZ4lEw3dGpp/cnDLJfGJS/GFj9P7mSjQVjKl7hJFVmvS
 SMyq6ggQFDfJIfoGLlgm0PZEscs+HJeIbbWNs9klRn4Q9pgdUF7rsPhsl44snyhhgA
 Op2qTx9UARORg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D3cODlLm
Subject: Re: [Buildroot] [PATCH v2] package/httping: update to latest git
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

Wlademar, All,

On 2024-09-23 06:02 +0200, Waldemar Brodkorb spake thusly:
> Changes made to the Buildroot package:
>  - use github url for download
>  - switch to cmake infrastructure
>  - add new option for TUI support
>  - add new option for SSL support
>  - TFO is always enabled now, and therefore we don't need to add
>    Config.in.legacy handling for this option
>  - remove no longer required patches 0001/0002
>  - update license file to LICENSE
>  - update license to AGPLv3
>  - always build without gettext support
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1-v2:
>  - clarification of license issues, httping is licensed under AGPLv3
>    as now stated in the readme and LICENSE was updated accordingly,
>    switch to latest git for these changes. (requested by Thomas P.)
>  - fix Config.in so that libressl can be used, suggested by Thomas P.
>  - add missing select BR2_PACKAGE_FFTW, suggested by Thomas P.
>  
> ---
>  .../0001-fix-math-library-linking.patch       | 27 -----------
>  ...Makefile-allow-build-without-gettext.patch | 48 -------------------

    $ ./utils/docker-run make check-package
    .checkpackageignore:587: ignored file package/httping/0001-fix-math-library-linking.patch is missing
    .checkpackageignore:588: ignored file package/httping/0002-Makefile-allow-build-without-gettext.patch is missing

[--SNIP--]
> diff --git a/package/httping/httping.mk b/package/httping/httping.mk
> index b3a625a8e1..dff54626ea 100644
> --- a/package/httping/httping.mk
> +++ b/package/httping/httping.mk
> @@ -4,34 +4,18 @@
[--SNIP--]
> +HTTPING_VERSION = 0e26c53d5fe504eb7204d64b23513729aa4a5bb0
> +HTTPING_SITE = $(call github,folkertvanheusden,HTTPing,$(HTTPING_VERSION))

We've recently decided to switch away from the github and gtilab
helpers, because there is no guarantee provided by GitHub or GitLab that
the archives they generate are reproducible (GitHub galready broke that
mu;tiple times, and their doc now explicitly ststes those arechives are
not guaranteed to be stable).

Instead, we want to use the git download method, as we do control the
way the archives are generated locally (and ew're *are* going at great
length to make them reproducible).

I've fixed both issues, and applied to master, thanks.

Regards,
Yann E. MORIN.

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
