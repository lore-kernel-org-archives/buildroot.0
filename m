Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC28C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C582741C01;
	Wed, 27 Dec 2023 22:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C582741C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRwkeW4iLra9; Wed, 27 Dec 2023 22:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E642441BF8;
	Wed, 27 Dec 2023 22:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E642441BF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8E171BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1A2241BF8
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A2241BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LoIdaCksVzw7 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:20:36 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AADD941BEE
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADD941BEE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D4317B0053D;
 Wed, 27 Dec 2023 23:20:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:20:30 +0100
Date: Wed, 27 Dec 2023 23:20:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZYyjLr25mkMFJqU8@landeda>
References: <20231109212901.5596-1-ps.report@gmx.net>
 <ZYyiJOUePibRgeQq@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZYyiJOUePibRgeQq@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703715635;
 bh=TXZ/vj//QXHUJUpNKO9mE8LT0WxRM0sL9ioNc9GTFjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hqfxWdHxrFfuOfjLsLDJpB5CajfonN8eriKBd6TwWQqI8tCNiAi6yZEaC0fvAad5D
 SEp95mMK9MByBstj4liX3bk2lJHhF1gbQjCV54ulWDWCZMX8/OlAxulhq2CCnsi1Wi
 yLj8RDZGOuradgUnPu7iv2gw/rxhGFzoDfqRQAsL+MnKK8rFaDc+IAGMHzJHzG5ym8
 q1HHc2JLKRW5hnMCh9Rf9P5YMjolTzqXUl+8MwHzmm0lTecs8EobqDiYQR/Y34J8nK
 +Qc8n7f36kwfinKEx6NvY7wmzIzDyuxBp+BzpF52vJaTpEGIiVdRNXHIOwZ3v4WCze
 YoihOBMjDKD5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hqfxWdHx
Subject: Re: [Buildroot] [PATCH v1 1/4] package/libcamera: pipeline option
 'raspberrypi' changed to 'rpi/vc4'
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-12-27 23:16 +0100, Yann E. MORIN spake thusly:
> On 2023-11-09 22:28 +0100, Peter Seiderer spake thusly:
> > With upstram commit [1] (since version v0.1.0) the pipeline option 'raspberrypi'
> > was renamed to 'rpi/vc4'.
> > 
> > Change the buildroot option name from BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
> > to BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4 (and add Config.in.legacy entry
> > accordingly) and move handling in Config.in/libcamer.mk to follow alphabetic
> > ordering.
> > 
> > Fixes:
> > 
> >   .../build/libcamera-v0.1.0/meson.build:3:0: ERROR: Options "raspberrypi" are not in allowed choices: "all, auto, imx8-isi, ipu3, rkisp1, rpi/vc4, simple, uvcvideo, vimc"
> > 
> > [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=726e9274ea95fa46352556d340c5793a8da51fcd
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Applied to master, thanks.
[--SNIP--]
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 6fef2318b0..06a40f0b38 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,16 @@ endif
> >  
> >  comment "Legacy options removed in 2023.11"
> >  
> > +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
> > +	bool "libcamera pipeline 'raspberrypi' was renamed to 'rpi/vc4'"
> > +	depends on BR2_arm || BR2_aarch64
> > +	depends on BR2_USE_WCHAR
> > +	select BR2_LEGACY
> > +	select BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
> > +	help
> > +	  Since version ... the libcamera pipeline option 'raspberrypi' was

    $ ./utils/docker-run make check-pacakge
    Config.in.legacy:156: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

I had it fixed locally, but forgot to commit before pushing, so I pushed
a follow-up fix.

I also replaced the '...' with the actual version you talked about ion
the commit log: 0.1.0.

Regards,
Yann E. MORIN.

> > +	  renamed to 'rpi/vc4'.

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
