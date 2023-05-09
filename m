Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF9EC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 07:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5127541E14;
	Tue,  9 May 2023 07:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5127541E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZM5305NzTFi; Tue,  9 May 2023 07:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FDF641DF8;
	Tue,  9 May 2023 07:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FDF641DF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4D001BF2C9
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 07:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8625F41DF8
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 07:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8625F41DF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6LIPLJlsQgT for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 07:58:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B835E41DF1
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B835E41DF1
 for <buildroot@buildroot.org>; Tue,  9 May 2023 07:58:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.99,261,1677567600"; d="scan'208";a="151055655"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2023 00:57:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 9 May 2023 00:57:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 9 May 2023 00:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ManUwnvSRxYMS6C0qU3Ejb0wui0M6bpfUGil0EoMyNq7vF+qNx7HXxOaIzEYackrDzftM8fsvluGQEfSrYjCXCZMZeEXQesLjeYOvLyeaHcTyem3B8ykotTD6c2hrFJ9xGQpZgReZMMwWJkFz23+JjhmomaIOIC1bAMyi7o6Dl8CXoxCVQIIpghN1yH4FGLEWch40c9XpE/Bz9JcTdskoLWQQY1t6i9eVWWSc8tmivhSkK+5VFDFgAUrZPnklw/9QYkcJxqkL90sRhFYewqyNEK+E9mMFrLe4c39uEcG33juamfxoW2GDNHINPY3NcAObjWwBnSFFSoL7MfkFOZ8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj1zUeSwpKKo5irgZ3KBUhLVyLsOzNKEIP/AglnRakM=;
 b=YiDtzNy0tejnOxuFe1nS3H44otQRrmWys5LG3C7HVNy3jI2lQd6tQYw468D6Y83imZEmmiZ5oi7oRGrAsdsi0aNOQp+Da6RU7MZQ+UUxt4dQ9nfsAqKmprlWTbjrVrVmuayFiyM07Xj/xWobHCDnZ5VwHO+zahCbhGKKQ2sr/SY5tzUQrTYsPfYGH3fd7ieT6JlUQByfwsLF18LCgEBmeom39Yh1KcOAf/0Wm8P86pRP5i57zEh14QZbG/G4w0ganJsnl6wVK5BTj8aQjO1AJYx/3bXhGDzn8aHhlxWZr00Sl13rmv3vkSkNtGitBDnQfrIH647uoXjTHB4yVFhSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 CH3PR11MB8313.namprd11.prod.outlook.com (2603:10b6:610:17c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 07:57:49 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::adb:58ac:916e:ab38]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::adb:58ac:916e:ab38%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 07:57:49 +0000
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/2] package/microchip-hss-payload-generator:
 add host package
Thread-Index: AQHZd04kdYvn8KzRfkuJIaA9e2eJnq87xnWAgAAJdoCAAA4fgIAVyymA
Date: Tue, 9 May 2023 07:57:49 +0000
Message-ID: <5d317d21fe02d95ae9872d8d9a41b436831a0a5c.camel@microchip.com>
References: <20230425081444.1441521-1-jamie.gibbons@microchip.com>
 <20230425081444.1441521-2-jamie.gibbons@microchip.com>
 <20230425114431.5461f144@windsurf>
 <01db737b09ac273925c623c44b44a48a366871e0.camel@microchip.com>
 <20230425130855.0874ad36@windsurf>
