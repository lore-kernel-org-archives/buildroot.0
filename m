Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E18BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F19270419;
	Sun, 29 Oct 2023 08:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F19270419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSYzhqMqSWrc; Sun, 29 Oct 2023 08:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A55E70416;
	Sun, 29 Oct 2023 08:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A55E70416
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 448851BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C8FA43112
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C8FA43112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-m2u8P2WSO5 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:45:32 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F09F343108
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F09F343108
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E99E32003CC;
 Sun, 29 Oct 2023 09:45:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:45:27 +0100
Date: Sun, 29 Oct 2023 09:45:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20231029084527.GN687180@scaer>
References: <20231026201145.130747-1-bobrofon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026201145.130747-1-bobrofon@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698569130;
 bh=4SPAh2BcFR7Y3FgxBj2OGwYfl81z5PNFHRKSNECn8PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsA3HzPme86fY30Uqf3EObRnZw19OTF1ZxHYD9FZ3cZO4/iH2ea2h/bo04Tp4Qdjd
 h3b9O7/lIsOsM25VuIVOSTJSJ9wgu6Irh3wZNvfdgEJqDo7X57dosG+pe598zPpsNb
 WXl75iUJZ/Wt+GH+zF4QtDIf+i2jZyGY9uqXVtJFw+PN2wC8T2ywlU22UVnKsqvdrd
 4Ni54t7KymoS1K6L5NVLmBG4NDLwAkoa5zNXsE9UeZNpSDiWDwpHdVvIL3kCONoafM
 jJjWokIX2TQwVVCNkuQLKHCwaGFyKcROGVegs47l29p9uyMzjm0QR775QdM7+GgwGh
 XWq4H4QzhMoxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dsA3HzPm
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.4.0
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

Sergey, All,

On 2023-10-26 23:11 +0300, Sergey Bobrenok spake thusly:
[--SNIP--]
> diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
> index 2a6b67d6e3..2c3844094e 100644
> --- a/package/sdbus-cpp/sdbus-cpp.mk
> +++ b/package/sdbus-cpp/sdbus-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDBUS_CPP_VERSION = 1.3.0
> +SDBUS_CPP_VERSION = 1.4.0
>  SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz

I just noticed thatwe for the _SOURCE, but usually that is not needed
when we use the github helper, like we do below.

Could you try and send a patch to drop it, please?

Regards,
Yann E. MORIN.

>  SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
>  SDBUS_CPP_INSTALL_STAGING = YES
> -- 
> 2.41.0
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
