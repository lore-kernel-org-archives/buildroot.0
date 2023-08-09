Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5AFC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 13:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E24640CBC;
	Wed,  9 Aug 2023 13:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E24640CBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iozK51lRmzJg; Wed,  9 Aug 2023 13:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5278840C5C;
	Wed,  9 Aug 2023 13:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5278840C5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95FCB1BF37C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 13:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BE02822FE
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 13:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BE02822FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwhTkdZzPdN8 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 13:02:54 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Aug 2023 13:02:53 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B533482257
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B533482257
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 13:02:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="224597900"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Aug 2023 05:55:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 9 Aug 2023 05:55:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 9 Aug 2023 05:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oyc91qI4WM69tT30kHSw4G0iNrkiXvb+OUBH1L1u51UD8eKvRr4EGguG+GxW25mdGfrI4kULE7Y5oQ49rhxfTzbuScTbGr+z1YwxITN8qK8NSMhigMrRQdmx/CdY/0h3snpGAGkxcL2XUXGaYgBrU+woG4MjoiwuXZHcyjVhK1IV9stVyM5hIYYo43YpszYXGjD+Lb0c/i5eXkZwh2D0G/zK6aNqzVSzerd6jGbFav3Fdzvi7d3vTbwlWgo2Xe4JBP7iPstKwU1AWTC12YMvxf4nFz8qLR1NDpGiBE11zssRc7F5B1CpRVVa6w0IFa/GKjWd9zHRMAyEFNeGOkT+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdpYKzpoAE/6Wpcm3fN8zqM2s764lLTstceoeQCFwFY=;
 b=W00cUEhWyitSThA9Xx0IbnBDrqlQBWsoOR6M4ut/Z2PsSrWo1IujfRVc2BDOC0wX2WxI1CguSvUxKANTxtgbPSI0XnvRhebsl+s45uihHdyaF+uJnq3q4WsllyRhnV/FoIT2ODM8TA//t9I8O6kTX6tyaHw2i4EVbCSdkuiQFbdNfN+R+IoTsP71bg6K8O9aU2X0aBxT3C5lck1BmH+5GNS3QsX36vRYz4USs9tfx5Anx8nqLpEa0ROPgpRAsjfo8FMCej1Tup93S6byX1xAQBQJUZuRXwpV2DZPVxtGbgVISD66CDZhZDYH+zdVvp30p+wix9qvxnDqMRpNYae+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Wed, 9 Aug
 2023 12:55:29 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d%7]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 12:55:29 +0000
To: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 1/2]
 package/microchip-hss-payload-generator: add host package
Thread-Index: AQHZtL+p1fWox4yOMUGFqs8ILboSK6/hHNyAgAD7P4A=
Date: Wed, 9 Aug 2023 12:55:29 +0000
Message-ID: <c7111e1d29ff75d1bdd60861abaf0fc7ab643e26.camel@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-2-jamie.gibbons@microchip.com>
 <20230808235627.3fa92931@windsurf>
