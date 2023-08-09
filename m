Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5454CC04A6A
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 14:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9EE83376;
	Wed,  9 Aug 2023 14:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9EE83376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AO8QSQo8kYvA; Wed,  9 Aug 2023 14:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 170D980ED5;
	Wed,  9 Aug 2023 14:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170D980ED5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 687BE1BF471
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 14:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41F6E612B4
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 14:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F6E612B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cgxQarNGNht for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 14:43:35 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48FA1612A0
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 14:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48FA1612A0
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="240696857"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Aug 2023 07:43:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 9 Aug 2023 07:43:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 9 Aug 2023 07:43:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gi8nE2fYLAYKTk1zbDAMaI186KM/zgwfV6tVy8TjxmLfob6KaIp2309r9ahbH7zDPegsCVbMtU2UcP7cerDl5n8QzSlDFlzdLSCdkHnXDrRJ0l4rC8KWRswBA4zY+53+MougnY9OXndl7Ni9Pc2PP74AZxaaJg+wjLVrRbMvnyGVIjuBbQDw/Gxty5DGyZ7LunIw7BcdQGpp1bNj4mGLLJNqbaubV2l7mFq1LXvcawhGigjrUGBIxMVUVSNrupsHcomJzNZzH+BVSGsSCFl+vs5Qi1AIA2jkAzN9RPNnMzbRqj9qE9a1LqMrD022vdIXtq4FMDV250MoD8CUmgY18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHTg7kszcfXqSQZL8uLMp+NHxrOUBz+CIKnoRi+hZmI=;
 b=JYwVF4uiKPgPINTR56ojI/PmE5vPQytFGpO51bbT51Go3VUp32I0GhaP0oI5rr0TRV0pY0nlHT71C3NIz2f8JZl6enLiVoDLLgva55+d5EU/70/yYsWdNYz77gxDI78KnsheifdFWbBOknR+WS1oALEaH0c9gxs66eOEUIJ3b1SVsxUSQbipYAUyq5rPSPH79bXjh+oqBovYCnwn0Zi4is3A4nvQWoCjY8ordJgBkEUqxs0fASeigOUHcv2VEWH/YfIMAtokMnIDegjQ5fszszf6x50l8UXE1badb0gw5eG12ZjPir6PtsLNmEnMMc9JYKibS/eSV5qBTOk55RJEwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.28; Wed, 9 Aug 2023 14:43:19 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d%7]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 14:43:19 +0000
To: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
Thread-Index: AQHZtL+rNz3spepjz0usLwXCbpd2eq/hHaqAgAEYkYA=
Date: Wed, 9 Aug 2023 14:43:19 +0000
Message-ID: <40906858eaa11edb306b0f56e425d7b13948e0b9.camel@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-3-jamie.gibbons@microchip.com>
 <20230808235919.0002f19d@windsurf>
