Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC70C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8370C416D6;
	Thu, 12 May 2022 20:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPEoxALuXIqJ; Thu, 12 May 2022 20:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6924170E;
	Thu, 12 May 2022 20:08:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE47C1BF398
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC3E760B2B
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPf16LIZRyex for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:08:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D41C060AE9
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:08:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 08ECC19F55C;
 Thu, 12 May 2022 22:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652386095;
 bh=t1a+jrxc4d1bNmuJRiNN7e7TZvs6+j6X7hElueso+s0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjIHGA7TCKeRlyMshS84SbnqXlvp7dIa7lGondokeFViIea9TAT+8VX8fdo2zpOP2
 +Ej+ElKfBxdKhR+NppI7C6EFL9jMGgEN9KYw/Xe15ShXi0dclo2nAuI3B0l2owzMDi
 k8OXqypu4DBpf0HKzgj7zGMFf/xQ+Mm6XZG9vNbgiDMLsPd2GC2AI6Nu5PalcQM5qx
 7a8pfuxymOTYgbBgfkuav5yYyXbb5mqmVY2E4Ti/tXtnrJg4kl4/MNbFuC9bHgTME3
 9NqtpsCfzNV/7fS1m9+2DvIasaV/vMqxydo1Bs20DHPmQnVzVPeHpDKvxzlWs3mMOy
 /CR5l77sZJeCg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:08:12 +0200
Date: Thu, 12 May 2022 22:08:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220512200812.GF1597494@scaer>
References: <20220512155201.7384-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512155201.7384-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version
 to 19.7.15-Matrix
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

On 2022-05-12 17:52 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> index d7693bdfb0..a24a7abcd8 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  ccd27cfbfee58df9acc71df0661bd56ff34fbf7d9afc8de78d3224d33b30ef44  kodi-pvr-zattoo-19.7.14-Matrix.tar.gz
> +sha256  3126ce811e03ac92363a4e399b908336bb54328b7fa0d42c25ac85b2fe5aa7d4  kodi-pvr-zattoo-19.7.15-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> index 658db25f27..559dbf884b 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_ZATTOO_VERSION = 19.7.14-Matrix
> +KODI_PVR_ZATTOO_VERSION = 19.7.15-Matrix
>  KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
>  KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
>  KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
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
