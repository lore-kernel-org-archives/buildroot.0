Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77D5C4167B
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EF641F8A;
	Thu,  9 Nov 2023 21:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EF641F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6006znIKjJx; Thu,  9 Nov 2023 21:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D764B41E8E;
	Thu,  9 Nov 2023 21:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D764B41E8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B125C1BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9527E41E8E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9527E41E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SB_cOaxhuBog for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:50:27 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC49841E97
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC49841E97
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bf98:93a4:26f0:a873])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DC09513F8A2;
 Thu,  9 Nov 2023 22:50:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 22:50:21 +0100
Date: Thu, 9 Nov 2023 22:50:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231109215021.GE996011@scaer>
References: <20231001091802.1771968-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231001091802.1771968-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699566626;
 bh=pOqx/g/YmsRNXnxUmQQn9guTgTPY2l05WxelL3XAI9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IqZBvCb0iVihlHLhgaoCMVv8D/WRPgUKdh82HOdNrkM1UisoDRjiy1eL+csxhFlCF
 K0ozKye0rnd0ZqtRdhDaAI6cEuqn79uVDLSyGkP0Hx9KAzVnixGoq6HIcIsGOlnaKQ
 grpDGC5t/N1dvW/xTv+gjdRvVtFCRQgtlMyFjgx2ouXl0vYEmRxWWTA8WzcaeuEjKu
 D8y3o8xCbMyDrsUCPCMFRz3oKYp25h3xbd2WAjqxzCBCRA75LPmJ0pjgifU2Pv6HCK
 f7fy+8S1B+Zg7qsXPfZC/Kh+e3Mk/NtjJulVIMFgz/EJbUYHcNl9vg1CO2Z87CzZGE
 9/u7qDBdUZ5vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IqZBvCb0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pygame: switch from
 distutils to setuptools
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-10-01 03:18 -0600, James Hilliard spake thusly:
> distutils will be dropped with python 3.12.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pygame/python-pygame.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
> index 600dd9e743..84fd6df4e2 100644
> --- a/package/python-pygame/python-pygame.mk
> +++ b/package/python-pygame/python-pygame.mk
> @@ -10,7 +10,7 @@ PYTHON_PYGAME_VERSION = d61ea8eabd56
>  PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
>  PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
>  PYTHON_PYGAME_SITE_METHOD = hg
> -PYTHON_PYGAME_SETUP_TYPE = distutils
> +PYTHON_PYGAME_SETUP_TYPE = setuptools
>  PYTHON_PYGAME_LICENSE = LGPL-2.1+
>  PYTHON_PYGAME_LICENSE_FILES = LGPL
>  
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
