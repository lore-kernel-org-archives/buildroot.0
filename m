Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EC3C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 13:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 450224099B;
	Mon,  3 Jun 2024 13:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTYt4bYU_-NY; Mon,  3 Jun 2024 13:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89FD540A81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89FD540A81;
	Mon,  3 Jun 2024 13:27:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7DE91BF3DE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9247A82155
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XsLsN8_Dw6m for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 13:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58B0882079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58B0882079
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58B0882079
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 13:27:01 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 03 Jun 2024 15:26:59 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id A75B5B5ACC
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:26:58 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 46CBEB5AC9
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:26:47 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 3 Jun
 2024 15:26:47 +0200
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.44) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Mon, 3 Jun 2024 15:26:47 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdMued4rI37+qtVxSAzIGbPtpzbaxfv1cRqt+bY1LRDAznJ8asibowhI69/sdzT/QwSi7RZplb1OKZFw6D1aVxBdetlm0yZBCSUjilGgz7eF8CPDH8uXtVIaOKnVOz1T6hR/QD6fmbNfTF4aqdzeTDX2FvbamKTPEeQtEOsXQOYuZeXZ+cSHK1KN0JLoi8WshqBmQi7wsmt3xPLWUAydtSBc9M9XtHCV4RQLx623YT5DOwBCbfGATnIzsQCz4oTjBOdPI8KqW9tDUsf6n4vpisl2bGbidrhUKosWNLVJMK8FwXQAlF6CdSa6ZiwwsRCbnjzQKuTQYXLGIXWOlMOWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCb23gj2edsJ90YOfJuLLp+2IjRSr59x3FP+YDy60r8=;
 b=beZsGt326VtF8Yq62Nr7IYqxudJK1BDiQ5A2a7BYpdvYHvcp46LTC1izPvnh5x+4Ip9IsUTmJMX2BTvo656c90Yz8ZmUE4iH6TxVDSjdsCI7oz6Zzhch7sd7Yqy8ujXagQM2+USHw78r7uT1WpRSVbYxGwJZlwyCt4lPK04yd28n33XiSIdtyXQPiaidYRIgk9RCoulR5RGQgP0pyMnM28JQIv7eNKd5x/fa7SnS4b3s5hI5rHYm6gsW1zQfLOjsNfQXC/8gQdqbBGWeX98ajil9IzInCkxbtzdAQS0413fY+L06EnF+j8N/d3LDakpFeYFYT2MpKkg+pdelkrUdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0120.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:373::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Mon, 3 Jun
 2024 13:26:44 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7611.025; Mon, 3 Jun 2024
 13:26:44 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: need help for fixing some build problems
