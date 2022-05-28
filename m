Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099F3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 22:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DF841952;
	Sat, 28 May 2022 22:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BqtzviZH-em; Sat, 28 May 2022 22:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392E041936;
	Sat, 28 May 2022 22:30:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4D321BF580
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9417D84A89
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-tmfDmN756p for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 22:29:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A993684A88
 for <buildroot@buildroot.org>; Sat, 28 May 2022 22:29:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 176A819F4B5;
 Sun, 29 May 2022 00:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653776996;
 bh=2YJ4c82eP8j4UzEIXg8mSAopfppqRI5TXhsULdPiTkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJYAvJzTpqf9OC/yD57ogq3m9mqE44sh5e8FqJrar2pFTjRazJQ3HrbUcOUOurHTH
 C+RTzO2y13DvkxBeokn0uNXeO/fktzG3hhWfhAY/t1S120Rgar6vaCk697hEIuZ/NZ
 DiNxf6xN/zalGepwbYrOuveZ2T0vchdlKM8/QlCm/KghF/Bom4zPIMFbHoeYuuA4bN
 dgg9oIZnaiOEEGWEZWvwIBjj6PIROVspx8xhNh4uBKSXGIHyuIdjSVIoXx9jLkhNRU
 uS2n7GYPIMEOmZjShixGRZRaITaNGQO+GDqGksxOj0EyXZ/bagYa05JWauRXngT+A1
 Svo71o6Mo6NTw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 00:29:52 +0200
Date: Sun, 29 May 2022 00:29:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220528222952.GQ301044@scaer>
References: <20220527205505.1749320-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527205505.1749320-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: stageprofi and usbdmx
 needs gcc >= 4.9
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

On 2022-05-27 22:55 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since re-introduction of the
> package in commit 16ff948444c3978d63f483344a3d92d994c64312:
> 
> configure: error: compiler with C11 support is required to build libusb
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7b15e23392805f5109c136a5aa870ddf49f48814
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ola/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/ola/Config.in b/package/ola/Config.in
> index 399f7702fc..cfca09a936 100644
> --- a/package/ola/Config.in
> +++ b/package/ola/Config.in
> @@ -153,10 +153,14 @@ config BR2_PACKAGE_OLA_PLUGIN_SPI
>  
>  config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
>  	bool "stageprofi"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb

It is my opinion that, when selecting a package from a package
sub-option, all thes dependencies of the selected package should be
propagated, even if the main package already depends on some of then.

It makes it easier to see that everything is accounted for; it also
makes it automatically correct when the main package is updated and
loses that dependency.

However, this is not a written rule, if is far from being systematically
enforced, and I am not even sure all maintainers agree...

Ergo, applied to master, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_LIBUSB
>  	help
>  	  Build StageProfi plugin for OLA.
>  
> +comment "stageprofi needs a toolchain w/ gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
>  config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
>  	bool "uartdmx"
>  	help
> @@ -164,10 +168,14 @@ config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
>  
>  config BR2_PACKAGE_OLA_PLUGIN_USBDMX
>  	bool "usbdmx"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>  	select BR2_PACKAGE_LIBUSB
>  	help
>  	  Build USB DMX plugin for OLA.
>  
> +comment "usbdmx needs a toolchain w/ gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
>  config BR2_PACKAGE_OLA_PLUGIN_USBPRO
>  	bool "usbpro"
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
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
