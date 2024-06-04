Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C79C25B7E
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 07:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14C7640342;
	Tue,  4 Jun 2024 07:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VT1N9QYdgQfm; Tue,  4 Jun 2024 07:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD474049C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AD474049C;
	Tue,  4 Jun 2024 07:43:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56DEE1BF2CB
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 07:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F1AB404CB
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 07:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGFJn0duvKIE for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 07:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E009440491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E009440491
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E009440491
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 07:43:17 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 04 Jun 2024 09:43:14 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 36ADEB5ACC
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 09:43:14 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id C5D7CB5AC9
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 09:43:03 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Tue, 4 Jun
 2024 09:43:03 +0200
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.51) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Tue, 4 Jun 2024 09:43:03 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C69yHxFs/2XmfQtCHdgRbI6twNKxsn3HTu8lRctTMFiE3X+4UyJkt+gCAdGMDfuxlfvhVVGAxuypwCI9+8BK2P1wElDOqD75arXlJGOQLR9zl5Z8E9sSDNwusBr3oW1OTuG20GnpwkZtdTawUEwwamvyxBX5zlJAG3vYo1S+UXHu7eapF/PVxf9LbuiwK2a2YIvdbov6si+LnyrWq4fykgFaOo1bw+5aq55mcNzjCtYQs5i5+8VwTXYdps1jw8mj5EMyCv4EeerAsGBAbC/XvbOP/+aZOwgro7S+e/IUGebvVRVPH1IXDooAkPdc6v3L3tAuw8Ccq19ew8bYoCAAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5NWw4Y3VjOpSLI5f6FAGH8+dUaZI+iy/kyB8b1GorU=;
 b=exWYT7wKDry3W+f8fj51zkDjDL4FYmGja6LhDAz3ZlaULwA3rxb2UT3bpXX3svtfTy+d7fUISl4st4CdHGkWMG+VWdP1EDnaPK0gyM9rDsY6d8HkWGEDV6tkrGw/2cAOcTqip9JG9eyAk+K0TJrB7/cqL88SRCaJCFTyT1MKPPztvTDt7XipDR+a+N/399OV7Pd1UG+aMm4o4HV3qxOESfANRu9pKTCBI2IdauW0efdV3VdfWJteuiJKfQIzlFAbHyNbTSe6XQN+Ebmii6ETuOI+i761GWx1nxrSqn1+B+28FAUBSNlMiaIOQl5PVIP7DzAzEsl5CGhFTUQqnWzpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU0P250MB0604.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:32a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Tue, 4 Jun
 2024 07:43:00 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7611.025; Tue, 4 Jun 2024
 07:43:00 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/libzenoh-c: add GLIBC and aarch64, x86_64 and arm
 dependencies
