Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B628C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 11:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D34F941D2A;
	Fri, 25 Nov 2022 11:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D34F941D2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usIEMKARx3SI; Fri, 25 Nov 2022 11:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A21B341D28;
	Fri, 25 Nov 2022 11:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A21B341D28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2AB11BF386
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 11:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E20082160
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 11:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E20082160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5Zg1jVyCfHc for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 11:02:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0EF820B6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A0EF820B6
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 11:02:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6C64100006;
 Fri, 25 Nov 2022 11:02:47 +0000 (UTC)
Date: Fri, 25 Nov 2022 12:02:46 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221125120246.1fed3208@windsurf>
In-Reply-To: <CH2PR12MB5004D69C65B84BEB0241DB7CF00E9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221124102144.16833-1-neal.frager@amd.com>
 <20221124221557.4a18a2a9@windsurf>
 <CH2PR12MB5004D69C65B84BEB0241DB7CF00E9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669374169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLbnUoWja/QNqgTsBtk84x6DEtpYAE8y0W3mJwHXTKM=;
 b=cw2Q/teI0gCI7gc2mXBexuiYpvPDmuDNX+U7gMkjDCOwzNH0VHIM2bg3a98e4G7IJjq1dh
 knh+UVozOC1jTSm5Pq8lhmaDfJebmIQUErbPsWpwcUgEWVg1hWKmFJJuXf4POtozfe+fhh
 y1Pin42pH996Q1iVWdgxtk+4+0RkC3dcPbFDtIwnAnM+UT7wJyVnuoIiuQE4FjHMho6uql
 1dru1h1Lz2SWkYzewDA+0izb2uLUcjDVlmLZE9zH542WjW/Sdd/wugnRuywKllsUI1EkAi
 hwvfl0F9KrG9Oyp4oY55A1iesq9UZ9Zf+jzLokboFTs+ZAMzOyZHHbqJ4luzcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cw2Q/teI
Subject: Re: [Buildroot] [PATCH v6 1/2] package/versal-firmware: new package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 25 Nov 2022 09:29:05 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I copied the LICENSE file from the Xilinx/ubuntu-firmware repo below.
>  Looking more closely at it, I believe you are right that the license
> should just be Xilinx-Binary-Only.
> 
> I will update the LICENSE file to only include the binary portion as
> described in the below license:
> https://github.com/Xilinx/ubuntu-firmware/blob/main/LICENSE
> 
> The source code for the versal_plm and versal_psmfw applications
> comes from the same Xilinx/embeddedsw repository as the zynqmp_pmufw,
> so the source and binary licenses for all of these files should be
> the same. https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps

Is this the full source code needed to build the versal-firmware? If
so, why do we use a precompiled binary? We should instead build it from
source from this repository.

> If I modify the LICENSE file and remove the commentary about GPL, do
> you think this could be acceptable for inclusion in buildroot?  If
> there is anything else I need to add, please let me know.

Yes, if the pre-compiled binaries are distributed under the
Xilinx-Binary-Only license, then that's OK.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
