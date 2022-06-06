Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFA8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FEB83E37;
	Mon,  6 Jun 2022 10:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0bxVovrV3M5; Mon,  6 Jun 2022 10:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0DB383280;
	Mon,  6 Jun 2022 10:24:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C61A1BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B70683280
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUpP6fWPwzVh for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:24:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3350F82A0B
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:24:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4013:c8f0:ae9b:2a1c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D795A780310;
 Mon,  6 Jun 2022 12:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654511078;
 bh=7VdSd9s3yFavcJWptJjUjc3O2iddoWw9H7OsievnJtg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sqkn1h7D+AygR//X8qejv0M0GUfwrEbvT+CbI8b9xid2xXpk0UFIn/+itirYL3iJM
 ZEzUNaZB+xJ0YAastMZcn7SLfB0Ur4tz3noJ5YdPLh0kEm6u8eWAaA1nBUpAZqPEWW
 SR1U/JEm9opIIbORbmgLJYl7bkxZiceju0Ecpin2wS4mBwsQD99jh+vRajhkiUx/G4
 gIt7D0NN12tdYVDeEBRJ3iNPJdhgsg28mIQ3GBtYtB8M0cQBP9HBs0stntz7C6rgMN
 pFgaomUth8d3lioy0+HmxD8CEYCkYusmuPqfN95cvLWCIQRQDUgKP2nWTgIy+V880X
 nSpBxrNOxccxg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Jun 2022 12:24:33 +0200
Date: Mon, 6 Jun 2022 12:24:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220606102433.GW427639@scaer>
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

On 2022-06-05 21:42 +0200, Thomas Petazzoni spake thusly:
> The starting point for this series is the investigation of several
> build failures affecting the master branch.
> 
> Most of those failures are due to the fact that we can currently
> create configurations for which no C library is available. This
> happens on architectures where glibc is the only supported C library,
> but BR2_STATIC_LIBS is enabled.
> 
> This is taken care of by the first four patches, which are basically
> split from a single patch posted by James Hilliard.
> 
> Then, another problem is that a recent commit allowed glibc only for
> powerpc8 on the ppc64le architecture, leaving a number of other
> PowerPC variants selectable with ppc64le, but for which no C library
> was available.
> 
> Finally, the toolchain-external-booltin package had a similar problem
> to the glibc/BR2_STATIC_LIBS issue: the package would be visible even
> if BR2_STATIC_LIBS=y and the selected CPU architecture is only
> supported by glibc.
> 
> Thomas
> 
> James Hilliard (4):
>   package/uclibc: introduce and use BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS and
>     BR2_PACKAGE_UCLIBC_SUPPORTS
>   package/glibc: introduce and use BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and
>     BR2_PACKAGE_GLIBC_SUPPORTS
>   package/musl: introduce and use BR2_PACKAGE_MUSL_ARCH_SUPPORTS and
>     BR2_PACKAGE_MUSL_SUPPORTS

Those three patches, applied to master, thanks.

I've however re-ordered them so that glibc comes first, which is then
used as an argument for keeping the same construct in uClibc-ng (so I
tweaked the commit message slightly), and to make the same argument in
musl as well (where I duplicated the commit log from uClibc-ng).

Regards,
Yann E. MORIN.

>   Config.in: only allow BR2_STATIC_LIBS on supported libc/arch
> 
> Thomas Petazzoni (3):
>   arch/Config.in.powerpc: disable some variants on ppc64le
>   support/scripts/gen-bootlin-toolchains: properly take into account
>     !BR2_STATIC_LIBS for glibc toolchains
>   toolchain/toolchain-external/toolchain-external-bootlin: regenerate
>     with correct !BR2_STATIC_LIBS handling
> 
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
