Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04EBC001DF
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 07:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C77841561;
	Wed, 16 Aug 2023 07:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C77841561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddjOgAuvwChN; Wed, 16 Aug 2023 07:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 809314155D;
	Wed, 16 Aug 2023 07:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809314155D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 169771BF3BD
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 07:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2E75821B1
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 07:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E75821B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlW_10o5halI for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 07:19:32 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E91D822D8
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 07:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E91D822D8
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="225617451"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2023 00:19:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 16 Aug 2023 00:19:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 16 Aug 2023 00:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4yVZM2yvDrWkxahv76vQMC4NLijVJqShmHCHH8/ZDLFCQYPCkGd7mBOg5Plf77mHRDoElGU2858BmrJTG5x1Ky6q0aQqkKY9ScLshJ7NBxGRkAQvQMwLeOIDTTP1Q/lr1QtELmEf0D6H7nV3zsqot/gE29/1QP6VCuEETJ5q4iABYcp1TvSiKXK6uyBq7sWU47n8nLfU1N186xbvEB4krJcpwbPbiCWEBT/kCMuaN4f4uNM4CnoIOGEuMC5jK2iryaUPZ6qsMJYbT/P3slLRfMa77f3Vmjh2Y4vni6W5DurX96r2kF2xxJS/EuD8ErDcI6o9BxPDdJGTbuAbmEw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ysjn6FqOZ4IG4BCcgAfYan664ZkSX2Q24efu7Yd3NLM=;
 b=ZJhQlwQoW4MBxywqLN3SaE6cgGbCz8L6fEZSITwfza3ZoeJC9KRbqAAaJ8duABI6AGdoobXNMJIlH5rKSCjNEz/F4ByDt2kS0FDbWNcsdd6veBTmHj7w+MioozGsFrnsHxsJr4DmToUcgoScfMYSr14+0R758VlKENcjJSNPR4SXV+LT2sANOreCMSSCktJiVSyw767zbSEMiVjvi4j0em4GcGeu5KP5uddbl2slyDZY3PEI51TDCityPuGOX82jJ7vjLxISgGjkf6Maq6FvdphHa0D7HJQWdtr0JznRQCb89g427TrOhTjaU9NR2G00+robTI4xTxaUypL81aeqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 DM4PR11MB5454.namprd11.prod.outlook.com (2603:10b6:5:399::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.26; Wed, 16 Aug 2023 07:19:20 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d%7]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 07:19:20 +0000
To: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/3] arch/Config.in.riscv: update instruction
 set ext
Thread-Index: AQHZz2AdPFlfPRjJM02SCrLhpbqjW6/rwVIAgADD74A=
Date: Wed, 16 Aug 2023 07:19:20 +0000
Message-ID: <bb6b2d14d2761a42beb2041ad192a40a6eeab137.camel@microchip.com>
References: <20230815100600.297932-1-jamie.gibbons@microchip.com>
 <20230815100600.297932-2-jamie.gibbons@microchip.com>
 <20230815213816.38960e1e@windsurf>
