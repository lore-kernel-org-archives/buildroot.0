Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8351CE95A95
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 304DC61249;
	Mon,  9 Oct 2023 15:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 304DC61249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TJaRTxfcBnT; Mon,  9 Oct 2023 15:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE48C6125E;
	Mon,  9 Oct 2023 15:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE48C6125E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A88DF1BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DE53408AA
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE53408AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgkIJPWmbOrR for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:00:49 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CC0240624
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CC0240624
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d143:e10c:f714:dfc9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3848760147;
 Mon,  9 Oct 2023 17:00:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 17:00:43 +0200
Date: Mon, 9 Oct 2023 17:00:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231009150042.GB14234@scaer>
References: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
 <20231009142915.1775087-4-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009142915.1775087-4-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696863647;
 bh=TFq1ufJ1/k1OsNwK18SZ+YUu9N843/2mO8mFCXIQGwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQHBbZE4yHbzq02DNWBCLCkB2qfWiqanVdGqKa49yea91CbbPD7eO+0qR8gMh+HjQ
 eaGC4HeFs5XyqJh9SU9BXPttPa2qj9eLvvDHnlupII9uNsQWoies6xpzbaSclF0C3x
 BUMyA57/RwWnYCtaeR9NStTGFt1FVXIpDv/jg2dcoSw9HM98IvQtcTsABVXY9An+2y
 Ew2EFUy1dV3E6/IE04uQaZYMUdfV/q0C4BeUpAzskO1tGBVCalVg0wi8sp4zSA3n4m
 pDWuSXZaEr7ZZ17S3QTKIKoiBB5kEnhD86tplfLy7SEWQunfNge1RNYNwnThgykNB1
 RitN8HyH2V4hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NQHBbZE4
Subject: Re: [Buildroot] [PATCH 4/4] package/openrc: add merged user support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-09 16:29 +0200, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/openrc/openrc.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 80a9dec778..c80342a174 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -37,6 +37,12 @@ else
>  OPENRC_CONF_OPTS += -Dpam=false
>  endif
>  
> +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> +OPENRC_CONF_OPTS += -Dsplit-usr=true

So, if the user requested a merged usr, you instruct openrc to use a
split usr, ...

> +else
> +OPENRC_CONF_OPTS += -Dsplit-usr=false

... and conversely?

We need a runtime test to validate those two conditions.

Regards,
Yann E. MORIN.

> +endif
> +
>  ifeq ($(BR2_PACKAGE_KBD),)
>  # keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
>  # remove them if the kbd package is not selected (e.g. devices with serial
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
