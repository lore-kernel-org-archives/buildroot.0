Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E645DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98493402EA;
	Sat, 25 Dec 2021 15:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfmiNIWTIzqe; Sat, 25 Dec 2021 15:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5EC6402C3;
	Sat, 25 Dec 2021 15:06:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451671BF32E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4050C401FB
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnsBaFF_Vk9Q for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3388540110
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:06:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b527:fd15:94c1:e7d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 40CD513F86A;
 Sat, 25 Dec 2021 16:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640444777;
 bh=J1zDPJmLXfgDFNll+IeUXpiaMWwMbp2A/pn+GKNA3pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EeotgXWSlBrVp8wB6gWICc8wXGRQaUBpw1+yV8jxGcW9+ZaL5j6SOr9jxNH6yijOE
 sOBuxbl+gKwWD4S5N2QCDQS3vJ4zqiezuipq6IBsgqNCQ28rxxHKEruvbChyzY8x7I
 tOa4iePUucuyT5kuWtWUYsM57n223cydUKjwsxfNk+r8T90RsFVBQfnwKb9LtvmSEK
 cONx+CYwdd51F/01fmcqcnQ1bHLG+3Hn3dwQkRpkvgz4r1pfEtJnHeN6Foto9KQsby
 br5oyhXh8F12mbOSuVKelgOlVrPW/KNR9ZUSSBdzZFe/Bniq5aeqHJTFRzfxihj2su
 3rM6wrZ1cYNBg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Dec 2021 16:06:12 +0100
Date: Sat, 25 Dec 2021 16:06:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211225150612.GQ2603@scaer>
References: <20211225105738.4716-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211225105738.4716-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: add optional dependency
 to icu & libglib2
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

Bernd, All,

On 2021-12-25 11:57 +0100, Bernd Kuhls spake thusly:
> icu is used in lib/util/charset/
> https://git.samba.org/samba.git/?p=samba.git;a=blob;f=lib/util/charset/wscript_configure;hb=HEAD#l40
> 
> libglib2 is used in source3/
> https://git.samba.org/samba.git/?p=samba.git;a=blob;f=source3/wscript;hb=HEAD#l1778
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/samba4/samba4.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 8fa8b53399..14f9302e21 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -17,8 +17,10 @@ SAMBA4_DEPENDENCIES = \
>  	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
>  	host-perl host-perl-parse-yapp host-python3 \
>  	cmocka e2fsprogs gnutls popt zlib \
> +	$(if $(BR2_PACKAGE_ICU),icu) \
>  	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
>  	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
> +	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
>  	$(if $(BR2_PACKAGE_READLINE),readline) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  SAMBA4_CFLAGS = $(TARGET_CFLAGS)
> -- 
> 2.30.2
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
