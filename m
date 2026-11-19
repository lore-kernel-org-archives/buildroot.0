Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538DA606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Cb9r8QlO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com header.a=rsa-sha256 header.s=selector1 header.b=eN8C1mI+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30FE08108A;
	Thu, 19 Nov 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLfq0emwh2Uo; Thu, 19 Nov 2026 08:00:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 898A381178
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795075207;
	b=i8mYhW2bQLxHx2YMKQP1+1FbNUcnyWh3DoW0+1ocFPmXqeF230EWxttfwBq2MSApXiBI
	 xLd5n4TF3KMPOEmiNvxVqXLCZHTrccs3Eyff635ZL63fvNnZChUMdy22v7+UetRtNMEk4
	 29LKplFYgDbapC2VgyJ5S4csIAS0R8a62xhydzjDx/HtewDBENnacQOKsBJZ4pgg6IbYH
	 s8FkJaaFPQyBoLNsz4uqDNyWeUggVjwfwLzNNRhfYb3r6aG+4C32FJo+QgFCsLlustABB
	 j+s41Bh/II/6Sc7OZ8Ao+gk1mC5K6bgxVEnY76QhL2uZ/eHqu/SEMaXHwsh72IVDv/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795075207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
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
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lFXpv48Z1BM9JS6740lhTG1layB1t/okdFTT7iTpKoo=;
	b=SGNahaxdXMjjP4KMUgkLXSX+k82UwFwG2ukkBhiznilYFEy59FxwPPnUo962Zv/pvB8K
	 f9WAtpberth1ysAXHSaUjjCh3GqyPmgXZ9iyJ0GeiUoFUZTNsc9mzrpH+foATj/VUq+xD
	 9XKcQTvTrd/L9SYGnP5BYOlURPPGhsUOqI/eze/4Zt/27oRuC1UCKx1TshYbnoql7+lXZ
	 TjX9JDUFylgpIrv0+nYW1Hdkx1sqnx8Hc7bFtBIBSarzAaMr8d7sQcLlw08vGOIhlJAkB
	 TYgtVLE2T4QtOpBGs0gP22K5lHLixh39rKPEot6GaRc9rto/57aVn0tkN8iBqOtCPIg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795075207;
	bh=lFXpv48Z1BM9JS6740lhTG1layB1t/okdFTT7iTpKoo=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cb9r8QlO6nRQbF2KEAy3OpItvIr85JFWrupWiFMcSmjBF89tInqZVgK26iZLf6zMX
	 uTN8naRBHBgMb8kVLCmVUKWFabGDJhElndOIMM+7K4+FWu2aGQxK4NQNzI8ONlYwfA
	 aBK5uyAaisyrFsrZIhf34dcMxLBxK942x0v7/XBZXNj92Rm+FRDt8TDnPOlTVCWoRh
	 TlJSVJbCNS21up2gr8lx2Wm5Eq/E/9w4bx2xBmgn+kNWEdVEDvTOSzkDizZqYhFYPX
	 p5mNuT/2YVExn/4SUFdTob4L7c0fIpDcxOJq1iDjdmDjKOdMpTvUbLDCCFXcwNVTER
	 ggNLlf0oe6nkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898A381178;
	Thu, 19 Nov 2026 08:00:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 822D0E22
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 676BD40080
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfA0nXunTmkH for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 08:00:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D5B6940072
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c20a::4"
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a01:111:f403:c20a::4;
 helo=pr0p264cu014.outbound.protection.outlook.com;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=smartandconnective.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=selector1 header.b=eN8C1mI+
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazlp170120004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5B6940072
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLM9CUXEgXNE8UrOwG25b3fKz3irSYN/GyBKMn3cR1E=;
 b=eN8C1mI+wemanwyS30YbB33moF0x6UZa/9taKaxsd7BGExyuet0BZK/+0o06yTYukgoYD11B/WNE6+fJr6knAVIhYqRhY/V8Z97thKYl0yGuAhO64/ah6lGDlbjIPwKVwwchkbxmO2tJqfUprJd3/USS0CslATrK5u92JNJv9jUla69i6U6xCp9QO2aBLmL9cmX24rDUe34N8NCJaxJmzufgTVq7rZvRe82bGLQfjjHAhJtQ6iKtT4WXCiwoiW3YW/a71MwN/cIu4xUZn66SsnLzjU5x0EbcPaM753LP3GZ9wpR2sKtS8Kz5qU0wbAVLvB+cmqyIOm0v8ut3II0/Kw==
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::6) by
 PR0P264MB1657.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Thu, 19 Nov 2026 07:59:53 +0000
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1]) by MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1%4]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 07:59:53 +0000
From: Sebastien LAVEZE <slaveze@smartandconnective.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Sebastien LAVEZE <slaveze@smartandconnective.com>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>
Thread-Topic: [PATCH] package/{rust, rust-bin}: bump version to 1.100.0
Thread-Index: AQHdd/v1dTmVwHfcq0q3bnU13n8+eA==
Date: Thu, 19 Nov 2026 07:59:52 +0000
Message-ID: <20261119075949.253474-1-slaveze@smartandconnective.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartandconnective.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB3425:EE_|PR0P264MB1657:EE_
x-ms-office365-filtering-correlation-id: f1f7f3d4-0e4f-4dfd-e8a1-08df46131808
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|38070700021|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|261021123027099003|261021121427099003|261009220027099003|261009221227099003|261009221727099003|261009223327099003|261009223027099003|261102123227099003|261026121527099003|18002099003|13003099007|41080700001;
x-microsoft-antispam-message-info: +SwW598lBYLL8tb4XOQ2YR0lZ82r9Fqm2ed8LToXBovsqHVe1+w4ZRuaCr5hcpZfAEJ9q9m5BN1RLsQ/3q6qdM901W08BU03fhH8AcYRy4JvVwz3h09MMWm4PRO0WNpFJRSYJF8aHjYbMGjxfVmoLkLq/TALPy2f77RRY5NnFhlsiJlwtiXHkwU+qaUy/OOfFFeicwNnJ7ID/mZyiOuTtC9Q4oHbP7HQKVr8RtuARHuFOAFMCVwS/N7J+l5SNwpLaUUXyag03vHtDq6Vf6DhZhZx9kpZ9u3CMI7F4namBDL/f5oEiEMIxFqcaZoXiQPOi7xuH7ia7UxlxzsIWNn+YaRu8gw9FhULM5r9je79+OqAj7+MwrIXLmRob5vV0kRDNKAl1qeTjHD8NlR29URHIyk2UOUgax08bMYl9mDlxLbh3AvCdLLWmCrEMSDm8a/MCD7Nh1ZT+Xfw1rl6ZxN2oUiR7pgIcshNcAmdfOTUrCNRftn7rEz2FQdUzrqobIeMdKN8SVbId47ynwa4djW+sg7wxO4rulVONzWlJwyctbeQmCiKzmVWrdecD7VuU9Y4wKr1n1VmQlW7iwYLbNgXaOKdqgbLxqujZWWsq3Sbsm5jZJt1YzdhU2W3envVFroNmgH8B1/tJWun6t078A+NLO2WmKi0MtpnwDfGcHuXEo1nS9gFL44UIrgwpxewjJEW/GrTeWYpbDBV9yIPk44hCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261021123027099003)(261021121427099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223327099003)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWUxU1N4bU5VOVViQWFoVlUzS0c2VzRiRFpJVGFlSHJYa3dqNGRRbUozNEE3?=
 =?utf-8?B?TVVVYlNsdnRZcCtFNzNYQmVKbjhMUFhBL3RpTEppSUw4V05YU2NLbERxbUNy?=
 =?utf-8?B?UFVsNUtnN2tSS3lMTzNMU1ZFVUlBOFBVNGdiT3JsM0dtT3dhZS9qN0hFSXlM?=
 =?utf-8?B?QnZMYVQ5YXJhZHU5a0pKWnJ5MDdBTHNZQlQvTkdkZzRMamtGeVR5NVYvVFJj?=
 =?utf-8?B?OGpOZ1lQWnUxRTNTcms0TWsvMVFEdDBZUjhMNmRER3M3ZEFEa1VoUHQzQkNn?=
 =?utf-8?B?YzBXN2FuWER2cVIzYnBXNzFPcVB2SEY3aStpWmgveWtSSkpENGpaeDJRVms1?=
 =?utf-8?B?b2oxNTc0UW5seU04cXJEa1RlY1NrYm9YUFB0Q05ZUWI0alFDQmE4TUtsZzMz?=
 =?utf-8?B?MndrcUl3VXd1SHhPUSs4bitWdTZzQ1Q2eGdIVHR3SWQvRU1GRU9WaVVQYWVP?=
 =?utf-8?B?c083R0xoTFo4MWY0ZFE5Z0QwNTE3MDczOUt4cW9uUGhoQWhBelBFeUxTR2lV?=
 =?utf-8?B?b2FwekwvWnFkWjdqcXVLS0IzMEZRU25QQkRSbkt0RFZxS2kwYTZSMG1TMWRv?=
 =?utf-8?B?aDVuRU9KS1JTaUVjKzV2NjVOWHprWUxtcXBkMU1DZDVRYlkvajRYZXp6UmFD?=
 =?utf-8?B?VDhseDhuN0JNTDJWSWV5dXZ3QXF5cjNQTmdzd0VMZmlRWEVXeFgybWhJSWJx?=
 =?utf-8?B?SjJhd3RVNndZZmhKT2NpRlVCQXpmeHpIYm1hVjkxNllUM2V1a2Y2V3gvNW55?=
 =?utf-8?B?OUI1TmNXNzFGOGF5c0VOaGs2cUVLWFl1ZmFFMm42Z2ZKVFZiMDcwKyszQjR2?=
 =?utf-8?B?NE1XZnJ2TE9RMnRlRTNuYk80QmJPOTR3TTl5TmdtcGsyYWxPYzE5QjBReDJh?=
 =?utf-8?B?c2RSSmxRRGxzWHQyMVBKdmtybmk0YnlRYVVwK3hCOXpJbGJkSVZNc0J0Q3FB?=
 =?utf-8?B?SXc1SFNYUTd2cnBDZDREUzd3SmZscGhvMDlnclR3SVZUQThMNjNsbi9ZekVl?=
 =?utf-8?B?R1crQ2dzUG9zL1BzMWJkU3doWFZPRk1aZ1JvME03M0YxajFxbDhvcnZHZzAx?=
 =?utf-8?B?TGRhWXRQdlIrSHZSR1hoUjRzd2ZEWTRaMU9aUzBPMHhhUGxqcjNNRjMzWTJp?=
 =?utf-8?B?M2sxOFJTM1hwSnZkeGtVdnhHbWNyMUVlYXVraDgvMjI2aXJRY0dQa1hOZ242?=
 =?utf-8?B?bktPWVdLbGxpRVdQQ0JtNFJHN3ZCN2Q5amNYL3BjTmJkblJYU0grcW1KeXR0?=
 =?utf-8?B?enRZdU8xdkFWazJlRUFoR2RNUGhYTjVkaE5Qd2JhNXhtRmsrdTI2V0ZLYzNr?=
 =?utf-8?B?N0hhem5sRnZxL0c2N3A0cGp4YjNTb0czNnM1WjZYSG05dk5ocTd1RFg0QzVm?=
 =?utf-8?B?Q3R3cWJESVBRNkZrUU5LK1lENDA1TkNMcmdrSHVPS20wekdYMTJEOHFNY2Nv?=
 =?utf-8?B?TEtzSWlXakJZWDhsM3o2L3VSZFJ2VnY5WXc2amtHUzc3QnNmcVVhZEliMTd5?=
 =?utf-8?B?TzRRNURGd0lHSmh1RWJlMC9BYVdWU1c5ZGo2M041TjRxeCtxUUJLOE5xdUdE?=
 =?utf-8?B?Z2VqNzNtQ3VSSFh3NUxvVEhZT21rOEJ4SjFBdHpOeUJVNHhqejVBSXQrREVw?=
 =?utf-8?B?b0dXU2V3bWl1VmxQRGJxTmxGVHBmaFVlT3NVeUR1aUhBNStJeXhLYit6ZURi?=
 =?utf-8?B?ZmQxd0h6V3J3R1M2RlMyL2pEN2FVdTBYQ3RoR3Z4Vm13SWZsbEcxV284WXlr?=
 =?utf-8?B?akVZTElTRFQ0ZUJQc1BndW51NnNPMkw0OStIK2hiUFNqVTRBMnVwVE5YSnZM?=
 =?utf-8?B?Sk1Sdk1YSjRyNk1PbFNuNEFiNnFIL1JXVUJkdnpjUnFmWTBTOEcvSSt2RGxH?=
 =?utf-8?B?MUg1WlpvaGJEdW5Lb2VsTkFCejZTc25McUlCa01YVm5ORUpySlNMSm1EL1hw?=
 =?utf-8?B?TFQvc09DYVFXNjJpb1pIOEg0djRCdHVnVndGellWVVl5TDZNM0c5eWRsN1dp?=
 =?utf-8?B?NkNhdDlPVG5NSmk5L1NVMDRvc0xxalkrTWpHaW05b3FRdW40SCt0aUV0empj?=
 =?utf-8?B?V0xVVm1HcjhocHhrY21iTUVHekRLWFhwa1NRR0tIdW5oYTA4R2d6TjQyWEY3?=
 =?utf-8?B?eHNRQTZlYkRyWWdOdkJMSHcxOFVRMnhnK3E3RE96NmxLKzRVeVF3ZXpTMzBo?=
 =?utf-8?B?aDJVVHY0OEtTazFrQVY1eXF3dTg0MnRkd25kb3NiNVhSTEFGZEFaNGZlWVRh?=
 =?utf-8?B?cENjb05IeFRSTTAwMlRqckpTN053SDBxdk1QdkVGQ1NhRnFYdklPdnZnamVP?=
 =?utf-8?B?QTZ0QmpVUG9sZ0ErclgvSDZtSzM3WVVuN3Z6MUo1RWxzNVlETDVpUT09?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: smartandconnective.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f7f3d4-0e4f-4dfd-e8a1-08df46131808
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 07:59:53.0476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7f3dead9-eeef-44dc-ad5d-e14fabd26082
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8/+onRRtpTf9DqO7cxl/YMaH+invzrH1tdxubb9is0EOReZm2/5jROlKPPc6ifOqbAagtnF9dkjWMLTndb6aNoj745kKGxqdnQX0yPVAegw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1657
Subject: [Buildroot] [PATCH] package/{rust,
 rust-bin}: bump version to 1.100.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sebastien Laveze <slaveze@smartandconnective.com>

