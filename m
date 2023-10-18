Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A865CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 08:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E7F34036E;
	Wed, 18 Oct 2023 08:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E7F34036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6Ey6KtCtq9A; Wed, 18 Oct 2023 08:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38FD3404D3;
	Wed, 18 Oct 2023 08:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38FD3404D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 759DC1BF285
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58564404D3
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58564404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wP7QWS5kkym6 for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 08:14:21 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 622434036E
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 08:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 622434036E
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 18 Oct 2023 10:14:17 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 36E46B5ABC;
 Wed, 18 Oct 2023 10:14:17 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 9AF8AB5AAC;
 Wed, 18 Oct 2023 10:14:07 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Wed, 18 Oct
 2023 10:14:07 +0200
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (104.47.2.50) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Wed, 18 Oct 2023 10:14:07 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvgQGhsVE10SeKs769W9lJtuGISejhgqY5vFDFITEEh2RSu5M29jKnP/7NACajHIwHi82KxtHO45Edv5LuitfCpP196tYDNW8EQPWpeC8dbYk0DtPqrsdd29rqPMyLg6rBdsiZtg8xDvUb7MQFJPNvkxCPkZ8O4wkfV7Oy5Bt3i+oeUBjuMjK/OUoASU7YOWusvwPtw0fvg/ZOlWoF4fQbcghoHXTew0oBVxj9ZeiGonjoqN4dV8CdTB218k7mhnOEMxwYvrx1uFNURv8MTDZBvJNO2x2BryKB1mtsRTnvKcw89RYafSf/2E1Z+G8sOckfwc/83MhX7Y+/izjCpxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYrcSbBvH40xx5oqYUlxx9whm2j1Qf/ZjcWJ2F7wo64=;
 b=HI0Oj+dOuMPH7/KGn6AegMZZnay0FDfrTwFvT6C4SLeZ9SsaueArrqU1R5FEwktY9VR7L3PJYzJnRlSM1YjuQS2ARfRoL/6lf/T3DPZWeQSVnDoDqIqZtDtYfLCO91bZtKOXDXKWY6rJ+qJyyZKv5+G1N3by1pAAyA6QQsMwgjx7BrIPgby+AnhvEbjVkrpwHPyJQq+Kq/uQXxkPca0X0ZnIJI3hnfIBREMdIbYM60Qke17kGT6woGHqBgAGpTD3UZ+utx0miWo5cCJzlTglqH/gp608lTb1Z6nqbp00iUKu5PC43L9BArjKf6o9oU9kQP2i81Fc8NevtXuRltkIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0168.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 08:14:05 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82%7]) with mapi id 15.20.6863.046; Wed, 18 Oct 2023
 08:14:05 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Need help for adding a cargo package
