Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EE6C77B73
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 21:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2237F427C2;
	Thu,  4 May 2023 21:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2237F427C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjhhBfBvpwoG; Thu,  4 May 2023 21:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7C494279F;
	Thu,  4 May 2023 21:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7C494279F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 484BE1BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF314279F
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FF314279F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kjneEuUUC3Z for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 21:01:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F1C42796
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8F1C42796
 for <buildroot@buildroot.org>; Thu,  4 May 2023 21:01:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:2a0:f7b8:e40f:da5c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 88B8F14A6CF;
 Thu,  4 May 2023 22:41:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 May 2023 22:41:37 +0200
Date: Thu, 4 May 2023 22:41:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230504204137.GA2661@scaer>
References: <20230504202137.18145-1-ps.report@gmx.net>
 <20230504202137.18145-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504202137.18145-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683232906;
 bh=6ctfzj/YC04r3HK9hYFQn0geslIDa2AfWH1YdH6zPc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEnOZqkjC5xxSNeKq1yIO7Yb/zLQcuSjMzV9YM8pXNCz/cgtYb/e7pbxkfv/qZOHM
 mylzdftXznMG+agOxFOfeyqUc0hKHn63TXaEJFOK7Y4y5ilDZWnt2trTXiTML9V7tI
 hw6igKCMxoKZ/5886/0clAVgazfp2AYUEn86Yvsa0fr6/CsmLhoaBIgMzVNxBlZsiu
 iwe3UULyQwo4C29KMWsn4YX83hY/mUeEsqnX8yFjz7zmpq8ctEiCu8GqIqPwkM5Hz9
 lnr0E0n/8I9a/P62Yx6LUqDku7ZNQz8qjn/jOMtDhSZpjdaDK0E0ERW/QYEaX358XQ
 C9CMloo5yd8Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PEnOZqkj
Subject: Re: [Buildroot] [PATCH v1 2/2] package/edid-decode: bump version to
 2d44e1b
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

Peter, All,

On 2023-05-04 22:21 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/edid-decode/edid-decode.hash | 2 +-
>  package/edid-decode/edid-decode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
> index 65d6c71079..8bece94911 100644
> --- a/package/edid-decode/edid-decode.hash
> +++ b/package/edid-decode/edid-decode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c1a6222083c59f0499b3e43c159aee7e4c6c07d33b790d490a13fd62942fa9b5  edid-decode-188950472c19492547e298b27f9da0d72cf826df-br1.tar.gz
> +sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-br1.tar.gz
>  sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
> diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
> index 7e463c02b1..cd0bdfa0f0 100644
> --- a/package/edid-decode/edid-decode.mk
> +++ b/package/edid-decode/edid-decode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EDID_DECODE_VERSION = 188950472c19492547e298b27f9da0d72cf826df
> +EDID_DECODE_VERSION = 2d44e1b01c7ed7d65b20ecdce62d354841832201
>  EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
>  EDID_DECODE_LICENSE = MIT
>  EDID_DECODE_LICENSE_FILES = LICENSE
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
