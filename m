Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F80C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 07:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A16060FF9;
	Thu,  9 Feb 2023 07:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A16060FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlKoCL9ZGAzn; Thu,  9 Feb 2023 07:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF13A60DED;
	Thu,  9 Feb 2023 07:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF13A60DED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 762F91BF3A7
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 07:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4855F40612
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 07:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4855F40612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAELnaaOII_q for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 07:51:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2350D405F4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2350D405F4
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 07:51:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33FB340007;
 Thu,  9 Feb 2023 07:51:05 +0000 (UTC)
Date: Thu, 9 Feb 2023 08:51:04 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230209085104.3a41b07b@windsurf>
In-Reply-To: <20230209081922.054039f1@gmx.net>
References: <20220926051956.3272067-1-buildroot@athaariq.my.id>
 <20230208144639.764af681@windsurf>
 <20230208184323.34219f84@gmx.net> <20230209081922.054039f1@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675929066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1zPV526PgrUPdoqkzQWYFpMoxterexFMqCO//N8PZA=;
 b=dFzaMBi38jfPPCmF0Wp0SRIdfjY4RGRBMDsEXq2azfUgYJqU6OYxa18iimJgMnDt76QNTJ
 830iClm8aUM5l+szLJUWQHx9GBubT+S9ZATztujiaM5WEPNbO+0Ip6t9Mt4NIxkCuUnWcw
 6dvd275s5dffByphU5fnDGzxoo411hDcW3g/bgDS9e0twiLwmmVtkwBimi/zLeKIAsxl7m
 oifCuzMT/Wx+OGVzy7f6fcn0ocykNUytrKAV8sUgTSJNtBQ+a/NCcBIczY+k54D0/cV6MC
 nwrf8ce95V7byHLpgk+7pHtQU9nLtOLnjnFp883GmdMwZOjduIIZwTVk9Z7scg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dFzaMBi3
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi4: bump kernel version
 to 5.15.68
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 9 Feb 2023 08:19:22 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> > Upstream defconfigs changed to CONFIG_MODULE_COMPRESS_XZ (see [1] and [2]),
> > alternative would be to enable the following in the buildroot
> > raspberry*_defconfigs:
> >
> > 	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> > 	BR2_PACKAGE_XZ
> > 	BR2_PACKAGE_KMOD
> > 	BR2_PACKAGE_KMOD_TOOLS
> > 	BR2_PACKAGE_HOST_KMOD_XZ
> >
> > Regards,
> > Peter  
> 
> ...ups, and the missing links:
> 
>     [1] https://github.com/raspberrypi/linux/commit/c45b4223a4e4a8cfe39edbb4949329ea478fa4e2
>     [2] https://github.com/raspberrypi/linux/issues/4966

Thanks for the extra info! Peter, in the past I believe you have been
maintaining those raspberrypi defconfigs. Any chance that you send an
update for all raspberrypi defconfigs again? :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
