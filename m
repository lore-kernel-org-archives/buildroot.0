Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBD1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C3C41F94;
	Thu,  9 May 2024 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsQaebl7ZWmw; Thu,  9 May 2024 21:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786C341F77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786C341F77;
	Thu,  9 May 2024 21:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF78E1BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C20741E41
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwShkQCbqfhy for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:45:37 +0000 (UTC)
X-Greylist: delayed 1727 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 May 2024 21:45:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58DE941E33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58DE941E33
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=210.130.202.161;
 helo=mo-csw-fb.securemx.jp; envelope-from=nick.whitlock@eizo.com;
 receiver=<UNKNOWN> 
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp
 [210.130.202.161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58DE941E33
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:45:36 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 449LGt5b1828595;
 Fri, 10 May 2024 06:16:56 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 449LGeEI2418128;
 Fri, 10 May 2024 06:16:40 +0900
X-Iguazu-Qid: 2yAbxjwjvZ6dEGneC3
X-Iguazu-QSIG: v=2; s=0; t=1715289399; q=2yAbxjwjvZ6dEGneC3;
 m=jkaAcXyqz95FcckA7ynlhMAF9byW7ypMJR+NsH9Tfr8=
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp17011005.outbound.protection.outlook.com [40.93.73.5])
 by relay.securemx.jp (mx-mr1802) id 449LGciK2102109
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 10 May 2024 06:16:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiLFt9H7RqNg5E30aBGE60bRrCiELg1G+sEgeww54h2QDRpScf6UnVfCGZLTqsx+5NKLF2128LSWjfR40IQRMh6TjhAa6U9gdFBOzvYAPNYhVdDTxaHvoD6V99blLcGoPqgdvbHRdCa7JRYl2ITerePsp1epsSPRDM4OZYg9WOIO6QSA4tj4ux2kCpCEXG+kicL1f2lxi8JVr7uIk+nZj3pbetK8Ks1J7ApF137AOTi2CY1f7shazONitOcdk/D9bu7wvvjdWDie/J8yYKGyeyofacIciWZuM8v8bHKZyJdsFFuLzPJsjCPLL+YQJ+aOvw4M8t7jkKMNScSVXaVWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVckQtFXCDwYedgjjBnHSQP5B3JM82QfxhBGK0X1fRE=;
 b=NeC0W0Rrwaa0BXt8iX/3nt12IfDE8ie2UabUsITiM53QtcpRyDYo0e0nJ9KPqmdK7EgyE6sWDxz7vH/S3TfOL+4HsHdTTTSmjvXC/ku0pIMO7t2g9Kq3/EEQtKrUp14SqUeRz10xAdSIx/Cw+pgh2nuZMt7JeunDt9tO72sWEroGEHYYW8f40hDB4jJOMKdF0cyw8jUghmPxYuzRQTPWc0/hDtiPyuO60cR1KZcve5fHPyrsXB6s8fURmkG4Qt8c7ToUxXiT8B4KM4ED+lv/5gxr0yYgkpaPK8I4D1h0rIQtDi/WKar8F6UuXzyAQlvmDvYdWDJMnYmBBrrCSEAOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eizo.com; dmarc=pass action=none header.from=eizo.com;
 dkim=pass header.d=eizo.com; arc=none
Received: from TY2PR01MB4572.jpnprd01.prod.outlook.com (2603:1096:404:11b::14)
 by TYWPR01MB10097.jpnprd01.prod.outlook.com (2603:1096:400:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Thu, 9 May
 2024 21:16:36 +0000
Received: from TY2PR01MB4572.jpnprd01.prod.outlook.com
 ([fe80::d373:f597:c4fa:daa]) by TY2PR01MB4572.jpnprd01.prod.outlook.com
 ([fe80::d373:f597:c4fa:daa%5]) with mapi id 15.20.7544.048; Thu, 9 May 2024
 21:16:36 +0000
From: <nick.whitlock@eizo.com>
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] package/nvidia-driver: bump version to 550.78
Thread-Index: AQHaokM0E2SBS1K26U+0Ups7AzGR97GPUCoAgAAWKFA=
Date: Thu, 9 May 2024 21:16:36 +0000
Message-ID: <TY2PR01MB4572A27ADF9451486BA9889084E62@TY2PR01MB4572.jpnprd01.prod.outlook.com>
References: <20240509190028.693457-1-nick.whitlock@eizo.com>
 <20240509215156.7185ff8f@windsurf>
