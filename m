Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE72C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ADC38174A;
	Wed,  1 Nov 2023 11:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ADC38174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dE_Zkv9Q0h8t; Wed,  1 Nov 2023 11:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95BE181A23;
	Wed,  1 Nov 2023 11:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95BE181A23
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 172C31BF2F4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2A5B8174A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A5B8174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNsChp8rq8cK for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:00:31 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 01 Nov 2023 11:00:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61C7381A23
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61C7381A23
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:00:31 +0000 (UTC)
X-CSE-ConnectionGUID: c+ZmfvsFTz2Py785eNDsuw==
X-CSE-MsgGUID: xBVq4sVbSdKAr8Y7NLyJbg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="178127965"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Nov 2023 03:53:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Nov 2023 03:52:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Nov 2023 03:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+A3XQuMksIj3lSBs+wg4j7IfopXIlFy40QS5lkey83E0SvR0+cN/4+855QyM4a1boh83TNX1ZEeJqRt7xrLlWLh73H7iV6jgshxWKJWajP67NsTj4uUrDNc5Ug+9tRclPXyIrQ5W5iG05C3g/DRo+p4H93XcOlVO6vX894ZBgu/z53HfLYp3aUfBtBUgwbx/a70daPO1bzCM9ixmvP4/lAKjLmAnXftPxlu57rdEJUqTwWeD9Jxsz/orvSbA5fRx0kozobDy2Hv4QaCiwFRYxo1qto9LxF7BEGxDbPLa6Yn+Y7co+X0Uo+cT5GoynTHV3fg06UNVH0eZQK0ji+9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxUCeixmBgQMpPMzqS1WERuC9iqLiIcbeuqEnkQvYHw=;
 b=Cqy6HM24WNxkq2ZhHD1yBQQ2QEyX1s6lujkqdE2lXSV6cNlCzNLMHyb5/GSPd9GxWHJhQ7tm9vwTiESfzDSyTtFxkqYvaPD0OP1cGqufoXNfYDY4sssUGZ/z+1txbDZrA4d+J30Sxy1x9a/42yaKrahq+eByDhkDMkZ3Iz+DxRtlqpOkNlUvc0PKAz20ujlVruLq/xqjsglJLO5I2BY5+V/s4P7ikhxLJgvFtlA8w5lA+SCBcnUFYH7zyC1AISkwueER5Nabww/goGtxma0/rZR5VI2HP8cPa/atsmzrvoHQMsFBInTSZIRME8sHb+AFJ1kakzJgYLG4DXCOf990ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 SJ1PR11MB6107.namprd11.prod.outlook.com (2603:10b6:a03:48a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 10:52:51 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::10e7:a440:f9c8:2a5a]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::10e7:a440:f9c8:2a5a%7]) with mapi id 15.20.6933.029; Wed, 1 Nov 2023
 10:52:51 +0000
To: <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] configs/microchip_mpfs_icicle_defconfig: fix zicsr
 build error
