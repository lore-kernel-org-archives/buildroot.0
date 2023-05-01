Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB3DC77B7C
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B45582150;
	Mon,  1 May 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B45582150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqAQAQ4g32Bz; Mon,  1 May 2023 20:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00F282154;
	Mon,  1 May 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00F282154
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 710AE1BF419
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 492BC82150
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492BC82150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tJYNG72ARNX for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 20:52:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D0418214E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D0418214E
 for <buildroot@buildroot.org>; Mon,  1 May 2023 20:52:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:8906:ae70:691:1fda])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F309619F738;
 Mon,  1 May 2023 22:52:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 May 2023 22:52:40 +0200
Date: Mon, 1 May 2023 22:52:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230501205240.GE2696@scaer>
References: <20230428190201.12489-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428190201.12489-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682974364;
 bh=rqANez+nFZbclyOg9v/iq43u7XfXrYKPut/r9x034is=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l+hXbYEIfR9EVmiLdnf1mj6JEmgsJVGzs5FhLxpTaOtAD4ZdB+9V1ad6ogga+PNsu
 HZSiI/Woq1Bpf8C3tddF+NfAYnj21HdQyE8R70QC8NTDjCFG0tmphqmCE27MBqlhjj
 HSVHUoBT7Y9d3K/tlUc3Zw3Aba7lQUl2xzff5tG33+1poXgX+ywA9z2UubC973C9K4
 +FPJbyH3+w3nWfUdCmXBBtmP2iFnmIgM537vgKkAjM5GgSZ5Daka1w4sG1tH1SZNHJ
 UdMMhDtjCTpY0adX8E4gM0PtX4l9/69CEhKbPF3KBA22Mv8sZ4QHZgTgRYMuLNnjjL
 uStWzoTglfzkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l+hXbYEI
Subject: Re: [Buildroot] [PATCH] package/libgtk3: fix cups backend
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-04-28 21:02 +0200, Daniel Lang spake thusly:
> When explicitly specifying printing backends libgtk3 requires file
> to be one of them on linux.
> 
> Fixes:
> - output/build/libgtk3-3.24.37/modules/printbackends/meson.build:39:4: ERROR: Problem encountered: 'file' print backed needs to be enabled
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libgtk3/libgtk3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index 18a8a9fa42..b41049b0ee 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -68,7 +68,7 @@ LIBGTK3_DEPENDENCIES += xlib_libXdamage
>  endif
>  
>  ifeq ($(BR2_PACKAGE_CUPS),y)
> -LIBGTK3_CONF_OPTS += -Dprint_backends=cups
> +LIBGTK3_CONF_OPTS += -Dprint_backends=file,cups
>  LIBGTK3_DEPENDENCIES += cups
>  else
>  LIBGTK3_CONF_OPTS += -Dprint_backends=auto
> -- 
> 2.40.1
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
