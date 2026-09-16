Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77B9C88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 11:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8036B80E2E;
	Wed, 16 Sep 2026 11:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USOTtIryYV7t; Wed, 16 Sep 2026 11:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 972AD80E1E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789559585;
	b=p5APe9Wpm1mo9RkytmazhgkTg/TduU1w3/02eLehONCnFwRt2RPTveEOLO25fRTt4bE0
	 Knu7QbgnQTWI9FL3wC/vN+ZMP4Ox3r9lBr0Nqzf6hMLezV+bE9JABtrnKdYBr9qzOlllh
	 uCFlvoKQO8Ms+CXpGS5R+jAK7etx7IQ0lW5uZ0UcZ5xyHNvSuf/liooGCOSURtWh0mL/o
	 1hlt9+W8h97SE6dHl8npdUIGfaazkyRpVIQZNdxX34WafvQxHBHUL0G2jESTq4oKZrOg/
	 aoglmQHP0DrS79xKMQSJKWuAH+UoO3mFty2Zt7GoJkg1g8AVYSNSVX5YXUMbb2OGksA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789559585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-forefront-antispam-report:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jvSZOpVrM5iT2frJXgQ30pgJSKmncKnLbYYRViYuhWI=;
	b=DXT2HsNeSJwJ2mH20rGAJzZvKXRmKREIISdVNXGKoVrL9m/G84WdzgcnXKhRnP/5vuP6
	 S3GQp3YvEV1Aoxjev7iKlPS2BoJ/6PMhQdT54BCzRGmAgxCp+tpbkSU679jMqR5dechTY
	 g2c/LYF+VIJSEcrkc8WcL09jusKiFwhzCz5r80G78l2oxPGbKnBwHmrasKKEYcypd2xYj
	 guwqyZWzItyg+Zb5o4CWYslH3o2jFy8HAIkzfQNE7houoYy3u0rsUwrTmciMXGWjN8bRK
	 FZX5Mij6J7NjoDNZj7IBTf0Njv334/yizvONl5XjFGmvBALgY7wXnQ8pl8hqEXhRJ+Q==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=xes-inc.com;
	dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=QisjFgqf;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789559585;
	bh=jvSZOpVrM5iT2frJXgQ30pgJSKmncKnLbYYRViYuhWI=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwFEMeQ0lG5SyJ77v2xieAeWBqPxnWFwLapIYOxSF560eD9BbfLMkHMXu4lSyjdJD
	 /K5f4t/FqYJ3TE3ZZtqkdgJRrenqIGWjJe89dLFYFML4KXeKBLr5Ka0wmzon+r88jP
	 VDXKqm/aTBpg+rIrj4jgHdJoc3YHnh1UJius/CYZ5Il5vxMpZVGej6m7v7O/OOGD4e
	 u848sOtRncDjn60MVwvCSTfCM3Aipq/e/BYiZtloDw6d4B1P/3FzeFdIQ8HGFtQX0G
	 K1X65ZH8BN/iNLuXTkRvP9Szrj9pzgokQZhD0QBR0Y3hnMbYfF2DIinUXKqHKyaWVj
	 fdoQMB4fnugmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 972AD80E1E;
	Wed, 16 Sep 2026 11:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95EE829B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8724480E1E
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfRGDg4VpdSZ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 11:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1171780E1D
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::60f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789559582;
 b=NhyYrghtwPK8eh2yG5jdh5Nb1qPJdRQy1cFkoBDJF0OJtBUHv3WIIpPdwlOUt9Io8B61
 XeL0xfJlbOD2Hy/rgk5B6fOMLOTHWlseTs45zBvlYQm4u60T/adDyfMLlIb1Q9Kmd7zy8
 9cZiT6XnDwwmfwenTnBU61X98KKBhkXEMaN7mJBcwNW8+NIaiLUA1f92AO4Jvubjy24bQ
 RITpsjNWII8gp9xuW5Rsck5Oor5w1yKDRdADbSQIa2Caq0cTrIpiFfBcTUv3oYJvLXfB6
 pZzbwKYTkxXFmjbgZ0osGSPKGI2DjXEgYPf/ynKbdNszyTiAER+CDEHVXpCCrnYUzKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789559582;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-forefront-antispam-report:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=an6sAbVhz6lQbZAg+nBDEa5t4XKN5d0cwnzHTqQuCp0=;
 b=D5rtsw6aQuQBpxdgLeUt7fOfPZn6TVPLuNNXEXZQPLKoIz8+YBI4FIVVjADKwYy/b1mX
 s4/jwWrasSnNp7hpQke5VWeOOATecLzs53rdeyDDvGQDDcIRJBJ/AQrR5lWPRx5RI7Htr
 mKHoe93egYmxK5iyT5qtUCwAa8wFuVmfmaFLtutVWHySYARhLET2Umglm0e0lHXLsYB7n
 OyIZ57dl/GLL288/QPxZdoocQB0mgA6uaGzM06EjgQsnS56c+HdgpV7mcTPSLD7LkGdy8
 DXzzSmUs1G3Sf5WDwP8jx+7js7YPvHcoVIg3eaOigfvTpbOVwTWp9SA36iZH4TzVjrQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=xes-inc.com; 
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=QisjFgqf; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:c::60f"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::60f;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=QisjFgqf
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on060f.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::60f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1171780E1D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=OdbC4b4El41oZlZLsCSF1ZONn0efL7Ymp5+TmCtFnH82pbrooVPdmx1akRQKypJBJkZPOxQTnGgSgbCd97x4WntonIKS0diVoFAAOUV/L9Q/Hcpl1RE8vqMxNXcnj7IF5EOmZ0CRapna3AoZ78Wkun3VQXhrG8daiUjbfIrRzvWDlBPyMOly47aYYeNIjoFBfy1ycRVh4hMbwgA+3XQ1y1oTLihpEc0d0tfd20EBHixrgeri7a4TtRUm5PmYjciRmAnW4rWJBkkLYIs68ZnmzofaYlw3S074bq5NAjL+sWBkU6H4wf9rE0HOGZ27mPFhVJxVmhwUHSOOt0QCiHo8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an6sAbVhz6lQbZAg+nBDEa5t4XKN5d0cwnzHTqQuCp0=;
 b=TqbT/3OW3da6WgyBIdG5r7jd3UuW2xF7lc54GkhukKxCBRg4SrTjF8EW3HX9GzKyBf/547mvfa3837RJaAiNwEvrF6m9lGb0nm38Zducq4ADZx1rO05QowmkvDeK/VlEDilcLggHGDG3as85nZMcje0EyH/fBfrdFTQ2nlfe6pTkKYQ9SDavGlO0mP1UDHfhnr0nVCbm1UM/bD1HSevBJCntiupVPVwKafxhXQwxeCh3TRZKyzUt97XaO9s6L02o/MaCXBXP3pLt47ZLJKCzgNS8jlW/SYtI96bvKFqUohIJyQaDoUJCYMBgSWO100hZSZxd24fUxurYgvXYmvnYXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=an6sAbVhz6lQbZAg+nBDEa5t4XKN5d0cwnzHTqQuCp0=;
 b=QisjFgqfX3tlI0PMS7r3iD66fWdzhyt89Jm7tyseQegSl+cJ8+FC8nh0Fu6wo2dA85v/np/iNkskv0sKpkC6ka9+SLzw+JlQDtbNUo5kBQbnTxnlH761q88V5Ayo7hhVBM/O9hKEHP0R9HyJzMffqHBo/rJik8EAfKZrWvUfK5M5nJj9U8Ye4th3AQkkBaO76ZaZgb8gfmPpmyn/icusOoiKkvb3KD+tyVc0fdXKmvExZEK01cqiUt8MZAbpLTbJ8VNvi9+N9X9Hemr1OIAjuExcxCFawmoZufJu80MO0oZw0cR2dIrLtkXugSP6ZIZwP2RmocV8gpdaURDm8p2mww==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB0951.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 11:52:56 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 11:52:55 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: "yann.morin@orange.com" <yann.morin@orange.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 2/2]
 support/scripts/size-stats: properly assign pre-compiled .pyc files
