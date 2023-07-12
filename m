Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140B3EB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 12:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867C8821F8;
	Wed, 12 Jul 2023 12:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 867C8821F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUV3MCtB1Xnw; Wed, 12 Jul 2023 12:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF347821D9;
	Wed, 12 Jul 2023 12:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF347821D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDBB21BF3C1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93075821D9
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93075821D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dBkonLOjGnI for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 12:44:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E707821D7
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E707821D7
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 12:44:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="161004085"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2023 05:44:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 05:43:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 12 Jul 2023 05:43:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbQo/TGqdp7fOWB23KEoUrpk2zXvJFCBlTriTApKT6myHytZDQBCZCmGMzn3TrseRqitK3HbopqbSUjvCxl2GfqKKmQ7QfuUUX/ASWpbejgvRIGRF2al56gy1XUf0fz21pxVCGPwR+yERfRh7kuGXCwaNY4G/28k/Gpw0RjGs10HEE/81wPm3OhUjhaDXVbhWXfznZoeBdE2zl6NeU+aStRYHaPNNHus/Vhm12Daa02/TGf3eb0jUiaCXdDQTMcOnXlI8xQbxZMdDq+A8jHvxx36f139ahvrJs/8d8cZTf5YDuo2MS82Zyh0BBwBdNED89/FOKcuiIbEP2s1Dl59XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPGizWblvxjVDmF/HGUVPl2N0BZFNhwtYwnjelvCvZ0=;
 b=lKOzzn/+Sf9eP9KKzry7baPamVWcbvwmZpuiJiYs8q7DuTU6GupaRGvUu68iUaBw8vlKAlz7gldOHGLi03eAPA63Z8gC780aG81YPUEtaDalRF9q0nsLFF7bfGZ+TI2Ub56B20CQql3uzIa5Zi+9taHbzOBlMKDUXApvX+ZGdCKudclVxyLh6iq81cweXOzfpF+H4bj+jt3c03Vouolc4S2HQ209PPjeRCK3pdOyaybfw6mUq1tUFCZIJCa/8DlIQdQ17mhFbjH2jZcB2jfg+HIR2vuvO81syFAUf/ViEObxCm2eFKPM/mcnfPGmgrpBFLv1fLluu5fo4XBB/DmsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 12:43:32 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::eb15:939d:8fd9:a65d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::eb15:939d:8fd9:a65d%7]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:43:31 +0000
To: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 1/2]
 package/microchip-hss-payload-generator: add host package
Thread-Index: AQHZtJvJHumx3txr3EevpR/fpzabXq+2BKGAgAAPFIA=
Date: Wed, 12 Jul 2023 12:43:31 +0000
Message-ID: <5d7b1a82bab9672ec3af377a9b38bd63053bd95b.camel@microchip.com>
References: <20230712083455.2349333-1-jamie.gibbons@microchip.com>
 <20230712083455.2349333-2-jamie.gibbons@microchip.com>
 <20230712134933.58ec91c8@windsurf>
