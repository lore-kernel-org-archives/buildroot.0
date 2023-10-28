Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69658C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237B442160;
	Sat, 28 Oct 2023 19:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 237B442160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgRY0prQ3wus; Sat, 28 Oct 2023 19:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540B442115;
	Sat, 28 Oct 2023 19:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 540B442115
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB6C21BF869
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C418242459
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C418242459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVeBwXhlaZ_2 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:33:14 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B838942115
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B838942115
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EA50320041C;
 Sat, 28 Oct 2023 21:33:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 21:33:08 +0200
Date: Sat, 28 Oct 2023 21:33:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231028193308.GH2582@scaer>
References: <20231027084159.1841045-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027084159.1841045-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698521592;
 bh=K+J/XvbvJWOa/fQpN/KFrIzgYmVAqRZ/ieZvLOJIsbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MOLpyw5wcEOQTQ2kD1G0hJZJq1vfAt64zaWAgsa9dxB7dEnI614e2VPQYnl2eonDe
 q2cjb9/kKb4//6DBcADHFdnFh8/BMkUui0hyisi7OgKDHAcAA5w+aPYBYl4NG6iCl7
 qzVcYnrAG8Q1eqmLkk0YFm8jHjfJIE7/3+svj+MBP431/xqMQYMQ/87X+YCCxFa/+2
 9bfq+vu+3ERTxkoLZGpHoPdxD1Si11yP2jdAuz6kARTnkey7kEtpyHR9d7CKwSM+xo
 aCXaxpwoQ1buJDK6dqKZ2W2Rp7Y6Cl7RnVvAmbGJZgt1E/WAMgA7Mgc1IPTx8XxHtW
 thwVMILuQFOsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MOLpyw5w
Subject: Re: [Buildroot] [PATCH] package/riscv64-elf-toolchain: add .hash
 file
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-10-27 10:41 +0200, Peter Korsgaard spake thusly:
> The host-riscv64-elf-toolchain package was missing a hash file, add it now.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash
> 
> diff --git a/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash
> new file mode 100644
> index 0000000000..9f40da0941
> --- /dev/null
> +++ b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  de2bb188300dc38d74103516ce5cfd1060dfd105e8a408e9e3991512cf27285e  riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-centos6.tar.gz
> -- 
> 2.30.2
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
