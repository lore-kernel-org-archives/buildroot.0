Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380A6C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 06:57:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B16F60F5A
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 06:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B16F60F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A8A839DD;
	Mon,  2 Aug 2021 06:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlm8jAeDJaUI; Mon,  2 Aug 2021 06:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3223839C0;
	Mon,  2 Aug 2021 06:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 830EC1BF280
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 06:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F75E403BF
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 06:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="CQSHhqaz";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="IjHe3h+B"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0SZtUZdlmcG for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 06:57:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98DBB403B6
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627887441; x=1659423441;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kXun4Gn8utuzDzZXVyTGannN76AC/9t2LPRx6fmaoRw=;
 b=CQSHhqazfq0f0g5f4nwwk6kWuQpRWU3sM1B+VLGxEf5Jo2c7V3xs53qh
 SugqyP3FZFV45NBf/BGlRS8GKbOcvIEw+Dx6ZGPHJg+qk7FMMXnDIjnqf
 b2+RDmnCHmyjmp4EA9AARO0y2QCbWfbK2jUz6yuDO4VixDZVa2m0GfHVJ
 Y/2MPcGGQeV+F1qZQFLyG9t3O5vqOD2u376joNX2vLjQ7Rj9WvTh93RBr
 OgFYteeHsGYrZzZdc71bhaC+2K6/VuQ50AgLSmxfzebQjRET4VlqIECac
 Q4OQpXXfzEUWNfO4zSw3bCLH/59yhxpIxQ05gqfUROVNbDIRWENgVs+Se w==;
IronPort-SDR: N6jjWIp9Zwum3OCLKOUL6wfE92rEM2CKK67o0xbIFdmE5SzDDaWfjLIzetxmnff+LkYtfaZ6sx
 W2xfvbxC/WC12N9MA4Y9yzV0ua7LxTHKQQ76E3QoQhfCAJsNlgMjwRxXxkZ/bdN4Hu0j5ELGP6
 JpROPhw/1//8kfBtygIgqvGLHW3cupzuac5ku1UM6Ou6msJGTOrg2Q8m7aJ5p8OE/Kwp3v5AUH
 7fhGcDexwpXUOX8/AlcAQWWYRRDkuFDeN9F6+X6IcCeThoeODMZXkE6LFmfMY6vto+VWMe3X2W
 4hk9QeyG72+cLyT5leaYV16E
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="130656365"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Aug 2021 23:57:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 1 Aug 2021 23:57:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Sun, 1 Aug 2021 23:57:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb59GiUCTJkYYi8y7sW4TuNFNUUGQkYAhpzspF9yJwDKL2OVlrDGEzeUiLdYRbalKHXiQzKt4ZZG0rGPg2mlqNkFlgnPsT01Mhl4mCj5KXZjZFFPXhf/raEfDLKQ8F8/2Kh2jFMb0NL0p6s97hBPN60E0keRy76X5uLJNBNaTbQGYHqR/pJL1peH7tO2f1j/raDskDhzSpgciF39cGRDN5+Br4L3xL+KJJ3CqsXVX7vAd9tkv6WrYX1HENCvzN6ri30B0sntArM5gwf+wC/BAzYiQs6IYxcZpuHHjr63VduPDTgVpepspQFkMaldWOMlum+aLef1eT7tto6rsL+zzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXun4Gn8utuzDzZXVyTGannN76AC/9t2LPRx6fmaoRw=;
 b=n8FT1bdLc1bCWnMBEmlt0PSVNTKkoxuVFWIB5K+UpxeTJpe/dUVD+GjczwpJtBEG97CShwl52Dw4o25aZ4AuJfe9LZBlo3xiuJ+5XI+K/94iBQOPfFIiEjUxVJbP+9U5F5+FQLuc8n6LNzBVFbUmFoeiOLFvqi+zZ8WGtsKVTjRwix85rcHRUdlU/48vNi0gxzg3mZNqDf5fSz7QK6d/jpbydqc3Z08+/Nt/YxjE/qnaq+tuLJpaF4MYpHXYen5Lye977PssQzuCwO7Fc4HQgB2ua9tVb9Um5iFIdo+O6nDP48AIeAbPcXmiJidt4inRp8EmiHppjX/zs/GCMUrYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXun4Gn8utuzDzZXVyTGannN76AC/9t2LPRx6fmaoRw=;
 b=IjHe3h+BVOVoN3M78QGKkM34o8qvY1ZxoulGFVIpLNChjUh8DgLL3fYM0OHN3i98n6PX7yhUp5GaToTkA8b9BTFK+rfavXlT/lnZ8yQOvbWV5akq1D+KdUs87FYdoVFs+Yf3+VOkBy+rlZtXENds8VXDonLXz41WQhoOPNB+NdA=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1841.namprd11.prod.outlook.com (2603:10b6:404:102::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Mon, 2 Aug
 2021 06:57:17 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12%9]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 06:57:17 +0000
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released
 4.0.0 final version
