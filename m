Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E41C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 19:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E8640C44;
	Sat,  4 Jun 2022 19:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTDD1gpBp0am; Sat,  4 Jun 2022 19:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 313504103F;
	Sat,  4 Jun 2022 19:07:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 807411BF3EF
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 19:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 689EB41B40
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 19:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUrYRLQ40__l for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 19:07:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D19AD41A61
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 19:07:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EA3B65FF96;
 Sat,  4 Jun 2022 21:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654369625;
 bh=gPLrykGGPo6YjJE16aBVUaIgwtkF6j2lOYM75nbLAEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XuQr1iHFi8OZ20ir25a1FKCvYExQFdL3N+pvc0vHv37n8tAXIUxd7N/dodxKGSLUg
 3Kg4A/tJ38PD0qXoM1WqPCj4a+I8lse9uN0MH6IqDc/YV5f7w5qgaVAwNR6ZyOkTBL
 nJj3xV3wkao4rcjYyj+SVk1Lf2wUq+zOkKWVaVrtE7ye5iN3KyyP08NcmVwGl+/T10
 r8pmPdmnvBDQ9eXVybJKyTgYDzV66rxgunEfQUGvJuew22yxKy3euCcShvpF+kESmo
 EIgXlDpp527PAky0Fh5GpGfXzHeWOvYL8XOSgEQWCrBq5umdLdGnZv2rC7Ujw+DR9G
 fRLBzBg2RYgsA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 21:06:59 +0200
Date: Sat, 4 Jun 2022 21:06:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220604190659.GR427639@scaer>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-5-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514175612.2510884-5-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 05/19] package/x11r7/xdriver_xf86-video-ati:
 fix build with newer versions of xserver
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-05-14 19:55 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/ccc/ccc36c8cd3530153316190f378847081cb5c1c58/
> http://autobuild.buildroot.net/results/bef/bef85a6a09bdd1d1a5035ee7baac1f2d2e7e1a2e/
> http://autobuild.buildroot.net/results/7d6/7d65c8085a1ae122da4acc296538f2277b3ec15e/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...dri-h-with-older-versions-of-xserver.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch
> 
> diff --git a/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch b/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch
> new file mode 100644
> index 0000000000..a969d61913
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch
> @@ -0,0 +1,32 @@
> +From 5eba006e4129e8015b822f9e1d2f1e613e252cda Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>
> +Date: Tue, 2 Feb 2021 12:45:54 +0100
> +Subject: [PATCH] Only include dri.h with older versions of xserver
> +
> +Not needed anymore with current versions.
> +
> +Downloaded from upstream commit
> +https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati/-/commit/5eba006e4129e8015b822f9e1d2f1e613e252cda
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/drmmode_display.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/drmmode_display.c b/src/drmmode_display.c
> +index 3099a729..a58f24dd 100644
> +--- a/src/drmmode_display.c
> ++++ b/src/drmmode_display.c
> +@@ -45,7 +45,9 @@
> + #include "radeon_glamor.h"
> + #include "radeon_reg.h"
> + 
> ++#if XORG_VERSION_CURRENT < XORG_VERSION_NUMERIC(1,19,99,1,0)
> + #include <dri.h>
> ++#endif
> + 
> + #include "drmmode_display.h"
> + 
> +-- 
> +GitLab
> +
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
