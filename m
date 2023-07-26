Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF58CC0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 10:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EAB2405AC;
	Wed, 26 Jul 2023 10:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EAB2405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEsBVBqQey6P; Wed, 26 Jul 2023 10:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C8D3405C5;
	Wed, 26 Jul 2023 10:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8D3405C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6183A1BF5A3
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 10:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4766C611F7
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 10:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4766C611F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcHC1Jj-owYx for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 10:47:49 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Jul 2023 10:47:48 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB531611F1
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB531611F1
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 10:47:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="225293907"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2023 03:40:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 26 Jul 2023 03:40:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 26 Jul 2023 03:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqUCd9+TV8UI5pUZilQ9IvyvcHyGnYqh4mzyS4ZVqXlj/vr+WaQrN+WRt1Sjk65YxIO7WOHUK5iECEX1dnbT/Hk1FkoMyLawj7rEwMARKZeLzJPj/Mi/c/F2k9J1kk2KqZaMdmHIDvaSiZ6qCO96qp8RFDT1/pUgpeAjWB7/jq0HIqY/KYgD7akgprFZnN7TcvxREzTmrvlEhGlFWpRgqTAcYFMMBIi+Cgmeb1pY4/9A6okDl1KvLDrkeEs81pcAJN4JYo/go1qjYnfgzDnH97n9pSJJzdoLCYUPy31NYqbnyIdV/89f1TzDGDEl975BkilvAmh2d58H08cYCGIrCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+dwAwXQNRiRgxilg1XNT9F0+Ef21tghMAjjMsaUNFk=;
 b=PqvutP4zIZLD/EXlo2IJ2kYVGwBGSODoIrSVhA00c5O46HTBjpnrzW4JZIKMoRysoAzdT0aal71jxJMA5PmZgSfIhe1gXSJ79NEiFJweb1yWJAi7kvv4DQP8Yu6muhvBRAclIJs1X1Ba+KdWl+Ld5JUEjsCDT+Q4cROcp8cFq3Wno+IgE+zaQ6fVS/PHSPssiKXo0H17YZRl7nsl1tuJmwx4MrO1YnlEmITAFUtXgk6dR+YvUUFoC+kdFgyUYhljXJ01SRdqGzmS9GeoDdd/jzIIHterydR6COCFn7XhBGGiwHQTALuAj9IJXAOrPcooN5Vn7MaXpzDZidqfwtBusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.33; Wed, 26 Jul 2023 10:40:26 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 10:40:26 +0000
