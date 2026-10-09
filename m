Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFDACA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 20:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4838081215;
	Fri,  9 Oct 2026 20:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMpEatmPumZ7; Fri,  9 Oct 2026 20:21:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 96E978122D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791577279;
	b=TvW9f7SS5ZbdIL6/SfqfeJh091as3gDJ5U3Z3qzqcvcjIeycTGpVUL1d+8nowI6HlZPh
	 Hk1YwZrTk4m+a0OqrxYH4c9eF+2eMvCI5Mo3cN+0mhhiw1W10pGCkgIRsLF95+hm3jAPh
	 LLrEC9A3gzSMoORIhh+YWChbAATBnJrQJoEHOg8T8yBrEKp2fAzg4WoNlNLqLyypVEuBs
	 mxoirij6qL0pGKOk3qMpD9EPLJ1RsTylf45OURTqZrOJtuZOx/g++pXbBgq0AJdunndag
	 9a0deu7XOu9WHVcakIFt4Ni81X0xP3jEI+K5wnOf77Em4x0I2mBkNTKasq2qJLoBoIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791577279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=0OnbI8RlEP7U4ppCx9RlzHMPJj+lTt7UuGH5zov1m/c=;
	b=XlatMJKVpgDUHKKdRnSNBr8KpR9sd9O2Gz9vs4WIfMEMp1MTSd2Baxe65pDZf1RPpLaL
	 b52EBmvyaZLn+7yBD1IVK7uHieMpw6gadjCHw7gPrbcCVwoPGukDQerSLwF+t2lgcKevL
	 jWTLm1SIuK11BwE5s32aUtq1eYvWzhVnJ/fWpYm5jxunHMduBi3xGtAjFIThRySXgYbpQ
	 sZtuAkK0gmULyImk3pPETuDXW6CuCYFBwWBBcVMMPfIr1QTGk7rZBB50k+r2tmRG5fwpd
	 tmKmABdvgziJ3ujF4WbOalky1IYjX1UxgtOlW8ytwz8x7qcwfD/v/cB1DOMdddXgqOw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791577279;
	bh=0OnbI8RlEP7U4ppCx9RlzHMPJj+lTt7UuGH5zov1m/c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SXibuzfpdH68N11sgvha8g1VQHKTY/n+0nUjM6eJlrKD07+KQImLnt5KA5m1PTGzB
	 kfIP9dEiAh/4oDJQtzsbVV9th/ClXKFaDHVpHYOd9psosOW0pqYSspWY9/skwOcTU0
	 hWJlXi5ddt25xbrRnUqB1687W/u6JqbY7KwKC28Lyo59wH0+uaciwYunTXHwYJGwSM
	 Gp9GoZI7cw5eqnzbYOZgT756Z/iJ0jlgku3jqXmizLmmu7dOz9Z01/rK6MEmWIkc9W
	 nUADG46BSW+ONRpSIX6G+GhH6DmpE97SNGQmR55ptOEOpdA50S+vh748O+EL2DwDw0
	 FJNXhz8kWH/HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E978122D;
	Fri,  9 Oct 2026 20:21:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AAD01DE
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F06C440194
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXcmbPYzNQ4i for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 20:21:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9380340080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791577275;
 b=I6swL+pZ/aqbChvvVGnPudFgJfDe+oLO+0/qkdguzrpz2iHMlOVtDf6pKpQ3noy4hwzE
 q3fxQ6L2Ii1Z5j+f7HFre+7QWUb2ds3Zth994Yly3adO/lqTFjcu76rn3ZldVNB7ZJ4Bg
 3cBZHDpKK5TjzQhfntmNN5K00VZn3Ae1aj135YflnrljNXRda267WC/DJ1SdxFvVCeQjp
 NbThD9aEGaaea8FS8vH+A9X1Ci9Vtqh0GmFAsjzj33H4Wbl7Cdpuphe/4yvqpdb13V3//
 rcR8/DZxssSWVG5Wjk94YaHXYb/kZcTXKnyE1il4szd6kbiNjr9MHOL389udtr3Ycpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791577275;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=d4fwDNPzHqP4TMHRldneZdWLvcR2ABRQU6ARzThNF+A=;
 b=QUvcNVwB44dvl0U4zSLD37zH4Mf130Z/Hs0MnBCIxoUkV+lNskRMi5lcvdZoFUZvpIhf
 J0YK1NF6vltqX2WaOWQPA1uV8x5lZHw0FNefnULU36RbDobV5m3H42qzE63K5LGSmlmc9
 cFedHLvon/e8GlOhXf6aBNMe+r1ekRlbnj8IKbBFbytFcOPld5KygfgGKrTZjmo7bjqg9
 N5wwK0bVExFhJdkSDe2mOCma4/5s7Czr+0Nx3NOjsCSvhjcFZNzaDZUVBngg7mRgmtK9N
 pIT8yhWubMaDPNGNeT5c1QiuyI4Ak2bgfMuvm2D0zEQOrHSHXhs0fFsvMnbKVF2T/ng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="f/PBH+Je"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9380340080
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:21:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 439F113F88E;
 Fri,  9 Oct 2026 22:21:11 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:33542])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 22:21:11 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 22:21:11 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org, Francois Dugast <francois.dugast.foss@gmail.com>
