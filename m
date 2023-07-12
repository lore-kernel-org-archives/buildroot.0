Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0A5EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 12:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C25038272D;
	Wed, 12 Jul 2023 12:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C25038272D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_M9McaZdHZj; Wed, 12 Jul 2023 12:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20FA822C0;
	Wed, 12 Jul 2023 12:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E20FA822C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA70D1BF3C1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C353A822C0
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C353A822C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppZJ4DgCDoAZ for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 12:48:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBDC182299
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBDC182299
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 12:48:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="235076422"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2023 05:48:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 05:48:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Jul 2023 05:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWnDYvdoB/ipq/Qw7vDM6Nh67syw0r7oUjk7DOej0t5jsEG/BhAr+0m5CkvAWODEe3NR3mVT/q7yJq52YGbyTFCXtBs8Cs/8q9AldwBPtaUf5TGWbaZgcLCNdgr47jmGfRr7np35V1nxO2NqVlXulQ4uXs6msPFEhcSgH9rbETJoV+bjXTLC8XM4mwyYCxq1ONuNNzLzCIwsjAeYOh0rm+RiSNpLYl22wgMXv9Wz4cKUUFKgoRkqQnTVEmmsOpUxpNwI0pz3KUFbEQAe0FZK+bZ3Uijuw5LGvcfUmmVHjBSjqpu2uYDw+zBfvtwqEZZZkE/F7+ouLCFFWGeMyHLHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LC3+N0BiN5bt41sSkd+JwBFkCZ7I7qs64ZSFw1sktGo=;
 b=BZ6+/pHJaHOp11eZNY5EFxc+6T/kJwrIdZfiNrLDLDOpDJQpPzuuuiTF5uhBbujjBV5q60OtFBiIFiYNEXjwwPwh2xJ/NXyDWd7cDchtdbuuCkatI8xrMe+a2Ah1CiLPJQZHIYw5y0wzmn5TAGERPE1JrnwhIu0UvliR+UdXg2+78EDWBkBPXjV77qGSAZM4wYM4GK7x0hW7GmY1TbGsPVSftTUuh+t4yb8TDx4MLJSUisVYlTUsFjWKvN9CjcFNfvfjrdPKk6O8s+q709vR1UPUazUHCqyCpR1W5jJuxuC93quFOjqmZ5FWBOryh8S8D5GoLWD424fe5fPzPjvZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.32; Wed, 12 Jul 2023 12:48:11 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::eb15:939d:8fd9:a65d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::eb15:939d:8fd9:a65d%7]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:48:11 +0000