In-Reply-To: <20240509215156.7185ff8f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB4572:EE_|TYWPR01MB10097:EE_
x-ms-office365-filtering-correlation-id: 8e3cc58f-dbe5-41ca-e95a-08dc706d4f34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|38070700009|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SoK0Jd30Grx3sO0t4bBysVj8jHqeGA9lEsSxANXXXtnyNqmhv/ZRjqw0jzWy?=
 =?us-ascii?Q?rnp/FDDLgAtKcME6TZjvU0xLkz5g3gliXo183WqoLnekhJR4yVvz9MRU/CEl?=
 =?us-ascii?Q?qF5EDKePfwaT2to3Tlnd8FslSpGxjki8pKXo3tFc0dv/+lRFRuZ1aRBet4j+?=
 =?us-ascii?Q?3qIrNV9quaCKZVxB3vruK/7/Y1wQWSIA4mZ3u4A7rt/Q5igqOPjfs6MUEHbb?=
 =?us-ascii?Q?liWcNN6vkNM9Ti/ppILVTeFtx8JJEofnosy9Kp6ZVJBUsHCaX9+f/EvUouoD?=
 =?us-ascii?Q?btcJ+w+JfROqToWX9J37999uhjh6YgRijwhkeKarqbITADRvj/5CLsFZjtOq?=
 =?us-ascii?Q?EriHSmGNgffG+EEMkzmklW7XELt0GPdxmfAqur6zdFl4h5uJfXEKsjcm5nrc?=
 =?us-ascii?Q?11pKlkDm4dSarsn6af2zk4OVcLiu70ugP58yoTKWihp3CLOXZ1CCz/1S5eM3?=
 =?us-ascii?Q?Fdt9c9V+IfCbzMiWcKh9EWOnw/5QgF8ubdECtOnG4H2LH3pjtboRsI8RtzuC?=
 =?us-ascii?Q?CqFomDCZJ8ZefsP+6ygjWtXvcv8TmfQSsH2pws6Vak2TKrK6osWBhCb3rNVc?=
 =?us-ascii?Q?z/LA473zloCYmIFtcwBCCFFahAjkcZqySVXfYfO3M3JE3dKw7aoXk+B1Cuct?=
 =?us-ascii?Q?MDs5Y+ONAYx5mR2UN65r8eiD31FPy109mSb+XGYtd1yIyH+z9jYu/hfURUFe?=
 =?us-ascii?Q?H7/GDv/bvNialbLESj6EG+3YEfeRrsADYDSrXGJxyGye201D1C5H8Ot33Xb8?=
 =?us-ascii?Q?fp5jBYNcT76w7XcqGENBfjcAxb1tgaIDqym2/6golf3K85QHTJTjfqNWZ821?=
 =?us-ascii?Q?pSvyMofFTuhkdg6KrtE7bVcgmNTuiNZGzWpFq+aeUFZMzfOaGc6LJhE3IjZT?=
 =?us-ascii?Q?81iVqX0P+5yh3aY1ldOhc61VWcyTQfdyyyuuoVgQKjv6rY6EP1vCbYTdCj2y?=
 =?us-ascii?Q?4xBiQtQ1RwpP/4QK0bP7lh7Lkc7RhBxaILyQ5DMJ2tna+1LBhWIywfcc5cjw?=
 =?us-ascii?Q?jIgws0VxzHSlFpak6FI5txRgisFhr34fBG2p4dNOC44KuqShdsJKX3SFGxFf?=
 =?us-ascii?Q?CmO+QnutvzHlfO/x3T1+QlPddH6Susvi5mCqPS3N+WHWa4Yk3OrvIAQEgqb9?=
 =?us-ascii?Q?RoO2be5UmebU8WC2sf0qi+pNeSmCQZWYQV8EYjxlAESKszT72ydLwuAIJRNr?=
 =?us-ascii?Q?GZElMfK/nhsMcnqRAKnYVPwnX3WO6Om2nOF5aVFtddqjQfK9qX3DfsRQns0b?=
 =?us-ascii?Q?4kHUtdRZtpeRp2jUym7VuMNCLliyLAB5qO8WaNf7VshI4o/sXPAt5N5Zb9VC?=
 =?us-ascii?Q?oZBDPDqyaAhV8CIUF1XgO/wJ6P65278fKpdF7oT6x0Q0vA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB4572.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ojQk/toIEy2aCbxxDJXsBioYsUsN1Z2gVN0ZPyUQwBwhupNTGS0aYLbBVb/J?=
 =?us-ascii?Q?Zp28IygZbelWxO8oAr15Go4O1kBZvZP6lBrMCGDnACmw4zOC8PXzSPx31fey?=
 =?us-ascii?Q?22Lv7QMe/qc8ODKxKFEiaLFHu/BLbwGK7w0dfMdzR6c0bYv8ibdkULF4u1a+?=
 =?us-ascii?Q?jYc2jj5sglOoW/PRQ+lhWwSdB2/ylQDP63CCITA35YcKC2Fj/AXnBqBNFIbn?=
 =?us-ascii?Q?+wr5msp40YOFoJQb7Tj3nKjkdueE0PPcIuhYZdGOp0Q8+oYHrl7gjiHaNeN0?=
 =?us-ascii?Q?uQWJEB8+bAzjushkNa4SRxQIrHR7C3VsFz3YG0+97WowH7uFf+MEql+294DS?=
 =?us-ascii?Q?+aDvxwrKcf7EzjvE4i14Ru9VEfEMu1W7W9f5PiP+c+yE4k6o66xVJOZyu0mR?=
 =?us-ascii?Q?3W0Iy+AfKxPVsJVyVmFzFbjz2mdfX9BrzlIQ3NssdNQEySIFpAhM7g0l5Zig?=
 =?us-ascii?Q?fMjgpiJVUBeJdK/Gz3+j40bhDsyjpz3b0xC4ZD6lLHiZbywWlWXzQ/O4j0Ya?=
 =?us-ascii?Q?6c6LSgBBrxPs3tnGtXILKbbXYRZwoQtxVFT6csPY9z1dCF9UMyIjNvZ52Xph?=
 =?us-ascii?Q?myvHQVnGgs13Ileusyo+qSQZExpK0bKrNa7HbhgADbT5JC1GAxKANYB/YQqI?=
 =?us-ascii?Q?DQL4mUBMw/hII7QKrZ7V0hhvDNOWO5mpoyMTT/8ofFxAwcZ/dCqZ9uIGQf60?=
 =?us-ascii?Q?iJWDyp1pK0rboSw3PYOWxlstFfh0lfrkujlSxmikOIQylOYkM7y02oJ/78HM?=
 =?us-ascii?Q?KwJaUF0phf98jUO0umtk5CqtZ49SyNqmrZPMdWqoH35V0DdVeeTJLwYczxFd?=
 =?us-ascii?Q?4i1egcpXlOsm+49znTHnbpgdB+E1RQpMZFEDHNk6dZ2vyX1ArbDv3q/+wt+4?=
 =?us-ascii?Q?pECpv9JzJIlJvg+OVKss80XavulOyjfP0Id6/lQtf8RQvD8ygtm8NrtJguLy?=
 =?us-ascii?Q?cneHmuiko3KT8AOWWHhjvs1qJiHhQ6sTIo4AXtxiYVg/a0Tyt2l5aiR0wV00?=
 =?us-ascii?Q?Vs3CyLbku2pA/hS6iM1DXiJ7avaoaDtmpbClEnPdguUkdLtyOwqdncSpAERu?=
 =?us-ascii?Q?IFb8v12oXWcWgFDNfs18rkGI1W2/8hP09MZ37y1K0vYeCiI9CdQjco8ZJOuj?=
 =?us-ascii?Q?OZzswfL1MAqgpnhZvfwV+2bd2tmCvrB5AUapTZ4tHYWvDUzagfgevmf+oY+a?=
 =?us-ascii?Q?fzzGcLav0CvnrA7LEh2xs/8iXfEBBsBmDTYK5s7as1PsFSxcuLO8KjdA8fFR?=
 =?us-ascii?Q?ny0ooEa3fRBk/b2tiWaEQLgUw1Xw528ZL1nFHk7ToRvURCArXidyWvToomGz?=
 =?us-ascii?Q?YBOpbgMT71PNVTNU/7VM57pQ/VMHLJXpe8C2u4KrLUHlyQXb6xU5u5sguE23?=
 =?us-ascii?Q?19hJJDeZwQMyaDTi54rq7avLoqhaSnqMIr/8CqBYQUiOUERI8h3DwCpThkMK?=
 =?us-ascii?Q?O2DUyugKPkNAbTqbz3gtranchV/fpSSDzWJqRccOhUPc8/FAaPaBaHH1WFKZ?=
 =?us-ascii?Q?MTcSIfaWkWuhgKmCv39lWj20pjhxVYPSuy6kJ3nKM6Bbi5msxsytOWIYa0jY?=
 =?us-ascii?Q?J4xIWnO1HEZvlZR8MvVe2FW+tiebXpj9g9EM2vPy?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /Q/pV4iEhMJvKWJi8I3VjMDrJ5bgOiaz3yOjf2WJNFyibA595SDO8El+8K05T+nHof2/i1ZsR6WBuPLfmzkzGlNdlUQsZ6le1ILoAqYkju5AJq9CfunkDV3FemxUpD1laDB5wDPzEsbtuBFUMgwavv/D5LjUJc8kR3ySSnJDdwTWRLgWqYhfHtQlO/ccfP/OKv4erL0SCR6JWqNI/MyoKV4CmIfddwQvVGu/hth/tci4gCMuYJ/Dw6iK6Atp20xC5XuD+66G1lkIO7FLEB/CPmj4+yJvPYkgrXqePKvu6YFlXt7OMWupZFKEGqy6xkWrsFiVDMM3aUtxcXsn/9U3Au5FyRWtRKojkC2xnw560cWFOVvG2iljTjHaEB1dExcXi36e+2IkI2oAxCN4/9eJIqPAB6vInshEaYSRMcgD8dRU61gkbbgy+nEknCb7YcJS8oreo5si7UcVOZT5/ZDAbP7VPs+firnaV6n1PRewl6bmQthxpiH3XmNsAIDVIdy+BS1eitAOIFh7XYCxfKRR2n9h2JBGh6zOyVl/JX7Uy0zW354GXiNG6vtWO0z0aMGoUq89BzkcIcv3gWiYr9LS1A==
