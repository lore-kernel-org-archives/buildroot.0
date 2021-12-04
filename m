Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C34C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1875A83E0C;
	Sat,  4 Dec 2021 21:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iNiY7_Cxbew; Sat,  4 Dec 2021 21:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6385183096;
	Sat,  4 Dec 2021 21:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25A4C1BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 123C240276
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCLzmy8iORMd for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:40:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1737401AF
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:40:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BDCA25FF95;
 Sat,  4 Dec 2021 22:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638654039;
 bh=M5mi9Qy5H2rgwkAA3f1BBUth9hvU1EtEHfhjCIrfBVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YDMBAvEYnfGy1pDWwce4DaICAa/h3EoAVOYSVDERx95V9TB0xcr1IVn0UR7igfxOY
 e9r9MeFlXvZmUyfOYtFDbnBjYh4M0OAblaAI0Lyngr934cuf+nwoVfwFY6ltCdw/ip
 NuXQT2ESp9LwODSudNakbcy0iCR/NozeJSoIzXCVz9XSQ7rLDxr4p7ttEkovRu7HGn
 jGxc2NSqitPEUCQIniMwtJa47ffUunL2TgNgu91EhuuRJ7OWYPO9J4VvvaQo0+YiBP
 W+4UXx2YAPhuY8bSQVpeA5zX/o1HcQsNfA8Kix9pYRAb9vJevsTYRO2OntrNce5T8R
 KVxrUKHkYAHrg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 22:40:33 +0100
Date: Sat, 4 Dec 2021 22:40:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204214033.GH472627@scaer>
References: <20211204213717.2020023-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204213717.2020023-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/unixodbc: add
 UNIXODBC_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-04 22:37 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:unixodbc:unixodbc is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aunixodbc%3Aunixodbc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/unixodbc/unixodbc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
> index cdc4e69a7e..b447cf5ff0 100644
> --- a/package/unixodbc/unixodbc.mk
> +++ b/package/unixodbc/unixodbc.mk
> @@ -10,6 +10,7 @@ UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
>  UNIXODBC_INSTALL_STAGING = YES
>  UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
>  UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
> +UNIXODBC_CPE_ID_VENDOR = unixodbc
>  
>  UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
>  
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
