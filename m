Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D5CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A5D8141C;
	Sun, 11 Dec 2022 16:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A5D8141C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48H3u8Tw3_Cs; Sun, 11 Dec 2022 16:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 582BA813AE;
	Sun, 11 Dec 2022 16:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 582BA813AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62C231BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE014047B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE014047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzViThFT3vuV for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:20:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 508EA4026A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 508EA4026A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:20:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BBCB513F8BB;
 Sun, 11 Dec 2022 17:20:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 17:20:25 +0100
Date: Sun, 11 Dec 2022 17:20:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221211162025.GQ1044805@scaer>
References: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670775628;
 bh=u4CnQ4Grmqwqh4DsayJWV0bibUmWqnLC6IdmeBnMV+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcAg8zlvPl557Bq1pWhHUEFbXHfdY0k0vaJ70AIKm+8g9kZ+wBL8/scktjqJOZdcG
 NMpEQxD0esP7dzDg/xvdK9RVJ1xK56LPoSJhFs9nAvfS+pyQzC9oYZivpneNDpQqkl
 /hk+OYxfbL0uWvnQpAdgk5tUjzLQbtpp5/8wGDKawV+c34t3/qNvkP+wCEscdslLIp
 YdRBkM5cSBfq8mwk1PPQhS1+lBN0mg9GqN9iPw0sE7f4SmFht9mTAy76mTKXxhIKET
 2iAUxbkdZ8/uWTlHkpIRD6g29VG5QiZFKvdBMQXs0WWTBj6h5raB4TSJ0MUn3wohiC
 D1m7vGmAEa1cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rcAg8zlv
Subject: Re: [Buildroot] [PATCH 0/4] package/x11r7: various version bumps
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

On 2022-12-11 17:03 +0100, Bernd Kuhls spake thusly:
> Hi,
> 
> this series bumps various X11 packages and, when needed, switches the
> tarball to xz format and updates _SITE to https.
> 
> Regards, Bernd
> 
> Bernd Kuhls (4):
>   package/x11r7/xdriver_xf86-input-joystick: bump version to 1.6.4
>   package/x11r7/xdriver_xf86-video-ast: bump version to 1.1.6
>   package/x11r7/xdriver_xf86-video-vesa: bump version to 2.6.0
>   package/x11r7/xdriver_xf86-video-voodoo: bump version to 1.2.6

Series of 4 patches applied to master, thanks.

Regards,
Yann E. MORIN.

>  .../xdriver_xf86-input-joystick.hash                        | 5 +++--
>  .../xdriver_xf86-input-joystick.mk                          | 6 +++---
>  .../xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash      | 5 +++--
>  .../x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk  | 6 +++---
>  .../xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash    | 6 +++---
>  .../xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk      | 6 +++---
>  .../xdriver_xf86-video-voodoo.hash                          | 5 +++++
>  .../xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk  | 6 +++---
>  8 files changed, 26 insertions(+), 19 deletions(-)
>  create mode 100644 package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.hash
> 
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
