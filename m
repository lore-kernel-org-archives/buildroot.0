Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31341C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675BE61B27
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 675BE61B27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4173661AD6;
	Sun,  3 Oct 2021 07:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 444CWi6fPyqI; Sun,  3 Oct 2021 07:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 920DC61731;
	Sun,  3 Oct 2021 07:04:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C51881BF95A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1AE5843C8
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 945rUTYQR9te for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 07:04:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 702B7843C6
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 07:04:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EA830B00535;
 Sun,  3 Oct 2021 09:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633244691;
 bh=NHqXIjPlDsCc5Irr89Av4Gy0xZh56FW59vibp2RqgHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eq2iFNE21lYed75SGTKD4b11bobu2Ttnpa0Cb0qmUW6i9cof9ORDzN6MtoFcaGwNT
 kAejjp/amnesCc6CXxrKPBptxwVvf/iwrWLCAkQ1qb9MlmohbLG57hShXQAEK/JdZ1
 viWraVXM7qN7x7ZOYPOd62KSv5UL5mGe3Eo1fm101kYXz7/32FiLUAGcxkkrHvspqm
 lUiRas2z3kJQtdIi0KmCtcT+FaGj0T2jno+2JXEgM/PEmsMtKMLzgUYBMCmTlml71m
 mFfrpAnyt8M4z9kzCXBa4vBHNkjSJ/ATnnWX5KyJTrwVvYBTPB6zbjz/A4adEK2bwf
 6Dm+5Of4p8P6w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 09:04:44 +0200
Date: Sun, 3 Oct 2021 09:04:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211003070444.GZ1504958@scaer>
References: <20210930061849.2158537-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930061849.2158537-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/zbar: fix python build
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
Cc: Volkov Viacheslav <sv99@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-09-30 08:18 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with python raised since its activation
> by commit cfc80eeeb4f3cb8e59b56bedd5bd49761764671f:
> 
> In file included from /home/giuliobenetti/autobuild/run/instance-2/output-1/host/include/python3.9/Python.h:63,
>                  from python/zbarmodule.h:24,
>                  from python/zbarmodule.c:24:
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/include/python3.9/pyport.h:741:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>   741 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/43a8c8d5403c329f2d754ed09807a53772174397
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zbar/zbar.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
> index 5554dca6a1..fb83fa01d5 100644
> --- a/package/zbar/zbar.mk
> +++ b/package/zbar/zbar.mk
> @@ -34,6 +34,7 @@ endif
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  ZBAR_DEPENDENCIES += host-python3 python3
>  ZBAR_CONF_OPTS += --with-python=python3
> +ZBAR_CONF_ENV += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
>  else
>  ZBAR_CONF_OPTS += --with-python=no
>  endif
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
