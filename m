Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FCCC7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 14:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D4BE41FF6;
	Thu,  8 Jun 2023 14:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D4BE41FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3ZFZGFoIwlQ; Thu,  8 Jun 2023 14:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C71B41FDC;
	Thu,  8 Jun 2023 14:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C71B41FDC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E08341BF3A3
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 14:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6A60614B3
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 14:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A60614B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bB4rtP7J6ctu for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 14:40:53 +0000 (UTC)
X-Greylist: delayed 01:11:48 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EAF960AEF
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EAF960AEF
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 14:40:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358DT2LN117245;
 Thu, 8 Jun 2023 08:29:02 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358DT2NO055692
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Jun 2023 08:29:02 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 08:29:02 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.023; Thu, 8 Jun 2023 08:29:02 -0500
To: "patrick.oppenlander@gmail.com" <patrick.oppenlander@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v7 0/3] add support for TI's AM64x boards
Thread-Index: AQHZmdKsh0X1vfKIO0Om4OA6jLzs4a+A5Zmg
Date: Thu, 8 Jun 2023 13:29:02 +0000
Message-ID: <b043f10789294e3d9bdb56e551933c69@ti.com>
References: <70cc5213bb4d4e4d8e4b21b1c7122daf@ti.com>
 <20230608063000.882363-1-patrick.oppenlander@gmail.com>
In-Reply-To: <20230608063000.882363-1-patrick.oppenlander@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.28.95]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1686230942;
 bh=oYBvk6W0wsedT+hP0mIKzL2NHegg4sph6HwQ8yiDNTc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=BqClDkHK/SGfT6FPZJ5AZpabtjUIFner6NTtE3uDz7Kaq5L8ipoExb1h7Jwg09WH1
 yFZmAQQXtXmT3c7VEqBKGpXB1J8fjE+VHR6FbEM+/Uh4hoGCwDkz2Sm/xdeFdm4Sua
 +3ooabSsK/dTLDasstVaotbYhaZ0qYRkZ3bd4/3w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=BqClDkHK
Subject: Re: [Buildroot] [PATCH v7 0/3] add support for TI's AM64x boards
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
 "X15000177@gmail.com" <X15000177@gmail.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> From: patrick.oppenlander@gmail.com <patrick.oppenlander@gmail.com>
> 
> Hi,
> 
> I'm looking to use buildroot with a PHYTEC phyCORE-AM64x SOM which is based on
> the same TI part as the SK-AM64/SK-AM64B. Happy to post patches if I happen to be successful.
> 
> Ideally it would be easiest to build support for the SOM on top of these
> patches. Is this series still alive?

Hi Patrick,

I gave up after the last round of review comments, but there is someone
at TI who has taken it up again recently.

They're focusing on the AM62x including other goodies like display and GPU, and
has a working baseline. He was planning to post the series upstream shortly after.

The series 7 should still work functionally. All the review comments were
valid though and might be easy to address if you want to start from there.

Since there is community interest in having AM64x support, I would love to
take this up again.

Best Regards,
Anand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