X-OriginatorOrg: eizo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4572.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3cc58f-dbe5-41ca-e95a-08dc706d4f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 21:16:36.1968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2329f911-3157-4dd1-9105-ef837241b69d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6kDShijsWcR0/gN2bSkSFQThQU+GRvE4TfiEMRVeqeWNA5HDbxLkvklZeF1TMuTwrQHqzeYwCm/vBZgBKZl3bf/BqLyOa9HmQfyHNGbSW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=eizo.com; h=From:To:CC:
 Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:MIME-Version; i=nick.whitlock@eizo.com; s=key2.smx;
 t=
 1715289400; x=1716499000; bh=hwT+LYbxYSok0+Ae9KV/vMNvH76rzYTqiXS88St/xDc=;
 b=JOD
 yo6Q5W2SGPs6X61IgJIotghS/2kou0+v4ffI0yf9Q2gFOIzqU5wEyMbYWx89xZx/Z4nAOEMkbZxRY
 8q0cYAucRkGt/tKuLlSJb3e/+gNniWXCxUhRP1tJNdExq3Ps5Wq4E4pXPjcIXcvBDKotig4j3G5Aa
 B5J3QzSAg+niNkHgiWQkSm+/6YL6siPUy1DY+FqrDEk5qEs0VLLcss59P2NlDAGgf0K2mp4qdkd7L
 JkdmSp6dI74Cf3jK9n31uaGP2SxmVobR34QGCLSFvsoLu7PQS00tMSblGhQO5MV8fkug4OXViE03E
 km+8qvVaX+KS0t1zQPbGfjT2bzWnJQw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eizo365.onmicrosoft.com; s=selector1-eizo365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVckQtFXCDwYedgjjBnHSQP5B3JM82QfxhBGK0X1fRE=;
 b=f7yVSzZrCV8dW41Fg+OBVl3/XBxzA0wOlJx835SPI4QpBvUcosRziUjJn6ZIsch6f2xklsMdARr2F6r1M6tjHmFOlpPa2BdMulxHKtII1Qs6gI88+RJiQp+yY8P9PiPZxfz4PS8VXS0oNJEbYKynxnOE8+Ri22LsGsFSDMkAP44=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=eizo.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=eizo.com
 header.i=nick.whitlock@eizo.com header.a=rsa-sha256 header.s=key2.smx
 header.b=JODyo6Q5; 
 dkim=pass (1024-bit key,
 unprotected) header.d=eizo365.onmicrosoft.com
 header.i=@eizo365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-eizo365-onmicrosoft-com header.b=f7yVSzZr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eizo.com;
