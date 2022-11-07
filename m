Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96753C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 20:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D928B60BDB;
	Mon,  7 Nov 2022 20:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D928B60BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYVRemxTWbKE; Mon,  7 Nov 2022 20:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB58860B78;
	Mon,  7 Nov 2022 20:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB58860B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A26A1BF27C
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 20:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 457B760B78
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 20:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457B760B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id loL8ODWdQYMf for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 20:15:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 532C5607B5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 532C5607B5
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 20:15:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1dd2:f7fa:6fba:b565])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A754219F591;
 Mon,  7 Nov 2022 21:15:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:15:10 +0100
Date: Mon, 7 Nov 2022 21:15:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221107201510.GH3918838@scaer>
References: <20221106102046.13138-1-heiko.thiery@gmail.com>
 <20221106102046.13138-2-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106102046.13138-2-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667852112;
 bh=W/nF1A+3ZkiE/DeqsXNqdr0P2gL92DkJ5PDjkd2GaeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kOQ+yQ/liJQQ+8fRo0VkS4g0vETqjLW6+oNaBnGYSvqL8mRolEIX0rG+/jWowcYhT
 TGop7VsJj52ascwLugOKWJLNWrGKAsFkSfxuaLOYeTMOQTn6pOSdRum/8uKG65piMF
 1D8o3ewR40dW2PYUmMTsfAbnNofB5x1adZwFFUxH70eQAxcAjcIvCeGOr3KMemGFSN
 vyDB2DkG+r7vzjdjomFlamCye7ncqgFgQdrWJcIgYLjshmtlTzp1OQnnccigvoL9vO
 Dv91nli5A4qu3uUdqr4WyFTCewOIEYo5elG2dLvMKKAQ7zEGiUyPZ9/ysCZH1MC4Dn
 KAS5UDkTbFsTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kOQ+yQ/l
Subject: Re: [Buildroot] [PATCH] configs/kontron_smarc_sal28: add
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

On 2022-11-06 11:20 +0100, Heiko Thiery spake thusly:
> Uboot host tools require openssl. So enable BR2_TARGET_UBOOT_NEEDS_OPENSSL.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233835
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/kontron_smarc_sal28_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
> index 25846c8cbd..f8515f5b76 100644
> --- a/configs/kontron_smarc_sal28_defconfig
> +++ b/configs/kontron_smarc_sal28_defconfig
> @@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
>  BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
> -- 
> 2.20.1
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