Thread-Index: Adq1uVJRoWIY1joqTj+J5VYabZMYWA==
Date: Mon, 3 Jun 2024 13:26:44 +0000
Message-ID: <AS1P250MB0608C9F89F3830573FAD7932A9FF2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0120:EE_
x-ms-office365-filtering-correlation-id: f4894ad6-fa83-4558-70dd-08dc83d0cff0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?bbePE2VvW4KSovXBmCUjwW7sBnHcWovrTxyiAyfquzdb6A10FfLvznFA/JoY?=
 =?us-ascii?Q?eFQtwz9z9dXv/TLHXn8BX08ak1Lw6iQKFWlvcWjRMdRMLtipbVb1lCzIxsXz?=
 =?us-ascii?Q?SFnYJhU1S+N1QVExqt5qd2khxG7sxWjmY4Z/R0/VPNDaGGgQHix62JBChKi1?=
 =?us-ascii?Q?y8QmnNIOQ7oxu9kcNV0YksTvhDoIu2gHnXL7iFWVh6dYchKklCYGT4pJOudZ?=
 =?us-ascii?Q?nOxK5T+SwHvyWSczAAAUal0oD9esBSFWv2QZERACVWIPHhSOmhgPucWDXFrx?=
 =?us-ascii?Q?IyJNScLiHaPUseGDQKnyI3zahhJiBh0joBvj9YO8fXcEhrhPlExmSRSnfSQc?=
 =?us-ascii?Q?8I9SResWUKVfAWoQ2T5+Rj4Ub/IfqoGD1PxrEuPHaewNkIKsy4qdvZl4Z2cS?=
 =?us-ascii?Q?ZkCXn7Go7N9vJNB8/5fYnWkIvUtuczqHSDV22fZ2HkUEEEkNfgFbFoMD1n77?=
 =?us-ascii?Q?j9A7N+zkBcAl4MX3NFSAlcYMWa4RN41zWVHymJJyoeQp62WHeOQW9X03pzZ8?=
 =?us-ascii?Q?7MpbXkCiY05kd3er5Fu8cu03gl6LLuv4ZRk4KT/CHI1PPUQQF9W5zJYdABtu?=
 =?us-ascii?Q?EXcPUhxkX6pTYqGb7umqDkIbX78xsBiS4UG6pGQzhgsbrQDIVUhlF313LI0B?=
 =?us-ascii?Q?JZFU/Sa0lX8hRpCZMP0Wv1e8uoPwOeoOF5UbvMNvULzjEkl6MfAhpK++Ziwg?=
 =?us-ascii?Q?uxhd3xuKNDmPYtj2lDoDyKV4uWFEvRlBvex9Qb5RKRiQQAmw3Fg3tDJY4ldw?=
 =?us-ascii?Q?T+37tptAthFJI/qvagbivAPK6ITNFNDD1WdIjN4ugng8wM+f3yO/Aggr11SV?=
 =?us-ascii?Q?wPpYgT55sRoyxdEwaSCM7WckX2T9MwSel1ORfbyfcTg+g2abrypM1o2wJR5B?=
 =?us-ascii?Q?1apVRaamWsvLja0Ak3dg+GWtd0aHf7TR7X4uGVsokLbmbN5mRfkY9DfIb8jb?=
 =?us-ascii?Q?Nxhlr7isbrDiPwF8tXGz/m82cLjCSpIzsFxmEuhjaNReROeWphTBbO1e3lQM?=
 =?us-ascii?Q?fLGoSI+Izbm7T180ZtcMVPT39ebyAf8huIWxKdYwxqTw9/+dTlNHUvIwZZke?=
 =?us-ascii?Q?Bfoo/qtr3WEqthDux0G7E5/TNjRBuVBD3gjCZt+rBNMaLsiYHXGdQoSxdMS8?=
 =?us-ascii?Q?wTV9hdj674XCsxnrzs8yC/4ZY56T16WLUdaHgEWDVkf/gr/qUH6hPWihswfn?=
 =?us-ascii?Q?vGz9kji++s46wSK4PokNhrs9hZ2pQ9D+Y4UzytIpOgCJ2fiLHbS2LDA8iQf5?=
 =?us-ascii?Q?qIkEVVFEFijlgOCxxn8A6RJ3octR9+DA7PrOm9mQDA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GMHxNtvdb8nRG6+ybcNUvdJjETjuxgM7PFCUlmxhX8xt0PGU2k2S6pFnc2rj?=
 =?us-ascii?Q?Fug739GneV0PB1h4SHLJ5jml6EBaiip1xr8oZPAKucv9qKjQ6LzlHXcBXNoB?=
 =?us-ascii?Q?5bemaQqlU7EQjkQY80/lfIyZhQrLyUdFK3NK277QVYuP+AFoGOg+MU6YruG4?=
 =?us-ascii?Q?j9LA9ot4kB+T9gGjTlyZP+KazIAYvyj4PrsRAvWuJFiG5X8v1ShlVJEzFPpb?=
 =?us-ascii?Q?alxPr3UgK1+7fEU1BjKmH+h+0ugt6QcsWA/+/a3iwGV0Cq6d+eCIREnek0uF?=
 =?us-ascii?Q?AHNXMnzZWwLDCB/LhhyWFV0Vf7xRCqlJf7CNBfo5fNHHhg4Xj0sErqBK0POl?=
 =?us-ascii?Q?ITJC4KPjuLeoG5FORpwZZ7Lz5nQ0WM26ZFOpvokfJgyCcXgbAfTLSRJVPUqK?=
 =?us-ascii?Q?/lOi6Orof9l2ei6ey7KHfPrgdYfOti3KLSjeOgtKvBWtPGlWgOsdudkKLHXc?=
 =?us-ascii?Q?tdL2Qm+aRGXv1pv8/dnjUyJ2VSmuQliI+QBczDsy0SUKSrCbYOHZuGRPw1LK?=
 =?us-ascii?Q?GJc2pIPcgfz+8lyPdkRFJfzmUTEfb+lJsmnQSu2nuRhZZekBjBfazxnn+Xg1?=
 =?us-ascii?Q?ccCX9Z2uaY9TvHE2E0HljNCOrtF0rqREMscZjN0wSHeOs6sFMyXhPr0NoNmu?=
 =?us-ascii?Q?hdN2QHysHX8+VVXcUhfgv8C6gj37D+j1jO2pzEYOb2aSTxiESi0tEq+IpQgF?=
 =?us-ascii?Q?cJQsnN+2dXlv2zFOQl+lYrxTQYevVnWazt/71DlxH8GLvCuEh115VWUO2+T7?=
 =?us-ascii?Q?N2tZ+JP0gUbQTDxOn6Rq6wmymybwiA+Ea5tp9OQKyprnBeyPUAqpmttF4byr?=
 =?us-ascii?Q?DJVds/fTTZ7MWxWZuKnsCSUQdLC23sG5ZEg7bbAel9StvoWQJu8NvlLk4w1D?=
 =?us-ascii?Q?qodLdZCTuO7aoXdaIr7zwwO9Q95QT03rmaWKYPKcMVfoAVB3ZSvg1Aj+lAVh?=
 =?us-ascii?Q?1FCQiyynaE41chgLqSBkm2Wy/ntHhE1FvoDYEqT73hVp3lEuE01uGZfjTH2M?=
 =?us-ascii?Q?aI9TYf3yR+zKCXdFqkhjUA9I+pyONsjLVhrlFbfis6C44/+Bhz38swEcrI9d?=
 =?us-ascii?Q?lfGNITuo0ooOZbnyMCdQHugsI/KyvqvnLfS9CryRnXy0JXi7xJ6ZiqVWt+V3?=
 =?us-ascii?Q?lWppiI8pZ4aC5+CULQqk0/MXrddWnpq7vI/6BI8I6yiV+Mkw6kVfBgjAFp3R?=
 =?us-ascii?Q?PziBlT/9jMI+rwTBplcmIIAX/NaFQnMOPjrKxs6IUDqwlwQuseJW9ufllLRA?=
 =?us-ascii?Q?Uh3bCdCb7q2sQWHSNjfEgsbyOoYX08qn4DS8dCUwW2Q7wrOguVACpaDmdqwd?=
 =?us-ascii?Q?BOzMsLMkBBazhnZM1GAjBjk6ex6Eh17DN7ZaVmyuus1m0lC7FAwG95/J1Mi8?=
 =?us-ascii?Q?GfxvvcjmNimCisfwv0DKPReDoEMGe0OQ6TfUy/OSwvZYZ0sT9q4TIG0KJ0b4?=
 =?us-ascii?Q?p4kH9Twhu61a9zCGzBk8FOwJJ4ovCerzLC02mqvHl69tVen/BioplHpOqHD+?=
 =?us-ascii?Q?tTfSe8FWJo6Q2YuVx8vVUcF73yis/4eWOqbhUfB8UKQU/BqewupJeiUBc6ce?=
 =?us-ascii?Q?CVUman9nGp9TS8nCLqThnEE5wVsP9mb1rwILmwQ9M0LujO6LSYQVeA4UihOP?=
 =?us-ascii?Q?Jg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: g33oJO4KacoJZblY9F2CRI0sA83/p9CDRXNEWe4iMSFLkna91FiDqXIDqDYuNS0xpZS2yRZEXK8WYP7vHn9RRruQbcOlWZ8LB0m6Dg5pT2fbQiYNzzjWU3/i5LUkogshJIKyGLVe/8RvpsQ8g4JPp1uEj/6Uv6MABvVhxX8YQypwf/Xfhk2f7N39KNF0SARmj8Odcf9FmFrVnh2kmwtzJMxVOH5Tjjmx97Ww6t2TPqEERSRslPFRCLSMFLyw1FE4HXOpdn/Likzpmo0rneo1LfYPcA+56zFoESaaacUewJAhGzsWyHCGXvXgcdDh/2+Vzr5ZlZSxA2CGUWU0EWJGnyyfnmhW85gnmpSti+iOl0C6pga25esVW5uRYy9G7o1W1h3bzkAXZXrFOkkbi9/e7Ydgiaq+UjXVsZMionhZRQNdaTY5vTYFtX8murm4T0Rb3FFGb9kI8CuWacvvGwQpIM2l86LX2w7oGCdZB3pQsdarcoHC18deoiKYwqeyv+tPlUo2nMgyJmM8hBfxyMJGsXbCfPg01S7YQ7kc7wmgbqLsouFJxeFA6fkOHCYVY3nAk2s3oDLwhM96ZdYqvyO1Wg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4894ad6-fa83-4558-70dd-08dc83d0cff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 13:26:44.4755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtDqplG/n2mx9BDpu+9/FS6Lv9Yqt1v5On/dLrlHx+Nfd4mbkrrAIZAVGnSxkyQjAsz/qDUd/S6DKUZYKt73xpbATKtixniseZYP+/7EobM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0120
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCb23gj2edsJ90YOfJuLLp+2IjRSr59x3FP+YDy60r8=;
 b=ntGrx3Fl+q0xzHxgEl5gLnGgI0e8xa5pH7zNigJND6r3mqcK56A0Jl1SmmmO2CQN9Fzd/h85WNEiehvXtywISPure5s2Blx5vHymff1xhbK1PWyXm4w7yKKynmxwYykRXpXuosFgT8Yg+AujOWQ1bzTmZBoyLxzCviISXaFzzdI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=ntGrx3Fl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] need help for fixing some build problems
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I have a question about libzenoh-c package, which currently can not be build by the autobuilder for following architectures:

http://autobuild.buildroot.net/results/680f25769526e5eef43d254a10a525b165846c75/
http://autobuild.buildroot.net/results/31ed69cb2ffe8e9bc13a27c3fda16c27e9855b56/
http://autobuild.buildroot.net/results/fdc74b8a42388b51cc4197c38b552559b97cbb8c/
http://autobuild.buildroot.net/results/6e7ad53d44b417f6aa62acd8b2396720f5a14e82/

The zenoh-c help page says that "zenoh-c only have support for following targets: aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu, arm-unknown-linux-gnueabi".

What is the correct way to add a dependency to Config.in file which enables the libzenoh-c only if above targets are selected?

Thanks in advance
Alex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
