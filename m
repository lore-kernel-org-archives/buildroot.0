Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB110C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 16:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E685760EE9
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 16:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E685760EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D547606ED;
	Sat, 25 Sep 2021 16:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdUkbd1-rAUM; Sat, 25 Sep 2021 16:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE1D4606DF;
	Sat, 25 Sep 2021 16:33:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F54C1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 16:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F01F40418
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 16:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTyDskG7kbF1 for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 16:33:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F010540417
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 16:33:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A383078033D;
 Sat, 25 Sep 2021 18:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632587594;
 bh=7zImlefDoiaIbOAitvI42ERNVTYie16lrprgIyr8BDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j68/n493lOkw8iYmHdxAayG/Fj7YVIaoCDZq3v71gs9kyXwbGIHyuBFC7ZLrnl9ln
 VpO8umR8QQJo2bnsGDOxRxoUp9xlSg6glgEJJH6up2HZRwO0P5VyILgnrMNorBVOpo
 vu/HjlNJ1kUAdaJi8IEoKgTAaL6M6EEXM2WDFavEx6gDX7QIEvozAmusidmryZBH3g
 CvTwjc+YjWSw+e03cM5mgOMNUjEUxzlqkqGlbdwrs0bG15Pl2blkDqop3wUS7ywoPA
 JZH50h92QSr4q3osl9VMG02vqOD2tn524od/d4QVTTbUrILTlGn+8hrFWPw4K0g2DQ
 St/tmhmpt/8fA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Sep 2021 18:33:08 +0200
Date: Sat, 25 Sep 2021 18:33:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20210925163308.GQ3176@scaer>
References: <20210924170014.111889-1-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924170014.111889-1-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-attrs: depends on python3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Asaf, All,

On 2021-09-24 20:00 +0300, Asaf Kahlon spake thusly:
> python-attrs contains a file with API for python 3.6+.
> Although we can make a "tweak" and remove this specific file
> for python2, we prefer to make this package available only for
> python3, because the day this package (and many others) will drop
> support for python2 is probably very close.
> 
> In addition, update python-attrs recursive dependencies to
> depend on python3 too (python-automat is the only one left).
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/aa6/aa6889bc254eaa93adb4fc1a71bcee9f2f23cb33/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-attrs/Config.in   | 1 +
>  package/python-automat/Config.in | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/python-attrs/Config.in b/package/python-attrs/Config.in
> index fb0ab248fa..b658d20ec9 100644
> --- a/package/python-attrs/Config.in
> +++ b/package/python-attrs/Config.in
> @@ -1,4 +1,5 @@
>  config BR2_PACKAGE_PYTHON_ATTRS
> +	depends on BR2_PACKAGE_PYTHON3

    $ make check-package
    package/python-attrs/Config.in:3: attributes order: type, default,
    depends on, select, help (http://nightly.buildroot.org/#_config_files)

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  	bool "python-attrs"
>  	help
>  	  attrs is the Python package that will bring back the joy of
> diff --git a/package/python-automat/Config.in b/package/python-automat/Config.in
> index ee02d22b5b..9d22276c2c 100644
> --- a/package/python-automat/Config.in
> +++ b/package/python-automat/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_AUTOMAT
>  	bool "python-automat"
> +	depends on BR2_PACKAGE_PYTHON3 # python-attrs
>  	select BR2_PACKAGE_PYTHON_ATTRS # runtime
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	help
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