https://blog.rust-lang.org/2026/11/12/Rust-1.100.0/

Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
---
 package/rust-bin/rust-bin.hash | 132 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 9eaef55cee..c438618b0a 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,72 +1,72 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.99.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  a48fb1e853be56ce9b8e2751f5464dbd5e16440cd81e237920f3a5e7e806333e  rust-1.99.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.99.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  f5fae4c94233314fef8cc186e0bb8b7cd4165ee39268fcdb5d1fcd69afd7d7ae  rust-1.99.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.99.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  c4266fb77a8991036df4104f2aa0c644a9f1758534592193c977d2d40b5bbcf6  rust-1.99.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.99.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  cf1e4959d25c526cd368e43020cdf4c87b7c7c4b7ef113d9b4447c503bdb5763  rust-1.99.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  6791ac9124ac16d883f9f78e39e29a6a34230ab0bddade975ee9aae53a2933b8  rust-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  88294018ee59ca9528cd273fe5d8148b8d3b04ad08f02adcd000983aa9773820  rust-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.99.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  4ad1eee9e91f8f21be99cf2aedae2543addc54e0747e2588d87b9e8516b974e3  rust-1.99.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.99.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  231fcae47ee950621374725b5fc3b5441d2fbda2955ac45dd7dc816d8876cfe7  rust-1.99.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  e25668477083d6a9ddb87b9beb9c00742225f38233ccb4bfba3afa7a07427f52  rust-std-1.99.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  2f3eb0d0610e2b7f6b2121d106e2490ac648decfa0c09b30873bdfc60de6c1ab  rust-std-1.99.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  fb93e9715ef14ed17fd6922dd200d14cfe855b46c4fa1e8a03ee85ca75646022  rust-std-1.99.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  32278298365b7b78cf5b67ec34bf5e11821679dfea8a6d867725af860c4cbe50  rust-std-1.99.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  f66cb84ada451344f46757c72d1bfa5a34e8f174affe67b7fa9c3b2d8a033e26  rust-std-1.99.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  74adeec515565c17242c8fafedbda40a30a49f85e9510fc60013cbc539f83782  rust-std-1.99.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  16147e552d542b300e5068075ef0e38600e989816e794afe18e34b6247192598  rust-std-1.99.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  34e0afee32cf40fac1283c2a4c71c265a93973b4df1a774889e89de138bd510d  rust-std-1.99.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  d9f8155889cd3f4fc36ac35dd1ec357c46ae9cade0b106aca03e272b005e0823  rust-std-1.99.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  53fdf6581a24f510def5173813a0d23518a8cde547b9fbf4876499f19feda18c  rust-std-1.99.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  eaf5ee2b0948e18e586af42aa9aeb0e8e5aba515bc2d862bf0d23dc59569a8a9  rust-std-1.99.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  edccfaef9195cb74b5c33541e587629f92433f59fb5e4bbb7b8293f966ecd60a  rust-std-1.99.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  0a0d01938461c2cea3d9771f6a2f9b0bc42e8adbf5b45ecb9cb92b5371688ddf  rust-std-1.99.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-i586-unknown-linux-musl.tar.xz.sha256
