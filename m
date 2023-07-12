Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10407EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 10:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80AF040142;
	Wed, 12 Jul 2023 10:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80AF040142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DH9n4fszEjYi; Wed, 12 Jul 2023 10:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8945E4031D;
	Wed, 12 Jul 2023 10:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8945E4031D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 349F91BF409
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19EBC60AC2
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19EBC60AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbTqgHire1BO for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 10:27:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E61060ABA
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E61060ABA
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 10:27:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="219986404"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2023 03:27:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 03:27:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Jul 2023 03:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNIUSH3gBWzxs+vf1ZsuhD6dqq8llFQRQ8NNjQuI5hHqrHohrHW2hVN2oxkTGPjB/l/RW/UnevsaQC/2/NFFw8CI3aKOWchqCNsQVSHdBSQYPmFCLTpaffUglSoOibJk/5kAeYLI0UiC61O17lpCs7VIqR5MwhcDb1zqEAJYs9/zSCRHEc/2Vk5R6x8v8wO09zrXKZ51BL7LNRCmFXF9beSvaxJdJEgrZiud9ms+Vv7Sjk4DeRdLWCqQD2eN9+lYzzQhzQ51BeuqaqzpCpdfMPI+0gZQoMCmsSzvqVygrKRkqGjXuWv9k0bLCoe22tTeE45Xq+5czI+Uwk/gW24fwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4GoE+CQrL+vhAvd7sf+P8uYzmIDYElWM279j00GTxU=;
 b=WpQD+5GyEaMGDX6jQLbNGxsa6S89DiYrmCQyVR/jNAkaXmEPAOQFdeI6HzWzELS7WuA7N2xLtlmXlApPia/oHZq0tEoUOuFc+8ObL6LofDHjDU8K619em0tfA5d+Ny/MxLyslXLjx79B87Z7WmMzlIVLK5lmCCfiNx2KDS2Aomx74ovjEzcKBFlaDvvu7Vx0qtMOlaAhWOYZk1HeQUg+TMPfmL+4AFiO32zyJSO/+ApjRR1m6btVxrlTr2luK+HEgGymm9pEHsCgkuyx6lwstyIX06P68GE5CsLkkGDQjX51xNyF3zFXe8SH73ySPoXuLHkSIWHTQqPQ5aeGBtC5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:27:02 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::eb15:939d:8fd9:a65d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::eb15:939d:8fd9:a65d%7]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 10:27:02 +0000
To: <giulio.benetti@benettiengineering.com>, <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/2]
 package/microchip-hss-payload-generator: add host package
Thread-Index: AQHZtJvJHumx3txr3EevpR/fpzabXq+13zGAgAAOYAA=
Date: Wed, 12 Jul 2023 10:27:01 +0000
Message-ID: <d7db610fd5cdd3bd49a0d99dab76390910984183.camel@microchip.com>
References: <20230712083455.2349333-1-jamie.gibbons@microchip.com>
 <20230712083455.2349333-2-jamie.gibbons@microchip.com>
 <179ceb1b-392b-1abe-5afb-dc33ac095512@benettiengineering.com>