Thread-Index: AQHZ9R6pZL69qcHFvUSOjlAmuCOgWbBleNyA
Date: Wed, 1 Nov 2023 10:52:51 +0000
Message-ID: <f66ac6e3bcfe449528e34bc8eed78efd73f4d792.camel@microchip.com>
References: <20231002105324.2167088-1-jamie.gibbons@microchip.com>
In-Reply-To: <20231002105324.2167088-1-jamie.gibbons@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|SJ1PR11MB6107:EE_
x-ms-office365-filtering-correlation-id: 1d356766-bf74-46aa-7fb1-08dbdac8b1c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZZOMq+HFmLNbX+BL/cDFcpl6Awpmy4t/caScMcyejYJvqYbOzHMFr17EL4/H2HDRjCqCgnI/WynHhYyJzOoao5CvGcMZ/M9XnEoWfMjMCZV+2b+QrcJPfZAxewzsxUrisLU6/9fdkfXrP1lbrbSxps4QUu9F0mLdRZoem0vLk6YkC/o/g+9RH64gw9UR3Ng3BkSS7nU8kuwGk5tu+uSWq46/kJi19lgs77hcR9uRI6P9aIX2up7Ph7hxvL7cZyhk1YGGO9SxytvVSJaqC35LpHb71GRr0K6yNK49beju8JfaW3kn/XwVFDqV63QCP0VpTjQhaTJMlaTICrPVpQUxsRGD0MvhIva1ak/LeTxxpQDq9S030349q7HSecE7Gxa0XWR+8EgAeNiXNjAoH51QmVkIv3sxz01m114pBvWlTJbG7RkvfCnC9srpQvGXHeezS29IA8hqiz6s/Kgd2Rbof5MNV/ks9QvutBbDK176jYpFGmashoOE74mnRVSzXvULY5feamz1RSPgEAd3hcDppf6mWUDZa9FwUHYSOzA9Q3wCPSAzOAgHAS2Q6a0ivNO4gIj7VrzPkn1sYgE1m1l0/C4uvLUOYjavBMZWthp9TqOShWgE8sblfIbJCUlv4UPR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(71200400001)(2906002)(6486002)(478600001)(107886003)(38100700002)(26005)(2616005)(38070700009)(122000001)(36756003)(86362001)(83380400001)(6512007)(6506007)(8936002)(8676002)(5660300002)(4326008)(41300700001)(66446008)(91956017)(6916009)(54906003)(66476007)(66946007)(64756008)(76116006)(66556008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0V3ZVNsSjJlSVhGdVFkZzJ1RE9YeUVTa2FaZ3ZmeWFsM0xJSUhkbWlwZU5p?=
 =?utf-8?B?a1g2WjdlMUVETllESHpZb1NyQ0hDS0dnZnNwN0dZVnIrbVVTMFZ3bEZYZC95?=
 =?utf-8?B?d1RuMWh6UmxDQ3lPMm16Q2piSFkycTExaW5rS0l6clVFY3RKR29QUUFKNTNE?=
 =?utf-8?B?ZkJoRnRSYUxSbEk2LzBSRFJTWHozWTNiUmhocElhdDdpREc1aUs4TFE0dnFJ?=
 =?utf-8?B?TW5NQnY0Q2ZVSDhraXJTVUF4bWZnS20wSkN5dkdLZ2FwREtvd1RQSUQ0bmQ1?=
 =?utf-8?B?aDRhRUJvRGZKQkVXVGE2cnh4cENJYTZpSjY0a3VIcFBMMnNMaTdMYnJmOWxU?=
 =?utf-8?B?Z21tYU91SElNNlBQVWQ2ZDQ3Wnk5S0ZsczAxQ25zKzZnZmd6aWdsUWUrRC9T?=
 =?utf-8?B?SUpSM2U4MXBOeEwxR0paK2FWdHRmNXUvOHlVMHQxUW8wWUZMRmtQVU9ocGF6?=
 =?utf-8?B?amdkejhicmQxaEFLaXMrZFBlWFJTZ2dDMWcxOUJUaXMvaFZ5Z2Y4a2VVakJY?=
 =?utf-8?B?dFpLSDBDQkNrOE43UjY5YjMzbHlUeXF4YjNtWDBTUFBmNnM0T3o2SjYvUnBO?=
 =?utf-8?B?bHF0OVQ4bWpMYk9FeVB6OE55dWlMQnhZZ3NueGVSejB0blI5UGx5Ty9jcTBV?=
 =?utf-8?B?NjBHWnQ5eFFjUnhZYnRTTmgyOFhOVS9CMy9TQytIMUJPM3BZS3hHa3MzZ3Jl?=
 =?utf-8?B?NFk5RFFzNmxKbk9XZHFJVWVtWVYyaE9obUdHOGFhSGZhbHNjd0dBc3MvaVBF?=
 =?utf-8?B?MHJDdmlEWEcvTzhobkpMZUhlZFVaZ1E1L056M21xWGZNeWh5NmVvT3lEVkNV?=
 =?utf-8?B?aFo2Z0I4cmNOelZYUWVBZ3Y2bEQxbzk4UmY3SmgycjEvUnhZa0o2aHNxLzk3?=
 =?utf-8?B?U3NUYmNIenkxbnRlWWsvcTVUNDFhb1FxK2wwUHRaUGRYMXd1MXoweFQwdlQz?=
 =?utf-8?B?bUF3OWQ5MFhVRXloQWhVTWNzTXM5eW9HZ3Q0Zk9YemVOaTFQMzk3Rm9LSytk?=
 =?utf-8?B?SnZhUkNyV0ZrUVFnRGZ0V1lSRVVVZm90UnJINkJ4enhvVUY5OWs2QXNNM3pk?=
 =?utf-8?B?WEhwVCtsQ082dEc0U2JzZVJiRlZrWGVIdjRLRGpBSTRQYmNFUmZUOThLUXdz?=
 =?utf-8?B?OGZYVTVzZ2JJOWFlaS9ITTlYRk40emF5aFAvOUtNNXYxTXJzL3hEa2QvY0tu?=
 =?utf-8?B?Q2s0RnlTZnNGVW1iblROeVlPWWVkTytTVkkrOFI2eUh2emVmV2ZwRDBoaFNl?=
 =?utf-8?B?Zy94cDg0bWd5dkNIMGFuYXpseGFOTFl0a1ZqY0VncSt4d28yaGdwdGt5Mk56?=
 =?utf-8?B?OHNqSmN1SFdXK0pZSmk0N0d6KzlTQlRwNEtyaFBBY1lhVlh2dWVDLzJ0QkpC?=
 =?utf-8?B?RXZ3N0JoL2YzdkFrY09oM0lKcit1aklSVVRBZ0lHN0p3anV0WWR5anNtSFZs?=
 =?utf-8?B?bTBmaWh0ZTdEay9sNlZkYkthU2dGcFlDdjlkSHY0UERDcXBKSXFXUVhxL3RP?=
 =?utf-8?B?ZjNBV1JQY1h6SHlwVExYeXdSYTc5SFlwMlRjc0xQSmNwaHJJYytmQmZIWkFl?=
 =?utf-8?B?NEp5aDdWazAzZ2VQaGZoK1JrZ3JGMytyQnJsaVJhZTU2MWtiNkFuVE1Bbi9U?=
 =?utf-8?B?R2pPc3JVcDR4alRMSkVaV3BYMFNScWUraktta3hHN1VCQ1lreldyY04xZUJB?=
 =?utf-8?B?UDdLZlNhYk9HcDFaSy9sM3I3dVpBNmloaUh0VHBIS2NJTWJNNlNzL0NVZFhk?=
 =?utf-8?B?R2hXWkIzNTkxRllVb015d0Jab3djVEVtdlJkS3ZuU281M0NvUUZ5eVhDQTI5?=
 =?utf-8?B?QitFRjh1RjNKNE5WZHR0MlgrU2dDeWFxbVFrL1BpLzJRb2ZPb2VJTEJ1c2s5?=
 =?utf-8?B?TndUeGFiMG80bmJPa0xDSjhrRlQ5VWtTNDFqdlFJTmNGM21vRmtPb2hseFB5?=
 =?utf-8?B?aUFIZ0Q3UjF5NVV3T1hJSjI5aVpUbFhtNHB0akE2M0NoVE9XYWQvQWVvbE5G?=
 =?utf-8?B?R0xzMG9ZbGc5N0RyRGVoWUNSdnpxQzhyYTBqbFduMGdJelZIWW05OWpYVTZW?=
 =?utf-8?B?dFJ1ckx3RXJQSjlOQ284QTlrbVZucUFNdDUyVUVndzV2R2VmR0QxNktSQTgx?=
 =?utf-8?B?YzIySVJXdTF0OGZpK2VYM0IvNXNOSlpZNzNIbU03R0dUa3pPNUg2Snlkb1Az?=
 =?utf-8?B?eUE9PQ==?=
Content-ID: <3A6F1EFC1FAA2B49BFB0299EF4847073@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d356766-bf74-46aa-7fb1-08dbdac8b1c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 10:52:51.3383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1cR2T7C0YPkcQ2VjNXLIVumriOKOM/w1KnAL8TNbMix3oKJ9gVHT4tB1s/tXcQCcUaKA4eyozpxCWcRz2psFw4ZOMuPtMVoldpan3WzRu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1698836431; x=1730372431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=NxUCeixmBgQMpPMzqS1WERuC9iqLiIcbeuqEnkQvYHw=;
 b=gADjUQh7fFLOpegaTIS/U+9WV8l9nvAH2+/D4Ma2L77r+N3DQoLwzkf2
 o40bTHvjg7KBa5XaAe4pDO0PLrOYHnS4vzPDaYkDX2nl2ee0oLPVQaLrN
 sTOptX0LRdJhkhIm/F04PMu+cUvaVI4dHtlA5I6MdxQR248ZUYdHdLcSw
 i+e8iPivgBenpnJm5jSlUvLG6htSa8j0OwNndsVQU0f+wvq3boal7YKRJ
 5UjTwcaEGhlOshf0CyIb993Wi9sKEtROn4xtnH87/MQ3pmHmDfwOi+kW5
 OC1Id0tfqMsSz+q3N7PwWfkR6kXTOiN9/DUYP+0SLoH5D3bMqu1PczQG3
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxUCeixmBgQMpPMzqS1WERuC9iqLiIcbeuqEnkQvYHw=;
 b=FEkfPW9kfTaxMGqOmsv25ddHLyxJJkjXo0CMTcs/xvzsDPPWu5L1cu8WHeLMPsffSaFJ7NC375Hs3WycPRBhS1ahwDpSwYSFjO7wf3pW+ivkHk6VqnDc24uTFU+1RCGGY87KDhYnYr+HuTVLhYXxO5RYnHbUlgjbQLV6iLy2xFg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=gADjUQh7; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=FEkfPW9k
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/1]
 configs/microchip_mpfs_icicle_defconfig: fix zicsr build error
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Cc: Valentina.FernandezAlanis@microchip.com, Ludovic.Desroches@microchip.com,
 Nicolas.Ferre@microchip.com, thomas.petazzoni@bootlin.com,
 Conor.Dooley@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLA0KDQpJcyB0aGVyZSBhbnl0aGluZyBtaXNzaW5nL3N0b3BwaW5nIHRoaXMgcGF0Y2gg
