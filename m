Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F96C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33C284029F;
	Wed, 19 Jan 2022 21:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ei4qbdozn6C2; Wed, 19 Jan 2022 21:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32723401D8;
	Wed, 19 Jan 2022 21:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DEEA1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C0A341581
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRtNdNvbq3Rl for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:40:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 312D041573
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:40:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3CB6819F576;
 Wed, 19 Jan 2022 22:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642628431;
 bh=NjRuVMycA5Jmo4AfnAJcBSfFcD7pDObS8v+7VyQ4HZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DgIXAYXpZYyzNHoXv+QA7LNo/TQM3qprw4uRHEpFFZMPCvERUgdMQX9UdUy9AVkrq
 8hwlTMPceVRHUNmdzjbAmFx8tNJor1va1hzeOIzVvFAVvLNh91Mi9DN+2adi5zi+ZW
 NNON+hbSmzjOOXS0EDMQujqYaB1LeZlxhNzxxdyRY9vzVo35EorsZXIlU1tzE8owfs
 ix9i4W5H/vU8K48iao+r1wTf0d8zPAfZiZwp9ZCNLVbNbt6+cVPWcWn3xpVJBaSOEv
 JIM+1S5NM7x9BihXA8IJiG/mvbsYEym+RUCFupDgCvRrBdDyTEf6GLZabPb+v5k6Ah
 Ye9S1RnFXN39g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 22:40:27 +0100
Date: Wed, 19 Jan 2022 22:40:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220119214027.GG3095239@scaer>
References: <20220118201709.25366-1-ps.report@gmx.net>
 <20220118201709.25366-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118201709.25366-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 2/2] package/enlightenment: change
 download URL to https
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

Peter, All.

On 2022-01-18 21:17 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/enlightenment/enlightenment.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
> index 640d5a62bb..24bbd96cd0 100644
> --- a/package/enlightenment/enlightenment.mk
> +++ b/package/enlightenment/enlightenment.mk
> @@ -6,7 +6,7 @@
>  
>  ENLIGHTENMENT_VERSION = 0.25.0
>  ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
> -ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
> +ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment

I also switched the homepage in Config.in to https, and that's how I
noticed that the EFL homepage was not canonical.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
>  ENLIGHTENMENT_LICENSE_FILES = COPYING \
>  	src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
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
