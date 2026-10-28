Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA469606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mqyTYMzE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=HtnbSysC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC870810B9;
	Wed, 28 Oct 2026 16:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGKPm32mcQe7; Wed, 28 Oct 2026 16:39:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A31F9810B3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793205555;
	b=OVl4rbxMCc8bOCqf2xeXwx0QZeCFy72RAYm3ei4WbqaQSpkjF3V5kY4Z0ywoYh0tEtja
	 zCQSoiruEX87JZUMPInr7hsqGvklVpo5EXL1OhkkFv9H7sdH7S4NgRI7fqznqxc5NxGh5
	 uFsvbHxie3Ez73JZzeOskw9+65acm8G8pxJ0Ddyj/9gYQAqfP6cHUZRaFDLblOw1fx9jJ
	 Aqi3d5r8msHaVvHPAE3ZN6mEQCInryRvo9A7gsXCBAXWlweOM8qnhnz0vWISdSrEVXdCG
	 wi/oGO+zapnXiHPUyasgnc5S12zgqesOefErZWb4uzI7cPXA8ikihfiDx391m8nkkpA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793205555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vqZAURY3d6GzkwUc7W/oN0Q4Beiu8sl3GZ4SrBP7R/E=;
	b=YtxI89s7sZ+GZ9ALzdo9so1bd1MaNnpfx9T0ST9HebQSxdJdpq7hZeij9Fr8WQcZYzxf
	 /m9FIJdaSmM4zeHqfaDDp0Y82phHZjUkGA2HLq8ISLt7aSmzDY+uRqUKN/ZSlUzpJ8Tuj
	 dDrf9w4Q6YMaE4JlavqS5ZTp2A6Y4LwuRQZrtuiZ86e5EYKjCSeA9UBPMTS55mdqLONEf
	 BmdGBFRRWr/sMhq/d/k/zKMYei+/Bk5Zahr0XxmdNA7J2r1Ce56wjZ1qwKH9AbMaQKnsq
	 h45f+LKITmdMxaquacY5ak8WoCr0nN6FFS+ar+MC8UCTpNbVQrWpvZrrj3vY593GIiw==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793205555;
	bh=vqZAURY3d6GzkwUc7W/oN0Q4Beiu8sl3GZ4SrBP7R/E=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqyTYMzEIBUpDlaNFCtXMyU93b5SnjtFvxwKxzAwVs/d5lHRhhg2ilIl5IzXXo77M
	 qyOeVA+MCjPhVbdANOXYuzJa5yyDplzWwDUMM1hg/VJTgI+csQGOiZ3Ko4156cFqIU
	 8AOrTU120TRV6bn/1Vi1vtGvrqijVr5p1SPsh4YvSbWpbsc6pTKQIOIphdVpftnL+3
	 OpFu/l0kGXnBSyTwl1t7hsy5NPcACWbcYVQQrPTVkzS8EPmUgLa0q4jliIcG0S2ldc
	 X04jnaOcEASGqDsdoyXEnKeaZSwS5oZ31AY8wbiyRxVJOZG2aWvYidOrZo1w836SVs
	 HFySIEd0biO6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A31F9810B3;
	Wed, 28 Oct 2026 16:39:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A19C1380
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 16:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874A0400DB
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 16:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orqs6NMOpjhl for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 16:39:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B7B4D40071
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::626"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793205553;
 b=IRJtJxQopVtmtLKP7qjcB6iA0yPInkd0B/+9y5hMwmy8Z6iSik+XZqOfS811UhsaZzPZ
 yKJqdse3mBdesQFwqo4zxYHNU6jR+5+25PBcXRGHHcT5lWKvNPlfavDO2V+DbfBnoYu+v
 YKT4xTJ5ELUKGa6934vnNFMZP+E0KTTxV2eigXbW/3bS/WNg7fDJ/2H+z3wzoLI2H59hy
 zo0+lMfybopTqE/SSLMZ2AvKQDWrKoxCwiUBMp1RvDAV98/oencxxt6+T9FlR2jB0QAbJ
 5XtGz7AawWaP5W7BVJQgAlnJnaFB8Dun0cb9GvRVh59g5Fl8xXsg55yLgE9QQqFnRwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793205553;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=qIqWDhOPLbm0iV8ArZTH6z93wdgIGOAAv6fIMBMccMI=;
 b=Pvpgq7B1T+oT/jGsItZxa+cmVKlQwuzvpIQ5k9+IkMQMl/eDlpNIDn8ppXBPB9f/0Gte
 YjD45ONXwSS8rhuE7HsED9vWG+l/HeVqwjVDLWA0b1qNKu08U1fGKNYqwWOSellExETPA
 BZLgGd24wpYQiFdtPLFP2H2gZT50tDAm8NLT630obuK6OU0ZO9s93izG38c03o+FSElEW
 w+8a/sCyad4ZActNzSfFTVZcBUDcOiA0cBjoz2XD2MgWQQ1WvkDszNIb2zvrJA96gslUn
 Fu99bQXxJ2VA/Q2wzQuGoKBN6xlpE6kaHVu3wQvg72OMr6ORqdsoOep6bvn1TEh5FPw==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=HtnbSysC; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:d::626"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::626;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=HtnbSysC
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0626.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::626])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7B4D40071
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 16:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=HONJg1sCpaq44ZOVj8bCHxTfDGlxSxZG0UmCMAjdZ/lPVtSsgytk6tmNHVfU5+7iPKU9vrmJ01HfryD8xCPTErEmAtuYUIsSStw3MDlxauXiQbdYWCSJkyaddBcu/CS+Y4sIdSM9OmM7oNUX+Xjvv4q2M+ooqp+k2mGNe1YB/yfMWsACAvADLLKPgG6pP4uA8sAHKl+u9lxm/deFRY7xI+6TYloRDEdMnlU62n33ECxWUYEEOa77gKWOrHFMHvu5vrsGaRjQCPgphOi/zeDMmESxzO3NXMpWkIcjNvw8SPl13YKvZ/1TM0LVtxYbXEPakcpCmb7wwPf1XNFmrsbxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIqWDhOPLbm0iV8ArZTH6z93wdgIGOAAv6fIMBMccMI=;
 b=m5O9amy+C1b1GYGhzfRYGa2w232h6QTlV3UZ8egTigO5hZK0CWsq2LzweowpNaYG49ySp4cGBhpVEDP0JQvvPnBb9BZajkBx7lqFfW92CJv+rATE4mv3wwSpaGrJSwOHREOvAft6ssxw1pQ3z+f2INBgK82g474yEMZIIu2Dx17Q+gR9VkrZAUlGgGH59321DA+yxWKUQ37iQZhHg4EjfmGfrxfdoayXsHxqulAU2Qwrna6ezmZGRA6b+x8t3xx9gwEP9VARnQ6OwMKYCAzpEGMUXpgGbn4fmSNyoHAn+yLaqUQ116qQBmVSAxEJ2PLX6hTkBu+Jrz80T7SzIu+OMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIqWDhOPLbm0iV8ArZTH6z93wdgIGOAAv6fIMBMccMI=;
 b=HtnbSysCrnSbNkWoirYx6PmcaLud5AUTtRTADMwKM/4Zq3KVs8KNRHrgc9Caix21UF9BDeRQs4doFQcq/zLqMsoN4XaPeG2yzJyyqT2XalxISKwsUEfal/ohf1b/Iar0P6Y4NBMETk3qS7fM0UAGKqAfPDIvnQG9c1qGITfFbI6HGlv8qLNZw4ZxgHAFk+6M2Yw8QY5EOlPZpDo3LVkfeD4CKE0/oQHeV+94zxHQbbPjs0U9U2d4oVFI91/CYhcVaVhmFkwFSUfb7RHlrCI8ePWBtHj971BvB84+tZfNvYr6nXH78ePsezOWlGJBz+7iyJeEis//rilVHlJTqIZ6jQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN4P110MB3080.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.23; Wed, 28 Oct
 2026 16:39:06 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 16:39:06 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: =?iso-8859-1?Q?Rapha=EBl_M=E9lotte?= <raphael.melotte@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: James Hilliard <james.hilliard1@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 2/2] package/mupdf, python-pymupdf: bump
 to versions 1.28.5 and 1.28.2