Thread-Index: Adq2UptJLBqUnLSoT7KWCOW8QtAuXQ==
Date: Tue, 4 Jun 2024 07:43:00 +0000
Message-ID: <AS1P250MB060843CF993EF8CB658A1142A9F82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU0P250MB0604:EE_
x-ms-office365-filtering-correlation-id: 0709f309-1dc3-47a8-3191-08dc8469f543
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?4skiPJ9Ddz/YaURIywwnhutlIAU0ooMeFCwuASJpP3uvNEFzMmD60F7yv7gz?=
 =?us-ascii?Q?Ekp0es1eaCHHclZd9zOvY/fhOfNll8Zl5oqSWhvZBSLLUw804ePDNT9G23y1?=
 =?us-ascii?Q?lRbrPJw2BwQ013hGvQp2QDh54jma5gyt6QI9241YDHZSY3ggsl/E981GAsrq?=
 =?us-ascii?Q?QmceJxP5pLC8WJ6VKRdJcBsq8otwUuVJtvMCG/APhiPFZeatXy7PdEP6xmU0?=
 =?us-ascii?Q?Ulexr3GM50n13NexmobN9w0HOqSLIgkwZf+PBEszI8LpS1xKN3ajRWo1DNBI?=
 =?us-ascii?Q?ynBWpz6UuZD0XGONSLnAJy4aOpbBCNIAkjRJj5mHIdLHU59PYQuj40VZoSqB?=
 =?us-ascii?Q?cu51IJ7DlpbS1/VSsk883jqPW7pZu7yedBEP6WNG0iz3lxgvkAMWDkyMYgSb?=
 =?us-ascii?Q?K1ekwHAJ8jMo8sKZJUF27DiWaXzDDPgnKK8bQ6+PsuC0vwL0YtsiFii+g3Gt?=
 =?us-ascii?Q?pycGmcrEZdPXWuZnlCBR7nMo10nIcwi6U+QAMswnhaLYTbyp2OS6hCnxAjkH?=
 =?us-ascii?Q?hFh/9F+bDcRmij0Fg8MXF9tQA7Hr4ZN7/gj134sopjVSUXmUvTCNqODd8WS3?=
 =?us-ascii?Q?m4193RPHjKuklTe1Ppi4bZ3t6s4+2aUITS6UaewehfMaSGi1LueD7hur7r5/?=
 =?us-ascii?Q?naLHOBW4scZ+LIlFBUCiDbR4KBZG6OrqFWveRjaK85C9vN0K3B78X6m0PGAH?=
 =?us-ascii?Q?Gg5cs0donBVmf66wa6Tmi4r1rJPmTzMlxzD0gekeuzLfXa92SZggbJUqRBJU?=
 =?us-ascii?Q?//50Nq7naQV1Mw9nwjnlykW9zgAWjFjZ0+2dWZQEGbPmtYwD/wfcdFscAxre?=
 =?us-ascii?Q?ScOWQCEKzBUn4R2/4tcUsTMs8a9GEIc4I+9qIq1NbeyZZAnJ37kkQOfRFMLa?=
 =?us-ascii?Q?g4IdIFHOiMnnb2F5/WqMyOavLjZXk4UkHquu2UwhQ88Po3jNSL745fAgJqMk?=
 =?us-ascii?Q?hrVT9jLJ+4qdHjB2BVOO1Jo2aH8RWBwV/Sq2LOR9jX/6rLRqPo7qwRMHPtvs?=
 =?us-ascii?Q?GBJujexUBzxYRjKvxUZ83J4xRMXvWRLdKoov8okxQZqWy1+R1YVDPoNIpQdQ?=
 =?us-ascii?Q?t4dh/UiTGxUqe+nWabEaIkSZezGkhyip9sHAPFMP4XMPxtJXw1nktNt0M1yW?=
 =?us-ascii?Q?gUjtVIpRBZJTpYk/Fr/Xv/EM6qC8wDn8VE3Xm4y+ljj62Hi0+OxD+QENVBcP?=
 =?us-ascii?Q?d6fN36ajAnTfWl7YjxBdTSudD7oA9yKZmTJn0ptOcTMgtWIt7B5QK6Xb1JLz?=
 =?us-ascii?Q?78OeflfSGVkIxcj3p0ukZoYVsGKSCdFpyH507vdoETEZJZykhtvJWUAwp2WC?=
 =?us-ascii?Q?3vSvA7YyLLB2Sm4hHKQANfQW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n3b95aTrDR9faWn/KuOwRtnoP1kh/N5MiUi1n5Une1qknH+iMKwh+6K6BVhZ?=
 =?us-ascii?Q?RyPP883NMGUG2KkHLS5hZ/Pjv9o98VOqauNESK0xRbyZrj2KNG6lkBlRlT+o?=
 =?us-ascii?Q?cxZZsMp86tGlVj8aafVmqeyVXBRfKGH33JKh2n3XP7oxERcRH5qosUiJLZnm?=
 =?us-ascii?Q?/0ZyDiXDPsuMhydPPcfO6+iaFebT0RVwBKz173OHs2klmXwYXEVgF+W50DbZ?=
 =?us-ascii?Q?vtrSXNFyD4yyvqhZstfHjU1p6AzJsIU06U7ysKDWnQVMK76PitISg7fbyVVm?=
 =?us-ascii?Q?IHMWkbYH9rzFBIUI9c+vPvv0StcPQKqaPakYemuH2VWgWTkCgPhDjsru5mZm?=
 =?us-ascii?Q?iwixMvwf+elb4hz8664Nb6U5nm8s447hs6hXH8J/q9iqbLcMBHiE5m5uc5vw?=
 =?us-ascii?Q?Dn5x8VBLZM+tjHULSNDRct/RZrL6uCl1YNqkCTJ6vGeMAx125Bl4AdUWSRVo?=
 =?us-ascii?Q?kq52E53AJDrgU5wa/bzBB1/HvTEbllY/Wxd12gPflM+NpC9Q2rFGRAsz4Pmd?=
 =?us-ascii?Q?8qy2zEHIOIM00U2auIQJF6ZmsQLLrLWveGcXr27h9TMObR2qn+B136/mASTe?=
 =?us-ascii?Q?jvK/jlqpa7VDy+bBBzWms9hnVOkiyuI3BvnwuClGwqyPUT8LiNk5K2CfhJzC?=
 =?us-ascii?Q?FKwJUb4hW55sSd+RN1x2pkpMjXsqGlXSnAQVJkNKy42WxgBVKzMeagBuvEND?=
 =?us-ascii?Q?QxSZaJqNz3kWAuE+xyM5xBpqaNPxr9I1/gESWd8h5/gOrZ7futy/ZaD0YcSw?=
 =?us-ascii?Q?PBY1Y1RlKMRsotCH5xVXJPfp1eyjFysu3BlnZdBkJ+/8BBDRj6baGccoBeh5?=
 =?us-ascii?Q?Ozg0TMt81g13zBI9ZvCV1vYbJ4/PIy5D7wBgVAdcELXUpj4mFub+tMYsAOkX?=
 =?us-ascii?Q?ePyB3z9ZO8A7FzZ7cmFBQ5N8sJ+9MM5fly76c5xa2VSbTjF8j5GvrA/Q0EHJ?=
 =?us-ascii?Q?p/ZH4IhzCgTedphzqShDBBqOhXmfWfQqxcaixZqL+uHM+dgb/wNsWDLlkfbA?=
 =?us-ascii?Q?4pkq0lowRx9q11biSpF5Ld3MGKm1BfT63Gei3YN8sTBP7wli5CN5RGMMoFV9?=
 =?us-ascii?Q?rXdt8JXR7wKHOfLdyh0bOtzV2l5ZcQ3PgwqDgRd2EmWSTVwEK06A9fLePsz1?=
 =?us-ascii?Q?q+ruyQiVxjuk4hvrpd5IYFCJJc1GscRsG+O+vHrTIWHxjzUj4JRd8k1WT/1y?=
 =?us-ascii?Q?k8QmzF2PXqSHhXodsGtsWnoFmLFgBqlgQMt5e+6iAyYCOddjq35yAZlf0bNT?=
 =?us-ascii?Q?KxNyq64NtGFTCKUDE6LSs+44eVP9x4xGQKe8ReuYwDL6TvoTgSsIpe64GAZc?=
 =?us-ascii?Q?6dRuDCuQLRyASUe1f9T0015m/8abgnpk/k7VAeszBe6o4rmluL0o7Y1CiLR8?=
 =?us-ascii?Q?p7BKhRIuwzih8dUx/tXN8rdlDGhaLVCV+J9+CeB17aQylRhZ77lW1xdUlrRi?=
 =?us-ascii?Q?96wrrQK9P53nwnyKZMov4duIE/D4RN66K1Gg0TXBv+XSyxOC9yZrwvvACdio?=
 =?us-ascii?Q?jHtNrTUVH1qgRJT1JYweFB/ysjj71tuBCLObdk7yBWP5u8pKm9sG6VbNbTB2?=
 =?us-ascii?Q?AQf/4hnN+FcyNDXSank3rzi4Q50WbjDMnJWIoM6TDDtp316Yc69QN0VD09B2?=
 =?us-ascii?Q?Hw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M33Qaknl/WGhv50z7n9CnOXnhBmCVYKZujWVNox8xg1S+4Rto2XbaiZqQOH62MbTw8UoSP7jc+VEiSARQz4z69zgoOzJEQ85v+OeloHNBmGLv5Ihd3aEXeGZIEwTzNqpx2K+F6sqxW2Q5uA2ntmBRfpvHDC1WilUiIlTLxBsyBo8Vq8DwlfWkMS5m3Y6m2mtIilA62SGB/nXFMSbekCEKs6wR7RGBhDyv4L5HCLNeduvE6H+DWc1ElQC+CNGWyxT2QzIAnMqtz0zlGywzAVgJajNB6tcRmDbI/GIm58SEIivjd2oL9AsSPNqeXCSbWl3Izo6iw69dYzR1HGckB3SFri3R/jVyqWPzhtFKqQfsVhMxryMqaMjMFatpl0bzge1ay01VYriDCxTGLw7muqxnbn1scHqGoa/RUjYEVhKctsl4jz2XeI7dHxB+bgKOLBKNUIH/jo9MRKs801UFRwZriR8tOSB3zZgHqCIbvswF81l1bYI0osB5k9xILjqApSYo1GzMTm8MLLs7jlkm+EVYAIx3TwjupKqliJB5nukgz7nIVWNJnu6rMKZPp4sK6rzzQuZPwmTT/PVI5TB0BQKrA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0709f309-1dc3-47a8-3191-08dc8469f543
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 07:43:00.0914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myZl6bi8Ypk8eH6G+7HFmt2cLGcjGZPyaZuhku4Z/Q9NqsUxgFG6X7H1UBv7LLlVNNcjKkto3JikJ5yFTlrVqK/8ue6tuikj60TPkGg+7Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P250MB0604
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5NWw4Y3VjOpSLI5f6FAGH8+dUaZI+iy/kyB8b1GorU=;
 b=l+h9xtk4iyGB4phe//qtCIM+ibVuxkdr46q3bfjSKgY2VPFDK7EakSNVC9pmyIVOkHYDNsPr+3leRZ7NWrSBrKOOunZZhKxYf5iKqaYN21sf+aE7//olNHPJ2AY70fh/TliOPYcQFu4oM2cZYwbIrq3ei/WkpIErgdQL+fUsAHg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=l+h9xtk4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH] package/libzenoh-c: add GLIBC and aarch64,
 x86_64 and arm dependencies
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

