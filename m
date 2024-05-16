Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6CDC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 06:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F9040572;
	Thu, 16 May 2024 06:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIonjGuCrl_I; Thu, 16 May 2024 06:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A750404D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A750404D9;
	Thu, 16 May 2024 06:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE9EB1BF85D
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 06:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B9194044B
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 06:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQ9kbZFzL38b for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 06:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92A1B401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A1B401CA
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92A1B401CA
 for <buildroot@buildroot.org>; Thu, 16 May 2024 06:49:14 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 16 May 2024 08:49:10 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id CC561B5ABD
 for <buildroot@buildroot.org>; Thu, 16 May 2024 08:49:10 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id AA5E0B5ABC
 for <buildroot@buildroot.org>; Thu, 16 May 2024 08:48:58 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 16 May
 2024 08:48:58 +0200
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.105)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 16 May 2024 08:48:58 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAWPYBf9QJlZCegYKUDwZsBli+FwMz0ky/vS2fSl7bHebMdNWBIRWRQhOfINzegt3Pab+3ks6/RSzeS4/GxqcE7ZqpGs13MR3sHRf1ClHqTXridLQA9h9uic68KKqoePqETUgL2HoiFzlc74Mkmj6NaCYCc1uFxAouZmYa39endoqUOpTYXm+Fk2enQBA+pTxLAPD+hrOjqRiKJdUSHHmOuH4Cmt2B8edTN8y6XOdxOjHV75eTFtjNg8B5HHTW83s9tY8OabEpOnjL05tAbbIsXKsBLqAbPvQ6DQKAUaVtyCkxZfDS0eNglzed52n9p7toHIBDyESb0KSmjYXs4iWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N96ZLWCCHkTpcpqiq/ppEwaUbboBUCkmZ3agExTPo5s=;
 b=lOS1i0jFsaae24r4qh91R3k6ypTzyWis60jBYhEZMCrKims0t7kKEPKm56/G73QwNF3LlCL+LwS8VKhRmw9/Utqs4Ovj4a34vLKqueNFAE8JbBnd60xaemmdHqQogJKQ46R0HHcNErDYgUwiQFfieI95RbzY1pM3VZE5uka1DS1Pf3mwm7Vr5ekF9U/pL0nkBojQEnZtcBTymFCVi9Snx2LiX8l+SuGLndlzhHBAP9cFCrXo7w2z+lz9wPfkJgKLPSpOrdTM2RiSasYP3/NAaz31EomPTKGiqK0gyz0yxmylVru8v5kuoU6jF4v5/+Nh4YMr5oHqqUVrQGcq9X+eSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0259.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 06:48:53 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 06:48:51 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: package/libzenoh-c: bump to version 0.11.0.3
