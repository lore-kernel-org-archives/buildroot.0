Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7303ECA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 358A5810F2;
	Sat, 10 Oct 2026 17:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvSkDXD0W--G; Sat, 10 Oct 2026 17:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2DC988102D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653733;
	b=kz4sQvLK0KkSmPMZppOUXwC2EtJ4av50KStACvbtdQFpoMmtH16wWHbZD86+SYGe9jBR
	 sFmSAmcbys3HEvXr+oJftasK+zit4brHRXmi8qeB+pJEx67izHLvo1bFUfx+eM0iK9SiA
	 T5VYE20fk4L9N3SopxiTt6dDeDnG+lLp+ph64AGVDNdLLdU8O3/fAL/I4gN4pfJOvZiX8
	 lnsSJ7gjNHkysSKGkgqQAtI4qcAbtagKOcBh72+7Kq0rumH+hJ937gSctEF0p7LvDUt0B
	 UJfkkUAEeq+pXenS2+LOdZN9LFHpKA+oYxGzfMqQynLTIpdxtluwtnaZt2SVE4qHxeQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:CC:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Po1q2xSYbn/1fe76GFWmEQ9epCSJ1WYq7ameKNkqb8Q=;
	b=dAq/wTvkphEFYoKMwQ64xD66dcmob9SP6t+vg20ZOn6qOJ+NsNj7qGOmRpgVIFnZWhoV
	 76ZedKqhJPTyA2p0iDXsDoe40rq9hlmB0Kg9S4/9eOaZuiT8m5ESu/ybeoF9khe6DHO/o
	 6ZaZrDpk7mtMT76wb6czYQaLdTttMUl+u75ulbAHJghzXkcS9H2X+3hTFJlRIL7Pe9NvB
	 bU0MVoEKp1dLEJTAn/RmzLontVpMfmlz53wkcpM/LomYZ/fPzMDCHHEcgx4TztqQZqeYa
	 d5hW17rSPAmBTmGLBf5YnfEW6KSEubP1IEoXd8uUX70aPg5U/U7MDAPZIhF+7WAVY2A==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653733;
	bh=Po1q2xSYbn/1fe76GFWmEQ9epCSJ1WYq7ameKNkqb8Q=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OwczowaejKcSIB/mUjlnOhTvM2wEU1Pg2bmUxkUWbFldCRmwMe79RPaXGrG7pfDka
	 Qj/zp8SzSjDXYgBpG68PsVPQTBPgfX+SOqWz7c/o1SwgEFZAGGYCrU2KJuAEKirXGf
	 drSZXsVUI4hDmbX/rqB5wbjHIhL0bDgtje/SwkkCVtbI2nFZw5O4PTNinC1JtR8xbR
	 RlGhgpJ0wjyVnZ1wNkv/C4Z6VI/KBvmCQCFjU5nkz2JDhtPmq+KkChg6wX6hUO8MeT
	 dl3KujFoUcn3S8eMQaRbPTzOHDp8dAqJOIBUKWMgElVl3IGT47/2dhqUOE0TluCT1e
	 hrjKkM/P5Hw+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC988102D;
	Sat, 10 Oct 2026 17:35:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 174B61A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C5C40050
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjpU4DU864Xw for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:35:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 00DCB40004
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791653731;
 b=CGoWefHqao+Q2YM+coCSJtimuBGqdXtUh4omH53J7dOKCMhndHUWfwtuqHI0DKcpO24S
 j+twKYbd78Rukah46qRDTlNHSwcUolF0Kr6vv+YbTs+pBFfOy3b5EBTKnyBM5B7DhXH9c
 MimOc5pNif6PXTxcFxk+EzTaX8x69RhGbOyWGW4fa9K7gPfcYJNBWfrgLIANcB9NS4O2F
 S2y60iD1+tpfr62yUK54uRbHQ6KVVyJDAAdzAXMeIgM9Ocn1U2K9DaELW6pJiDQ8F0hty
 EfYsO4jrUjLomwZHVnoievoXd6Qd89Ym2E/hXgVHsNEG1mxMPRzc2PsFoPZw9ehUmYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653731;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
 x-ms-exchange-antispam-relay:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=5/eBMLDiUtJCIVRZECUm6cSLa4Ex7l/LkoQr16NTcnY=;
 b=pf4kL9z5opd73V0ul4FfJRWKyzkbMVsrwlwDX8mLEjkdmzjZlxjBijzbu3SdMyKznb+y
 9gEU/WgYolToN30wW6WEL/0xMj85ayuLZW9NPBSDtz6ErVSFKwrmLPfKylQPCxg/Ob8g8
 ckfrwHFVozhbTEDkWQr66R7C6lhdbT6/CZTHECz3Mz2XzewBko+FMSV8diXEw2PuwOXaM
 b5QvYw9UqeGTN0v2TcdDE2/G20mrxgtdhm37ezbD4dmtJHpuaI9H+4HtHeIzuH9sUUOEZ
 IqBHCNQNzymCy8+dVC8S7P51jktqn2M9rgCWXdduZMlclnBvX2T5mwmYC7ewc2XFHbw==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=amd.com;
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0ox3cyVA; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c101::7"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c101::7;
 helo=bl0pr03cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c101::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00DCB40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RA1wk3980j/TFdyjAH+H/NP1cb7NGvgBKVoSzuEFs94hTQvJzMTCUBP1hVBhWAba2ryodfqeN12NREuaovXLgbnLtmEzNMBMz4A3R49//3A9VWREmbIy9oDEqme3ppa2pmEr82CqcLq9gacBIPZuZy8uYqFk2kkNBOUvhVlKUIMB4KM9Ru9zZBE375SNbdv/qOG8dnEOTLkiBoqy+gxL67Th/BbxwTt+SNxoKD8+3ZDnl3qPGFpB/6+9kHc0tJx8N4PAbn/vdyCSmPkGJxcCcoUs/ohcvTnaQRUaukxxv9k6cru3s23ammnj5Di7/6SuHrEKYdpeZCGiXrhz6URTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/eBMLDiUtJCIVRZECUm6cSLa4Ex7l/LkoQr16NTcnY=;
 b=dXz78VHfjqd2ME78ZEHTZi2tX2SNc+c0Fp5gJa9bUs44nK6426yUDIR1kC3GcUNIQCo9XHHVbargn5Do4SQjLEjRJ88jOwMGYgqoAYgCWllcdluqywdHcpY8n4KUJVGJxzJ3blZKvM78SIsIawX4HZpG9gYMxryKlNRTx247ZNA0YqvlS8WM99ymdppJ50RFuhBz+k95Ht2iBYSiFP6Ogzx0e6p9AKOteaSp3eXy/4SvnLS1JKdWDdlHf3lNNITUtDU1tz3iSOBSweFodjIXMG9B1r4FckivIC9AXiGWYE47fj0Ye6NJBFooG0si6K24YhAtG9VejRePdNWCo1nKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by CH2PR12MB9494.namprd12.prod.outlook.com (2603:10b6:610:27f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Sat, 10 Oct
 2026 17:35:23 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0496.019; Sat, 10 Oct 2026
 17:35:22 +0000
To: Arnout Vandecappelle <arnout@rnout.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "fiona.klute@gmx.de" <fiona.klute@gmx.de>,
 "ju.o@free.fr" <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v5 1/3] board/zynqmp/post-image.sh: add
 custom hardware support
