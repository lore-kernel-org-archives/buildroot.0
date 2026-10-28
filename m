Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3F606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lS9fINwP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=jI8busMY
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4671E80AA2;
	Wed, 28 Oct 2026 13:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLWQFCS81kjf; Wed, 28 Oct 2026 13:04:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 15E8180AA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793192667;
	b=q+XQiTMMSBOUi3IKF1U5rFQefsBlM9cpD6TqlO2BSZctsp7YJGabkqYZYAk/gzVAoH8s
	 VQGDddE0hv63koBVnG1EJJTfxzDzU5Se4WhNl9KhAviXB/ywdJqQ185sbjiyedEEbRvDE
	 ezx15uh5dzz4jf4d9VqLWHK7Kkss7L+8VV/CWurHPbU4cAWk+E+NqGE+Q5Is7OeVEyXb+
	 7Ayxiau1jx8fMVKY8/FWyWNOaKFqO5jrvBBR0dk2h9zgkB09Ew1GWkADipM+3HpUc7eGq
	 AsdpfU8+8iozpostfyK5vzpooXcUCcwBo9k5qkzDdk/MRRz++rTrKp8FuQYjNDRMEAg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793192667;
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
	bh=1Qls6TuFqPslcb0zWJvuSzHQnHnUxMhoD7AyzPDRQ08=;
	b=Tcz9zrUcL8M20Fc7QbKbS0hO19ZuYs6201/RL5UzY4s9OGy5clR5v0gKCr/hApEvinpb
	 LwAjafSwSJxDMLF9Rvk2rPp4h77IJtPQs/jRRGl145eBykAF4TSkB5m2lopxT4xfkNLn6
	 xfkZVd4kxQYvVNiDTGbUJaWmF+4mcmamPt1NtK/3+pi0UgMNqYPZFMTctEMoBcYFkj9lA
	 PvjGZllLaelijjgL7yzxZilea6qxk1MVDod9D4v4akvuyqyMkYqlgoMOjIZCA/OZ7HuNl
	 0zgzM/EZBamuqMPor2xUqVfyecjs2tGcX8fc0t4HOlrUS3mi5flWZwmkvsLU5Gs4mug==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793192667;
	bh=1Qls6TuFqPslcb0zWJvuSzHQnHnUxMhoD7AyzPDRQ08=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lS9fINwP0yFF8bHDb/4MDomlKym10uw8AxcuJ+66S3OC8x0CtdQvN7EVZoR8xb9it
	 +/ygvQDooCqSLgUHiaB228RkYmcLBZOk1Bphpw0E59L5Bz92YTL5fvFKyUYqSy/z6U
	 D14eR9Yv1R/rCqbm9IIks8la4GkCa6WYjRj8gqQCbeFpyduRvow4NvQitHX7Pm00Ur
	 8I006cNP0B1v3WAV6gcQJom2DN0S3OUpEPqTcmEfw8yIkVvkFbQI5DW9vyd/7beQpv
	 aDWcuQ+97mH0LGzQp+Az2L0A2sVdUOwsoZjTmq4ARuZ6qWhFlgrNnNddkRj8bYg1EM
	 EgTv4mOeeryfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E8180AA6;
	Wed, 28 Oct 2026 13:04:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFCF82AC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 13:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 957B7605F1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 13:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Om1G5QUDmReZ for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 13:04:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 12F00605E5
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::606"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793192664;
 b=klAbRj3QGSluT/1SZlUptShn9SqCkANsheyIQBEB4tNLgNBkxDsT8glrx7JYWjnFFp3t
 ymXm4vTaYzrUGck3pzUkn3WS5InIroBabUkQKPEiJKhs9pr60qifacqQvwk/xc7nSBvVu
 12WA8CJbpRxPynX/Gr1oA595hSdhU7aIzOx2bSn9+8NKi3N2M7BFyBYiO3A69r17zDwiV
 COdvZTsOOlvPr83N9n7dwXmL2BpU7mLX2igjq4NUST52W4sGYTl2OlqXA7ypFjs7depXH
 EjysR2cDj+xogWlhlEDLfNSdZJIsNiOu8V+e5zV3WeLZF8crIeCZjsivCPBA/4HaJQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793192664;
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
 bh=V5/DoJPJIAM7WjUNmtoJPJf6DB02YkTlo1QWTKTnKAE=;
 b=W5FlCpwr6CpWhJavzqy8be1ROkooAMdBaH7mktjxF+eDEE1TZs6UGLLUBOIw5CCf2D5D
 ViOL7RAI2O/pZvNhMJ9IdPwXjnM8TPZuxUxfEXIQ+PdRT0/1K/jszOOZWeJqV8ti99qkP
 1CxJO7Ky38gPk9sig1Ph29PgwuNBJQsTkUQdK6YA2EL3E/CctVk+1DMPfFhPwDWLm5P5Q
 s4qqAVuv5pSOghzZQDbM4oFi3icKv5qHPsdBXm4+mU8KnwSST46KRr+J+n/NJvQWxEwkj
 BzVCT+vPxAVSw2zHv2kRfSR2xE6ZMJ7XnmRhQf3mwb9ufO2oULGbiBdJtRIKHQEFBRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=jI8busMY; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:d::606"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::606;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=jI8busMY
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0606.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::606])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12F00605E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 13:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=KA1bBHjMe7XCskD7Xa1v5z88OKLIPApzrWCArVLn+b55dCnweOBpGCpPpGVTRofjVVCEEp2Uv8Hfd0D/thy4HWgXQYDYuWhboTT2xTgB7pAHywwNEdtcEdMy5uxPglXpdYsr5OupW82OodJXlXfVhqwj8ygZ1KaB7XUwMNZ7XsdJYUD8YB8uO0UO8cJpeHHVYAG8Z7+aDsxd/cmmc5gI+2Io87Qk0Tb9ELcWb+tOzKwzlD9klxq7R/AOnW/A9onA1EEEUkiB/tcALKsVplSQihn0jzCnEirpLzLLXBySDscqTSjIY6G+wLOTmW0Wdlr0Cdu1WGVhIQt8z81WL28GlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5/DoJPJIAM7WjUNmtoJPJf6DB02YkTlo1QWTKTnKAE=;
 b=g4Gll0O9qw8OFAw78e31y2qITr8YjJAVxPAep05QZnHenMuNPVK95/iLOorWcWitLUmkPqRuB7xbzIm76f69zn0JpyUU19JzsoITjBAi+nXFAkSNNn50lS3NYeOVyfRk1vFI2vlZbLTNydal6mzQXjU6OXmCtZfh09ipyFyTAntcAJpEunm84CFgr5U1zJePVScuICTH2250UVS6GSUi0JqzcGfq0Gn8gq5TNJyaNLeKaj3hckZqvFKURnssC91Gr43y+qSYvrhc0WSvczuZ5ek55skzbuKIXMM0L+9dswrOFEOl9cDBgmNmgpw6vEADxoyKKbFn2WzFgJ9KtskiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5/DoJPJIAM7WjUNmtoJPJf6DB02YkTlo1QWTKTnKAE=;
 b=jI8busMYE6Qe5PdjEh6m1CEn7pxTV0jvl/INP0swreTYvtXLw5v7PZcbkh9eh/KQyMlIH6IkUWZtv6+4ypM+BGAEgKlz4jZxgORCE5cYczoNNJmKlZB3FfXwhT+gH1bh+RlGLVMpV/ov0D055DdmTgtbRuYpl9iwJt2VtnVnBF/1n9d+u9ztURLz620kCaNnjA0EBMEPtt2YZaaR9b2B4Js7bnb5yEmzCRPD2d6FWsT2SQ2auUpERN8A3N0qK/gd4fReeeYnS0DytFlLGjjd1om2Cub9EbhZb3cPGXP/xTz8tLOEIEia6/B5/2nImsB0kD2AVpCqoXsFe5sFUCmG8A==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB1274.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:181::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:04:18 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:04:17 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: James Hilliard <james.hilliard1@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 2/2] package/mupdf, python-pymupdf: bump
 to versions 1.28.5 and 1.28.2