In-Reply-To: <179ceb1b-392b-1abe-5afb-dc33ac095512@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|MN0PR11MB6036:EE_
x-ms-office365-filtering-correlation-id: e878c9ee-8fb0-4e03-0e30-08db82c287cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IXmAycgQ4QQGq0yCb3KQUadGr6NF9efh2aPKawN7JGdkGhGltA5u6hbsjc9WE1jQpAqs3exYYL6FY7WnFxQbZJBWvyyz/baUbDObZSZu1aHAvmR9HgZsSuSbBIWJNbqvtxhGIt5r/d0hua3lN6RQxLBhxXFYCPBSNuqCQal9Gcu5KImuXio0guavBxqstA+u6tItFWpmIMXIdIvIEwax24qYLpceMt5mE6uOeWwS+vMJuAEIujnJt3EbTpKS5Sxjl/JTfZCHpy/xFivFk5jUf5JsJoRv8gThSwBN7y62u5VbQyC7f6EC8S5YvnHkzw8S3ZeGEcP9I7rSRuF2rXP43mUJPaJlazgUrrvPNWrBtr3HHUvGHJtXggI4FPWxvzeDua/mXoH9jhq7PAvGOJOc01P1uWpwYYVlGQ5zFZOaIvew444Cw4kQCtaRXSsdUecJQZX8WN/5LykfF/BAgeIwNCB0G5q5FTFH0KBgtsqXrAzI0PtD5v4/wxyDJQv/pyTCM1KfQqIqr+wpYMFcHwegYH3UjN1tfPi7hUKTmrFMH6NDR/O5sViDgiBV46KhzdAOpMXYuqHv6hqcO0C7xCjYeWTjoYPx5chEvk2TWjC6PQU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(86362001)(107886003)(8676002)(8936002)(186003)(36756003)(2906002)(83380400001)(2616005)(5660300002)(26005)(53546011)(122000001)(6506007)(71200400001)(54906003)(110136005)(38100700002)(66946007)(91956017)(66476007)(66556008)(6486002)(64756008)(66446008)(4326008)(478600001)(76116006)(38070700005)(316002)(41300700001)(966005)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUVtdE5PUGtOZmNRcU4yakVDYjd6U2dnYzd6SnY1QjVrdmkvaDZ2UEFZUi93?=
 =?utf-8?B?V1lvRkFKUG14RFNybjVvcG0rRC8zcjFjVmNzVVVVWWF4aTRDREN4K3ZyRXlv?=
 =?utf-8?B?dkk5SHQ1amNpakJER1JJZGpjOHJMellSYUJiMEFhT2NlL0dlVjJBYWtIVTc3?=
 =?utf-8?B?N3JXNmp6OHc5Q1BaL0x1ZWlWMEs3OGx0QUU1aUFTaFdyT3dyVFk2Y2w1SnZJ?=
 =?utf-8?B?dXBzS2pxWURsbG1KNzRidW0zMFRDdG14UVJ0QXREWEV5elJheVFjNWJXOXdL?=
 =?utf-8?B?U2J4b3hVRjBJQkxUSEVjNEpESTZuYjdINzNLS1kyeUdxZlN4OTkySmdMLy9p?=
 =?utf-8?B?VndxREZnYkRGRUFUWGFhNy9KOTd4V2FWZmF6dmdhdGNSNjFMSkxKRXVVN04w?=
 =?utf-8?B?U3R2SmdyamsrVjVwcGFGbUlCejhRbGU4Z2E0ZkRHYW9YN2FWSjM4Y1QwSHlY?=
 =?utf-8?B?OWw1TStlNER1NXR3dkh5a0pDVkJ3WkhiNy95UUdZRmJQYVNmS21mN1pqL3JG?=
 =?utf-8?B?bnd2NnRFWVpCUW5IS29GaVdFbGhsam01T2QyQlBHYXZ5TEtmZjZaYUxZM0JQ?=
 =?utf-8?B?c1pJN0d0YUV6TUxxQ1JSbXZxMVhHT0Nzc3lzZzJhUFJQK25SVUwydnRyQTRO?=
 =?utf-8?B?QithR0FWN1JzQVBPMzdZZmhHaXBlTDA0YlRnTjd5UXI3S05ETnNjNjhJaVR0?=
 =?utf-8?B?dHZtVk8raXhRNUpiSFBPb2V1QmdIMUpGSkp1d0FUTjFFRzd0SUkzMTY0eEMz?=
 =?utf-8?B?MUZKMEw4aEdtYlQrVUpvdDhZNnprcnJ6YmQvMkdwM2QzaVhlQW82SENOSkhQ?=
 =?utf-8?B?Q0JLQzJyd3cxUml4cUMyUTRab1NkRE5uenJvSUswRUo4ajFHVDZUQ05LbStD?=
 =?utf-8?B?Y1ZsbjIxcVJlNi9RT3htbERuOUJZNVN3ZWNhMS9XQjBtdzhobGJwNW9EMC90?=
 =?utf-8?B?bVBmbzVTSE43aEcvOGttR1dLUFZaaGVxL1dkSU8xeThNdjdxOWFoNkk5NkdL?=
 =?utf-8?B?cVNFUE83R1FoZEU4dzhFWTZWdFhsT3BCQWZ2Vm1PUzIva01udmFzOXEvVlpE?=
 =?utf-8?B?ZmM5aFhlRUdnOWplSWd2bnd2RW5ZMmE1M05ndVJ5enN2SVNmeGE1SzJTb3l3?=
 =?utf-8?B?TzkwaGp3MFNkSC9oejdvTlpDMUEvRFpIRTZDeTd2eFcyTkNyZDZVWkM2enY3?=
 =?utf-8?B?dTNpUURGZkZreUsvSDk5L0Q4cUliVGFCL2FaS3JPelEyeDl1R3B2SklnRFN3?=
 =?utf-8?B?UEZkUFFhanoyem0zMHFMTmFZQ3AwQkk5UVdGQ01KbkRIQjIrNnAxUVFKaDR1?=
 =?utf-8?B?SStVb051SDFabkc0S3ErQ05lb2FicUMrZ1ducHpTQjhYVzgzQXIxTXlLSDlY?=
 =?utf-8?B?VlJzOGZuM1JWWkh1eDNGYjNOcGN1VGJTQzRUd0ZhVXpsQnBNVXVtYjIwMXJi?=
 =?utf-8?B?Qng4a2tVU0tCY0l3YzdZMTlXL1VVZWVhcHYzeUxFNFFJOGJjeGE5MVJWL1RP?=
 =?utf-8?B?MU1zcG5BOGxWcW5xYWJFdzZ4V2J2VWVwRVErZUJtRUxKczd3M0hBMkliNTAx?=
 =?utf-8?B?cHRBOGdpa1hHMlRob25rUzZrWWZ1bnF1Yk5GcTdhNlgwWFJLcnl0ejN1bmp3?=
 =?utf-8?B?UlFjaG9oSmxjZHNsOTB6eFdXMTRxVE5tNzVVcjI0ZlZDUkxiMEZsQ2JDQitu?=
 =?utf-8?B?L01QRmxKcUZ1cXg2cnZaQjl2WmJoRVNXY0lqVDNLU0hWaW1xVUE2S1lsRUdl?=
 =?utf-8?B?bTR4L2ZEZEtBeTcvUm92d3JCaHQzVDhOdzhwOXh4Rm5LWXYvWDVxR213SEZj?=
 =?utf-8?B?ek0vNnlycXVxbDJreXB1aXFmL21ReDZkTFN2ZEN5QlQrSksrbFNsQzI5ekcx?=
 =?utf-8?B?TVRJOWluNnIyeEFLNmNCS3RkeWtWakxkdjBiRnIyNkZTY3NuUlgvTHNMUisz?=
 =?utf-8?B?cTZPN1N0SWI0cmNJbE9xN1FRTzJzTFBtR1ZRSlJoc3dhK1Z6WVdObmpDVmox?=
 =?utf-8?B?WFpndEN5MnNUbHkyb1M0RUFpdjBMelR4cGNLUWVhaEc5NDZVd1BmOE95Qkpt?=
 =?utf-8?B?aHBGMGtMOXBOWCtQek1OYWtNUURBK2ZjTFVoSE5xczhrYWZ2Q3U2SGdkcENB?=
 =?utf-8?B?c2JVLzh3cHFJZHVZQXAxak1XMjFSVHcyQ2tXSHhZSEZPQ1QzeGlTTjY1clBH?=
 =?utf-8?B?RWc9PQ==?=
