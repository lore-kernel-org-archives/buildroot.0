Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99769C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4166B60AC6;
	Sat,  5 Nov 2022 18:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4166B60AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kioEFw5FVkUP; Sat,  5 Nov 2022 18:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1632D60A94;
	Sat,  5 Nov 2022 18:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1632D60A94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E80851BF2A0
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2FD9401ED
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2FD9401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtBBC4Wecmpc for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:48:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4D3400D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB4D3400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:48:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 126CC5FF93;
 Sat,  5 Nov 2022 19:48:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 19:48:10 +0100
Date: Sat, 5 Nov 2022 19:48:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221105184810.GO3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
 <20221105184555.GM3918838@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221105184555.GM3918838@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667674093;
 bh=jE56E48cNTMPCN6Cdrkgv/tHPB1p66RJvM/aEqAU/hA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Em3/QigpPkuko6Ls8VLVQXbo/IhmpiKM7qxna9tDNopGXOcPHIATNsg9XDNJ9sFy6
 It6JXTeC+AUgpk4fr2IyHnJwx1YXlyBo3wQjsJ5ciF7sNd8SIxguxZWOCceJRdYdSo
 VombBjfxIbmsi2MlW5rK/f55+UENs9ndCjxJeP2wQY+FrhxbToQD4hEaTiPS1Kvi6H
 U6qxbHhcGK44KNC4AG6gpR2L/CesMUNyWlj2aMnNFGC1tLZo5nS39GbWbndIV19JYd
 QcfbClF3kVpOVdiyvFynshBN055xem5zsNKeAkIUFo8lQjqrpMB2nPIbpBDwMXx2ho
 sLavPhz9xR+ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Em3/Qigp
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
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

Joachim, All,

On 2022-11-05 19:45 +0100, Yann E. MORIN spake thusly:
> On 2022-10-31 18:46 +0100, Joachim Wiberg spake thusly:
> > Changes:
> >  - New command line options to ssdp-scan
> >  - Update copyright years (affects LICENSE file hash)
> > 
> > Fixes:
> >  - Workaround for OpenVPN /32 default server setup
> >  - Time-of-check vs time-of-use issue with caching of UUID,
> >    found by Coverity Scan, fixed by Raul Porancea
> > 
> > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> 
> Applied to master, thanks.

s/master/next/

Also, sorry for the typo in your name in my previous reply... :-/

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> > ---
> >  package/ssdp-responder/ssdp-responder.hash | 4 ++--
> >  package/ssdp-responder/ssdp-responder.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
> > index e8cbbb4a1f..425ad86e08 100644
> > --- a/package/ssdp-responder/ssdp-responder.hash
> > +++ b/package/ssdp-responder/ssdp-responder.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256  7ae49229e7c7a55fed9e36598b12e2173eecef0fffe0a386b6a10fad30f3c79f  ssdp-responder-1.8.tar.gz
> > -sha256  e17dc0bc91bf499d8cca5e016c22c6d2a4770e3cc1a43756a7973375a83ddb90  LICENSE
> > +sha256  974c244abd4ba8c87532867a84756182a1460c99072ffb1eb91c5a1f73311d89  ssdp-responder-1.9.tar.gz
> > +sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
> > diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
> > index 3fee4c2006..fd7b1ea44b 100644
> > --- a/package/ssdp-responder/ssdp-responder.mk
> > +++ b/package/ssdp-responder/ssdp-responder.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -SSDP_RESPONDER_VERSION = 1.8
> > +SSDP_RESPONDER_VERSION = 1.9
> >  SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
> >  SSDP_RESPONDER_LICENSE = ISC
> >  SSDP_RESPONDER_LICENSE_FILES = LICENSE
> > -- 
> > 2.34.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