To: <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] [PATCH v2 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
Thread-Index: AQHZtJvJ/F6VOBZgHE6AZCABUpsmU6+14LiAgAAdcICAABM3gIAAA6MA
Date: Wed, 12 Jul 2023 12:48:10 +0000
Message-ID: <6bc39779544345114acaf33fdf95176c5fd8af7d.camel@microchip.com>
References: <67c6e46540dc806e0755ac377ba868da01ad3116.camel@microchip.com>
 <acaea49f-df76-ac2f-51ed-cc855cf23f28@benettiengineering.com>
In-Reply-To: <acaea49f-df76-ac2f-51ed-cc855cf23f28@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|DM4PR11MB6168:EE_
x-ms-office365-filtering-correlation-id: ee45fbaf-c0f3-498d-1171-08db82d63feb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xSCqa6lg/A+P3iUhCME/E0j/q+7Am26DiuxkUOEUqeSXIiTifqi3KEmJAUOUGep6UWQHkA6vUvxah/295Lo1L80MSyFJ5onE1AhqW+06NCxH6F9i3ABmk0Tc5xQ7ULbRx3uLChctO+OIL4FRnk+z1E3dCsTAGordfI1rzkBHKqOV1oayGr1krrLpk0MD/PNNK7ep/e03yrRPcS28ymeQtK9x0FJ7Yn68repU2Btq0qsKrnulZE62CNge8QaLxVu+E1zfum6wOepFLQIhdSgRdGM1gBK7b7XqGHcVX2M4wZ0Idb7PiV8v8U3tw0V4FRmzd5ao5/N0SkpnnFA3c0Ev7ymx47TNb+fJ5twRok5EhTmEvxcFarzJHjYecZuHcTCt4MoWHvE48R8VOrlP7n+aNgSZyJEnWCHJpg89V3Z3gNSgfCEc7YecxJjhxUTIMpNCU/9Ef81adCVHFM6f79yTnh2LGts5Kxc10ipf4194OHLPWvfVMEM0dc7wQ43U6f1qJri2f+VrtdSrR9DNqhBF8kHmwrRM6juHAf1p8ELia2e4ds3nRGmrPQw4H+lpMgpxQ356Oyh1cyvsgKh/uBL1VSx1ZHnLjaY6KHeeLKeJOp890Sh4+i1Pfkyd0uDP8Jq0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(6486002)(71200400001)(478600001)(54906003)(122000001)(8936002)(8676002)(5660300002)(36756003)(2906002)(86362001)(38070700005)(4326008)(6916009)(316002)(91956017)(66476007)(66946007)(66446008)(64756008)(66556008)(76116006)(38100700002)(41300700001)(107886003)(26005)(6506007)(83380400001)(186003)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2Q2eVQyRFhXQTRlYUlPMFVlaHdGNk1YVElpWENJcElCOExBclBSa1RYMDND?=
 =?utf-8?B?c3hNSUROaFlveVNOOFFZUEVMZXhSTUVZODVEZkxaUGRUaXV4UzVVQXQ5RkFl?=
 =?utf-8?B?OVkrQTZCYnhpb3JpUzlBWS9WVHdEQXdXRWVFdG56emtrR2YwbFA1aC9FenpT?=
 =?utf-8?B?VjUvQVBYTnY4c1djYWZmR2ZqSVNJYzdmRWFWODNzUHUybEkwcFV2TGZCSW1N?=
 =?utf-8?B?UFBDc250UW44Y3FpdVJER3ROSnEvNGpPRzdRWHBJVkI2ZXl6QkRrK2tvUGtm?=
 =?utf-8?B?T0loOVoyblpoZ3VLckgyUXMyZnYra01reGxmM09lRTBPQWY1VEFzbVZQZi9I?=
 =?utf-8?B?cUlJU2prL0xYWEZkRys5VWtLcVM5ZFhVUjFKc1hkOHBra0NrZ3RhUmNTSVIw?=
 =?utf-8?B?dDNlSzJrUDBubXlsbjR2L2o1MnJIWW5ObXdERHUwT1F3ZmVjbE9SMlZrWEVT?=
 =?utf-8?B?OW1sQURxUHpNYUFOOTFGL3NEbG5rM0lPSFVPb045bkp6S3g5d05zKzZCcjMw?=
 =?utf-8?B?UEhUck5GYU5vVFpRNW9YMU83L05pdjVWRG1nRkNEZm9oL0RtMXJsQ3Z2VkFM?=
 =?utf-8?B?ZlR0WDJXYjZZeVVJZWYxTlZ0WU5yYmt2WU94aVNLcDgzcWFrbXlPZ1pVNUR6?=
 =?utf-8?B?VmtmSm1hL1lhT3Bzc0YyTTdjc3FPd3BJcldXSzRsYWozZDFjMTc5YXpldzR5?=
 =?utf-8?B?NnBzMnV6OHZFdDRWOWhXVTFFRThVaGM3dUdZemlxS1JBM1Ewa094U2VCUExS?=
 =?utf-8?B?cVg4UHd5anJZYkxPd1B5RHBUeFRDSHpEY3U1MzVBQzFhdCtKTmJObUlvOFR1?=
 =?utf-8?B?czFFK0FyOVpmUGJIUXlNcW1IU3JvRzduNE9uNjdKUUQvcW4zdXNDNnZrYjhi?=
 =?utf-8?B?QlVvSjkwdFR1THNlYTBrZXhTOVF2ZzR0U01tS0VObk1BTUhHRDFaS1FRZ0Iw?=
 =?utf-8?B?Wmg3aU9wcG1wQ1RVQUkvNENEVjVBaWs1K3BZeTVvK1B0Z3RuTU9mdVF4c2U2?=
 =?utf-8?B?Z2J5RzdhNVBrYWMxSmYzYkhMeGlQYzZsclE2bElXQ1pSd3hsVkFycHN1b3Zw?=
 =?utf-8?B?WkhrUUJXYWpQaGFvaWcyWUYzeCszalZmZGh6NkdVL1VaeHNSeGNReVZIM01D?=
 =?utf-8?B?eXBhbnBqYzNZMVJiSDN4VVhLTE13NEFYWWFzeWlwT08vSUpURmZTcG1WYTlZ?=
 =?utf-8?B?c1Y3YVF0b2V3aktoRE5UcS96c0lSN2Z4TnZVQ1hrelhtMmNDT2c3aHB0a1Zm?=
 =?utf-8?B?T0xJOThnaTlqeVhOeGE0U1VMc1JLeE5odGIraU0wbGNBb2VMM3E1SDZSL3pY?=
 =?utf-8?B?WjVsUzJ6Z1BFeThpdTYzcjJkUWM1WmQrZWVZQnRkNGlZeE9KS0d3Q3JFM3dV?=
 =?utf-8?B?ektqWVplL3lmWlg2SmFKQ1l3dEF0MmJ5WVpWT0F1VjZ3aXk4bEpNSFNxSnJs?=
 =?utf-8?B?K1p0alUzdStranEvbzhLTGd5eE8zbS9SMit0bkJFK0lZUG9oamhFbWtWazhk?=
 =?utf-8?B?UHRuZXJqV1VVaHZTNmRDSVhwNHl0QTc0UnBKa1pvWUlYNTRvc2JwZ1lQME43?=
 =?utf-8?B?YkhrSkYyMzdPUFB1ejZkY20vSVQyaFRkVVdjV1BMYkYyL3UrQTBncVJYZGQv?=
 =?utf-8?B?OGVWTi8xWFNNZ253TndNLzFLNUcwL3hzNFN0bGhCV1NIaHc4S3NpR2t3OHhR?=
 =?utf-8?B?TUlpWEpvaFBNdmZXS201RVBneEdEbTFYZ1FDN2orNUlMcXRKemtFaEVmVlNP?=
 =?utf-8?B?T2RUNlBQbnk2ODRpSDBWRTdIQ09QdUpQNkI5SHNuc0xPbGs4NlRQOFF1UlJ0?=
 =?utf-8?B?ZjJ1ZlRKUjdKSnBuZDZYK2NBTjdMeklIZ1JDVlhaVnpLb0E0SHBub2tWZDlH?=
 =?utf-8?B?eXE1eU5lS09EN1JoWmF4T2svQWJrcUtYaFZqQ2dnZ05tdko5OU1FWFZ3Y1Rt?=
 =?utf-8?B?aVQrcS82anhKbkV6dDJTNFVhUDR3d3FzUFdMeXNZdEtHVGUzc3NZbHE4aWN1?=
 =?utf-8?B?QlR0a1lnK2hlY2hJenJwQitkaWRRN1lUV1pnL0pqc1ppeHppenpKdDRacXRG?=
 =?utf-8?B?N3k2QlF0dHdYV0xNOEFDOFF6YldXRnNabWduOUFsc3NIWGE4VGpZZm5QcU9L?=
 =?utf-8?B?cUNDanVDTTdVaFlMemtCMU43MXJVTmY3V3RaQlM5bjd4T20zbHlkc01tOG9V?=
 =?utf-8?B?R2c9PQ==?=
Content-ID: <13990117B15CC5449514B2653D107454@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee45fbaf-c0f3-498d-1171-08db82d63feb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 12:48:10.9718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4olasf2p6UM7HECQHmXFHWllRySioIG0usZOltK0CoB7ekC2dIWA2NyNnfroo9O4KVdZxH0hvoRwuKOQ0wD9SjMCTV/TOYckP3v/61tRic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689166095; x=1720702095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=LC3+N0BiN5bt41sSkd+JwBFkCZ7I7qs64ZSFw1sktGo=;
 b=wnvIZxdPagBIgtOuWF01mdomA5EzkOVBWlgd7+oAjjJmtKg614Lxx8kH
 wZ2CRBqyImxw2XqlPObSBij/2VOniuokTFgF1eKPL/di/W1tUVJ2wQ2BP
 EPf++tCrHuDUQOAMWGxC4hA9sbXQ4ikr1Jxtb+1mQD9Sf83CJmaSwqgjW
 HyeBov8ic8O7Q9eZ9Mg7F9mWG0RSvUKZgl96uEy3ZDuAz9rc57aU69G1m
 ep6QlUMIGT9cwajsp8cbJ/KPvq4ylcpS4v9n04ioMN+ymDhhpLyagid+J
 kK2IfwEBRaIgcz/wfQwO2YQO04ALBGrA1FyCAqK1E4KTsgEu/c22o4uQw
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC3+N0BiN5bt41sSkd+JwBFkCZ7I7qs64ZSFw1sktGo=;
 b=h8rnj5h/wXhkIcSqtLzE9cyj/6YC//zw9N5wA1+Z+3pvQhTteS10+jUd6f8nytFnNJsnmKrbDvO2hJ6enmIod5wWRHHAasBYZayetDzunbpCfvACIn8zPOt+yI++0ocRmtV0ZduI4SQkmmo+VVZzQwjHJvEZT2a2LESyw6nQ7wQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=wnvIZxdP; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=h8rnj5h/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/microchip_mpfs_icicle: add
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
Cc: Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
 Conor.Dooley@microchip.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2023-07-12 at 14:35 +0200, Giulio Benetti wrote:
> 
> > > > diff --git a/configs/microchip_mpfs_icicle_defconfig
> > > > b/configs/microchip_mpfs_icicle_defconfig
> > > > new file mode 100644
> > > > index 0000000000..f3a8c5d4bf
> > > > --- /dev/null
> > > > +++ b/configs/microchip_mpfs_icicle_defconfig
> > > > @@ -0,0 +1,33 @@
> > > > +BR2_riscv=y
> > > > +BR2_riscv_custom=y
> > > > +BR2_RISCV_ISA_CUSTOM_RVM=y
> > > > +BR2_RISCV_ISA_CUSTOM_RVF=y
> > > > +BR2_RISCV_ISA_CUSTOM_RVD=y
> > > > +BR2_RISCV_ISA_CUSTOM_RVC=y
> > > > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> > > > +BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
> > > > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post
> > > > -
> > > > image.sh"
> > > > +BR2_ROOTFS_POST_SCRIPT_ARGS="board/microchip/mpfs_icicle/genim
> > > > age.
> > > > cfg"
> > > > +BR2_LINUX_KERNEL=y
> > > > +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > > > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> > > > github,linux4microchip,linux,linux-6.1-
> > > > mchp+fpga)/linux4microchip+fpga-2023.06.tar.gz"
> > > > +BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
> > > > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_i
> > > > cicl
> > > > e/linux.fragment"
> > > > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > > > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-icicle-kit"
> > > > +BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR=y
> > > > +BR2_TARGET_ROOTFS_EXT2=y
> > > > +BR2_TARGET_ROOTFS_EXT2_4=y
> > > > +BR2_TARGET_UBOOT=y
> > > > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > > > +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> > > > +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
> > > > github,polarfire-
> > > > soc,u-boot)linux4microchip+fpga-2023.06.tar.gz"
> > > > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
> > > > +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_i
> > > > cicl
> > > > e/uboot-fragment-rootfs.config"
> > > > +BR2_TARGET_UBOOT_NEEDS_DTC=y
> > > > +BR2_PACKAGE_HOST_GENIMAGE=y
> > > > +BR2_PACKAGE_HOST_MTOOLS=y
> > > > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> > > > +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> > > > +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> > > > +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/microch
> > > > ip/m
> > > > pfs_icicle/uboot-env.txt"
> > > 
> > > You also need:
> > > BR2_PACKAGE_HOST_DOSFSTOOLS=y
> > > to generate the final image.
> > > I've catched this failure by using buildroot/utils/docker-run as
> > > pointed
> > > in previous patch.
> > > 
> > > Thank you!
> > > Best regards
> > > --
> > > Giulio Benetti
> > > CEO&CTO@Benetti Engineering sas
> > 
> > I have ran a test build, check-package and shellchecker (and fixed
> > all
> > errors that cropped up) with utils/docker-run but have not found
> > this
> > error mentioned above without adding
> > 'BR2_PACKAGE_HOST_DOSFSTOOLS=y'.
> > Could you expand on where you are seeing this?
> 
> That package adds host mkdosfs utility that is used by genimage while
> creating boot.vfat partition in the final image.
> 
> So this is the build fail log using utils/docker-run:
> ```
> INFO: hdimage(sdcard.img): The option 'gpt' is deprecated. Use
> 'partition-table-type' instead
> INFO: cmd: "mkdir -p
> "/home/giuliobenetti/git/upstream/buildroot/output/images"" (stderr):
> INFO: vfat(boot.vfat): cmd: "mkdosfs
> '/home/giuliobenetti/git/upstream/buildroot/output/images/boot.vfat'"
> (stderr):
> /bin/sh: 1: mkdosfs: not found
> INFO: vfat(boot.vfat): cmd: "rm -f
> "/home/giuliobenetti/git/upstream/buildroot/output/images/boot.vfat""
> (stderr):
> ERROR: vfat(boot.vfat): failed to generate boot.vfat
> make: *** [Makefile:815: target-post-image] Error 1
> ```
> 
> It should be the same for you. By the way, are you using latest
> commit
> on master branch? This is because docker changes from time to time
> and
> maybe the one you're using could have mkdosfs already installed, but
> it's unlikely.
> 
> Let me know the results.
> 

Hi Giulio,

I am not getting that error from genimage in my docker container. I am
using the latest commit on the master branch: commit
876ad67ac07be4b7900a4ea6464e7459e2b40604. I will add the package anyway
to avoid this error cropping up for anyone else.

Thanks a million,
Jamie.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
