Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F43FC54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 19:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D5980AB6;
	Fri, 23 Feb 2024 19:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXXVhplaEofo; Fri, 23 Feb 2024 19:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D84E480B73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D84E480B73;
	Fri, 23 Feb 2024 19:31:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFFCC1BF400
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 19:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC67F40124
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 19:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrBU0Sm_ijwP for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 19:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 508DD400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 508DD400AB
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 508DD400AB
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 19:31:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41NJVaQw105341;
 Fri, 23 Feb 2024 13:31:36 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41NJVa1P117649
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Feb 2024 13:31:36 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Feb 2024 13:31:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Feb 2024 13:31:36 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41NJVa64041742;
 Fri, 23 Feb 2024 13:31:36 -0600
Date: Fri, 23 Feb 2024 13:31:36 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240223193136.sod3vx4t3pkqfcqd@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <90dd167b-bceb-4e42-86c3-255caf825f41@smile.fr>
 <CAOf5uwka5w7DEAOox1pAfZ=mkpostmNATBJ_Ny1xuyYesXUwoQ@mail.gmail.com>
 <bf687add-2677-45fe-8eb1-cf04bd95bf57@smile.fr>
 <20240220004100.3yzqapeplx6olarz@dasso>
 <0b6dbe1f-2591-4290-b620-880d63eee7d0@smile.fr>
 <20240220200414.2bsvqvaeltqhsulc@dasso>
 <1a7ab8e6-bd43-4191-ad95-12e40f3a5c51@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a7ab8e6-bd43-4191-ad95-12e40f3a5c51@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708716696;
 bh=h2c9g/o+vAiOrd66TAeZ/6IvC5viyexwNwfXp5/zGDQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=AjQhSp+wagz4KfHAHc327OH4X2qSb6xm/V7w16zopRJOiXlTFm9zxHXRV1oxGefhH
 4Y3+Rhwa9qDLYoWEzc6kKHXXs+icyZIwijltSiiNANL/CK5uxc16i6dFHQfXABeZ8M
 SxB2I34bzjh0UJ484KyWZpWY/EAiDTtmW9Elxh7g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=AjQhSp+w
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

On Tue, Feb 20, 2024 at 10:36:51PM +0100, Romain Naour wrote:

<snip>

> >> About existing boot flow, I found two recent commit in u-boot that state that
> >> the "Split binary" (that requires sysfw.itb) is already a legacy boot flow:
> > 
> > It's called "legacy boot flow" because it was the boot flow used on the
> > first K3 devices that were released (AM65x, J721E). This boot flow was
> > not used on follow-on devices. The characteristics of this boot flow is
> > that the initial FW image that gets loaded (tiboot3.bin) doesn't contain
> > any device firmwares, but only a bootloader (such as U-Boot SPL). Then
> > this boot loader will load the System Firmware firmware + config data
> > blob (sysfw.itb) into the dedicated core (called "DMSC" = Device Manager
> > and Security Controller). And then addiitonal boot stages will be
> > loaded. These devices require this boot flow, and with this it is
> > required to be supported by U-Boot (and any Linux distribution or build
> > systems that build on that).
> > 
> > TI is still making/selling those "legacy boot flow" devices, and will
> > continue to do so for a very long time. One promiment community
> > incarnation that you are probably aware of is the BeagleBone AI-64.
> 
> Thank you for the detailed explanation!
> 
> I previouly worked on a AM57xx SoC that is nowaday legacy SoC, the latest
> ti-kernel 6.1 doesn't support some of the driver that where available in
> ti-kernel 5.10 (prueth 100M, RPMsg Sockets over virtio-rpmsg transport (use for
> ARM-DSP IPC3.x), TI-RTOS (the csl-common package was also removed from meta-ti)).
> 
> Also the TI SDK on this plateform doesn't seems very active [1].

since you brought this up I wanted to add some additional context here.
Older devices like AM57xx (AM335x and AM437x fall into the same bucket)
will get what we call "LTS refresh SDKs" every year, rather than
multiple drops per year as we do for the more recent devices. As for
AM57xx specifically that refresh is currently targeted for e/o March
2024 and will be known as "SDK 9.2". There shouldn't be any feature
regressions, and the only "new" thing (in addition to an all-refreshed
SW baseline with 6.1 kernel and 2023.04 U-Boot) will be some Y2K38 issue
fix on Linux. TI will be making and selling those devices for a very
long time to come, and the annual refresh is seen as a good compromise
between keeping things refreshed periodically and up to date while
limiting the amount of repeat work/effort.

--
Andreas Dannenberg
Texas Instruments Inc

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
