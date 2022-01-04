Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812DAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237B041507;
	Tue,  4 Jan 2022 22:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cbxZOAlhizf8; Tue,  4 Jan 2022 22:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3C6414E6;
	Tue,  4 Jan 2022 22:16:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 767721BF2BE
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 732C98270B
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DglXwhVT2Dax for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:16:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 782C582640
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:16:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd8f:11a1:7592:f85e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4FD3320039C;
 Tue,  4 Jan 2022 23:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641334559;
 bh=fnIMn4X41xrf/fcGKwDY4pcmrKt5ddFunTYNHPGitlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MHzQN9G17PUY4WPReed1kaEklWI9VOHzgXtlIKNvMuP/5UvHpjrV3M8KcHk68yBjX
 Gjc5peo3Y7MAHB60l70ta9bvIuYnJunk7LFB2YhzFgxjPNUHMqF0CG5f8OFRjTqbhV
 QUCmLwiYMZCHfDPx7nvQJJDSDBBJdChZ6iTl+pHFl24+zwisOx421h5y3kbf83xUPU
 Dxfv9Y0bGpLZAdW4clQbxXNnJvnHuuWGcAnrqCt1zdsaIIzWKFSdlx3aqzHE5za3Gg
 J8cyxkpEkxybWeqRa8jDafoPuRFS6pTThN0lC7ma6RvD9cjzJt/yjUWC1y7fK3vKPV
 Q7HhdZKxheovQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jan 2022 23:15:51 +0100
Date: Tue, 4 Jan 2022 23:15:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220104221551.GD614810@scaer>
References: <20220101213948.265173-1-ju.o@free.fr>
 <ca0f9046-093a-194e-ad8f-01de07f0d3a1@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca0f9046-093a-194e-ad8f-01de07f0d3a1@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: fix
 riscv64 toolchain configs
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-01-04 18:16 +0100, Arnout Vandecappelle spake thusly:
> On 01/01/2022 22:39, Julien Olivain wrote:
> >commit b3c66481e1f1503fcbf193d0c780271e880ad500 replaced RISC-V LP64
> >toolchains by RISC-V LP64D. The config symbols
> >BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE and
> >BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE were marked as legacy.
> >Those changes were not reflected in the autobuild toolchain configs in
> >support/config-fragments/autobuild/bootlin-riscv64-{glibc,musl}.config
> >
> >When testing a package with the command:
> >
> >     ./utils/test-pkg --all --package somepackage
> >
> >bootlin-riscv64-{glibc,musl} toolchain are always skipped. The build
> >logfile contains:
> >
> >     [...]
> >     Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN not in final .config
> >     Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> >     Actual value:
> >
> >     Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE not in final .config
> >     Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
> >     Actual value:     # BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE is not set
> >
> >This commit update the autobuild config fragments for RISC-V 64bit
> >toolchains so they can be used by test-pkg.
> >
> >Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
>  Applied to master, thanks.
> 
>  While reviewing this, I noticed that
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE in fact never existed,
> so I sent a patch to fix that as well [1]. Unfortunately, I forgot to Cc
> Thomas on that, so Thomas consider yourself CCed now :-)

Ah, I see how you noticed that issue, now.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> 
> >---
> >  .../config-fragments/autobuild/bootlin-riscv64-glibc.config   | 4 ++--
> >  .../config-fragments/autobuild/bootlin-riscv64-musl.config    | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> >diff --git a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> >index f6c6fcaa36..433a6e89f7 100644
> >--- a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> >+++ b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> >@@ -1,5 +1,5 @@
> >  BR2_riscv=y
> >-BR2_RISCV_ABI_LP64=y
> >+BR2_RISCV_ABI_LP64D=y
> >  BR2_TOOLCHAIN_EXTERNAL=y
> >  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> >-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
> >+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE=y
> >diff --git a/support/config-fragments/autobuild/bootlin-riscv64-musl.config b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
> >index 2b6a6e56da..fee1f29f4a 100644
> >--- a/support/config-fragments/autobuild/bootlin-riscv64-musl.config
> >+++ b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
> >@@ -1,4 +1,4 @@
> >  BR2_riscv=y
> >-BR2_RISCV_ABI_LP64=y
> >+BR2_RISCV_ABI_LP64D=y
> >  BR2_TOOLCHAIN_EXTERNAL=y
> >-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE=y
> >+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
> >
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
