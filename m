Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C2BC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289B9408FB;
	Tue, 26 Jul 2022 20:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 289B9408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R02EPUYTpS57; Tue, 26 Jul 2022 20:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A368408F5;
	Tue, 26 Jul 2022 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A368408F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8481BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E955F6074C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E955F6074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Cip5w62HfoJ for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:56:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC7D8606FF
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC7D8606FF
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:56:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QKuXqa077350;
 Tue, 26 Jul 2022 15:56:33 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QKuXEm126140
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 15:56:33 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 15:56:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 15:56:33 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QKuXQ7076086;
 Tue, 26 Jul 2022 15:56:33 -0500
Message-ID: <8d1611db-29ae-e53b-f900-f57c037cfd01@ti.com>
Date: Tue, 26 Jul 2022 15:56:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-3-x-shi@ti.com> <20220726205529.0e85e2de@windsurf>
In-Reply-To: <20220726205529.0e85e2de@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658868993;
 bh=UstNDiJBaZ1HrcJbXQ829W8JmwrJyASAqo9qiQAPQGw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=bRS52OQdO7AJ9ovClSVvVV69TtdA5sU1slhyaohWAgC79xEd8wiAKPijHTwoGTMQQ
 4tSTSyUmaKSObgLsrjTkkQorUYnbS0Vs9BODR43zyLelwN9762iXHCEzyvlBzkDK68
 K+JNFx7podsYKfGbHmCSvfuY8SQ5YTViPPCyyuJM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bRS52OQd
Subject: Re: [Buildroot] [PATCH 2/4] package/k3-image-gen: new package
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/26/22 13:55, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for your contribution. However, as you will see below from my
> review, this will require significant rework, the approach you're
> taking is really not good.
> 

Alright, I see. Thanks for all your input. I'll rework this patch 
accordingly.

> 
> A new package needs an entry in the DEVELOPERS file.
> 
> Also, I think this package should probably go in boot/ instead of
> package/.
> 

Ok.

> Do you need two U-Boot builds, one for the main U-Boot running on the
> Cortex-A cores and one U-Boot running on the Cortex-R5 core ?
> 

Yes. I can get the 64-bit A53 U-Boot outputs from what Buildroot has 
right now, but k3-image-gen requires a separate u-boot-spl.bin from 
building U-Boot with a 32-bit bare metal cross compiler and the R5's 
defconfig. So I was trying to see if there is a way to build U-Boot a 
second time.

> 
> Do you have a license file ?
> 

Oh, yes, sorry, this was supposed to be a BSD-3-Clause license, which I 
can add that in.


> 
> This clearly is not acceptable. You can from k3-image-gen mess up with
> the build directory of U-Boot. $(BUILD_DIR)/uboot* can point to
> something else than U-Boot, and even in principle doing the build of
> one package in another is wrong.
> 
> Could you explain what you are trying to do? Is it because you need to
> build two different U-Boot configurations?
> 

Yes, the R5 core requires a different U-Boot build than the A53 core. I 
mentioned a bit about it above.

I understood that this patch currently does not achieve that in a proper 
way. Would you mind recommending a proper way to do this? Should I find 
a way to patch U-Boot directly so it has an option for a separate build?

Since you mentioned earlier that k3-image-gen should be a package in 
boot/, should the patch modify boot/uboot/ for the separate U-Boot build 
instead?

Thank you very much!

Xuanhao

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
