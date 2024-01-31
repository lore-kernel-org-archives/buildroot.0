Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69208C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 10:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1C3184443;
	Wed, 31 Jan 2024 10:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1C3184443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NNlmaVMp4op; Wed, 31 Jan 2024 10:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E1484438;
	Wed, 31 Jan 2024 10:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E1484438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7EF1BF3E1
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 10:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DD9384438
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 10:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD9384438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9gtIAMkRliI for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 10:48:05 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 31 Jan 2024 10:48:04 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D722584437
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D722584437
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 10:48:04 +0000 (UTC)
X-CSE-ConnectionGUID: 3ifDNl5QRpSu4xFtUWmz2Q==
X-CSE-MsgGUID: gg3QcSCqQ5uFpE7cHyM8Ew==
X-IronPort-AV: E=Sophos;i="6.05,231,1701154800"; d="scan'208";a="246283812"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jan 2024 03:40:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 03:40:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 03:40:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX03oyPMKCrHAp+eRJw9U5uTrIUR3sBL5Z3BRhP5WUzNb/nd/c6ZUST3GPoySnCgzAKq348ymT2WH5ekND1WKQZuGZyW0PNiH14e8BdWq5V9GsoG2IXjwN6qBsYkPIXiBJLWGmtE68pHKPEZ7EdaGV97vxqNhspGJK5JzAi7I1ewf6rlBn+Slmyfh+V8Shr/l7cnGTh9C1z9F6Wkoih4+TnxxsE9E9udSLQfE8RN7dsa4KvMg+OXXPMvuw0+Zh0gnTBgxEzqW6E90jH5ICRzM6FB282hzlFh70dYWRvdNgJaImsBi6YTXfJlojKs8Lhnt4gcutSTGCtlZfRjM30UCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8b1mevc6pYha5E8bV0lGM6kt80DtH2A2vuQ6yqdceK4=;
 b=iidVi59w7MPOSfSUUNkMikIrLVkK+jXldkQap4Pxu4CqqQEN3uTGv06Ca6104FQszW75NGKKz0A9leC4lw80pTj4FM4f7HeXDBMy49EJUPqvPbvtbctECi6axwKfGLXBspwtLYZaOiQS4/GbeGZUrNEsAObkV20ZnqzkyC8V1B/Cy13QWk7GUFidSZNqBAasIN+0h7riU+PBBWFCpcZdl9YLRNOEwE11PX2iBq+8+wLQY3HNwS4nF6qV1w/PVwAIYu66gFzdYEdvP2FVQw5F4owqLCJZotxjO6xs6fB2v0ByAQdFV6upIULg/ipqWQfDhc1MwzXKddmWqtqEYaIdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ0PR11MB5615.namprd11.prod.outlook.com (2603:10b6:a03:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 10:40:43 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Wed, 31 Jan 2024
 10:40:43 +0000
To: <angelo.compagnucci@gmail.com>, <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH] package/environment-setup: replace variable
 KERNELDIR with KERNEL_DIR
Thread-Index: AQHaTocPoAaoDjOdLUOnnzxh6PVro7Dy0YuAgAACkwCAAPMKAA==
Date: Wed, 31 Jan 2024 10:40:43 +0000
Message-ID: <34e20e1e-9ad4-4184-9f35-56b25cc0386f@microchip.com>
References: <20240124-kernel_dir-v1-1-4125408cf65d@microchip.com>
 <f5a4aa23-fdb0-4c06-9f18-8ea0e69cbd7d@mind.be>
 <CA+TH9VnQSgdqVs6_SQn4012LHH8jyV562e-1e+AkYa2gttF-4w@mail.gmail.com>
