Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91648C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 12:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C48683E99;
	Fri, 26 Jan 2024 12:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C48683E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9y7xWuKuSVf; Fri, 26 Jan 2024 12:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FFFB83E91;
	Fri, 26 Jan 2024 12:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFFB83E91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0721BF363
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 12:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE29383E91
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 12:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE29383E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcz0Sv0BxLDP for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 12:51:36 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 26 Jan 2024 12:51:35 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACBFF8128F
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACBFF8128F
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 12:51:35 +0000 (UTC)
X-CSE-ConnectionGUID: fDRW5B5wSWyRWHgle6htEQ==
X-CSE-MsgGUID: jDxDtXzsQ62SF2Y58/WrFw==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; d="scan'208";a="246069753"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2024 05:44:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 05:44:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 05:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igLGiRNeKXlx3/0TeEW+2xLpCy4/KUtEAlseLz3syTPSxbHC3y/00B2Hi2yG5B6qD5OVuhgVnpwHG0KJXI2gfc1P9j/E/KyfqiOmaDF8QXPRXysdVgN4Q0MFHgLfP7hMIMG0j2LeWw/yShtzwqFqHAKHNJ44OSbF0oKgx6Niidiu1GODWgHLeUC+ble/1L53BmlQK3v1MNDxeMMAlelNItbvPxNLhd4GyKHhPdrEN4qgggEeCp03pMpG5XjG+N5yCeKguhjouPLyYUjgv8G8T7xy5XHUdVmz72wcwJKRcENQgzxnf/vxb182dDgcX8hr5gQ3v1kZPS7SoOmd3lL1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrGt/O44x5rQlfMahBSkCnDCTzbioIsJa7iOQB08hZ4=;
 b=MJmN1qQrlObE0VW3ut4a6IQcWoX87sAwyhq5dMHL4IaDOKp2ir7ptl3Uq4fLhazWqrRFyPYUW+McHfus5E7VT4EVNebUsqsShoyg89JFttLa9GY21x3at4GWVkL+wpUgsMRnHzsRxO30qR341yZcBd1jDtbTTyQU8gPuKO4HfGr+Xj2NM5P+xIhnKK9gl5iKisk/7VAaGszVVdh09RDrXW/+WJDXEDRdv56KPGIMuj3PSmVJCz4VxtjUgY+2xI2ojpK0uRrNiYs3Pcq0PG6xMxX37xybJlRPrSiKvjhOZgEKEmVXifIbzpbjCjKcGM4OG8Qj8R+/Wantwrjh7GqY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Fri, 26 Jan 2024 12:44:04 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::5987:8397:a32:b74d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::5987:8397:a32:b74d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 12:44:02 +0000
To: <buildroot@buildroot.org>, <peter@korsgaard.com>
Thread-Topic: [PATCH] board/microchip/mpfs_icicle/genimage.cfg: drop legacy
 gpt = true
