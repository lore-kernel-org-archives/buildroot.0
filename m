Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAB8EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3378418C5;
	Tue, 25 Jul 2023 21:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3378418C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmY1ttXkjFeM; Tue, 25 Jul 2023 21:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE1B4191F;
	Tue, 25 Jul 2023 21:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE1B4191F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C28E1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 751938214B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751938214B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqInP1ak2qct for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:00:32 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 754CA8214A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 754CA8214A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A3EE578033D;
 Tue, 25 Jul 2023 23:00:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:00:27 +0200
Date: Tue, 25 Jul 2023 23:00:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230725210027.GP3544423@scaer>
References: <20230725144300.721378-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725144300.721378-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690318829;
 bh=fYdNJ1EOeGTWiIMCu2/akfCR+BhwtVwwouGuUedwT5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QAM+cybY1wHTV/1bJG8T5nXc2N2FIoHMMyAjMfYai34+4GMFKURabA2CcT/y1sX+c
 G0BNAl8KFi+IbK/6D3MUUCadYZDe+mDPLBudBrpwPH5jyW+f27rVqjtU41OpjB8rJv
 /fzJNQ7NdHXk/hWvYoR5dt/E0m9Ayq2gYdZ8JCPKUnEr/kXPSEptCwcG2zNy18pyWh
 cEVCdjKPU/5NJOGSu8OLU0ODYCEX9DY6t+96s9j2acnMTYnXswruRyISbxJNAiQ3qI
 a1b+jfT+gG/DP0R13lY2e71FBwJkzE/Bv88D0CnXZDyfI/W33bgHU12WBDzFhYrN0w
 jVmGRvxY1l5Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QAM+cybY
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to
 version 1.32
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

James, All,

On 2023-07-25 08:43 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wayland-protocols/wayland-protocols.hash | 6 +++---
>  package/wayland-protocols/wayland-protocols.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
> index 45c62a396b..d039cd6fba 100644
> --- a/package/wayland-protocols/wayland-protocols.hash
> +++ b/package/wayland-protocols/wayland-protocols.hash
> @@ -1,4 +1,4 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042524.html
> -sha256  a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238  wayland-protocols-1.31.tar.xz
> -sha512  402ce1915300e29afe554d77965ee0a28a5f22fdb5b901c4c640e59b9f3a9c11094e1edae87eea1e76eea557f6faf0c34a0c28ee7f6babb4dc3719329c4e25bf  wayland-protocols-1.31.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2023-July/042836.html
> +sha256  7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11  wayland-protocols-1.32.tar.xz
> +sha512  90bbd52daf342b98823ddeed04e349ae242d2eaf925ab8d603cceb36c980c83b5681bb890961e0d49584cb5c2e60a33abf8821770c6ab87956383630bd5b7966  wayland-protocols-1.32.tar.xz
>  sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
> diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
> index 54f9ed8a3a..2cfaa830e5 100644
> --- a/package/wayland-protocols/wayland-protocols.mk
> +++ b/package/wayland-protocols/wayland-protocols.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WAYLAND_PROTOCOLS_VERSION = 1.31
> +WAYLAND_PROTOCOLS_VERSION = 1.32
>  WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
>  WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
>  WAYLAND_PROTOCOLS_LICENSE = MIT
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
