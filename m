Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D05C25B0D
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 20:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E0282980;
	Sun, 14 Aug 2022 20:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E0282980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3a18v3lJV1g; Sun, 14 Aug 2022 20:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B05B827FB;
	Sun, 14 Aug 2022 20:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B05B827FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E905F1BF3BD
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C414E40126
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C414E40126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckMlK9rKpzz6 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 20:57:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5776400AC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5776400AC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 20:57:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B3C7C60132;
 Sun, 14 Aug 2022 22:56:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 22:56:58 +0200
Date: Sun, 14 Aug 2022 22:56:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814205658.GO2854108@scaer>
References: <20220813084659.696492-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813084659.696492-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660510621;
 bh=gAtev3UPHSlE7p6EGHlnpCsQwkgsEM3Zj2i+eutRWUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OH5GMuumf6lT707gqxRXR9mg0qfeczyoYoKnKGI7zPNj+FyqrL7aObXH+S+GzmsXG
 GXjHB11BVw6Qa+uZWrVdBLG2KAP5rSJ+yIjqrE/XB4NOMVf+CcpS44vDvOy2AqyUuP
 dkAh6b0+3F9hgZe63TZQkXe6b9rxv21xSW69zLi22rGQt0e89sxfEUiYlrxogIjZoy
 QpBvft4Fq0WaUm9qe9UJ5iPRpf41tQydafsF0sQn6ouQBPdxTjsqcC/JXxVjRsZHom
 UncDQJOM0IKSwFeeMpF5xhOTwcaR2kYZW0m/oaTZn3fyXVrKlEDdvwNoQ6OfiPGVkR
 8iYJwGBl5ksrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OH5GMuum
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: ftdidmx needs gcc >= 4.9
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-13 10:46 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since re-introduction of the
> package in commit 16ff948444c3978d63f483344a3d92d994c64312:
> 
> Makefile:575: *** libusb is in the dependency chain of libftdi1 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f65baf4dd4c9a313745cdb9aefad2eae7a295469
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ola/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/ola/Config.in b/package/ola/Config.in
> index cfca09a936..701083b5d3 100644
> --- a/package/ola/Config.in
> +++ b/package/ola/Config.in
> @@ -86,10 +86,14 @@ config BR2_PACKAGE_OLA_PLUGIN_ESPNET
>  
>  config BR2_PACKAGE_OLA_PLUGIN_FTDIDMX
>  	bool "ftdidmx"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi1 -> libusb
>  	select BR2_PACKAGE_LIBFTDI1
>  	help
>  	  Build FTDI USB DMX plugin for OLA.
>  
> +comment "ftdidmx needs a toolchain w/ gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
>  config BR2_PACKAGE_OLA_PLUGIN_GPIO
>  	bool "GPIO"
>  	help
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
