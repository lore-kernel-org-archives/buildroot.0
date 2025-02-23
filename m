Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8CCC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 15:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28AC24065B;
	Sun, 23 Feb 2025 15:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Frnwc_EDVPiK; Sun, 23 Feb 2025 15:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D67524065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67524065C;
	Sun, 23 Feb 2025 15:52:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76B0C920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 15:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 488F160604
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 15:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPeKkX6dl0GT for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 15:52:46 +0000 (UTC)
X-Greylist: delayed 558 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 23 Feb 2025 15:52:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3070C605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3070C605EB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3070C605EB
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 15:52:46 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id A9CE0240A1F;
 Sun, 23 Feb 2025 16:43:25 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 83455240592;
 Sun, 23 Feb 2025 16:43:25 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id B436E2415BE;
 Sun, 23 Feb 2025 16:43:22 +0100 (CET)
To: Han Gao <rabenda.cn@gmail.com>, Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2025 16:41:54 +0100
Message-ID: <1913069.tdWV9SEqCh@kilian-laptop>
In-Reply-To: <e508e642-3942-47e8-9ff2-a23f16d9d706@smile.fr>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
 <3335914.44csPzL39Z@kilian-laptop>
 <e508e642-3942-47e8-9ff2-a23f16d9d706@smile.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1972
X-purgate-ID: 154282::1740325405-B8C3929F-89117F8B/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1740325405;
 bh=BMzkY6e5Pm4IHT9gytNJNwgBLL5b5KzMzMbghCImWio=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=Lf5UAT8Y5KkNeUGy3VMLPBM/fQpbQo8l6X8Daux4fI43ga1NkNatn+b/zHJEb9Dia
 D/ieOd/vK7tNVQLOf822k2gtu23YOSHip8AX4sQ0M2K8ObdvqBXFHlVdQ8Q7jna9Rw
 d7KgJyS4XMFVgfURQX61oU+yphT631x6dNHC0ApN5DCzroH/RsNLTejB9mmdF2lVvE
 mevr21Rk0BAhRRa2ixs89VAXNdPSBZlxw12ZpV8NacT8IKOR1QBJ+joVq+blYf/tNk
 kBwku5GRPzSwWyeqt8cbQcp1L6wmaj18lTaXGl1EeW4C8NkcTmumVL/0T8z4jlj3JG
 nc17XefzZ6ajA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=Lf5UAT8Y
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

[--SNIP--]

> > I am not sure, but I assumed the Apache License could also cover binaries,
> > i.e., such that they may be redistributed? Can someone shed a bit light on
> > this?
> 
> If unsure, use XUANTIE_BINS_REDISTRIBUTE = NO like for the amlogic-boot-fip
> package [1]

Thanks, I will have a look! Maybe that's an option!

> It seems we have lost the provenance of this binary (who built it). The
> xuantie project uses an apache license and the Debian image from
> Beagleboard project provide its own version.
> 
> xuantie-yocto deploy theses binaries blob (light_aon_fpga.bin and many more)
> from a closed source package [2].
> 
> Kilian, can you try to ask on the Xuatie github?

I already asked in the past via email, but they never uploaded a license to 
the git. Do you mean I should directly ask on the git, e.g., opening an issue 
for that?

> [1]
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/amlogic-boo
> t-fip/amlogic-boot-fip.mk?ref_type=heads#L11 [2]
> https://github.com/XUANTIE-RV/xuantie-yocto/blob/master/meta-light/recipes-b
> sp/opensbi/opensbi_0.9.bb#L2

[--SNIP--]

> In Buildroot we can't track if an harware mitigation has been enabled or
> not. It would be the same issue for Spectre V1/V2 etc?
> 
> At least, this topic deseve to be added into the commit log and probably
> into the board readme.txt too.
> 
> Builroot defconfig are provided as the minimal configuration to boot the
> board, not to produce a final/customer image.
> 
> You can add a note for the user about the "Ghostwrite" issue?

Yes, good idea! I already started formulating something, but I also currently 
am trying to clarify on it, so it will probably take a little bit more time 
before I send another version of the patches (probably few days or one or two 
weeks, let's see - didn't find the time to already do that the last few weeks).

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