Thread-Index: AQHctJKM60K4wNfUq0+hHh439JVGX7b4Q0eAgAAMbUA=
Date: Sat, 10 Oct 2026 17:35:22 +0000
Message-ID: <BL1PR12MB503262E9FB024D7B14B75001F0912@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260315154343.3144013-1-neal.frager@amd.com>
 <179165034772.175184.3716951951450862394.b4-ty@rnout.be>
In-Reply-To: <179165034772.175184.3716951951450862394.b4-ty@rnout.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-10T17:26:03.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|CH2PR12MB9494:EE_
x-ms-office365-filtering-correlation-id: 956d21d4-aec4-4db4-d705-08df26f4dcb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|261009223027099003|10067099003|38070700021|4143699003|11063799006|56012099006|41080700001;
x-microsoft-antispam-message-info: 4kD6hmz6F7iG8TDJZlDzgHz4So7Fsamf3bTnMc88bIsWm0M7FWcb46Xqp1OnFcBWr5yeYp0DZfpoFKf8R7A/pPijpT0y3oRqvmCkEOzwMpIzIgtXBaoL45coATXYQU3wQ+372M+ksfYyIn1KKYYP4YehJRCvfAt/GWnvt8uFdxk4Robj4xaMVGax16LRisucIuHE9YVTMA7DSHCazjEW2llXWw1YL70urm05TpMm854QjPeglzzYzvQ9R0JRXC8XmgGq3QOkmfhDwoUF/2QAjxXog27bx/quf3E3o4DNvONqdD7J6VZqU0s3ZoQGTvETxmOZiuTmOdlkoCxMbVC9n+W66Z11xhI8XmjpQauZLpziBWo+Hg5gojs8QD007rBslSGjXbsC0r+hX7hlVwhUfIfK0wNb37LZLAXi/0u7RdHJ1LL03GC8S030D1eLg+qK+Dl0gJbrLUOTB8eFIRKZVUvHc+Ttz5m5FxIvAped2n2/my8mfnR0pM+b9UQSgCKbBj9ilYSrO7Kz4qpODkkQC3szz88OuyXzyPjKFwNsOt28n+lArxwLhxDjlI62Bi9yAu7cp7IwgWqtNEzjgFlnj/Mo1RyhYYNFDZ9+w341ZmPRqaFQ8XkWCh55oSRjitAg8UKha9LCdkF5qyYx1qEeIjzmv6fpQBK0eJ6mJ22n5Yd6Yc0iq6xRX5aqBeVeP3cfP72+wJI97/9aI3e7VpBXl8whoNlMc7cw20hr5wStnArHcRa+9T8a6MFpH8w7U8/9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(261009223027099003)(10067099003)(38070700021)(4143699003)(11063799006)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dldPZ2lzc3BuZzhRMWVKanFyeUpmeUZ0UUpKUS95a24wK2tVbk42eElmQUx6?=
 =?utf-8?B?eFBOUWs0VXlDcjhrMC90VWhTa1IzWmRUdTVhRXpwWUxhWlBZUDRLL2hFSndD?=
 =?utf-8?B?VGU5MGwzTCtwaFlEckw5QzJwbzFHZmRmV3FEVWp0dGFFR1hLckk2c3dudlY1?=
 =?utf-8?B?QlVyTDJyY05xK05obmxVdEUxbU1MNWRFN3NoK0RaUHF2eG5GS21BOVNxSzhR?=
 =?utf-8?B?K3BaRGthaUFTVStEc3R1U3pHNHB5bFd4aERKMS9wOEliUGRVRUpOK2lzUU9J?=
 =?utf-8?B?am5LVWV0N3hpakVoY3h4bTV5d0RLTkx1dCtiRUJKM3NZckdKOGY5T0ttZXFL?=
 =?utf-8?B?RVpNQTVoc1hUeE4xVjVEY2w1V1JOSG5lOVEweGh6NnU2dzM0ekNxdTcySXQy?=
 =?utf-8?B?a3ZsMmh5TC9LYWpNdWVHZFFXaFh6aEc5RjVMM0ZBYTJCWUNYVTFmajhvRzZv?=
 =?utf-8?B?ZTFGczlVaFVoOUtabXJsYm5wdWpSTllLSHZERk1HZnRRMHBIVGM4VDU2VXJP?=
 =?utf-8?B?SGdMckFVcm9yeUNWWDY1T29PTHY0aHRHMFJ5YS9WVTBuRG5USHlqOGhXWHlD?=
 =?utf-8?B?Q1VwaGZvR0FXd2doSE95M1VvNmd2NC81TmpIbmVJajZzM1cwci82amdFWTJB?=
 =?utf-8?B?Y1NrMHBhNWNFd1o0SnpzSFNyMWd6cC9FS1d6aWkyRWJmcjI2T0hjdTlDd2x2?=
 =?utf-8?B?RUd4Q1MvRzdtR1h1am5adnpyK0hzTGZrKzVrcHNBZ0ZDZi9FT0dlcXdFS2dP?=
 =?utf-8?B?UTErZUtlM1R3Tks2U2NqUTJPblgzWWVFZml6NTRJdjFPd2JiTk5NK3dPRnEz?=
 =?utf-8?B?TlVYUkNHN3hIYkN0MFp2bUt0NGdidDNXMFZLMitRN1NlcnRGSEYxNGNyRnYv?=
 =?utf-8?B?RlpqRW80OTFod1NRK1ljRUZTTjl1NHBMTVpmbnVKQzVaRVBBNmFCcjBpZkpS?=
 =?utf-8?B?R1I4eUM1cFNVNGxCUm9YZzEwVGg0K2gxQUtRSDEwQ29UY2pmd2t5aDlUWk5K?=
 =?utf-8?B?aS81bDhNcmo4VHVVVzE4TzVFTW53SVM2cUs1RUxrMUpnbW53dDdoWnpVNVJh?=
 =?utf-8?B?bVFtOUNJMXJGYzd5RGNlUWUxSGYxUjlqb1ZaQlVNaHphTXdyb1I1MkNPRUp5?=
 =?utf-8?B?aFR2Q3d1dDFPc3laSDY5R0E5UXZQSHhPRUtRM014WndzWFNCT1MxekNmeFZ3?=
 =?utf-8?B?K09HSEdnUnBaamlFUkZnTzI4SCs3UFFXdFp3Zm1uWms5Vi9LeFVXVGRQK1JR?=
 =?utf-8?B?eDZMSHhtcWVhZng0MDF1cHF5eGFzM01DVThhc0lvZ0RUTUFQVGErMGFMK0lX?=
 =?utf-8?B?c0MvaXFGbXFXMmwvbVpKS05JRUZaRGEydkpsY01hZGJNSUpLSUhJRDd6N042?=
 =?utf-8?B?OGFROE1lMHdnRWFOTlYwdGNIU1RaWklBMCsrdmZFS083eXhCaDBYcjFjZVUw?=
 =?utf-8?B?ckxGNDZBMkU5MlVsOGhzNTc2OWt4M1hlQXhyUUZVNTFLY2hSSHIrR05WMlBp?=
 =?utf-8?B?TlBDM29DenB4Z2RkRkpHcU9OMmhtcjBvNzBHZEUwMER2THRNSGtaaWlhNE5F?=
 =?utf-8?B?OU5pWHFQN2VBZ3NpdGxyUjFpWW0rOTJ5dlFIZXdXd3lxL3FobFRQdzF1NUgz?=
 =?utf-8?B?c0xuc3oycVRrWW5zQ2ZXY0xaWEI3NXFYSkpGditjdm4rSW4vbHJ0NjEvZDY4?=
 =?utf-8?B?bXNGZVFDelZ5Vkc5Z0tGT05qL3pUbVFieWFQMGxjNlJBUTcyUVNVeEdHT2Ey?=
 =?utf-8?B?T0pEZmlDZU9zQS9Ba1M0NEg5bVhwTmZKczZwUmk0UmU5cEhTanNyajMxS1dq?=
 =?utf-8?B?MWhnU0lKaFcxKzdDVnlGSUFWb1lmZE1Qb29LRnRmVzMvbHNjdU5GYTEzVnNC?=
 =?utf-8?B?TVEzaFRpOGNyRHpoekdNS3V4Tk9UV1g0WkJuMWRrM29MQ2d0QkhIbmNieHhZ?=
 =?utf-8?B?dm9zUDc3cDV4OXQwV3dpSkVUVk5PSnM2L05NanFSeEY4eUhaMXRjaEI1bWFy?=
 =?utf-8?B?V0FqOUdLbUFJcVlneFRLNENIc1JFUXlCU05EODQrUytOY28vUmFhaEMzMXhJ?=
 =?utf-8?B?MWtRTGZ5NkF4NGRvMXUrN2t3c2dIZWNRNEQxK0laYzVyRUtacTloaUVESHl6?=
 =?utf-8?B?R2JUSHdXdEM3T201WVh5a1NTeTF4QmltU0pZSHNSZEpHTEhVNkU0SXkyM2Nr?=
 =?utf-8?B?VjdWV2RwaEJDZEJ5cld3SU1uOFBrM2VoZkZJM3RPYzdWcVZ0b2kyNzYvbmlP?=
 =?utf-8?B?eVJEdlRtUkdkTjFUOUNTMXFuNVFqMDJHdGxuRytGVzFQR0VwdjluVG1TUHlq?=
 =?utf-8?Q?ZtWMAgo4u/IllMc4Xj?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956d21d4-aec4-4db4-d705-08df26f4dcb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 17:35:22.6149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMn5bRbgbY5pTlvBtp7QZjzs1YkaBsQlXGqnnrBnrSCelcR/NVl8akZk1Pk2XGww
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9494
Subject: Re: [Buildroot] [PATCH v5 1/3] board/zynqmp/post-image.sh: add
 custom hardware support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Arnout,

> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a zynqmp evaluation board
> to a zynqmp custom platform.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

>  Applied series to master, thanks!

Thank you!

> Even though Luca voiced some concerns, I think this is an improvement over the
> current situation. It maybe doesn't work in all cases but it's a good start.
> Users doing weird stuff are going to have to build their own post-build
> scripts.

I am aware of Luca's concerns. He is always welcome to submit a solution that
works even better!

> Regarding the spaces: within Buildroot we use things like $(firstword ...)
> which does pretty much the same thing, so I think it's fine.

Thanks for sharing. I am fine with changing it. The only thing that matters to
me is that the script works and it is simple.

> Regards,
> Arnout

Best regards,
Neal

> ---
> V1->V2:
> - removed unnecessary $BINARIES_DIR from symlink source
> V2->V3:
> - ignore anything after the first space char of LINUX_DTBS
> V3->V4:
> - use make print-vars to get LINUX_DTBS variable
> V4->V5:
> - fixed shellcheck issue
> ---
>  board/zynqmp/post-image.sh | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..67b0be65b7 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -2,13 +2,9 @@
>
>  # By default U-Boot loads DTB from a file named "system.dtb", so
>  # let's use a symlink with that name that points to the *first*
> -# devicetree listed in the config.
> -
> -FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> -               "${BR2_CONFIG}")
> -
> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
> +# devicetree in the LINUX_DTBS list.
> +LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
> +ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
>
>  BOARD_DIR="$(dirname "$0")"
>
> --
> 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