In-Reply-To: <20230425130855.0874ad36@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|CH3PR11MB8313:EE_
x-ms-office365-filtering-correlation-id: 24ee8057-1c1e-4804-ff8a-08db50631545
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8pkyl+xDHzsJsQAZADDTKhILi50A7/zGfq5fEcW0fzZRAHTVagcLruEOhzYXu6cmZbt4tHcBjYq9gqFR3dw8bboaMb1ZubZ8Wre2VllBw/YDvbn3XG/AbPTT0vDh5dtNpEjrQZf+DL7jOkQjtbxjBRZ+b+e8JMUQl1Yf+gHgrflTolqBtufr4T6H3J4jrevIzNEwVzTigj3Ln+ztW+38+0kzpwZtBs0Byg5njuNnywlt5udTPe3xwi4U1A+9SsELjxlw2aUjQN85pIzRftZcGh5umTPdCtzuRnBGz8ZGtoUF+qSJG48wAX7RvyHNnDv8CpszVqIbuPiQra5tgxhqOzVf6QLCKciVKe8Yzv6t5rRZrV1ybps7uzitfv5oXhQwrxtgrz/Z7nZeAEvkoHG6GjOTckZA/OYOZmwzRhWkaeecsMTrCfOH81l9f9YUHEvXTktZGBNPlkFVCld5v6EIUalEzIPvRQpjsWIDrQ5HP34Oa0BT6vawA0eqKmxApRsR+mJADO1ui2bJMz2mC0Tq8cuuUlOrFJu3QPlv8ymAXGdGfKByx5tFRbcuWqEY+YGxornfOMVIVTAQeAgg9sX4GEOU+TOIDHif4Hj7FiPFF2aY7sZ6r4MO0bXYoeFAGTVk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(36756003)(41300700001)(4744005)(2906002)(86362001)(38100700002)(38070700005)(8676002)(8936002)(122000001)(5660300002)(64756008)(66446008)(66476007)(66556008)(4326008)(6916009)(66946007)(478600001)(91956017)(76116006)(83380400001)(316002)(186003)(54906003)(107886003)(26005)(6506007)(6512007)(71200400001)(6486002)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1RiNlFuNnN6RlNGNU9vMEVjcHVTZXFQclJIaDRwT1BCOHpERUphcWtycjRP?=
 =?utf-8?B?c1lyQnNYcU5VdVVjSlp2RlNNTzhQeXJkZjFYMkR3ajhwK3FDdWN1Z3gwbkVm?=
 =?utf-8?B?K0lUbHpKYVJNbG1vNzlZZk1Idms0UDZFSzFuZkVPY2t2dTd1eUMvVzk4MzdP?=
 =?utf-8?B?eTRzSjVwVHl5NnY0K1hWbGIrY0gxdnFHTWpIUDdTSVJDSXY5Q0xqWE5SMnB1?=
 =?utf-8?B?UjlENFpqL0xDQXpickFSMjhQbXRueVpVOVVyaUdMYlhKNDJBdXR5LzBwZXN0?=
 =?utf-8?B?bnVHSnJOdUVGajlWcnRQQ0dicUcydEphWlJSNjJuTVZpbzkzSy9CMDluWVd5?=
 =?utf-8?B?KzZKdzJVekd3MWhyUkJVanVWakU1RUtnSzhNRElZQjNYall0V3c1b1VSK01C?=
 =?utf-8?B?bkZTZnYxYTJoQW51aWpZVHZ6TUJ5eE5FN2pES3R3cytuK1BneUVQc1dSeUJO?=
 =?utf-8?B?cWZjRk9VeUMya1AybWhKMVFOK3lpeTJuYkd6dHdKczVqcnZJbkxKT0x2Rmtw?=
 =?utf-8?B?VHB3V2lKQjg1SkZBUDExNlplWWk3MklrK3NzVlgzRzVqa2I3UTIxSFVTNnhM?=
 =?utf-8?B?NWJadlBqVU45enQ1ajdqa0Z1bS8rQ1FXdnRDdXhFM2lFYmtMNlJGTm90czVt?=
 =?utf-8?B?a2JHRzNSNHlaNnhFT3V4RjJPSzl0NkJoRjZvZjMvejR0WUt0em9ZMkNqblVR?=
 =?utf-8?B?cG9ZdWl3eTk5WlloZWhpbkswZkNrbzg3QWVjK2pVMWt5SXYrRFp6cHQxUkZx?=
 =?utf-8?B?TVNGT2QwN202WHJmYlIrNW1EcVhuWEwyUHdUcE1jWE9sNEFFaWVnaVFwaWR1?=
 =?utf-8?B?azI2L0FyZnIrRTRVWGY1N1h2YURQV1UzWEVqMGRhWEticlRObjdCanlpNm42?=
 =?utf-8?B?Z0lRZFovTGdWQkpjeFUvbWJFNDVoOVBuMVVjK3BLdTJ5RUNOclNDa3lrWHlM?=
 =?utf-8?B?RGlTMGcxdi9xY3lacVpHejhuZktSdDZXYW1XRGM3OHhKaWpYZDFlZzY4ZEdI?=
 =?utf-8?B?Uk1DUmg4NGVnU1l5MUJUSjJTQjNHblFvSFp4QW14WDhmT0lTL2JESFQ3MzR4?=
 =?utf-8?B?cTA4NkNxTk1IL2NnelJETkVYOWxrc09lVFFVR2sxNkJIVFB0ZXZsdHR4ZXZQ?=
 =?utf-8?B?M0c1dGlkTmdTU0ZxL0gyLzhqNEQ4WklPb0lNKzNMZXNSL3I2eHBzbXdFMHhk?=
 =?utf-8?B?QzZOdHYrRTdRRS9MbnVySUlyUDNwa0xBbkE3R0R2OEtXQmk2bnhGTVczRDZr?=
 =?utf-8?B?cXFkbjJndzdvVjRSSE1yYVdqQ25KQ09VTjk4MDBmYjdOTko2SDVGVHVNRUZU?=
 =?utf-8?B?MnR0Z0pMZlk0RnpJSURwQTk2M01aZUVXWWNBblNzRW5taWpYQXpmYWdaVE1C?=
 =?utf-8?B?bmpTa2VJTDlhRTNxOTNDYnhIRUxPbk4vVlYyTzlHOVY2VkRiTGtnRkZoMWJ0?=
 =?utf-8?B?SERFa3hZaUFPZVozMnRCS0cvQXdLV05oaGpCWkIrcFU1OW11TTBacWxpK1FF?=
 =?utf-8?B?USs3enZvYi9aa1pFVU5YVE5BOGZVSEJRVzJnejlhdG5GcGl0U21rZ0hRblhk?=
 =?utf-8?B?dlVyZTNaMGc3L1VhdjBEU2pMMUlCbUptaHNmRTIxTlhXWEdqWnFhMlVKWVNy?=
 =?utf-8?B?VjBqcUNYRnJESldZY0NidTlDY3EzZVNoSE43TUhnZUdINFdlMFNnL0RuZkJl?=
 =?utf-8?B?cFBjY0xkMHhnUCtKKytjNEdDOHhyZ3NuajlYcUdETWJ3WmJhM2RKV0FBMkZk?=
 =?utf-8?B?YzhsM3hnVGwzd3Q5Q0dSOVNpaytIOWZRdXFic3NpUE5vdUFFZHdIaE1oenBx?=
 =?utf-8?B?bzVTMnFkNklhUnNYVVR6UWtVdW5VeWhJenFWVFdSRW5Zb1JNd1QvZWFsVDhT?=
 =?utf-8?B?bHVvM2cvTWRJajFNbFBvL3d5SW1hSS9lakJGaVNubXlkNUtydklPbFVhbkor?=
 =?utf-8?B?Z2dmRElLbVVtL3J1N3RDU29oSTVENUx0YVF1ejE3bCs3clBqVmJPMGRWL091?=
 =?utf-8?B?bUpaaVJ1dGFUK0JNekxDNU9zZTN1Rnk2dTBjN2tlcUpxbWpmbFZTcnFNUk5k?=
 =?utf-8?B?KzlUM2hrZDM4YmdLcDl6N2s1SisvK1dLZ1JuRkp5cGNydnFiUHhicFNqK2c4?=
 =?utf-8?B?bGpTMDZZbGdHbmFCbGtLbFVkUStQTGQ5cENraEZ2RStGMktXY2dpK0JkaFpq?=
 =?utf-8?B?c1E9PQ==?=