To: <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 0/2] Add Microchip PolarFire SoC Icicle Kit
Thread-Index: AQHZtL+pev03FU4Ep0uRngk7CMHqm6/L8baA
Date: Wed, 26 Jul 2023 10:40:25 +0000
Message-ID: <79b08a0af8531d80333d47777aa90747e9f5420b.camel@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
In-Reply-To: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|DM4PR11MB5280:EE_
x-ms-office365-filtering-correlation-id: ddce1a02-4745-4a7e-4f91-08db8dc4b8e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0V1pKn/D6qfc+0DfSrPyoCQ7EWGEK5nC3mio0JHU/laUrHGqRPLo/JdWux32DPTg22eZlXgSNHj+gxogOVhcWTS8xe8DjAqd2a2Vm9qpkWJogkDmaJ1xytre7EHRhx0HP1TtLOwAmkdSV+bLu4DKwPAY9gP6BHnoLEBPWO2UF8L5W35ofW6Vm/foF/IPgeZKNaq6+LzPTnXTNQrmlSTuOc4/zgaq3A3AlnDdQF9SccWTPbV7p98n98+bP52I0Mq8ymgllIAfbBQu5vd2B/+EC37xO1otFWXA9nEiS9jwqULb6GoC2mroVWKF90lF2wPBEF3WUrsDRZ2UC7RHA8pXaeZIOfROLRS5/k8V/2JAyDWg9M/+ZX/AragV4zVGXXvKVsUz2JYcoo+quOTDDdPGNEwsY7DNpH0zubkUyej995lX8YwPOUovnF261W1OEgbsiPqvoo8nzWZKK70jsH41WPrBy8ErEgSubd9ayiDPJtHiIa2iG4jxW26AySxMTDlMU48I62qoSoWIWvjorwZWz/iVanTo/nc+DU/CeXnsATWKaKr6IB0Apj6d8RDOh6IIsBggN7eoaQL9l3MYe+jJdrQjT8fAA7RzlcKmnXj1g4NNJ59PhgYhuIRdYcjTqK/r
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(8676002)(8936002)(316002)(5660300002)(41300700001)(6916009)(4326008)(91956017)(54906003)(2906002)(66946007)(66446008)(64756008)(76116006)(66476007)(66556008)(6486002)(71200400001)(6512007)(26005)(186003)(478600001)(6506007)(86362001)(36756003)(2616005)(107886003)(83380400001)(38100700002)(38070700005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2NJNHZJdUVqMGg5dDA0UkxhNVVrMjFOeDRoY1RnbHBuZFBJZEh1NTNXTXhE?=
 =?utf-8?B?TC8zYWlRQWVFbCtramcvM3lEcGtFNExybE1FQkgyTHdhRTM5VDQ0N2EvM1Uw?=
 =?utf-8?B?NEkvMy9PdDlFK21EM2hwenp5eDJPQkc5S05scFdoQlNpNkZYMWM1ZERDMGJV?=
 =?utf-8?B?YmY5Q0ttbWd3YTZQcnJQV05NcDlqUEx2WEp4djl5VEwramZFMnNndU9MNEp4?=
 =?utf-8?B?clltNVBaU3lUUjZPZWlBaFBtRkF2aVd1SFl5eUxxRFlobExBZlRRMjA0MHpk?=
 =?utf-8?B?NlV4ZEZieHMzUWZpUWNKTm93NmhNeWxoWkFSdCtYUnh1RlFWTFNqb1ZGVWhy?=
 =?utf-8?B?V1dCYkhudEhGaFpSWEtua0k4R2J4a1FDZlNXbDdXWTYxaURDaTdBZVRhTVRv?=
 =?utf-8?B?V0ZZSzVJRHhtZ3ErMFhlNk40M2ZOTThsSVNtTHdHMHBLejl0dXI3Znc2ME9p?=
 =?utf-8?B?UmJhd2dMbXNRNHJWQWZSUWJOZzBoL3pFTmNuWjRvQ2R4L0lVZ2pnK00zc2Fy?=
 =?utf-8?B?ZXJXcHZMbVBaTGRRTjA1WVYrRmU3UDRzUFVBKzYrd1VHcHBHUTd2NCtlWHh6?=
 =?utf-8?B?dnBvZ0M0YXE1c3oxK1MzU3ZKUG1iYlBpK1ZxQlk0WjMyeTJrT1BsQThCRm9t?=
 =?utf-8?B?Z3lZRzVFOG1PWmNxdUdjTHVEckxZaXFYLzFpN3B5bjBxRlhLeUZodFNXRTJV?=
 =?utf-8?B?eldXZHh1Wkp1WFBXZW9sS0JZZ1JqMlJiaFE2aG1XeUljdmRJK0RjTmRmL1VK?=
 =?utf-8?B?L3o5ek00dFF3Mjh4V1lvM1l5YWhSMnNtdkYyaHN0MGtvRTd5aXR1b2xYK1kx?=
 =?utf-8?B?NnQrejYzNVhxcEJhbi84RW4vaU53TEVKNjlCZ3g2OXBqSjI4VlBscElQbC9h?=
 =?utf-8?B?eUN0L1gyd3JnbjYyOWR6YWdsQ2diNGJ3R2F6S29VcHVkM2ZXdHZMUW11TE9O?=
 =?utf-8?B?MzF3VGhXZmFBODI4V1FqdjB2MVZmSzlFTEI4a0FzK0xpWmJ5OVlBMHRXR0U0?=
 =?utf-8?B?UmdhQ2QzV2FIT0ZPek82c1B4MFlWdGhSb21CVnowdHA3bkp4bUt1RTJGYjBv?=
 =?utf-8?B?UGc3YmNIK3BQTFpWQnBZeTl5OWJKcVBMc0VhcXdrMEhBL0pGVGNuTEJyYVYy?=
 =?utf-8?B?eUZhU0ZWK3hQY0RyWStvWmtWNldhSTlSYTZwVk40YUxvdTBQbWVtOFRQOUhF?=
 =?utf-8?B?Vk80Qm51V2NRYUo2UTVvTTRXaVBWVjdzUXF1NEdWSVhPVUpBQnE2NlR2MlRq?=
 =?utf-8?B?VFBJbkxBaUo0TnZqSUFDVFFEb1kva1N4SzdGOGRiME84RFRIKzFYdzV4dkFv?=
 =?utf-8?B?NElmRDdUbk91WXhGWWtnRExvNlBpQitHTlhYc0srSElsbm9kV0d6bGkxNzhj?=
 =?utf-8?B?ek01eWdZd3UvTVQwMmtnWVNnc0w1MWMxdjJncjRGcDRsSm9FNDA4NEc5V1VY?=
 =?utf-8?B?bEVlVDdkaWhFT2FYeGtkaTIxUHkrT29uQytNRFpwcEw3ZStPdytyZ05WUER5?=
 =?utf-8?B?Mm9YejJJWTcySWtxb0o2WGNNc01uRGVydklHMFlaenlKamlleG5VZnVLWklR?=
 =?utf-8?B?ZWpmZFNQaFE4TzBDS1BZUTUzWWJWSEJDdVJpZElJQlI0WHlISGlBenpTRDZn?=
 =?utf-8?B?TVhkODdTY2dQR21OTDdvTjY5eExmWUlLMEN6dVRIbjBoNDJQQlV2aFhqZlox?=
 =?utf-8?B?U3djVkFsckZLUHUwOXoyUHJtdW9zejlaS1ZjZ21HRTEyR0N6aEJoSWd3SjRv?=
 =?utf-8?B?MndtaUUyZGgyUCs4RVBxellXeFBHNHFxeW5FRjVGWXVQRmdOVkVlRWtVY3p3?=
 =?utf-8?B?dm0vS000L0RrR3Zpd3ZDc093VExhTG9yMTFmQVhqZjdQNWE5U3F3OVFqWGhG?=
 =?utf-8?B?WEZYZzNrODBYSmVPWEp3Um5qN2M2MFBSUnJSWVFFMWQvNU90dkE0dlJXb3NM?=
 =?utf-8?B?Q1hrRTU0MGlKU3BXZjdBUWtVTGVBVzU4SVU3V1JaY3poclBSSmdkL0xERk1t?=
 =?utf-8?B?aTFFZ0FVekNPL3NKQk1DYWJFSnBDcGZpVGhQZnJ6bk5RdGovQ3VsQ2R5bFVm?=
 =?utf-8?B?VWdHb2JkdkNsbW1HQmdDdHB4dCtBdU9aV216K0Z4OHc0TFBEL1VlYjVFaEND?=
 =?utf-8?B?U08xYkw3Mm5hbm1VMTBYdk9ZS2lXUmtRKzlQeEpjeHVSYTFScUc4bmxpY2k2?=
 =?utf-8?B?SEE9PQ==?=
Content-ID: <A8B0DFAD6586BB4B8B02A837B3F6406C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddce1a02-4745-4a7e-4f91-08db8dc4b8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 10:40:25.7692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZwPqBeNf+sywm4S4Yq46ULuNSB9NS4uekCqC7Gj/6IFLH3au/gyac/GynHwme0e6Q3pEoTwVIUWkSQk4M02csTlnyDzXkrZBpF4eRyKtNZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1690368468; x=1721904468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=i+dwAwXQNRiRgxilg1XNT9F0+Ef21tghMAjjMsaUNFk=;
 b=U/FsvJ3bCRHcCyeUHPwL2UXwvPdpdh0DtzmXcWusrRjmRzU6XYRK3w0N
 BvOOse9J5nNokryzA/tf7ceiTh8QWYsG2Cc5dpdSoGAThrnwvbF5gCX3Y
 teH/LmL6vFSV+kDVtjREpHsoFNeNuHT3gmSxtlWI3NPr28Ss2EMLhcshw
 QlHHs/YqOs4kSw2tABch4MTKffQALIddhetvGHA45GDzOWsLksxjyPLhW
 GIObCXGkmKVwywrtq/8C5VqoAClGAYemfTKW5eyIJaMiSjk6UIU2g++LA
 cP1vTL6gkRtuQhKeyA2y1f1cVJXNviblJrV3hkYbFFFEfhzzcQ/O2AggJ
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+dwAwXQNRiRgxilg1XNT9F0+Ef21tghMAjjMsaUNFk=;
 b=Vwhi+abRUt69TBYZxX5vGIILUsvAU1m+0PK7MD/x6E9jmb2VFQKYpYo1cuUiFHhUyrWqCvQlFutVt5IqD+zQx2H0DOhT89BCRp37sUyIVTJkUcwtcqeO2TYGMaPatFhlG074NK8J1zXXdU1C8Q/bVQfDWAe1VgwTNme7nvp+ay4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=U/FsvJ3b; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=Vwhi+abR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v3 0/2] Add Microchip PolarFire SoC Icicle
 Kit
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

