Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBBDC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E2B84741;
	Sat, 13 May 2023 12:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E2B84741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwhPfuXK7oeC; Sat, 13 May 2023 12:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA6984733;
	Sat, 13 May 2023 12:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EA6984733
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19E9E1BF3EB
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00CEA409A5
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00CEA409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4f4A4Frb0fz for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:40:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FA89408F1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FA89408F1
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:40:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5507719F73C;
 Sat, 13 May 2023 14:40:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 14:40:24 +0200
Date: Sat, 13 May 2023 14:40:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20230513124024.GT2582048@scaer>
References: <20230511130605.60604-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511130605.60604-1-thomas.claveirole@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683981627;
 bh=OcD2YWZxNafaMp0MNt+575fcPpiIIqiheQ+ptO7RhMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H+yxs4iVqUWW1hA1TlkXAIryFIeecDUheoUgh3oSXxnJVuUYCqOPU2dQLaOEmRpUv
 LITLpjSx7rQl3eyQfqG42EwxtQBno2fmRk1Gg0TiNKIvGW7zmarHyI7dyUrFrLVOmy
 TvBUfgX6nYQ6OfqWuUvt2Ge+XEqufCBRa7jrgMvvsKL2SedUBwVorP4GJaYm3E6Tz2
 cQHgLwBn6zxJpiRL2RO5QtGvUqlQ58jwn0DXlu8dzGey7Me7TV/16ee/4p1F0sIXKV
 w/uLz41IzR/oZ/IOIW1j35s7UW1PwUwGOXD/9VvKYyHNfBn5dbxr6toGJLd/KMh+7u
 WkUtyd3vA0ASA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H+yxs4iV
Subject: Re: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.3.1
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-05-11 15:06 +0200, Thomas Claveirole spake thusly:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/vuejs/vuejs.hash | 2 +-
>  package/vuejs/vuejs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
> index e66bee06d3..7960b594ce 100644
> --- a/package/vuejs/vuejs.hash
> +++ b/package/vuejs/vuejs.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  968e71a707a4a1961faa6e513b6bba162ef04c3413d7edaba0abc1a5996ae71b  vue-3.2.45.tgz
> +sha256  c2e4197818c64d6ad9f344141a8adee354cbc321f63be7eef6802b4b02cf19f3  vue-3.3.1.tgz
>  sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
> diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
> index 8f7d0cd3d4..a9058b0d44 100644
> --- a/package/vuejs/vuejs.mk
> +++ b/package/vuejs/vuejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VUEJS_VERSION = 3.2.45
> +VUEJS_VERSION = 3.3.1
>  VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
>  VUEJS_SITE = https://registry.npmjs.org/vue/-
>  VUEJS_LICENSE = MIT
> -- 
> 2.39.2
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
