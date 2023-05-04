Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4070C7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7369542735;
	Thu,  4 May 2023 20:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7369542735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMB-1q0XY1FY; Thu,  4 May 2023 20:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FDBB42731;
	Thu,  4 May 2023 20:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FDBB42731
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBC8B1BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C55AA8404D
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55AA8404D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vvfWOYl7YlhY for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:45:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A2E84049
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70A2E84049
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:45:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3f23:63cb:29e9:f8d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2E2901A8143;
 Thu,  4 May 2023 22:20:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 May 2023 22:20:03 +0200
Date: Thu, 4 May 2023 22:20:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230504202003.GL2696@scaer>
References: <20230503185144.13679-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503185144.13679-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683231607;
 bh=39915kZvTck1kk49FxslKGLF4EY6gOd6ZvCM46jcXXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JF+NTtz8J/T3KBb97mgobtZmWYhi8Y8L5BTsaREhKeWTkd9KKqXcE/YceVGpyJ242
 q//lWJjo1tdAkmFYr6UY7xnzjgBAozAWUQSjp/yZzudy1tBHh59UZbKj9v0Wv3qqiY
 QMFi4zqV2YBTN62Gws7nlpIdGwlmUg+6K1bLSe8uQmY3ti8s/Wtm07VZG+YyduNVro
 fC3wyHWvsqQD5qp40Fh9pUbz95+2P/hnFpicoz+Wk4hxUaX7ILLDZUvRO5m07Ba3/j
 GsOHLodwSeMNasfLPkbSNk+dHZKSSzM9bfj7v6+pqCCIsQsQu9exIJmAQKYcbNVEgq
 l3P1NCFCRB1vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JF+NTtz8
Subject: Re: [Buildroot] [PATCH v1 1/2] package/coreutils: fix cross-compile
 (add gl_cv_macro_MB_CUR_MAX_good=yes)
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-05-03 20:51 +0200, Peter Seiderer spake thusly:
> - add 'gl_cv_macro_MB_CUR_MAX_good=yes' to COREUTILS_CONF_ENV to fix
>   cross-compile failure since bump to 9.3
> 
> Fixes:
> 
>   checking whether MB_CUR_MAX is correct... configure: error: in '.../build/coreutils-9.3':
>   configure: error: cannot run test program while cross compiling
>   See 'config.log' for more details
> 
> Reported-by: Christian Stewart <christian@aperture.us>
> Link: https://lore.kernel.org/buildroot/CA+h8R2qSe6OepJMJr+KOUOAOqCRD9EX690Y+Yq4kx-M6x4uQBw@mail.gmail.com/
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/coreutils/coreutils.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 2c12e8ef2f..cf42a8aff8 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -51,6 +51,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
>  	gl_cv_func_tzset_clobber=no \
>  	gl_cv_func_working_mkstemp=yes \
>  	gl_cv_func_working_utimes=yes \
> +	gl_cv_macro_MB_CUR_MAX_good=yes \
>  	gl_getline_needs_run_time_check=no \
>  	gl_cv_have_proc_uptime=yes \
>  	utils_cv_localtime_cache=no \
> -- 
> 2.40.0
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
