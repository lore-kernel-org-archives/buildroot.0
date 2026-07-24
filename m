Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA26C531D0
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 03:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB4D405B5;
	Fri, 24 Jul 2026 03:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkaYJuBtzQuq; Fri, 24 Jul 2026 03:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F3BF40629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784862676;
	bh=l6Ell0H+soKxW/a+zZ/YHeqUE4Ba5M8PhWzIy7tnlMg=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GuCQdWa6SmEn3oYEvv+o5WMyxGXChcl0N49HkvFwwy3rdGTkTnFcSyOvhzMdSVv6a
	 FTBL5MR9GzXFqKhuP74w07OUlqj53x8PIqlfO8bJmrS2biUU91gzGO7oadc1aTwtZA
	 guNJuWhA4bb4SgDy3lTswNt7DFmCCXzgxQ/ZSO3FEzzPWpbmVjAUKo9lIvEiBIt95S
	 44YrIZcaBbVz2Z62NmCU5qGBdMuBTsbO56MRSCiEa82aLI36eseWbi7R2yohcPf1l2
	 FgpP2t/taF1l9RkV7WKOiUgaYf0eD15RwCt/YcC+jJpwSCm+M1PApE0cWEQrMUdAOo
	 biCpIz7dHnbhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F3BF40629;
	Fri, 24 Jul 2026 03:11:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 512B4490
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 03:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F66810F7
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 03:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5d3lEounzVVM for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 03:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 330A4810E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330A4810E2
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 330A4810E2
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 03:11:11 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9358731E0D44; Fri, 24 Jul 2026 05:11:07 +0200 (CEST)
Date: Fri, 24 Jul 2026 05:11:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <amLXynHKF2zuPoI2@waldemar-brodkorb.de>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
 <20260721184249.1579381-2-dario.binacchi@amarulasolutions.com>
 <59d2eac82e3a58e006e67d3ee35f3bf6@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59d2eac82e3a58e006e67d3ee35f3bf6@free.fr>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1784862667; bh=gVjkJZ6saj0+jP/E2gsOTLm0agm9+P2kIGYCOI7KtRU=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=iR5I7KJhF1B0zurZvVuuDO53pCQ3vkjUf5DwoHGTdOBaeDWH1tsgzM6liqseiHtDv
 ynR0NhQdDDMsbS8lLdKCf7dajMfo9lZZBQnSnOSRgAr+uxkbYlao4YCFGP7Mm7j01n
 Rop4Rrvke/0sOdWZiqoJowFynYH3waT/pShC0kc9CLciAEiK2VNknxn9Qu/NC8DsrZ
 aCBluIWEhhmXw93WW23bITtaIo2pbkp51jxF8d19r/f4giY/wKAc5hlHjvpM8Nm06y
 GvhuA3j5Ll0r+tzBFPoTf3rkigspKphvZ2uWQJQvp9VKG/GvQ9JfyotyJ+ts/38Nc+
 7dokJsZY57wsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: Re: [Buildroot] [PATCH 1/6] configs/stm32f429_disco_xip: fix boot
 failure after uClibc bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,
Julien Olivain via buildroot wrote,

> Hi Dario,
> 
> On 21/07/2026 20:42, Dario Binacchi wrote:
> > Since uClibc was bumped to 1.0.58 (c7fef3704c70, "package/uclibc:
> > bump to 1.0.58"), the board fails to boot:
> > 
> >     sh: out of memory
> >     Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x00000100
> >     CPU: 0 PID: 1 Comm: init Not tainted 6.1.167 #2
> >     Hardware name: STM32 (Device Tree Support)
> >     Function entered at [<0800ea1e>] from [<0800de7b>]
> >     Function entered at [<0800de7b>] from [<080e4991>]
> >     Function entered at [<080e4991>] from [<080e2d19>]
> >     Function entered at [<080e2d19>] from [<080125eb>]
> >     Function entered at [<080125eb>] from [<08012b09>]
> >     Function entered at [<08012b09>] from [<08012b69>]
> >     ---[ end Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x00000100 ]---
> > 
> > The STM32F429 has no MMU, and uClibc's standard malloc() implementation
> > returns NULL for allocations performed during early init on this target,
> > causing init to abort immediately.
> > 
> > Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
> > meant for small/noMMU systems, via a uClibc config fragment. The
> > fragment is placed under board/stmicroelectronics/common/stm32f4xx/,
> > rather than under the board-specific directory, so that it can be
> > shared with the STM32F469, another Cortex-M4/noMMU board affected by
> > the same issue, which will be fixed in a subsequent patch.
> 
> For info, the issue may have been introduced by uclibc commit:
> https://github.com/wbx-github/uclibc-ng/commit/487af14988c3c923aa661f204642597cff356a83
> 
> There is an upstream fix, not released yet,  which seems to fix the issue:
> https://github.com/wbx-github/uclibc-ng/commit/7730f0d05a51cd89a7123bd696e4638c3c035d7b
> 
> You could possibly drop this malloc config change after the next uclibc
> bump.
> 
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> In the meantime, I applied this series to master, thanks.

I sent following patch to avoid any breakage before the next
release:
https://patchwork.ozlabs.org/project/buildroot/patch/ai6stJaA2hWFBHDW@waldemar-brodkorb.de/

But it was not accepted, yet. Xtensa and M68k noMMU is also
affected.

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