Thread-Index: AQHaUD/J1Ia4VgAZG0yJsvjw8yMF2bDsCisA
Date: Fri, 26 Jan 2024 12:44:01 +0000
Message-ID: <7a66a52cc9a4b5bd68d89480a2ff8ac05239415e.camel@microchip.com>
References: <20240126100903.2139253-1-peter@korsgaard.com>
In-Reply-To: <20240126100903.2139253-1-peter@korsgaard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|PH7PR11MB7076:EE_
x-ms-office365-filtering-correlation-id: 2b69375e-85ca-4e16-c38f-08dc1e6c7949
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VlWifCVsX1vzkVbWxuYPTTWplzXd9nc4wt5LuoSmts4iO7o3ge+yQEGRRaAL4eFRIZTEAN0oBwU4jqY9+NPGgMYfRHO2d5U7/LQbU+T2pQdwxH8Hrolc7+Jopz25v3E3IGFzggBYmQGEV5G9GkYVQdp6iPvFxh575p//PCMeOYAL6Y1Utt5kQF0aaJXkvNY21ReR6dAv5IVm2kKQTYqyKjVjgfwxvSnxBLX4CxRP8yipGZyjZepqfw+HEkq9ADXaaR2R8AR1wZ+srVrc5GpOYDuBnECW+c0/o+ie9AhNJAMaQ/5tIHfYfc3LDr2OFMK3DBk2JTn3Lj0i4XLOCxZlGqRdxDiJp/klSBZkZwqoq+OntPbZlDLMze0GpKF90NR2ALBw5WEPOMbbSXE2+hpcxozZpIHVXxrx1dzzXWLc1WI6AgKARvZ69M4Dy0sre/BF9li8/ToxraMKYAI3nD1ir+DpVpDlJzQyBLoimQkID41R5Aftw5so+OxPhkmGZRjMw5TggiZIMzVjdyaV6U6gFe5XtzVDPgNEHs5GhOwtVj1KOVpMHMmyCiqFGD9DxZtAk+AjIBHqOYZHkjuKWaTX/XpywH+nCgkZSG26HvAnvOb22S3oPzORSP+4E9mKA0669H+RS2RCcqs2LsG3SxeLqyN7hulfNz3zuXNRi1DkEoU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(26005)(2906002)(107886003)(71200400001)(478600001)(2616005)(83380400001)(6512007)(4326008)(6506007)(41300700001)(91956017)(8936002)(6486002)(110136005)(38070700009)(36756003)(86362001)(122000001)(8676002)(38100700002)(76116006)(66446008)(66946007)(66476007)(64756008)(66556008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzZKd1ZjQW9JUGVjWE5YZzVHQ09UZzJFbEJQTkNFL01HSzRVck8rTDZwdE45?=
 =?utf-8?B?ZXlZZlh5VWRxcXRMUldHamYxelcvc3QzTnp4MnRjaEd6MFRPUFp2Nit3MTJU?=
 =?utf-8?B?WkZZaUVpRHJWYUFocUdxb3FHNlZ6djkvd3NiVUhsSWJHeENMUVJFbTdDZWZa?=
 =?utf-8?B?aFdCQTBQWTlaOXI1L3BnWEtscUFFN2toY3BqSnRpL1czeXhGOUxIb1BvNmM2?=
 =?utf-8?B?Ymg4THhyK3gvdWZ0YmFUN3BQVmk1WXA5dE9oTUtTeWo0czYraFJUTkluMnRo?=
 =?utf-8?B?M051ZjFnM3QwUVg2VXJ6R2tZK1pDaWFWNEs2R0pBa2lvQmUvR1RVVWhRbXFM?=
 =?utf-8?B?MDU2TWhncEtRVUtLZGt5NjNiTFY2N2pWd0RybytYWno2TS85ZUdTdnZyQnBa?=
 =?utf-8?B?Rk15R3hUV29hWS9UaGp3bDB6blprR3hTL25RVndaYlhLL3hUOUtSNWNDNk5k?=
 =?utf-8?B?KzB4NkdkdGxoRHY2ellUTGhUZE5CZ20yalJtanJpS1VoTzhnWGtGaFp5bE1S?=
 =?utf-8?B?Uk1EeTY4YVFlN1FPMHQxWGkyaVlTWnFJRUh2V1V1Mms4Y0xlTnh0bG53bTg2?=
 =?utf-8?B?Y3RFcW5vY1JMSDdpYXNKT3A4Y2VSZHlTY3plbzdnNkdCdjRpQjJOQ0FCWFVN?=
 =?utf-8?B?a0hXUmI5Rzd4Z21EbVMzM2VyTTFxSUtyN1IycGhnaWprOWppSjJkUHoxRXJq?=
 =?utf-8?B?VE1nWklYV2w1L2pueUp3NUxuU3cxL2dvb2xaclJMNG1lSXdTaDIveG9kVllT?=
 =?utf-8?B?YVl1QTVuRlZyUGZtMTJIaVZJeHdBMWUwcWJqNDR0d3FnU0xvZ1hubER2dUNR?=
 =?utf-8?B?N0xCaTJzRTFVQ0twYVIvQkt5V1FScXRjZXptU3lreHEzeVcwQ05neENJRk1X?=
 =?utf-8?B?a25nZG4zb0xrVHEzUElwdjEyVGhxYXBYZ1BjOEZ2Y3NOdHQ4Nzh4NDVOdE8z?=
 =?utf-8?B?RVRZREtldERocUZGVHlOc0tkNDBJQWxnQ0hBVjFoNzRCVXFoZkxuQkZYN2ZD?=
 =?utf-8?B?QU8vaFo5QTk5aVcrRXo0TlNjYlFybHVablFYa0wzTE5YWjFreFY4UE1HUzlB?=
 =?utf-8?B?SEpLZ1A1MkJ0RWtHWExtUGhzRjR1bmlJa3lXZmM0amZGeHJuelVBRmxsNldH?=
 =?utf-8?B?dTI2QWJKSHh5a0VpMXUrckhETXUyaTBSNkk5aWxwbjUwMXl0S0FhTkVmdG5q?=
 =?utf-8?B?dVZZTG8xQThFMTdaYnJLbFVIVDhCamoyUWdzenRiV1ZxUGlhbTBkZENTY2RP?=
 =?utf-8?B?ejhiWEdrK0ZPQXRGTUg0bDFhcWRJYmVhdUY0NW1TNS81QUVjSDlrL2diT29u?=
 =?utf-8?B?b1NQU0xIYmEzci8xeFJpVk1LZ2xqMTZ2WDVka1VHRkErWFE1dFVxUThYU3lE?=
 =?utf-8?B?TjNKMzZsZmV3MEd2VzRVWU16QzRqZTMxYlcrTzM3YkZsS2phc0xSbHRvWHQ4?=
 =?utf-8?B?Q0FQSE16YWNIYUZodnNwcE5FVzN1N2pMT3hyVUhrN1FZRFF3azZpdzBSSkpD?=
 =?utf-8?B?cFJwVFNTTzNIUFJpb0NEbzM1UEsyZWpNNEt2Z1JxcVVtZVBMQlpUTjhkdFl5?=
 =?utf-8?B?eFg0clJVNWRPYmk4VXFYc0hpUUdxSTg3bHE1NnZVUi85MC9ZQUZHVVArTThx?=
 =?utf-8?B?RW5wOHVYekJySVMvQTBtY2pLa1lFbnZacUtvQk9HZ2hJWjhSL3VWVWw2cnIz?=
 =?utf-8?B?bTl0TVQzRkRYY0pxa1pwV1ZGN2ZUM0VQTmI0MkFUYjR2K1BCN3lFMnhoTXh5?=
 =?utf-8?B?VlMvQWs4V1NQNkovbW5laTZORmZSTS9NRkVHRWR3U2NSOS9CWHAxbWh6SUxG?=
 =?utf-8?B?OEZwa0dnQk9DRzJ6ajBWK3lkQnl0bS9TUFFLRXZDcEVobEdCZi9BMmNlS1VM?=
 =?utf-8?B?U1FzaWtTZ3cwTERjZUVHaUNPQTV3RngvNDBRaXRzaVJPd29ndTZwbThKQk1j?=
 =?utf-8?B?S1UrTGhJMnJoUjE4Umh6cnN0WFc4a1lRVHZtb3E1ZGhRejZsckx0UnppZjEv?=
 =?utf-8?B?UGNTekdwWmYzaWtyQmgyNlJBVC8wL2FUYnMyU0Rvc3o5dFZTekZlR2NtMFFh?=
 =?utf-8?B?R3BpYnU1bDZIZFN1aHhqN2h6UWdkcE0xYnV6cDJwUzN4dkg5RGJMZWpBdk5L?=
 =?utf-8?B?eEE2dk1ETWhWSExNUDZPM1ZVL3E3Y3hNU2VUVkROdDlOWVlLemlrVWVQNjBC?=
 =?utf-8?B?TXc9PQ==?=
