Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60178C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D9D60774;
	Sun,  5 Feb 2023 14:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D9D60774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gVzquZylhRq; Sun,  5 Feb 2023 14:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF2560761;
	Sun,  5 Feb 2023 14:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF2560761
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3311BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7651E60761
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7651E60761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWzyMZ9U2EeY for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:32:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BD060760
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31BD060760
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:32:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1E7E913F8DA;
 Sun,  5 Feb 2023 15:31:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:31:52 +0100
Date: Sun, 5 Feb 2023 15:31:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230205143152.GM2960@scaer>
References: <20230205124049.5139-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205124049.5139-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675607519;
 bh=FESjDjXQyXv1Mj+hDRWnesz63H8O8QAeJFceaMWAbAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ti+JpNp694IlZth2XfPLFlvd4Bn4iB/Kgq3fNQyXyRmAJOYuaRT9YRkyv4usvW8NE
 NqcIDNtxZVnjRDmypCo9wCkRiS+K3wFJXX8Q/vddYwVlqRKB9j/2npT+c8OPzJ2Ova
 uwANn/pZXqJ6IA4+ukDFyEU1ijm+sLXA932iMcQMtmRot6v9YEAYQOCk2JDEjbhjbY
 GpV+cDajcqBvZ+BTAoD7xcyDHrPut8oos8E/PTk4N36rlbadWf2W0GGjd4c9bEwrl1
 VsOHyGohDnwQ4wfP/npErXb68SFiHCthuFH0NqHiPYXjVnFcj1nbXesUb9LghkQzNk
 sepZdE2S1M5pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ti+JpNp6
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: add CPE variables
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-02-05 13:40 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:treasuredata:fluent_bit is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atreasuredata%3Afluent_bit

Even though it's not obvious from the github repository, I checked and
indeed Treasure Data is the original "editor" for fluentbit.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fluent-bit/fluent-bit.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index 6e9a33e02e..879437e5f4 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -8,6 +8,8 @@ FLUENT_BIT_VERSION = 2.0.8
>  FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
>  FLUENT_BIT_LICENSE = Apache-2.0
>  FLUENT_BIT_LICENSE_FILES = LICENSE
> +FLUENT_BIT_CPE_ID_VENDOR = treasuredata
> +FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
>  FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
>  
>  FLUENT_BIT_CONF_OPTS += \
> -- 
> 2.39.0
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
