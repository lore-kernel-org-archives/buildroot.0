Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B74C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43990409E7;
	Mon,  6 Feb 2023 10:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43990409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVl0BpsXVjIj; Mon,  6 Feb 2023 10:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD6A409FE;
	Mon,  6 Feb 2023 10:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD6A409FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1105D1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE963409FE
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE963409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N09ijNeDRjoj for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:57:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D0E409E3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17D0E409E3
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:57:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1CD1F13F87F;
 Mon,  6 Feb 2023 11:56:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 11:56:49 +0100
Date: Mon, 6 Feb 2023 11:56:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: KAMenyaev@sberdevices.ru
Message-ID: <20230206105649.GA3565@scaer>
References: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675681018;
 bh=enSfB7A6TUk7lFQ3rk1/rWL9nVEF16zIzSepmHrDn8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xlod4XvdU1WreYRO6Pzpkg+bUQj3Nu75h9kZamPX0DnxKMR4+rYH4ZQQ84ucK+Am9
 u7Q4LFzDBCJD0ji9vwFUkEIHX1ERT2ISrC8pCXo08CeHkyULmvyCjBzub03ifbWJ6M
 OVvgaGPa8DmWxDbOT3bMPnLCLJpxxNO6Mi6oxKdSqyBTpUbiwyoy/uZuDYcZAstwFR
 x1tJ0zg0P/yRt64sQTPfOWqMMM160pdOyl896k7bZDVLsPa1+dfl5yqrgfVGrNFYVy
 UkxEZrs4agKxTY0wX2HueFMYTak7ZQH6Mw+RrSPXI0RzWMbhdnJlyKPplHmeW0KaWI
 nL38f4won6Ykg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Xlod4Xvd
Subject: Re: [Buildroot] [PATCH 1/2] package/python-iniparse: add
 host-python-iniparse
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, sdfw_system_team@sberdevices.ru,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Konstantin, All,

On 2022-09-21 02:21 +0300, KAMenyaev@sberdevices.ru spake thusly:
> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> 
> Make the host variant of python-iniparse
> as host-crudini dependency.

I added a note why we need a Config.in.host entry (usually, for libs, we
do not add one, but here we must slect pythn-six, which has one).

> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> ---
[--SNIP--]
> diff --git a/package/Config.in.host b/package/Config.in.host
> index f437ef680c..fb805577d1 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -72,6 +72,7 @@ menu "Host utilities"
>  	source "package/pkgconf/Config.in.host"
>  	source "package/pru-software-support/Config.in.host"
>  	source "package/pwgen/Config.in.host"
> +	source "package/python-iniparse/Config.in.host

I reordered this in alphabetical order.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	source "package/python-cython/Config.in.host"
>  	source "package/python-greenlet/Config.in.host"
>  	source "package/python-kflash/Config.in.host"
> diff --git a/package/python-iniparse/Config.in.host b/package/python-iniparse/Config.in.host
> new file mode 100644
> index 0000000000..e93022e815
> --- /dev/null
> +++ b/package/python-iniparse/Config.in.host
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HOST_PYTHON_INIPARSE
> +	bool "host python-iniparse"
> +	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
> +	help
> +	  iniparse is an INI parser for Python which is API compatible
> +	  with the standard library's ConfigParser, preserves
> +	  structure of INI files (order of sections & options,
> +	  indentation, comments, and blank lines are preserved when
> +	  data is updated), and is more convenient to use.
> +
> +	  https://pypi.python.org/pypi/iniparse
> diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
> index d31a490bd8..e76987d1e9 100644
> --- a/package/python-iniparse/python-iniparse.mk
> +++ b/package/python-iniparse/python-iniparse.mk
> @@ -12,3 +12,4 @@ PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
>  PYTHON_INIPARSE_SETUP_TYPE = setuptools
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> -- 
> 2.37.3
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
