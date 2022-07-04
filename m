Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C1DC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 16:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D528F408C0;
	Mon,  4 Jul 2022 16:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D528F408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMhexTUg_ZJo; Mon,  4 Jul 2022 16:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7B2240260;
	Mon,  4 Jul 2022 16:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B2240260
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A09611BF373
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F2D415CC
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F2D415CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nY3bpoHiXW5b for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 16:55:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4964640922
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4964640922
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 16:55:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dbc:d4c9:1472:395c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6AE65780377;
 Mon,  4 Jul 2022 18:54:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 18:54:54 +0200
Date: Mon, 4 Jul 2022 18:54:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220704165454.GI2521@scaer>
References: <20220628164038.2836798-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628164038.2836798-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656953698;
 bh=vSDSxIrU3Cxtv58Isuo2/Fc31NFrTxzJ1iZhbXHmGPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eu6//zRa9BdwjTNfpx1DFFjSaFz/IJ4Z7Uw/e2CLNE5QPh+oL3KQh258ev/hbOVFp
 81xPwwqmpG94wqSvz8uQ7rQL5kbYUi/rguZqRhGNP2NL+B00xcb6uWdGLSZwfewToL
 OKomowVoDLFCNswl2RgqOg+72ijxQI98YbMg5F7aitBJ2/kRC8I5Ejr0Xm2/PBtRKi
 b5xaRzZkKhcqpjNJDT6HreLr25e3ne8htSTTEja1yttS8gEYFIr1qAc63POzfoa5Gg
 Xpa9wCFBL5FtRPe2NuRIW9LEldATl9FhTuFgjV/aKWkmPTcLYZUaGUJqxRWMfOprau
 sTJRq5SdwoMGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Eu6//zRa
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: add host-openssl dependency
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-28 18:40 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 776385d645b37cfc43479b37e106244aa9ab2e85:
> 
> CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
> Please set them or make sure they are set and tested correctly in the CMake files:
> OPENSSL_CRYPTO_LIBRARY (ADVANCED)
>     linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu
> OPENSSL_SSL_LIBRARY (ADVANCED)
>     linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2f05bc67112a59eba8f59ff707e43d76e41dbad1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uuu/uuu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index d1d7824018..9bf9ff123b 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -9,6 +9,6 @@ UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
>  UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
>  UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
>  UUU_LICENSE_FILES = LICENSE README.md
> -HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
> +HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb
>  
>  $(eval $(host-cmake-package))
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