Thread-Index: AdqnXP80Hel7nVFAQpCDRWvM+ev9HQ==
Date: Thu, 16 May 2024 06:48:51 +0000
Message-ID: <AS1P250MB0608001828FCC65E7AF713E5A9ED2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0259:EE_
x-ms-office365-filtering-correlation-id: a08d812e-f6e5-4364-fc0f-08dc75743f49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?sWBnpFQESXfEgIYu5j7mfa9iw5kZBt8NOTd+A2ucU8Es09PWKIK//EtoLxF4?=
 =?us-ascii?Q?+1KUc8/Z43l0l6XGjoR/jqfTZfw8MZ4SXwQsZyzxw2V+ubSzEcoKhUZuu0H5?=
 =?us-ascii?Q?lxzhCag+px2IbAQPgQi1PP5J+7KQlBFjsBScALlkdCTkGGnDyrhCE0LN3wf3?=
 =?us-ascii?Q?Q6Ka8TgB6EXLeikOSCgJY9TnsflkE+QN9SowE7TfdcpMjVqxKJra9bZP+L1d?=
 =?us-ascii?Q?Vkixy02DUCQ27tVnJBLkccqPpm8w9nCbGCrfSizTKaE/+LuItWhH2MZhdB0+?=
 =?us-ascii?Q?IPZnRg565kg7hnQXNdIWfJvYrkBWm5YgVJPmT+xjVxeSv0Rmy2IwUUqYNjjb?=
 =?us-ascii?Q?XC0au83AR9LwHAqujwArl5af64ukwjIwyzOtarWIYtmvmgxgItTPwU0TKRDW?=
 =?us-ascii?Q?Agt4d1o6u+eWihYIj/ocbihpIOCSRRjPV1nk+VVUEA5p28Illrn1xw44bJhh?=
 =?us-ascii?Q?vTqp9M/5btUdCifTGTMVQoJbXwZaAgThCM5OkwAvinu3WjVzLJiqdEZThujw?=
 =?us-ascii?Q?+dd7GJlRiL3X32o34wfqljxLJY/nOkjeCLHov+kYpTFpSUIit0hRKra5NIMX?=
 =?us-ascii?Q?AsOTvpfyoLHFTWWW9TG/Ms8Ku0xLHwXrZoMRk96YwMbajLk9OudoZDZ07MiY?=
 =?us-ascii?Q?M2XsCSVti2RR8gKN74EGBMPqayxRETY9pHagOsy2syfLOGF7QwkVNPROR8aX?=
 =?us-ascii?Q?KpxSP3V4c9JKa7Ryga26YfrmEn4e+/J4FVW3maXNBuRGmnh9GpxNxgyoWBkp?=
 =?us-ascii?Q?zWYW4SAhv9TMTWLOKSEywZwJygrzLQs6XyzaNcQUbDnaSRe07vkL1nWhPGFf?=
 =?us-ascii?Q?xxMP3dRrKR9ATsKl4GBkJkUAwzUiZkip1SNrZjoB3zwJdAcRnT4dUEppn8mQ?=
 =?us-ascii?Q?PMdjJJMcHyLjMisuIoL2E4MX8nQ2PiJ6JKctawj/lKy0LWp/qzrOp8cZMxqM?=
 =?us-ascii?Q?lNAPdBdH5rC65N7hTEqbmPIf35oAsxuwSYy0aEomlJ+/iDTS/z24dvj5uTf1?=
 =?us-ascii?Q?S3dkiU9FTwXhv4c7dqMsGJZP/924jfvjMYJIXoynnIxqoI6iJmSx/oPVX5aC?=
 =?us-ascii?Q?tDCijVI3IfrqhPukn3EIta8MwaoEHo+LsCgQu5VGyEqzwTf9W2naZH4edjR0?=
 =?us-ascii?Q?b4sBnc3COc3MLduxDaHk1YsRFqn7BnRZoTD8s+WgFK5scpZg+yqnf5sLpNL7?=
 =?us-ascii?Q?lsqw++ceWiJQKO2KCoaF2VrH5XJ4SW4aJ9repxUEovL9oc/ksvbzlP4AHqqn?=
 =?us-ascii?Q?XZIgWTKyc86xSZX4WVSOrq2ESYiFon9TEbWDtpuJvw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UAPxBHGGQG4NcShCO4PQsePM+5wVcfOpTHnyBMiCjXIJqqADYooswaxQ4vuU?=
 =?us-ascii?Q?+1AwknGdpTfcKqJHXkfP8mVwieBtbJzHUQnbv1gCqSB3Jqp3jcWbSRUD8kj2?=
 =?us-ascii?Q?ELikYMi0Sy3QBfmAODIduq5FIKm6DabltLzQNa2DfVbxgV/Er2cfm7xHfgIM?=
 =?us-ascii?Q?zhwqhwYgrrDKb33oAUW+UOUG8qa5GB54bcecWoUUK6lM7xUDpW4geRs9pyst?=
 =?us-ascii?Q?YjKkb10Rw0c1dtomSewUN3V2TNJXtxDVcOp3sROfCTvwAr2Bp8Jd7b7z7vGJ?=
 =?us-ascii?Q?NnEQM31yWCQq4Bngchh6iL5kFw7TF2Upi1RUxS7A9t0+KuUh1s7EU4YXYe0v?=
 =?us-ascii?Q?DduTK8tNZ0iqJrLfN+wztZkQbGUJtzNmP45GjTXfA52tp89EhnrJctOHI1B3?=
 =?us-ascii?Q?7ZRfUmrA8r4f5BZtiMPNajdevx4X7f5RKfQUAqWM60NJVAyxU0TnD35B32wS?=
 =?us-ascii?Q?qua3wPJKLrKipJfg2fh2kIUIfDTqrU5cle44H+cL/TKcXD7ahsAMH4BmfXmh?=
 =?us-ascii?Q?6snKVlBDByI8fLUl0C57VljCmAu3wTxynf5Bmck3bwNeYRIrTx41hveGHCZh?=
 =?us-ascii?Q?R+bbwwiPhm6ojGytl0yQ0url5C3xfB85ysTjTSYAX0a+y0B+hPT5xADaydgW?=
 =?us-ascii?Q?XrxZvYCkFUDNVKV/2g8Sl7d8t1AG4hSeOSostX78D6gMxTjCp32DoyJGo2fc?=
 =?us-ascii?Q?7knJZ8xVYA4P+w28RZAPuKevAszcAKMxwSoDUb8+jiZaA4J0kPASMUSLndiZ?=
 =?us-ascii?Q?Wx9+/XXfoKfnwefvGNyTrpXS1h8th9LJXs+n9yvTBNv2EJT9F6spdK5v5UH4?=
 =?us-ascii?Q?XCxJ6LC5dUm4FWGE/5l9HUOwyWzZWCOh6N9w6MGSJ8kZhstNityXSJr/NBvM?=
 =?us-ascii?Q?adsWHgJxruzYBkfDv0cbeI7CPFiIw2V4nTOJmkr6PwpNodzDeYOSXopbl7S0?=
 =?us-ascii?Q?ge1l+phK3ts1MEZPuQioFxr8jSdKsnCSbW2vhuZcsDCP78G0+g0Nj+GeOi3T?=
 =?us-ascii?Q?rLEHPrg8468TH3lh/TwDzQFA7R/Ab3uEv/O3kDJ8OL4568F/ELAcGE0gc8j1?=
 =?us-ascii?Q?jPnHrEq/xVV9HYUTp2G2ouCilJobzLel7QfvI0tEtcyXPL1hrhbW5Y6kjwNk?=
 =?us-ascii?Q?WsU+RCCmaQiwMPhMcI6NNaiAnPXSQFUUZE7Cd+yiWUaZaEqQqEAX0HBdKb4d?=
 =?us-ascii?Q?PiMr7MCvs/a8wsbu211Bx3iTM0O/x9JfwxZW5VsDHELBeeY4xO3hkRglRaRK?=
 =?us-ascii?Q?kqQp4osmbaq6RVs2yMg1Y8wrPRtRIsxvfBfM0WgNIvs8poWw03hkNEeR//wk?=
 =?us-ascii?Q?z/AD4vh5A4nAXnKp1PHfVr/4uZutazlY18R1XjHL5QdIlrF4/xHeeI9I9+ze?=
 =?us-ascii?Q?x9fjVZXqcdxaGXFxf1rFhXE18rMcSso4m4qsGI8m6ib2p7jpIxIKzSO4UJrb?=
 =?us-ascii?Q?/3OxCWAPIg2MJufbjpJCxkS6o1pOHttJKiScdQriu0/7SUVjK39XrYW9XDRv?=
 =?us-ascii?Q?BwBujhbIFjd3dqKn/notqiBsfvvC1laXAsSdzmJJtM3sD3AnUPd/ca6dPl3K?=
 =?us-ascii?Q?P5TDGUIAXzcQzUqfZvG5UrutjhnNpKwxmJS1hgyR9xrkfb6Ot3WJnlcmw80Q?=
 =?us-ascii?Q?nA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kpMcDQoEVd5G9SbV2BjV8NYGYJX7bC21lB/IVGa1mnPZRTjY87JjU91LPUJBQllIZrpDCoN1cp30gcGh9vVLRcp31Px9XDfgQ/NunWLFZi6GLlWI2viTkqKH2y+pSq8n/R0ry4U8wIdRWyNlAutdZhC1A5FYPNAL6LWIf3jHNDKfdJni/p2o75Egqjoa9D+bH9mKrLEiL7Ws5LUDn0rTzryI6iXDEuAppy8ttMX99gKoheVIr1ys8PI/y+QOF57KFL9WF4AMMml62gRvqEAxKrU8FpNPE1V0Y7Lq5r9KNh4q9jR1i/MS7nr7fl5VTfrpXgVQtmfLR3vrL2nKi5XmCdNw5t3HYs/5BP/otMpL9hNW2JS0o1C+oY8axUTkBAPhwEWKPjbRit10gxmFis0Lm8PrTR20lFYp3Im2uG9ddaCg+yKuxxX2dQQlRuxBTsm6m+YiesoWWiQw12PMKqTav/FZP62fqowcd80NNPE4Ro9B0ufD+5Yn58KYBRIwLbvXRuOzyFuxgkWtmuEKHtXX5yQNApTM516WPaFwOdJxL24OfTQZq9d9VtdrkG4MoRrI4K6doYG7ywk+10JmSQjwZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a08d812e-f6e5-4364-fc0f-08dc75743f49
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 06:48:51.7896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RREs/7hxa8IfZEoLLNtRthkyQBu+kejgomVrx/+zLRP47Hg7cyLTbFaUEx/7Zf0xF05rQg0rZbyAVAxsEeAnibMQVeCl0i2Ad4/e9cFbS2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0259
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N96ZLWCCHkTpcpqiq/ppEwaUbboBUCkmZ3agExTPo5s=;
 b=KHmSYXFgPvbLKT13rccIkbGy1jxFEELPaLWMTWCnTP+PIDNGxWjkynPWB8IgK4AVYK+SRhkGRH1lJlDT1YKQSxqx+HlZa14oV1g2NHf5OYH1ZHv4MrpFsX/EKNzydykyENDJsZRYPCIcJRylHhWQ2hJAhFYMXj7Q8CeE7Ke6SrI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=KHmSYXFg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] package/libzenoh-c: bump to version 0.11.0.3
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

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/0.11.0.3

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 8331f5cca4..852e785ead 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c792f0be936ecbb3f759124be28950a01385f4680eaf4f1da55997640899648e  libzenoh-c-0.11.0.2-cargo2.tar.gz
+sha256  03ff32bfd11e39a1634d5abe0e69599ec988c63115682a17a5e7d021f3c1e9e8  libzenoh-c-0.11.0.3.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index 3a50fe6bf1..07c153e328 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 0.11.0.2
+LIBZENOH_C_VERSION = 0.11.0.3
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
