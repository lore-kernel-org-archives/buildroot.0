Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295BAC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD32F4087E;
	Fri,  9 Dec 2022 17:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD32F4087E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5f06__HkNiWB; Fri,  9 Dec 2022 17:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A68408B0;
	Fri,  9 Dec 2022 17:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A68408B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AEA81BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12D3A82127
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D3A82127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BNS5YYgZCE29 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:03:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD838211B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BD838211B
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:03:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.98.184])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E42D7B005A8;
 Fri,  9 Dec 2022 18:03:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 09 Dec 2022 18:03:31 +0100
Date: Fri, 9 Dec 2022 18:03:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221209170331.GN2855@scaer>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
 <20221208223817.1088619-49-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208223817.1088619-49-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670605414;
 bh=sPufgVrfnSbJ54c8J2ZKsxZI1zYEQQP/AifevHlIcxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Al7JdyXJK1opX6WnUB0b300FjubOk9+ezHHKTH9kAxc0rpmncOsVOny5JuhKzyWRH
 21vEq/u5kYrhCuU/wu2du3sOKYZc7K4KMCFLNsdQX+71iavW9baeu636WDC6B4My4P
 vFNPsrDbABgEh9tUSSmhyySvfykAby1Eubuw+gEVqwQGyWsioB1s6GQ8Mi50hK4Fl0
 4Gwp6qPVatQEBgHRKqXxN4+QGdnj74inMyvAWL0Dik7jMFOuh+uOmBM0mRAue9NZ+v
 fGCRa3024Qn+RuJtT2Wv8amSTmwRxQZ7LwCwoirpLqzZ6Dozi6tUXqRnb998Dv187O
 TAqjCi7qFjPAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Al7JdyXJ
Subject: Re: [Buildroot] [PATCH 48/70] package/x11r7/xcb-util-cursor: bump
 version to 0.1.4
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

On 2022-12-08 23:37 +0100, Bernd Kuhls spake thusly:
> https://lists.x.org/archives/xorg-announce/2022-October/003230.html
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xcb-util-cursor/xcb-util-cursor.hash | 5 +++--
>  package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
> index 14cea17138..fc861fb4d9 100644
> --- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
> +++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
> @@ -1,4 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2016-May/002691.html
> -sha1  26562eb6d4151307f7b6a53453d360ecfc0563ac  xcb-util-cursor-0.1.3.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2022-October/003230.html
> +sha256  28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb  xcb-util-cursor-0.1.4.tar.xz
> +sha512 d27dd59a4d7ded9994dca77774421dd9533e3ee823b880af35d3219bd7340c89fbc61d1d0fa10e2991de2cac9e6395e09497769d7b8728eedc691e76649107b1  xcb-util-cursor-0.1.4.tar.xz

    $ make check-package
    package/x11r7/xcb-util-cursor/xcb-util-cursor.hash:3: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Applied to master after fixing that, thanks.

Regards,
Yann E. MORIN.

>  # Locally computed
>  sha256  0dde91ae1d443105dc9e13cbaed6674c36683b7095836ad9ddfce26be270aad5  COPYING
> diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
> index 07b37c5e47..0fb131693b 100644
> --- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
> +++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -XCB_UTIL_CURSOR_VERSION = 0.1.3
> -XCB_UTIL_CURSOR_SITE = http://xcb.freedesktop.org/dist
> -XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.bz2
> +XCB_UTIL_CURSOR_VERSION = 0.1.4
> +XCB_UTIL_CURSOR_SITE = https://xorg.freedesktop.org/archive/individual/lib
> +XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.xz
>  XCB_UTIL_CURSOR_LICENSE = MIT
>  XCB_UTIL_CURSOR_LICENSE_FILES = COPYING
>  XCB_UTIL_CURSOR_INSTALL_STAGING = YES
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
