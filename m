Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1642BC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 15:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60029408A2;
	Sun, 29 Jan 2023 15:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60029408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_NMVv6ok6Xp; Sun, 29 Jan 2023 15:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C2D408A8;
	Sun, 29 Jan 2023 15:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C2D408A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD4E21BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B817A4026F
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B817A4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7OWbZxH0SWk for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 15:56:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F41D401B1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F41D401B1
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 15:56:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3BD9C5FFA7;
 Sun, 29 Jan 2023 16:56:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 16:56:22 +0100
Date: Sun, 29 Jan 2023 16:56:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230129155622.GH2632@scaer>
References: <20230129094530.884944-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129094530.884944-1-thomas.devoogdt@barco.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675007787;
 bh=+MwJlkyiDPGS7l1oybl9XDLZdTjY0Yw6Jy4EE7ZKvg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rHnYgnMyQaFh8odDAyoaftCbSwax9A3pJSt469tRWpa1ywz8RZAaf3mT0pe7PO4f8
 /ykwtna9mb2VYIiLT+5FiYOxcDxbhlaMGdSPE5s6QGKMFoqESMQVRgBEMFzFk7Zo9e
 blPqhCniCQtMuBTMQaZyOi1P+lbkVW4Ub11QffqpmQmP/ed3Q6QoTQ6GYVPmuyje/i
 /cY4UEQlZabugQjJFqo5vU2MSDSrEa+3NWZe4MXOg6xrJZn9E/xTZOz7ur/RVnwwOF
 zAzB4kYSKQyuOuarxv8MFD3bj8GndxhTD3/FM1reWumORA+qDWbzGBuKw4+3mzBN0D
 zTYauGcIbO9rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rHnYgnMy
Subject: Re: [Buildroot] [PATCH v2 1/3] package/fluent-bit: needs C++
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-01-29 10:45 +0100, Thomas Devoogdt spake thusly:
> From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/007/007c7c69e54b8ff663891da4535e2e95d40c42a2/build-end.log
>  - http://autobuild.buildroot.net/results/ede/ede6f9fb67c0c26ff02e71a3d20e3d4344ea59f0/build-end.log
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> ---
> v1 --> v2:
>  - added package/ prefix to the git message
> 
>  package/fluent-bit/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
> index 11ceb55d4f..bd89c05faa 100644
> --- a/package/fluent-bit/Config.in
> +++ b/package/fluent-bit/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_FLUENT_BIT
>  	bool "fluent-bit"
> +	depends on BR2_INSTALL_LIBSTDCPP

Are you sure? The test that fails is that cmake can't find a C++
compiler, indeed.

But if we look at the source tree, we can see that fluent-bit itself is
written in C, and that there are only 4 bundled libraries that have C++
source files:
  - librdkafka, which is optional;
  - c-ares, and it's only for tests;
  - jemalloc, and C++ is only optional there;
  - wasm-micro-runtime-WAMR, but that is only when targetting
    web-assembly, which we don't.

So, I thnk the test in CMakeFile.txt should be fixed to bot require C++
by default, and only enable C++ support when it is needed (i.e. just for
the Kafka bacnkend?), and then in Buildroot, we disable the Kafka
backend when we don;t have C++, and only enabke it when we do (or even
add an option for it).

Looking at the kafka backend, it should also be possible to not require
C++ for it, as it builds two libs, a C-ionly one, and a C++ one.

Regards,
Yann E. MORIN.

>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_LIBYAML
> @@ -8,5 +9,5 @@ config BR2_PACKAGE_FLUENT_BIT
>  
>  	  https://github.com/fluent/fluent-bit
>  
> -comment "fluent-bit needs a glibc toolchain"
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +comment "fluent-bit needs a glibc toolchain w/ C++"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.39.0
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