In-Reply-To: <20230808235919.0002f19d@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|DS0PR11MB8740:EE_
x-ms-office365-filtering-correlation-id: 561bfcc6-eaf1-4f1f-6ec4-08db98e6f962
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0q3kCl7nzkm9oTN3an6yS6HQt7kyH8K3x0M+YmFSBtBoflTMtJZ1QTb9SxoApWNIHkrjUUup4MIJwv7RNMjvqJ2vCdYYQsQwS5xos1gF/X6FcCQt53OFLqXCwF+C+Wf1I2Bg1FMfou9/S33a+ma2fYI8Y/Tq0oERZbnCUS+n5oXCHPjNK7J8PKWrd7Tq7z8U4Tr+IiD0GEvQzoNRautA84ecszcN5yUQ0DNG9dZBjTD+b8slOpQJExOHfSZgXE817lodR6PtleS3YqWnx18mMx4sEIFg7Nv+rhP08bdu+3M0FUd87zVEwKu4i5ONk0x3Hbp/qQoB6dQ0m+ROSSglvyvRL7ZYZnd/5MLVLjdG2Bch9AWBFW6qQaHU+TbNpGo4B/wuezgYf57OtRZNEr4BBMXSmmaFnzK/vuWi0tEQDPsNKdi5GhuDfaj4R0SdSY1ajtZvCiphoL6ufHuhyxp40/RbMhq8oWSvjEo0Xii2GPaA/mlpcRSi5+CFIC9/p9QTJA5+aV5q7xrkHpnm+qyWUMjzWQQmSGYQ6NFrLFnSOmsozICDUvwQCjNg9WXGEZWBRjWGpaP8PJQn6BvZzBb2ojYmjSwU+njff1AXyrA74dJn3rBRsBnOKIaIBG+djO2B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(186006)(1800799006)(122000001)(91956017)(2906002)(86362001)(316002)(2616005)(38100700002)(110136005)(54906003)(478600001)(71200400001)(76116006)(66556008)(6512007)(6486002)(4326008)(66476007)(66946007)(66446008)(64756008)(83380400001)(107886003)(6506007)(38070700005)(5660300002)(26005)(41300700001)(36756003)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHBLZjlmWnllR1BLY0ZrNlZQQVc3eFJaaDMwL0VTaHl4TE92aXBsWk5NMXJj?=
 =?utf-8?B?aHEzejlCOVhCaU91Wk1YeGpVT25FWlFVSzlrNFBPNzNZS0I0L1I1Y2krT1Bo?=
 =?utf-8?B?NDd0ZjR6ajVTQjE1emJySWt0SEk4cG9zNVdZMVJHcEl4ZXEzQzlFMm4ycWlK?=
 =?utf-8?B?dkV6NDlINUh5bUpheXFlMmFtU3p1NjB6ajRwSjBkaWNDNkdxK1dudkFrTmFT?=
 =?utf-8?B?cFRScWFwOE01a1hGNmN2Y01rbjdkelRReERwcHFxT29uc05hN3FzZmhHZGJN?=
 =?utf-8?B?d0o3NzF6UkY2NW1mN1JOUkFpOHYrSm1YdHpITW9ZWU5yWnRSSHU5ZmRmMkJX?=
 =?utf-8?B?eWVTTDdlbE5MK1R2Y1F3K3dyT1pVWS9FVEJJc0tQanAvOWJ4Uy85cU1kd1ps?=
 =?utf-8?B?djdUYWoxZnVUS3JVZ3VQVStsZkF0UXlUaHhFMWVDWEZ0cUFoUEdvQ0FqZ3Fh?=
 =?utf-8?B?SG5vVjRjM1RBc05YNzd6UzlKR21UVUI4ODJwVmhNY2RIY3FlQnN0TkhRUDNR?=
 =?utf-8?B?dU9oS0pGblBQaGFsTDNiZ1czOUZ1alFaL0ZucWxtQ2xoRXNFNXB0K2VveXBG?=
 =?utf-8?B?ejNVNzhoK3RhSzdQQnU3ZUdnU1hUOWxvT3EvY0JtQlFCRVJxY2VWZDFIRGk3?=
 =?utf-8?B?ZEpNa0NYMVRGWWFJeFl1WmNYcEludjFGVXlBTEdYQS9VTi8xUk8xY2ZETnl5?=
 =?utf-8?B?NmlaUzFHamZ2dittQmFnMWIrMll3QmVZdUllM1grTGFMZFhrVFYxMGRpNUxO?=
 =?utf-8?B?eVFqWDBoRWJQejBRMit4YzI5czh1QmRUR3F0VlRsalRRVWtzUXkyZ21GRDQ2?=
 =?utf-8?B?WEYzUTMveHJobzNKYS9vdlVSQ09EY3FtKzkwNkZRTFdTVkpocUtxd1E3cXl0?=
 =?utf-8?B?bDJrK3JpSjJtYlhNL1JhWWJZdmNoWjQ5NzBUcXdaSnJCZWRrWS9Ndi9BR1BX?=
 =?utf-8?B?b3lFYzlLeW9OR0d1Q0tFZVI1bVN6Zm5OMXNyb2ZnWkFqV3hGR3RBMVB2Y3FS?=
 =?utf-8?B?aUw4SUl3UkNKOGIzNjZpdml6cFRzS3hRWjBEYU1iaWM0UUowWEU1ejgyMGhD?=
 =?utf-8?B?SGhmMjhnSE8zUUVKWFlYUzZSd09Dc29YTnBGR3FDSnpGZGY1anNsdE90MmYy?=
 =?utf-8?B?a3JuS3N5MEYwMW1mN1g4dy9nTU10cmtCdnZpQTRiZ0JicHErYVA2Q3RTT3R3?=
 =?utf-8?B?M0ZYdlR2Um4zOVcxUEM3UFowekhXSUNGVnpPUnE4c3dxSVYvNCtvWWlDQWVK?=
 =?utf-8?B?VHhNUVJ0QUJUR1o2OXVvV2dkaTZ5N0s3dmZzOWt2eEIvMXBmcXpWS3V4M2kw?=
 =?utf-8?B?L2ZiOUdJNFdCZ2JyMThjOWVkQWdBRHdnQUVEdGlpVE1mUkpHRFRRY2Y2a3ln?=
 =?utf-8?B?cmZqelZ2WEhhalplRU1tOEJnWTRtMFhmbUJvL3oreE9TWnNCR2pYOWxzdXF2?=
 =?utf-8?B?NldtNGhmeWx0enJwNWo3dEFIZW15MnZXcTc1Nk9LWlZxMGFBTWZLRjJZWEp3?=
 =?utf-8?B?TGJ4NitYc1hDT0FuSzlYamIzK1dzTjRpbHNzQk96MUVqbE5NOG9FRTkzWmVx?=
 =?utf-8?B?VVdPa3pqQXNDaEd5dW16NU4wM1JxbnVWWWI4TU9JMWdFZTUxUytOTTA0MGd4?=
 =?utf-8?B?VUlnb1RuYjIvUkhYMnNSOWx2NTNwVTdFWWxGZ1ZCMTY2alk4WUpiQWJvNFMr?=
 =?utf-8?B?RjRhNk45NTBSMVc0TmhvUmVndjkzVFhTTlVTUUZFcFIzbmJSbW96dnl2eXE3?=
 =?utf-8?B?WXg3L2FnVnN5WUl5QUUzbG9oZ0Q0Qld4QzNYdG9HcFVIck52dXlsU3FXMU9F?=
 =?utf-8?B?SVhjWnc2dTYza2Y3NGIvQ0NNN3IydU1VV3BaOEMvdGd2UnZ6VDAzQzlGQXdX?=
 =?utf-8?B?YVRRaDJaVkEzSEx4MjNJdnV5Rk5rQUxmT0ZpbkZHQWlYWHJ3d2xyVjRtbXlB?=
 =?utf-8?B?RGhhSnZEbzRwZHVaazVHYURmc0drQjZua2tKODhNNFBJcWJHelRHZ1VuWTQ1?=
 =?utf-8?B?dUpXaEgrMmhYSDd3LzRudHFHZlpURk0xcml6ZWxFdk03Y0pra0ZDcGtJYk5y?=
 =?utf-8?B?YTI0bS9RLzZjQ2RVdmFVUU0wWjJoMjd5aUt2cVFSbys0VGNTZllpamxvbnVK?=
 =?utf-8?B?SThqRkhjMGdUZ0ZYTlQvdEZuc1QrY09MOU5yWHhXQUhHbWdiS205eEdzbysy?=
 =?utf-8?B?RkE9PQ==?=
