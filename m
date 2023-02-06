Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB26AC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B73381330;
	Mon,  6 Feb 2023 11:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B73381330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8l0qBLuXsDB; Mon,  6 Feb 2023 11:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B413812DB;
	Mon,  6 Feb 2023 11:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B413812DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C00C1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42A44812DB
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A44812DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJKlQp2wrNpx for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:01:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A1B81299
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35A1B81299
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:01:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3DF3B13F8BB;
 Mon,  6 Feb 2023 12:01:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 12:01:10 +0100
Date: Mon, 6 Feb 2023 12:01:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: KAMenyaev@sberdevices.ru
Message-ID: <20230206110110.GB3565@scaer>
References: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
 <20220920232154.1219792-2-KAMenyaev@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920232154.1219792-2-KAMenyaev@sberdevices.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675681278;
 bh=5Gm+0IKmgI37H1cvaD74FE/ru667pzFaXmlRKDbOUyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U3PZwkA48NYD3yRC2WC0Sy7NApp1Q+12Ys00No/PMXcUkkMn7R40J/KqjErmHyTKY
 0SUT8K+WGQjOjl0bW2XMf6HqZ6TPsKJHSvjvHeTz79FtV5IAzoDdcGvJSS8/Arg7zu
 z776XrFYqEWSlbY2Oo+zpo2wgNbbb5onwdt5otwnylxuV98cOCCo4p8W3iDUE1Cj7+
 Hk0Bm5FGd+nwRionNpI0azb+WoqiWBctLnK+5A4HxwKC2HPgYU7FteMEQOomf9KVsJ
 3yhFXFi2CItLubUnCBGAPU5yTR5tY9DAqtEi0DY5+CRXPewlC5X9E79bkz93JyXRum
 5ZzZlO29VJ0uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U3PZwkA4
Subject: Re: [Buildroot] [PATCH 2/2] package/crudini: add host-crudini
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

On 2022-09-21 02:21 +0300, Konstantin Menyaev via buildroot spake thusly:
> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> 
> Make the host variant of crudini package. This can be useful in
> post-{build,image} scripts.
> 
> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> ---
[--SNIP--]
> diff --git a/package/crudini/Config.in.host b/package/crudini/Config.in.host
> new file mode 100644
> index 0000000000..5e0040883f
> --- /dev/null
> +++ b/package/crudini/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_CRUDINI
> +	bool "host crudini"
> +	depends on BR2_PACKAGE_HOST_PYTHON3

I've changed that to a select, like allthe other host packages that need
host python3, and applied to master, thanks.

Regards,
Yann E. MORIN.

> +	select BR2_PACKAGE_HOST_PYTHON_INIPARSE # runtime
> +	help
> +	  A utility for handling ini files from the command line and
> +	  shell scripts
> +
> +	  https://pypi.python.org/pypi/crudini
> diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
> index 7141e2b2a0..c376c5f777 100644
> --- a/package/crudini/crudini.mk
> +++ b/package/crudini/crudini.mk
> @@ -11,3 +11,4 @@ CRUDINI_LICENSE = GPL-2.0
>  CRUDINI_LICENSE_FILES = COPYING
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