Thread-Index: AQHdL+DeAboouUzIYEak6xY7PtCvTLbN9soAgAAqoACAAyD3oA==
Date: Wed, 16 Sep 2026 11:52:55 +0000
Message-ID: <PH1P110MB1603648D078747954B2835C89FB9A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1786368449.git.yann.morin@orange.com>
 <c45315df9f1084fe0f6f932e1523cfa9c4e6d992.1786368449.git.yann.morin@orange.com>
 <PH1P110MB16031631D241E9E2C84C0CF49FA5A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <aqe-BvOFrZnDF1YR@yd-6wlzhs3> <aqfhyLQh3MXmcRSB@yd-6wlzhs3>
In-Reply-To: <aqfhyLQh3MXmcRSB@yd-6wlzhs3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB0951:EE_
x-ms-office365-filtering-correlation-id: 6b3e5873-ef9d-4677-5ffd-08df13e90bee
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|41320700013|366016|10067099003|4143699003|55112099003|22082099003|18002099003|56012099006|38070700021;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(41320700013)(366016)(10067099003)(4143699003)(55112099003)(22082099003)(18002099003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3e5873-ef9d-4677-5ffd-08df13e90bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 11:52:55.8042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB0951
Subject: Re: [Buildroot] [External] - Re: [PATCH 2/2]
 support/scripts/size-stats: properly assign pre-compiled .pyc files
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGJ1aWxkcm9v
dCA8YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9yZz4gT24gQmVoYWxmIE9mDQo+IHlhbm4u
bW9yaW5Ab3JhbmdlLmNvbQ0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNCwgMjAyNiA3OjAw
IEFNDQo+IFRvOiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+DQo+IENjOiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZw0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gUmU6IFtCdWlsZHJv
b3RdIFtQQVRDSCAyLzJdIHN1cHBvcnQvc2NyaXB0cy9zaXplLXN0YXRzOg0KPiBwcm9wZXJseSBh
c3NpZ24gcHJlLWNvbXBpbGVkIC5weWMgZmlsZXMNCj4gDQo+IFZpbmNlbnQsIEFsbCwNCj4gDQo+
IE9uIDIwMjYtMDktMTQgMTE6MjcgKzAyMDAsIE1PUklOIFlhbm4gSU5OT1YvSVQtUyBzcGFrZSB0
aHVzbHk6DQo+IA0KPiBTbywgdGhhdCdzIHdoYXQgSSdtIGdvaW5nIHRvIGdvIHdpdGgsIHVzaW5n
IGNhY2hlX2Zyb21fc291cmNlKCksIHJhdGhlcg0KPiB0aGFuIHdpdGggbXkgb3Blbi1jb2Rpbmcg
dGhlIHNwbGl0LiBUaGFua3MgZm9yIHRoZSBoaW50ISDwn5GNDQo+IA0KPiBIb3dldmVyLCBJIGhh
dmUgbm90IHNlZW4gYSB3YXkgdG8gY29udmVydCBmcm9tIGEgc291cmNlIGZpbGUgcGF0aCB0byBh
bg0KPiAqb3B0aW1pc2VkKiBwcmVjb21waWxlZCBweWMgZmlsZS4gDQoNCg0KYGNhY2hlX2Zyb21f
c291cmNlYCBzaG91bGQgZG8gdGhpczoNCg0KYGBgDQppbXBvcnQgaW1wb3J0bGliLnV0aWwNCmlt
cG9ydGxpYi51dGlsLmNhY2hlX2Zyb21fc291cmNlKCIvYS9iL2MvZC5weSIpDQonL2EvYi9jL19f
cHljYWNoZV9fL2QuY3B5dGhvbi0zMTQucHljJw0KaW1wb3J0bGliLnV0aWwuY2FjaGVfZnJvbV9z
b3VyY2UoIi9hL2IvYy9kLnB5Iiwgb3B0aW1pemF0aW9uPTEpDQonL2EvYi9jL19fcHljYWNoZV9f
L2QuY3B5dGhvbi0zMTQub3B0LTEucHljJw0KaW1wb3J0bGliLnV0aWwuY2FjaGVfZnJvbV9zb3Vy
Y2UoIi9hL2IvYy9kLnB5Iiwgb3B0aW1pemF0aW9uPTIpDQonL2EvYi9jL19fcHljYWNoZV9fL2Qu
Y3B5dGhvbi0zMTQub3B0LTIucHljJw0KYGBgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
