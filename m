Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4342C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 12:23:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6444361038
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 12:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6444361038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iml.fraunhofer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F5DD40436;
	Mon, 11 Oct 2021 12:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xplvsGFzdrbe; Mon, 11 Oct 2021 12:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F1DA4041A;
	Mon, 11 Oct 2021 12:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18C021BF3EF
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 12:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E5F80FEF
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 12:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlBTiCYTiS2B for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 12:23:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx-relay61-hz1.antispameurope.com
 (mx-relay61-hz1.antispameurope.com [94.100.132.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F09B2819D1
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 12:23:14 +0000 (UTC)
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26]) by
 mx-relay61-hz1.antispameurope.com; Mon, 11 Oct 2021 14:23:11 +0200
IronPort-SDR: ozKhV/VO3KhadpxMFfDBcj0wDU1c3gse9/4DwwDVUG5cg/ko+KCALgKKkXtwLeb7Kw2u1LRcny
 DQTZCV5jIAj0bsSyZwaH6A4Y+X+0SDUbQ=
IronPort-PHdr: =?us-ascii?q?A9a23=3AL5uSPRDwGoohLZE+IaSYUyQVjhdPi9zP1kY95?=
 =?us-ascii?q?Z83zbRDbvfr85fjORnZ4vNgxB/MUJ7A4v1Jw+zRr+j7WGMG7JrA1RJKcJFFW?=
 =?us-ascii?q?xIfz8lDmQsmDZ2KDF29KvP2PGQ2Gc1YXwpj+He2eUFeBMf5YQjUpXu/pT4fE?=
 =?us-ascii?q?xnyL0x7POPwT4/Xi4K5zemv/Z3UbQhSwjawMttP?=
IronPort-Data: =?us-ascii?q?A9a23=3Amzd17aN4kqYbLPDvrR1flsFynXyQoLVcMsEvi?=
 =?us-ascii?q?/4bfWQNrUoq1jwCzmodCjyGP6uOYWCjf9wiO4nk9hxS6MDRnd5iSnM5pCpnJ?=
 =?us-ascii?q?55oRWUpJjg5wn8dtEp+F+WbJK6+x8lBONTGMu4uSXrQ+kWkPrT79CYu1KSMA?=
 =?us-ascii?q?LTmAfPCOid/SBUiRCp40UBvnOswg4hJh9mlAlrR6I2o/JCFYAeoi2xuL2YZy?=
 =?us-ascii?q?6Ofsxcz7v78jzUV4w4lbvdRsV6CynQYUMAfKKW2IyeqS4VYBLTnFePExrC98?=
 =?us-ascii?q?yXU7xwtTN2/m6v9ckoET6SUMQXX0ihaXK2rgx5joC0u0/9nZaRGNhoN022Ez?=
 =?us-ascii?q?4Jr1dFAlZ2sUgN1bKfCr+IQDktDGCZkMKwapbLKfSqlvcqIwxGUenfg2a40X?=
 =?us-ascii?q?hhrZshJpaMuXj8Lq6ZeNjVLZVaNneurxrK8ROR2wMgudZG5MIQas3Bm7DfYE?=
 =?us-ascii?q?fd/HcGdGfqXv4cA0WdinN1KENbfe9EdNWhlYiPGbkAdIVwQEp8/wLqli3SXn?=
 =?us-ascii?q?+e0c76ujfdxszW7IDBZiuC3aYONI4XSHK25o27Bzo741zShav0lHIHHoda12?=
 =?us-ascii?q?irEat7nxUsXaqpLfFGL3qYCbGmo+4AmIEZ+uW1XARWOohXWt9p3cyT488e1x?=
 =?us-ascii?q?EQ43BTDotLVB3VUrJMY1yPwVea8E8VigO2M4q/T6QedCy4JXjVBLtI8vdIwR?=
 =?us-ascii?q?Tsk20XPk96B6T5H6eDODyPCsO7L83XsY0D5LkdaDcMAZRAZ7tfqpscshxbTQ?=
 =?us-ascii?q?8xLEauxyNPvECz2wzeEoTJ4i7h7Ycsjjv7moA2f2lpAobCTF1JkvFiJNo6/1?=
 =?us-ascii?q?Sthf8i/apSv80Tz4vNQaoCUUjGptmUFn8SE6+cSJZuQlSiBWuIKAPeu/fntD?=
 =?us-ascii?q?dF2qTaDBLF4qm/oqiHmJN8OpW8kYllsdM1CdyXgfUnTvg1c/tlfMROXgWZMS?=
 =?us-ascii?q?9rZI6wXIWLISbwJjszpU+c=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AuJ3sH67NNE37aP42/APXwOfXdLJyesId70?=
 =?us-ascii?q?hD6qkoc20zTiXqrbHJoB17726PtN9/YgBCpTntAsW9qDbnhPpICOoqTMqftW?=
 =?us-ascii?q?vdyQmVxehZhOOIqVDd8m/Fh4tgPM9bAtRD4bbLY2SS+Pyb3ODOKbcdKbe8n5?=
 =?us-ascii?q?xAzt2utkuFBTsaE52IwT0JcTqmLg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DNCQA8LGRh/z6wYZlagQkJgyFRB0y?=
 =?us-ascii?q?BAwEmQ4gOA4U5hWeCJAM4AZo2glMDVAsBAwEBAQEBCAEEOgECBAEBhH4Cgkc?=
 =?us-ascii?q?CJjgTAQIEAQEBEgEBBQEBAQIBBgSBEROFaA2GQwEBAQIBEigGAQEUIwEECwI?=
 =?us-ascii?q?BFigQMgceAQEEDgUIGoUlAw4gAqBQAYE6AosXgTOBAYIIAQEGBASFChiCNQk?=
 =?us-ascii?q?JAYEwgwOJJYFjgg1DgRVDgyWBBYEcgiaDTYIuiyyBUzBUQC0IgSq+AwMEA4I?=
 =?us-ascii?q?EgSyfCRSVZ5Ewu2wCBAIEBQIOAQEGgXgkgVlxgzhRGQ+OLBaDUIYAhF5CATE?=
 =?us-ascii?q?4AgYLAQEDCYVHAQGOTAEB?=
