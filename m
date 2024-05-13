Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CDFC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 12:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4244B606AA;
	Mon, 13 May 2024 12:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAyAf6SaKi1I; Mon, 13 May 2024 12:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4846B608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4846B608FB;
	Mon, 13 May 2024 12:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA1A01BF35B
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 12:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6A864114E
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 12:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JW5fUCkRu0dn for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 12:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0515940C7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0515940C7D
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0515940C7D
 for <buildroot@buildroot.org>; Mon, 13 May 2024 12:42:56 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 13 May 2024 14:42:54 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id C1D40B5ABD
 for <buildroot@buildroot.org>; Mon, 13 May 2024 14:42:54 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 7FFC2B5ABC
 for <buildroot@buildroot.org>; Mon, 13 May 2024 14:42:54 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 13 May
 2024 14:42:54 +0200
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.169)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Mon, 13 May 2024 14:42:54 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b51W6BnKnI3OnS3VM0VpKsPbv9WxETrYGL+BrwbVIfWkBFbv7ZGFj3VGwY5xkukcVzsT7VpIWF9ooYw5o9bBxMYUZ/DKbqfneugwOYHD/h6kGDQZHoH9TTDRfMmdFuA/TRjnwMpZvhz7Hg112EwfbbZuTWxeij9JLjPO/ELw9V6V1+8GELK7LMDWyPHXMcEr/XV50xbuCRbtr6TgdVbdMEmTDH0GUbZryN4F8MCwhAM1AgnCguKvUC9WN3TLYIwU//K9xRoAOSG/R80kFgy5/I0ywTsXDuDgLHwcYrU56JbWahYzb5tlRCa1v9mcRFIf8yeTfsvOxib6EfBEElkc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXbRKxSjQKVH+GFdrJ9ZTW+BuNxJn46y+ZtGPUnvA2A=;
 b=AKLBiaI2OsTJXL8Zs3VORF95W16lXukSwIgLh1cz/a3omAlmhergwDWLY7cpFxzgLm/S6qQPTyF3ELPcgXTa/yAG1mny8ChzDL47LZOGyxDLN6V3OOHX2ibVZ5BDrrM7bXbwk7GN8sPs/zvQnDBrx7AYuJupm3IrJV2IL0d6krWlczc93JzX2kP47Gn6ORAyT5KOcOS45c9VYy2NZDh/w3HKp1pCtVbcVFiR0/mEDnchqJxHJf0eINUX1F907PkDcbU0Mp0mbc1TyxXobUXpQ4NZMlbuZoTIhv1g2FZnio7XKoOq32gSIpqpsMUhMske3YXYP5iTYA75tfVdSILLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AM8P250MB0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:3da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 12:42:52 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 12:42:52 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/network-manager-openvpn: bump to version
 1.11.0