Content-ID: <65F1C026B3AC98489F2BED896DBC021B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561bfcc6-eaf1-4f1f-6ec4-08db98e6f962
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 14:43:19.6926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9kuBrauFknUctzMl7udYyoPRZA6wveL/2jTWENbJwPx7/Yt3p1FD8wXZ0VfMuS+lrIE0AXmIb/Qq92VkOzOL66dsFgt/0rz0FRCoAY3VdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8740
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1691592215; x=1723128215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=uHTg7kszcfXqSQZL8uLMp+NHxrOUBz+CIKnoRi+hZmI=;
 b=fQI3bVkWUMxnjNMspaSoKfCdog66GW4soNZIDEgqnQYlooCUOSy2nEAU
 r33dYfSv55GXkBggEIOOPCQEIymylAUzxJrCcB0fjhKglfx320O9ZdyZ2
 7FLlBV1XZJko1OLJ3g5Iax9mePoPsRNp41dz1/GQiWneAjEBEub1QzNC3
 o21nvRd5ALuOjKU1UdpnOfx8IMtbqiUpJhn99W9iIL4DG/R64FK3cndbh
 x/9lbJfLZTogmf8dZwiclTVC1ogmfvUC6gt+ERt5cQaXAptyEMblXA5eM
 4xb50KCukJuUS8tU7ASkvq2BwbBjzcdgC1tbOnxBF/6ooBYD6WLgjz5ZX
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHTg7kszcfXqSQZL8uLMp+NHxrOUBz+CIKnoRi+hZmI=;
 b=mkXPfHMfjmUlGYdfXuhRF4GeKsyK1WRa0s7NTzWEFqVjU0/umZBpJpVp/F49h70omY1NGyAK8ukbZgAJ80Y25zstBdDVgCDZiuy4X3NMvCFyLLPhV6FuEFvrPzMfe3rQdE1Ned9WbHxZ0bRf32a8BlIwi52CNZHZ72FRku/OLJs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=fQI3bVkW; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=mkXPfHMf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue, 2023-08-08 at 23:59 +0200, Thomas Petazzoni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> Hello Jamie,