Thread-Index: AQHdZtzWdzsB/Owv6Ei1OAisKDqdrg==
Date: Wed, 28 Oct 2026 13:04:17 +0000
Message-ID: <PH1P110MB1603E1DEDF7E2669F93110409F6FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20261005154047.413898-1-raphael.melotte@mind.be>
 <20261005154047.413898-2-raphael.melotte@mind.be>
In-Reply-To: <20261005154047.413898-2-raphael.melotte@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB1274:EE_
x-ms-office365-filtering-correlation-id: fbde1ed9-3e68-45c8-4c5b-08df34f3f96a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|41320700013|261026140227099003|38070700021|4143699003|56012099006|261026121527099003|261022075727099003|261022115727099003|261022105027099003|10067099003|22082099003|55112099003|18002099003;
x-microsoft-antispam-message-info: uq5zPTG+Vg/NFlgsH7qbhIIXLK0j3wddFmvDiADHC/xTuNTUsFcs+tYhnCmOl0INbIlyj+Yq2UpB9/70ioA0fIR5g7NUOnJ8dy1H2PzHTxOYvdCyGo8qPxFppmFL4xo2i7AIk5jROo3oSEwLtHmsBhxLfpiN9he+cxfiq9f+XjVO3IV/1LDGjCeTKZYm0KXskyMwhP7WN5kkbb/Q//AhjQSV/OTH+QlPd/TqttVFRTljHsBjqUzSuaDSCOcJLHCzjH08d0RGBeN7327KmZS+4+03DMWZ7WwjOYvYR+sSspDK443KpBy8TEQiiNsCbu3IlIkUkBPxFoMrS3nwrIaK3WrltE9mtI6/cTOe3hGA1HXvKEbSqIxgyt88F8Kr3GFNIYpFQs35qieEmAEqJ5KfO75D5VEryXycHuqv24Kn1AxcIW2X+ys9XtsDHLtatwaFDELMdImPsPMjyqS3r0zPJAlneJD1J+iURlFGNZ2zi9yX3ggOz4k7wz1+cJfJPtGEPAvEpKl/MkEyDzSZwvxylXjQkTZEScsXujhRTEl7DoAyreQqf16V5LLF8GGZF5fYISbjoRKYgz87ZCPKNcLu5klTxnj+YKO0gZXUCiwme43u1ElhQ8joce7pGCb91WrswGaKLQJhCSCbA7OaI0+WNwEDSHaW0ycOp+5Eh+qWi2k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(41320700013)(261026140227099003)(38070700021)(4143699003)(56012099006)(261026121527099003)(261022075727099003)(261022115727099003)(261022105027099003)(10067099003)(22082099003)(55112099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?di9pRWpsRFAyNjNtZlBWSzZCNS8wRWtweVpmZDE1c1dtNVl4cSt1VmRVd1hR?=
 =?utf-8?B?Q0hsUDFKNkJXY3gxdFpBNGZRZnZhZmVQanlmZ0ZBNFdoSENDOVVBUHdDbm5m?=
 =?utf-8?B?akxQUkZzKzV4WkZUYnFlcXlxUGkvY1pyRDAxd3FxU0xxZXhHRHZ5amV1aVgr?=
 =?utf-8?B?WWNWdjZYM0JCSUJoaWMrL0ZQRktmMmVzK24yVzMvQTVVUDdWVzl0Yk83OUxL?=
 =?utf-8?B?MDJXdUZTdVN5cDhiR3h0YVhsckVMKzVIUXlvR2pmZXUrdW9IRXJLbXRUbkdv?=
 =?utf-8?B?YmR5STlwQ3VUdGs0akVmNTF3UCsxNW9ib2Z4ZXJIcjFkdFRpSjQ3OFFGeWdW?=
 =?utf-8?B?U3V0bHFSa0tXdzlrbkZXMTEvdWQyZGMwZ0V2VVpZcVd5S1BpVm5KdHRldDhS?=
 =?utf-8?B?bkN1bXZ1b0JPWVlLNXFpWW1FV0IvNGkzZUhsWUVQS1l1MnFPa2p3UGNqUWNQ?=
 =?utf-8?B?TzJLODkwM0xKbUlsZmNCK3orS2RaRVJmMzVRMTl6ejVRbnhFZjZJWUYxaUY4?=
 =?utf-8?B?TXBBRXBxajBidjhvK245SGJwYUZZNUNTVjEwaVNnSkR3azd0a2JUcG9yNERG?=
 =?utf-8?B?c3pHbGVrbVJ3RERCUWxaSVo4bjBFL09nb1FoMkNUenB0MWEwekNQUXphU3Ax?=
 =?utf-8?B?c2x1TE5Qd0gzNHFhdGNidXJIa1lzbkN5RURGb3A3UzZqRmIwUUJ2cVhTWnhL?=
 =?utf-8?B?dmF6QTY3SzVQUmVBWFZLUWFnNDVhM3dzOEwwazVBbTVWNjlScWwyeHZBNWxG?=
 =?utf-8?B?SkpoYjk5MlZ4Yk5xSHV2OEV1L3VTR3VNQTdjQXo5ZS9pRHA1VzhNYzVpcXFz?=
 =?utf-8?B?K2lRcE5GbUQvMFd1MEMxQzRrSUYyZ2lvSkRxZlcwQ2FtVTc4WlVwUW5FTTRs?=
 =?utf-8?B?UmJ0WERUbmprMUJaQWJBVkxQeEUzMWhVYk1rRENXZkF0cGJjekNaWEt3TTRQ?=
 =?utf-8?B?ay8yM0VNbWdGV1UyOThYaGVhdHpHSzhlUkN0Ritzczh1bVZEYUg5NmNYMVIv?=
 =?utf-8?B?QUFCckpQQ1E0ZEFvMGoraDV2MkpmTWNTWFNObUFnenJjYTBhN2lBODgrSEpk?=
 =?utf-8?B?TUtsVzBZTkowcy9HaDNtNmFlbGY1VTdGT2hmYjhpdDVpY0ZSOUVEUkw3NkF0?=
 =?utf-8?B?YW9WK0djUEUyaWs1OFZUcTMzNWgvMmxxTnVzNTJSWmJwTHRHamU5M0x1NGVJ?=
 =?utf-8?B?N21PYi9sTGZDQVJOUGZWdEl0MWlodGF3Uzd0Y0NnUzBxOUlaVkUreUo2Nnl1?=
 =?utf-8?B?VXJJRWxQbGM4ZEJjQmk5VTdsWGxNYklyOEJ0MWYrZmFQbFNhWjhmM2xqUUsy?=
 =?utf-8?B?cmJ5S0xlNnNlZnR6U2RNNUdndVpFdTZBMXlNQ0JoTGFaRXJKa2duN2I5VEVL?=
 =?utf-8?B?V0p6WGxxOWhYOTNmSEFySHhSLzVsZDNsWDErRGVMcE1oa1d0VGJteHhJRXJu?=
 =?utf-8?B?SHZvSkpjSmxuZHVkVGNxYi9PYVlxeFhNa29ZVHZXaGE4UVBLL0VjYUJBSWtu?=
 =?utf-8?B?TytUSGFmTnBYK0s3ZnVyaFlKMUpraFd6cGIvUzh6Tmt1aHhudTZGbXFFK0w4?=
 =?utf-8?B?Q1M3MWZyL2J3L0xDUCs1Sk0wWFlLeS9SN3NXV0UzYXVrZnpmMEVqM3NCbHpq?=
 =?utf-8?B?QTVvTUxEV1JaSEJzSWVOUTZPOWJnem1JUTdXazN2NDBlZ2F6Q3NTeVN5a1A0?=
 =?utf-8?B?K0JZSnNRWVFCV1ZjVXhHTlJydkZJRTV0MnlxWTFCUG5HcVpXdDRodCtEV2E3?=
 =?utf-8?B?WWtJN1NOTFRvanlUNzh6MFJ1Tmo0ZHBzZU05TlhjWjJpbE9nQ2s5YnduZks5?=
 =?utf-8?B?OTZTbkhZRGlQN09nL25HYzJCTDV3LzNLYzc5eVc5M21MMFJ1ZEFxK0M1VFRu?=
 =?utf-8?B?SWs0YXZKSWE3ZmJTbmRqcE5uZDRJeVZXU1lmdnE3Q1JISHNVWDRvYkw0YjJM?=
 =?utf-8?B?Q3NYek1TTjNjbGMzQmxVT01EcFlRdmJ2b0oweHpXdjBCU2xlYVdXVTRzcGV3?=
 =?utf-8?B?eDdIcG9lckNjNmFOTzFVUVJiZ3YrTHdtZEdIYVJZM0hiS3BJZE5POGJDZUkz?=
 =?utf-8?B?OWduWTdxRHBMZWMxMU8yZ2hkNWxqZmhHRzlvOFp5d2w5b1lkYm95NUNaY3RW?=
 =?utf-8?B?SllDRFM2ZlhDL2hBNFJ3bTNhSEdIdDFIaklhNkQxY2RXOTBjdnEvRm9nbHFB?=
 =?utf-8?Q?WNzgRRhdhc0oP4bq9vXZXC9saDnEcy/LmMDOfYeQobr3?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fbde1ed9-3e68-45c8-4c5b-08df34f3f96a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 13:04:17.5540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1274
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_SPF_HELO,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UmFwaGHDq2wsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBidWls
ZHJvb3QgPGJ1aWxkcm9vdC1ib3VuY2VzQGJ1aWxkcm9vdC5vcmc+IE9uIEJlaGFsZiBPZiBSYXBo
YcOrbA0KPiBNw6lsb3R0ZSB2aWEgYnVpbGRyb290DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciA1
LCAyMDI2IDEwOjQxIEFNDQo+IFRvOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiBDYzogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+OyBSYXBoYcOrbCBNw6lsb3R0
ZQ0KPiA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+DQo+IFN1YmplY3Q6IFtFeHRlcm5hbF0gLSBb
QnVpbGRyb290XSBbUEFUQ0ggdjIgMi8yXSBwYWNrYWdlL211cGRmLCBweXRob24tDQo+IHB5bXVw
ZGY6IGJ1bXAgdG8gdmVyc2lvbnMgMS4yOC41IGFuZCAxLjI4LjINCj4gDQo+IFJlbGVhc2Ugbm90
ZXM6DQo+IGh0dHBzOi8vbXVwZGYuY29tL3JlbGVhc2VzDQo+IGh0dHBzOi8vcHltdXBkZi5yZWFk
dGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhbmdlcy5odG1sDQoNCkkgc2F3IHRoYXQgMi4wIHdhcyBy
ZWxlYXNlZCByZWNlbnRseSBhbmQgSSB3b25kZXIgaWYgdGhhdCdzIGEgYmV0dGVyIG9wdGlvbiBm
b3IgbWFzdGVyPw0KDQpJIGFzayBiZWNhdXNlIHdlJ3JlIGxvb2tpbmcgYXQgUHl0aG9uIDMuMTUg
c3VwcG9ydCBpbiBCdWlsZHJvb3QgYW5kIGl0IGxvb2tzIGxpa2UgUHlNdVBERiBhZGRlZCBzdXBw
b3J0IGluIDIuMCAoYnVpbGRyb290cyBweW11cGRmIHRlc3RzIGZhaWwgb24gMy4xNSBkdWUgdG8g
YnVpbGQgaXNzdWVzKS4NCg0KR2l2ZW4gdGhlIG1ham9yIHZlcnNpb24gbnVtYmVyIGNoYW5nZSwg
SSBpbWFnaW5lIGNvbXBhdGliaWxpdHkgbWF5IGJlIGJyb2tlbiBidXQgaXQgbWF5IGJlIGlkZWFs
IGZvciBpbmNsdXNpb24gaW4gbWFzdGVyIHdpdGggc2VjdXJpdHkgZml4ZXMgcG9ydGVkIHRvIExU
UyBicmFuY2hlcz8NCg0KRG8gbWFpbnRhaW5lcnMgaGF2ZSB0aG91Z2h0cz8NCg0KLVZpbmNlbnQN
Cg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
