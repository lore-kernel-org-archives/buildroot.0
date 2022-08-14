Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE3C25B08
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 15:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEAE260C26;
	Sun, 14 Aug 2022 15:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEAE260C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpe00k1Fg9Jg; Sun, 14 Aug 2022 15:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 195E860C03;
	Sun, 14 Aug 2022 15:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 195E860C03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 269D71BF422
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E5DE827B5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E5DE827B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLfsgX5yvMJL for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 15:34:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1898381C67
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1898381C67
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 15:34:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 584E660137;
 Sun, 14 Aug 2022 17:34:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 17:34:53 +0200
Date: Sun, 14 Aug 2022 17:34:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220814153453.GJ2775145@scaer>
References: <20220810110651.15132-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220810110651.15132-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660491296;
 bh=0e8N6Qkz/PtRRP5g/2PiZypfDYU1RElCDYP6bARMJwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c5Whgm8CS+X22pxM/gnhpETpTDUmFRaxt00BoCEHgeLJJawSoX9fTavye2qlYz7zn
 GtZwZIUT4yUQmfmTpcnnKxRjNhr5j7jzcfpdmiqDvJ3kFuq/3h6z6484R5nwtpcq95
 BWf/m4MPZDORukD8XONmztYua0oE3cxpYkNeuExzSasD8swaSZquB6zVWgnHYx7Qoi
 yQkMibyzjWS2eaBLapyKd+LDVrhzQT1ngesEJSJrq6Hts4fIAaS7+hvjPh4Se75bZZ
 8xCIDr+zPc+H/fDeBjaA83znosbThhEa2B1KgSdR0aCVJsW4se8cIGPA1VasbUej2G
 a7zgQOkYevRsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c5Whgm8C
Subject: Re: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.7.0
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

Yuanhao, All,

On 2022-08-10 04:06 -0700, TIAN Yuanhao spake thusly:
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/ttyd/ttyd.hash | 2 +-
>  package/ttyd/ttyd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
> index c4263d6e94..140580eee7 100644
> --- a/package/ttyd/ttyd.hash
> +++ b/package/ttyd/ttyd.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  1116419527edfe73717b71407fb6e06f46098fc8a8e6b0bb778c4c75dc9f64b9  ttyd-1.6.3.tar.gz
> +sha256  47bc98d43cf2060af06378a2113605b229c46895a391613bdaa5a1197bfe5d47  ttyd-1.7.0.tar.gz
>  sha256  711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12  LICENSE

    $ make ttyd-legal-info
    >>> ttyd 1.7.0 Collecting legal info
    ERROR: LICENSE has wrong sha256 hash:
    ERROR: expected: 711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12
    ERROR: got     : 8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack

I've fixed that, and applied to next, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
> index 856270a88d..7b582a696c 100644
> --- a/package/ttyd/ttyd.mk
> +++ b/package/ttyd/ttyd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TTYD_VERSION = 1.6.3
> +TTYD_VERSION = 1.7.0
>  TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
>  TTYD_LICENSE = MIT
>  TTYD_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