Subject: Re: [Buildroot] [PATCH] package/nvidia-driver: bump version to
 550.78
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

Thanks for the feedback. Here are some comments, below:

> Kernel 6.14 ? You're ahead of your time, there's no such thing as Linux 6.14.

Apologies, I meant to write "6.1.4" here. I will amend the commit.

--

> We need your patch to have your Signed-off-by line, otherwise we unfortunately cannot apply it.

Is this mentioned somewhere in the documentation? I'm not sure how to apply this.

---

> Why does this have a depends on BR2_PACKAGE_NVIDIA_DRIVER_MODULE ? From what I can see in your patch, this option is merely installing more user-space libraries, so why do you make this depend on the driver module being enabled?

Those libraries depend on the driver module, from my understanding.

---

> A number of things are not correct:

> - You should keep the license file hashes

> - You should keep the spacing: 2 spaces between each field

Understood. I will amend the commit.

---

> - Are these hashes provided by some authoritative source upstream? If
  so, indicate where. Otherwise, keeping the locally calculated sha256
  is sufficient.

To my knowledge, I'm not sure. I computed them locally using `md5sum`, `sha1sum` and `sha256sum` and they seemed to take when I built it.

---

> This should be in the commit log, not in a comment here.

I will amend the commit.

---

> You probably need to explain in the commit log why this is all going away.

