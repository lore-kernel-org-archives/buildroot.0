Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72808606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HY7w0IX9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=A7qhA9Hd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B6240D95;
	Fri, 30 Oct 2026 14:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pkf6VRdWFlON; Fri, 30 Oct 2026 14:29:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3C20640D86
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370550;
	b=jECy4SBCOY6AI9THgObmTj68dXGpExBKCJIhSjbF0nzorEOcVukAiZWgOH8t7l61fl2F
	 b+j+0ciXwJL1YwSobd3l+gabWny7FP3o1lAmNo7osSsj12C3ZkxM3Td3TgHaMwI+eFjEY
	 DGJG4g4bykbNsRfZXegg62Y+S7V5fszQnQZMYbttSYUwXQ21dRpkz/OdVi69rUYyGPju4
	 5M6y/OqjxdhHjznCSaJO/EfbUcqhgAO7h9pRXMixam8uFHdMD8DusRTvOAtiAhF4tjsPi
	 dlIkJKTSknFHSvdG1e6YyLQyJrAf+wYKHkVpah8U8lOishmphG/11xleJcKANOQ5XkQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370550;
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
	bh=bcqCNO3ujv/TZITdKYkCibLtnkHmRFv0M1uo1UrKbDU=;
	b=VZ8Gn37Boau0ibbKWfaGjEDLCiK6yuSq0Rs8JyuS7iM0Sm1T0/jGsoVXIt9xgFU7yHj9
	 Tq30ITQnHET8TDGS+J8afg5HiXD/5HNHj4Rv1NcBm1MEYpszyq70uX3GGw7HwT29sO0vm
	 JroPIluRp9l2ORU6G7Fmfks1fBvxbXBnkpUfbGe9w8+W/dFIi9iCruggVo3tJ7CbbIcaB
	 BxpE41jk4nl8UosbbEiEiD3BRMZQYVONs776HW3EVUWc3d8uddaPcG6qQa6xvD3ezk9mZ
	 5LDpTyDWXr4JYETbI/ZP2gQtt9alrY5WBGt5kp1FBoDSQtQTx7fx5Zs6F2mspj2BAJw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370550;
	bh=bcqCNO3ujv/TZITdKYkCibLtnkHmRFv0M1uo1UrKbDU=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HY7w0IX9hL5kPF68hFDP6fmxzO++5IlnepxUc/vNd40o73/z8hzu3HqZcvQsG5XEx
	 tNMytxRHkqn0ZjqKRlMKaxs2bN14dbVE9ivY92HN185mIlQjfvGvTY0go7xT1o82gn
	 9XcHaV5nmOu+oCpby2NNAed4L52X7riz5UnsnpwQijqiP8AuQ5YuNvyKAUvuuv0W4w
	 Tb5dWoN52dXWR7yG67KUah5vC5/gEDLMKXEIEpjQeAg7q9dedjG0sz2aQnheUZ9Xiq
	 dIST1JMoZBGQO7lo8TYn1QgkKDmCaqsF9E5XGqk2WbyzRPiiGffF5mGjtD1vBqZWs/
	 VsxdwEjjOf+mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C20640D86;
	Fri, 30 Oct 2026 14:29:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 707C8D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 554CD60A41
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iF0xxUC6QTzK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:29:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CCE376083C
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::60a"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793370546;
 b=YPKLv1deXCIT6l/9Hwf5XFqjVlROL6UEMr9uY2267PYVylYVl/CFGk2/X+09nIwQRr0o
 +Z6YoxHR52f1cDJ7VJmgQVWGvfFQDcMSO9PQbJg1oLmD58MhtEoyNrONrP4ywSwql7x4D
 +Kjky1DyIjDCOv3/C/+t05LGF5KSQ75+tMsEeFvCx+hLhmGrfGBdck4aGI5eaO8mfS3bu
 nKvPSrbjcLdphxWmnl0JVMFa5084+nHr0cexxrT3a880vnabeQzznGiTbLIDSMz4lPrmH
 +VlfO4qGqGKDpbsxOic40etJT+9BfNGtREdfezXXpzn+y7YM9I00pe1Ctfh1Mi4byJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793370546;
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
 bh=ZBbfDVqPSCMFAOM0tphJWHg4BI7Lz1SeXsl47pOyIHc=;
 b=AcGrSFvxXfJj/XzxUjTsox/qrSkGlQ7HpV7NC8FPfDrJhhAJsE0JmCuZWAI0+wPJlgTp
 IERRu7uLiBeGgDPlneSl4T+CcXmRU3+ZSd5x7QZ9C0t7C7zGnd9LmnWfsypuR9S91JZOm
 blnCm8MIY+JWQssHtTVqNFCMZIhLTpZ7E01wwKcJYiaV/nysuRZp7NADu4/uo1Nu558wN
 yyEXNSM2g0LUxIIJ7Y/Uu7b1WO8qaakxHnJJdY5IXtTlqnb+aD+DcJAAgobS5hLq2+kPo
 MvzjWJdW96OMWDGRfBaFH9odpdHWaBpFKszOxJEnEVLyjH/OxNy7B/LbXuR7oZXjq5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=A7qhA9Hd; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:c::60a"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::60a;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=A7qhA9Hd
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on060a.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCE376083C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:29:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=XAHvPZOSHxuqux11wltCuxHyB62WelSiQNmZRF5oE4zFQCKVtHFaPDu/QNDAKbphOI4he6jf1pEl7+S64IVGiIJCB1AM3MXGNelFHxOiGwBfh030yfZluwQI2Lc1kySLJ1+WRrlPRPRJyzHwWXdRLSHLEAglOPx1yRiAs/uTCOh8eIPL/NsrYWmnDC8T/ib24G5goQG5RSpo8gxXXa7flztEBze1V+QQQqDwgV08rEBPTO+FsgyQQ6PvG6jwIurmbbaZqgyzBOxvEnAkVHF5vlLisaR+GeRaq/Q1acVBSsOkJ8mkrH0je/edvYQtsyrrmau16sDBhhJ4l6v6/7fhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBbfDVqPSCMFAOM0tphJWHg4BI7Lz1SeXsl47pOyIHc=;
 b=S4ja9qPBgG/UAigDAAZwGK9Au+VsJ/GdoumEnYgYKCiXW4vKgm7Ql92c5YZKToTJYVtooGX/uknhxDZsi7MfFe5jG7b9I8fE8KuDMEn2+56fz9wvxOsazYE4YcSWBIcdxRUpGTriLG+U6IGU1nZ90cbS/i5dfyk6Zk0/pXkPZ7NDqiUs3Iq0k40Vg4J8842IYToxevvqeFC1XpqZ6SNn9BFH7E0GqXAmK50/th4LGUhEUj4AK73+cgRQnK6J/prm2PlMVjrGVt/2qfoc4lyaFfDoL2TatjLKi0WUa9vKz2ektrkC5aJIaIcvUpyLGdUqCFD7/kEVVHkLmgGFoSsaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBbfDVqPSCMFAOM0tphJWHg4BI7Lz1SeXsl47pOyIHc=;
 b=A7qhA9HdY16hEuVS5ugrIlDkzUqz2/QldakgpOuAL/aDxFZC3/8Br9eEZdFDKa/P5h8ihcdu7CQXjZ+Y4MrS2ikeRT/AAS5CY6uSYrlzbw/91QU9EEdB4tLmRG6DbprYe1PPjRyK96P/Iqxx9ZoZDqvdWKFXxbNgN3EpF0hNiqQXy6tqgb++IIYi0DgcqMevS4/LgNwiQ+decKEycBznPnnxQKguwvO47689wexJucOJVFdJ25PUxTIidFPWqRQIrqh7rbJa9WG/jDcj/h2FXDq8NQ54fdYDAqtgrCFBGZR2DooL6MLbcKlNrKSw1887mlYq39croKUCYP7lCyd4qA==