SGkgYWxsLA0KDQpKdXN0IHdvbmRlcmluZyB3aGF0IGlzL2lmIHRoZXJlIGlzIGFueXRoaW5nIG1p
c3NpbmcgZnJvbSB0aGlzIHBhdGNoDQpzZXJpZXMgdG8gZ2V0IGl0IG1lcmdlZC4NCg0KTG9vayBm
b3J3YXJkIHRvIGFueSBmdXJ0aGVyIGZlZWRiYWNrLg0KDQpSZWdhcmRzLA0KSmFtaWUuDQoNCk9u
IFdlZCwgMjAyMy0wNy0xMiBhdCAxMzo1MSArMDEwMCwgSmFtaWUgR2liYm9ucyB3cm90ZToNCj4g
SGkgYWxsLA0KPiANCj4gVGhlIGZvbGxvd2luZyBwYXRjaCBzZXJpZXMgaXMgdG8gYWRkIHN1cHBv
cnQgZm9yIE1pY3JvY2hpcCdzDQo+IFBvbGFyRmlyZSBTb0MNCj4gZGV2ZWxvcG1lbnQgYm9hcmQs
IHRoZSBpY2ljbGUga2l0LiBXZSBhcmUgYWRkaW5nIGFsbCB0aGUgbmVjZXNzYXJ5DQo+IHN1cHBv
cnRpbmcNCj4gZmlsZXMsIGluY2x1ZGluZyBhIG5ldyBkZWZjb25maWcgYW5kIG9uZSByZXF1aXJl
ZCBob3N0IHBhY2thZ2UsIHRoZQ0KPiBoc3MtcGF5bG9hZC1nZW5lcmF0b3IuIEkgbG9vayBmb3J3
YXJkIHRvIHJlY2lldmluZyB5b3VyIGZlZWRiYWNrIG9uDQo+IHRoZSBzZXJpZXMuDQo+IA0KPiBS
ZWdhcmRzLA0KPiBKYW1pZQ0KPiANCj4gQ2hhbmdlcyB2MSAtPiB2MjoNCj4gLSBjbGVhbnVwIHBh
Y2thZ2UgbWFrZWZpbGUgZmlsZQ0KPiAtIHVwZGF0ZSBVLUJvb3QgYW5kIGtlcm5lbCB2ZXJzaW9u
cw0KPiAtIGFkZCB0byBEZXZlbG9wZXJzDQo+IA0KPiBDaGFuZ2VzIHYyIC0+IHYzOg0KPiAtIGFk
ZGVkIG1pc3NpbmcgaG9zdCBkZXBlbmRlbmN5IGluIGhzcy1wYXlsb2FkLWdlbmVyYXRvciBwYWNr
YWdlDQo+IC0gcmVtb3ZlZCB1bm5lY2Vzc2FyeSBwYXJ0aXRpb24gdHlwZSB1dWlkcw0KPiAtIGFk
ZCBtaXNzaW5nIHBhY2thZ2UgdG8gZml4IGJ1aWxkIGVycm9yDQo+IC0gZml4ZWQgc3R5bGluZyBl
cnJvcnMNCj4gDQo+IEphbWllIEdpYmJvbnMgKDIpOg0KPiDCoCBwYWNrYWdlL21pY3JvY2hpcC1o
c3MtcGF5bG9hZC1nZW5lcmF0b3I6IGFkZCBob3N0IHBhY2thZ2UNCj4gwqAgY29uZmlncy9taWNy
b2NoaXBfbXBmc19pY2ljbGU6IGFkZCBzdXBwb3J0IGZvciBNaWNyb2NoaXAncyBJY2ljbGUNCj4g
S2l0DQo+IA0KPiDCoERFVkVMT1BFUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1ICsrDQo+IMKgYm9hcmQv
bWljcm9jaGlwL21wZnNfaWNpY2xlL1JFQURNRS50eHTCoMKgwqDCoMKgwqDCoCB8IDYyDQo+ICsr
KysrKysrKysrKysrKysrKysNCj4gwqBib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvY29uZmln
LnlhbWzCoMKgwqDCoMKgwqAgfCAyOCArKysrKysrKysNCj4gwqBib2FyZC9taWNyb2NoaXAvbXBm
c19pY2ljbGUvZ2VuaW1hZ2UuY2ZnwqDCoMKgwqDCoCB8IDM0ICsrKysrKysrKysNCj4gwqBib2Fy
ZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvbGludXguZnJhZ21lbnTCoMKgwqAgfMKgIDEgKw0KPiDC
oGJvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNsZS9tcGZzX2ljaWNsZS5pdHPCoMKgIHwgNTMgKysr
KysrKysrKysrKysrKw0KPiDCoGJvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNsZS9wb3N0LWltYWdl
LnNowqDCoMKgwqAgfCAxMyArKysrDQo+IMKgYm9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL3Vi
b290LWVudi50eHTCoMKgwqDCoCB8IDE2ICsrKysrDQo+IMKgLi4uL21wZnNfaWNpY2xlL3Vib290
LWZyYWdtZW50LXJvb3Rmcy5jb25maWfCoCB8wqAgMyArDQo+IMKgY29uZmlncy9taWNyb2NoaXBf
bXBmc19pY2ljbGVfZGVmY29uZmlnwqDCoMKgwqDCoMKgIHwgMzQgKysrKysrKysrKw0KPiDCoHBh
Y2thZ2UvQ29uZmlnLmluLmhvc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxICsNCj4gwqAuLi4vQ29uZmlnLmluLmhvc3TCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSArKysrDQo+IMKgLi4u
L21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3IubWvCoMKgwqDCoMKgwqDCoCB8IDI1ICsr
KysrKysrDQo+IMKgMTMgZmlsZXMgY2hhbmdlZCwgMjg2IGluc2VydGlvbnMoKykNCj4gwqBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL1JFQURNRS50eHQNCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL2NvbmZpZy55
YW1sDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNsZS9n
ZW5pbWFnZS5jZmcNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvbWljcm9jaGlwL21wZnNf
aWNpY2xlL2xpbnV4LmZyYWdtZW50DQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL21pY3Jv
Y2hpcC9tcGZzX2ljaWNsZS9tcGZzX2ljaWNsZS5pdHMNCj4gwqBjcmVhdGUgbW9kZSAxMDA3NTUg
Ym9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL3Bvc3QtaW1hZ2Uuc2gNCj4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL3Vib290LWVudi50eHQNCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL3Vib290LWZyYWdt
ZW50LQ0KPiByb290ZnMuY29uZmlnDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvbWlj
cm9jaGlwX21wZnNfaWNpY2xlX2RlZmNvbmZpZw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC0NCj4gZ2VuZXJhdG9yL0NvbmZpZy5pbi5ob3N0DQo+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWljcm9jaGlwLWhzcy1wYXlsb2FkLQ0KPiBn
ZW5lcmF0b3IvbWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci5taw0KPiANCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