-sha256  df81795fc9a09a75f3387ede4b17a10bcfb55ab04a8e358d05172479683bec8d  rust-std-1.99.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  8abb74feac06cfb0d3de4e27301adb05f740661c7d6fb154528906202157ae15  rust-std-1.99.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-i686-unknown-linux-musl.tar.xz.sha256
-sha256  25df5dae9ead02745f709ed133f09700abdec5eb7a8027e08bb41aefb1a451a1  rust-std-1.99.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  25d05cf16db111ecfe7dd8e1a3d61d144f2348e87dafeb07ff3cf402e3196cfd  rust-std-1.99.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  58f8526a50eb47eb106130a29e77c97e3c5fd60af41e8a16a63d39673f9aa33d  rust-std-1.99.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  4bfb8ca55cc13f11addc5782a946b360b78888a18c8e315635b822f961f553c6  rust-std-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  0fe2aa8294281e16886a101466160ec460ed99e51c8af11e1c76f88f8bd0de6b  rust-std-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
-sha256  59797f5c7c87ef38c1d202576cb6fb9c6423730d8efcaf2fab7c367d2d878a39  rust-std-1.99.1-riscv64gc-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  a5e394a3d85c6888f016abc9ac02dceadc6eb8a7216b8a5ba863d6cf649766ae  rust-std-1.99.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  c73df3e84bba70fa87151ead94aac7848fee8334f16526bc2f97d20372b327ae  rust-std-1.99.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  109b074225bf5b9ea3820890876bfdf4ed161adbfaf94b2b4b5984c85ee5d958  rust-std-1.99.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.99.1-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  1dd241eaeb19ff3b5180461c77bdee93d6cafc669eda9de834e7c06b0ec3ca95  rust-std-1.99.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  a21f6a21818df07c1e2e7addb570af5444b3fa9dd61e3a207f4fb1c5a5e665c9  rust-1.100.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  29c0decdfc968fd7c1af685cb62079a8698001877c632977c93ff23e5b495cf6  rust-1.100.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  2c18f53914257c0ce7066dce604c36c386919bdc25b2cd00a2d6a960a68de54e  rust-1.100.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  4f40a245c6dba12c9e45988bec21a5b52a8bdd24ef70aa669a66c1abe210c98d  rust-1.100.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  5a60c6cb80093f7c256b70646cda6e0737f062474505a7005fdb2b249537037f  rust-1.100.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  cbcc053956a03238ba713be688d52a1fe3fb871a5346bb49d7834a7650a0db52  rust-1.100.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  dcccdbe0c6d440bf69b8f5ed8e4e280dee93295a865974267269ab44c5b16ccf  rust-1.100.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.100.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  98ee6bec240e1cfe944f17e7092412dc5ef6e008484bb668c6936d35a7d15acd  rust-1.100.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  c73f62fbe5d837f9807ed9e0076575dd8d3475c79af2b30e3570d328e6713f8f  rust-std-1.100.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  30eceb11cecdb0f4374c6c6e9b193a195949e7ae2687840ffdd3daa637c06db2  rust-std-1.100.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  45349750ec9cd270a3439b8a399415da52aea38857d2f9cfeeb7ce09d66fa2cd  rust-std-1.100.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  98ebc712069fe7e43f010c6a1cdb31b4378d3501677ad394bcd7ba23ae0954d8  rust-std-1.100.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  dc356e58416be7ad1d4a81d1cffdf1b7329df43a2184f7d0b7c2a2dc2813b9d1  rust-std-1.100.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  590ceb82fdc4d494966cb8c624f288b96e42b5eb0cae34cd0b2275d283b07500  rust-std-1.100.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  ca16d912819a482c51b5bf6976b98a3c0f777196d83faf94d1c6f552e3129c06  rust-std-1.100.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  497603a9103261f5146b70d060bccfa462489b3d03f3cdd1cbed50c9c7b1f0e3  rust-std-1.100.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  928452d5685f77e8eb8254b201795a25f3508666819625f19a068a27101b964d  rust-std-1.100.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  35c61141cf4b7fa14078d81ec5fc47cb1908b44ffda926a1a9b512d05fadc431  rust-std-1.100.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  3dcf80d91adc9cbe64ec959fd89a7d9ef722d68158396f632077242d94f94a31  rust-std-1.100.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  43b67e7d2d43f5097eb853b97718d1eae8836b66b1403ba95346093bc857f40b  rust-std-1.100.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  26167c107e1725c7b4a0cd5f63aa904b22b71edf57f7f21767c4d586dac6792e  rust-std-1.100.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  d578d420c98a74eae576bd510c2b28452537c0d95ecdd1f1170929b84aa83888  rust-std-1.100.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  c0194f57d890d8bd11a3d70909c55f7b31541d89bc76b7c43f84b3d1db2dadab  rust-std-1.100.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  a16300512336fb6739b75d4e09fae8f31ac339df2f9e3d9ba5200b14be0c8cac  rust-std-1.100.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  a3d498aef6b9dff8e807ee8accc43f5488026e9dccd05e08026f19ee60e891ef  rust-std-1.100.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  2d1ed57a8831d4f3999251d51284b08366586e7c2ce42bb170c95a58e350e932  rust-std-1.100.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  97f5a6a4c18c68cbb1dbc8dd5796531646187be7dbc951b38ce6d0fd97e24226  rust-std-1.100.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  16cec9f627c90653554121dcbff860f43144a5767afc8872697b4d56c65c9065  rust-std-1.100.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  f510a54290a429464e33330758c5f6b34260a82d8eb07bccc0afdc04ca5deb13  rust-std-1.100.0-riscv64gc-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  dcfdbdad5f29356b324cf78ddd0ddbdb59a79d5651fae62cf6599a26aae20fd4  rust-std-1.100.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  b39327246202a01b8b3fb7f28ffc58395cba10671a30e41d67af3ffd0b6b2e5d  rust-std-1.100.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  4591b6486594ded52ecd6135db95bf9355bbd3ca7a380888b141528bbcf9a5d4  rust-std-1.100.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.100.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  9d5211bc7b40195f9700a6f9133831832a32f50d0e2a2c0ae8af801e7656de5c  rust-std-1.100.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index dd6f031d1b..3969523f12 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.99.1
+RUST_BIN_VERSION = 1.100.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 7f50507e1b..740f101e7e 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.99.1-src.tar.xz.sha256
-sha256  6451598a99e77f07571960f6b21d577399d3a30f33e80cbd2e3a4aae6535d265  rustc-1.99.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.100.0-src.tar.xz.sha256
+sha256  90dab90b8084eb57c35ae2b1d0b70c8e5138ace6023b22c60a5a400f586f63b2  rustc-1.100.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 6a9a409058..36c5141b52 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.99.1
+RUST_VERSION = 1.100.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