In-Reply-To: <20230815213816.38960e1e@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|DM4PR11MB5454:EE_
x-ms-office365-filtering-correlation-id: 7a92def9-4912-4051-ada7-08db9e291c0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gw2zBoxzBo9n2AFvB8qLEtPLx/OqguLJFVY7CBb8sUbIust5yi6c1T9VVofHVTdg2gVVOMXMXtZh4gbT2he+64/DBaYJVGHSSK73xVHTVBcfuYy6xvhsyLUCQXO8MgQAB/o5egzFuzxRMG00FVE5A5a+NT7G0RirGFzH6COlOcv3yW4YtcqKH1GlfG2aMwYrLq4XjfcSj2jjMCOFs0Nq48M3zy43MOLbiInUb0gdgCTNlcVe2hfTd4+x8X7yuLw2Xa42U+9gs5TJZuqSffWPFB4ZgoJB0Zy4OgEv8dhMaZJp+TBPGp9pY0HXhtuHhC5hElHtpPmQZkneI1tfRK+gQw8nB4TeRpd/KNac0oS/aCjbuHdFOYvW5Jq2qCafoZrg2KrdAo5NeKZcRyidcqZ5Bi4fP44cZT5EMUEymbfeK870qATa6ENR8jBnuBN2jPc3TbUktvsrOGcmmhUuZ4+jVqKQKEbXAaiP/5IcqVe5Oxap4C/rsxwMmMi+4cMFF+hbzJTEsqoeQ+tfFiHE8Brg7dL3cODN/A8Ky0X3+YgpTkWkHBoMEDX+YFHsyS2NGNuFJLBKp9Mrdd1a2DK3ut+KDNJCOp1J0t0ERm0K/3C1JbQPrCUvS6wCM7xLslC2C0ZN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(4744005)(2906002)(478600001)(15650500001)(26005)(110136005)(91956017)(107886003)(5660300002)(2616005)(83380400001)(41300700001)(316002)(8936002)(4326008)(8676002)(122000001)(38100700002)(38070700005)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGhnMW1WcWFFSVRNZEZPUzN6R2J0c3NycmpEUi80cHJmS29WQUQ0OEpxSDg4?=
 =?utf-8?B?NDMzVC8xbFlmbU5GN2RKaXBMazNkaDMxWm52cW8xSWpvOU5ZSWVTaERuQ3V1?=
 =?utf-8?B?VmpDTlZYb2o2UjVMMGhOZ3BOQlpzaXFxdGY2ZXVvbldPcHZpajJmWWhYa3Ns?=
 =?utf-8?B?RS9XQ0hqZm9xUUx6Z2J0WmtXUDRxdlZHQjhPWVRUOEl1RE9OOWpPZGZpVG4r?=
 =?utf-8?B?L2x3dUNIcUFZamdnUDNvNTJlM1I2bk5PMkQ3bk9pazhpajUvTEZIaXlEOG13?=
 =?utf-8?B?QjQzcEdGTnlNeHNIaWtvbU9CN2ZjeGM5MjNzTTdsZ2FpWUdrRGhtUThleDVQ?=
 =?utf-8?B?b0JlYjQranhjQmtiSlNieWNCU0dCSVhobkwrVzg1Qyt5Q3A1QlhMaU9SdDM5?=
 =?utf-8?B?dmtvVGpsSVdmQ1UwYWRwZk9VQ0FmelVtQzd6V2x6M0lrMHJzZmRqQ0p0TW5Q?=
 =?utf-8?B?dW1YNXFGTTF6K2l5Ri9kenZ1aVdxK2kwRE8ySGdSNmk3NVdCZ3JKdEdnTURX?=
 =?utf-8?B?d1dTOWNucHY4STdsb2VocnY2V0FlRU1IaG5LUXFQU1JBTzV4cElpbi9sWTJH?=
 =?utf-8?B?K2d0NHZqZk5qbjdvdmhUaUpGQjE0bEQ3ZDJHN00rOEc3Wjc0TVZ6UFlwbG51?=
 =?utf-8?B?TVlUSElOOEJneHlLWVhGSGpWVDF0M0E1K2p2YkVLdTFmUTIrV1VBaFJ4UTE4?=
 =?utf-8?B?MjloNDFDQ241aHNPR25DSjhDaXUvbGd6NVRVQzdEdVN1VTBjUndXN2lHcWtY?=
 =?utf-8?B?ejFmMWx4UHpmNHh0SlJuZFJKT3QzUzZ0SWV2aFVkOS9HdVpYNTFpMEIvVGI5?=
 =?utf-8?B?ZXlhSW5iakdDdXdySytocG9uMmpJaS96Z0lzdkFJRzNQTFFkN2hFSU0yYkNV?=
 =?utf-8?B?SjFZUUU1NFZiV1QwMnlvMFUyM1VnYUdzQXVUaXZRWHJFVXQvdFhTaHkzMDdw?=
 =?utf-8?B?Y2k3OVE5Rm5CMzJkVnlqeG9IUUYxeGo5MW5rQlNwS21GWkhZZmdlWjhVNitQ?=
 =?utf-8?B?Y01pc3hlVDZmN2ZyWSsxQnh4YmkwYnkwUGNPZ3RQTEcyQ2lUdnpLZnNTb2dP?=
 =?utf-8?B?TzNyczhWZHhrWVpocFZtbUdZZ2pWcHJkdW1WclVFdnlqRlpITndJVEVHN2Y1?=
 =?utf-8?B?YXNadjN4Y3Bmc2VraS82Z29IRmtEQm1CSDROWFdxSmJVeUpHQ2ZMSTJUWGth?=
 =?utf-8?B?WDRyN29LdTUyalZ3TzdxVzhEQk1XamFPM1NncDZKaE1vdDl4NWQycy80WnFR?=
 =?utf-8?B?QkRWWkZSUnRxZndJQjU2SlFEOWFOV3c4TFN5MVZSL1JXYUpJUjg3Z3NkUVdJ?=
 =?utf-8?B?VG5QQkdSdmxKY05meDlocHBrMHR6UWN0bExrZkNpV283MDk5OW01cEV4bHp1?=
 =?utf-8?B?UWZlNm9mRnRjSHI0YWdma2s0Y0pxR1BLZXYzUWh3bE5Kd1IrcEpFcldWTzR0?=
 =?utf-8?B?b1pxMGNlN1ZXbXhvamFiSjFDZVlXQ3FrS3Q5cDhSK1ZjeE5MaWp2SDZJYm9q?=
 =?utf-8?B?NHI4Rk1qZEYweWZiQWJYekZpbkJIdDEvcnNabjlPNXFpQ2lrWG9PZnppZWNp?=
 =?utf-8?B?Ymt2Yzh6dWM0NWhQVDJqQis2WkRnazVYSm9aT0ZLQkJMNlRBT2N1WDIxbUFs?=
 =?utf-8?B?SmN4R2tkZnVFZTlzWHBmcDlsRFlFZTBmcGxKNDM4MFJFazA0OFd2ZjJDbU81?=
 =?utf-8?B?azNLRmtVN1pxclF0Q2xwYWtxcjNVMmFOWGtZelIxRmNHVXIyM3gzR2J6SEo0?=
 =?utf-8?B?UFN4SGhwWVNPaVNkNlZUR09CNWk4YTZDYStxN3BvWktCMkVIYnoxSEZzMmMy?=
 =?utf-8?B?LzVtVnVkMjF1anJlUkNrcm54ZktaeUszV1gvZWJrWUJFbCs5bS9DTm80MU1x?=
 =?utf-8?B?R202dGVjTDRYU1JrK3B5NkFONEJzdzlwWXE5UEl0TGtsclZ1MVVqbzZYWFFD?=
 =?utf-8?B?NUFsZmVTaFByNGZkQWFKaDVDYjJvbE5leGtFQUlrLzhPWkxpSkgvd0VkcTl4?=
 =?utf-8?B?RDFxQVZ1dEs0WDdQRWIxR0s4Ti90QTRTL1R4bmcrbTB4OTQzakRkb085TjZK?=
 =?utf-8?B?QWsvR3BCczk1VXRJSlBzN1FiQmxtendOSVh5K3NFaWpHcDZwcDZ4dnJRcUxM?=
 =?utf-8?B?THQ2ZnZGYWx0ZlpmdzQrRUZ1K0dtUjlmVkRCT2E5SEdkREpGdUNkZmxCdVgr?=
 =?utf-8?B?MlE9PQ==?=
