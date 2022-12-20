Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790FEC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 19:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D725C40432;
	Tue, 20 Dec 2022 19:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D725C40432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5_aH3-kmLOr; Tue, 20 Dec 2022 19:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 294B940518;
	Tue, 20 Dec 2022 19:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 294B940518
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 388861BF59B
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 19:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13CA940377
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 19:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13CA940377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sL71TDWGmXHp for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 19:30:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1924402CE
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1924402CE
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 19:30:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BKJTvYt066154;
 Tue, 20 Dec 2022 13:29:57 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BKJTvbF048059
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Dec 2022 13:29:57 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 20
 Dec 2022 13:29:57 -0600
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.016; Tue, 20 Dec 2022 13:29:56 -0600
To: Julien Olivain <ju.o@free.fr>
Thread-Topic: [Buildroot] [PATCH v7 3/3] board/ti/am64x_sk: add new board
Thread-Index: AQHZCZal2qR/5Fguz0SpJcRpAwsBqq52LrQAgAEPruA=
Date: Tue, 20 Dec 2022 19:29:56 +0000
Message-ID: <70cc5213bb4d4e4d8e4b21b1c7122daf@ti.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-4-gadiyar@ti.com>
 <b88bb3e12f131de1038887a94211a64d@free.fr>
In-Reply-To: <b88bb3e12f131de1038887a94211a64d@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.34.68]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1671564597;
 bh=n0LMF4wgL3RaL4Q3M7EQl4rWwhsyLYpD2qGj6vsXkbg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=VHA8ajNnYVM1N8QTDDQGcQZ/r9b7w8Io/XSDRDzAec3tMIYCFap/FRhwbbbkbKhRV
 2XJtvD710dvf/2Qm2oKvFmRptPk+zDF1HtMoIe893aaQIiWTsZ4zOOrGrbPdx5uHqs
 dATe+67+6PAew4xE29HFO+HE0qy/HAVSzHV2GSJY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VHA8ajNn
Subject: Re: [Buildroot] [PATCH v7 3/3] board/ti/am64x_sk: add new board
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
From: "Gadiyar, Anand via buildroot" <buildroot@buildroot.org>
Reply-To: "Gadiyar, Anand" <gadiyar@ti.com>
Cc: "Brattlof, Bryan" <bb@ti.com>, "Davis, Andrew" <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> From: Julien Olivain <ju.o@free.fr>


> > +
> > +These configurations will build a complete image and
> > +device tree blobs for the the TI AM64x_sk board.
> 
> To avoid confusion between SK-AM64 and SK-AM64B, I suggest:
> 
> 1. to add the board url in this readme.txt, for example,
> using the same comment as in the commit log:
> """
> More information about the board can be found at:
> https://www.ti.com/tool/SK-AM64
> """
> 
> 2. add a note that:
> This configuration is for SK-AM64 only, since it's including:
> BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="gp"
> The SK-AM64B [2] is not supported, as it would require "hs-fs".
> 
> [2] https://www.ti.com/tool/SK-AM64B
> 

Thanks for the review Julien!

The SK-AM64B wasn't around when we submitted the first patchset.
I expected a follow on patch to add the hs-fs support properly.

I'll clarify in the next revision that this series is for GP only. We'll need
some work to get the SK-AM64B supported and tested, and I'll try and
get that enabled after this initial series is merged.

I'll post a new series shortly with changes addressing review comments
from you and Thomas

- Anand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
