Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FF0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9394882977;
	Wed, 19 Jan 2022 21:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdQAVh9KvDap; Wed, 19 Jan 2022 21:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC0E8137A;
	Wed, 19 Jan 2022 21:39:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 898601BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 862FE607B5
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZJbSawnotF9 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:39:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E822607A4
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:39:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 11B8319F58C;
 Wed, 19 Jan 2022 22:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642628380;
 bh=N/NFrKbjEjTzU3dQhUjpH2tE8Qiq+Nnf//q5Oj4Gy20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j4X6ZCmT/yQmtR+oPRMMdyca++Lpu83G8fjZwCFwwQUqInQMXa0t8Vf4P46OQjJIt
 p3KLk3kLwuOFNP3Dv2yvJw2v9WupJ9aqLoHQ9gDUDji+G5v7d4Cc2Kob5OwPz+p5mN
 NqsF1PPh1t7Y+okZDrSeWdQFoFbUCka/Ae6xd/YpNsBHQyQCoPaAnqvTlV/7bQDqv6
 WVwKg5tL4TKRFx4tNTxphkJSut/P3cdXdYBGDzmKD0EXoKqmionQkq0KHTBbN3au6K
 em6Znr34+dZ08aOvCJALxfeJGh1jQbLRU/OB7+IpWvt8FVmQMBfmceE638L1x1PQaj
 2Cz7aZm8hw2FA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 22:39:36 +0100
Date: Wed, 19 Jan 2022 22:39:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220119213936.GF3095239@scaer>
References: <20220118201709.25366-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118201709.25366-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 1/2] package/efl: change download URL to
 https
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-01-18 21:17 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/efl/efl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index 46bce29305..ed0a8acc1d 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -6,7 +6,7 @@
>  
>  EFL_VERSION = 1.26.0
>  EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
> -EFL_SITE = http://download.enlightenment.org/rel/libs/efl
> +EFL_SITE = https://download.enlightenment.org/rel/libs/efl

I also made the home page canonical in Config.in (see my reply to next
patch to see hos I noticed).

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
>  EFL_LICENSE_FILES = \
>  	COMPLIANCE \
> -- 
> 2.34.1
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
