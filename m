Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF5ACD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AD28613F0;
	Fri, 15 Sep 2023 22:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD28613F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAiCg3oh5qaQ; Fri, 15 Sep 2023 22:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF56261419;
	Fri, 15 Sep 2023 22:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF56261419
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3ED81BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B87C16141F
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B87C16141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vg5xTGovgLlS for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:22:19 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C011261419
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C011261419
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 07AAF2003DA;
 Sat, 16 Sep 2023 00:22:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 00:22:15 +0200
Date: Sat, 16 Sep 2023 00:22:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230915222215.GS2571@scaer>
References: <20230915215859.39831-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915215859.39831-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694816538;
 bh=dfmCeYF0XT+MB+JNkfmabG4nMQHkIRgKr8BD9WRjGbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VvpgP2i/OeyPNfHWTQ3XFiC3RYaGOuCih8NgFFBf8vc/pYkvEN6o2FR4F36Qxg1If
 pzPm416O/o9Sg6E0qUjEqTgV6vweD4yTTt0+8q92BeNYbNX3cYZQ0yVv0xXhd2ecxK
 2f5EQ+A2j/Sj6vvYEA5y3NCtOqEhnENDz/A3VTW0NCwSop9nSY9LyYh0PLWMm/atw0
 sLfyGDZvC2aERUWl2n0FnsRdenfu7S1C5eFzdKpeIlJhKANHY99HIcIVmqfowN/qXa
 Yr7m66HmyEqibAHSSPf96p6xanYhgS4CeIGI7/LQBPyEvha/JeOZfqnbQjvy3tdWvs
 EkhkHhQFVl0mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VvpgP2i/
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: add MDADM_CPE_ID_VENDOR
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

On 2023-09-15 23:58 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:mdadm_project:mdadm is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/A4FAEC6A-3572-48E9-ABB8-C96D8C8B91AF
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mdadm/mdadm.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
> index c61937306a..ef518cd238 100644
> --- a/package/mdadm/mdadm.mk
> +++ b/package/mdadm/mdadm.mk
> @@ -9,6 +9,7 @@ MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
>  MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
>  MDADM_LICENSE = GPL-2.0+
>  MDADM_LICENSE_FILES = COPYING
> +MDADM_CPE_ID_VENDOR = mdadm_project
>  
>  MDADM_CXFLAGS = $(TARGET_CFLAGS)
>  
> -- 
> 2.40.1
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