Content-ID: <C65CF3B0377F6242AF8187E9E4551638@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b69375e-85ca-4e16-c38f-08dc1e6c7949
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 12:44:01.9565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qe9lL8CcmzpmzqSqzCERq+GxmP/3rCaGFKxYA6Q0T9pDabl6rfIG2ofx2C2h5rZ2Md+7loS8FqV2+lFvZveRmPa7GDoMOKfdoMlFGHLEf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706273496; x=1737809496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=BrGt/O44x5rQlfMahBSkCnDCTzbioIsJa7iOQB08hZ4=;
 b=FgWB6/1vFQwM3tjZxAVR1HLAftUEYvVrZrR+21tbFuL1+ISLCGsarQtH
 /lIqruG+ANwKcbel5BRwC7uBZWgnH4v+iuxnRABmCFqS2UFlTsF1RjwIu
 h0+HjfsSNWaREYFz/W9o3DzO+hIsl1W5e9peHfmiAfcTYNJzt+uQYgHrf
 k4kkwU2n1nycPnu0f34ISUfu3EVHHg6ph5sDc2hlJkOMHR4UKqnMVhEfy
 0tfX1zm+PTZWd1bDbdSZu5qVmD7ZVr/z9TSZLMxQnlyn5gfomkN/lRvFb
 UhMU7G4EtzRJOgwSuSJTEXQ/HOfgh5f16yBnZhN04iIBmwT6kivLlYE1O
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrGt/O44x5rQlfMahBSkCnDCTzbioIsJa7iOQB08hZ4=;
 b=LM3u+umpbj3l1UcgoQJQOfgm2dhJ9GkABhsEQHFD+gH/lzm9r/+qmeZNlJJy/ttMnZFigEtoASo/ZncxPsjuSN6irwCBOHSdWN5MD0LQiqo72fullc5JWVZ/ImtzogSShRbP2+yuwpvivdWSEBoLELtJZ9vIFs4Unb/Ohs1y6W4gu6FH/9vSKmlO1GqPYLapgAC3KWYRjrYQlig0s/mitUvm2NCjCqr6bpXMdGqqM2Hhj0TDXjF+QhdhOQ/x8GNu6bIgUuZMrsRIZEl0LVatQQ3cVQn58qLWDuVnfLT5hWEf87BXcYGazIRPdKy0BsgHi7qmQ377Bwo/9HQbbOOp+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=FgWB6/1v; 
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=LM3u+ump
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH] board/microchip/mpfs_icicle/genimage.cfg:
 drop legacy gpt = true
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
Cc: Ludovic.Desroches@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDExOjA5ICswMTAwLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6
DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cNCj4gdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gR2VuaW1hZ2Ug
Y29tcGxhaW5zIGFib3V0IHRoZSBjb25maWcgdXNpbmcgdGhlIGRlcHJlY2F0ZWQgZ3B0IG9wdGlv
bjoNCj4gDQo+IElORk86IGhkaW1hZ2Uoc2RjYXJkLmltZyk6IFRoZSBvcHRpb24gJ2dwdCcgaXMg
ZGVwcmVjYXRlZC7CoCBVc2UNCj4gJ3BhcnRpdGlvbi10YWJsZS10eXBlJyBpbnN0ZWFkDQo+IA0K
PiBTbyBjaGFuZ2UgdG8gcGFydGl0aW9uLXRhYmxlLXR5cGUgZm9yIGNvbnNpc3RlbmN5IHdpdGgg
dGhlIG90aGVyDQo+IGNvbmZpZ3MuDQoNCkhpIFBldGVyLA0KDQpUaGFua3MgZm9yIHRoZSB1cGRh
dGUuDQoNCkphbWllLg0KDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4NClRlc3RlZC1ieTogSmFtaWUgR2liYm9ucyA8amFtaWUuZ2liYm9uc0Bt
aWNyb2NoaXAuY29tPg0KPiAtLS0NCj4gwqBib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvZ2Vu
aW1hZ2UuY2ZnIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2JvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNs
ZS9nZW5pbWFnZS5jZmcNCj4gYi9ib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvZ2VuaW1hZ2Uu
Y2ZnDQo+IGluZGV4IDY5NTVkMzM2NWEuLjkyODJjOWNlNWYgMTAwNjQ0DQo+IC0tLSBhL2JvYXJk
L21pY3JvY2hpcC9tcGZzX2ljaWNsZS9nZW5pbWFnZS5jZmcNCj4gKysrIGIvYm9hcmQvbWljcm9j
aGlwL21wZnNfaWNpY2xlL2dlbmltYWdlLmNmZw0KPiBAQCAtMTUsNyArMTUsNyBAQCBpbWFnZSBi
b290LnZmYXQgew0KPiANCj4gwqBpbWFnZSBzZGNhcmQuaW1nIHsNCj4gwqDCoMKgwqDCoMKgwqAg
aGRpbWFnZSB7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwdCA9IHRydWUNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9uLXRhYmxlLXR5cGUgPSAiZ3B0
Ig0KPiDCoMKgwqDCoMKgwqDCoCB9DQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBwYXJ0aXRpb24gdWJv
b3Qgew0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
