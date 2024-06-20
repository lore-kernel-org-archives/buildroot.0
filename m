Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDCEC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 09:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9663B42D12;
	Thu, 20 Jun 2024 09:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_byQi8s_LX7; Thu, 20 Jun 2024 09:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C5242D36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C5242D36;
	Thu, 20 Jun 2024 09:26:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6948C1BF82C
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 09:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 638776151C
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 09:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzpKr2uz6bQj for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 09:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D876614ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D876614ED
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D876614ED
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 09:25:58 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 20 Jun 2024 11:25:54 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 560AAB5AD4
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:25:54 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 762F8B5AC9
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:25:42 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 20 Jun
 2024 11:25:42 +0200
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (104.47.11.233)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 20 Jun 2024 11:25:42 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+LgZKShUfAEXep9ruqJTXQEVY7A+w13KcfZf3R1Dn3Mm2zQDh0XA8MDdgIIA6/1mQ+Kv7Z2Pu0CidqvcF0IZPUp2ZY2K5kkzzxtX/gLPjyENFWVVLyamd9bppvC3Oitx9YHsTNxjf5u6CIBcj2P6RJlASmLBhAJaVc6l/o5JSbWyRZac7U5C8CAIrjzUO7WUbYqSMXeVFtB+ETsp7uCqezMNb+FYsza8VbyUeuxfQrl39PmvBVIzVx2voWjaZOVCQMLqJdMGc1fTQKzPutgTU0RcUZyKqLrds4iVaZ6gb4z2j0HlHmqzohsUlrhhEAacd46jx6/+xEQg4hUidYEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iZrgH3xGCYwwoF4lDYZCFeLnolQZJzRLvfgDm4vfLQ=;
 b=GmG7dW+Y4R787bipGwtmiI399YuXyhAJjW7cPjeZedPZ5mz3cby69bziaYQWooZWiCLoyq7gyRbtDmbdWjkrIWiEkaQpNehrJkOjCFpI+aIoL/gEftLWAD7aIbfWBaNKEMF9gfRa1aeoJ2rWQGSYUZHLykH8BOMATLjzVwEPymqxhhfDGq6JeqW9Zggg7HjjZlVI2h/uZo0baKh47hkRJICeIZansEmCzdnLC1Lxk5xxN4hNIhwUFLIG8l6miDoW0tM+JoTryzIAmtMBSJJBO85+8/V5T5AXMHSlp2nMdwuhipBXqBG7K3S42Bv5KI7qE1I6xsZURU4biijT4DxD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0195.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 09:25:40 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 09:25:39 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/2] package/libzenoh-pico: bump version to 0.11.0