In-Reply-To: <20230808235627.3fa92931@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|SJ0PR11MB6765:EE_
x-ms-office365-filtering-correlation-id: b80852b6-dba2-44b6-bcdc-08db98d7e8b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 624ovlVTv1dK878wPPx9fsRcnoE1dpw00PwyWYA6TrXDF1LeABOfHe+foZ2nitBWwbjpzllxLIzixhMngaYm51nFAd44PheLsFAtK4aWVf9iOGzmnJO3rorgefZ3+2g00b/PqYEcQFOyT/Yd4tL4C7dV411FjQqeEvKzGkGg7zNsXvMboKb2pD2INewVeoiwmN1NmEheOxiRjQ/odxKcBm1TvzJF4LL/xBshbEmaZPFmlM5JuLEN+K99ejRaQWEo/4aMwqTHD75vywi2p+jm8mdn4drE6jJhHG11idNWGY5RpJa0j/BiG2ue63DPxpBWqjxhD0ZDLU4X973iIefUjXWNbkbok4HddOjqiT92Ng8vL83iz97JiDDHVy0XE4uy6Q2hEzEGzZWaJxy5htCJkx4u37w97CrbgfSnVXz39scbznSO2SsCFimO2kJx/9vANWAp7TYtKO5UaxNu7UwQYNUIUUw806+zt1oUE/1xPo6oOtY37vjm+GE/EIKYxuIxZ/ACHbQEaHBJ0IcKuQUg3LRueiIXOxhwkRGhiBj5HL38JKctidVn2cK7iUoUW3bX/wNkszU/zt8rhzKrSRXUUjvRwqQG6t/Rwx6h15k74DlARqpEmxXrtS9fJOF+fJpC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(39860400002)(346002)(396003)(186006)(1800799006)(451199021)(38070700005)(36756003)(86362001)(76116006)(26005)(54906003)(478600001)(110136005)(122000001)(38100700002)(6512007)(2616005)(8676002)(66446008)(107886003)(6506007)(2906002)(71200400001)(6486002)(5660300002)(66556008)(41300700001)(316002)(4326008)(64756008)(66946007)(66476007)(91956017)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXFPT3dFZnZEcUxzS294eXNUTTFZbjZscXFWaFF1OTExcEMzN2c3T3pFaFhl?=
 =?utf-8?B?dFAyU240MkpSaG9IK3N0VHZwcWJTbjFpN01VWEVzS1IraEtjeFR6RmhPS3lZ?=
 =?utf-8?B?eHArbGxSVWFDdkFFMGlJODFNN1ZpdXFrTG9DYVExR0hNMEVKZEswcjdTVEJx?=
 =?utf-8?B?bjhhVkVVOUxrNk9UR0M4cDlXU3l3YktDUDNXc25NSU1QMjZrKytRUzBROVFY?=
 =?utf-8?B?Tlk1WmdDQUxiWHVJMkxMdFRNc0JxUVhKdXdMOFNwZW1xbUdSL1hQYWozMm1V?=
 =?utf-8?B?WHcvelNLTkJJWEpJUVQxOEN5UWZPdnVHaFF5NXhWeS81NjkrVnNpNVBrTlVy?=
 =?utf-8?B?bE1ZT25ydkVMM05IQ3p5c1JoeXJWNHprTTlDY1liTmhFTmpCdzBvbk8waTNw?=
 =?utf-8?B?WXBMSURORFFET2NpckRLTjQ0N1lsakRRdUNKV0dVdXRZaU9wOGRaRG92bmpt?=
 =?utf-8?B?SnZxNnV3OHcxVldEV0daK1dVcnVqa05Ba3RqRU40WVRrMUYxbU9PU1BUck5J?=
 =?utf-8?B?TVF6bUhIblFhOHZ6K3FzZU1iOE4yTUdRNTBtN3lwblhjYTlNald5ZGVjaGpN?=
 =?utf-8?B?WVRhN25VVmVLWExjeTBrV2hxZysySndQR2FDbXlTSk9WdS9RS1hlR1ZHWml6?=
 =?utf-8?B?VXpmQk9TZEFPd3FsUW12RnF2NG5QOFBiUTZSaXNxeEtRU3NLMWlGc2hzRE11?=
 =?utf-8?B?N0dZczZnKzhnM1EwTFF6bzNqTzdpKytXall4eEFtUlFReVRwN0k1bVdLRkQz?=
 =?utf-8?B?MmFOL0tsY3RTbzJQdndrVkM4UkJWQUlsbFhPUVpZZENiMHFNdHlJempSUFJI?=
 =?utf-8?B?YmE5NU9CcmRvdWRTTmNqa2ZQalBhUzIxNDVuV3FXNW9pZlJheU5yeTlUUW5L?=
 =?utf-8?B?elpJVzYyWlJ3QUFHRlR3aHl2VFlEM1JkSE03MGJ2M0hLZG5WK09meUdvUnZN?=
 =?utf-8?B?MUQ1R3p0RVp5Yjg4aGdKazNEUDhsVVVLNUZzM2VWODZGcW5oSnNxTyt1RjZX?=
 =?utf-8?B?Tm9aSEtEaDl4ajhWQmVJc2c2OFh5U2ZlTU42Q2tqU0VWby9pVFNqeW9vNGQ0?=
 =?utf-8?B?Z0F1ZzVYQ0psYms2c2tDUzRRZFBGR0tONFVqWlcxeDhRUjFXNnFORFNnR0RN?=
 =?utf-8?B?SXZuSVovaHBlVE9DRjYrblRvTUYxRU55RmVYemd0K0dYbjE0N20yQ2lvOXVU?=
 =?utf-8?B?NFF4SldQaHllQ2p2dVZuTzRwL0NxWThUbGJ6WlZhSExCVlFlOHZ4SFpvbW1v?=
 =?utf-8?B?NW9zd2NwT2NNTm5wUVZzaFpJY0NuMHlqeGsvdXo1YUh3blFWQjZFNUFoZDlI?=
 =?utf-8?B?K0d2WlMxelZIUXZhZ25nSTZ5Zkx0WmRaMWZqb2hNMjR1MGdndXVEd1dncEVh?=
 =?utf-8?B?S3VQakRNeDZZWDZDMVJyLzdFMlRUdmNLQUJEUk5nUWVBWUV6OWY2aVNCcit6?=
 =?utf-8?B?Ykgzc3VXVm01R2cvTWFLUzZvTXptQ2YvSzRnMUFGczRtVHN4TC9WSjd4TkZL?=
 =?utf-8?B?ZU5uT3dVVC8wdjlwWWlVSi9zYThkUkpOWG84aGpLNUJKTW12T3VYdHI1Qm9U?=
 =?utf-8?B?alVHNWhtRVBRL1hnaHRWRWxDT2tFMzUrczJJNTZHVTBSSHNoT2hPUG80NHJr?=
 =?utf-8?B?RmdORkdNd2NySWwyNFJ6ajZPaE5Vb0NKaUZvQU5PTEhBNjMvSzhhZzlRT09C?=
 =?utf-8?B?YzBiMmxxaERlZXo0UEQ5R1JHUDZlWnN0elJ4WWtqZmNCT2J2NGxrQW5Kb2ds?=
 =?utf-8?B?ekw0NDhBZ21MbHlUU2V1MWx6V2NhR0lkU2hxM01SeFhBayttUzg3VHQ5Q3ow?=
 =?utf-8?B?NFozdE1QUFJCUlBkNlhCV2ExOFkyUzNXZmpGK0xZeFRQS3d0MzhQSUNoRjdR?=
 =?utf-8?B?UFFXbVVYZWFpNUwxSENyTUpwenJ3UEl0bDFhWmJaMGRLSHpvb0RjYm1tWWx0?=
 =?utf-8?B?VXF6RmY3SnlPQUZLVWVKU1k0aGlSMFRwem5lR2hYbkVxTDB1b2NBbDBnOHRE?=
 =?utf-8?B?MWwwMWVIYStUWURrVXV5OXB4anU3VktmOVE2eWdna0NrWlRPSWVsaDZ1amph?=
 =?utf-8?B?cEh0WE1ZbHU4a1RPTFpEdktnSXdvbS96Q29vS0FwZ0k5OHJ1bUlHZHRLdXpy?=
 =?utf-8?B?YVAzV0JyMDcyR21NeGVERWlwK1pVNVlPTi9DNlZrc3dvcVo0UTNnRFhmdGRo?=
 =?utf-8?B?cHc9PQ==?=