In-Reply-To: <CA+TH9VnQSgdqVs6_SQn4012LHH8jyV562e-1e+AkYa2gttF-4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ0PR11MB5615:EE_
x-ms-office365-filtering-correlation-id: 0670506b-d6d4-4bed-1da1-08dc22491361
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m+wBX2NdiIUvzv4D62MlPFM53tvUzzy4Zth0GyPy6xBZr44etIghpcTDmLbxMsa1+Kc5mZemDCgkeVIWAJDWUQAldp6MQOT/tEcEP9I0wGLJzaVDMH4Xi8NwAGNj4QhllHjxijUlVLj07hzav5YS8zexoKLbnpfEf55/Hf6pMypvv+mOAuIE+g10JoWzeUnkX73PZ8LySazrDpOHkCinptG9dZk7R7iwoKFvErRyAzwq/RT0JK9kPvNhgpDw0WWaFUqOA5q46mCWogbyELmozibGYqs0PdoonTSqPCw1qEa3pzTaOaud5xDFEyUBxO363CaXr4SFgRZLK97ii2cj0f0RuiVFWOWLK57JQ5r5JykP5klF9ULoDc9QDsMtu3Oxv+AQOET8yxb8gpgBZr4IbDCsWqHuEC3Dze3yXVFGCFp7vt5t1Y6og8vSUvcLXm4ymbvJh+jYZWpe4voViICCqpN4KpvsghDeNKsbJjhsUYM3WGIrd4lh7mlKH6AZN3YOcwDJ2HQiZ3NdEXCkdjik8Dc7RK/e1JPP+ME2Znko5XZ7p//XhTMRYb12MIeg91tE8i9pacbnrsPwNUstNajTQ/ndRgxUVakneC7dyQ9ON68xMc0Ce7PAZB9UBbN8G8aOFsZpAJhgtmDn7BGqYsNqBaXc1M1BDZ/Tq4mBtUGvGfnv+eUfiWwUu53+HsFx28QtADmKsj1qqy0SzlWBEkuQTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230473577357003)(230373577357003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(26005)(2616005)(31686004)(966005)(6486002)(38070700009)(36756003)(478600001)(6506007)(53546011)(6512007)(71200400001)(83380400001)(38100700002)(122000001)(316002)(86362001)(76116006)(2906002)(31696002)(5660300002)(66446008)(54906003)(66946007)(64756008)(66476007)(66556008)(110136005)(91956017)(8936002)(4326008)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N01YcGhoRlVUR3pGd2hsakptdXJwd1I3YU80VzFQNWx3WmVaajNEbFEveTVU?=
 =?utf-8?B?Y3I4a1N0M2xGQUUyb3NBSUdOZDI5TTRUSjRidDRDL3ZleUJVOUN6bGJzRHo0?=
 =?utf-8?B?S0JuVGcwYXNiZXZORzEyTkxrdzkyVmludGlMZEphRmcwOVFoSGgyelAxTnFu?=
 =?utf-8?B?REZPN1ZvaU41dHdMVHBCTkVCQlJDWWYrbEhVYWZPVnJwdHZxcUpYYU14Q1hi?=
 =?utf-8?B?eVg4aFdkSU1WSHVRQWtIajFrNnhLWldRU3pFOWhqcDhZRDVTUzJFTVM0Ukxz?=
 =?utf-8?B?ZGY2ZFdHT1FBZ3lWcTdMWmFwRm5qMk03NnRoZkYxOVRDa0gyUXQ3SGVzTTNQ?=
 =?utf-8?B?NVJiUEtJM25ndGwxMVFNd0h0UVpUblpLOGNBbDAxRGlGRi9TeHV0TnlGSVBr?=
 =?utf-8?B?bStSQjBvZEVWNmVqQnBhMXFOQ0dkcFFubDIwUEQ0dEl2MFhGd3cvSWFtSjgr?=
 =?utf-8?B?QnpQYlZ1ZERyV3piU1FIY1NsVGZmVHhoc3pGVEpET20zaHlDeXVqRDg1UjNm?=
 =?utf-8?B?RkhTMnd5bXY4dlJMYVBEVml5UUpXdmNBL29CcmQ5SFdUcUc4a0tZVUlqd1lk?=
 =?utf-8?B?YjdMWGNnbWFobklhUGoyVDFXK3VpcTBFR2FPbkJJaXk3YVdZZ0pIVndtMU1m?=
 =?utf-8?B?TGlPa3hhcUtPUCtQczNGbDV0Wm5MU0Roc3FKOWpvU0tEaEJlUUVyQkg3VEFO?=
 =?utf-8?B?V3BET3h3Szd2MHhVWU85Nk9qTkFDSWFxb2F5ekVmeW4zM1RMdFNYeTlZWEdK?=
 =?utf-8?B?cU56WS9Jc0g0THRieTg3SCtoek9DNDA3ZmtVK1BEUmI4K1pEU0JiV3I1bXR2?=
 =?utf-8?B?WW8vTERLK29RbGxrOWxseHlnd244ZEVCZkxNV1BQaXRPckxsNU8xQVhmaUF2?=
 =?utf-8?B?cXZsNGpWVEQxSnJ0UDE5RWpaWExJM3pvSVNJeTJlaUNxbEdNS2MvVFNFUXVE?=
 =?utf-8?B?YkRCSE5McXdPR2FkaUhLTmVJUEJSeVZzVWFWQlBmVmJtSnBrNmRoWlJqc2NB?=
 =?utf-8?B?ZnNPbmVMbWIwTXVlREZOTXg4eUV6Qm1XT1VBWk43M21ENk1VRm5xQmcvK1Q1?=
 =?utf-8?B?L29pY1ErYkZrdGw0MUVYeVk1WDNDclNZNWg3Q3YxWGFMa3dhOXIwWTVycHhB?=
 =?utf-8?B?TG1GZXplMFFrUGZXVGM0M2RML3FjM0s1NGRWYnk4L3Nwcm9rMDVNZ21hY21D?=
 =?utf-8?B?am0xYWQ2U0VWdDlZdEJCTTVXK0VWbjk5SUU5VVpRSk1aSG5vaS9DWU1EUVEr?=
 =?utf-8?B?cFpwclpTM2piczJPQStOUDVrVyt1a3BmMFRtNzZoT1cwTitNUktIWHU3dHh2?=
 =?utf-8?B?SUJDNGhYL2U3aVFpL3pLZW1ub1d2UUlyc3dIb3pqcFE5bTlIM3NudTVIUjZO?=
 =?utf-8?B?VTFJbkxlVGdnZjdSOTgxUCtiVWpDaDRpZHRYZHh5cEZTSzBwRlZBODB5YVBu?=
 =?utf-8?B?eVhmV3prZklnbDlPcTk0eFVUVU1VWHZvWDVmS0ZkYTlKSnR0cnlzMENsU2xy?=
 =?utf-8?B?Qk5laXJZUzdZR0t3ZzFpZHBYNlZXV1hWeC9Ub0VGa0FvNGF6b1JHbVdsdFpx?=
 =?utf-8?B?Nm90ajNMV2h0aTN0bDZPQ1VBTS9VWjZzTDNwSGREaU8rWDFyMlg0L28zZkN5?=
 =?utf-8?B?WkFWVHlwcnc1QWJLNDhIRUI3NzhDTFB4ZUZ6WE8rTDIrc1Z4b2FQMU5OV2ZC?=
 =?utf-8?B?eXVLQXpUOVhXQWVPNFF4YldFeDNNQW96YWNGOUdDNkNGMERvKzUxNGZSYlJX?=
 =?utf-8?B?akFIY2Erc2FldW1kdXJvUTNWeENGWEpsNE43VU1xa2FjRExvY05aNnRFbGp1?=
 =?utf-8?B?cGdHOHZPTXkyWHo1U1BqVnBVY2FTUHRyc2JFamdpOUJPZWFtaEtEZkdBTS82?=
 =?utf-8?B?UGNsVFFxSXFlNW54eE5xQjFzOUNqU3dobFJHNUswaW01aXRUbWhJU3ZPemRx?=
 =?utf-8?B?R0pPcnQ2VUVYYUl4cXhOWFlkang0N0N0dHBQOHR5b25PL3ZrQmVVUTZIYW9Q?=
 =?utf-8?B?WE0xclMwZEpuMDBBNHpDdGlhcHcvQWRDcFRWWm9HRHdoVWs5T2xHWUNKTW1L?=
 =?utf-8?B?c3hPL2h0QmpEM1ZTamdBZ0JYVTc2a0dEN0krNU5VdHpmRVJhSWU2bERGSkdU?=
 =?utf-8?B?OEdqUTZKcFBGQlFjQWNnUlVOVEFLTDU2eWErSjlOV0hKdlR4VkN3clAzaFN1?=
 =?utf-8?B?RVE9PQ==?=
