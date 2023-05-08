Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACCC77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 383DD42A96;
	Mon,  8 May 2023 19:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 383DD42A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQk-phNcqSM6; Mon,  8 May 2023 19:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA7841D28;
	Mon,  8 May 2023 19:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA7841D28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 132D91BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF75C41D86
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF75C41D86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kw1yjvbFkY8 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:22:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F3841D82
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34F3841D82
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:22:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 799D02005A9;
 Mon,  8 May 2023 21:22:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 21:22:17 +0200
Date: Mon, 8 May 2023 21:22:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230508192217.GG252090@scaer>
References: <20230508082543.57211-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508082543.57211-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683573740;
 bh=5On0Tkwo6yElPP2yxteOppE3seMCXijtOE2YQ+2uBu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QHbb4+U25hXQgngtOCMDk9VGGhLVjNU0Iw8KEKuVyWZB3HFuc4LrFtECu9hZhb8cK
 XKq/6qgAVvbzxAv1XVfpL0EYZjAs+dliObQnYdd2gueZheHdDB6nrb1PNzUWgCI43G
 MjjOF1qVjatNiJ/1cmjui8/JxXvSVGoUGjKFdkkNJcXJqVMEtd4PasyDLJv4D71SEa
 HrqBvCSgLscN05jSCUDujlAirMdWY6WPkoXUj4/lQnueuwDCvvNk2nGrZC08nBiaLG
 iWeN1bH7dtf3tNTW7wtBxFhgic5FKRgVl+L3IUnziJqmMNt0FccsfajLySnQ11bMqF
 27vwDuOkiBoug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QHbb4+U2
Subject: Re: [Buildroot] [PATCH] package/glibmm2_66: bump to version 2.66.6
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
Cc: Daniel Lang <d.lang@abatec.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-08 10:25 +0200, Daniel Lang spake thusly:
> https://gitlab.gnome.org/GNOME/glibmm/-/raw/2.66.6/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibmm2_66/glibmm2_66.hash | 4 ++--
>  package/glibmm2_66/glibmm2_66.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
> index b7d19b261c..19272d2b90 100644
> --- a/package/glibmm2_66/glibmm2_66.hash
> +++ b/package/glibmm2_66/glibmm2_66.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.5.sha256sum
> -sha256  7b384662dd6ec3b86c0570331d32af05db2bd99a791602b767b4a0b2566ec149  glibmm-2.66.5.tar.xz
> +# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.6.sha256sum
> +sha256  5358742598181e5351d7bf8da072bf93e6dd5f178d27640d4e462bc8f14e152f  glibmm-2.66.6.tar.xz
>  # License files, locally calculated
>  sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
> index b58c7ca8df..7f28342c52 100644
> --- a/package/glibmm2_66/glibmm2_66.mk
> +++ b/package/glibmm2_66/glibmm2_66.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  GLIBMM2_66_VERSION_MAJOR = 2.66
> -GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).5
> +GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).6
>  GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
>  GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
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
