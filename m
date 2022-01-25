Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED7EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED40941579;
	Tue, 25 Jan 2022 07:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QcApvwuFbir; Tue, 25 Jan 2022 07:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EC1241571;
	Tue, 25 Jan 2022 07:59:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6DD1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A488409C6
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFN2I-FgZjAt for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:58:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E090409C1
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:58:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f930:a371:1de8:7a1a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2D6A419F576;
 Tue, 25 Jan 2022 08:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643097500;
 bh=3g1gzk1XEGVTMgKTzm3JKHQq5p2aKvh10/jzTIAZuOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kqADcQsBicTMol0rrm4O2EZcImcNE00k2v56bFKgJDdv5h53CXcmRCHEMLoNy0+Kg
 jc8xbF8cURFHF65dW7KfPR6sVfxexqNNH3Gksb7DEzEkeVnWWABW5XfHRCNaq0xZnb
 ApurDcrCvCgj1yvizVzdnMtmvFLJ/eWg+WYtcleBfzax9hOJsvBDTeJXZ+tFLNzeY2
 /ZTCJ5sl7JBkN3ZBbYLj6PzL9q7mEjbG9xTXp3rnTKWr+JXH0x1Im+ELGDHSWWaSgz
 nSSAPtnMNbM8IgdSlpXkydhKBFkZSZ8eQwNp9FmrjGSPkSH6z2F5+yfiixsBUVnmRI
 qGbRqmuaLoKuw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 08:58:17 +0100
Date: Tue, 25 Jan 2022 08:58:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220125075817.GA457876@scaer>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 00/16] Bootlin toolchain updates and x86
 updates
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-25 00:00 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> Thomas Petazzoni (16):
>   toolchain/toolchain-external/toolchain-external-bootlin: re-update
>     OpenRISC toolchains
>   support/scripts/gen-bootlin-toolchains: add support for new x86-64
>     toolchains
>   toolchain/toolchain-external/toolchain-external-bootlin: update with
>     new x86-64 toolchains
>   arch/Config.in.x86: drastically simplify the BR2_ARCH definition
>   arch/Config.in.x86: add "newer" names for several Intel x86 CPU
>     variants

I was wondering if we should expand the prompt to include the fact that
they are deprecated, or specific to gcc versions before 4.9... But
whatever I tried was ugly or confusing, so I just left it as-is.

Full series applied to master, thanks.

Regards,
Yann E. MORIN.

>   arch/Config.in.x86: westmere and silvermont were added in gcc 4.9
>   arch/Config.in.x86: add broadwell Intel CPU variant
>   arch/Config.in.x86: add skylake CPU variants
>   arch/Config.in.x86: x86-64-v4 implies AVX512
>   support/scripts/gen-bootlin-toolchains: add missing
>     BR2_X86_CPU_HAS_AVX512 condition for x86-64-v4
>   toolchain/toolchain-external/toolchain-external-bootlin: regenerate
>     with AVX512 condition for x86-64-v4 toolchain
>   arch/Config.in.x86: add cannonlake, icelake-client, icelake-server CPU
>     variants
>   arch/Config.in.x86: add goldmont, goldmont-plus, tremont, cascadelake,
>     tigerlake CPU variants
>   arch/Config.in.x86: add cooperlake CPU variant
>   arch/Config.in.x86: add sapphirerapids, alderlake, rocketlake
>   arch/Config.in.x86: indicate how the CPU variants are ordered
> 
>  arch/Config.in.x86                            | 294 ++++++++++-
>  support/scripts/gen-bootlin-toolchains        |  49 ++
>  .../tests/toolchain/test_external_bootlin.py  | 225 +++++++++
>  .../Config.in.options                         | 457 +++++++++++++++++-
>  .../toolchain-external-bootlin.hash           |  46 +-
>  .../toolchain-external-bootlin.mk             |  98 +++-
>  6 files changed, 1129 insertions(+), 40 deletions(-)
> 
> -- 
> 2.34.1
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
