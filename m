Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74824C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 10:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19BF941193;
	Mon,  6 Nov 2023 10:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19BF941193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZzYvrSRi6Ay; Mon,  6 Nov 2023 10:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0C2041465;
	Mon,  6 Nov 2023 10:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C2041465
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47F191BF316
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2034382081
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2034382081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6deP6MhXSqZ6 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 10:44:16 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7A0A82080
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 10:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A0A82080
X-CSE-ConnectionGUID: cDtrofV9RgWjya/pVKc20A==
X-CSE-MsgGUID: sm/JhnAOTZ+duiQLpq6dmw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="178370562"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Nov 2023 03:44:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Nov 2023 03:43:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Nov 2023 03:43:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWH9ei25hU5ai2K5csNEtsEcBJLUGM2J+za+oysKoqDA40H5Dzm44xcR1Rj2M23ThVaP3EbGtGI450TFGybdS/235iDjG/T4YdGyyd4ZiKzCxKIL4/R5Bod2pbgVzK0m0DAqNYDaTe/BzcWo7lCM9MQ/sv05NI8qpqmwsTjjG1cIcWwFGBLspEZV0aPX7sm4RgmBPU4Ro61szpy7VIDjAXRJTfOIlFl4pnPwaFIR/bWx2Wff2BYSmsYcgHUlebfh7GdzCt7eXP3Zk2bCJ/TLkQQASZXmoEBfJk8aKAz101s8yM5X6QktdWHWIjPS2mgu+AWYFRSc76sjV9XjetPo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pi35wZTzk/K52dpCADgc6UCQmPmNwZTX3nO02e7L1IY=;
 b=XIAmD9kqglu5/nt77Yz/DwN4LymYo7hI94iagd2vCZZeDfYJ6sgyaybZnE/QvvaoCTChxEe92NkfhrejK9O69i8MCR8jN61TftixAf8L2XuVyhkFMho69IqqKT2Z0e/FHmdmCvBn9UHzlXEkIn9mTsdiHwkNqFNWFI9NR7GM64zJ4WRePhGFNspMwbvX2v+eawnHoG576oCdqW4y1j5IYVZw/aouqB52uM9T0vovunX0diU8cQ/pF2MIvoL8qxHafiutBESwoTHI4GsvtPvXNgj5B9duOdcECtwP/1usGwljbMnHaZEkc1VV7MCTljy/Dg9LUrZW2jpPQSpXsve7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.27; Mon, 6 Nov 2023 10:43:49 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::10e7:a440:f9c8:2a5a]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::10e7:a440:f9c8:2a5a%7]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 10:43:49 +0000
To: <baruch@tkos.co.il>
Thread-Topic: [Buildroot] [PATCH 1/1] package/microchip-hss-payload-generator:
 bump version
Thread-Index: AQHaEJu57/KfmhQEDkejKvTwBUt6H7BtGesAgAABTAA=
Date: Mon, 6 Nov 2023 10:43:49 +0000
Message-ID: <4947ee47977fb381b243c4dd4a23f94cb52c82c7.camel@microchip.com>
References: <20231106102651.2796878-1-jamie.gibbons@microchip.com>
 <87msvrf9lp.fsf@tarshish>
