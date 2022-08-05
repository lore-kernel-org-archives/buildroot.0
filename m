Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EF1C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 13:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C76880B56;
	Fri,  5 Aug 2022 13:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C76880B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlfhcqUgqTl7; Fri,  5 Aug 2022 13:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F1A801E4;
	Fri,  5 Aug 2022 13:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F1A801E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD451BF291
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 13:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAE7E41CA5
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 13:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE7E41CA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2d-kQt0K0BaE for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 13:23:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2BE740CD1
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2BE740CD1
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 13:23:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 275DNPsP090331
 for <buildroot@buildroot.org>; Fri, 5 Aug 2022 08:23:25 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 275DNP5q012008
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Fri, 5 Aug 2022 08:23:25 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 5
 Aug 2022 08:23:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 5 Aug 2022 08:23:25 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 275DNPtg106252
 for <buildroot@buildroot.org>; Fri, 5 Aug 2022 08:23:25 -0500
Message-ID: <2a70bd7d-c7df-106f-e3de-fc72e5205094@ti.com>
Date: Fri, 5 Aug 2022 08:23:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: <buildroot@buildroot.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659705805;
 bh=BoNsq3u1XptDPUsOyYBUTgba7xoOyYuQW+L4RhnM13I=;
 h=Date:To:From:Subject;
 b=KsZBYK2lZ5roWBPomhRh3UnP87J1wmR/IWDQOMmLfLalYM3Oxb0Hd7xhwgb663KoQ
 FIjPeR5JZYfgIXi6HM0hd0NGxErylrnj5xZuNXT+yoe+OwELVuSaWK20/bQVHBMnrL
 qlhSkDlZsCBuzxgx0aKuM0a+Rp46vnEpTQRoU7zo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=KsZBYK2l
Subject: [Buildroot] how to add support for custom linux-firmware
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I have been working on trying to enable support for TI's K3 boards in 
Buildroot. The last patch series was submitted here:
https://lists.buildroot.org/pipermail/buildroot/2022-August/648378.html
Which should enable support for the AM64x_SK board.

However, some of the other K3 boards (AM62x_SK, for example) would 
require some DM firmware to be passed to u-boot at build-time. We 
currently host them in here:
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/

This repo contains firmware that is not currently in the upstream 
linux-firmware repository, including the above mentioned DM firmware and 
the wifi firmware for the AM62x_SK board.

What would be the best practice to enable support for these custom firmware?
Should I try to patch the linux-firmware package to enable custom source 
(similar to U-Boot, Linux kernel, etc.)?
Or should I add the whole ti-linux-firmware as a separate package?
I'm not sure if the separate package idea is the best practice, since 
this repo is majorly  mainline linux-firmware, except for some 
TI-specific parts that are not yet in mainline.
Alternatively, is it better to host these other TI-specific firmware 
binaries elsewhere in a separatae repo and add that repo as a package, 
similar to what Freescale does for the IMX8 boards.

Any advice would be appreciated.

Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