Content-ID: <2906BA45E502E94480DDBF8089310BD8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0670506b-d6d4-4bed-1da1-08dc22491361
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 10:40:43.2434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mau+dUdObJq91f95gNWOCM4Pkb56d1+cYLWzRy3ffA06tMOrR7oAja2NV1K5is6iOih/4wl7LYOgmtatooUJ1s7lnFP+SF0buoSbbnfaZSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706698085; x=1738234085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=8b1mevc6pYha5E8bV0lGM6kt80DtH2A2vuQ6yqdceK4=;
 b=zRC23wJDGT/g+Aa3pDzP3XJU02Kkr/GA0S0KrB4qSoOOKk0vu2LKgu4a
 sAkxiRYTLIIiBSzH+H/RYng7NW+hYXABt6cKa2cUSpQ/SaLmDPPQgj4cU
 pBdAoaMVUYzCPvCtNlsp+BElQ59XeW+xkQLkuASBiE3bjxAz0n/AjKgUG
 Huz4E63kosTPr0Qite8RNi2ff9QkQzzP0UlwTd48aWkKWeFoQQ0GcYG/Y
 gilCbqHjrfpeQ/o9EDOu9OmseUFi1qjdunvwiEzwjd0XN1Sn4jlSHL8QR
 4QWH9/hZxGZaJv4JmqB0qXz1oAER3zlSC9Obhk7SoUwx6xiDoo8HiAvwC
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8b1mevc6pYha5E8bV0lGM6kt80DtH2A2vuQ6yqdceK4=;
 b=rfuTgxmFoXKqxp4L1sDHY6+LBGc9IaNNmitSTSdeXiZHw/x+67cwwwmsb7G8QHmUBqxalQNl272a+o+B6uCqyi046gj1D1Z7d80a7skLrFrm2d3nr4LkTL0IHkgfh5+XiybHnln9jPFEtbDUO7ULi6BGynahvHk0YVRXpe2yeCywYdbhRtho6IFPs/RJGGbeW6Slc31hgJqhgBXbOVau9tZXj4N9/dYpsXi/fM1Btbp/qFD+ijDZgGRY6tlYH1lwu+qxlRfszhdb2Hlx/GYSlcyAZsW2aZqRbbvy1lMXVe1pXmA7u3RNtX6f6/m9+vvUu774g4FCLRg4ATZ+euOMmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=zRC23wJD; 
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=rfuTgxmF
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH] package/environment-setup: replace variable
 KERNELDIR with KERNEL_DIR
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayabbasha.Sayed@microchip.com
Cc: angelo@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMzEvMDEvMjQgMDE6NDIsIEFuZ2VsbyBDb21wYWdudWNjaSB3cm90ZToNCj4NCj4gCQ0KPiBZ
b3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNv
bS4gTGVhcm4gd2h5IA0KPiB0aGlzIGlzIGltcG9ydGFudCA8aHR0cHM6Ly9ha2EubXMvTGVhcm5B
Ym91dFNlbmRlcklkZW50aWZpY2F0aW9uPg0KPiAJDQo+DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgDQo+IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4NCj4NCj4gSWwgbWFyIDMwIGdlbiAyMDI0LCAyMTowMyBBcm5v
dXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290IA0KPiA8YnVpbGRyb290QGJ1aWxkcm9vdC5v
cmc+IGhhIHNjcml0dG86DQo+DQo+DQo+DQo+ICAgICBPbiAyNC8wMS8yMDI0IDA2OjMyLCBOYXlh
YiBTYXllZCB2aWEgYnVpbGRyb290IHdyb3RlOg0KPiAgICAgPiBUaGlzIGNvbW1pdCB1cGRhdGVz
IHRoZSBob3N0IGVudmlyb25tZW50IHNldHVwIGhlbHBlciBzY3JpcHQgdG8NCj4gICAgIHVzZSB0
aGUgbW9yZQ0KPiAgICAgPiBjb252ZW50aW9uYWwgdmFyaWFibGUgbmFtZSBLRVJORUxfRElSIGlu
c3RlYWQgb2YgS0VSTkVMRElSLsKgIFRoZQ0KPiAgICAgY2hhbmdlIGlzIG1hZGUNCj4gICAgID4g
Zm9yIGNvbnNpc3RlbmN5IGFuZCB0byBhbGlnbiB3aXRoIGVzdGFibGlzaGVkIGNvbnZlbnRpb25z
IGluIHRoZQ0KPiAgICAgcHJvamVjdCAobGlrZQ0KPiAgICAgPiBLRVJORUxfSE9TVCwgSE9TVF9E
SVIgZXRjLikuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBhcmUNCj4gICAgIGludHJvZHVjZWQgYnkg
dGhpcw0KPiAgICAgPiBjb21taXQuDQo+DQo+ICAgICDCoCBEbyB5b3UgaGF2ZSBzb21lIGV2aWRl
bmNlIG9mIHRoaXMgZXN0YWJsaXNoZWQgY29udmVudGlvbj8NCj4NCj4gICAgIMKgIFdlIGN1cnJl
bnRseSBoYXZlIHRocmVlIGV4dGVybmFsIG1vZHVsZSBwYWNrYWdlcyB0aGF0IHVzZSBLRVJORUxE
SVINCj4gICAgIChmYWxjb3NlY3VyaXR5LWxpYnMsIHRpLWdmeCBhbmQgdGktc2d4LWttKSBhbmQg
dHdvIHRoYXQgdXNlDQo+ICAgICBLRVJORUxfRElSDQo+ICAgICAoa2VybmVsLW1vZHVsZS1pbXgt
Z3B1LXZpdiBhbmQgZ2NuYW5vLWJpbmFyaWVzKS4NCj4NCj4NCj4gICAgIMKgIEl0IGhhcyBiZWVu
IEtFUk5FTERJUiBpbiBCdWlsZHJvb3QgZm9yIG1vcmUgdGhhbiAzIHllYXJzIG5vdy4gSWYNCj4g
ICAgIHdlIGNoYW5nZSBpdA0KPiAgICAgbm93LCBpbiBhbGwgbGlrZWxpaG9vZCB3ZSB3aWxsIGJy
ZWFrIGEgbnVtYmVyIG9mIHNjcmlwdHMgdGhhdCByZWx5DQo+ICAgICBvbiB0aGF0DQo+ICAgICBl
bnZpcm9ubWVudCB2YXJpYWJsZS4gU28gSSB0aGluayB3ZSBuZWVkIHF1aXRlIG92ZXJ3aGVsbWlu
Zw0KPiAgICAgZXZpZGVuY2UgdGhhdA0KPiAgICAgS0VSTkVMX0RJUiBpcyBiZXR0ZXIgYmVmb3Jl
IHdlIGludHJvZHVjZSBzdWNoIGJyZWFrYWdlLg0KPg0KPiAgICAgwqAgQW5nZWxvLCB5b3Ugb3Jp
Z2luYWxseSBpbnRyb2R1Y2VkIEtFUk5FTERJUiwgYW55dGhpbmcgdG8gYWRkIHRvDQo+ICAgICB0
aGlzIGRpc2N1c3Npb24/DQo+DQo+DQo+IEkgdG9vayBpdCBzdHJhaWdodCBmcm9tIHRoZSBMREQz
IGtlcm5lbCBtb2R1bGUgbWFrZWZpbGUgZXhhbXBsZS4NCj4NCj4gR29vZ2xpbmcgYXJvdW5kLCBJ
IGNhbm5vdCBzZWUgYSBkZWZpbml0aXZlIGFuc3dlciwgcHJvYmFibHkgZXhwb3J0aW5nIA0KPiBi
b3RoIGNvdWxkIGJlIGEgbmljZSBpZGVhLg0KSSBhZ3JlZSBrZWVwaW5nIGJvdGggd291bGQgYmUg
YSBuaWNlIGlkZWEuIEkgd2lsbCBzdWJtaXQgcGF0Y2ggdjIgDQphY2NvcmRpbmdseS4NCj4NCj4N
Cj4gICAgIMKgIFJlZ2FyZHMsDQo+ICAgICDCoCBBcm5vdXQNCj4NCj4gICAgID4NCj4gICAgID4g
U2lnbmVkLW9mZi1ieTogTmF5YWIgU2F5ZWQgPG5heWFiYmFzaGEuc2F5ZWRAbWljcm9jaGlwLmNv
bT4NCj4gICAgID4gLS0tDQo+ICAgICA+wqAgwqBwYWNrYWdlL2Vudmlyb25tZW50LXNldHVwL2Vu
dmlyb25tZW50LXNldHVwIHwgMiArLQ0KPiAgICAgPsKgIMKgcGFja2FnZS9lbnZpcm9ubWVudC1z
ZXR1cC9lbnZpcm9ubWVudC1zZXR1cC5taw0KPiAgICAgPGh0dHA6Ly9lbnZpcm9ubWVudC1zZXR1
cC5taz4gfCAyICstDQo+ICAgICA+wqAgwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gICAgID4NCj4gICAgID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
ZW52aXJvbm1lbnQtc2V0dXAvZW52aXJvbm1lbnQtc2V0dXANCj4gICAgIGIvcGFja2FnZS9lbnZp
cm9ubWVudC1zZXR1cC9lbnZpcm9ubWVudC1zZXR1cA0KPiAgICAgPiBpbmRleCA4NGE5ODQzYzI0
Li44NTA0YTg5NzQzIDEwMDY0NA0KPiAgICAgPiAtLS0gYS9wYWNrYWdlL2Vudmlyb25tZW50LXNl
dHVwL2Vudmlyb25tZW50LXNldHVwDQo+ICAgICA+ICsrKyBiL3BhY2thZ2UvZW52aXJvbm1lbnQt
c2V0dXAvZW52aXJvbm1lbnQtc2V0dXANCj4gICAgID4gQEAgLTEwLDcgKzEwLDcgQEAgY2F0IDw8
J0VPRicNCj4gICAgID7CoCDCoFNvbWUgdGlwczoNCj4gICAgID7CoCDCoCogUEFUSCBub3cgY29u
dGFpbnMgdGhlIFNESyB1dGlsaXRpZXMNCj4gICAgID7CoCDCoCogU3RhbmRhcmQgYXV0b3Rvb2xz
IHZhcmlhYmxlcyAoQ0MsIExELCBDRkxBR1MpIGFyZSBleHBvcnRlZA0KPiAgICAgPiAtKiBLZXJu
ZWwgY29tcGlsYXRpb24gdmFyaWFibGVzIChBUkNILCBDUk9TU19DT01QSUxFLCBLRVJORUxESVIp
DQo+ICAgICBhcmUgZXhwb3J0ZWQNCj4gICAgID4gKyogS2VybmVsIGNvbXBpbGF0aW9uIHZhcmlh
YmxlcyAoQVJDSCwgQ1JPU1NfQ09NUElMRSwNCj4gICAgIEtFUk5FTF9ESVIpIGFyZSBleHBvcnRl
ZA0KPiAgICAgPsKgIMKgKiBUbyBjb25maWd1cmUgZG8gIi4vY29uZmlndXJlICRDT05GSUdVUkVf
RkxBR1MiIG9yIHVzZQ0KPiAgICAgPsKgIMKgIMKgdGhlICJjb25maWd1cmUiIGFsaWFzDQo+ICAg
ICA+wqAgwqAqIFRvIGJ1aWxkIENNYWtlLWJhc2VkIHByb2plY3RzLCB1c2UgdGhlICJjbWFrZSIg
YWxpYXMNCj4gICAgID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZW52aXJvbm1lbnQtc2V0dXAvZW52
aXJvbm1lbnQtc2V0dXAubWsNCj4gICAgIDxodHRwOi8vZW52aXJvbm1lbnQtc2V0dXAubWs+DQo+
ICAgICBiL3BhY2thZ2UvZW52aXJvbm1lbnQtc2V0dXAvZW52aXJvbm1lbnQtc2V0dXAubWsNCj4g
ICAgIDxodHRwOi8vZW52aXJvbm1lbnQtc2V0dXAubWs+DQo+ICAgICA+IGluZGV4IDI5ZWM1YTlh
OTUuLmNjMDU4YTU3OTkgMTAwNjQ0DQo+ICAgICA+IC0tLSBhL3BhY2thZ2UvZW52aXJvbm1lbnQt
c2V0dXAvZW52aXJvbm1lbnQtc2V0dXAubWsNCj4gICAgIDxodHRwOi8vZW52aXJvbm1lbnQtc2V0
dXAubWs+DQo+ICAgICA+ICsrKyBiL3BhY2thZ2UvZW52aXJvbm1lbnQtc2V0dXAvZW52aXJvbm1l
bnQtc2V0dXAubWsNCj4gICAgIDxodHRwOi8vZW52aXJvbm1lbnQtc2V0dXAubWs+DQo+ICAgICA+
IEBAIC0zNCw3ICszNCw3IEBAIGRlZmluZSBIT1NUX0VOVklST05NRU5UX1NFVFVQX0lOU1RBTExf
Q01EUw0KPiAgICAgPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPj4gJChFTlZJUk9OTUVOVF9TRVRV
UF9GSUxFKQ0KPiAgICAgPg0KPiAgICAgPsKgIMKgIMKgIMKgJChpZiAkKEJSMl9MSU5VWF9LRVJO
RUwpLFwNCj4gICAgID4gLcKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRmICJleHBvcnQgXCJLRVJO
RUxESVI9JChMSU5VWF9CVUlMRERJUilcIlxuIiBcDQo+ICAgICA+ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoHByaW50ZiAiZXhwb3J0IFwiS0VSTkVMX0RJUj0kKExJTlVYX0JVSUxERElSKVwiXG4iIFwN
Cj4gICAgID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoD4+ICQoRU5WSVJPTk1F
TlRfU0VUVVBfRklMRSksKQ0KPiAgICAgPsKgIMKgZW5kZWYNCj4gICAgID4NCj4gICAgID4NCj4g
ICAgID4gLS0tDQo+ICAgICA+IGJhc2UtY29tbWl0OiAwNGRmZWZmNjI0MjUxNmExMDYxOTczZmM3
YWYyY2M5YzVlM2RkNGUyDQo+ICAgICA+IGNoYW5nZS1pZDogMjAyNDAxMjQta2VybmVsX2Rpci00
MWE0OGZkOTdiNzUNCj4gICAgID4NCj4gICAgID4gQmVzdCByZWdhcmRzLA0KPiAgICAgX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gICAgIGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QNCj4gICAgIGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+ICAgICBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCj4NCg0K
LS0gDQpUaGFua3MsDQpOYXlhYg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
