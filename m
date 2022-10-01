Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE43C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9111883F9D;
	Sat,  1 Oct 2022 16:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9111883F9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kISS58xWkvNd; Sat,  1 Oct 2022 16:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E82829FD;
	Sat,  1 Oct 2022 16:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98E82829FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACF4D1BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8784D60ABF
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8784D60ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwaV1_63MRZo for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:33:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78184605AC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78184605AC
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:33:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C4468780333;
 Sat,  1 Oct 2022 18:33:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:33:01 +0200
Date: Sat, 1 Oct 2022 18:33:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221001163301.GG30794@scaer>
References: <20220930033722.1898827-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930033722.1898827-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664641983;
 bh=exRYJUf5fyjgZXoU1wPlp9nmr1ggsG+Wv6IwVFQ65gM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gMDkDGQgGgkai412SIBh1Vdir2l8qppf0rhoHv2hvgIWZLnrgAqtdFVRrQFKO9o8j
 BwSw+4ggJMqWINmDC3mKck5vpjEWCQtom14SUV7Q2LVGfZrL2LqElCyAomSnb3Ag54
 4Lf7e6jlf7/1OCYe+xQWx80y+Y1hp3FCh/BG7PuvjtHM+z8D9yRVmHdclswOxVa7Ef
 l2h6s3OAnUx7oARm2vKL/lKN10j5BJ+hbF0RHuvSrkvxNup8pnMO6QRqPdjgw2XwFj
 R8A/n6drwnzQlq/1nTINAFzmZDbPYzs262gIP21p4ofVMJUX/Qsx9fdIFoUYusZRLQ
 Act3t7+PK16lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gMDkDGQg
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump to
 version 11.0.0-297
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

On 2022-09-29 21:37 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
>  package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
> index 6133b1326a..edfca1ea02 100644
> --- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
> +++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
> @@ -1,3 +1,3 @@
>  # locally calculated
> -sha256  bcb0e5ae2d15f9876551fda46b222f911ed5afd626dfbcc66ddea9d36563ac9c  spirv-llvm-translator-v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18.tar.gz
> +sha256  bdd7cb677b9fcaaff1cce2153de9d69298f136edecaef3631915614bb5db09a1  spirv-llvm-translator-v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2.tar.gz
>  sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
> diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> index 73f7fe02de..159f7d3b52 100644
> --- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
> +++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> @@ -6,7 +6,7 @@
>  
>  # Generate version string using:
>  #   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
> -SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18
> +SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2
>  SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
>  SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
>  SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
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