Content-ID: <0E4FF62477D68D40B449E131E6D48828@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80852b6-dba2-44b6-bcdc-08db98d7e8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 12:55:29.2022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdWkN45IE4xWreHK8SDW5+AF8Bpd8PiemCwybdPDdvy50g1vVZYl9+AGi0WbH/XwyTEDZ+xElzcAtiWUWL0NhmSfQmVf4Pc65W6p0UIdNtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1691586174; x=1723122174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=bdpYKzpoAE/6Wpcm3fN8zqM2s764lLTstceoeQCFwFY=;
 b=eptbgpByd3trfoY7vdLIGYdnWYwk31fa+JC/Kty/UQX3d01GvERM6GxC
 D3GlG9MT4PbzsMBYNriq+nF7cANsVCrgDMXjQ3D5eAuKfp7iSg1sba6Ht
 StDVmzRq6lvofbSiDTobznQ6VQO+SkOMxqIBu7ZYZctoznvceDqstXiGy
 i4iIftB54BOsCyLRJrBQxyKPfzvMhdyD+rNuBfn2PigiAXEZDy7JQtniX
 q/OtDKKrH2yDKsmiCEmzdheS5NB3+oAeRKSpFHAAW1kz1uSpdOZy5l9d6
 O5snW8Ow7teKPe2xdNLjHc/jsRVCci1FraLZyX84/669LjDBdPTANNhhr
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdpYKzpoAE/6Wpcm3fN8zqM2s764lLTstceoeQCFwFY=;
 b=iUGxEfPwPtTkEo3QYrs9S08+sPRNPDU2QyGDCv4NUH6cBHmBaWNO1S0VHnJLtgX9nPtST3duyEAcKHxfpY3aOGoGCrZyhXYX9nTc7qnCH1uV6PgQg0cqYKJQOavHMcSLTaJjG1DlVgfgdH0fiIGYYHGWgfEHuLcMl11wCE1XuO4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=eptbgpBy; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=iUGxEfPw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v3 1/2]
 package/microchip-hss-payload-generator: add host package
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
Cc: Valentina.FernandezAlanis@microchip.com,
 giulio.benetti@benettiengineering.com, Ludovic.Desroches@microchip.com,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQpPbiBUdWUsIDIwMjMtMDgtMDggYXQgMjM6NTYgKzAyMDAsIFRob21hcyBQ
ZXRhenpvbmkgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0K
PiANCj4gSGVsbG8gSmFtaWUsDQo+IA0KPiBPbiBXZWQsIDEyIEp1bCAyMDIzIDEzOjUxOjUzICsw
MTAwDQo+IEphbWllIEdpYmJvbnMgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5v
cmc+IHdyb3RlOg0KPiANCj4gPiBUaGUgQnVpbGRyb290IGljaWNsZSBraXQgY29uZmlndXJhdGlv
biB1c2VzIHRoZSBIYXJ0IFNvZnR3YXJlDQo+ID4gU2VydmljZSdzDQo+ID4gKEhTUykgcGF5bG9h
ZCBnZW5lcmF0b3IgdG9vbC4gVGhpcyB0b29sIGNyZWF0ZXMgYSBmb3JtYXR0ZWQgcGF5bG9hZA0K
PiA+IGltYWdlIGZvciB0aGUgSFNTIHplcm8tc3RhZ2UgYm9vdGxvYWRlciBvbiBQb2xhckZpcmUg
U29DLCBnaXZlbiBhDQo+ID4gY29uZmlndXJhdGlvbiBmaWxlIGFuZCBhIHNldCBvZiBFTEYgYmlu
YXJpZXMuIFRoZSBjb25maWd1cmF0aW9uDQo+ID4gZmlsZSBpcyB1c2VkIHRvIG1hcCB0aGUgRUxG
IGJpbmFyaWVzIG9yIGJpbmFyeSBibG9icyB0byB0aGUNCj4gPiBpbmRpdmlkdWFsIGFwcGxpY2F0
aW9uIGhhcnRzIChVNTRzKS4gQWRkIHRoZSBIU1MgcGF5bG9hZCBnZW5lcmF0b3INCj4gPiBhcyBh
DQo+ID4gaG9zdCBwYWNrYWdlIHRvIHN1cHBvcnQgdGhpcy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1pZSBHaWJib25zIDxqYW1pZS5naWJib25zQG1pY3JvY2hpcC5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IFZhbGVudGluYSBGZXJuYW5kZXoNCj4gPiA8dmFsZW50aW5hLmZlcm5hbmRlemFs
YW5pc0BtaWNyb2NoaXAuY29tPg0KPiA+IC0tLQ0KPiA+IMKgREVWRUxPUEVSU8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDMgKysrDQo+ID4gwqBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+ID4gwqAuLi4vQ29uZmln
LmluLmhvc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxMSArKysrKysrKw0KPiA+IMKgLi4uL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5l
cmF0b3IubWvCoMKgwqDCoMKgwqDCoCB8IDI1DQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+
IMKgNCBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspDQo+IA0KPiBUaGlzIHdhcyBtaXNz
aW5nIGEgaGFzaCBmaWxlIGZvciB0aGUgcGFja2FnZSwgd2hpY2ggcHJvdmlkZXMgdGhlIGhhc2gN
Cj4gb2YgdGhlIHRhcmJhbGwgYW5kIHRoZSBoYXNoIG9mIHRoZSBsaWNlbnNlIGZpbGUuDQoNCkFw
b2xvZ2llcyBmb3IgdGhlIG9taXNzaW9uLCB0aGFua3MgZm9yIGFkZGluZyB0aGlzLg0KPiANCj4g
PiArSE9TVF9NSUNST0NISVBfSFNTX1BBWUxPQURfR0VORVJBVE9SX1ZFUlNJT04gPSAyMDIzLjA2
DQo+ID4gK0hPU1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9TSVRFID0gJChjYWxs
DQo+ID4gZ2l0aHViLHBvbGFyZmlyZS1zb2MsaGFydC1zb2Z0d2FyZS0NCj4gPiBzZXJ2aWNlcyx2
JChIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1JfVkVSU0lPTikpDQo+ID4gK0hP
U1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9MSUNFTlNFID0gTUlUDQo+ID4gK0hP
U1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RS5tZA0KPiANCj4gSSB3YXMgaW5pdGlhbGx5IGNvbmZ1c2VkIGJ5IHRoaXMsIGJlY2F1c2UgTElD
RU5TRS5tZCBhbHNvIG1lbnRpb25zDQo+IHRoYW4NCj4gdGhlIHJlcG8gY29udGFpbnMgT3BlblNC
SSwgd2hpY2ggaXMgdW5kZXIgQlNELTItQ2xhdXNlLiBCdXQgaW4gZmFjdA0KPiB0aGlzIHBhY2th
Z2Ugb25seSBidWlsZHMgd2hhdCdzIGluIHRvb2xzL2hzcy1wYXlsb2FkLWdlbmVyYXRvciwgc28N
Cj4gdGhlDQo+IHJlc3QgaXMgaXJyZWxldmFudC4gVGhlcmVmb3JlLCBJIGhhdmUgY2hhbmdlZCB0
aGlzIHRvOg0KPiANCj4gKyMgU29tZSBwYXJ0cyBvZiB0aGUgcmVwb3NpdG9yeSBhcmUgdW5kZXIg
ZGlmZmVyZW50IGxpY2Vuc2VzLCBidXQgd2UNCj4gKyMgYXJlIG9ubHkgYnVpbGRpbmcvaW5zdGFs
bGluZyB0aGUgY29kZSBpbg0KPiArIyB0b29scy9oc3MtcGF5bG9hZC1nZW5lcmF0b3IvLg0KPiAr
SE9TVF9NSUNST0NISVBfSFNTX1BBWUxPQURfR0VORVJBVE9SX0xJQ0VOU0UgPSBNSVQgb3IgR1BM
LTIuMCsNCj4gK0hPU1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9MSUNFTlNFX0ZJ
TEVTID0gdG9vbHMvaHNzLQ0KPiBwYXlsb2FkLWdlbmVyYXRvci9MSUNFTlNFLm1kDQo+IA0KPiBM
ZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgdGhpcyBpcyBpbmNvcnJlY3QuDQoNClRoYW5rIHlvdSBm
b3IgdXBkYXRpbmcgdGhpcywgaXQgaXMgY29ycmVjdC4NCj4gDQo+IEkndmUgYXBwbGllZCB0byBv
dXIgIm5leHQiIGJyYW5jaCB3aXRoIHRob3NlIGNoYW5nZXMuIFRoYW5rcyENCg0KVGhhdCdzIGdy
ZWF0IG5ld3MuIFRoYW5rcyBhIG1pbGxpb24gZm9yIGFsbCB5b3VyIGZlZWRiYWNrLg0KDQpUaGFu
a3MsDQoNCkphbWllDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