Content-ID: <655CE46F55F07246A164E5321D3CF9F2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a92def9-4912-4051-ada7-08db9e291c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 07:19:20.4306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WD7+UEdT34dMn8i7H5Xmq4EVEkCrayTA7VYs+C0Zw1EDSBf5N0945iyj3dcbA1cAXglC/YqlfOxgK6Lq+hRBprp344pzwwJxmDEihy3lZDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692170373; x=1723706373;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Ysjn6FqOZ4IG4BCcgAfYan664ZkSX2Q24efu7Yd3NLM=;
 b=dNJjWfkT048ipn2UqwrWZy68PwdxcaUiaZZKoABh9UEUTRxlFHGWUiVs
 TqDuXzA7jD5WUgywleCoOEMKsTdCS1KZNh8c3CNUNG0IzMUNUL8pm1RbU
 1RPqBAB+JtqbbDKKP52bxOtCl6688cTYej4mrgqtX+VZh/9UUIanRhgzG
 f/mwmuvEK89hsU7mpGMM9di58JZa7s1YgxHn6tDm8H51VL8eJmsntzR6a
 qbkqNvJNf+YPEkTunDDgOfL6YlH/enZI9ZLvM31XYeHLKWaEWAww/YYGB
 bSm7F9DzTOu/XTWxZLX6o01Lb7NJci6Ok9sOhjZl11hQbAQDaCf4dv5Sj
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ysjn6FqOZ4IG4BCcgAfYan664ZkSX2Q24efu7Yd3NLM=;
 b=Xa8pwUO7+McXm3HyqAYzmivpSr3h/Y99GPpnSfZ7eoounxz/rMQRdrZB6xyfO0TDYp/dJjqOJ9XoKW0eynpjF36EqqchepNC5GNLzeju+EI11Tol7bOmuulFIvFiv3HIbxL5PJiswRzrzoApoF20pmsTxJwaTvDconPManVBnQI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=dNJjWfkT; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=Xa8pwUO7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/3] arch/Config.in.riscv: update
 instruction set ext
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
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQpPbiBUdWUsIDIwMjMtMDgtMTUgYXQgMjE6MzggKzAyMDAsIFRob21hcyBQ
ZXRhenpvbmkgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0K
PiANCj4gT24gVHVlLCAxNSBBdWcgMjAyMyAxMTowNTo1OCArMDEwMA0KPiBKYW1pZSBHaWJib25z
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToNCj4gDQo+ID4g
K2lmIEJSMl9yaXNjdl9nDQo+ID4gKw0KPiA+ICtjb21tZW50ICJJbnN0cnVjdGlvbiBTZXQgRXh0
ZW5zaW9ucyINCj4gPiArDQo+ID4gK2NvbmZpZyBCUjJfUklTQ1ZfSVNBX0NVU1RPTV9SVkMNCj4g
PiArwqDCoMKgwqAgYm9vbCAiQ29tcHJlc3NlZCBJbnN0cnVjdGlvbnMgKEMpIg0KPiA+ICvCoMKg
wqDCoCBzZWxlY3QgQlIyX1JJU0NWX0lTQV9SVkMNCj4gPiArDQo+ID4gK2NvbmZpZyBCUjJfUklT
Q1ZfSVNBX0NVU1RPTV9SVlYNCj4gPiArwqDCoMKgwqAgYm9vbCAiVmVjdG9yIEluc3RydWN0aW9u
cyAoVikiDQo+ID4gK8KgwqDCoMKgIHNlbGVjdCBCUjJfUklTQ1ZfSVNBX1JWVg0KPiA+ICvCoMKg
wqDCoCBzZWxlY3QgQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNUXzEyDQo+ID4gKw0KPiA+ICtl
bmRpZg0KPiANCj4gSSBiZWxpZXZlIHRoaXMgaXMgc3RpbGwgbm90IGNvcnJlY3Q6IG5vdyB0aG9z
ZSBvcHRpb25zIGFyZSBvbmx5DQo+IGF2YWlsYWJsZSBmb3IgdGhlIEJSMl9yaXNjdl9nIGNhc2Us
IG5vIGxvbmdlciBmb3IgdGhlIGN1c3RvbSBSSVNDLVYNCj4gY29yZSBjYXNlLg0KPiANCj4gVGhv
c2UgdHdvIG9wdGlvbnMgc2hvdWxkIGJlIGF2YWlsYWJsZSBib3RoIGFzIGFkZC1vbnMgZm9yIHRo
ZSByaXNjdl9nDQo+ICphbmQqIGZvciB0aGUgcmlzY3YgY3VzdG9tIGNhc2VzLg0KPiANCkFwb2xv
Z2llcywgSSBtaXN1bmRlcnN0b29kIHlvdXIgc3VnZ2VzdGlvbiB0byAibW92ZSIgdGhlIG9wdGlv
bnMuIEkNCndpbGwgdXBkYXRlIHRoaXMgYW5kIHNlbmQgYSB2Mi4NCg0KUmVnYXJkcywNCg0KSmFt
aWUuDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