In-Reply-To: <20230712134933.58ec91c8@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|IA0PR11MB7863:EE_
x-ms-office365-filtering-correlation-id: 33c5ff08-db56-4ae4-41ae-08db82d5995d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: medcsA+VSFpRQXSq3buxhwZA2IB4W8L1AjthDdSxjzUrMUQKhtbAJEXk795Bcz/mNOF4nJVJYM+/5b10B+dPFCrO7O0XnmmdxiZbfu2vAK1Lb59yQyXb6pckccaadvNegHwj/dxYvyH3vMyYXXdIhWc1Sx4cghYWzSWN4/6vtV5Nbgk4H6T1Lq8b/pX4uQ0+vLTCsEFIZ5aClUAjAKsKTWs8ksluyUyC7WZsWoOAPthIHBaiPpBcSYHJJCWrDuoHi9IJ7dGqAZoyjrzlkcVdCr512O2UUEz20fkMskMuEoSXHMoALmZyhiRzOXw80i5EJJE07wPOhWIMrLUTXBJiHnjzSHnqtJJORfoQyN9vtzkZysb4afFh2SnxIF7LH2N+Q2bZl/9+LbRtbtgV1C9oJjg/iqneZ2DY3bO/mOugXRnTBECr8ey9jSXQ4Yl4MbI8FCg4prncoP7XA0mdA0UysT+NSADmTrI1zwCsKzuI5wdxcdl+RhCIM3Bmtiw0Ix5wSLGR1dYoYBRy33zdXRe/zNkOkBv8pqtlC0kWCNivcaJ4WvQPDNK4QXQLAsUpjDVMmD51jJ1LA+iYzOWC3zzGFkXWx6Maw5AZJB0OejaEpYk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(41300700001)(107886003)(26005)(6506007)(6512007)(966005)(83380400001)(2616005)(186003)(478600001)(122000001)(110136005)(54906003)(71200400001)(6486002)(4326008)(76116006)(91956017)(66476007)(66946007)(64756008)(66446008)(66556008)(38100700002)(316002)(86362001)(8936002)(38070700005)(5660300002)(8676002)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekF3eHp6ZFJOdnJJMXRIcEJYNlEzWEdhNlVHZ3U1WjY4K01HbnhkZTh0eEFT?=
 =?utf-8?B?YXVmVnRVUUNicFd1VkFNVU5iNTFsUm9UVnJtQTBFMUtTaEhoSVFiNWxhcDZm?=
 =?utf-8?B?dHlhV2MxQWdiM2lpZHJ0Z3JtbmF4YmV5THJNQnNMc0Z4a3AxUEgvdW5ac2Jw?=
 =?utf-8?B?MHEyaWQ1VWF6UjJMMDIwSk82V0RQR3J0cG12ZGxSa1dxbVF5d3dmc2E0aGND?=
 =?utf-8?B?TXRpTW1jY1VhWTJNc3NGc0tPcldmZGYyWUhLQm1OeTBaNjRpcWlVT1UvNVd4?=
 =?utf-8?B?NGpzREdHN2NNcTMyUzZaL3B6b0Fka1ZqWGJuT1VxRWdJMG51cFlnL1lOcXZR?=
 =?utf-8?B?TnpWaEJUMkIxZk9OeVpBWit0eDE0SVRnY0paODVkL0VBOGlpU0xnOENVOU9i?=
 =?utf-8?B?ekJKcGVIOGxXVE5NZTBMTWowdWdYbCt2ZG1QTm5RWkgrYTFUUHJkY0xRbmwx?=
 =?utf-8?B?VzNvVDhjMFJwY0ZMZFhCSnR5ZXpyQ1l5VDk0YlZ0ZWY5dkNvbWplUTNEUGJW?=
 =?utf-8?B?emNtQ3ZGbGZRR2tVeG1HVk1GQTM5QlFScVoxMm92T1Q4b1V0dlNBOWJhYmxi?=
 =?utf-8?B?ZERFREZUMzFvRFR0elNQS0ZrWmc1TGdUY1JvNWpLemFDUXdlU09maGM4UFY2?=
 =?utf-8?B?ZlpHTVhGU2VHbkZGZUQ4L0xVYUw5NTlEQkpTbG9kVGxobGlVRmt0TldWZUlz?=
 =?utf-8?B?YmtKbVdqb3hFU0Z4cDFyRWdNZklZWlNqcmY1SnRab2thWEY3QjRmWXVRSEVa?=
 =?utf-8?B?QmpodUNKUHJZTWFPeXd5bkFpb0xuT2ZGVnNyazRDaUZpeTByS1MvdXZoek0y?=
 =?utf-8?B?TGZGdS8rZE1yWmJ0c3VxdzlBcytKTzlybW5YVldRODJMQk1OZ3BSVGRlVzk0?=
 =?utf-8?B?SzFzSUJlTHFMQW5YUzNBL2hPU3BvZWpVN24vYStja3g2cGRGOUd5NHJFYWdS?=
 =?utf-8?B?ekFWYmx6dEhLRkhiWmRpNlpUdS9ZT0EzQ093N2pNYU9iTDgvVzA1Rmx3Zmpy?=
 =?utf-8?B?V1Q2YVNpRWlNVmtjSGtaRDBHcHZteHJ5cml4d0swc2MveVZJd2JmMk9yNWxk?=
 =?utf-8?B?RWhKTEJIV0taRVVWNFdXVEYwSndaajM4LzN0Ly9rOFdqQnE5eHZxZ3JRNG92?=
 =?utf-8?B?cFJVSlpZbzVPY24yTDJjeEFFM0l5R2loUVZ1b2p1S1FrOTEzTUNFSDJYYWk3?=
 =?utf-8?B?QUQ4OWM0cDJydE5hSk1ncGpRdkxGekFQRTBXWktKK0tmWUFCQW14dGJ4azhY?=
 =?utf-8?B?VVBOYm9KcC9aUXIzcFl4ZEtqV2V5alZWeGNVaDBFZHM3SzQzUFErR00vVlRT?=
 =?utf-8?B?ZnhBQldwbURqekhpMkFtTDZyY0k2SFduVnRSRlN5N09acG1qUGJwZllDVFUw?=
 =?utf-8?B?Q2hsc2xYeG5FbmtXNWFmMWVDclN0Tk84NG9GOVJBakhCc3hkZ2RBUlE1elMy?=
 =?utf-8?B?VkEvMXNtaTliOW5veUd1QVg1T2hhK2xZdWNUK29ScyszRUtYQ2JtYi9lYXhh?=
 =?utf-8?B?VEpFMWJFcEwrc3FnVVY2R1pSalU2YjUwUnp3bnlDak1BcmFJTlU4ZVVVRGVU?=
 =?utf-8?B?NTR1SDBHSGh4V0g2anF0ak9SbnZHV09hekdqN2dGZjFMd3NnTWxBVjZqMkVS?=
 =?utf-8?B?ZVNWTFc5Uno3YkZKNnNDYktvSW9CTlpERnA2Y25EdlN5UkZ3cW9lMjFFK0tU?=
 =?utf-8?B?L1JUQ3hwaUNXR25TUmNVRDNyL3JHbVNVSmVRRVJXMEZXMGZTVmphbGllSFpK?=
 =?utf-8?B?NU1uUG1iYW16cnJFWmxJaWtDWUJKazI2KzBobHBKSEtNQXdlWmhTSC9CU00w?=
 =?utf-8?B?TThEeEg5WHBZd2ZCQVU2amZvQ3UvaEsyeFh3cHZPdHN6QnFRdG1UOEVHRStv?=
 =?utf-8?B?Yk9lb3BSd2lxQkhXN082NVlBQktPSjQzdjBNaGpaU29kMFlBKzBKcWU2Vk5s?=
 =?utf-8?B?R2cxYVRBeElYQ1ZtMEtuajZ6TGs5emt0TVFaSVBJanAzaEF4b1F5MVZiWXE5?=
 =?utf-8?B?TnZIaWlaQUgzcExJZEtrekYxWGkrd0p6cjExOFdlRDZaYXVoWXhRQzNyL2l5?=
 =?utf-8?B?SDVUdUFTa2xqSVplQVFtSXpjbDhEQzZ5T0hkWXRUN1JKWjZxVjBPWjVMTlhM?=
 =?utf-8?B?VTAvbjRuenZvNUpmSFRsZlhOcUk2RDZMTy85ZDJsMTZpaGlzNFkwRkU1S213?=
 =?utf-8?B?WEE9PQ==?=
