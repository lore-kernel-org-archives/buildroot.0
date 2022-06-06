Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDC5C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A9AD40A90;
	Mon,  6 Jun 2022 13:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0vgcb5EBbD8; Mon,  6 Jun 2022 13:17:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49663404B4;
	Mon,  6 Jun 2022 13:17:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8280A1BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8018783FF5
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_7nPpi-OpjW for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:17:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62DE684097
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:17:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4013:c8f0:ae9b:2a1c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2254978034D;
 Mon,  6 Jun 2022 15:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654521450;
 bh=KRAWr3fTHXtgpcMhvfxkLnvCIFDteKGfQW4GTqidOEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QzwyfOAlt7+LqowKwGuD+ZMle2DbkPGu9E0HDTpIAuvyQGpzICp++vO/tLxa4spti
 djca3MI9V9KHP/BQSj74DUlmO4URovq0q496v8QZIfmOVtr6hoDsG9WOuNdztOZhHM
 1hefRcDBk2yYKyq/03+Fvlb1R4Ca69ZKUS3Lv/E0HwApm2M0ojFo2HS4pZLAg5pEvu
 8XHXABNWhAvM/LngioW1GX2iS3lP5n7pTfzBWdYS+PHCXUSXZzSB47xPqcQ5aI0esY
 6/uhzhTWy2z/gMP6x+jSkS2Rmtbz35VeTXrzacgj8dUq/6IurRRwmnrdYhjU7l6ErP
 5sFRQpqu8yQgw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Jun 2022 15:17:25 +0200
Date: Mon, 6 Jun 2022 15:17:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220606131725.GX427639@scaer>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 0/7] Fix a number of toolchain dependency
 issues
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, Thomas, All,

On 2022-06-05 21:42 +0200, Thomas Petazzoni via buildroot spake thusly:
> The starting point for this series is the investigation of several
> build failures affecting the master branch.
> 
> Most of those failures are due to the fact that we can currently
> create configurations for which no C library is available. This
> happens on architectures where glibc is the only supported C library,
> but BR2_STATIC_LIBS is enabled.
[--SNIP--]
> James Hilliard (4):
>   Config.in: only allow BR2_STATIC_LIBS on supported libc/arch

As noticed by Arnout: Thomas, you dropped James' SoB in this patch (I
guess as part of splitting it into four patches), so I re-added it as it
was in the original v3:
    https://lore.kernel.org/buildroot/20220516210756.3093190-1-james.hilliard1@gmail.com/

> Thomas Petazzoni (3):
>   arch/Config.in.powerpc: disable some variants on ppc64le
>   support/scripts/gen-bootlin-toolchains: properly take into account
>     !BR2_STATIC_LIBS for glibc toolchains
>   toolchain/toolchain-external/toolchain-external-bootlin: regenerate
>     with correct !BR2_STATIC_LIBS handling

.. and with the rest of the series, and the blessing from Arnout on IRC:
applied to master, thanks.

Regards,
Yann E. MORIN.

>  Config.in                                     |  2 +
>  arch/Config.in.powerpc                        | 10 +++++
>  package/glibc/Config.in                       | 38 ++++++++++++++++
>  package/musl/Config.in                        | 28 ++++++++++++
>  package/uclibc/Config.in                      | 28 ++++++++++++
>  support/scripts/gen-bootlin-toolchains        |  5 ++-
>  toolchain/toolchain-buildroot/Config.in       | 43 ++++---------------
>  .../Config.in.options                         | 10 ++---
>  8 files changed, 124 insertions(+), 40 deletions(-)
> 
> -- 
> 2.35.3
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
