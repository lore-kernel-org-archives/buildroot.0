Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A152C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 16:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C505E60AFE;
	Thu,  8 Aug 2024 16:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amowQcI1y3_v; Thu,  8 Aug 2024 16:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B44560ABB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B44560ABB;
	Thu,  8 Aug 2024 16:39:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E15C11BF29F
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEAED80C03
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3a6fR2LyAQ_b for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 16:39:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5D6980BDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D6980BDE
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5D6980BDE
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 16:39:53 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478GdjBS010879;
 Thu, 8 Aug 2024 11:39:46 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478Gdjku116852
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Aug 2024 11:39:45 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 11:39:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 11:39:45 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478GdjI5060967;
 Thu, 8 Aug 2024 11:39:45 -0500
Date: Thu, 8 Aug 2024 11:39:45 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240808163945.u24qofwqk33v2zn2@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
 <20240807-tfa-src-update-v2-1-f2cd6166db5f@ti.com>
 <20240808001230.39ca2187@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240808001230.39ca2187@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723135186;
 bh=+e6i/qUUMmHOU/kLEYEq9MdZMnniD/fARnMNIxOGG+c=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=pk4yYv5cC9+KaN+2Wg6N70cVDj/X6WejFjp7a3Kkmbfg7ejVYQIwFNbTNvX6GNEbH
 h0KyXJVgTeosL6YZEdqLapF7QAYxXYMgWQDy7t5hxulZ+z4JrMqQWjzEC0G63WjOqJ
 y2kOi8SLD/9Gs9f+IqAtMjlxllzhQQZJ0aIvKd90=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pk4yYv5c
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/arm-trusted-firmware: move to
 official source for tf-a
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Xuanhao Shi <X15000177@gmail.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On August  8, 2024 thus sayeth Thomas Petazzoni via buildroot:
> On Wed, 7 Aug 2024 12:48:19 -0500
> Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> 
> > ARM_TRUSTED_FIRMWARE_SITE is currently pointing to the deprecated
> > ARM-software github read-only mirror[0] which is no longer publishing
> > new tags. They do have a newer github mirror under the TrustedFirmware-A
> > organization[1] which continues to receive tag updates we could use
> > however because of the way github generates tarballs changing the SITE
> > to point to TrustedFormware-A changes the pre-calculated hash values
> > for every version for everyone.
> > 
> > Without much way around changing all hash values if we want these latest
> > tags, lets drop the github mirrors and move to the official git
> > source[2] so we can download real tarballs which shouldn't change even
> > if the ARM_TRUSTED_FIRMWARE_SITE moves again and hopefully preventing
> > this from ever happening again.
> > 
> > [2] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/
> > [1] https://github.com/TrustedFirmware-A/trusted-firmware-a
> > [0] https://github.com/ARM-software/arm-trusted-firmware
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >  .../fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
> >  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
> >  .../beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
> >  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
> >  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
> >  board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash     | 2 +-
> >  .../stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
> >  .../am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
> >  .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
> >  .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
> >  boot/arm-trusted-firmware/arm-trusted-firmware.hash                   | 4 ++--
> >  boot/arm-trusted-firmware/arm-trusted-firmware.mk                     | 3 ++-
> >  12 files changed, 14 insertions(+), 13 deletions(-)
> 
> Applied to master, thanks! Note that your patch didn't apply as-is to
> master, one defconfig had changed in the mean time. If possible make
> sure to send patches that apply on the latest master.
>

Ah thank you for all the fixups. I may have hit send a little too fast 
on this one :)

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
