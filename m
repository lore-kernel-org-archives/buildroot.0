Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898D3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 11:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261D3405F5;
	Sun, 29 Oct 2023 11:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261D3405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxbcRztbOFGy; Sun, 29 Oct 2023 11:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12682431B2;
	Sun, 29 Oct 2023 11:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12682431B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1006C1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD8E984D73
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD8E984D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qphO-BlaOvwz for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 11:07:24 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0A0084D72
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A0084D72
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id BAA3F200417;
 Sun, 29 Oct 2023 12:07:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 12:07:19 +0100
Date: Sun, 29 Oct 2023 12:07:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20231029110719.GU687180@scaer>
References: <20231029101125.34481-1-bobrofon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231029101125.34481-1-bobrofon@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698577641;
 bh=RIZPCV8qX47Deh/LkG4+4UhcirLFaxDvEalVm00JRfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wir6KC0HkUKnhDX/raNVcpZ5Znj/3b+bBQv8Rzw6UndXvNMLAbrMQQq3MVrcrS0xl
 FkeWYMecb7+5k1wxLGocPFaP53TEcvgAmpRL9Nl/xTRlOGIEkysN7y6l9JWXCKL+fk
 dDOdodWI49cCW/x27Mc3v1MCjUq8UhosF8URy3BvOs6vFuPbmJElHLZSlao6fREdLi
 ZCWccLcYHBuXpYrkaH0JM3gGB6KLXOsM5XiwIcjqLJk5XQyLliuX15tvGHTTB+jpjT
 NDL/5MiCA5deEr37C8+descjB7bPfG4x/LxO1FUJOEf927/Yk7+HcMdhh2apJmeF4Z
 8MiEu+FLaGvPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wir6KC0H
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: remove redundant
 SDBUS_CPP_SOURCE variable
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

On 2023-10-29 13:11 +0300, Sergey Bobrenok spake thusly:
> There is no need to define SDBUS_CPP_SOURCE explicitly because the
> github helper defines this variable internally (but uses a different
> file name).

The _SOURCE value is not set by the github helper, but the github helper
works equally well with the default _SOURCE value. In fact, the github
URLs do not care what the final component of the URL is, as it is not
used bu github to decide what to archvie.

Applied to master with the commit log slightly amended, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
>  package/sdbus-cpp/sdbus-cpp.hash | 2 +-
>  package/sdbus-cpp/sdbus-cpp.mk   | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
> index 379864e3ba..f4336228af 100644
> --- a/package/sdbus-cpp/sdbus-cpp.hash
> +++ b/package/sdbus-cpp/sdbus-cpp.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6  v1.4.0.tar.gz
> +sha256  ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6  sdbus-cpp-1.4.0.tar.gz
>  sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
>  sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
> diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
> index 2c3844094e..9ffaeb26d2 100644
> --- a/package/sdbus-cpp/sdbus-cpp.mk
> +++ b/package/sdbus-cpp/sdbus-cpp.mk
> @@ -5,7 +5,6 @@
>  ################################################################################
>  
>  SDBUS_CPP_VERSION = 1.4.0
> -SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
>  SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
>  SDBUS_CPP_INSTALL_STAGING = YES
>  SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
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
