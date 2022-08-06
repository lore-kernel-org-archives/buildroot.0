Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742DBC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E74C2404B9;
	Sat,  6 Aug 2022 13:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74C2404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tp03m3t9enDQ; Sat,  6 Aug 2022 13:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2563240168;
	Sat,  6 Aug 2022 13:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2563240168
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C14671BF2B5
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C81683486
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C81683486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyLkVAgZSIpB for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 13:40:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D6C82EDB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48D6C82EDB
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 13:40:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B523B1BF203;
 Sat,  6 Aug 2022 13:40:13 +0000 (UTC)
Date: Sat, 6 Aug 2022 15:40:12 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220806154012.75b09024@windsurf>
In-Reply-To: <20220805163534.GF3621445@scaer>
References: <20220804204157.30731-1-thomas.petazzoni@bootlin.com>
 <20220804204157.30731-2-thomas.petazzoni@bootlin.com>
 <20220805163534.GF3621445@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659793214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMTvgQAgr2RKBLrs0HSkaUnh6U1aJj1vNbpuxjQsvxw=;
 b=l0xgiO6jSWWzC2wCco1+eza/watP6fNjHOqu9z+o10CrCfxDr72Lr+72SUpMZGe1GXBLgq
 AoiZIMCTkvXBQ/wLjWitbYStuSWcxKiiqXYEItn8yHrJYI5Koc8G0JQXH1O5AjIlX42Ivp
 jAA7ioLpnHHDpE5J/IGd2MjZyZ07WdQ6eaCdSlDjewJlVFVEEY6njdC7qaFYedjvG8hwsv
 VDlf9Olud9N7WDrglW4OXXAWW2W29t+P9Ym3Ahgh20iWRMN6Ya/eu6+qooIkt+zyzpBl3W
 1Xx2LkJV3/RZaV83G/hU+LlNS9Oib+EKFdwANk8AP7gt+x4jpgdWYlGxzmTALg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l0xgiO6j
Subject: Re: [Buildroot] [PATCH 2/2] package/gcnano-binaries: set Version:
 field in .pc files
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
Cc: kory.maincent@bootlin.com, Jens Kleintje <scooby22@web.de>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 5 Aug 2022 18:35:34 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > The version 21.1.1 is chosen because it matches what the Yocto recipe
> > is doing for this package:
> > 
> >   https://github.com/STMicroelectronics/meta-st-stm32mp/blob/kirkstone/recipes-graphics/gcnano-userland/gcnano-userland.inc#L42  
> 
> ... which they did not provide any explanation for...

It matches a somewhat corresponding mesa3d version, I suppose. This is
at least how some packages detect if libgbm is recent enough for their
needs (I've seen a package require >= 17 for example).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
