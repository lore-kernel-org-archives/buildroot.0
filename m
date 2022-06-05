Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452E6C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E386129B;
	Sun,  5 Jun 2022 19:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaOjm27mubSZ; Sun,  5 Jun 2022 19:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22CEB61292;
	Sun,  5 Jun 2022 19:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8673E1BF968
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F8140D24
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufy8pf6y9Giy for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:42:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B36640180
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:42:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3d1d:2cca:75e8:9e80])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 178CB780340;
 Sun,  5 Jun 2022 21:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654458118;
 bh=bLgGqfZ4zr82fKAMHfK2Bo6CBGTI3LPgbgeuFV1fj44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EIZlzLQbaoYeQINRbk+hORHeI05XuTs2rNOfCO9aMayGvafSZMWJsPBZsVsRHLySt
 Wvq4QCc15F+uRuqA0wFVQgNEcFDaSCIZWBxAJBYGNWK5H99bpKZpAssfC37xAQTWf/
 1TatzHjDYYIxpiMP63jg7WCg4o4KInU14Uo05cY2uem6rDigQrt7SiQOBIwaOAGeaZ
 21EWVSXhcUhUSaunkwGNjGSnESLRmpNt+CSgVtRI+IptJF0LeG2nuS3NWv6YVKolUO
 uiickyT67UR7IhCLWv2nyW6YO7KRJGzxP04xAQknSbIszOVorJ3tA8Upx4Kyj+rTJz
 xRUB3VzHkvwZA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Jun 2022 21:41:55 +0200
Date: Sun, 5 Jun 2022 21:41:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220605194155.GT427639@scaer>
References: <20220605165253.2155286-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605165253.2155286-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: thermal needs
 threads
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

Fabrice, All,

On 2022-06-05 18:52 +0200, Fabrice Fontaine spake thusly:
> tmon needs threads since its addition in kernel 3.13 and
> https://github.com/torvalds/linux/commit/94f69966faf8e70bd655ea25f9dd5b9400567b75:
> 
> tmon.c:23:10: fatal error: pthread.h: No such file or directory
>    23 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d7b3d15ebf80ca6dbbbd4554af541182c777e4de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-tools/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 131380cb02..732ac65a25 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -122,12 +122,16 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dyna
>  
>  config BR2_PACKAGE_LINUX_TOOLS_TMON
>  	bool "tmon"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LINUX_TOOLS
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	  tmon is a terminal-based tool (using curses) that allows the
>  	  user to access thermal information about the system.
>  
> +comment "tmon needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_LINUX_TOOLS_HV
>  	bool "hv"
>  	depends on BR2_i386 || BR2_x86_64
> -- 
> 2.35.1
> 

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
