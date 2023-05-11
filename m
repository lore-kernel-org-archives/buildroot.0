Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57344C7EE22
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 20:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF67C613A1;
	Thu, 11 May 2023 20:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF67C613A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ffmiIYEMBxP; Thu, 11 May 2023 20:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1109C60E87;
	Thu, 11 May 2023 20:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1109C60E87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2DB1BF283
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 330AE841B2
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330AE841B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1mE_BwyE2D4 for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 20:49:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46CA0841A9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46CA0841A9
 for <buildroot@buildroot.org>; Thu, 11 May 2023 20:49:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b925:bb32:bfe1:7e0e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3278D2003AE;
 Thu, 11 May 2023 22:49:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 May 2023 22:49:45 +0200
Date: Thu, 11 May 2023 22:49:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230511204945.GN252090@scaer>
References: <20230210233658.3763549-1-romain.naour@gmail.com>
 <20230511204402.GM252090@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511204402.GM252090@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683838188;
 bh=qVsW8IF2X0RZF0bv9FFo+cAynmFF+DTEtrQhRckYdWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H2r4WfCZNCRe+hTkDlniGrl4pIFn0ukQwehwAjU8sMTBuUYWlODUao8cnUDgkm7AA
 8RHwwZnM2S2pmC67DPD1uaoi7mmRTdf3ZndvHEQD9lC7R8hyV1Qp0xawPB6iASglSk
 EmVrhd8jI9ZOsVlc0yykFEn0OJCzwLalTv39mpFKt7gr99hkz0Ejb7d6Pv55iUd4yi
 XKjQqNYm/sGVXQRz0TEEzaNRNThRvpuSzKNUkMqLHeTQXr1Jjczs+mmFLb+izWttEA
 0/pKd00pK3qbaKP3QkB0xZN+9Bv9SizWG8PHyt6xqxGsnGLNklGwmIlJaqyTdaadb8
 QMOJtMz2+NLZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H2r4WfCZ
Subject: Re: [Buildroot] [PATCH] package/busybox: disable stack optimization
 for i386 target
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

Romain, All,

On 2023-05-11 22:44 +0200, Yann E. MORIN spake thusly:
> On 2023-02-11 00:36 +0100, Romain Naour spake thusly:
> > Disabling CONFIG_STACK_OPTIMIZATION_386 option (as suggested in the Gentoo bug report) fixed the issue!
> Applied to master, thanks.

Additionally, I think we should also enforce that with something like:

    ifeq ($(BR2_i386),y)
    define BUSYBOX_NO_STACK_OPTIM
        $(call KCONDFIG_DISABLE_OPT,CONFIG_STACK_OPTIMIZATION_386)
    endef
    endif

... so that we are also covered when the user provides their custom
config file.

Honestly, I think that i386-based systems are rather on the big side of
the spectrum, such that the gain from optimising the stack to a non-
standard alignment would be hidden in the measurement noise...

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
