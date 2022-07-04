Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DBC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22EF9827E0;
	Mon,  4 Jul 2022 15:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22EF9827E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esngEopSfXOI; Mon,  4 Jul 2022 15:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1631682419;
	Mon,  4 Jul 2022 15:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1631682419
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A56B71BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FB2B405A8
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FB2B405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWsCvFvfyTQ6 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:53:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B5AE40320
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B5AE40320
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:53:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4999:e547:afac:f97])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AD3205FFAC;
 Mon,  4 Jul 2022 17:53:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 17:53:45 +0200
Date: Mon, 4 Jul 2022 17:53:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220704155345.GF2521@scaer>
References: <20220704104820.5332-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220704104820.5332-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656950029;
 bh=urfk5VNFiyj4Q+TyPKuWh70wUuA/PaOo+hvMRd0MpQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PrF8dK6+6MUQzMxfoXaRrEw4V3Uv00H+Yl7ekbGy+ruOmVhdUr04YEqLZp4C0WHyA
 UsdtEnBcVchF/KvkzxstfzteQMrWZgb1BRypwHJSrwCkv0w/tCxX6iJU63GzEApPHc
 qSw3mpR8KogEqSMidqNQALVrn6geKqzyOPf5p64jRAaWajeVtTZ9RdoPEx0WfzKed8
 a8PHUCs4zGDOKE5EbAR5lTQwfsxwNbn41TG7674XBljMMI7lxuYGP5sIN6lb7/wGKW
 7XOV12vBS7dKUemxD+JT5kI02uG/FRqhZaOPbbET627gQH1fMYKLUHOC0Uh3EFyiDn
 gjVFfGGh7hvKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PrF8dK6+
Subject: Re: [Buildroot] [PATCH] package/python-setuptools-scm: add missing
 runtime dependency
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
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2022-07-04 12:48 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Since version 7.0.4 python-setuptools-scm requires
> host-python-typing-extensions package.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a4a52da24032222860ad6abe89bf66839cc2e812/
> http://autobuild.buildroot.net/results/2b381cd32671db4aa0b281ece5569667bae0f923/
> http://autobuild.buildroot.net/results/a3c5208224cc7825152d9a27b64fd82fb000a259/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-setuptools-scm/python-setuptools-scm.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
> index 890ee0c9c1..a3de013cc5 100644
> --- a/package/python-setuptools-scm/python-setuptools-scm.mk
> +++ b/package/python-setuptools-scm/python-setuptools-scm.mk
> @@ -10,6 +10,6 @@ PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/bc/e6/ac8b0
>  PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
>  PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
>  PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
> -HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
> +HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli host-python-typing-extensions
>  
>  $(eval $(host-python-package))
> -- 
> 2.17.0
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