In-Reply-To: <SY8P300MB00411684A8A44ED2157BB57AB5942@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00411684A8A44ED2157BB57AB5942@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
User-Agent: Webmail Free/1.6.19
Message-ID: <ea0daeeffd12e78135a8bcc5363fd5e9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] configs/visionfive2_defconfig: bump Linux
 to 6.18.52
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fengwei,

On 07/10/2026 19:45, Fengwei Tan wrote:
> When running iperf3 with Linux 6.18.51 on VisionFive 2, one CPU core
> stays at 100% load during the test. The iperf3 server log shows the
> throughput is limited to approximately 793 Mbits/sec:
> 
> [ ID] Interval           Transfer     Bitrate
> [  5]   0.00-10.01  sec   945 MBytes   793 Mbits/sec                  
> receiver
> 
> The regression was introduced in Linux 6.14 by commit df542f669307
> ("net: stmmac: Switch to zero-copy in non-XDP RX path"). It leads to
> misaligned access exceptions when parsing packet headers. During the
> iperf3 test, perf stat reported approximately 9.6 million alignment
> faults over 5 seconds:
> 
> $ perf stat -a -e alignment-faults -- sleep 5
> 
>  Performance counter stats for 'system wide':
> 
>            9620073      alignment-faults
> 
>        5.029337000 seconds time elapsed
> 
> The kernel must emulate these unaligned accesses, resulting in
> significant overhead.
> 
> The Linux kernel CVE team assigned CVE-2026-90059 to this issue [1].
> 
> Bump kernel to 6.18.52, which contains the fix for this issue.
> 
> [1] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh
> 
> Fixes: 98aa14a186e1 ("configs/visionfive2: bump Linux to 6.18.51, 
> U-Boot to 2026.07, and OpenSBI to 1.8.1")
> Assisted-by: Codex:GPT-6.1-Sol
> Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
> ---
> Hello all,
> 
> This patch fixes a performance issue on the VisionFive 2, caused by
> misaligned access when the Linux kernel network stack parses packet
> headers.
> 
> I noticed this issue while running iperf3 tests on the VisionFive 2
> board. I captured perf data [1] and analyzed it with LLM, which
> quickly identified the relevant upstream kernel commit and the
> corresponding lore archive [2].
> 
> I rebuilt Linux 6.18.51 with the fix patch [3] applied and retested; 
> the
> issue was resolved. So I am pretty sure this issue was introduced by 
> the
> commit identified by the LLM.
> 
> [1] https://gist.github.com/tfx2001/f1f10ee1274acb7063ef1def5f2b119a
> [2] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh/
> [3] 
> https://git.kernel.org/stable/c/2ea42936416b29cca42b2c7bc7d3d3768f77c199
> ---
>  board/visionfive2/patches/linux/linux.hash | 2 +-
>  configs/visionfive2_defconfig              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/visionfive2/patches/linux/linux.hash 
> b/board/visionfive2/patches/linux/linux.hash
> index b2cfc9b7e7..1e58cd0b9f 100644
> --- a/board/visionfive2/patches/linux/linux.hash
> +++ b/board/visionfive2/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  
> linux-6.18.51.tar.xz
> +sha256  
> 2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  
> linux-6.18.52.tar.xz
> diff --git a/configs/visionfive2_defconfig 
> b/configs/visionfive2_defconfig
> index 7ce605b84b..bfe5e42cc5 100644
> --- a/configs/visionfive2_defconfig
> +++ b/configs/visionfive2_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.52"

Your motivation for this bump is well explained.

Is there any reason to bump to 6.18.52 while there is
the version 6.18.55 already available (which probably
contains many other fixes)?
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.18.55

If there is no specific reason, could you send an updated
patch which bumps to the latest 6.18.y series, please?

>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> 
> ---
> base-commit: 1ab8f8ef5af5a170a1ecbea3209ca39afd49194c
> change-id: 20261007-visionfive2-bump-linux-version-0de383d488d3
> 
> Best regards,
> --
> Fengwei Tan <tfx2001@outlook.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