X-IronPort-AV: E=Sophos;i="5.85,364,1624312800"; 
   d="scan'208";a="1355501"
Received: from 153-97-176-62.vm.c.fraunhofer.de (HELO
 mobile.exch.fraunhofer.de) ([153.97.176.62])
 by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 14:23:06 +0200
Received: from XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) by
 XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 11 Oct 2021 14:23:05 +0200
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (10.225.8.37) by
 XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.15
 via Frontend Transport; Mon, 11 Oct 2021 14:23:05 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBY9BmcK71RyvcdzmRV5YCmE25r9qfV1h8KqU74JskKOlDlrb5SjAei++LCyFtSUxrtjOOq1DbZQaclItpQDNGsGzszMGQPrNlS6RjJvOyZZh9Ltl0lNJ9h117hNOIhPTsYVcEtn8Oce17vs9S2++sxzEc5nTYApp7YWFwx0XXrHmvAieQoiwfmyxxWw1ZhTPYoCiXNvzbaguAFGOL1AOI1vOcMlGBjx+5eMD9yYAdUFWtMydVWFeXmPB1pubmzRRwEdoJ5HPx10sJ+R8Axctu4M6XxlgMTjQ5i1bXdRvD0KyVAETxfaaTWCZdQCWGzCIyeZM6qtBVGKdvDS0JPeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq+KmLNO/QvMtXekPo+MqHT1Fcq+gCPtESUoj5JxFZs=;
 b=kpKKeyThxEr3x+G4XLBPPzj6aYPNSKwqmF/FwaMaHx3ZA1Nls/iJOSCkSkdVWq+G2PI0pcTXm9HOx8IOslfEFzarDIgqulgvh7Rx802ZT59IPXBknk4ZxTEltuNv12lQTKqql2iENtaGg7sA18Z1Hkuv7bec4Tlxu4byVtM5dJsgA5OauoJVNh5EDOd6hZbkheJ2SO5c419Gd5J9Y/ErB6xcxQxhroq3w11qUDgb25P3ramgYzFPKNq58vW3vZx9bJ/8WRK/NLYHHWrG0Xazy9lY4Nd3UcOK+0AHvooDxB5wgLvReqYCenCrlMddNJriUteiP65NWCvWe7l5i7ZYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iml.fraunhofer.de; dmarc=pass action=none
 header.from=iml.fraunhofer.de; dkim=pass header.d=iml.fraunhofer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq+KmLNO/QvMtXekPo+MqHT1Fcq+gCPtESUoj5JxFZs=;
 b=bsxZ+6mKyS/zhAroUqdto1kKDt5PK5kh7KazF9IHRrKu9aBXk3g1l3HupJ6pUSJLo9dxq5qMfftIMj86Bfo+0dZlZkZIVZYHFt1e7iwbk3NKWBdbF2Zk5Dz9tcU5eubQ30YAWbPajXBcI1mtkTKlZS7MmssNxxiXK9KFpMob57w=
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:4:c5::16) by
 DB8P194MB0630.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:15d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19; Mon, 11 Oct 2021 12:23:05 +0000
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a]) by DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:23:04 +0000
From: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
Thread-Index: Ade7uZXHP7nGx63eQL+BAdw+WW1TNQAC7xCAACJQTnAABr5hgACJCEnQ
Date: Mon, 11 Oct 2021 12:23:04 +0000
Message-ID: <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
In-Reply-To: <20211008192555.6dbd67d2@gmx.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.net; dkim=none (message not signed)
 header.d=none;gmx.net; dmarc=none action=none header.from=iml.fraunhofer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b05b6cc0-1b99-4ff9-785e-08d98cb1e04e
