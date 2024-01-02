Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB2EC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E326405D8;
	Tue,  2 Jan 2024 08:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E326405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMkf301e_95Z; Tue,  2 Jan 2024 08:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A11405AE;
	Tue,  2 Jan 2024 08:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A11405AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61FB51BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3810640360
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3810640360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZonbtSHFz700 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:32:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E07634020B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E07634020B
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC3A1240006;
 Tue,  2 Jan 2024 08:32:30 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:32:29 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240102093229.46f487ca@windsurf>
In-Reply-To: <ZYyZ0y4be97YCUee@landeda>
References: <20231224160831.871650-1-thomas.petazzoni@bootlin.com>
 <ZYyZ0y4be97YCUee@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704184351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvijeSEH67ZwePLt7gIDZLWbcEd/SG1IEYFQEdyCAvI=;
 b=IfCuz3kK1bcaUJbX8/A3Xa0pHwuSMs9zfF0Tbm2lsRnV+GbAbNMwu03sQGWC/sL/HDlCNw
 uQt6JCrU0H5B4JHBTauYHtfktwRRklryej3AJoIkawk000nEAxTVE1pMheHGDU7a+R1dJO
 O04aBgt883BNxGI5HWB+d3jsTkYdfOig0wueSEt8ahGh0qZrJXAbJv3p8p/eZrPadXp4Gd
 iYBPmhkky40Xs0WRaHAdYQSi960m3YxvSBIWs2wfGBYDv560E2AItpSaf+vgGPiXxRkNQ2
 ega8NNSIGOEROf/AePZVPbXms6EFCKJSRQvMfZv2Z+RCd7/rvIELIV0qYj9yFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IfCuz3kK
Subject: Re: [Buildroot] [PATCH 1/3] package/gdb: add support for GDB 14.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 27 Dec 2023 22:40:35 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +	select BR2_PACKAGE_MPFR if BR2_GDB_VERSION_14  
> 
> This is a bit fragile: when we add gdb 15, and drop gdb 12, gdb 14 will
> become the default version. Then, if the host variant is not selected,
> BR2_GDB_VERSION_14 will not be set. If the user enables the full gdb n
> target, mpfr will not be selected.

Yes, it requires some care. We had things like that in the past (gmp
became a mandatory dependency), and we were able to make it work, but I
agree it requires being careful when doing the version bumps.

> I've added a litle blurb in the config.in.host, pointing to this part of
> the code for an appropriate update.

Thanks!

> Alternatively, I wonder if we shouldn't jsut make mpfr unconditional for
> all versions of gdb, now.

No strong opinion on this: whenever possible I try to not build
unnecessary things, hence the proposed solution. But admittedly, mpfr
is becoming a mandatory dependency for gdb, so it means that anyway in
the not too distant future, everyone will have to build mpfr as a
pre-requisite of building gdb.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