Thread-Index: AdqlMvGSxQZ3LlriQV2u0+Oo5wYl2g==
Date: Mon, 13 May 2024 12:42:52 +0000
Message-ID: <AS1P250MB06088D7843BC7CD2E15833E0A9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AM8P250MB0011:EE_
x-ms-office365-filtering-correlation-id: 2f28abc1-b6ef-49ab-01ec-08dc734a3493
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?sMOZMnfpxDTsZXdY9rXkt0uLp1BenBrmkUkKw02kGPu5c54pDNxg4ZJpOf5g?=
 =?us-ascii?Q?PhZ76aA4xmMxYKEW3WUXSniXpUvhAxN+Xd1HOCvjkBSEaOBBs+arp5WWz1SX?=
 =?us-ascii?Q?OZ4Y0D9D4UV1Fgr++zBQUEwtGt+KIwGPWX3CRZXiXRODn6bQf3EnRxhQLiAS?=
 =?us-ascii?Q?rMpqxPHuFk+3KIGEE7CDFRU7NzsGUx1IGwMcS0IoXWTTq9isWsaMbsrBykS4?=
 =?us-ascii?Q?TAvwquF+U7fqZx2l7LNE1rivoax7v9aehmt9wrphmT6sMQpos4b/BjUw0iCg?=
 =?us-ascii?Q?o5q1qVfZHmJAn0HBXQklS5g8mzvtp6wOKt3IBqEe79utGusrQ490sSqj0+AQ?=
 =?us-ascii?Q?pTDSS17j4rbKxkRIKiYxnCzc5S00VOPUDwaYPqIL5fpwfkPUklfi8tOoNIbk?=
 =?us-ascii?Q?FyqOqTU3USNEheT1ClXmoY0GWH4w1wx3Mu4J9F1hHZs/ymnot/zMa8qE55U8?=
 =?us-ascii?Q?wE3Uj8gQe11l1axFqqcRAUjvT4KUR/t5GHXYbDw5voO3kLE2PM60h/D2Wt5K?=
 =?us-ascii?Q?ewxc6sILjiSO5FIc+xHVma8++K3Nux2XtfYO92B5FlCbGFnfddOQEr3NLwTm?=
 =?us-ascii?Q?A9jVjK86UD1C3IqZDwv60hXglfIp5MXEombI0AjpVbFTNGe5bxLNyfjO3cQZ?=
 =?us-ascii?Q?0w8XCORQbKICIwI86sQzRv71znHpyP41oQ79xBG85B7WEul7Ekd2TOMnzrM7?=
 =?us-ascii?Q?ExEex+3uzlWuSZ5v7e/z/0otvEdujYFaavHJCN9ZnlDcByv3+1/OVGgsLcVL?=
 =?us-ascii?Q?zc5DVsh6gXyjnEewOheWqUinw1zPdAkenGyyH3KlJUNL/jodeoUhFCj4I/Ui?=
 =?us-ascii?Q?q1LRw43PB6F14O8nftVuEZXswID7xk0OsESY6RJYIMAgUPygz5ORx8hA3mLz?=
 =?us-ascii?Q?VRR+vn9igui1nDpLJmxF2fOnlSLf6Jtum0baHYDvumGS5vZvRhwuGNS70Hma?=
 =?us-ascii?Q?yG/SuZqztEpMdtm5sXMLPR5hZexKdfRgPJFEj8ga9fgt+ra4G87F+6YJbR6I?=
 =?us-ascii?Q?2IFIb8eb9orJbSsPc+46wMg46A4f+PmwcjYgFutPnqF0KS0DiKrYbe7jo0H4?=
 =?us-ascii?Q?a0rcuQdxW59TrodGwGS9dLJBVTi487YDb0LWJiVWTqqSZZJg9A4IOXPymTbK?=
 =?us-ascii?Q?e+DLA7C6jPmSPeOZqoTdKVOXHPthvkUftbLRkMKfiaCrqYQwaxcd6lWVfcSd?=
 =?us-ascii?Q?+xxCiqwQF6gsOFwaH0NsUGBFD67xWCouPU4bM8zaNbA5cgoxLFMW0Qu8v8E8?=
 =?us-ascii?Q?fQSKlUW8c4SPLC2BaHzLFZUdnnYWCkdRyeByIVAw6g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gU26dC2hTnOV3RCJycRx2/KuTXoJSBk0KLJEmN552izNJywbGZ/VvwUY2xRa?=
 =?us-ascii?Q?kv6HuGFOo/FeHSx/3NkSfcZMomrgzQA67RMw5TcREwBnHcdhkBryW5v2ftdI?=
 =?us-ascii?Q?fxt2yhGdj6jnAmdyeBKS/1oN4QX2a0a0hZ2XEgi4JyVtgYB7lh9vrrq3RvUB?=
 =?us-ascii?Q?AcZYpZ0cnlCzXDZc5r1I+pll68VH+F9wgmtS+0EJbSxMtBKsnajTZTUsVhyp?=
 =?us-ascii?Q?+6MEJs/cpxiSZl5j0mAHZI/rAofpwZfEu8NMPNTUZ1mxiiStF49VkH2UkWsQ?=
 =?us-ascii?Q?GIUO/QP29SNvTc55aYxwx7aAqfuK1A1dTXRqaxDpFR1jPjd8LrDmVsiT5NsN?=
 =?us-ascii?Q?1xow3f27kMYy8w+EQp1m5aS1qoBfq9jsKiE2FlOGqN8o14BtV5XVh6xYE5Jc?=
 =?us-ascii?Q?0dST0jqM4vfQwh1g0rHDgIn9+kXkdZTM7oDfM/wrecQNpl/dpACSlYHk8JMg?=
 =?us-ascii?Q?40YqU0OqQncn5h1V6QDneqJmUe6HHNbGTPKJ8xxRAXomkX23RCWdpuWUNAI1?=
 =?us-ascii?Q?701Q7LtgDse/dpUiCPdIwkeVE7V9XuQUvp2VNK+2JUP91wIzrCfxeB4OzNyC?=
 =?us-ascii?Q?x4oPhdcu0m8sofMrMGFv/8NdSjgVbmjCPBrzwLyrnLKXsVJORYaJnlI8f9i/?=
 =?us-ascii?Q?+y0yTR5TRxtYbRFE6OFngc85ieBS+obXVTeS+ij7nwlel+OQ5D3WHomb1UnU?=
 =?us-ascii?Q?C1m0bftM36EV3+RPFGMexjQ3ZbzsvxGWjWZP7ayBWOc8bzB4VGwlVR26SEPF?=
 =?us-ascii?Q?wnJq03nz3wt95W1FqKNQbuas+MdNfnCCLEYNuX9SzbboYy8i07zeJE3bOw7o?=
 =?us-ascii?Q?98/Ww27zvMKqJsRgQi6yiD8YisOdQ4FD+cxNVLatdMbdi87PFwX1VvbGd7Am?=
 =?us-ascii?Q?M18ERhiR+Mttr2viwYI31MYM/78YX9o1s76XtWC4zXknMmOKgKAfMS+A8S/y?=
 =?us-ascii?Q?Of9kVbrL1C0rGIfSgBcETLUp2a5Yy3sDDiOqRruRIG05x17FvdrQPeQ3rQsM?=
 =?us-ascii?Q?uRopErf6TmJscRFyUACldRDh8tYYSsMCa5rEI7TBpXYR8k1BRxWqPoBmLHNY?=
 =?us-ascii?Q?+6YEQc+bvnwp7LgdPgdk9Bw5fpMYq0viSomX7QH5//BZfmR4PAnCilhEqT6d?=
 =?us-ascii?Q?GNjfxYbtkbbmororp6+4Dg+nLcABkLsnruWOVOct825W3740jGDcBr0jdpGX?=
 =?us-ascii?Q?dKlFTH8nwChnk/UZmrwhziqrslowtYi0wjnSV7s58jNmrknGbgHlca7itaBx?=
 =?us-ascii?Q?jmsBZ/A4+zoZ4rtNmiZW5pezAbCeHgKTpM01y7iYqHt9AS4zfKS0Sj9A7Umt?=
 =?us-ascii?Q?rVOln92QW8B8HnNKs0peWaAf+KuE1P1ZlvwKv8lKaWEVSNL088V/QehDLGep?=
 =?us-ascii?Q?X7EUG4sWCiQyZFPGfd6ARm+esgkRJcuIvwA7FT03REKS9rViDZmuUxqnxLxt?=
 =?us-ascii?Q?MT7nrat+IUiu2c1Ts7vVugqV+2xJDsSHeEB547LIotCOIswnvJr8MQ5fqVza?=
 =?us-ascii?Q?MhbLYN0eA6Nx9wOO1oSs7BmksD7vJtfDM3CqTHIKchmU0w+W5Yc8vUZn9hDW?=
 =?us-ascii?Q?i7B62hBNItfOhSjwJF7XnWUK0UghwGz3GCfjlOqB3aLN5cTiHm2g7EB4GQq/?=
 =?us-ascii?Q?Qw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GM9zAcuwYfd72yK7/gxR+ajOX6MWuVwwkkC44PlpJRVj1Hvi79TC1YukpaojRWCkeje49t/G4Djg0GbgTNeEMLbs0OVr03rdv2jHgtSUu0biLVws8f2PFwoLHV/S3OhTGkDbXMrPNjhbCs09xth8vMvAuDoQRaQxmXJ1sUPvuELge0yu7nxOTnF0LNZrXRaGL2TuaeWhCvzDuVZdkGvbasPJwgfDZQlSmMBwg+rztMqqlkUl847VD35VmN9RjG0S5PI7i5qJN+GqdG+AaijZxauYwDc515IfTRR0rrfJ7dkzst1DFibZoXOA+5Nk+NCIgWw3yrJoCpsiQB9fPUy8pbq75QO9fNWlMVG3i2hDUg+ADcXRcAgIcifDIZm6vEdufqcBrsLIV4fNlfmPUWfELhlTYzBSJUkAgSERydQf3G7k2i2QROXx/bSsFEFW6cqFjPqI0d7KGM+VqqCS+LJazP5XwiHbnFBFjmtQRnl6PVkl4mDPvJzi91ZHsMBiPJstqYZOSQSczbDt16BBCsPIg+LWOdcmg36CLTwGm3MV6RnattXmrCCd+1M3AsSMa7WBusotZqzO/DXAq5Ekdm+Wqw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f28abc1-b6ef-49ab-01ec-08dc734a3493
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 12:42:52.6122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfU394GxjyrxorzWb5oSHOifFXTeBpicTN8hFu0QDphAGSoWhukacZuZ0xGxXeghVPo/8ypFQVD2lWMAwuy0W9GWc3nHzwOEd72DEfZFYao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P250MB0011
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXbRKxSjQKVH+GFdrJ9ZTW+BuNxJn46y+ZtGPUnvA2A=;
 b=LEgszTUrzUDKTXB0KLcRSsJMgcMliQqCZZa38jJW24piEjGmhaPhJejynb259fEo5NPjNhwgSFYeTfUZGKrH6Q68+Csxvo7CP859BAfeZx9F0D5ndAqUv1VlAq7O8eT3lRiLh8QzmCDly98ogkLwgmCp5nE5HZjnNdaI6+DEXBs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=LEgszTUr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: bump to
 version 1.11.0
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

https://download.gnome.org/sources/NetworkManager-openvpn/1.11/NetworkManager-openvpn-1.11.0.news

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/network-manager-openvpn/network-manager-openvpn.hash | 4 ++--
 package/network-manager-openvpn/network-manager-openvpn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
index 11fb28f8c8..59d03fae2a 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.hash
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/NetworkManager-openvpn/1.10/NetworkManager-openvpn-1.10.2.sha256sum
-sha256  62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945dad4adfb56d076d21  NetworkManager-openvpn-1.10.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager-openvpn/1.11/NetworkManager-openvpn-1.11.0.sha256sum
+sha256  2128de06f91b33c13d63cdaa6e178bc1ca57fc770cde3bc7c24891f4d9824501  NetworkManager-openvpn-1.11.0.tar.xz
 # Locally computed
 sha256  c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
index ccc86e45f7..f39edf3209 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.mk
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.10
-NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).2
+NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.11
+NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).0
 NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
 NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