Understood. I will amend the commit. This was removed because the "legacy" method was removed and only the "new" method is active.

---

> These lines end with slashes instead of backslashes, not sure how this can work. Did you test this part?

I missed this. Thank you.




-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Thursday, May 9, 2024 3:52 PM
To: ERS Nick Whitlock <nick.whitlock@eizo.com>
Cc: buildroot@buildroot.org; Yann E. MORIN <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/nvidia-driver: bump version to 550.78

Hello Nick,

Thanks for your patch, a number of comments/questions below.

On Thu,  9 May 2024 15:00:27 -0400
Nick Whitlock <nick.whitlock@eizo.com> wrote:

> A configuration value was also added to check if the user wants to 
> install GTK integration for the NVIDIA driver.
> 
> This has been confirmed to work on kernel 6.14.

Kernel 6.14 ? You're ahead of your time, there's no such thing as Linux 6.14.

We need your patch to have your Signed-off-by line, otherwise we unfortunately cannot apply it.

> ---
>  package/nvidia-driver/Config.in          |  4 ++
>  package/nvidia-driver/nvidia-driver.hash |  8 +--
>  package/nvidia-driver/nvidia-driver.mk   | 72 +++++++++++++-----------
>  3 files changed, 47 insertions(+), 37 deletions(-)
> 
> diff --git a/package/nvidia-driver/Config.in 
> b/package/nvidia-driver/Config.in index a8617a939b..996f2f6eea 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -90,4 +90,8 @@ config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
>  	  provides Unified Memory access to the GPU and CPU memories for
>  	  CUDA programs.
>  
> +config BR2_PACKAGE_NVIDIA_DRIVER_GTK
> +	bool "GTK support"
> +	depends on BR2_PACKAGE_NVIDIA_DRIVER_MODULE