ZnJvbSBiZWluZyBtZXJnZWQ/IEl0DQpmaXhlcyB0aGUgcmVwb3J0ZWQgbWljcm9jaGlwX21wZnNf
aWNpY2xlX2RlZmNvbmZpZyBidWlsZCBlcnJvci4NCg0KVGhhbmtzLA0KSmFtaWUuDQoNCk9uIE1v
biwgMjAyMy0xMC0wMiBhdCAxMTo1MyArMDEwMCwgSmFtaWUgR2liYm9ucyB3cm90ZToNCj4gQnVp
bGQgaXMgZmFpbGluZyB3aXRoIGFuIHVucmVjb2duaXNlZCBvcGNvZGUgZXJyb3IgZHVlIHRvIG1p
c3NpbmcNCj4gYHppY3NyYCBleHRlbnNpb24gcmVxdWlyZW1lbnQuIFRoaXMgaXMgaW50cm9kdWNl
ZCB3aXRoIEdDQyB2ZXJzaW9uIDEyLg0KPiBXaGVuIGJpbnV0aWxzIHdhcyB1cGRhdGVkIHRvIHYy
LjM4IHRoZXkgdXBkYXRlZCB0byB0aGUgZGVmYXVsdCBJU0ENCj4gc3BlYw0KPiB2ZXJzaW9uIDIw
MTkxMjEzLiBJbiB0aGlzIHZlcnNpb24gdGhlIG9yaWdpbmFsIGkgZXh0ZW5zaW9uIHNwbGl0IGlu
dG8NCj4gaSwNCj4gWmljc3IgYW5kIFppZmVuY2VpLiBBIGZpeCBmb3IgdGhpcyBoYXMgYmVlbiBh
ZGRlZCBzaW5jZSBVLUJvb3QgdmVyc2lvbg0KPiAyMDIyLjAxIHRvIGRldGVjdCBuZXcgWmljc3Ig
YW5kIFppZmVuY2VpIGV4dGVuc2lvbnMgYW5kIGVuYWJsZSBpdCB3aGVuDQo+IG5lZWRlZA0KPiB0
aGVyZWZvcmUsIGFuIHVwZGF0ZWQgVS1Cb290IHRhZyB0byBvdXIgbGF0ZXN0IDIwMjMuMDkgcmVs
ZWFzZSB3aWxsDQo+IGZpeA0KPiB0aGlzIGFzIGluIG91ciBsYXRlc3QgcmVsZWFzZSB3ZSBoYXZl
IHVwZGF0ZWQgdG8gVS1Cb290IHZlcnNpb24NCj4gMjAyMy4wNy4NCj4gVXBkYXRlIHRoZSBrZXJu
ZWwgdmVyaW9uIGluIGxpbmUgd2l0aCB0aGUgVS1Cb290IHJlbGVhc2UgdmVyc2lvbiB0bw0KPiBl
bnN1cmUgY29tcGF0aWJsaXRpZXMgYW5kIGxhdGVzdCBmZWF0dXJlcyBhbmQgZml4ZXMgYXJlIGlu
Y2x1ZGVkLg0KPiBSZW1vdmUgcmlzY3ZfZyBzZWxlY3Rpb24gYXMgaXQgaXMgbm93IHNlbGVjdGVk
IGJ5IGRlZmF1bHQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW1pZSBHaWJib25zIDxqYW1pZS5n
aWJib25zQG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KPiDCoGNvbmZpZ3MvbWljcm9jaGlwX21wZnNf
aWNpY2xlX2RlZmNvbmZpZyB8IDUgKystLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvbWljcm9j
aGlwX21wZnNfaWNpY2xlX2RlZmNvbmZpZw0KPiBiL2NvbmZpZ3MvbWljcm9jaGlwX21wZnNfaWNp
Y2xlX2RlZmNvbmZpZw0KPiBpbmRleCA1NGE0ZDU1YTVmLi4xYWY3YTNjNDc0IDEwMDY0NA0KPiAt
LS0gYS9jb25maWdzL21pY3JvY2hpcF9tcGZzX2ljaWNsZV9kZWZjb25maWcNCj4gKysrIGIvY29u
Zmlncy9taWNyb2NoaXBfbXBmc19pY2ljbGVfZGVmY29uZmlnDQo+IEBAIC0xLDEyICsxLDExIEBA
DQo+IMKgQlIyX3Jpc2N2PXkNCj4gLUJSMl9yaXNjdl9nPXkNCj4gwqBCUjJfUklTQ1ZfSVNBX1JW
Qz15DQo+IMKgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE9eQ0KPiDC
oEJSMl9UQVJHRVRfR0VORVJJQ19IT1NUTkFNRT0ibXBmc19pY2ljbGUiDQo+IMKgQlIyX1JPT1RG
U19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL3Bvc3QtDQo+
IGltYWdlLnNoIg0KPiDCoEJSMl9MSU5VWF9LRVJORUw9eQ0KPiDCoEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1RBUkJBTEw9eQ0KPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NB
VElPTj0iJChjYWxsDQo+IGdpdGh1YixsaW51eDRtaWNyb2NoaXAsbGludXgsbGludXgtNi4xLQ0K
PiBtY2hwK2ZwZ2EpL2xpbnV4NG1pY3JvY2hpcCtmcGdhLTIwMjMuMDYudGFyLmd6Ig0KPiArQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsDQo+IGdpdGh1Yixs
aW51eDRtaWNyb2NoaXAsbGludXgsbGludXgtNi4xLQ0KPiBtY2hwK2ZwZ2EpL2xpbnV4NG1pY3Jv
Y2hpcCtmcGdhLTIwMjMuMDkudGFyLmd6Ig0KPiDCoEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklH
PSJtcGZzIg0KPiDCoEJSMl9MSU5VWF9LRVJORUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2Fy
ZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvbA0KPiBpbnV4LmZyYWdtZW50Ig0KPiDCoEJSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQ0KPiBAQCAtMTYsNyArMTUsNyBAQCBCUjJfVEFSR0VUX1JP
T1RGU19FWFQyXzQ9eQ0KPiDCoEJSMl9UQVJHRVRfVUJPT1Q9eQ0KPiDCoEJSMl9UQVJHRVRfVUJP
T1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQ0KPiDCoEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RB
UkJBTEw9eQ0KPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChj
YWxsIGdpdGh1Yixwb2xhcmZpcmUtDQo+IHNvYyx1LWJvb3QpbGludXg0bWljcm9jaGlwK2ZwZ2Et
MjAyMy4wNi50YXIuZ3oiDQo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9UQVJCQUxMX0xPQ0FU
SU9OPSIkKGNhbGwgZ2l0aHViLHBvbGFyZmlyZS0NCj4gc29jLHUtYm9vdClsaW51eDRtaWNyb2No
aXArZnBnYS0yMDIzLjA5LnRhci5neiINCj4gwqBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNP
TkZJRz0ibWljcm9jaGlwX21wZnNfaWNpY2xlIg0KPiDCoEJSMl9UQVJHRVRfVUJPT1RfQ09ORklH
X0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvdQ0KPiBib290LWZy
YWdtZW50LXJvb3Rmcy5jb25maWciDQo+IMKgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
