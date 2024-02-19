Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934CAC48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 19:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58D4140BA3;
	Mon, 19 Feb 2024 19:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZ3i8ywinDi4; Mon, 19 Feb 2024 19:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022C640BC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 022C640BC1;
	Mon, 19 Feb 2024 19:59:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DBFB1BF228
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A163881FB9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pB4-HBH3ou-l for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 19:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D66981FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D66981FB4
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D66981FB4
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 19:59:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41JJxOGD120839;
 Mon, 19 Feb 2024 13:59:24 -0600
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41JJxONh116415
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Feb 2024 13:59:24 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 13:59:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 13:59:24 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41JJxOJD101169;
 Mon, 19 Feb 2024 13:59:24 -0600
Date: Mon, 19 Feb 2024 13:59:24 -0600
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <20240219195924.smciairp2ts3655m@dasso>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240216201903.lhhkjevrgzcp5msz@dasso>
 <735636d6-c0f8-4226-ab8a-1576c2133189@smile.fr>
 <20240216222012.eaes5ktamizu6n5c@dasso>
 <3570b01e6a258bbafa2d6317ba8619ecb39f66ec.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3570b01e6a258bbafa2d6317ba8619ecb39f66ec.camel@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708372764;
 bh=s8nYQv4qA87n1aX/QmKStc3mx55i0jCmghVbuJ8ID7E=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=QL+zvcURdbeaf2dtoioKxA+8jIzA8BMgN+5d7n6DAsVGUIO5oP5eydWwbt09/IFLA
 01b4Wi3bhhRpuSSuWMbbJrQ8FS/nyklQ67BFY9tz2qhg1Lc+hCp2SN4tBFzYfgLS3+
 wuVhE//5z6IyyEzo01iLOCw7vebsBRcRQ0FweCus=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=QL+zvcUR
Subject: Re: [Buildroot] [PATCH 00/21] Add ti_j721e_sk_defconfig
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

On Sat, Feb 17, 2024 at 04:13:16AM +0100, Alexander Sverdlin wrote:
> Hello Andreas,
> =

> On Fri, 2024-02-16 at 16:20 -0600, Andreas Dannenberg wrote:
> > On Fri, Feb 16, 2024 at 10:52:21PM +0100, Romain Naour wrote:
> > > Hello Andreas,
> > > =

> > > Le 16/02/2024 =E0 21:19, Andreas Dannenberg a =E9crit=A0:
> > > > On Tue, Feb 13, 2024 at 06:27:56PM +0100, Romain Naour wrote:
> > > > > This series aim to add the SK-TDA4VM board support based on TI K3=
 j721e SoC.
> > > > > =

> > > > > This series start by adding U-boot binman support already submitt=
ed in the
> > > > > preview series "Add support for AM62x-SK HS-FS devices" from Dari=
o Binacchi
> > > > > [1], with small improvements.
> > > > > See the FOSDEM 2024 talk "Standardizing the generation and signin=
g of boot images" [2]
> > > > =

> > > > Thanks Romain and Dario for all the work on this, and submitting th=
is.
> > > > Will be spending some time over the next few days to see how I can =
help
> > > > out with this effort. I can already see many great improvements sin=
ce
> > > > the last time I worked on AM62x/AM64x support last year.
> > > =

> > > Your feed back on HS-FS devices is really helpful. Alexander Sverdlin=
 also
> > > helped on AM62x.
> > > =

> > > Maybe if you can also test on AM64x just to be sure the defconfig is =
working.
> > =

> > I'm planning on testing the entire series here pretty soon and will
> > provide feedback (I have access to any and all boards:)
> > =

> > One of the things I'm trying to assess is what's still missing vs. the
> > previous attempt I made upstreaming this. For example, AM62x graphics
> > isn't there yet (ti-rogue-km / ti-rogue-um).
> =

> maybe you could shed some light onto the AM62x situation. My conclusion
> is that since your initial buildroot BSP U-Boot has been switched
> to standard boot (CONFIG_BOOTSTD), refer to (U-Boot repo):
> =

> commit 355c0afcd4b7c8c442c4d03e07649c24194b8e06
> Author: Nishanth Menon <nm@ti.com>
> Date:   Fri Aug 25 13:02:52 2023 -0500
> =

>     configs: am62x_evm_a53_defconfig: Switch to bootstd
> =

> and
> =

> commit ab54d9b28d8578cc43b214d39009e7b1def797e4
> Author: Roger Quadros <rogerq@kernel.org>
> Date:   Thu Oct 5 16:06:41 2023 +0300
> =

>     board: ti: am62x: am62x.env: Fix boot_targets
>     =

>     ti_mmc is not a valid boot_target for standard boot flow so
> =

> I suppose TI's BSP still uses older U-Boot and is still not affected.
> Do we need uEnv.txt now? Do you have an idea which distro Nishanth may
> have tested with BOOTSTD change?

I wasn't aware of those changes but I just looked at some of them. Looks
like most of the effort was targeted around the BeaglePlay board.

And this was tested with Debian. You can find one of Nishanth's boot
logs here [1]. It was referenced in the cover letter [2] of the U-Boot
series that introduced the 'Switch to bootstd' change you pointed out.

If this indeed causes some widespread breakage including Buildroot we
need to understand and think about how to best resolve this. Will dig
into this some more as I'm trying to get back into helping with the
Buildroot effort here.

Thanks, Andreas



[1] https://gist.github.com/nmenon/c74acb3a895053e05623e886df77c8fe
[2] https://lore.kernel.org/all/20230824031101.3460411-1-nm@ti.com/



> =

> -- =

> Alexander Sverdlin.
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