Content-ID: <971955EB3383514BA640CD1C2C1028FC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e878c9ee-8fb0-4e03-0e30-08db82c287cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 10:27:01.6574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6rMk1poD4MvovU8rLdVHA8Yo/kgNEtjU5qRn1OwCtRqFY77qyMmMJU82qs5uBZET0/yi4tTvzPbKzBzBlpE1Pky+tUKFt8sUO978hu9hOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689157637; x=1720693637;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=s4GoE+CQrL+vhAvd7sf+P8uYzmIDYElWM279j00GTxU=;
 b=HMeGCVY4T6XbkjHFn+EILE3NHM0l4YIVOuScqE8vFHmZBv6LywtYJy6t
 wzp6TUfSiSltnA9trhJyE2Tcm4IAWt+eVQcgCk9LWa7YXIZu4m502tcKp
 jjwQAqhw0FztGZDsQqNtoC3EluVU/tALA/m8IkNovzbjlaAzDCJaBSnNq
 aVZ0zQmu5mFmsmpdKPKjjvFOFTPm8Ar6SsTIH+4pHRHlS9YEf0+c4F6lK
 y6JLID5o1VoU10RgG5FOynMKcPUmT0rbWaR6Loq0qJQngpdKa7HH1UenR
 dQ8MUr6/WKA9xsfd5Bbu+I7YAObrVI7zhqJ6hnhRRJtmB+uIcLDhiOvrY
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4GoE+CQrL+vhAvd7sf+P8uYzmIDYElWM279j00GTxU=;
 b=kavoQ71vIQBdrtPAI8073CELYjljtHAchNYSAwJq1dYUq7forZb9zS0wpayE8tRKEvIXa/Gp/GeSFoV/26m1m1pz/adpmLtvplewQnT2RP0xrEbH4Cvsuymf54a1tEM1rSXd82sB6EcvK0RFkIxOcsgmWjTk9i3t4GXcpsVjFRA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=HMeGCVY4; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=kavoQ71v
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
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMDIzLTA3LTEyIGF0IDExOjM1ICswMjAwLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToN
Cj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSBKYW1pZSwg
QWxsLA0KDQpIaSBHaXVsaW8sDQo+IA0KPiBPbiAxMi8wNy8yMyAxMDozNCwgSmFtaWUgR2liYm9u
cyB2aWEgYnVpbGRyb290IHdyb3RlOg0KPiA+IFRoZSBCdWlsZHJvb3QgaWNpY2xlIGtpdCBjb25m
aWd1cmF0aW9uIHVzZXMgdGhlIEhhcnQgU29mdHdhcmUNCj4gPiBTZXJ2aWNlJ3MNCj4gPiAoSFNT
KSBwYXlsb2FkIGdlbmVyYXRvciB0b29sLiBUaGlzIHRvb2wgY3JlYXRlcyBhIGZvcm1hdHRlZCBw
YXlsb2FkDQo+ID4gaW1hZ2UgZm9yIHRoZSBIU1MgemVyby1zdGFnZSBib290bG9hZGVyIG9uIFBv
bGFyRmlyZSBTb0MsIGdpdmVuIGENCj4gPiBjb25maWd1cmF0aW9uIGZpbGUgYW5kIGEgc2V0IG9m
IEVMRiBiaW5hcmllcy4gVGhlIGNvbmZpZ3VyYXRpb24NCj4gPiBmaWxlIGlzIHVzZWQgdG8gbWFw
IHRoZSBFTEYgYmluYXJpZXMgb3IgYmluYXJ5IGJsb2JzIHRvIHRoZQ0KPiA+IGluZGl2aWR1YWwg
YXBwbGljYXRpb24gaGFydHMgKFU1NHMpLiBBZGQgdGhlIEhTUyBwYXlsb2FkIGdlbmVyYXRvcg0K
PiA+IGFzIGENCj4gPiBob3N0IHBhY2thZ2UgdG8gc3VwcG9ydCB0aGlzLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IEphbWllIEdpYmJvbnMgPGphbWllLmdpYmJvbnNAbWljcm9jaGlwLmNvbT4N
Cj4gPiAtLS0NCj4gPiDCoCBERVZFTE9QRVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKysNCj4gPiDC
oCBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+ID4gwqAgLi4uL0NvbmZpZy5pbi5ob3N0wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAgKysrKysr
KysNCj4gPiDCoCAuLi4vbWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci5ta8KgwqDCoMKg
wqDCoMKgIHwgMjQNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gwqAgNCBmaWxlcyBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspDQo+ID4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
bWljcm9jaGlwLWhzcy1wYXlsb2FkLQ0KPiA+IGdlbmVyYXRvci9Db25maWcuaW4uaG9zdA0KPiA+
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC0NCj4g
PiBnZW5lcmF0b3IvbWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci5taw0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUw0KPiA+IGluZGV4IDA5MThlOWY3
MjEuLjJmMDM5YTI0MDUgMTAwNjQ0DQo+ID4gLS0tIGEvREVWRUxPUEVSUw0KPiA+ICsrKyBiL0RF
VkVMT1BFUlMNCj4gPiBAQCAtMTQ1OSw2ICsxNDU5LDkgQEAgRjrCoMKgwqDCoMKgIHBhY2thZ2Uv
cGFuZ29tbS8NCj4gPiDCoCBGOsKgIHBhY2thZ2UvcnBtLw0KPiA+IMKgIEY6wqAgcGFja2FnZS95
YWQvDQo+ID4gDQo+ID4gK046wqDCoCBKYW1pZSBHaWJib25zIDxqYW1pZS5naWJib25zQG1pY3Jv
Y2hpcC5jb20+DQo+ID4gK0Y6wqDCoCBwYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5l
cmF0b3INCj4gPiArDQo+ID4gwqAgTjrCoCBKYW4gSGV5bGVuIDxqYW4uaGV5bGVuQG5va2lhLmNv
bT4NCj4gPiDCoCBGOsKgIHBhY2thZ2Uvb3BlbnRyYWNpbmctY3BwLw0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9Db25maWcuaW4uaG9zdA0K
PiA+IGluZGV4IGRjYWRiZmRmYzEuLjQyODU2YzA5ZGYgMTAwNjQ0DQo+ID4gLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4uaG9zdA0KPiA+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QNCj4gPiBA
QCAtNTgsNiArNTgsNyBAQCBtZW51ICJIb3N0IHV0aWxpdGllcyINCj4gPiDCoMKgwqDCoMKgIHNv
dXJjZSAicGFja2FnZS9tZW5kZXItYXJ0aWZhY3QvQ29uZmlnLmluLmhvc3QiDQo+ID4gwqDCoMKg
wqDCoCBzb3VyY2UgInBhY2thZ2UvbWVzb24tdG9vbHMvQ29uZmlnLmluLmhvc3QiDQo+ID4gwqDC
oMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvbWZndG9vbHMvQ29uZmlnLmluLmhvc3QiDQo+ID4gK8Kg
wqDCoMKgIHNvdXJjZSAicGFja2FnZS9taWNyb2NoaXAtaHNzLXBheWxvYWQtDQo+ID4gZ2VuZXJh
dG9yL0NvbmZpZy5pbi5ob3N0Ig0KPiA+IMKgwqDCoMKgwqAgc291cmNlICJwYWNrYWdlL21rcGFz
c3dkL0NvbmZpZy5pbi5ob3N0Ig0KPiA+IMKgwqDCoMKgwqAgc291cmNlICJwYWNrYWdlL21vYnkt
YnVpbGRraXQvQ29uZmlnLmluLmhvc3QiDQo+ID4gwqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2Uv
bW9zcXVpdHRvL0NvbmZpZy5pbi5ob3N0Ig0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21pY3Jv
Y2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3IvQ29uZmlnLmluLmhvc3QNCj4gPiBiL3BhY2thZ2Uv
bWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci9Db25maWcuaW4uaG9zdA0KPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMWUyMWZiYmI1ZA0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9wYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5l
cmF0b3IvQ29uZmlnLmluLmhvc3QNCj4gPiBAQCAtMCwwICsxLDEwIEBADQo+ID4gK2NvbmZpZyBC
UjJfUEFDS0FHRV9IT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1INCj4gPiArwqDC
oMKgwqAgYm9vbCAiSFNTIFBheWxvYWQgR2VuZXJhdG9yIg0KPiA+ICvCoMKgwqDCoCBoZWxwDQo+
ID4gK8KgwqDCoMKgwqDCoCBNaWNyb2NoaXAgUG9sYXJGaXJlIFNvQyBQYXlsb2FkIEdlbmVyYXRv
ci4gVGhpcyB0b29sDQo+ID4gY3JlYXRlcyBhIGZvcm1hdHRlZA0KPiA+ICvCoMKgwqDCoMKgwqAg
cGF5bG9hZCBpbWFnZSBmb3IgdGhlIEhTUyB6ZXJvLXN0YWdlIGJvb3Rsb2FkZXIgb24NCj4gPiBQ
b2xhckZpcmUgU29DLCBnaXZlbiBhDQo+ID4gK8KgwqDCoMKgwqDCoCBjb25maWd1cmF0aW9uIGZp
bGUgYW5kIGEgc2V0IG9mIEVMRiBiaW5hcmllcy4gVGhlDQo+ID4gY29uZmlndXJhdGlvbiBmaWxl
IGlzDQo+ID4gK8KgwqDCoMKgwqDCoCB1c2VkIHRvIG1hcCB0aGUgRUxGIGJpbmFyaWVzIG9yIGJp
bmFyeSBibG9icyB0byB0aGUNCj4gPiBpbmRpdmlkdWFsIGFwcGxpY2F0aW9uDQo+ID4gK8KgwqDC
oMKgwqDCoCBoYXJ0cyAoVTU0cykuDQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgaHR0cHM6Ly9n
aXRodWIuY29tL3BvbGFyZmlyZS1zb2MvaGFydC1zb2Z0d2FyZS1zZXJ2aWNlcy5naXQNCj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yL21pY3Jv
Y2hpcC1oc3MtDQo+ID4gcGF5bG9hZC1nZW5lcmF0b3IubWsgYi9wYWNrYWdlL21pY3JvY2hpcC1o
c3MtcGF5bG9hZC0NCj4gPiBnZW5lcmF0b3IvbWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRv
ci5taw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uNzM0
NGQyMDhjMQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9wYWNrYWdlL21pY3JvY2hpcC1o
c3MtcGF5bG9hZC1nZW5lcmF0b3IvbWljcm9jaGlwLWhzcy0NCj4gPiBwYXlsb2FkLWdlbmVyYXRv
ci5taw0KPiA+IEBAIC0wLDAgKzEsMjQgQEANCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ID4gIyMjIyMjIyMj
IyMjIyMNCj4gPiArIw0KPiA+ICsjIG1pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3INCj4g
PiArIw0KPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAjIyMjIyMjIyMjIyMjIw0KPiA+ICtIT1NUX01JQ1JP
Q0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1JfVkVSU0lPTiA9IDIwMjMuMDYNCj4gPiArSE9TVF9N
SUNST0NISVBfSFNTX1BBWUxPQURfR0VORVJBVE9SX1NJVEUgPSAkKGNhbGwNCj4gPiBnaXRodWIs
cG9sYXJmaXJlLXNvYyxoYXJ0LXNvZnR3YXJlLQ0KPiA+IHNlcnZpY2VzLHYkKEhPU1RfTUlDUk9D
SElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9WRVJTSU9OKSkNCj4gPiArSE9TVF9NSUNST0NISVBf
SFNTX1BBWUxPQURfR0VORVJBVE9SX0xJQ0VOU0UgPSBNSVQNCj4gPiArSE9TVF9NSUNST0NISVBf
SFNTX1BBWUxPQURfR0VORVJBVE9SX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kDQo+ID4gK0hP
U1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9ERVBFTkRFTkNJRVMgPSBob3N0LWVs
ZnV0aWxzDQo+ID4gaG9zdC1saWJ5YW1sDQo+IA0KPiBoZXJlIHlvdSBuZWVkIHRvIGFkZCBob3N0
LW9wZW5zc2wgdG8gYXZvaWQgYnVpbGQgZmFpbHVyZS4NCj4gDQo+IFdoZW4geW91IHRlc3QgYnVp
bGQgcGxlYXNlIHVzZSBidWlsZHJvb3QvdXRpbHMvZG9ja2VyLXJ1biBzbyB5b3UNCj4gd29uJ3QN
Cj4gdXNlIHlvdXIgZGlzdHJvIGhvc3QgbGlicmFyaWVzL3V0aWxpdGllcyBhbmQgeW91IGNhbiBj
YXRjaCB0aGlzIGtpbmQNCj4gb2YNCj4gYnVpbGQgZmFpbHVyZSBkdWUgdG8gaG9zdCBkZXBlbmRl
bmNpZXMuDQo+IA0KPiBUaGFuayB5b3UhDQo+IEJlc3QgcmVnYXJkcw0KPiAtLQ0KPiBHaXVsaW8g
QmVuZXR0aQ0KPiBDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzDQoNClRoYW5rcyBmb3Ig
eW91ciBmZWVkYmFjayBhbmQgdGFraW5nIHRoZSB0aW1lIHRvIGV4cGxhaW4uIFRoaXMgbWFrZXMN
CnNlbnNlLiBJIGhhdmUgcmFuIHV0aWxzL2RvY2tlci1ydW4gbWFrZSBub3cgYW5kIHNlZW4gdGhp
cyBlcnJvciBjcm9wIHVwDQp0aGVyZSB0b28uIFdpbGwgZml4IGFuZCB1cGRhdGUgaW4gYSB2My4N
Cg0KVGhhbmtzIGFnYWluLA0KSmFtaWUuDQo+IA0KPiA+ICsNCj4gPiArZGVmaW5lIEhPU1RfTUlD
Uk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9CVUlMRF9DTURTDQo+ID4gK8KgwqDCoCAkKE1B
S0UpIC1DICQoQEQpL3Rvb2xzL2hzcy1wYXlsb2FkLWdlbmVyYXRvciBcDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBIT1NUX0lOQ0xVREVTPSIkKEhPU1RfQ1BQRkxBR1MpIiBcDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMREZMQUdTPSIkKEhPU1RfTERGTEFHUykiDQo+ID4g
K2VuZGVmDQo+ID4gKw0KPiA+ICtkZWZpbmUgSE9TVF9NSUNST0NISVBfSFNTX1BBWUxPQURfR0VO
RVJBVE9SX0lOU1RBTExfQ01EUw0KPiA+ICvCoMKgwqDCoCAkKElOU1RBTEwpIC1EIC1tIDc1NSBc
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkKEBEKS90b29scy9oc3MtcGF5bG9hZC1n
ZW5lcmF0b3IvaHNzLXBheWxvYWQtDQo+ID4gZ2VuZXJhdG9yIFwNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICQoSE9TVF9ESVIpL2Jpbi9oc3MtcGF5bG9hZC1nZW5lcmF0b3INCj4gPiAr
ZW5kZWYNCj4gPiArDQo+ID4gKyQoZXZhbCAkKGhvc3QtZ2VuZXJpYy1wYWNrYWdlKSkNCj4gDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
