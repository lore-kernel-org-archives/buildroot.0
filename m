Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00375C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 12:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C906828AF;
	Mon, 14 Feb 2022 12:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhxTft61ZKvD; Mon, 14 Feb 2022 12:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9905828F7;
	Mon, 14 Feb 2022 12:05:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0311BF2A4
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 12:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49E3C60F1D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 12:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2BYFDUZ4Stv for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 12:05:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8362D60F18
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:05:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:892f:28b2:cec5:360f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9B5CF2003CC;
 Mon, 14 Feb 2022 13:05:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644840350;
 bh=hqNWCQ2dfJJADU0Tv+i7Im2vr3DTbDGnQXB/HQcX+fY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEs6ovFWlIDpCZOiiLWgEvE/1Tb238a/Q0To8+1cd7Y2rA+KaKbNdHpk9CQSJ1EUh
 0hLUyYBAfLwqI175j+Aj60iT4IHLsNSH4FpbOgvNdY2GrNenb5xU60JXYaPN4fn47B
 k5j/tk9I7wwpVL91UWE3Jqy0N2uyxy47x04TtefUzaNoWDxY909sZFa8sv6NViE2hh
 DGyWpVVzC1grpIlwpRVLuvfPI2fCxHxs9l8nokWYZfLnAbUI+/c6qi5xmZ2nSdNaVn
 LMtaP9NMJbs6MngwLghvPiB0N7n/UG6N6/Vp0vhaGhlTd7xgagsudlV+NZDKf7cGBN
 Zx8rmEPTZa95g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Feb 2022 13:05:47 +0100
Date: Mon, 14 Feb 2022 13:05:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220214120547.GC38097@scaer>
References: <20220214114351.2372109-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214114351.2372109-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: add bluetooth dependency
 comment
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-14 12:43 +0100, Fabrice Fontaine spake thusly:
> Commit 43122d64e05a2831a96dabcbf149ba199726767f forgot to add bluetooth
> dependency comment
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index c7e746fad3..692d562af3 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -135,6 +135,10 @@ config BR2_PACKAGE_KODI_BLUEZ
>  	help
>  	    Enable bluetooth support
>  
> +comment "bluetooth support needs a toolchain w/ headers >= 3.4"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> +
>  config BR2_PACKAGE_KODI_DBUS
>  	bool "dbus"
>  	select BR2_PACKAGE_DBUS
> -- 
> 2.34.1
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