Content-ID: <5E90DE7BED78594189249D5D503F3A09@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c5ff08-db56-4ae4-41ae-08db82d5995d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 12:43:31.5399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYLx9gKm0mRaCTcoBuz0dQD44ComqybgUcvH/E/B/NFAp7z9BsM4yvOc3fhZtkDXtI6qiEW9UpABE1H13WdArCNRS/BXLM3hIwGjkEuI/zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689165859; x=1720701859;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=rPGizWblvxjVDmF/HGUVPl2N0BZFNhwtYwnjelvCvZ0=;
 b=zV7+2JVf4Z8z0AiVLmxYaOBJJNcxky4UADrXGl415yW0RtFVZ0QUc1gz
 Flxnb7NKN+JL7J3fiM/GMs38XEsNPZ4ymCJNyHjjz5Q7yEzBksICjTHzW
 qQyL/X3QOB2GMpQM6Z8sNDPBeKPSCGBV9655izthe1blLAm6V0iDBl3sa
 Kz/wVpr8E+ScWmxhJKQTnFW1viWV3chITZCc+de+y6Zrruhl7pMt+l13I
 pwGA2B7HqOta+Cu/wx9a1vBgo3QRgLn13agCo9G4FotwWYJCFHq9T3nV9
 w8yrPRkLBR1vIm8bMIxtvuKa0fVmYtQRImdK5JQwLw57FlfaqOoeX49dU
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPGizWblvxjVDmF/HGUVPl2N0BZFNhwtYwnjelvCvZ0=;
 b=tkO+VJFn/mlU7UwJPIElHXV1NuU89Hqh+fx3uKZlnpQXdsjFfXRKUcl12EDvDlECAp88xjB6wl3i55zTnTIJzHgDDXYr+rvNwBjgwNY4TW2eIUyz7EvtTr9PJQwPlBoALlMPSJFeUfKHjae1l+1Er3+yglz2DaUFFNxd7mVWs4Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=zV7+2JVf; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=tkO+VJFn
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v2 1/2]
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
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMDIzLTA3LTEyIGF0IDEzOjQ5ICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdQ0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhlbGxvIEph
bWllLA0KPiANCg0KSGkgVGhvbWFzLA0KPiBTbyB2ZXJ5IG1pbm9yIG5pdHMgYmVsb3cuDQo+IA0K
PiBPbiBXZWQsIDEyIEp1bCAyMDIzIDA5OjM0OjU0ICswMTAwDQo+IEphbWllIEdpYmJvbnMgdmlh
IGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOg0KPiANCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yL0NvbmZpZy5p
bi5ob3N0DQo+ID4gYi9wYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3IvQ29u
ZmlnLmluLmhvc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MDAuLjFlMjFmYmJiNWQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvcGFja2FnZS9taWNy
b2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yL0NvbmZpZy5pbi5ob3N0DQo+ID4gQEAgLTAsMCAr
MSwxMCBAQA0KPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9NSUNST0NISVBfSFNTX1BBWUxP
QURfR0VORVJBVE9SDQo+ID4gK8KgwqDCoMKgIGJvb2wgIkhTUyBQYXlsb2FkIEdlbmVyYXRvciIN
Cj4gDQo+IFNob3VsZCBiZToNCj4gDQo+IMKgwqDCoMKgwqDCoMKgIGJvb2wgImhvc3QgbWljcm9j
aGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvciINCj4gDQo+ID4gK8KgwqDCoMKgIGhlbHANCj4gPiAr
wqDCoMKgwqDCoMKgIE1pY3JvY2hpcCBQb2xhckZpcmUgU29DIFBheWxvYWQgR2VuZXJhdG9yLiBU
aGlzIHRvb2wNCj4gPiBjcmVhdGVzIGEgZm9ybWF0dGVkDQo+ID4gK8KgwqDCoMKgwqDCoCBwYXls
b2FkIGltYWdlIGZvciB0aGUgSFNTIHplcm8tc3RhZ2UgYm9vdGxvYWRlciBvbg0KPiA+IFBvbGFy
RmlyZSBTb0MsIGdpdmVuIGENCj4gPiArwqDCoMKgwqDCoMKgIGNvbmZpZ3VyYXRpb24gZmlsZSBh
bmQgYSBzZXQgb2YgRUxGIGJpbmFyaWVzLiBUaGUNCj4gPiBjb25maWd1cmF0aW9uIGZpbGUgaXMN
Cj4gPiArwqDCoMKgwqDCoMKgIHVzZWQgdG8gbWFwIHRoZSBFTEYgYmluYXJpZXMgb3IgYmluYXJ5
IGJsb2JzIHRvIHRoZQ0KPiA+IGluZGl2aWR1YWwgYXBwbGljYXRpb24NCj4gPiArwqDCoMKgwqDC
oMKgIGhhcnRzIChVNTRzKS4NCj4gDQo+IElzICJtYWtlIGNoZWNrLXBhY2thZ2UiIHJ1bm5pbmcg
ZmluZT8gVGhlc2UgbGluZXMgbG9vayBhIGJpdCBsb25nIHRvDQo+IG1lLCBidXQgIm1ha2UgY2hl
Y2stcGFja2FnZSIgd2lsbCB0ZWxsIGZvciBzdXJlLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yL21pY3JvY2hpcC1oc3MtDQo+ID4g
cGF5bG9hZC1nZW5lcmF0b3IubWsgYi9wYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC0NCj4g
PiBnZW5lcmF0b3IvbWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci5taw0KPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uNzM0NGQyMDhjMQ0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9wYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5l
cmF0b3IvbWljcm9jaGlwLWhzcy0NCj4gPiBwYXlsb2FkLWdlbmVyYXRvci5taw0KPiA+IEBAIC0w
LDAgKzEsMjQgQEANCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ID4gIyMjIyMjIyMjIyMjIyMNCj4gPiArIw0K
PiA+ICsjIG1pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3INCj4gPiArIw0KPiA+ICsjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMNCj4gPiAjIyMjIyMjIyMjIyMjIw0KPiANCj4gTWlzc2luZyBlbXB0eSBsaW5lIGJldHdl
ZW4gdGhlIHNpbGx5IGNvbW1lbnQgaGVhZGVyIGFib3ZlIGFuZCB0aGUNCj4gZmlyc3QNCj4gdmFy
aWFibGUgZGVmaW5pdGlvbi4NCj4gDQo+ID4gK0hPU1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dF
TkVSQVRPUl9WRVJTSU9OID0gMjAyMy4wNg0KPiA+ICtIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9B
RF9HRU5FUkFUT1JfU0lURSA9ICQoY2FsbA0KPiA+IGdpdGh1Yixwb2xhcmZpcmUtc29jLGhhcnQt
c29mdHdhcmUtDQo+ID4gc2VydmljZXMsdiQoSE9TVF9NSUNST0NISVBfSFNTX1BBWUxPQURfR0VO
RVJBVE9SX1ZFUlNJT04pKQ0KPiA+ICtIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFU
T1JfTElDRU5TRSA9IE1JVA0KPiA+ICtIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFU
T1JfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UubWQNCj4gPiArSE9TVF9NSUNST0NISVBfSFNTX1BB
WUxPQURfR0VORVJBVE9SX0RFUEVOREVOQ0lFUyA9IGhvc3QtZWxmdXRpbHMNCj4gPiBob3N0LWxp
YnlhbWwNCj4gDQo+IE5vIG90aGVyIGNvbW1lbnRzLCB0aGUgcmVzdCBsb29rcyBmaW5lIHRvIG1l
LCBvZiBjb3Vyc2UgZXhjZXB0IHRoZQ0KPiBob3N0LW9wZW5zc2wgbWlzc2luZyBkZXBlbmRlbmN5
IHBvaW50ZWQgb3V0IGJ5IEdpdWxpby4NCj4gDQo+IFRob21hcw0KPiAtLQ0KPiBUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K
DQpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIEkndmUgdXBkYXRlZC9maXhlZCBhbGwgb2YgdGhl
IGFib3ZlIGZvciBhIHYzLg0KIm1ha2UgY2hlY2stcGFja2FnZSIgcnVubmluZyB3aXRoIG5vIGVy
cm9ycyBub3cuDQoNClRoYW5rcywNCkphbWllLiANCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
