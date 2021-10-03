Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F7CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:23:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D11D61278
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D11D61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E76846F7;
	Sun,  3 Oct 2021 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWmDz5y7C1ZA; Sun,  3 Oct 2021 20:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D5DF846C5;
	Sun,  3 Oct 2021 20:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2135E1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10FAA846C5
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbPTdmGmE-_g for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:23:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0DB18469A
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:23:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E10C560006;
 Sun,  3 Oct 2021 20:23:23 +0000 (UTC)
Date: Sun, 3 Oct 2021 22:23:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20211003222323.001b6200@windsurf>
In-Reply-To: <20210930190035.25090-1-petr.vorel@gmail.com>
References: <20210930190035.25090-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20210927
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

On Thu, 30 Sep 2021 21:00:35 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> * Update unsupported testcases for musl (process.c has been removed in
> this release)
> 
> * refresh 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
>   (unfortunately still needed, it'd be great to update all toolchains)
> 
> * Backport fix after this release:
>   - 3 patches for build fix on sourcery-arm
>   - functional fix from e42149e28 ("lib: fix MemAvailable parsing")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> NOTE: would it be possible to get updated toolchains? I have to carry
> downstream patch
> 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch (the only
> motivation for me to fix it in kernel was to fix buildroot, but
> buildroot does not take this fix in toolchain).

Which toolchains ?

> changes v1->v2:
> * nit: remove */5 from patch subject

Except that you did not. So I did it when applying :-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