> 
> I've applied your patch to our "next" branch, with some small changes
> (see below), and also I have a few questions.
> 
> On Wed, 12 Jul 2023 13:51:54 +0100
> Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:
> 
> > +Creating a bootable SD card with genimage
> > +=========================================
> > +
> > +By default Buildroot builds a SD card image for you. The first
> > partition
> > +of this image contains a U-Boot binary, embedded in a Hart
> > Software
> > +Services (HSS) payload. The second partition contains a FAT
> > filesystem
> 
> Could you clarify what this "embedded in a Hart Software Services
> payload" means? Does it mean that there is additional code running on
> the target other than U-Boot, Linux and user-space? I don't see
> OpenSBI
> being compiled in this defconfig.
> 
> I'd like to make sure we have properly captured all the code that
> ends
> up running on the target, so that we are complete from a licensing
> stand-point.
> 
The HSS (Hart Software Services) acts as a zero-stage bootloader on the
Icicle kit. The HSS reads an HSS formatted payload from eMMC/SD that
contains binary images (e.g. U-boot) to be booted via OpenSBI. The HSS
includes OpenSBI so we don't need to enable OpenSBI in the buildroot
defconfig.

The HSS payload generator creates the formatted payload image for the
Hart Software Service zero-stage bootloader on PolarFire SoC, given a
configuration file in yaml format and a set of ELF binaries (e.g. U-
Boot).

Hope this clears up the confusion, let me know if you have any further
questions on this.
> 
> > diff --git a/board/microchip/mpfs_icicle/post-image.sh
> > b/board/microchip/mpfs_icicle/post-image.sh
> > new file mode 100755
> > index 0000000000..54cc6d71f8
> > --- /dev/null
> > +++ b/board/microchip/mpfs_icicle/post-image.sh
> > @@ -0,0 +1,13 @@
> > +#!/usr/bin/env bash
> > +
> > +BASE_DIR=$(pwd)
> > +HSS_PAYLOAD_GENERATOR=$HOST_DIR/bin/hss-payload-generator
> > +MKIMAGE=$HOST_DIR/bin/mkimage
> > +GENIMAGE=${BASE_DIR}/support/scripts/genimage.sh
> > +GENIMAGE_CFG=${BASE_DIR}/$2
> > +
> > +cd "${BINARIES_DIR}" || exit
> > +${HSS_PAYLOAD_GENERATOR} -c
> > "${BASE_DIR}"/board/microchip/mpfs_icicle/config.yaml payload.bin
> > +cp "${BASE_DIR}"/board/microchip/mpfs_icicle/mpfs_icicle.its ./
> > +${MKIMAGE} -f mpfs_icicle.its mpfs_icicle.itb
> > +${GENIMAGE} -c "${GENIMAGE_CFG}"
> 
> Simplified to:
> 
> +#!/bin/sh
> +HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
> +MKIMAGE=${HOST_DIR}/bin/mkimage
> +
> +${HSS_PAYLOAD_GENERATOR} -c board/microchip/mpfs_icicle/config.yaml
> ${BINARIES_DIR}/payload.bin
> +cp board/microchip/mpfs_icicle/mpfs_icicle.its
> ${BINARIES_DIR}/mpfs_icicle.its
> +(cd ${BINARIES_DIR} && ${MKIMAGE} -f mpfs_icicle.its
> mpfs_icicle.itb)
> +support/scripts/genimage.sh -c
> board/microchip/mpfs_icicle/genimage.cfg

Looks great, thanks!
> 
> 
> > diff --git a/configs/microchip_mpfs_icicle_defconfig
> > b/configs/microchip_mpfs_icicle_defconfig
> > new file mode 100644
> > index 0000000000..9ad1bf66d8
> > --- /dev/null
> > +++ b/configs/microchip_mpfs_icicle_defconfig
> > @@ -0,0 +1,34 @@
> > +BR2_riscv=y
> > +BR2_riscv_custom=y
> > +BR2_RISCV_ISA_CUSTOM_RVM=y
> > +BR2_RISCV_ISA_CUSTOM_RVF=y
> > +BR2_RISCV_ISA_CUSTOM_RVD=y
> > +BR2_RISCV_ISA_CUSTOM_RVC=y
> 
> So you're not a riscv_g core because you don't have the atomic
> extension?
We have selected riscv_custom because we have compressed instructions
extension (RVC) which is not part of riscv_g.

While looking into that we noticed that we don't have
BR2_RISCV_ISA_CUSTOM_RVA in our defconfig which we need to add, this
was because BR2_RISCV_ISA_CUSTOM_RVA was selected in previous versions
of buildroot using riscv_custom, and now it isn't.

I can send a patch to add BR2_RISCV_ISA_CUSTOM_RVA?

> 
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> > +BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-
> > image.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="board/microchip/mpfs_icicle/genimage.
> > cfg"
> 
> Option dropped, because board/microchip/mpfs_icicle/post-image.sh now
> hardcodes the genimage configuration filename.

Makes sense, thank you.

Thanks for the feedback and applying the patch.

Jamie.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