Content-ID: <DC31F9CFC9914546A5D775F9A51DE7BA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ee8057-1c1e-4804-ff8a-08db50631545
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 07:57:49.1772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zzbtLOvJpuxze3NH6nC4Z6F2vFmWq+8FcNQQbfj4XSb8TvabfZpbzlM3+9D8j8B++Qy8Ohk+MnJRwucUv/tGpZHocFd7FpV+Wvj7Ikzc2ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8313
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1683619081; x=1715155081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=dj1zUeSwpKKo5irgZ3KBUhLVyLsOzNKEIP/AglnRakM=;
 b=EtIJ+rbpTH7xGZWTtqYMXwgo+wXKAjkQT86boSIfJGzsFSMKbetw/Dvd
 WEyIsenSG7ieTX9zTTNvr1JAoyK9ORu0huxDo1fE1hkfXag/98PNNMz/2
 igq+Pqgfdva7JxyTm79BOZW1yzCHx2s30pVe2sieWkhrGJzGmbni483a9
 tUG/kAH461U3zKISdM3KdJxz2aMO9o9KJ8NmXinrdc5l8T8mPUpEF7oO2
 hdNtk8Nhm7AkU6fMyRXqBqnnYSwrZXbPiLGB4kfMbKRcEoasMiF41HNXP
 Ep58tFTI8X1LXgzYBBP4Gpi9dY10VCJvwVWuJ1Y6i/OluNoP28hGv5Jr+
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj1zUeSwpKKo5irgZ3KBUhLVyLsOzNKEIP/AglnRakM=;
 b=cNM/aERHvCOPRyhWx7Ie8nWe/DAiH6nFSF0NCV2JHq4nJghMaMDl8TR7pEZy7hDThohxfufzC+YVznB0PjqjItF3TqTESmmHNJFfp9SMtLCkHgKNHMwCVraosDXj6jtNu3TTT2yim5+TMSJuiG44yjuwjtGCtrKrmUWsPTKreg4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=EtIJ+rbp; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=cNM/aERH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/2]
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
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all,

On Tue, 2023-04-25 at 13:08 +0200, Thomas Petazzoni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> Hello Jamie,
> 
> On Tue, 25 Apr 2023 10:18:41 +0000
> <Jamie.Gibbons@microchip.com> wrote:
> 
> > Thanks a million for your feedback. I have tidied up and made the
> > changes you suggested below. I will update all in a v2.
> 
> Please wait a little bit before v2 if possible. I also had a few
> comments on PATCH 2/2. I hope I'll be able to review it today, if not
> tomorrow.

Wondering if there is any further feedback on this patch or patch 2/2
in this series from anyone before I send a v2.

Thank you in advance,
Jamie.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
