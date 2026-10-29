Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8564606A322
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O7Bs7IiO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=SCko/YC6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A04380DD6;
	Thu, 29 Oct 2026 12:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOGExr2XJVSN; Thu, 29 Oct 2026 12:45:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AD43E80CA9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793277910;
	b=VjrddCT3nOAQAdGwsqKKDdMmOM6/qxnCS5sHDVlM3DoJ3AbrmK3PB98sBxLmGZHHrNZM
	 /heQL6zTfLwjQZkbzi0f3XbfmD9UgRHpmJ20dQE7KUFBT1OnrTaqKazoEWizxyzcdrXqi
	 VLSHBQIoUO0mhKAIqDjwXj+cJDJTdoy/iPwH6fevI3/tzsVleSZ/OFfZrrkZxBdPjH3Ex
	 xe52yjuGJSgF7Mh2qV86xkpDmuv1NdZQChYzj48t8sm03/+By942RFxdstsDmAaNJwWcK
	 dq1LNenZUilusyZQK8lSmSnymeGZwZ8x1iiIDzCeghCHVPnjS7PNRp31IZ2BnBFjvMg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793277910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Thread-Topic:Thread-Index:
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
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tPQubPy1yTURO31q5wWIUcfMyQ5mZ9X8/gFMo3OO1Bc=;
	b=c1uUehkn9c3hzmWNcM1F8wgzIuZFuP2E6oto1IpPtE7QClzO6ucmTYMV9qZvMccL1fS2
	 7p31SKK1RqknWlnHEuOC56IHY04oA2aR4H0/Xs+/B7/QY7slhqXZZ8FnaVeurdOIo5Lsp
	 cTJ2mCP84qEgUpv5oBjMf91CgeRMcADWS7WDmkCTyBO/17Grrkq6xOWyMCgaSBfpXwmF8
	 /Y6Ynrg2AR1hH/pd/rV6pGaiX6ArhWpImexcAUkiYSjPGKDco6gQokoissuEgF2RaZ25Q
	 s1Aqc8kSHAqUg6TIShoQjtiiq88adko111gaKmzzM+Tr+D35HBMaqUrce0B0UgWlnCw==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	dmarc=pass header.from=xes-inc.com;
	dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b="SCko/YC6";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793277910;
	bh=tPQubPy1yTURO31q5wWIUcfMyQ5mZ9X8/gFMo3OO1Bc=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O7Bs7IiO3tqdpbm0RUa7P0loA4LXtlH2kjJzHxZM1MPX50K4J3CC8MX55jYb9L42F
	 zz5SyP6gKUtw+82FqyC9aSLadW5F7/Al9t55JW4Miza62+Jlcck4LpF8ibfMiN4uZ8
	 UCMQ6c+aGuLEMzSQ3Pd4NXTKFGKvmjDir5M/slDr2f7QZsehw+kzcvEpd51yKoam07
	 GcFtIReBiuhWftgrMR7JXnocGJXDTD9mfpYY1qVffLPCUBC5ghwzBy4WyLyKAhubGd
	 jmix8cMMbVUs8JcfhM9dtI3pSAmaOfutLmxr9P+tm6EihOL3GEGhtN/XmZ3PmIT+lZ
	 SQob8BqsF2UPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD43E80CA9;
	Thu, 29 Oct 2026 12:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00B612E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA94E80AF1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEtLKiYg6I82 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 12:45:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D5E480A76
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::626"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793277908;
 b=cyzZfCRHA9aMV+jgPhFh6b67tyDsM9o4xNWKVKzieM5uYvB8O+O6ATCqSSNOZ7Q7aP6d
 qilAH9b11AglZ8D0yaXGBLPxG45ZqMGSI3pKCxv3Ir4QvAxvtJS8OoW9MVobe6XM7iTZ0
 aSgcJMZb+o3k25hXguyJPwuyRxp07aXq/ltEY9E5jA4VQGoCrJqgUx3xtqATomIrg1NA1
 Ln+ZJlOK0JII+PakflKPtJsEXlgVuv2zmrv75kNoQeh9+d3CfyN2Xd5ZLeonWIeivpqXC
 +T6RTt156vuF77TL4rAKxozn8/ooYimuInARQLO0s6cP3XQPkczd3qnY7PYEXdSG1zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793277908;
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
 bh=Q5qc7LAExFxEz1F5bsD5j3bTd0RBbFMZLNfXuzeyTeY=;
 b=qq6DhBQfdqTYPESqhO4lbNbPCUrB1zNVuOw9ikbZnd3QEYqYYN1PV5GIrsWmBiG2vAdT
 Buli/41rdMa/uGcyXmnFVGSNGxOVEaHX0S0SaTbEFwKt5hioexxfrCiVtSKe2LCCF8fH9
 ywoW0m7JUDhLFE1ZkvjQElTqWMnMK0ha6zZWmE0ZKx+t189omNddGS/M9xrSk4vinpqCL
 +RqAxQVkX6ett5gLB2a7uc0lAdx1x9zw/Fayuqlv9mFX0Czaq6C89f4Kj0DcaAarLXbAN
 y8gvbIJdT2bSMxLPzK2L2ikqDiJuLSFmXpze7OeOjXSo2gzEfDBKfebc48M/cMS8gjQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b="SCko/YC6"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:d::626"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::626;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=SCko/YC6
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0626.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::626])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D5E480A76
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:45:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=k/ZHSgbTsf/lCROo+MW7AF7uARrXZ0qm+y2Se726/W9CI6jsn1Biy2oCkqvoNCESo8O9PdPpyhOuNjxyC7gXnd8Qx33F+GzagJa8D+vRI/RuQsEyQ1DPCv15hEHBv3EcYc0RVLaIchPLHFKJ0z7Z8tgVylzO2upoHNAqNn7GXzZvb7iFgzLXG9K+cG17AwcQUlaIK/8+dEeKiy4K+Rj8ptOzX566LELc28RDwsBRJd6wH4FT5jbYnT0egbJLX3b0QFmXH6dzQ3xCwGMfE7sDLvD/zp6DEtao0CzF7PtcV1Zoo1ZbnjYxxaf7hYHkqIW8oUj/KVbvF2IHuyz/SlXEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5qc7LAExFxEz1F5bsD5j3bTd0RBbFMZLNfXuzeyTeY=;
 b=YtpcmLgZwO210BzvX4Q9tyxPnO5fTfxafWDQLp5gMfMKB0GhllYOTJ2mDwqWWjPodTWoA0wiZNJKzOidS3cER2nBws+lw/PzH7TQV3axAwGHC+DqX6s4tZ2Y5V4b9FP1riEA2cF8yjLnEdti6GW0ZdWDDoyqV4qMrIs7XiOFFCQLwtGHeYovk3zdJ2mOaHS8n3Wb8RxZ+GkPynk5Nl8TzIJV6FaPU1W8sVvTPvmBuI1LnDGyWLmTB9w/U2dKRD4cPZIyCnUpE34Z4AKsvnWvnoAm4Kl6maFvEpWjG1U6RM8s4kQuLI6TmybEftIoZFX75xBv7ajJlRrq3Gz8vgsmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5qc7LAExFxEz1F5bsD5j3bTd0RBbFMZLNfXuzeyTeY=;
 b=SCko/YC60nBid27yFrD2puWfE+SQBQXJCkBoD9O+4WPwoBIQmPTKNT2NBCFiocZF/YOdo8KGF8gZWC+YRGcC06qiKOKm1r8q8jyrWJXSeD0mkgFLOGlJvoy1SflEx3W8YdG5lHK+LDLg2yEopN4sTRIYXD4sQIbG6DuF7mZnqSUEinT+Gzm/SOvve95JtOP56Mz2D9KhleFMRJmBmIdsru7fnlXPJLX+H0Zp6kFHUwLoAEMZB06ije77kdaK29MZGYfivVS9lSs0gy4IHN3b0F8sUJsYpknjf8h/w1pjbzSsQI82c5yLAdUlhUCYx/Nfh1BR12zcGEGT95lWWGwp5w==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1132.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.24; Thu, 29 Oct
 2026 12:45:00 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0546.022; Thu, 29 Oct 2026
 12:45:00 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 2/2] package/mupdf,python-pymupdf: bump to versions
 1.28.5 and 2.0