Thread-Index: AQHdZvrZZmQGg18e50ich8CWcPC39w==
Date: Wed, 28 Oct 2026 16:39:06 +0000
Message-ID: <PH1P110MB16032B2AF9F90D63648CF3939F6FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20261005154047.413898-1-raphael.melotte@mind.be>
 <20261005154047.413898-2-raphael.melotte@mind.be>
 <PH1P110MB1603E1DEDF7E2669F93110409F6FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <1e23b3f3-a08d-4522-8c5d-052344c5481f@mind.be>
In-Reply-To: <1e23b3f3-a08d-4522-8c5d-052344c5481f@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN4P110MB3080:EE_
x-ms-office365-filtering-correlation-id: afa4e6f8-f7c0-4b74-65f3-08df3511fbcb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|23010399003|55112099003|18002099003|22082099003|56012099006|4143699003|261022115727099003|261026140227099003|261026121527099003|10067099003|261022075727099003|261022105027099003|261009223027099003|38070700021|261028144727099003;
x-microsoft-antispam-message-info: e7xOGKgzQqIrST+1tjpucHUu+gUr0cQg+gSW76Tlkmtef8v4tFRgKXvBvwAQrEhlCJKVp9Yzu/vbwtlnR2q9vQRCpoH/RgCPmed1OwUkbYlTQAxnPmcGRUT1BGJUDGCNkPcIWyQeMG9SZD1WZm5+vOI4+A0nyIl3inUhCdEJXpHEzZn6aorSg90YF43JAt/ENbyUa8ME/Nq9A1qB9eosrsinozLkFBygWSGnXbWoddbNJII/puqCnmApy/s549aJwYIiIPZ8Td6AN08v1m4ikwP0S9rfVTbWchWYT7NPtFB57JjmOkO1JLAGd5AyLwzvgEfM8zxs4P/Y4cYruxwOhgGnjvRBBQSb2uZEVypxXtB29KXJvhfWitTG5pf3QpGmhv1A++jxKHczCDVn201PbT2F/9K7A8HTM/7F6Eul9xkH8+QU9q13YmANYi3tn3CnUm9XouqbURcyuk1B5BacgbLVi4VKOLFhu9aOjx7dXD7gOcFwQg3E3pJk2kHLhRmVAb0NATD0pYpeP7UP3I8IYba2+f3Qsq4oE8uaFsdc+pSwtk88oJfFveIfvxDETjsnTTBNjewocbcgBrolOInEkbQJM+OGHa4tvrO/gF9Uhz1A8eI/xB1O3bvbZ68bWD5qZO6aeF0eQ22uQSBLqyDlkvef/MotZQ9K6T59xDF8xAU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(23010399003)(55112099003)(18002099003)(22082099003)(56012099006)(4143699003)(261022115727099003)(261026140227099003)(261026121527099003)(10067099003)(261022075727099003)(261022105027099003)(261009223027099003)(38070700021)(261028144727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qK1Bc3NlLG/SVoDve/6wb1KuyUxxLAKAuowtRK0ifSriw2prL2akMkHHa8?=
 =?iso-8859-1?Q?u+f0Q8I8GI2t4LwmwVLT8E+roSTKwuoC2sInemEqvMjLzR0j1uVSLN3Ig9?=
 =?iso-8859-1?Q?+28MaclrVZvZz3woBrHblv5Muk5PVTYGVZwb6/W0a88m8AruIW1+w29cQB?=
 =?iso-8859-1?Q?gjzvPpwctX71HGrNXJ4RxRi5RNy5Xtk2kPmCQaKG91lGxWKl9HnbpVQEE7?=
 =?iso-8859-1?Q?fK28Z2yAPdSWYIB7abhxM3S2rFT8QID0A7pP0eLTxVT4ZwufAdko7UsBP0?=
 =?iso-8859-1?Q?E381RvwrHxNdOnzL9bt7qbDixPvzqEe3urM9awaS/O+IXcvkjgW0SGDI1r?=
 =?iso-8859-1?Q?VXLCxITFsGBHoTOLruHLV8Z0PkdZ8K5UMzYJFXJWIqityE8jtyfn1GH1a5?=
 =?iso-8859-1?Q?HK+/d6OcQlC9Faqd/6oL86V59BGmEJAyIdfq4J6tEBmKkFmvAWIQ42Vfsy?=
 =?iso-8859-1?Q?VEZ/HOVTPDfANx95fK91mCRUvxVQu9UEz+vtrKARjzlr2RAzqrNMxZlcJ9?=
 =?iso-8859-1?Q?j0xZWNgtnwcV6aTsRrGBwkj/6CVR9MLw8ZwPjTZ7p9s7X+PS8pPX8vSyzL?=
 =?iso-8859-1?Q?jpEKhRLiznhFL7OLxRml9o6Xajhb2YevldVGBwv5FIPCZjGfkDtT5WFZzk?=
 =?iso-8859-1?Q?Sai/7w02w8Y2rOboXnJv1OPPWwv5VvqaDNsEdB23JCkixM5To/X+Ep9Qnc?=
 =?iso-8859-1?Q?20Ib8TMqgXVhSn+KVukhT6vSOpkX7iBJeM6M+EoNLu8KVJFNn3KFnnPMDQ?=
 =?iso-8859-1?Q?8vdUsRiv9/dFDGpY3c7Bm5ZVpEo3wCtbs9DnoKUIKewPtbt10JMArEQkRR?=
 =?iso-8859-1?Q?081gxGKd3l2oyLHrp+T01EH/lB1ezGZV7NICIPfkp51aHEZK01AP2BtDY6?=
 =?iso-8859-1?Q?ZAM1uvyUApR0q9q8rfQIl9q5WRNFMJUrX6qHclgogth4JHB3oklunOHtKx?=
 =?iso-8859-1?Q?BiGTYgNlaC/F5J/1fBLjbKLM18o9DEb2RjpYazby8pEguaVcReK7qn7Rz+?=
 =?iso-8859-1?Q?Wdywr9mlpfdYItTNAVE+W4qdkULwNRUHmDkDgvhBAD6XvSSGP6qVJudq2Z?=
 =?iso-8859-1?Q?Hctq2Xh8l1COiMUaHjQicOez8jR8dgUlYDqiILHcG7HuBtbk93lXC/QzoS?=
 =?iso-8859-1?Q?7O3htwrzexpURS0Uvg5ipZEIJdNa57i4i3T6kI01xkrnE4/zR+W19nhc6O?=
 =?iso-8859-1?Q?RX74xgbrY9vmn5y4HHVEZfGesjMXKtb1S56wr6RrR3co2EZ4z6bpsO75Od?=
 =?iso-8859-1?Q?qNXEO4Vy4radlHicSD93vV6N5GXSLHsRPPKxp5bx1X/EwvpjL9er6aY7g2?=
 =?iso-8859-1?Q?QoJjgDfARy4ebrOxLVvbhTjyKGw8yvfHoNsD2eOzVkKDGOqANZZypnqIv+?=
 =?iso-8859-1?Q?qF5nLNkV0Ls3kPHLvIAUSkIKl9hVpeaT3QbE42WZSoBumYpOJRWx+Ttaom?=
 =?iso-8859-1?Q?6B8++YeHcbQysMMw7y19FvzBF0h7FVnO2l4A+SghiLl5aQn3I+Mi7XsaWG?=
 =?iso-8859-1?Q?zx5djCWeg7Q+gMqNTBXJLBXv+6n1o9UMODCWqo5Jy6aZIRWt1dhzT/Ivwi?=
 =?iso-8859-1?Q?z0O7TeNbDN44cVDnyq14osch0HAu0NmMtX+Y5P2INass0b+gYJwiHTQpXU?=
 =?iso-8859-1?Q?eUHU/Op7F8VS5DYz1cpIFW9shmnf454a/xuGse0sBmoxobMVbsjlCp4SEG?=
 =?iso-8859-1?Q?mwVxbsEla9w19vxi/eTy4NaPf8MRFCLuv5vfbhRz?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: afa4e6f8-f7c0-4b74-65f3-08df3511fbcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 16:39:06.4705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4P110MB3080
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 1.28.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_SPF_HELO,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> -----Original Message-----
> From: Rapha=EBl M=E9lotte <raphael.melotte@mind.be>
> Sent: Wednesday, October 28, 2026 10:33 AM
> To: Vincent Fazio <vfazio@xes-inc.com>; buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Subject: [External] - Re: [Buildroot] [PATCH v2 2/2] package/mupdf, pytho=
n-
> pymupdf: bump to versions 1.28.5 and 1.28.2
> =

> Hi Vincent,
> =

> On 10/28/26 2:04 PM, Vincent Fazio wrote:
> >
> > I saw that 2.0 was released recently and I wonder if that's a better op=
tion for
> master?
> >
> > I ask because we're looking at Python 3.15 support in Buildroot and it =
looks
> like PyMuPDF added support in 2.0 (buildroots pymupdf tests fail on 3.15 =
due to
> build issues).
> >
> > Given the major version number change, I imagine compatibility may be
> broken but it may be ideal for inclusion in master with security fixes po=
rted to
> LTS branches?
> I can bump python-pymupdf to 2.0 and send a new series yes.

Thanks!

> Despite the major version number change, there doesn't seem to be any
> major breaking change (except that some older python versions are no
> longer supported).
> =

> I haven't tried to build python-pymupdf 2.0 with python 3.15 yet though,
> I've no idea if it builds yet.

I have a branch locally with a patch from Bernd [0] (though I bumped it to =
3.15.1). I can apply your patch and rerun tests.

-Vincent

[0]: https://patchwork.buildroot.org/project/buildroot/patch/20261011130058=
.3443432-52-bernd@kuhls.net/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