In-Reply-To: <87msvrf9lp.fsf@tarshish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|CY5PR11MB6344:EE_
x-ms-office365-filtering-correlation-id: ebbef92e-c70d-4083-6133-08dbdeb542cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UTuHRRy60SE/dczXHKIgziH3jkwUQ0Wajv2NQKw3L9l+XS91tKrskG61K/SAz1LGvT7khNAIG9zfj8wWR004uk8bgkAqXhKTobyyujElMUO1oH9FxxlBqf4MO67AB63//4+D0yjBEJGzRC4mKH6zFfN1KBZKfYyKKfyb/tRNzv0jf6MnZ23QIQEzmx12tN5cJldu2toXljZkQEKuQYzdnOQ7d1hSrounUPuNLr7mTuRubFFT82JtNSdwlLXVYnCj+iNBTCnGPTbOLvUKY8TrLmdE1osoIaTjSRdoEW6pCzx+Ij13b/DLckE3/loVDhE0AAZ+w6Q8ufSoBpQoOr73UY6yayBlvEiayh/jWvuUBMyLlw7LjIa4igiy5yf4b8TzZZVjjdpDU/JZEqbwxY07HowdSr3vOKcNHo3L9Hx7uGZYDrrBQU3vgK1hdLoRodvJH31PW5vQ4oRi8m5f3MB2bbtN0H9zJGtamFF4AIPziIaEPQ9EgsZXiAvP7FUei6t6R7Lf9K/E8x2TK3V6+Wag+Wts31tJ2IggfOMJCKY9Mr5H1A3gQtkWCAkgq8pjNLIWlnfhrKWApCmicoP9KvucKsz30LCTN9KkBxf3dhefgxNZ9JDyu4XWyjrz0R952T71Jim3aGb1XQiuYRZV7WZ3vQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(186009)(1800799009)(41300700001)(26005)(6512007)(2616005)(6506007)(107886003)(36756003)(38100700002)(86362001)(122000001)(5660300002)(6486002)(966005)(2906002)(8936002)(83380400001)(316002)(71200400001)(8676002)(4326008)(38070700009)(76116006)(54906003)(66556008)(66476007)(66946007)(66446008)(478600001)(64756008)(6916009)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTBVa3NQdnF2YXR6NnBFLzdySy9sUDNEOCtNZGYvWjhubjR3V2psVTg1VG52?=
 =?utf-8?B?Nncyenc2NW9RaEI5TlQ5NnFZVzNzd3ZCSWNYWUk1ZWpTQ2tUcE5kT1RjQWZx?=
 =?utf-8?B?L0ZXaW1xc3dZS1g2NUwvdW81Y1B0d1VIRlVaUDAybytKelp1SUM3NTd0OFhG?=
 =?utf-8?B?c3Z5M3V2czBma21HL1ZQUjhhY1N0RGczcEJCVkQrQnRNNGQ4SHdNS3dsTnJH?=
 =?utf-8?B?ZUx4U1FQZlBYSDdleUtORUVzbmR1QkJtVHl0NlBMc1drMEFvZkRrOVo5RWd6?=
 =?utf-8?B?TTh0UDRhbmt2MURjVHp3MjhKRHpnd3BYWEZFMUtXL1pOZCtXa2RzQldZYVpQ?=
 =?utf-8?B?VzVwSk1xMmRadjJ6TCtYOWt4YmFKVDZFZ1N2YWxlK2J3WFhmcmRrbmM2M1U2?=
 =?utf-8?B?a2xFSW5GUUpsend0L21wMkF0Mkl0Myt6WWx0eUFSNlVtcVhiNStwQzhENGk1?=
 =?utf-8?B?OHhjU01ZMWNtWkhxSzRONW9iVS9Tem5aYXNXZDYySVhWcFdyYko0UGpDV3lL?=
 =?utf-8?B?ajhzb3JFM3lvRGJIa3pMbFRkZlQ2WkYzOGhWWW9tV0NrVWRxcEt0OVhGMUEz?=
 =?utf-8?B?Q0N3M3Awcld1bmZMM3FPMDNLRkhHeEpmQkxYN25XRWtwai9uYmdraEw4YzQv?=
 =?utf-8?B?WFZnNDltWHhaTDVJejEwWjBIekUxYlMxcG1FMk9EaUU1S2hXSmkrM0E2am1Q?=
 =?utf-8?B?ckdockovWnRDem9rb0RrZTBad0xLc0Iyam8wLzlpMENhYytLRFJ2Sm1VVm1q?=
 =?utf-8?B?cEh4dzBvZGhta0E1UytxclNIa3pVSXA3WkxDTGtPaDZERGhsb0dWZUVZQXBn?=
 =?utf-8?B?ZVFqMmNRT0NLY3dVdTQrUnNqSWZ6UzBEd0J2bHpjU2tIUXF5R3VpKzFONWpo?=
 =?utf-8?B?MHVlU0UrMFVUemlsbE9iNGVrVW1VUFNJRS9OVlBmVE9NdGxJNHdETElFa0JO?=
 =?utf-8?B?Q05EWjJMVWFYcngvS1ZFVGdmcmkxaFFlS21MSUZ5SVBvV2lDRmdaZGxwM2wz?=
 =?utf-8?B?dElheVNsVXpOUWwvVy9FcUpDdWpZaVJkSVloNy9HZmltdXdsY0hqMmp0TWd3?=
 =?utf-8?B?U091cWZJb1hZN3k2cEJxajVUM2ZsSXoxWEw4citwODg1TklnTWJ5aGw1K1Ey?=
 =?utf-8?B?UE9kWFRJY3hyT3FFWGg2MGk0TExTRTNBOHAxN3dYTmxLVDBvWEE3dGJwYnl6?=
 =?utf-8?B?eVZib0xiWVgzcUpqb0N5TVRpbkt0NWwyajdYVktRY1N0MVVnWDczTUFqcXpR?=
 =?utf-8?B?UHFwZWg1OTFUeENVbWp1K0lrdE9VYm9RQ2pIYXgzSkFyUUluU1ZaUEpaOTJ2?=
 =?utf-8?B?RHJzaHhLeVNyMzllWjJZSTVSTmQ4RU84RDFHQ1RaYnNVdHFkSFV4UXVJYm0r?=
 =?utf-8?B?cUpXbFJXZ0tqYlo4MWdhdWYxSGVwTlVmcjlPUDU5TjdpRXBFWnJXWVkrTnpy?=
 =?utf-8?B?RE9SUktESHk4SGFDUFhLOXR2V3UzMHRqWlFtcE9sMnkxai8yKzBwTmdPdENl?=
 =?utf-8?B?dVlRMW1IQjREN2ZITWNGRVZmODkrei8vWFJBWS9Wa2dDOHpGVTZ0Z3I3VnpJ?=
 =?utf-8?B?RnBGNk5hdnQxMDFYSUVsbnFnbUZWZC9Mb0ZwNXZKUk82cnFVV2ZjRTdneG9t?=
 =?utf-8?B?MVJYK2NsT1QxT1dNMHNoMHVJaDlVY2s5VWtaTHZIaUFLaWpZWWlwMG9CbE1W?=
 =?utf-8?B?K2ZYcjB6QzhKSnl6Ti9VU3FWMWlrMStBcUNsYUFRQ0s1RDBPWmU2R1lWSjZp?=
 =?utf-8?B?ZTlNaWpQZzlLdGJpYStOenM3TTdqNDU3WWpka3FaM3pZc1QzeWcxR0JlbWNn?=
 =?utf-8?B?UmFleUlIWWszZ0JTUENHczArM0Ixd2N1RXJwRDVQRmxPVExXUkhxSmhkSzMy?=
 =?utf-8?B?R3NCRmdETi90MGxKTmR3SzFSajB1eUprZmV4TXM2U1ZJR0EwbnR4dGhmdDdj?=
 =?utf-8?B?VUc3TlF6UzRXaldMYy9DZ2xwWUloWGxEZWozd3dsU3lnMmx1SGgrRE1FZlM1?=
 =?utf-8?B?V1JUeXdDU2tHSGpVSm10dVdCalFnUWRuOG5ZZXRNZ09rL3F3U3Y5ZW5wMFdM?=
 =?utf-8?B?NUtOUlJJZCt2N2pRelkvR0VZN3g5MUp2UHloM3MxWVM5S3RHdnFIdFJvbFhp?=
 =?utf-8?B?eXl1STFrUUFOdUtEZEZpNFk0TXpEVmErc2ZqWHNmZEpxK3J2Rysya21tVXpL?=
 =?utf-8?B?UlE9PQ==?=