Thread-Index: AQHXhS82HF/cjvibTkGNi1Q8ywWljqtcDT4AgAO/pwA=
Date: Mon, 2 Aug 2021 06:57:17 +0000
Message-ID: <8bc0814b-6d8a-4e96-7d8c-b6d476f1a42f@microchip.com>
References: <20210730103908.11270-1-eugen.hristev@microchip.com>
 <20210730234234.31bc6aa0@windsurf>
In-Reply-To: <20210730234234.31bc6aa0@windsurf>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49053704-05b0-4f28-d793-08d95582c41e
x-ms-traffictypediagnostic: BN6PR11MB1841:
x-microsoft-antispam-prvs: <BN6PR11MB18418B9DD2589020E1CB8F40E8EF9@BN6PR11MB1841.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aJDQZVKGXKPGkvwbYz6L0EfVTZNsYtLBR5Pdl3F9tnNvR52FErM4kHxstvEN1zkrKIqKkiMdrVxsG8cYp26lweW/COyOsZ67vuObh3+oazvrxYMsvtyswQ5LZOPCbDFP+1f1AFErDq2AD2nAW+CVFYzgNoCAUD7S7m298pIgG4FPuGOoWi6j5AbX+g+hhyaXBdpxKVP+R1TViMa3alikugpRuMG0pt3URniZ8jhp0qpFis4rQ45Krsn7+UtcgYbVVdlJQD+8Ih9yiDO8xfeqKdZUV7JsfaujB3WqFyYAZIqdZKDtOPyGVbs6AXnX/OKV9vbAOH/ZgkRUKrOwl1dYMi1rPFnj85ZcvGdoGBBXWSyBqGM96Juot5W15PEg2RkL0Set/2tm5xUBZkeivP1ftuUgBI34H0/iZzaaa5k9fvgiFCiNTBRL6YWM18fzVoB/yIHER1JFiJPR6v1AbnvLTLJljDPbH2A1d+Y4n8cj3YRmu3JAHYuOt9N2B/Xx/Nb3UF6IFBj4AVRpoXTTMzgOSei9MpB4TRH2dUdXnV+aLqk1rP5yd8ZI741WsXaGYbXhw2kO7btID9UxAqR9kGmuj2sRLbI/z8CXBb0HmfRCBGrjZz6vBthTv9hDoOVhI3eUIUmeMmGZ88ZKZudCB1O207ZXJxXlWAP4/rJbPmDRPBZBpgx7rK4dx6ICcYHK71Ff02oh1B8J7IEiZ1QKtGt94tkNNQj/GriVDdUCZSqGPn7t95rvy1iPBcqjCLeRkkGb50APPk/bh8cnpkUN4buuuErbzMdJnSIvzZegz9kOwy99ExlZIqiTiB9lYx4+LW1vKo9PY46J1NVIAUeLzPE3r/92mrVFeUQraeGQiQbdw8g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5514.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(136003)(376002)(39860400002)(66556008)(64756008)(26005)(4326008)(2906002)(31696002)(6486002)(66476007)(53546011)(6506007)(71200400001)(36756003)(66946007)(66446008)(76116006)(5660300002)(38100700002)(91956017)(86362001)(122000001)(2616005)(38070700005)(6916009)(478600001)(316002)(6512007)(8936002)(186003)(966005)(15650500001)(83380400001)(31686004)(54906003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkdJNDNpalo3R0NxM0hOcCtUTWJNMHZVajFwbzBEaXFqOVFkYXhYSXJjaGRM?=
 =?utf-8?B?MStTU1JjWjdIbTlsSjZsY214QmVia3ZnT2xmSTlOV1Q1dytUZVF3cjFhdHpF?=
 =?utf-8?B?OUduN2dpdHBUekllRDNZeHlyRDlKcmI2RjN2eHpQWEIrNmtLMkVCdWdFbWd5?=
 =?utf-8?B?d1hVUVlZejRxQUk5V1NVb3IzdHpDSUcxY0FBWjFUZEhHajZGN1hhY215S3pM?=
 =?utf-8?B?d2R1bHZSNk1Lc0NwUDhzTi9CelBoeGJCeGRreDh0TUNBSUg2bjVJWFhzelFX?=
 =?utf-8?B?cUQ0cnB2Yzd3elB2MFh6djBYbHQ5aGtXakw0eWdweEdlVXRLNjdweUU0d2dD?=
 =?utf-8?B?bnV1YlgyUldnblJLSEFXaUV4OTVRTFVnei80Vk9SWHRFSWlHNHMzN3hQTWxF?=
 =?utf-8?B?YmRXOU1PaGlNeUVzbjcrV1RRUWF4QXQwMW1jVUlJNERLVWszOWFCY3NnNS93?=
 =?utf-8?B?bzBQdkU4MFYrS2RnbFJvQ3lMQy94VzlZYlk1M2dia1g2L3BUa0U5ME1mL2tu?=
 =?utf-8?B?Rk1XYWRuSXMwTmFYb1BtTFZacDlzSzJ1T0Ixb2ZsNzI1T0pVRzB4MWNNSHRq?=
 =?utf-8?B?RFp3dUEwQ0Zyc25hdXIvMTlQMDA3U1NITktBdnYwNHlpWFVrSkpsTTYzelAz?=
 =?utf-8?B?TUxJL25xNzFmYmtuNjlNWS8xUnp2eVJFVVVjMzczZUdXamNlOVdKTjNKY3Fz?=
 =?utf-8?B?YWJPOUdJUnNsQ0VjaDN4NTJsQ3lJdlpRdG50Z09rKzVDS1hoaFB6WWtnN0gr?=
 =?utf-8?B?K2EwUTQvYmw4SUEyTmplTkNGbWNwQllSeUk3bUZVdk9qTU96RGxtYTlESmZ3?=
 =?utf-8?B?cHptTWo3aGc4ZU5TSkVaK0JxNHpXUVN5ZC9rbGo2cGRVaFZqOUY0RnpFSEFW?=
 =?utf-8?B?WCtHeVB0QWlXSUZrbVZEY1ZmdmxZRTkrV1lHWXNIdmMwVVlrUmdIblR4NEhT?=
 =?utf-8?B?SjE3bzQ2bjhSelRYTG9aUmpZck1ITVlHa1p2MjZibzhOVHQyemUwMFBXNEN3?=
 =?utf-8?B?MXV1d1pHcmZNU1VhdUNJdkFYYTc4SGRHdWcrTllBZWZqRlRrR0pGY3NvbzRV?=
 =?utf-8?B?OGhzb05JVWFkUDMxWUUrRTNwQU1ES1N0R2t3Qk0zak9rQmlDZzI2ZWNjZ0x5?=
 =?utf-8?B?RXU3QTZwWHY5cjliS0FndnpVcWJuZTNlK3pCZkhEUyt4MzJKTUMyaXdpZTll?=
 =?utf-8?B?K2VGZzViTGVIYWgvVlBERnNmT0dlU3ZGbS9menpYT1kyK1Y4QlA5VXRGdkZM?=
 =?utf-8?B?blpqU3lWM3BPcGxUeEFDMUtKekJBbVNJVmFMN04wQ05FVXBJeFBOakxISVJX?=
 =?utf-8?B?ZmJFcjlnVEIzRGRCSzJQalBudlJLVm0yNWFTcDZMRS83K3ZEemVtZEk5MEVn?=
 =?utf-8?B?SzAxR25uTXpHcDdiV1ZaYTlJSkhmOFQ1dlhRSTA2d1ZoVUU0NkN1NS9PQlBo?=
 =?utf-8?B?MTNGM29oV2dwRGtRZk9MQnFrWHUwSll5Y0JONGFQZkdMSlhQZUxiU25aNUFO?=
 =?utf-8?B?SmdsVll2eDlTaGtPUTdBNE5FL3JTajhSVlZrUnA5VldGRG1BMTl4YktPelNZ?=
 =?utf-8?B?MytIOVF1cy9zZGpzQ2JhWk9pNmFnS212ejRKSjVReTFSaHduTmZKbU1EQzRi?=
 =?utf-8?B?M0NlRDRJV3RPU0NzQm1xWWNwZkhScjNMbUtuNmtBWmU2b2lpMUhnRHZjdzBh?=
 =?utf-8?B?dTFyL2RLckdDSlgralFHeUNvQXdVK29wNmNTajFic0xESVVRTEc0VStTZDlk?=
 =?utf-8?Q?+1rnbEYHmSUW9lvUpU=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <4EE84A15FC5657489437404332141F70@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49053704-05b0-4f28-d793-08d95582c41e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 06:57:17.2398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqaT6MY4dIlXxAhWi8i71h8M7t97umL2eyisztAA2e3kG4BGh9uha0EyJXQhQNyDfditoRNK1yAierQyIoVdZmBEhmARt190aVSsxZZorZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1841
Subject: Re: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released
 4.0.0 final version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: "Eugen.Hristev--- via buildroot" <buildroot@busybox.net>
Reply-To: Eugen.Hristev@microchip.com
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 7/31/21 12:42 AM, Thomas Petazzoni wrote:
> Hello Eugen,
> 
> On Fri, 30 Jul 2021 13:39:08 +0300
> Eugen Hristev via buildroot <buildroot@busybox.net> wrote:
> 
>> Update to AT91Bootstrap 4.0.0 version.
>>
>> This package is now released under MIT license.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Thanks for the patch.
> 
>> -AT91BOOTSTRAP3_LICENSE = Atmel License
>> +AT91BOOTSTRAP3_LICENSE = MIT
> 
> While this change is correct for at91bootstrap 4.x, I don't think it's
> true for at91bootstrap 3.x, so I suppose this should instead be
> conditional?

Hi Thomas,

The plan is to also switch at91bootstrap3 to the same license.
So if you want, you can hold the patch until I update bootstrap3 as well.

Eugen

> 
> The problem is... what should be the condition? Indeed, testing on
> BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION vs.
> BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X is not working, because the
> user can specify a custom Git or a custom tarball, and there we don't
> know what version is used (3.x of 4.x).
> 
> I must admit I don't have a good idea here.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