Thread-Index: AQHdZ6NP8cyg0yOhPU+z7Y7zO4g+jQ==
Date: Thu, 29 Oct 2026 12:45:00 +0000
Message-ID: <PH1P110MB16036C47623A4C8AC89FA00E9F6EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261005154047.413898-2-raphael.melotte@mind.be>
 <20261028161447.330533-1-raphael.melotte@mind.be>
 <20261028161447.330533-2-raphael.melotte@mind.be>
In-Reply-To: <20261028161447.330533-2-raphael.melotte@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1132:EE_
x-ms-office365-filtering-correlation-id: 6e67d515-2b21-45fa-658d-08df35ba7221
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|41320700013|366016|38070700021|4143699003|56012099006|261009223027099003|261026121527099003|261021121427099003|10067099003|55112099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 3x/rfYyEWn3s+uHNXb7M4sxROt+sS1D5K9+KVVXT6IvcoGggqsDicfOvn0/WRSNRegr+ecqExN7f8CNOOhaFuFktbjm4ilqWII15B70wOy2w9WCk1kS1jAS5V8cZKjAwm6xQ0/B/vcCnjDT5bINj7ToBQL4osltqB2I154ZD70+mBi6aPZERaBNTHisnFokyX3DF/hwYxF+/nnnFsilbZLXBGMhwJPI01IvbQdxZMXDvo3NyArMX29SgxufL5cOG4m7um/GVhW0UwV4UkVbzvPi/D+o9s0ImGvNu6TURyN9kJ1Gs5PVIQ+/KqS5xdp8FwvUCu6hB38ymxsYm5Z5UWPKPeaqZsx6easKF1XQgZQ0TD28RNEWPo6vEjlpnk8mRk4nNfaYRXIap1gWW11oER1ox0DCEU68p1NMUf7PvDMH0BI/vpTtpqR1QXvELrFJBgCnLfe2t0A2EKU8iyYQ1CKZHlllCqpftZX1gKPy1WQc6uZ2xREtrC05dA89swTeQK9IFKUpxYqjjfgXlBWJLkAFyJp7HGnxpLM4O7aKdlTZ56e58310My+bONL4bEs4+7CbVbl/QTp35vL2yYQxDSi3QIfc+E3tkiEQFzPjga8QNJElRSUTygV2Eq6c7hiZXeabcyqicvF796I2XNC3R1O6HAVNFX54pP9vuM88ia78=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(41320700013)(366016)(38070700021)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(10067099003)(55112099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjZ6WHB3MkIxWkVsVzNTVlJ6SThqbzJmYnBWTGpOcnhSUjdkUXh5MjRhRHZu?=
 =?utf-8?B?M2ExWDRpb2hkeEJVY2drK0xzZFV0YTYyN1E4c3MxTS9MTXhURWgvc2JHSjFP?=
 =?utf-8?B?a01uK21CQXg1ajRWN3ZwZHB3N2EyYVZrbmRPZHpPSVZpWjBrR0ZoNkZSaGhp?=
 =?utf-8?B?SlhRUjhZRGlPeGg0L1FMVzBKV1krWHZySnNJVktXbytKZjZlUmFwb3Bta2JS?=
 =?utf-8?B?d1FpRXkxb2JURmNDOU1iQ25nQzZ5cDhhUmJMR1B0WDczQ1MzOUkwLzZIS05p?=
 =?utf-8?B?VUIxc1g1T25UN1FrbWJDdUh0LzNtamVuY09QODJ1NE1LQ0U5ZFRXaGdpTUVL?=
 =?utf-8?B?cUFpQk9NUnY4MURVa3pEd2pNbThlVkZCMlhlWi95SE1vcGNyTmY1UTdjbnR3?=
 =?utf-8?B?aTB0aHhaZUJuYzJ4WG12NDN6dDZRVk1WYXNTUGpjOE9FY3JmdEg5WFZwMURW?=
 =?utf-8?B?ZzNSZWMyb0lhVzliR0lvcEhOZTM5d2wvclZLQ0hlM3ZlYlhyempqTW1BaU5O?=
 =?utf-8?B?Z3oyaGhQMVJNSHdOQmJjMHc0RXRBdWJIaS94THJjVUpldGFSWi9TYWRUdWNn?=
 =?utf-8?B?QmFmYUJSNVBuSzBUNjIyWnQ1SVRYOGYxZ0M0eHI0MkgySFdQOTR1eUNXNThi?=
 =?utf-8?B?dHVXM1lxbFF5WFpKYUJmRkVJaEIrbThyUTBRS3RhUnB3WWZ4aDFwV3NleUFt?=
 =?utf-8?B?ekZzYTN4ZWFyQ2gvbGlOWStyTG5xamkyakZzekZyZWgvQ0MwMWtRS2ZaeFRK?=
 =?utf-8?B?U0VkYWRkNUNQZVJVaTJBdG8xMzhWSmtFaEhSZlpEaTV5VFdBR1JvRDRzbWVP?=
 =?utf-8?B?NTRPSS9FanByUTMyL1VMYm9vTlBKZytLMHEyQ1lHeHhWQVlUY2NFVTlWNlJB?=
 =?utf-8?B?MDNrR2FOVHZXMVpERzlYcS9FcXZQOUUvK3lXZVZZMWNuMlZnUUxlL29IZ0d6?=
 =?utf-8?B?bHhMYnkvdWRLR2t3YkdsNThsU3RRaEoyaHc0ZHUxbGtQUXBtYVcrSEtYK2l4?=
 =?utf-8?B?M3gvL3M1ZDB4a1ppaDhDbCswOGdlM2l4TzBObmNrR2xRdmNiY2tBVWpQTFlq?=
 =?utf-8?B?N0VjQjQ2Z3A5Vm93aDY3Q01adE9sSEZaUVd2TXFIZVRzRGZMSkNteE9nRXdI?=
 =?utf-8?B?ck9qSTRJK0I5MTlXekFWRkI1YngzVE1lR28rMTJvYkZWWENzWkdyRXpyMWlx?=
 =?utf-8?B?dWg3OVNOT09xR1dqZnZtWXFsZVVzZ2d5RWJQOXZSNHYra2NDNWpLVzIxNi9Z?=
 =?utf-8?B?V3FaVFRVckY1SlgvYUNUYXk2SG1MV3J2TzhZOFplZEdaajMrVitkWTg3eHc0?=
 =?utf-8?B?THNZR0xtb29TaEZpMlk0WWxxSG1QWkZFdFdYNWt2azlEMjhQL2NId3NrQ01o?=
 =?utf-8?B?VVM5NHRXUE4raGNQZkU5bUdXdU9rdTVwRUFmakJKVjJlUlczd1hnUFdrTHll?=
 =?utf-8?B?cWtwVld1TW1tRmxRWkx4d1pDSVZSMk1xcnZ3dytrR1IyemVXaEY2MjVEeWsy?=
 =?utf-8?B?cXQ4b1VKVkROc1VLeGYwUmFIdVllM0REUkgvRFFOb3l0WHNZVDE3bFdKZjEw?=
 =?utf-8?B?bkRzMkRSamVPQU0waWdKcmVpeFAvUCtoK0dZYm04T0JCdEwzbXJDVEYzTzcz?=
 =?utf-8?B?T2RKUjM3dEIwcjltWHZiWCtpN0hPcHR4eUFQUjJhVnpYdDhUeXJ5Vyt2YUlM?=
 =?utf-8?B?Q1NTSTBBQnJ5STBYSHlwYlZHRkJnRnRrVmMyNWNQdjJjc2orWUdmN1BQTFNB?=
 =?utf-8?B?VjRTNnJHUkh6Y21Sa08wK2lZb3BoZ2t0U01wWnE0QWk4Q2NyTzZqVkdrNTR5?=
 =?utf-8?B?Z1pIU1JCVDA3MjVLV0RzUlc5WngxeHoxa1oxS0U3elUrSHhOdENBdE1oMzlH?=
 =?utf-8?B?TkN6cEJqd3FGVkZ6Mkx5NFJtTkdVc20yb1dzN215U0xSbUNEbW9lR2hVVVVt?=
 =?utf-8?B?S1pzZm1uRm1ZeW1YSVgrdGRxM2htZWJ0NXJ6SDhsVXdQclYrSGQzZGdMS3BW?=
 =?utf-8?B?R3I2bnM2ZVJETzJUdGpYa2dSUXVtdkt1cVVPdFBHWUpEdzBwcnVzcExqU2Vr?=
 =?utf-8?B?enhweDlTdE4zV29CTlQwdFRjTS9VdEtKVFdjMFpQMHNmM3NSYUlxL09qQ1py?=
 =?utf-8?B?MEhtVUdCazR4a3RLVUVtY3o5R3cvM2ttQnJ0U3JENHFOdUpmUlRHTjV5ZjlV?=
 =?utf-8?Q?21QQw2gp/fiC9bxmas3vOYNElpSJGCclyHmCzTiHO5uw?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e67d515-2b21-45fa-658d-08df35ba7221
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 12:45:00.4606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1132
Subject: Re: [Buildroot] [PATCH v3 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_SPF_HELO,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UmFwaGHDq2wsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYXBo
YcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgT2N0b2JlciAyOCwgMjAyNiAxMToxNSBBTQ0KPiBUbzogYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcNCj4gQ2M6IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT47IFJhcGhhw6tsIE3D
qWxvdHRlDQo+IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT47IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPjsNCj4gWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdv
b2dsZW1haWwuY29tPg0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW1BBVENIIHYzIDIvMl0gcGFj
a2FnZS9tdXBkZixweXRob24tcHltdXBkZjogYnVtcCB0bw0KPiB2ZXJzaW9ucyAxLjI4LjUgYW5k
IDIuMA0KPiANCj4gUmVsZWFzZSBub3RlczoNCj4gaHR0cHM6Ly9tdXBkZi5jb20vcmVsZWFzZXMN
Cj4gaHR0cHM6Ly9weW11cGRmLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9jaGFuZ2VzLmh0bWwN
Cj4gDQo+IFN0YXJ0aW5nIGZyb20gdmVyc2lvbiAxLjI4LjEgcGlwY2wgaXMgbm8gbG9uZ2VyIGJ1
bmRsZWQgYW5kIG5lZWRzIHRvDQo+IGJlIGluc3RhbGxlZCBzZXBhcmF0ZWx5LCBzbyBhZGQgaG9z
dC1weXRob24tcGlwY2wgd2hlbiB3ZSBidWlsZCB0aGUNCj4gcHl0aG9uIGJpbmRpbmdzLg0KDQpJ
J20gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcgb2J2aW91cywgYnV0IEkgZG8gbm90IHNlZSB0
aGlzIHBhY2thZ2UgaW4gbWFzdGVyIGFuZCBJIHJhbiBpbnRvOg0KDQptYWtlWzFdOiAqKiogTm8g
cnVsZSB0byBtYWtlIHRhcmdldCAnaG9zdC1weXRob24tcGlwY2wnLCBuZWVkZWQgYnkgJy9ob21l
L3ZmYXppby9kZXZlbG9wbWVudC9idWlsZHJvb3Qvb3V0cHV0L1Rlc3RQeXRob25QeTNQeU11UERG
L2J1aWxkL211cGRmLTEuMjguNS8uc3RhbXBfY29uZmlndXJlZCcuICBTdG9wLg0KDQpXaGlsZSB0
cnlpbmcgdG8gcnVuIHRoZSBweW11cGRmIHVuaXQgdGVzdCB3aGVuIHRlc3RpbmcgeW91ciBwYXRj
aCBvbiB0b3Agb2YgbXkgMy4xNSBicmFuY2ggd2hpY2ggaXMgYmFzZWQgb24gbWFzdGVyDQoNCi1W
aW5jZW50DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