Content-ID: <A1AD440A386F324D8B6FD66743952B03@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbef92e-c70d-4083-6133-08dbdeb542cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 10:43:49.3662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZkdUShmwNltkEWGhikg3T5lE0DIrdTB/gJDR+Yn4WCUggKO9LPW1goKkTSn9voIq2oArV/+ETZ8z7ZUGZoUSITrR5PBcqSfmTnGCBAbmHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1699267455; x=1730803455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Pi35wZTzk/K52dpCADgc6UCQmPmNwZTX3nO02e7L1IY=;
 b=POakqOWNUiYe9vxkJqGFZuy19tkHgpwO8vgbRkUV8DSX8CqYOsJMyFzo
 EP8LKhnbny/glrSC6Uk29GX05Hd33DAXfoTtO8N/eroVJaFrnJt3v67LI
 Pwe2eBnZm2pq88g22gD02gmoT1iGDtGyl0kl/xFHGa+psif32FlP1OyF9
 VUlkCUplocfyiuzvSODCwQeDt4s+uCt+FGB2tVgw599Q38UiXSF6Ak/US
 VVTCqvEhECiOreTx2Fw7gW5Cl6OhpPHbd2AImya3/sqTK/bpZUne/rAE5
 xhxIUFQxifN2qUoaA21p3nqtqnbjN4KaZ518WCCmjC4WgAzTPsVNCtBac
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi35wZTzk/K52dpCADgc6UCQmPmNwZTX3nO02e7L1IY=;
 b=MdiqjlLsblSfY8ZsEU8+i0bg8rsk2LZb4Pk6D+ah6BkeCxb2t8odDFf3PdeA2OGPexxbtrR3VQWqlgd3iornoPXG3lQXBla2Dhpu853u4GzK84V14+LBarXny09drXEQ9QjRylMZwPTl0ujFC8ITfYmpKada8CZwjG+0dwrtXtQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=POakqOWN; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=MdiqjlLs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/1]
 package/microchip-hss-payload-generator: bump version
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
Cc: Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
 Conor.Dooley@microchip.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyMDIzLTExLTA2IGF0IDEyOjM5ICswMjAwLCBCYXJ1Y2ggU2lhY2ggd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgSmFtaWUsDQo+
