Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6747BC3DA4A
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 00:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD1A81253;
	Sun,  4 Aug 2024 00:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZ69PJZrs6lb; Sun,  4 Aug 2024 00:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C0881254
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C0881254;
	Sun,  4 Aug 2024 00:53:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11C081BF94D
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 00:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F30E0402A8
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 00:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3N9h2OUkyII for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 00:53:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6B4340147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B4340147
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6B4340147
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 00:53:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4740qt1s130471;
 Sat, 3 Aug 2024 19:52:55 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4740qslb045275
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 3 Aug 2024 19:52:55 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 3
 Aug 2024 19:52:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 3 Aug 2024 19:52:54 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4740qsFR038241;
 Sat, 3 Aug 2024 19:52:54 -0500
Date: Sat, 3 Aug 2024 19:52:54 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240804005254.lnvss7iizgkncoz5@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
 <20240722-tfa-src-update-v1-1-e68bba62f146@ti.com>
 <20240803235943.226e6d14@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240803235943.226e6d14@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1722732775;
 bh=wh+5N3iNCRp+8Z8l5NpgFxQKRnKWlcyR394cc2c8uYg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fflmDgDmzjbDQcnlR5guSoDHhPD5nPxZHAhaFvvubs8TFK5RVMA8j8qHwhmO/AnLi
 d6TqGAqg2xreeUZpXWKI6J35mYXJlIAt1pP3ITus60O+lLWxDiMwkqFrODrWCTq2YG
 ruKSw03RLIZdVsPotmguJCOWJEWncnxcE0ae+YmU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fflmDgDm
Subject: Re: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: update
 source to the new mirror
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
 Marleen Vos <marleen.vos@mind.be>, Sergey Matyukevich <geomatsi@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, "Yann
 E. MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas

On August  3, 2024 thus sayeth Thomas Petazzoni:
> Hello Bryan,
> 
> On Mon, 22 Jul 2024 14:17:37 -0500
> Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> 
> > Tags are no longer being pused to the old ARM-softwre
> > mirror. Let's move to the new mirror at TrustedFirmware-A which
> > continues to publish newer tags
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
> >  .../am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  
> >  | 2 +-
> >  .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
> >  .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
> >  boot/arm-trusted-firmware/arm-trusted-firmware.hash                   | 4 ++--
> >  boot/arm-trusted-firmware/arm-trusted-firmware.mk                     | 2 +-
> >  12 files changed, 13 insertions(+), 13 deletions(-)
> 
> I have applied locally, but not yet pushed. My concern is that it's
> really annoying that it breaks hashes for all previous versions of
> TF-A. This means that all people having existing defconfigs (not the
> one in Buildroot) that use
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE will see their
> build fail now. And even for those using the defconfigs in Buildroot,
> they will see a hash mismatch message and a redownload.
> 
> But I don't really see any other way around that. The issue is
> basically that we are not fetching real tarballs, but auto-generated
> ones, which are different when fetched from one repo or another.
> 
> Should we instead switch to fetching via Git all the time? Should we
> switch to using the official Git repo, instead of a Github mirror?
> 
> As you can see, I am not 100% sure about this change, even though we
> obviously need to change something to be able to use the newer versions
> of TF-A...
> 

Ah I agree completely. I saw we originally used the mirror and assumed 
we did that for bandwidth reasons. I can update this to use the 
trustedfirmware.org source. 

Thanks for the review
~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
