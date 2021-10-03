Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEDBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE52061163
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE52061163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC8F384862;
	Sun,  3 Oct 2021 08:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ffva2_MbA6fH; Sun,  3 Oct 2021 08:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1228C848CD;
	Sun,  3 Oct 2021 08:22:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 369B11BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2665F848CD
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Sg9Pun-f4oR for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:21:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A84F84862
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:21:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6F72CB0054C;
 Sun,  3 Oct 2021 10:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633249316;
 bh=NaWCFLb/n2c/Tt7zRQHoVDHD9TcVCq16PgW80ipkC4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TpuBpO+tAP3dzRFAoTBtH6f2GHkkExxZlFqAAJc3FV+sDvL9HjyvXpBGWgVKaPqcS
 BZqLgPXNKLF3Az2YiCLjjuYMPKL7qVswSICK0hzadw78rItOPdnXPEtevGmaOfakMg
 6VhItcy79BdX5n7FYZknWhdwgQbZo/xhyY/Ev9gH+vG6dnTFUCKgOaAZrVG/ygQC+O
 L4vtB8XzBLt2Mi5bQ6F7Ils4eeNjALqST8ecSifSjrD7a06n+l1+5UJT3uU8LusZUS
 V+SUWV0ahwKqOI7ZaDW4/WsELw9uT7IzzfiaM17MthJeUfY0M1Fd7t4coaQ4OzoUJ9
 Bu/lGCn9hSCLA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 10:21:52 +0200
Date: Sun, 3 Oct 2021 10:21:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211003082152.GF1504958@scaer>
References: <20210930055529.1929991-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930055529.1929991-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gdbm: needs wchar
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

On 2021-09-30 07:55 +0200, Fabrice Fontaine spake thusly:
> wchar is a mandatoy dependency since bump to version 1.21 in commit
> 60add404db424e2652673a7b6a3ba2bc80380b42 and
> https://git.savannah.gnu.org/cgit/gdbm.git/commit/src/datconv.c?id=0019677be7b751eb2d9b7e9ab25994cb696c7822
> 
> datconv.c:18:10: fatal error: wctype.h: No such file or directory
>    18 | #include <wctype.h>
>       |          ^~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b35ccdf734a02f0866fba7d86d44a8b452601607
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdbm/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
> index debe5660d7..7c8fcc4e5a 100644
> --- a/package/gdbm/Config.in
> +++ b/package/gdbm/Config.in
> @@ -1,8 +1,13 @@
>  config BR2_PACKAGE_GDBM
>  	bool "gdbm"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR
>  	help
>  	  GNU dbm is a set of database routines that use extensible
>  	  hashing. It works similar to the standard UNIX dbm routines.
>  
>  	  https://www.gnu.org/software/gdbm/gdbm.html
> +
> +comment "gdbm needs a toolchain w/ wchar"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR
> -- 
> 2.33.0
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