The manual of zenoh-c says that:

zenoh-c only have support for following targets:
aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu, arm-unknown-linux-gnueabi

This patch provides a blind option BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS,
which is default y for above architectures. Additionally adds a dependency on
GLIBC because one of the autobuilders had a problem with MUSL. Moved also the
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS from package's dependency
list to the BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS option.

Fixes:
http://autobuild.buildroot.net/results/680f25769526e5eef43d254a10a525b165846c75
http://autobuild.buildroot.net/results/31ed69cb2ffe8e9bc13a27c3fda16c27e9855b56
http://autobuild.buildroot.net/results/fdc74b8a42388b51cc4197c38b552559b97cbb8c
http://autobuild.buildroot.net/results/6e7ad53d44b417f6aa62acd8b2396720f5a14e82
http://autobuild.buildroot.net/results/c85927b1dd25a84981adc5cc537eb07d02da40bc
http://autobuild.buildroot.net/results/5389ac0174791b3d899fda7769b4f0f2dfeb805b
http://autobuild.buildroot.net/results/285bd8f5aa338dbaf9ac0e5f78593b10bd54cbb5

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/Config.in | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
index d22807c047..06e56c0879 100644
--- a/package/libzenoh-c/Config.in
+++ b/package/libzenoh-c/Config.in
@@ -1,6 +1,17 @@
+config BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+
+comment "libzenoh-c needs a glibc toolchain and supports only aarch64, x86_64 and arm architectures"
+	depends on !BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+
 config BR2_PACKAGE_LIBZENOH_C
 	bool "libzenoh-c"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  This package provides a C binding based on the main
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
