Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D3BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E849440609;
	Sat, 16 Jul 2022 22:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E849440609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXAn2tjoIhRV; Sat, 16 Jul 2022 22:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED5C0404F6;
	Sat, 16 Jul 2022 22:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED5C0404F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4E7A1BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CB2160F22
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB2160F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDqs24qaywqI for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:23:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E1F60A75
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9E1F60A75
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:23:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D0596780502;
 Sun, 17 Jul 2022 00:23:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:23:44 +0200
Date: Sun, 17 Jul 2022 00:23:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716222344.GS2543@scaer>
References: <20220714163836.14576-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714163836.14576-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658010228;
 bh=f1xPEg9QdtBBxhATvmsrP5jFNXtEpOviQgjSdNsfngM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwwEt4oWl+BXN5jyhE8/qUGdYN6GQNQGszaM2Rc4SCPRfkz+xqEKtGj8/6kP88KFF
 HFq25lZwyviCHN4vDvf43eo2L8UO7iw9irVe9pMdDv56Y+n9O0ht2wGt0yrCejyfdI
 rR2Ax/YXTiqziZc1C35RzdUpdrwrt3La0P7YyPrmHEygoxYCCUQZMECIqoUl7IVbL9
 vTpg10AJWbVFNFgehMHyAZkPz8IazNpOH9N5uU8RCGALdRfiSMkXSLrGwFi7BbWN/m
 Gy695o+6qx1OGmCjX9qTXlixBtTkwwFzzJaohsZJP0Eg4W/1yDPndAVPOqpKxBa9ck
 aeIaanIUL1Nbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iwwEt4oW
Subject: Re: [Buildroot] [PATCH 1/1] package/assimp: add ASSIMP_CPE_ID_VENDOR
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-14 18:38 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:assimp:assimp is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aassimp%3Aassimp
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/assimp/assimp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index 42440f0fa9..79865673ac 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -8,6 +8,7 @@ ASSIMP_VERSION = 5.2.1
>  ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
>  ASSIMP_LICENSE = BSD-3-Clause
>  ASSIMP_LICENSE_FILES = LICENSE
> +ASSIMP_CPE_ID_VENDOR = assimp
>  ASSIMP_DEPENDENCIES = zlib
>  ASSIMP_INSTALL_STAGING = YES
>  
> -- 
> 2.35.1
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
