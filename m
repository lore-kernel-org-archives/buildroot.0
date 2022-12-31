Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8786BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EADA060803;
	Sat, 31 Dec 2022 17:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EADA060803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBlDlI9NaPY4; Sat, 31 Dec 2022 17:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 372F260615;
	Sat, 31 Dec 2022 17:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 372F260615
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 391D11BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13E18812BD
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E18812BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBaH7WIM0FcJ for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:22:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC0FF8129F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC0FF8129F
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:22:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9C2F113F87E;
 Sat, 31 Dec 2022 18:22:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 18:22:00 +0100
Date: Sat, 31 Dec 2022 18:22:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221231172200.GR2498764@scaer>
References: <20221231164309.161268-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231164309.161268-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672507324;
 bh=1/GjfwFDf3tkDQ+CKa8L271of3ZB/WYrLlXLHs3TiGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDbuCimzMLrOitOlGYoM6jWQteR6ZijxCQaTKdq0cbnmB9npvovzcXhnlJs7wSP7Z
 Y1X4NoV+dh8KNyi3YnjL85VAxNJ0VZY+3z27Mv8FgYDPnx+B3wucWYRvSaUIfQ6WeG
 zQ+myA/4Dc2Hi7JuKoc0SVnhV5sLXWpI4+qGas0AlT6vBOaz2Gv4p8Z3u85i6q9jOL
 uJMFJ58oIRPODfJhlKQ+jJvuqbNKFXFj4F2FY0PPpqhjP4Kzu47dMMn4Df3ui5DOdP
 GH/oqhryAUarGXa3iNA0Wle8UANCRIJpM/AH3vE6Yj4Iey6GATeh03lPwZ8+D7f1Yb
 r7NS4nDz4Tglg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GDbuCimz
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: disable man pages
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
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-31 17:43 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/modem-manager/modem-manager.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 5b8b9c5576..f1fc17523a 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -13,6 +13,7 @@ MODEM_MANAGER_SELINUX_MODULES = modemmanager
>  MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
>  MODEM_MANAGER_INSTALL_STAGING = YES
>  MODEM_MANAGER_CONF_OPTS = \
> +	-Dman=false \
>  	-Dpowerd_suspend_resume=false \
>  	-Dtests=false \
>  	-Dudevdir=/usr/lib/udev
> -- 
> 2.35.1
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
