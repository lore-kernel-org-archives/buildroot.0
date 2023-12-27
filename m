Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6995AC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2046F41C0A;
	Wed, 27 Dec 2023 22:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2046F41C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jr8Dq33QUFwq; Wed, 27 Dec 2023 22:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CFE1417FA;
	Wed, 27 Dec 2023 22:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CFE1417FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5513D1BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C6D40347
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C6D40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeZxnd0dcEn6 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:25:07 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D314540124
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D314540124
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 130A6B0037C;
 Wed, 27 Dec 2023 23:25:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:25:00 +0100
Date: Wed, 27 Dec 2023 23:25:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZYykPK_-a5M2_aKR@landeda>
References: <20231109212901.5596-1-ps.report@gmx.net>
 <20231109212901.5596-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109212901.5596-2-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703715905;
 bh=Rru5VdUlOI3BkQhVNLZ7GKpkoyuw2DWkggGbZHUbpEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dmAmkNgqqSTmVFbbmLMGVfVVcY8Zpe99LQ3cmQedmWgMl2P3txttyGfiitLuOv9dq
 78MmMyuU2unIX1iz3EoEZs9WjnYddRVBrHU0BKBZdBI1ao6/HI7sUefCx0Pfpc2IYL
 ndtbXtjHN8637oE4ZMJD5IfxRNh/BdMPi4pHAXzrYwfg3fl1S5wRdxg0k4KWcQVdpK
 fRFwC5wD1HSzlI9zyQEVqJDMULTyhh+mxLjk8Mj1/R/yGErAMItaViAH8rANm9VrIl
 pcNeF0KI/RXwYl1GFvJZmXf6FRODQcCwvuGqM5EXvvAEZuJT2ZH6qv4j8FCrDlWAQL
 yutU6Pa+6quzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dmAmkNgq
Subject: Re: [Buildroot] [PATCH v1 2/4] package/libcamera: disable python
 bindings by default
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-11-09 22:28 +0100, Peter Seiderer spake thusly:
> Disable python binding option (introduced with upstream commit [1] (since
> version v0.0.1) by default.

Since there i s no way to enabled them with this change, they are not
"disabled *by default*"; they are just "disabled".

So I dropped the "y default" part of the title and the commit log.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=8aa02271fd716ed046970a0b1f89176963303f50
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libcamera/libcamera.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index c1c8bb7b33..8b33b9e708 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -19,6 +19,7 @@ LIBCAMERA_CONF_OPTS = \
>  	-Dandroid=disabled \
>  	-Ddocumentation=disabled \
>  	-Dtest=false \
> +	-Dpycamera=disabled \
>  	-Dwerror=false
>  LIBCAMERA_INSTALL_STAGING = YES
>  LIBCAMERA_LICENSE = \
> -- 
> 2.42.1
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
