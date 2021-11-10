Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588B9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 18:46:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC814613D3
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 18:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC814613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 725CA400CE;
	Wed, 10 Nov 2021 18:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1EisfnfN7Vw6; Wed, 10 Nov 2021 18:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7103840416;
	Wed, 10 Nov 2021 18:46:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E31361BF5A4
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 18:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D201C404A3
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 18:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LemeY588V5bB for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 18:46:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 794AF404A7
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 18:46:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 92ED65FEF7;
 Wed, 10 Nov 2021 19:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636570008;
 bh=ONMGsSXRhKJeBnfMynfV3rRLT+Nd5pJJXJ58v1HQV6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZprtjizhopBvPpHTNP/f851uaGXhu7uy65wd2z8HOPEhKdVzhaMxm/8ajdFaUgRz
 rir0ToNBXJx8OHhl1D0cxawPQF61UBqtb8cUes8bjvgXkpW9qz8TxnPfjTo43YNsfg
 CD+QgXXWbZq/hnRRasWQMtWz5bfLa+b3b9vp6tEdqk+ubpAbClNSeOpC6Akl9sEeOs
 vYyxZY+bx5sg+pnEI3VlZQyVG4DGY5rmrcOkRrscOpRE46uyNBo4jHyKs/fm0Z92Ao
 UjCK3GHB24u7B6gHyXURkDhAxpu1G3JZKSUpQNauvzDCm2VvlU2SpofX/nTRpQbYH8
 aNdQwc/NL2e9w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 19:46:42 +0100
Date: Wed, 10 Nov 2021 19:46:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211110184642.GM2084998@scaer>
References: <20211110161505.74745-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110161505.74745-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: disable meson wrap
 downloads
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2021-11-10 09:15 -0700, James Hilliard spake thusly:
> We don't want to allow meson to download wrap dependencies as this
> bypasses buildroot's dependency resolution.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks, after adding a pointer to the FAQ about the
wrap-mode option.

Regards,
Yann E. MORIN.

> ---
>  package/meson/cross-compilation.conf.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index 37b49eea3b..7a7ece97ae 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -17,6 +17,7 @@ c_args = [@TARGET_CFLAGS@]
>  c_link_args = [@TARGET_LDFLAGS@]
>  cpp_args = [@TARGET_CXXFLAGS@]
>  cpp_link_args = [@TARGET_LDFLAGS@]
> +wrap_mode = 'nodownload'
>  
>  [properties]
>  needs_exe_wrapper = true
> -- 
> 2.25.1
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