x-ms-traffictypediagnostic: DB8P194MB0630:
x-microsoft-antispam-prvs: <DB8P194MB06303A669A94A0FACAC7CAE1B7B59@DB8P194MB0630.EURP194.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mHfbyR4qdwwNMElCTh7au5HYRjFNPYNgDQVDSZ6IrGIkSahSjvSJFlC3mdwDFgCF7xO7CuiN6t6FM26KjtEOrrbfNOVkzcZv3N54cVTmnf6V/6bzF3efg0AVCPMGX7+nTMTzgGItQ2UQ4jtwsc7fxMd+6wXGBoF13GMv4ONfbewkYNcymxiu9duRDT16aMlwKlJsPQT5Gnc1KgGdWZsTIC/EMNxTLb9boryARt9Y82BFOSJ3LWxUFb5cEYghvXoAn2gb2sKvaTB//1LF7BpZQ8zHcZqtVHNZ2p3QdmVRHheSunqgSvX2Ub9m73tKYaVSwN4fV+L4kTgAk6SZlx/KHYcHQZuaTGDXY8MEdU9ycLqaYYplwnOQ6H1/gqYX+Nq/9cS0EaiklJcxLpkYQkEHzOO6BjloUhGxacQ2htRhqkAQoGR0JbHcx/pKSVRaAPbJSlVs/fJlDq2/7KemU4mqsft4zG5CKttBmb4/F/3aWMsxnt/3aQXE2vgAxCpCJN+sXUCjOUNXrvwWzDnE9lXqvu3imKwc+Gx6uzDD6BVfnFnu29INQnkEX8udMAjlOaI+WmyT2Os/ubw0pjM9sPGMImyI3MC1jVEleDJw/eGEpBv0V7SLf3A+5CZ4TiViQq80ZNldpCn1XbyLXEQylmWCzguNrHmq2ATGu54uBta3E+GZj181cJMX8rcKcNrfCemYtIU66n49XUEDs49UxCQmSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P194MB0022.EURP194.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(86362001)(316002)(55016002)(4326008)(38100700002)(5660300002)(33656002)(26005)(7696005)(9686003)(38070700005)(6916009)(6506007)(52536014)(122000001)(8936002)(76116006)(66446008)(64756008)(66946007)(66476007)(66556008)(71200400001)(186003)(2906002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QrC7vdB6uJF7B5tSK0UG7i9Ki9pVR/MBx0OeEfpsaxgkefI+Iou/p/cX2J/E?=
 =?us-ascii?Q?/MLfXNmnzyv2qg/mscTkfomHqdD/DeKHqf5zCVn6XODo9LI697MbfG62WEg+?=
 =?us-ascii?Q?8STKWJEIRXAQPz5BXgAa0a7cDESNQCjOYklzw3CpONbWQcCLbXh8PFCoSdtG?=
 =?us-ascii?Q?IPk9QDHu/u429DindJuFBKSllabow5mkJpLECRS8FXRf0Hnq5pZZ6rTw0mQs?=
 =?us-ascii?Q?FtD6YtCJI4lGmEFfkKD9ROadZph73xbFTH3OBlL/g3vqJnVQTvY/MMxFKs5P?=
 =?us-ascii?Q?NoeOdgi6BiFOfL0BBeq88/EXlfb0aQS0FqcMvB0QkwZQjs2VgbbYeGp/032J?=
 =?us-ascii?Q?wHS0wQXkhE2onE1GShzjPfJJB4yHN4qnhD3dp5ZXF1viB70XTZipEqkELH6n?=
 =?us-ascii?Q?DZT17bVI77EAqXQbjrcGqM3v7BCnGuGiaHm9J6cuBnd8sH9APIZvLv8DRt6O?=
 =?us-ascii?Q?KiXdm+/84fUAgfbVTGm01WrJOi/7+1AjWtpoxUmO5BaPsHBiRZxo/jIvT4Q7?=
 =?us-ascii?Q?9tbfHY+/jPpuQAkgCUj15NSbM/1ZECOfpv2dd8Pb8VwmQwifR4PwoAOuSfNs?=
 =?us-ascii?Q?wX6RfLY+JtuoxSPkBpGMWG2dXEmxhKAxOSmjUoHfrOX3u414VZ6tNI5wSRC9?=
 =?us-ascii?Q?pl05CUjLg2055zzKm2ZfQPAo2JrYscRB1OPQ1WRDGLbSYmwvySLeNHBoTFhg?=
 =?us-ascii?Q?cIwH7l0buc3/231kYLyHBnFhiYDcf9PmS4nwO+q1guzQHdErv0Q9Fj+AdOAV?=
 =?us-ascii?Q?rp6s3qLDPiheaeQSU/6tlGot+0H6sIWOolEp0MW+i2pteAqCPWbANJKNOoUY?=
 =?us-ascii?Q?6/lBdN58na/CvSvCPyG+VI97n8z3j1g5+OO5g0o1XCTVl5ZCaSmJSzHSSybH?=
 =?us-ascii?Q?L9L8wbLPBVyNRZiVAN0MfmdGs1Ye7A67/JAKwgjq8pJRyr5DLsnKGSfWPxkO?=
 =?us-ascii?Q?f2C2f6RjHyeEYvMv5LTvQaJxSTxCdB16vN/+/j2st5/vMXAZJVFfnLYZMOZK?=
 =?us-ascii?Q?GYIZAYOW6CgT+PQXb9IVAnyoUFZUvilBrvmSnZXfi+DEG3UD8ahilxnfRccF?=
 =?us-ascii?Q?MSXgcttVliSCCGhJbuBWkPwhkEo0g2wPYHBeurJp++orZcIOt1fkTKgCBoQO?=
 =?us-ascii?Q?oY5SxFieqRzIv9fm3jiSNdr81AQnWWxZ0m5lKY8cb0K3vdm0ZIYZNo+Jcwr7?=
 =?us-ascii?Q?ZZuk+BgYb7xbRPRuxeuyVyZOc2T1EQcQpvG2f+oih0HZXDY9QFcw17YVBaQi?=
 =?us-ascii?Q?kUX9NDculUNx9D5k7kNnsk/SedijLts4T0Y6B8Xr33dxHi6HP7+bQcZRRU0Q?=
 =?us-ascii?Q?4lbyt0h3KH2naWS0paXgZbFL?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b05b6cc0-1b99-4ff9-785e-08d98cb1e04e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 12:23:04.8495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6RHUmk3PtJXVtrj8lNRmkQIb0CtxIRfe3EzMNmm49brxSBuO7tznWPDfI1IhvL+j5B8SE8nlhtA2f0p2u8F+KUj6dd5MtPVpDYyvCU9+WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P194MB0630