Thread-Index: AdrC87bpOP8FpP1MTB69YBvFkxBZgg==
Date: Thu, 20 Jun 2024 09:25:39 +0000
Message-ID: <AS1P250MB0608E8FE5DBDAC4A58AC5308A9C82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0195:EE_
x-ms-office365-filtering-correlation-id: 33b47960-0650-4144-dd7f-08dc910af362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?SJRrw6HxMgUhWB1jJu65IOHf/e0pAkWYKCT0SKj4Wd009oHswPWotBmUA1cn?=
 =?us-ascii?Q?soNpW76YABb5GdZ4FD98URtRm/rv51piKJM/CbJYNAM4jqTh8NHYzxUgIjHW?=
 =?us-ascii?Q?+C26JCEZ1SdsAIkGxRD3sWHi8/8WQMWmgNbJHmwZaYIHvalpB/tyfBzvs0IF?=
 =?us-ascii?Q?i3typWi7ZxO0Rrt815CETQVlLzcf/jZ7tV3YbmUKNhuZDTgeHkqUYpbQ27BJ?=
 =?us-ascii?Q?2a32LuaiK+eKP9rvf45BJvl/RD7uUl18LssLOoO6zV8UbOOvFKFPbFtdNWWq?=
 =?us-ascii?Q?nCCfTKUZdCzVcapSwqUX82wpheM78uWBoKwMT/drpCYl78t0MvTWsQrXh0u/?=
 =?us-ascii?Q?vP5vx1URxXSIYOKKChw1OF1YCBMQDZfy+FbJ1fAZ3ZVKkYKJMNNZOuulwoLx?=
 =?us-ascii?Q?sN0EnpoxNyjVCPzVwimbCI72virZKU4yW1VCOZMKI12g/FMd/cH+nXCutwtq?=
 =?us-ascii?Q?5FBP0N2sQNuke0vgXhUM8JTS4pcuZtzk88aWhntrTK1SHVhoGSOti9/NIxWt?=
 =?us-ascii?Q?3U2DwrnagQKwf2SUCEVY9IRTA1fonDIQc3PaR/oCjUZOOt6BhOMQQchsmChF?=
 =?us-ascii?Q?EoSo/DRoRwOBnKAJ3W868rDVCM0HS/FNaCS+eXc8tPcT+5I6TLzgwOlQPEmQ?=
 =?us-ascii?Q?qoQe9nrov+xRnAYP5cmK0B4tuGDif0oC6nr0KZAXovwUKoWISNYpMOdKHlUL?=
 =?us-ascii?Q?r1wWCNOf7kxfMUlNdGA69hG+ToZlc+Bz9Fg6fIEodX7eC7L7C71q6WQE1WoQ?=
 =?us-ascii?Q?sFkhhnOyaFxbJ9LlvPutpmCPV5gy9FXmfdrmYU+yqpmrx4Mn9uA8DhN32NEr?=
 =?us-ascii?Q?pIAmAKL8JpsworGzTuwJedLydnqdKpAvvNkej9fl6i7N0UuC5kcNKvDXSJ74?=
 =?us-ascii?Q?WhwqAIqTeAt6ut4ZqgjiMecz7kUtYXjRfcnbmCW7FKLCsBBZLYm5LC7n3Ooz?=
 =?us-ascii?Q?FtecixGGBIySN1UlPIWNA7sBaKWnbPP8TXn9Ja7DeFx48Kd/eYAFMFJTIPZ4?=
 =?us-ascii?Q?uTTGfwkS8kZ7YU0Nm4LDF95v0OWEhgjqvj5jLmelYBBsF+gXm2jq3gwxGNcP?=
 =?us-ascii?Q?QPxHnRIOk8j+9Z1Z8FPCcqBJ6MK2qia7XtCAuxuAI7GVD0mbVVMuiZeI6XqR?=
 =?us-ascii?Q?UFjWvDWUCSgR93uqdDWBUnhS9KadoLGiSDfwAHf2yBoxVct64taRDn1ZWedV?=
 =?us-ascii?Q?asZCfwVZN5m3e1zkr3qabQXj0zNjavkphT6c5+jbTsddmhIQQaFAsC8ycv2I?=
 =?us-ascii?Q?Ben7yHxsz0D7cLIAhJ+8l48G7NhxQrhq9fAlxJ7gQcEzLqlcSMQC8BySC7DB?=
 =?us-ascii?Q?ZGR9V+tR/6wXTxofHV8r+hzL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yOn/H/NylUHbFld8B2WtO6fuJf4FxGRkbKux3s3DjWn35VDs/IjRZQnKi2u4?=
 =?us-ascii?Q?fmW0nZTI87EIsZYw4Kzf/pe0MUseVI35+2nYxvSMppldwsMG+3SfITi54dMU?=
 =?us-ascii?Q?ClB0+2UgKJHHZArFaBpuplnhR1TCiBwyCzsgHkPIpxmYsJVceuAOk7/GIg1d?=
 =?us-ascii?Q?H5dMYumTJBjn0Zxf/KIYWjrhESy7/9f7l/KCiCXODPpPBFqLLrDmsnE4js89?=
 =?us-ascii?Q?at3rJnf/oDJRf05cPfs1vGSGj93+LfWtdNqL0h4lKOYIChWhhjhePwO77mon?=
 =?us-ascii?Q?Qqeu7xBjT/JSDuzXATJm9X7s5d/RsZ35ZyZLMCivkcrCFTundF+uwWVjlPeU?=
 =?us-ascii?Q?SgKeSr+6NooEKZqWV7iq1TCzjiUy0TntbXxvdFTX+oyhMpdR8nLw8RzJtLkL?=
 =?us-ascii?Q?7tOBG6zhhphlJDF3nLAtQZgrHFYDUr2YWqzATpmDpTbcLpYR5NOuwo2llyZp?=
 =?us-ascii?Q?QrxXrhIqWAUCpGtlOIPv6uz941TKITaNEMfTU8Y03PZzK8m/qWONAg4E3nQU?=
 =?us-ascii?Q?MF7yRjZEFeVbL3BCyIwFzgcgUknj1m286uyX3R6iO5dOpDvVnhhRAh1+9ZAZ?=
 =?us-ascii?Q?G+a8yTx2vrNusDufbz/YxFrPmkNjzSh/+RqULOZse7jBDmfh3q6bLilnSODh?=
 =?us-ascii?Q?hJBRPUesBh4M66Wide4V1msQWdo6X0NxWOrM0hFOM2F7GcGM9r9/FKeb2Hth?=
 =?us-ascii?Q?13e2qYtlD63+EBuJ5l7HU5pUOyHGEDooKmy6HBkaOdTlN70n2J55lPzAN3Od?=
 =?us-ascii?Q?qz/3O+hgmzMsZTvwjvEeJBSxAOFC6M0EdyTy4myzk6vHGpCdn9C2tCAX1pcc?=
 =?us-ascii?Q?scHrLnDsgut5gNIfbV4kO0vHw+9gsBuc/xyWuCBV/ClSXqa632vyfcKxl3dy?=
 =?us-ascii?Q?3q53zXTDYhi8CTpo8YpBlEbidXQoPXfvTeBm8EkyN1hTTevvBRbXYfLrmrVB?=
 =?us-ascii?Q?/1QxWh5wxiJ5X7IBAhUHad4ZWGD9OW+4ZXBi/b04B8jT3K2lRqwWe5Z1cknA?=
 =?us-ascii?Q?qeO7uZm7svLShUngA1xH0hT9aemLVemXBWrhEXm0Er7KghP9upqETWNYASk9?=
 =?us-ascii?Q?u5PTtG3bYv2r/bZKUT9L0A5wM4jzFQzkG8fPJhBsZNNjwyJ/+alP3AmxERH9?=
 =?us-ascii?Q?7TPTK8k93LGG58IoUlSVwGGDGbxkwnKv1zIj+BF8zHipZvsDwCsqKdlmWKVl?=
 =?us-ascii?Q?oO9qFT9Qy1KZJ2Cr8iNNz0GI4msq44OhpYGND9+Y0GqXsojXROjfTCBWYjF3?=
 =?us-ascii?Q?F/6iTM17LzFmDlfxImdYPxdhdAvyMTbeO3MEDX5X/S8BUR/XGsiB8HANE3Dw?=
 =?us-ascii?Q?58uW/8a35wUp8BaOnj716vIQ5R/LMspKIBUxisF0VoMP1IF2JqIHb/LC3Yo7?=
 =?us-ascii?Q?hd4T4ttV9Bob5jebzsu5L1BcuJGocL9wYokh0fm/p1YOoTIdwsECkEvAswCa?=
 =?us-ascii?Q?dFweu9KGM2pVIeGsX7Az0rj0hYMH6opuYy+Ax+fmACceWZxIo1FwbT3dy3mT?=
 =?us-ascii?Q?9wxVBW2IbJ1gHb81ke3Aep/rOQUSBl21MMytFWtfZNCd7FiCex0hPKHzeK1w?=
 =?us-ascii?Q?13bKBRTm4OITrx3fAYGrIkVkhHyd+SRPjmamAUgmIObScxLjumNTn+6WNFmB?=
 =?us-ascii?Q?uA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dlGqt440VDzzo5DuRUykbwoTZ2xTNMmMx23+qSwrbtKodDRHqYBTNIEy+XJW9G0m4fG/MWL57zh+nCLGXeKomMtqTc+bS1U5lRS6hORlXjrN98Hv+wzvoR3gmQGLIKUqV2lhajbuGp4VA0hAuIZyZ36Uk2dW+GKm3om1TAmw/hjzIsw2iqW7XNlY1BnBA6HoQVovVDK8KPsOFNxroCy75NjVvpAZuAGEL21CxJP9erDFpdo/YPEUoRC6uho2C0GJKjSrZbNKJNdpWsjbMHmw/j7n+Ke7ob1uJ6oNYGNaB+qq7yZoYpBDdHMbY+5bO6ZB+sYIziKFaPGKxh8KrF5U1IuEcYS1dvzWaRcoLPeNYW7cYW4WrhoOi2N0ZfkaSFOkVu6VXBfu6Ca/EVr8byvFXQJNSnwu6oegmQ4uT2nUieJJeqrcWmI+WlgS2m+omgwN7l2H5wqMDRNePI8wIubVMMUI5ZR9tc2C4b7VEQ9WN94+AOH6v9G64VsBPGaUpA87a3zi6tFcbRWPyFQWtyIdpeD1I7iuRMr9XoChqxrqPXK51cQf2hFHALz++my+IPUcq8UIj6gVukmXQII+p5ly+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b47960-0650-4144-dd7f-08dc910af362
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 09:25:39.8471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4AOjyf4AST0On/586O79QodP7+1F9QnVDqZdgIQ0mMmfhduGYSx5JZD+6f3aBeveKO9az+JL6zdlFPGKexDU3nanjkujtrbDMPXML0fjrCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0195
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iZrgH3xGCYwwoF4lDYZCFeLnolQZJzRLvfgDm4vfLQ=;
 b=CF4qTgGq7H1d9UKPpVKl1LA871Kk6UCQqsUAewuW1iivc19AGP+sxyRqXnCHb+TYwpozapP1wYtdgLfizS7aowPaiNtvGlr9qp9MuQighluCRXDMm+GAUAhFqdWgL2GTkk+UDcaNS3Z7VT5Dyw4TFPFvDyJUyhCOhDLV0Y2wuxM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=CF4qTgGq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 2/2] package/libzenoh-pico: bump version to
 0.11.0
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

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/0.11.0
Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 9ea45969aa..3e017b79c8 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a5bc5cae6fd4ade3d69d8a2ed0aef89f4c8f752f79d74b7462f5bb3437680b72  libzenoh-pico-0.11.0.3.tar.gz
+sha256  db1eca9d84ca581731cf1f3f88aca785d58fb2b1972f2f07d09a0cf022ee02f9  libzenoh-pico-0.11.0.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 9163ba30ad..4b05df14fe 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 0.11.0.3
+LIBZENOH_PICO_VERSION = 0.11.0
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
