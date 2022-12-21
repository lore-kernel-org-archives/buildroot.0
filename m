Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4574C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 09:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC9C4024D;
	Wed, 21 Dec 2022 09:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC9C4024D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stWtMjod29oQ; Wed, 21 Dec 2022 09:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7824021B;
	Wed, 21 Dec 2022 09:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D7824021B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B71231BF2A1
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 09:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E9E4401FC
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 09:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E9E4401FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myd8o-N2iR0B for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 09:54:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A4F401DC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37A4F401DC
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 09:54:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a2ac:472c:b44e:1236])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A26A2780340;
 Wed, 21 Dec 2022 10:54:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Dec 2022 10:54:31 +0100
Date: Wed, 21 Dec 2022 10:54:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gary Bisson <gary.bisson@boundarydevices.com>
Message-ID: <20221221095431.GK2909@scaer>
References: <20221220133454.1931855-1-christian@klarinett.li>
 <Y6LEoC1iXjhW77XR@p1g2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6LEoC1iXjhW77XR@p1g2>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671616479;
 bh=hHa24Crqy9l6n7LIhspsF15NQv3wiL5cxcLqdP8xkiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vD1hnFeP4UcTiAgfyFCzcF0TvLP1yMuckTQRhirAIauNCb/WX6PyltlyhVs/xgEV2
 DNQPmzETx5YEN18okjhCf4p47Qlp9RqEIUE+sF5x2yFXitlhMUb1r70/SVlvRWEVE+
 Rf+UVqK6iZbRqklV0fWkj2MC44pD9pBBbOqaCRqusYMPNLCI8oWN86m1pbG91ePTvN
 TWKHu/wm4W8Nwr7Mk3gh8sdBlF4IKlA+Py46ZomLHgCRXoSB3dPP9FD112FKehIC3p
 FSV83xE94Rxwv+OEIxRTMXGE8btZqZd3EGozgbHFd7e7h3rh2BHyMvbRFyj+uTRPm1
 HYCKXZB44GX6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vD1hnFeP
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 installation with merged usr dirs
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gary, All,

On 2022-12-21 09:32 +0100, Gary Bisson spake thusly:
> On Tue, Dec 20, 2022 at 02:34:53PM +0100, Christian Hitz wrote:
> > From: Christian Hitz <christian.hitz@bbv.ch>
> > 
> > Currently, the firmware files are installed to /lib/firmware/imx. With
> > BR2_ROOTFS_MERGED_USR=y /lib is replaced with a symlink to /usr/lib
> > effectively deleting the installed firmware files.
> > 
> > Install the firmware files into the /usr/lib/firmware/imx prefix instead.
> > 
> > Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> > ---
> > Backport to: 2022.02.x, 2022.11.x
> > ---
> Thanks for your contribution, looks good to me! That brings the question
> about linux-firmware that doesn't seem to handle that case either.
> Thomas, should we have a generic TARGET_FIRMWARE_DIR that switches from
> /lib/firmware to /usr/lib/firmware automatically? That way it would fix
> it for all packages at once.

As I explained in my reply to Christian: this should not be needed,
because the /lib symlink is created by the skeleton, which are installed
before any other package. So, all packages should see the proper /lib
symlink.

Note that we've introduced merged-usr quite a long time ago now (more
than 7 years ago!), and it has been used by many people (I included)
without that issue surfacing so far for linux-firmware, so I'd be
surprised that there is an actual issue for any of the (well behaved!)
firmware packages... ;-)

Regards,
Yann E. MORIN.

> Otherwise:
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> Regards,
> Gary
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