X-OriginatorOrg: iml.fraunhofer.de
X-cloud-security-sender: stefan.walter@iml.fraunhofer.de
X-cloud-security-recipient: buildroot@buildroot.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay61-hz1.antispameurope.com with 5C9552AB9C5
X-cloud-security-connect: mail-mtaka26.fraunhofer.de[153.96.1.26], TLS=1,
 IP=153.96.1.26
X-cloud-security-Digest: bbc905e239deff219132dfc5c981d756
X-cloud-security: scantime:1.377
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Von: Peter Seiderer <ps.report@gmx.net>
> 
> > Is anyone able to boot (an i386 machine) with a setup like the one I have
> > described?
> 
> I have on running config with grub/i386, buildroot-2021.02.4 based...

that's strange. Building with the configuration that was attached to my original e-mail, it doesn't even boot with qemu, so it's a problem local to the actual hardware. I just re-checked with 2021.02.4, too.

> Maybe try to 'bisect' the problem as you mentioned it worked before
> 2021.02.1 (did you test 2021.02.0?), not much grub related patches in
> between...

Buildroot 2021.02(.0) does boot, the following releases on the 2021.02.x branch don't. I just tested 2021.08 with the same configuration file, and it doesn't boot, either.

I haven't actually bisected, yet, but looking at the commit log, ...

>   e840f2d469 boot/grub2: Backport 2021/03/02 securify fixes

...this looks like the most likely culprit, because it's the only commit to boot/grub2 I see that makes any changes to the GRUB sources between 2021.02 and 2021.02.1.

>   300c8d20b5 boot/grub2: ignore the last 3 remaining CVEs

This one doesn't actually make any changes to the GRUB sources, so I guess it's not it.

>   860c15087d boot/grub2: workaround breakage with -O2, -O3 build

As mentioned, I had hoped for this commit to fix the behaviour, but the following 2021.02 releases still don't work for me.

I'll bisect to be able to point at the actual commit more confidently.

Best regards,
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
