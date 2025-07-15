Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188E9C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 14:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC001611A4;
	Tue, 15 Jul 2025 14:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L84z8sax-I_W; Tue, 15 Jul 2025 14:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0014C6107E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0014C6107E;
	Tue, 15 Jul 2025 14:02:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D7BADCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 14:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 530666107E
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 14:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aivtU3PhDM4u for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 14:02:08 +0000 (UTC)
X-Greylist: delayed 502 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 15 Jul 2025 14:02:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA33460FE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA33460FE3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.234;
 helo=lelvem-ot01.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA33460FE3
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 14:02:08 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FE27Od2276543;
 Tue, 15 Jul 2025 09:02:07 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FE27FA119095
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 15 Jul 2025 09:02:07 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 09:02:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 09:02:07 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FE27fb3009709;
 Tue, 15 Jul 2025 09:02:07 -0500
Date: Tue, 15 Jul 2025 09:02:07 -0500
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20250715140207.p5z2khln5cvfismv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250715081938.108853-1-heiko.thiery@gmail.com>
 <20250715081938.108853-2-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250715081938.108853-2-heiko.thiery@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1752588127;
 bh=ooqMxwRxgqvaMoHEZVdTk+T7pWv9zpTg3bvKUyOSirE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Vz7PgrICZ+ZtnVVllD+DqvKkAx2lrJ9E9/423NgvHbJsKyBdyq9TspNLOKerejU3p
 vxiHQ1X9ff9FtZsqyVP1BuxNUUylimqqQH0DwG3vUXFaf5M47Y+Y2B+eO0onYfu2zN
 GjQ8AmvaZj1ucqW9AIiyemifal+HwE03vvjARyRM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Vz7PgrIC
Subject: Re: [Buildroot] [PATCH v2] package/linux-firmware: add support for
 PowerVR rogue
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Michael Walle <michael@walle.cc>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On July 15, 2025 thus sayeth Heiko Thiery:
> This "powervr" directory has been present in linux-firmware since
> version 20231211.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> v2:
>     - add entry to the hash file for LICENSE.powervr (Julien)
> 
>  package/linux-firmware/Config.in           | 5 +++++
>  package/linux-firmware/linux-firmware.hash | 1 +
>  package/linux-firmware/linux-firmware.mk   | 5 +++++
>  3 files changed, 11 insertions(+)
> 

I don't do a lot with GPUs or VPUs but I seem to remember the GPU driver 
was kinda borked right now. It's no reason not to let the firmware in 
but I just wanted temper expectations before we start rendering some 
triangles :)

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