Received: from BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::10)
 by PH1P110MB1330.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.25; Fri, 30 Oct
 2026 14:29:00 +0000
Received: from BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e21b:e9b3:34e9:8da5]) by BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e21b:e9b3:34e9:8da5%3]) with mapi id 15.21.0546.022; Fri, 30 Oct 2026
 14:29:00 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bernd Kuhls
 <bernd@kuhls.net>
CC: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
Thread-Index: AQHdaHsBkNMBUHWr+kWy1xMcbnzqvg==
Date: Fri, 30 Oct 2026 14:29:00 +0000
Message-ID: <BN0P110MB16090AD1C42FD6EAAAFABCD69F6DA@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
References: <20261029204953.1447140-1-bernd@kuhls.net>
 <20261029204953.1447140-2-bernd@kuhls.net> <auO2ugenOrGrEKGM@windsurf>
In-Reply-To: <auO2ugenOrGrEKGM@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1609:EE_|PH1P110MB1330:EE_
x-ms-office365-filtering-correlation-id: 07605f33-b8f6-48bc-3d87-08df369223ac
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|23010399003|1800799024|261021121427099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261022115727099003|261022105027099003|10067099003|4143699003|56012099006|261009223027099003|22082099003|18002099003|55112099003|38070700021;
x-microsoft-antispam-message-info: NfGDKIWVufbiSDC0EZt5NYKEAzlc2e5uSMsJMGjHjidgs9JB9mZxBaLGyi6ufWOsUMMuVL4bdR2s4euypb5Xbx8Oi1XkdPFPzYOq9c1Skrnf2ylVMWUkU2GRGZ7vD6VPjIsEjC5/95ulEQni8gugM/4msMOGL8W2j+8y0fo5xz6epeK0n+AAZE7jyECrr7ELK4r3+GX+Z2HxxxwqpwlqpZPaqxTPDTy6yO0HyRlYHHTS14mJZI79uSyhPCRrNCsh0PPp5cvgxy9+OEgBh4IJMiI0S6EghD74UIVzOrxdUNPKimhze+LoaX83etjGcRxqsgkfgZnwwafIQtq+tEcLWj7x8+FJb4Pz3eeklzKq2rOKmJipER3NJbWnVrtXeJQ+qXGe/R8TweWoVI94EmUE1GY2CHTd0lkhoyH8e/j1dFglMMHi+5rE4ZIsBHEzhBwkWdvRgRHXn2eiIC+eIEqNjUGGpCi9xQUejFSllBrouACpAXPiIItozx/7HmTrkvtisWmA7qxTeUVb5Z7vZvYrmLhqsrQmNw5dpOHfRtuAa8n5yxjg3HMgm8pk2YQuoqC+UNaTOhsjegE64RdIqeR/Hl1RegbUS5RTaIRWlHdM3fH8l23LfL7O7hCw3EMmMn+ooBg0pat07L7UAwAzlC56oxIsALHTu7MKgw6LixV8Qy8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(23010399003)(1800799024)(261021121427099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022115727099003)(261022105027099003)(10067099003)(4143699003)(56012099006)(261009223027099003)(22082099003)(18002099003)(55112099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gknoD1bBC4Haku6YTsn0RHwgwKaVB1+89FG4zcwRgjCG3IgyV5JCv7x37VwH?=
 =?us-ascii?Q?f+sAE3HdWgAmqw05XI3FmtuwsQWHKof/k3gMFomn6sqk+QTy/Uy8QhOqS3hd?=
 =?us-ascii?Q?QSNI0DZXL1IjP/upm/AmytTmhTrl96CNHOBFzTiKMPia3sJZWj2aQ3ojs/jV?=
 =?us-ascii?Q?IzkwMVKlJP4L5akpRiPJduT+oMzUo28LTuj6FuRuJwHNCSxyTDCBnBFTfGrB?=
 =?us-ascii?Q?z3rGbleKFTNqj7tpgKX4N5VMlRr1Rtvmx65V5pt1OE+hrvOaZGJ9pEMfdzFf?=
 =?us-ascii?Q?QSMevgPT+RoDzT2Hkit/OT4rhA2yRu2cXDW3Ghmu7ZW/kNigVkEn8/DKLtGx?=
 =?us-ascii?Q?t+qkbKKJTSquljbEgxA7Kzozcsvdo/42Cetyn5uglvOPiTXgNtVS4zvx6mRr?=
 =?us-ascii?Q?yI0hwpfi6cqyN5fl0IooK8BYEiQsi3c9bn1OaWVZxObhwbCOWrX+GpgrQLSX?=
 =?us-ascii?Q?8d6xHhhPy8xuhMbolC/5FIhs1TMbrjofuMfNhp9fk+M3DH1jMZYljnqnG2Ee?=
 =?us-ascii?Q?g1TaoVjP5ufq+EWjSiSerek/ARGeUVPSA6ZxnhY4YUudMxhZEng29QyUkFCu?=
 =?us-ascii?Q?LNRUAzlA9nF027yOqYGR71u/TcgUXq7fDpDAovqrMaNdX/1n67TR0a+lQ1Hb?=
 =?us-ascii?Q?wATY74amJ2/YRFYOSzAyqUtQ1AsPlV7xzY3pjO+RM9FlwhonfzrPmEnzkMBF?=
 =?us-ascii?Q?6FveZ/KtPCmZLeyJj9xd+Uc6FWIcIhI6tMdStaHEDg4yhINzP8HsjulSD5ey?=
 =?us-ascii?Q?282ZN0YTWoBkKE/WaQ/gY0QCvXYcRkQO1dBoYi4FfRDjcdAxuV8ZGMhWrAbk?=
 =?us-ascii?Q?cUNLuZUKnMMr/mgh7JTAQl27hCPLSgrm2lW7nVCe+17jXYojA/UqET6P1cPE?=
 =?us-ascii?Q?crCioJOxceAflGRNlYSzz/Yjeo5IFf3QOPhAzONeiyEtPQxSNs+aEZD45Ijp?=
 =?us-ascii?Q?1UwmY0ai8SBNcEbkfm6CzlHIeSTbXBCZAICovSYWRM3DvhtpRVlPWG7A6pV0?=
 =?us-ascii?Q?Qn+lHX92dCM4OARD4mjzX/Y+09WOxMpvbCqLe1iKns79T2vaCh0V8RKjrBYS?=
 =?us-ascii?Q?xYYrlmitkIZchrtn/el+5v2cwrBsfi1zYEg3ebzPOW185N8PAjSPclRbLDBw?=
 =?us-ascii?Q?C2GYzCr9JGcKrXn78likkPgBBA2v5Owzh9k6Xvx8IW8njRJaXTg7iGqslu/1?=
 =?us-ascii?Q?o3LaPc+XfnuvVxlTaElTB3zp2p3kq7sZpYjJSN86+TOXMyyDB3QuZAZ67yGx?=
 =?us-ascii?Q?hMvB0jhGwpPrcV61ORm9WtgWJ02LhK7btJRfb1hv61ygPoUqagsetWDcv1m8?=
 =?us-ascii?Q?pSWNGY9D6BGKSUbN0kknB2aqTTjwOyhrlxDNlDah11uQAjofwWt1BWhQL/qq?=
 =?us-ascii?Q?nZh9Kzc3ccV3RXnzk2HZpIOPwXAgFh2S3qJK/8+1hJvMi7YK/cXOMkTAHiX/?=
 =?us-ascii?Q?9JQ0mrHwfDnwRz5+pi48s/yTKKdZwhEXFUdvVHZlZogcRmzVioMmiOQOQRaZ?=
 =?us-ascii?Q?KF3Y2WsSEg6B6RfR68wXrfw/QB1a2XjhxDF0T9r8g0jrsF9eaNoXIsAjX9Sg?=
 =?us-ascii?Q?LJKThXYTpqrikGHRajOUlmpLZZbIQEMMbRe6tbPrCFqZUYVRoDMqDfJ8JQpY?=
 =?us-ascii?Q?o2WzQjpjT6BXQjAUN5JbKVNYYdOVwussv9RDkWK3fAyq?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07605f33-b8f6-48bc-3d87-08df369223ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 14:29:00.1263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1330
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1




> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Thomas
> Petazzoni via buildroot
> Sent: Thursday, October 29, 2026 4:14 PM
> To: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>; Vincent Fazio <vfazio@xes-
> inc.com>; buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] [PATCH 2/2] package/python3: bump version
> to 3.15.2
> 
> Hello,
> 
> On Thu, Oct 29, 2026 at 09:49:53PM +0100, Bernd Kuhls wrote:
> > https://www.python.org/downloads/release/python-3150/
> > https://www.python.org/downloads/release/python-3151/
> > https://www.python.org/downloads/release/python-3152/
> >
> > Rebased patches using --zero-commit option.
> >
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> > Cc: James Hilliard <james.hilliard1@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Are you coordinating with Vincent Fazio on this python bump? He has
> been doing a lot of testing work with Python 3.15, and my
> understanding things are not yet ready.
> 
> Vincent?

I may be performing more due diligence than is necessary, but here's what I know:

General:
- python-dbusnext is broken and needs to be removed in favor of python-dbusfast (already in-tree)
- python-pymupdf needs a bump but there is a patch I've already tested that handles this
- python-treq needs a new dependency `multipart` which is different than `python-multipart` which we have as `python-multipart` in-tree
- The python-magicwormhole unit test probably should move to using a block device and not an initramfs as it runs out of memory
- I noticed that we're building the interpreter in shared lib mode. CPython's `--enable-shared` is interpreted differently than general autoconf recipes. There is a new flag I recommend we use in 3.15 [0] so there is less of a performance penalty on the interpreter.

glibc:
- Unit tests build and mostly pass except as outlined above
- Python's builtin test suite largely passes, I'm not sure I really want to sift through all of the failures

musl:
- Unit tests build and mostly pass except as outlined above and except for some packages who need defconfig tweaking (TODO)
- I have not run Python's builtin test suite

uclibc:
- Unit tests build and mostly pass except as outlined above and except for some packages who need defconfig tweaking (TODO)
- I have not run Python's builtin test suite

[0]: https://docs.python.org/3/using/configure.html#cmdoption-enable-static-libpython-for-interpreter

-Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