Thread-Index: AdoBAT7UTBseiLlZR5Sw9SK6lOmjXwABZvKAACT7h3A=
Date: Wed, 18 Oct 2023 08:14:05 +0000
Message-ID: <AS1P250MB0608D8D9378489A165BEFEBAA9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB0608A1D64A9F21ED90E72429A9D6A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <63190f4c-7dcf-406f-a1fc-d3086ba278d9@benettiengineering.com>
In-Reply-To: <63190f4c-7dcf-406f-a1fc-d3086ba278d9@benettiengineering.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0168:EE_
x-ms-office365-filtering-correlation-id: e532a744-bcaf-4c16-f0dd-08dbcfb2324e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cjMoFhwasAb2X4km7/cLC/kIVlx+NUBwlVi0kbA9c8rYCtobE0FdUPLcxmDEFLTLKe+Ym3BmM7cGoWNz1UoY7/aRiREVlvGpMLE7hWjLBIbe9cDnrrKytb1X3Cg584DqYqI7DnMnF66ANU7nXG0+2F8B6tgsGjmOh33hLQbD7nCa+84TJlGzstsTjai9u9XrBpXfJhdl88ttVP89ZjJ0/PJB6V99OLN2oX/AVbwPH5FEUA8haQFsRpkl5ZsDhVV6y9EskibniY4rOKDFz4V2GFrifQw1QPA3+DqYchUbvmPN0kstr2TIEbP/hkS1G8htyreI76jiCYWvysb84FGQ1E+7q3ySyiMAoQrO7c65Ze/MjLe4f/iI7FgWKfd8fLlh/NE3csbFBTJAn/kfjKClAJX5ebrMxlNUSn8StUNa4sTqujnDmKTFaPX872IWly4YSrQaH0G7NPHj/TAE6zhOSptEw/ud/XVapqj4BULXaDF7P+kGaUu2ud7Kkj7N6v1yF35eSmaGZJUc76G9VKYjMu/42sbCb6NMyijX95WCn1bUdgAm2V6NMBIG3RfmHYIOPvyYqCoM9fxdyusE7/Z41cgjDQA+6ESeq+HD5SRwpQ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39850400004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(66574015)(71200400001)(83380400001)(6506007)(7696005)(966005)(9686003)(38070700005)(26005)(122000001)(33656002)(508600001)(38100700002)(66946007)(66556008)(66446008)(110136005)(55016003)(76116006)(316002)(8936002)(8676002)(66476007)(2906002)(86362001)(64756008)(5660300002)(52536014)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXY0S1ZIMTRSUUNFc0V2ZGp2cEt6Z1JvZEtmZnpJTEFpaFBuUVRsOEJoeHVP?=
 =?utf-8?B?MUp1WFBuWDhIVDZ5dkRlVXRONG00SmNvTW9DQ2FuMWpaQXQvcGxCcEY4elVC?=
 =?utf-8?B?Wk1BUXRJSDB4SUpXK2o0Z3Vkc1A4KzNDYVVMQVM0QnVIWTNISDJHcVltKzl6?=
 =?utf-8?B?NzVNbHAyazBTT092YUpaOTFYMHVFQ3NkU2lUZ0NMSldkMkdKTjFQeWxxTlFS?=
 =?utf-8?B?eUpRUEF2ZkdDZ0VjZEpoMTlDRGVNYlVtNFA1aHJOOFVsK0t3TnlsQ0REajk1?=
 =?utf-8?B?ZzBHeElXcnlNSDJsTENiald6NW04dFVMRWpTa1JvRDZSMWRyRlFtMTVWUU9R?=
 =?utf-8?B?MmhqZ1BoTU1Nd0VSNmZCNFNrWmdZaU1HbE5PWEplWFRJNU51eERRbU95dk5G?=
 =?utf-8?B?cXErRmxSUDJOWFZlaDd5UnpMd0pneXJaVkp6RFM2R251emt1WVI2Yk5YMUZS?=
 =?utf-8?B?WGgrQm1SUWhjVUkvdFR4N2x3TzlqOFNWalZrdlFxWGFGOG5KSVd0bGI0ME1J?=
 =?utf-8?B?MGdZOXd5UGJoSTlVSzVBbTFlbHo3WHZ6eDFvK1NMeEIvdVN2V09MNFkrUVY3?=
 =?utf-8?B?ZG12WlRpRmVxYThmbGZ3Ti9ZMmtMdXRJUWRrcER0VDJiSTJuTzAwNzZkOWtG?=
 =?utf-8?B?WmIrTjJPU21lc21iVlpVQzgrOGY5Y3l5SjhmeHd3dTJmdS83Tlg5YU5xcTBS?=
 =?utf-8?B?M1pIWGMyREpWREUrR216aVBFbUpaZDFwTi9CcmxWUC8yT252V1IwVFd2YUl0?=
 =?utf-8?B?Q3RTc29qOUtoazVoY3pOSnVBUkV1ZzZLcjVsbnQxRXpsRU9tRVdTb1RHcDlr?=
 =?utf-8?B?QnRPZ3NTQjQ1dWc5aWk2NlgwbGorQTZBUXMvMHhKV05HZzlJeTA1LzFTYkta?=
 =?utf-8?B?VHdEM3lwYlFCNDNpcEtacFlKNXF0WXlRNFY3d2oxQjRyTSs0MjEwd2luSjF5?=
 =?utf-8?B?ZUNGbGZyWHQ0a25rVHJRWmJ5RUY1UmVLZjlwZ1RiSjRPQVVGUE1NSmdlTkZY?=
 =?utf-8?B?T24weUcrNGhlQ0tzVzRSVVlOQW9heUpTaG10cnc2bWlIazFVQWYxVVhwR2Zu?=
 =?utf-8?B?YlltOXBEbk1aajBIYjU2d09BQ3Bmdk5HMENqdElRcVBMMnNjSmtOMk5TYllw?=
 =?utf-8?B?M3plekZMVlZDa2JyQktGaHJ6cWdkc2t2RDFwWjA3QjFxdEFVc0diSE1MVzBB?=
 =?utf-8?B?dlp3UlVFMFBFeU9GZjUvZ1dyM2VDU0plMUFZVGwwTlBOUnBQVFBraGhXMXg1?=
 =?utf-8?B?c1dSeFBwZW5wa0l3aUxBVzN2bkl3bFhxeW5qb2taKzV0YUpIOFdWYkowYkdV?=
 =?utf-8?B?bHFFUHA5Tm5iOXF5Z3dlVzRyVjZXWGJZTm9CL09NVU9PY3ZVMjJqWHppalJT?=
 =?utf-8?B?TkxKZXA5aFppL01wNFhTWDFRNDFSYnlrTTF6MWhrU3ZzOHdJSmlYVWJ6VFZa?=
 =?utf-8?B?UktsbU5nZ0ppWStiSHcyNWo3TFNnYnR5enhhc0orVjlqbjY0VXJYRHRGaDM2?=
 =?utf-8?B?RmJwSXBPV1kzUXFWdEF0R3A0MEhjWHhNSmoxdlNOTHVBaG5VQldVK3poYWxt?=
 =?utf-8?B?QlIxZVYyc0FFQ2tyS0JiSzdsajVOaExESkppKzRhVWNOWTBkTG5pVG9rSWhy?=
 =?utf-8?B?aUtNL0NnWklMbDA1SnY5d21IMGpRaEtNdlpPRkFhSDA5SWlYZ0NZZHR4NnFq?=
 =?utf-8?B?Q1NKalZEL3ZMSmRKU0cxQTBGWVd5VVBxSUxaeXNNbXhRWFJ2b2hrYktLUUZ6?=
 =?utf-8?B?VU5FdWhMeXYxSGtGVjBhdGthanQ5L1cvTnJRMS8vQkErQ1dKenhicWpLbTBl?=
 =?utf-8?B?ek82NmNEZHJwLzVpQk0zUWM0ZFRQeUQyaFJWRjB5blFNSUxMSlRQSDRjcWN1?=
 =?utf-8?B?V0p2eTgzRVc4bHVJUEwwMnZyN1JKMzRCc3UrblJMbkkwcmRCdEd1M1VtdUpE?=
 =?utf-8?B?TGREUDNZSzU5MFRSMEdDOWRVZnZjb3o1Z0F2QXJRa3dMZlRXSzFZTC9ONExF?=
 =?utf-8?B?djhKWnNjbytzSlgrQ1ZNYzBsMnVnRFZCR0ovUzI0Mi9kUFJtdG5HbGZ0b0RG?=
 =?utf-8?B?WjJwUFZBbzJtMDdJOUZuekNPeFc5UFByQWxjdFVNOVZMNllxNkFCTjZaZE9o?=
 =?utf-8?B?d00zelp5bkZML0hQWDJKVGp2b0NtMzdqMnJRTlUyamNsVFpzNkhmOFZEdHlz?=
 =?utf-8?B?NWc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: m9ujlFwwzTkar4H40plB7kmTzk5QPc72shwkAtrJvn1O4gy/Bp98holMHumvbnSXumRvbyRVbgQSveqtqau0sCgImgQB0rBJfta7K/+B8LxgmhbMr20DBHlyxOPkZB/duntzRIXk2zI/6HUZntv4HPOzvDNlNE4npidg9D8ciHX6bSQfYelQ2UZFMHlprbAtAhA5D4GzrXO9HBpwZ+vgtFN1xr9akfPu8qCC/NQa7malT5l7Wjwjlcs09PXwIIn4rU6wpQVwrqY1b5M7Z5SZt0QZ1dxbhS6gZmwgIxNF7N5TXPhU7cmkRgvE5u+UZRuReayKFnb5DOR6E6y27RBUIhCAi6fmjEoSCGR4OUhnrEvE0SW2A5a6li5S7v8LfLQxx4U2irH8XVWvZ/RIRoCNZhOIOEcaVxJmpgTN1toMLdLNZhKteR0UdjOj+3iIxdnNaf25A3jhKOeBZo77XMJm3sbjYYWMp14qNS/OiY1JN3Ljib4gpMDsDzPVnScZiaD492NxWLCz0x2Eflfgsv4FTLqKtL4tW5PH6Ae515hMiVJ9x3a+TXAjfu3DdFInsLvX5SNRGo0mFd5y/sqeHdN9yst9KdR+sXGXQunZIjwaaGdxHZoZNof8V6eVmLnRNVh6MAlu4UsPQ+HbiTvc2f3z69I7dvRCDWvPVI/jk9/eXSgluKbaE62v/m5RqsgUF194kGZfZLKpReIqPGS2xGISjgukTrE3N6wxOI4dMvmm85w7NhbCJn7Wl+tVRDWHNZaNoXLr+d6cQNh3L8qv9+KnQStW9RpUiTL5XlHKdHWswJ4=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e532a744-bcaf-4c16-f0dd-08dbcfb2324e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 08:14:05.8034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1LtP2EbIB4sJwH3BjfTgzxFFEYtX2cwbEpatx6ePOLrcklzP/Usd3LHgqhHEQLJcqO5V/AHwDVd+KsMOAbeYXEey+TeDhf6a0WS+TXe238=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0168
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYrcSbBvH40xx5oqYUlxx9whm2j1Qf/ZjcWJ2F7wo64=;
 b=GnZNgXCt0KZBbFlV1rBrUVj8nPZSGJuEVACQ0vlOxylgFvqwvV9CcS46RlcJUffQcGZmwiMMZn3ME/JByPpJJLBmP48g3ylXfPzciqy2CxUbJD3rCzWAvYifo2zVwl3/SqsEx1bOuJ1UfjOsCe11zA4X6+cMA8uQTrc3UMM0G30=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=GnZNgXCt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: Re: [Buildroot] Need help for adding a cargo package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmsgeW91IEdpdWxpbywgbXkgcHJvYmxlbSBub3QgdG8gdXNlIGNhcmdvIGZvciBidWlsZGlu
