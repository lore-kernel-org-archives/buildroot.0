Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB5CC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A0B1817A3;
	Sun, 29 Jan 2023 21:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0B1817A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id byWHgI1Z6MNO; Sun, 29 Jan 2023 21:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5F881768;
	Sun, 29 Jan 2023 21:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5F881768
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AEA31BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F235581777
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F235581777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvtmghslS-Xt for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:45:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD7DC81768
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD7DC81768
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:45:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A04065FFA2;
 Sun, 29 Jan 2023 22:45:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 22:45:07 +0100
Date: Sun, 29 Jan 2023 22:45:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129214507.GY2632@scaer>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127141058.2180747-4-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675028713;
 bh=dQbDSVpNALYINPY8VbbSFK2BbqsQYRxrI7+HZ3fjJ0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pnEhFRXgZF81R8FtXiw5UjoyrIOKcdbIyIceYwqDHVzJv/u9/8VeGzAbGDrxCnEbB
 ktN2ZfFk/kM4hq5txG1Xl9JIhQDWWIp6KXKPVczDva6rHJRR+ztI8T464IXYry58xI
 AHbRDgOodFlLGP08gvFAOhKaM0MrrweeZjccjMDq6Tq0M/fDNU9O9TO9FMPN70RlVi
 zyRZA1iCdfYRr6qEewP27oLCQ6dYE9fyAhSdTICmXceNbDYR6Y+maX60eG4+pxlafK
 Dcf21eOuN7kVrE1SWR3X7heSsYuL02CWmwfKdQxOWGJDjPsMf4Wgq7gPUz5IDvML5F
 2eItG8gfw+FeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pnEhFRXg
Subject: Re: [Buildroot] [PATCH v4 04/13] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> From: Stefan Hager <stefan.hager@ginzinger.com>
> 
> This package is required by tensorflow-lite.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
> new file mode 100644
> index 0000000000..1a36fc48f7
> --- /dev/null
> +++ b/package/gemmlowp/gemmlowp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# gemmlowp
> +#
> +################################################################################
> +
> +GEMMLOWP_VERSION = 08e4bb339e34017a0835269d4a37c4ea04d15a69
> +GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
> +GEMMLOWP_LICENSE = Apache-2.0
> +GEMMLOWP_LICENSE_FILES = LICENSE
> +GEMMLOWP_INSTALL_STAGING = YES
> +GEMMLOWP_INSTALL_TARGET = NO
> +GEMMLOWP_SUBDIR = contrib

Upstream is very careful to point to some optimisations that are
required or performance will suffer.

Notably, should be enabled:
  - for x86: sse4.1
  - for ARM: NEON

For NEON, it seems this is automatically handled, though, based on
looking at some macros:

    internal/detect_platform.h
    85 #if (defined __ARM_NEON) || (defined __ARM_NEON__)
    86 #define GEMMLOWP_NEON
    87 #endif

For x86, we should probably have code like (what we have as
BR2_X86_CPU_HAS_SSE4 seems to be SSE4.1, but it is not clear whether
there is an actual delta between SSE4 and SSE4.1 [0], so let's be safe
and assume that BR2_X86_CPU_HAS_SSE4 is not enough):

    ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
    GEMMLOWP_OPTIM += -msse4.1
    endif

However, that same header seems to also have some detection based on
macros... This needs to be cleared, maybe?

[0] https://en.wikipedia.org/wiki/SSE4

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
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