Why does this have a depends on BR2_PACKAGE_NVIDIA_DRIVER_MODULE ? From what I can see in your patch, this option is merely installing more user-space libraries, so why do you make this depend on the driver module being enabled?

> diff --git a/package/nvidia-driver/nvidia-driver.hash 
> b/package/nvidia-driver/nvidia-driver.hash
> index 620112e6c8..163a168dae 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
> -# Locally computed
> -sha256  
> 94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677db  
> NVIDIA-Linux-x86-390.151.run
> -sha256  
> 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  
> NVIDIA-Linux-x86_64-390.151-no-compat32.run
> -sha256  
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  
> LICENSE
> +# Locally computed:
> +md5 c289987ebda8e9419a73e7e8e3409244  NVIDIA-Linux-x86_64-550.78.run
> +sha1 4e33f1e9d6274fdef630a3a1b903901c09149e40  
> +NVIDIA-Linux-x86_64-550.78.run
> +sha256 
> +34070434527ec9d575483e7f11ca078e467e73f6defc54366ecfbdcfe4a3bf73 
> +NVIDIA-Linux-x86_64-550.78.run

A number of things are not correct:

- You should keep the license file hashes

- You should keep the spacing: 2 spaces between each field

- Are these hashes provided by some authoritative source upstream? If
  so, indicate where. Otherwise, keeping the locally calculated sha256
  is sufficient.

> -NVIDIA_DRIVER_VERSION = 390.151
> -NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64) -NVIDIA_DRIVER_SITE = 
> http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(
> NVIDIA_DRIVER_VERSION) -NVIDIA_DRIVER_SOURCE = 
> NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if 
> $(BR2_x86_64),-no-compat32).run
> +# NVIDIA drivers now are bundled 64-bit and 32-bit together in one .run file.

This should be in the commit log, not in a comment here.

> +NVIDIA_DRIVER_VERSION = 550.78
> +NVIDIA_DRIVER_SITE = 
> +http://download.nvidia.com/XFree86/Linux-x86_64/$(NVIDIA_DRIVER_VERSI
> +ON) NVIDIA_DRIVER_SOURCE = 
> +NVIDIA-Linux-x86_64-$(NVIDIA_DRIVER_VERSION).run
>  NVIDIA_DRIVER_LICENSE = NVIDIA Software License  
> NVIDIA_DRIVER_LICENSE_FILES = LICENSE  NVIDIA_DRIVER_REDISTRIBUTE = NO 
> @@ -23,30 +23,15 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
>  NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext  
> NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
>  
> -# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; 
> it -# has been replaced with libGL.so.1.0.0. Installing both is 
> technically -# possible, but great care must be taken to ensure they 
> do not conflict, -# so that EGL still works. The legacy library 
> exposes an NVidia-specific -# API, so it should not be needed, except 
> for legacy, binary-only -# applications (in other words: we don't care).
> -#
> -# libGL.so.1.0.0 is the new vendor-neutral library, aimed at 
> replacing -# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The 
> latter contains -# NVidia extensions (which is deemed bad now), while 
> the former follows -# the newly-introduced vendor-neutral "dispatching" API/ABI:
> -#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
> -# However, this is not very useful to us, as we don't support 
> multiple -# GL providers at the same time on the system, which this 
> proposal is -# aimed at supporting.
> -#
> -# So we only install the legacy library for now.

You probably need to explain in the commit log why this is all going away.


>  NVIDIA_DRIVER_LIBS += \
>  	$(NVIDIA_DRIVER_LIBS_GL) \
> @@ -87,13 +77,26 @@ endef
>  # wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
> -	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
> -	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
> +	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION) /
> +	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) /
> +	libnvidia-ngx.so.$(NVIDIA_DRIVER_VERSION) /
> +	libnvidia-opticalflow.so.$(NVIDIA_DRIVER_VERSION) /

These lines end with slashes instead of backslashes, not sure how this can work. Did you test this part?

Could you fix those different issues, and send a v2 of this patch?

Thanks a lot!

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