ZyB3YXMgYmVjYXVzZSBjYXJnbyBzZWVtcyBub3QgdG8gc3VwcG9ydCB0aGUgaW5zdGFsbCBzdGVw
IGZvciBsaWJyYXJpZXMgaW5zdGFsbGF0aW9uLg0KDQpJIHN3aXRjaGVkIG5vdyB0byBjYXJnby1w
YWNrYWdlIGFzIHlvdSBzdWdnZXN0ZWQgYW5kIGRpc2FibGVkIHRoZSBfSU5TVEFMTF9UQVJHRVRf
Q01EUywgYW5kIEl0IHdvcmtlZC4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaC4gSSB3aWxsIHByb3Zp
ZGUgYSBwYXRjaCB3aXRoIHRoaXMgcGFja2FnZS4NCg0KLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNo
cmljaHQtLS0tLQ0KVm9uOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4gDQpHZXNlbmRldDogRGllbnN0YWcsIDE3LiBPa3RvYmVyIDIwMjMgMTY6
MzMNCkFuOiBNaWNoZWwgQWxleCA8QWxleC5NaWNoZWxAd2llZGVtYW5uLWdyb3VwLmNvbT47IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnDQpCZXRyZWZmOiBSZTogW0J1aWxkcm9vdF0gTmVlZCBoZWxw
IGZvciBhZGRpbmcgYSBjYXJnbyBwYWNrYWdlDQoNClZvcnNpY2h0OiBFcyBoYW5kZWx0IHNpY2gg
dW0gZWluZSBleHRlcm5lIEUtTWFpbCB2b20gQWJzZW5kZXIgR2l1bGlvIEJlbmV0dGkgPGdpdWxp
by5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+LiBCaXR0ZSBrbGlja2VuIFNpZSBuaWNo
dCBhdWYgTGlua3Mgb2RlciBBbmjDpG5nZSwgc29sYW5nZSBTaWUgbmljaHQgdm9uIGRlciBFY2h0
aGVpdCBkZXIgTmFjaHJpY2h0IMO8YmVyemV1Z3Qgc2luZC4NCg0KSGkgTWljaGVsLA0KDQpJbCAx
Ny8xMC8yMDIzIDE1OjUzLCBNaWNoZWwgQWxleCBoYSBzY3JpdHRvOg0KPiBIZWxsbywNCj4gDQo+
IEkgd2FudCB0byBhZGQgemVub2gtYyBwYWNrYWdlICAoc2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9l
Y2xpcHNlLXplbm9oL3plbm9oLWMpICB0byBidWlsZHJvb3QgYW5kIG5lZWQgc29tZSBzdXBwb3J0
Lg0KPiANCj4gSXQgaXMgYSBydXN0IHBhY2thZ2UgYW5kLCBhY2NvcmRpbmcgdG8gdGhlIHJlYWRt
ZSBmaWxlIG9mIHRoZSB6ZW5vaC1jLCBpdCBtdXN0IGJlIGNyb3NzLWNvbXBpbGVkIHVzaW5nIGNt
YWtlIGluZnJhc3RydWN0dXJlLg0KPiANCj4gSSBhZGRlZCBuZXcgLm1rIGZpbGUgd2l0aCBmb2xs
b3dpbmcgY29udGVudDoNCj4gDQo+IFpFTk9IX0NfVkVSU0lPTiA9IDAuMTAuMC1yYw0KPiBaRU5P
SF9DX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGVjbGlwc2UtemVub2gsemVub2gtYywkKFpFTk9IX0Nf
VkVSU0lPTikpDQo+IFpFTk9IX0NfTElDRU5TRSA9IEVQTC0yLjANCj4gWkVOT0hfQ19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQ0KPiBaRU5PSF9DX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5P
DQo+IFpFTk9IX0NfSU5TVEFMTF9TVEFHSU5HID0gWUVTDQo+IA0KPiBJbiBvcmRlciB0byBidWls
ZCBpdCBmb3IgbXkgQVJNIHRhcmdldCwgSSBoYXZlIHRvIHNwZWNpZnkgdGhlIGFybSBsaW5rZXIg
aW4gdGhlIFJVU1RGTEFHUyBlbnZpcm9ubWVudCB2YXJpYWJsZSBhcyB3ZWxsIGFzIHRvIHByb3Zp
ZGUgdGhlIGFybS11bmtvd24tbGludXgtZ251ZWFiaWhmIHRhcmdldCBhcyBvcHRpb24gZm9yIGNh
cmdvIGJ1aWxkIGNvbW1hbmQ6DQo+IA0KPiANCj4gWkVOT0hfQ19DT05GX0VOViA9IFJVU1RGTEFH
Uz0iLUNsaW5rZXI9YXJtLWxpbnV4LWdudWVhYmloZi1nY2MgLUNhcj1hcm0tbGludXgtZ251ZWFi
aWhmLWFyIg0KPiBaRU5PSF9DX01BS0VfRU5WID0gUlVTVEZMQUdTPSItQ2xpbmtlcj1hcm0tbGlu
dXgtZ251ZWFiaWhmLWdjYyAtQ2FyPWFybS1saW51eC1nbnVlYWJpaGYtYXIiDQo+IA0KPiBaRU5P
SF9DX0NPTkZfT1BUUyA9IC1EWkVOT0hDX0NVU1RPTV9UQVJHRVQ9ImFybS11bmtub3duLWxpbnV4
LWdudWVhYmloZiINCg0KQWxsIHRoZSAzIGxpbmVzIGFib3ZlIHNob3VsZCBiZSBhdXRvbWF0aWNh
bGx5IHBhc3NlZCBieSBjYXJnbyBpbmZyYXN0cnVjdHVyZSB0aGF0IHlvdSBjaG9vc2UgYmVsb3cu
Li4NCg0KPiAkKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkNCg0KLi4uYnkgY2hhbmdpbmcgdG8gY21h
a2UtcGFja2FnZSB0byBjYXJnby1wYWNrYWdlLg0KDQpCZXN0IHJlZ2FyZHMNCi0tDQpHaXVsaW8g
QmVuZXR0aQ0KQ0VPL0NUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcw0KDQo+IA0KPiBIb3cgY2Fu
IEkgbWFrZSB0aGlzIGNhcmdvIHNwZWNpZmljIHZhcmlhYmxlcyBiZSBhdXRvbWF0aWNhbGx5IGdl
bmVyYXRlZCBieSBidWlsZHJvb3QsIHNvIHRoYXQgdGhpcyBwYWNrYWdlIGNhbiBiZSBidWlsdCBm
b3Igb3RoZXIgdGFyZ2V0cyB0b28/DQo+IA0KPiBUaGFua3MgaW4gYWR2YW5jZQ0KPiBBbGV4DQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