IA0KPiBPbiBNb24sIE5vdiAwNiAyMDIzLCBKYW1pZSBHaWJib25zIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6DQo+IA0KPiA+IEJ1bXAgcGFja2FnZSB2ZXJzaW9uIHRvIGxhdGVzdCByZWxlYXNlLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWllIEdpYmJvbnMgPGphbWllLmdpYmJvbnNAbWljcm9j
aGlwLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJh
dG9yLmhhc2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwN
Cj4gPiAxICsNCj4gPiDCoC4uLi9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yLm1rwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPiA+IDIg
Ky0NCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvcGFja2FnZS9taWNyb2NoaXAtaHNzLXBheWxv
YWQtZ2VuZXJhdG9yL21pY3JvY2hpcC1oc3MtcGF5bG9hZC0NCj4gPiBnZW5lcmF0b3IuaGFzaA0K
PiA+IGIvcGFja2FnZS9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yL21pY3JvY2hpcC1o
c3MtcGF5bG9hZC0NCj4gPiBnZW5lcmF0b3IuaGFzaA0KPiA+IGluZGV4IDY5ZTA1ZTE4YWYuLmY4
MjdkMmI3NTIgMTAwNjQ0DQo+ID4gLS0tIGEvcGFja2FnZS9taWNyb2NoaXAtaHNzLXBheWxvYWQt
Z2VuZXJhdG9yL21pY3JvY2hpcC1oc3MtDQo+ID4gcGF5bG9hZC1nZW5lcmF0b3IuaGFzaA0KPiA+
ICsrKyBiL3BhY2thZ2UvbWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci9taWNyb2NoaXAt
aHNzLQ0KPiA+IHBheWxvYWQtZ2VuZXJhdG9yLmhhc2gNCj4gPiBAQCAtMSwzICsxLDQgQEANCj4g
PiDCoCMgTG9jYWxseSBjYWxjdWxhdGVkDQo+ID4gwqBzaGEyNTbCoA0KPiA+IGY2ZjY5NDEyY2Fm
ODg2ZTg4YWJiZjI2ZGUwZGVlMWRiNzkwYzc5MGI4OTU3MWYyZjBkZWYxZTJmMzYyMGYwNTfCoA0K
PiA+IG1pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3ItMjAyMy4wNi50YXIuZ3oNCj4gDQo+
IFRoaXMgc3RhbGUgaGFzaCBzaG91bGQgYmUgcmVtb3ZlZC4NCg0KV2lsbCByZW1vdmUgYW5kIHNl
bmQgdjIuIFRoYW5rcyBCYXJ1Y2guDQoNClJlZ2FyZHMsDQpKYW1pZS4NCj4gDQo+IGJhcnVjaA0K
PiANCj4gPiArc2hhMjU2wqANCj4gPiA0NDc3NzFkNDIxOTE3NmFjYzY5YzZkOTQ1ZmY0MGEwZjNk
MGM1Y2JlNjM2MTk5MjdiYzYxYjllNTJhYjA1MTM2wqANCj4gPiBtaWNyb2NoaXAtaHNzLXBheWxv
YWQtZ2VuZXJhdG9yLTIwMjMuMDkudGFyLmd6DQo+ID4gwqBzaGEyNTbCoA0KPiA+IDBiNjdiMWQ0
NGJjYWQwNzg1ODBmYzVkOGU5NTgwYTQ4YTk0NjZiNzY5ZGI1OGFlYjE2MzFkNGM1ZWY5N2UwOGHC
oA0KPiA+IHRvb2xzL2hzcy1wYXlsb2FkLWdlbmVyYXRvci9MSUNFTlNFLm1kDQo+ID4gZGlmZiAt
LWdpdA0KPiA+IGEvcGFja2FnZS9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yL21pY3Jv
Y2hpcC1oc3MtcGF5bG9hZC0NCj4gPiBnZW5lcmF0b3IubWsNCj4gPiBiL3BhY2thZ2UvbWljcm9j
aGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci9taWNyb2NoaXAtaHNzLXBheWxvYWQtDQo+ID4gZ2Vu
ZXJhdG9yLm1rDQo+ID4gaW5kZXggNjNhZTIyZWQ2MC4uNGMzY2E5M2RmZSAxMDA2NDQNCj4gPiAt
LS0gYS9wYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3IvbWljcm9jaGlwLWhz
cy0NCj4gPiBwYXlsb2FkLWdlbmVyYXRvci5taw0KPiA+ICsrKyBiL3BhY2thZ2UvbWljcm9jaGlw
LWhzcy1wYXlsb2FkLWdlbmVyYXRvci9taWNyb2NoaXAtaHNzLQ0KPiA+IHBheWxvYWQtZ2VuZXJh
dG9yLm1rDQo+ID4gQEAgLTQsNyArNCw3IEBADQo+ID4gwqAjDQo+ID4gwqAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4g
PiAjIyMjIyMjIyMjIyMjIw0KPiA+IA0KPiA+IC1IT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9H
RU5FUkFUT1JfVkVSU0lPTiA9IDIwMjMuMDYNCj4gPiArSE9TVF9NSUNST0NISVBfSFNTX1BBWUxP
QURfR0VORVJBVE9SX1ZFUlNJT04gPSAyMDIzLjA5DQo+ID4gwqBIT1NUX01JQ1JPQ0hJUF9IU1Nf
UEFZTE9BRF9HRU5FUkFUT1JfU0lURSA9ICQoY2FsbA0KPiA+IGdpdGh1Yixwb2xhcmZpcmUtc29j
LGhhcnQtc29mdHdhcmUtDQo+ID4gc2VydmljZXMsdiQoSE9TVF9NSUNST0NISVBfSFNTX1BBWUxP
QURfR0VORVJBVE9SX1ZFUlNJT04pKQ0KPiA+IMKgIyBTb21lIHBhcnRzIG9mIHRoZSByZXBvc2l0
b3J5IGFyZSB1bmRlciBkaWZmZXJlbnQgbGljZW5zZXMsIGJ1dA0KPiA+IHdlDQo+ID4gwqAjIGFy
ZSBvbmx5IGJ1aWxkaW5nL2luc3RhbGxpbmcgdGhlIGNvZGUgaW4NCj4gDQo+IA0KPiAtLQ0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB+LiAufsKgwqAg
VGsgT3Blbg0KPiBTeXN0ZW1zDQo+ID19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLQ0KPiAtLS0tez0NCj4gwqDCoCAtIGJh
cnVjaEB0a29zLmNvLmlswqAtIHRlbDogKzk3Mi41Mi4zNjguNDY1NiwNCj4gaHR0cDovL3d3dy50
a29zLmNvLmlswqAtDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
