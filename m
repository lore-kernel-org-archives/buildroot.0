Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48360A260C
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 21:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qq5FDMQX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=s9U4d5BE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D3660E1B;
	Thu, 19 Nov 2026 21:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4o-spD2kHrK; Thu, 19 Nov 2026 21:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0F4B560E1C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795125551;
	b=ZsDRdniigab0gU//lq4Rn3Iduq1+DSrvuaICAwXMYQRex/FmOuvn9hs+OfPRPhOHAwfh
	 TN8mIjDNTyqXrUdvoTif50IVazbsXhlk8eVBlnTxLPTajd9/A/Cm4iUmnuAicQ8QCeOJU
	 AkrwMvHEkkWJ0AgB79c5UqhXFhp1OqAp1KwHslde9xCDF3nJK84Xs0r/zH6FXUG9YpDli
	 Iuz29c+Fi3bmqFNIBB/xfzUneI14j2UTUyXNzsYDwrqwGFVBmH3vs25hrfikOM/r6ozjO
	 JKreLgvge/lOkmUM7mrd+iGd2saYbXjt7mPmn9suw9+BvcUSPcIR8zd1u2F4LhYhwjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795125551;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Errors-To:Sender;
	bh=1ITuBsrv8kK8tuMgR6o78h9/DJE5YpnZ+Mq9ekdRpZI=;
	b=Dfr2IJ02R02DrDvQqMhz7Mo8iQMMPfPXiv0RX3Rw4YpmsJ/S3rzCHZt7rsyil6Qa3wig
	 NGo+5N0RATOHeq3NhS5anK5oZ7PF6E8X1TAoeaXj8U/ROouC1NF2WttAtty+q6qtcN+by
	 3Ne6gjaAX3xiZfk2YCEGyAQXg01k0ZeHJPWFbAMpQSj15nit/1Z5aNsly5T5UlJZmJWYl
	 DGxHaVZYmeu/Z3oj+WYufAYKLk2zHIPMhKn4ZJ+CgxV8e9ysX4+8Ue7iJxsIiTYVF1myO
	 srtRbh7KZ8UrGBrZlHSWCCmEcC8USYmc+xXLRo8clVavkg+xuus+DbsYpV/LKIAfqcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795125551;
	bh=1ITuBsrv8kK8tuMgR6o78h9/DJE5YpnZ+Mq9ekdRpZI=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qq5FDMQXFUk+gRVEPyW8iB6oTraVeyTkytsU3F+21O2yiblssBDLm6XHkrZJMARKF
	 B3PLQSSBCaEci3JYF2okzT3vvLx6wutnVWogP1aRsoHasd9ckfIwtdBZH2Wy0hm4F5
	 BEHNDjRQVwgU9EJAqQYf4D8K6zKlK1dGmKGm9z6J3+diihj1a1yMtX0JrCiXKwr/Ua
	 DWGsaQ1Q46qjaFMfFmC+Stx9IiJ+grt4sws5kMUzdlpx5JRehrODjL9x2FYkDC/wvr
	 lFezNV0vPAu331XP7n8QSdXuQkO8xbjMSHzhQLCUujoPjF9ZJ2UA0ZcCoXMXqfQIj8
	 TKMbxv9oJSqdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4B560E1C;
	Thu, 19 Nov 2026 21:59:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65AE23A8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57C9540C1A
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jd-5rJPq8UgR for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 21:59:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7BB3A40DD6
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d201::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d201::1;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=azhovan@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=s9U4d5BE
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d201::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BB3A40DD6
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqdXdkjZNeCBEkxmzRh6ocPuxmJgBR9+rGpFMCKPWng=;
 b=s9U4d5BE0ZOoUiw//3b4JjR3dv5VrvU/PsmkyWbGQjsM2y3wH7lwewbg7dBsb644/qUmVbzeewmU7U/NnKv7kZIwBjZCoXukNgEx9vuDTg7899zo6tf1aUUudgRPBqEZUWAKHTUhmigXLFaNUM9uLxdxZxrYCQHaSNUM6xGWojhaZo6pY19ceAzsjBps1IAPdTXATtMfIdUowRH01gKI/aHwmeH6qftqtez7ZMYyemoAB/ejDOvqyOb0zi55E2/8QqmG4WbE4DqjcLVZ5rBOBxVJLX9rdBglpoBpww1LsWrCY0fabcGiSTRCqCl7LS1cTOb7PkAfINr5kEFwuJ1WJw==
Received: from AS4P250MB0797.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:580::17)
 by PR3P250MB0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:14c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 21:59:05 +0000
Received: from AS4P250MB0797.EURP250.PROD.OUTLOOK.COM
 ([fe80::6a79:b8aa:488f:214b]) by AS4P250MB0797.EURP250.PROD.OUTLOOK.COM
 ([fe80::6a79:b8aa:488f:214b%7]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:59:05 +0000
From: Azhovan Asadi <azhovan@outlook.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Julien Olivain <ju.o@free.fr>
Thread-Topic: [PATCH] support/testing: test wget resume past 2 GiB
Thread-Index: AQHdeHEyg57h97YoSUyYVskNUBlWDQ==
Date: Thu, 19 Nov 2026 21:59:05 +0000
Message-ID: <AS4P250MB0797F8009F9D90FAE3B1971BB9792@AS4P250MB0797.EURP250.PROD.OUTLOOK.COM>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P250MB0797:EE_|PR3P250MB0001:EE_
x-ms-office365-filtering-correlation-id: b2f45ade-6f60-4989-8cbf-08df4688548d
x-ms-exchange-slblob-mailprops: F3kBGFPBgzYMDyXLQkgUaCYjF6hsLC12SSlpL12+76yDxM7gEZLl6huvSiYULEwNIaSnsHITye1rDsjCNPLiF2MvONj7KCEinSZDpIK7VrG+hERCes1ojKIoNrB9EnM9cGF9nBCZRJiQIrs/KxLVlLarBK5PAQQqwclClaq3uv7IKMvV5jrRUkc4ZhydZh1F4GTkDZt/9eiX0U35YAkiEatHEovweAw1Nlr4VvN/lbn746Aegl41KCpd4j5druK5IgO59pmRS3yZD1p+mq5XxYuhKBn17FZia2e+Ybn86CGJuzroLuC5Ll0htx53Lf8AOZQdcG32rU3tHgx8rvqyJyKSb/DvY3Ygp3at58uBfecjTz+jbuUR7hYQm304BSXGEx6fYC8gjt8dGWlP6MgT/IEnOKzVhMjdn431+AbMQJ/4Y7CJrFz9fD3d6q6mcfiQjYZyciqsWcdlr+zwtIPkLNTRDogIg0v7aORaT9z5lyjakN7gyRxh2X4LcbxpQqV3qgut8EXsPNVEyPs887Wq82bW7Z+yIXYBE7wb3w4RgiI9O4cWjxoJ6olH3LJkRHX8kIQQyCzY8FNaB8clObny4mj5Y3JSp93ZAcHOSdpBmoVqWbM3U6mDsRjCY/3k5d5Ho+laH/xTkSvkIW22aV3cv7AYl2DDS7mPX1Pmfk1IfmRIZ9hVWtzDYC6P2TY4LJPff4u+iTmGwijClC6gBIxwJ0K+LuJIqJGcedPDAIAZWnD8ersnkNhAkArdponm6GvgZfDytCcxlqnLlgqKpiRZTFjbNMKxL5HA
x-microsoft-antispam: BCL:0;
 ARA:14566002|25010399006|31061999003|24021099003|38102599003|12121999013|8060799015|8062599012|41001999006|6092099016|15080799012|51005399006|19110799012|40105399003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?us-ascii?Q?BYOIaLc+Go8W3Twrttsd0X1s7CiSd4Qg5AvOjflBjZgJ9r0v6mIqDHRPtfOt?=
 =?us-ascii?Q?82FkGokeMuKLc48/AaMJL5Uuqeks3TTePqXbV5+SofENjldxUmZtGY/ClNBY?=
 =?us-ascii?Q?8cqUGBDPZzFsHScteZwqkTACm20ULjEiG7XoPq0AzhmgBAKLpCLxiXw99eRX?=
 =?us-ascii?Q?gZPungZ0hufQnBMu/mkH6V9JuNXIdzR1AJzxZcShlAR3rhyY4QSx83NpXvYX?=
 =?us-ascii?Q?+VobknsSGaC00LCVPSMOG8FHxlZ3wN2mHs7OmSxvVOc6mUf4jRuHVyA2KRwm?=
 =?us-ascii?Q?+KsBhqrt3P1gBtUXgkBZ68R5i07Z45APc6dLFGWs3dHYrdzgBrMX9YKQSCSR?=
 =?us-ascii?Q?9Wrkp81ldd+U5vJJwmKL1MK+TCUXqLvELUrqUFWzQd7lpWg/ru2Aqz0tJBVs?=
 =?us-ascii?Q?4RkOdxGxs4oju7hgxj8R80ufxcuYpxLJws+P/aSXng7TrFsprsYHM7aJ+WZc?=
 =?us-ascii?Q?98eTXDsMWZqjz0RcvA4KrWVtGI8hm4R1u4bB3iEcrKVa1n7exS0facAgOPAO?=
 =?us-ascii?Q?ptXd4sEUUI5HUcKfoNP5q4o812plJIB6yukyf/Z//nZBjZ8dv4N9SbVZ7I+b?=
 =?us-ascii?Q?pHRjiyAJz/XmVwXRFecNr7PZLN28NJBXoToPSPeD/zuoqYq3AWp9cEqkl8WS?=
 =?us-ascii?Q?lS1DhRb3+A0ozuLGPRpCK2C+wGVgjkk8G6IYZAF6+vLc+9mkWWKax3IrWojH?=
 =?us-ascii?Q?ktyvbLf9fZER177p5dS/U1IAtsc0qmsG/BbDY9P5hauGpJ4cRm5NbGiWpZhe?=
 =?us-ascii?Q?d3HA/jNv5TtpITScHUjHh34Hl/poIzb1qlio8IyIjxJu4Kh6oKcgAEPOQ8Wf?=
 =?us-ascii?Q?loOSMq8Dbcc5S2qXzbCZNyz5qUSKnW4bMgXbCqZpqEYXRU8DHl7tkAPT6j6a?=
 =?us-ascii?Q?ei0nY5Eyrs4jrFl227WCMJXB3XjtN7uV/STUH21DEPLKGg1I6cvBKeGQOaj4?=
 =?us-ascii?Q?0UMsgOp/OggOcz9qV7HKnAWpKNYlsRzPVzYZqBlFwgiwJ62M1/K3XShgYO+T?=
 =?us-ascii?Q?VgCGmOCB9jK1qzVvm5E8RBic5b1qMQAhFebdaOwwaiUkmGKoiVxsWcfGyhzi?=
 =?us-ascii?Q?0SkBFVwP?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H4G4J1I2j277gTW0KblsqirVnYN4oWYAdNtkAt4gcmAHrlhhAayol4MwPxFg?=
 =?us-ascii?Q?JPjO/DqQMrmcVKJCm9881zGOOIMcVomTI+8FuPa8H6AsjmQXZYg48udLBzfX?=
 =?us-ascii?Q?wbrxJqU1MzP7uK5Yy3sZO24LlANsTCKsShZyDRhwEKQaHuycCXhQz9MaAvwg?=
 =?us-ascii?Q?8VBDIOKO5gV/045X6ByG6Z5zrbiu01Y4ZHp2mpz3WmPx6updnhFvbGI005oI?=
 =?us-ascii?Q?Eb43xWP4a87lJHW/3CSPXNNw40ERBQ8elLI2vvX9wp3oL89R2NyR84YGzBpQ?=
 =?us-ascii?Q?rDDL/ji1YInl8SDrOJ/J8a/T5bJQ5eSU8hKJBmKJ1FhJKS3IgPcSGBjA511V?=
 =?us-ascii?Q?tEbRSOjZ45DEnFrWfVi+LewhyvfNCGY0zo8+t358pcqKQZ5bSeKAH9YpK7uZ?=
 =?us-ascii?Q?s7fQ8oSb/mlZwyTwRcJCbf4OWPtQ5lG7YD+SFWz4LYKN8aR7TzhcjZIJPlLR?=
 =?us-ascii?Q?ex1kEcINeLMw1tj7NpbtjNuyHN09sF0myxGw6KUgLormy1Lt+YNohf2iJ9nF?=
 =?us-ascii?Q?yqZhEyeKYRqX2yzoNetFRxmH+ZYWKoPJkMPWrwJ0k7ofYoQF1iBd3OeW3NY7?=
 =?us-ascii?Q?3DQLMfLotndUMJ+12WGSN7zE9MdeVrGzoVqTZ17LC9+ncZKblKtA+oOQXXH6?=
 =?us-ascii?Q?eok4paxEofd5sYw/y0y4yM30z4XFEVbKRemb+iWrcoG9i0EfYt6z4/m0ZvIT?=
 =?us-ascii?Q?jnslFU5+AcHQ1gtSbnWMr8fJHyZ2TXaB8F7p2jSjkBDj9Wy/BxLChIeuVPez?=
 =?us-ascii?Q?1rHAYGt/JSTY4JfYQUavIywmi1BDJBCx7mtPuN8MQos9QI29epLma0v+jQKb?=
 =?us-ascii?Q?pom90biRC6TINuVSniHb9mq2bh9CldVy7Db1XeM53Q7ENtMw+1HNKWd+obSf?=
 =?us-ascii?Q?AbU2qcys7CCwTuxzP9UzNymY6YGWQeaAV7+maH0NnXgA2P1P8ZEp6ELIU2d9?=
 =?us-ascii?Q?F7kbcAHwnkkZ07yV9ivF43wkCDVWN9OB+2xjGa/wcTVA3scwLiJQB9DC/QD/?=
 =?us-ascii?Q?QTqSZNh9pQ1BCgv+QR7fKVwu4p4EsPZUJa4WRolpX6xILTscMkwwQ+YkWl23?=
 =?us-ascii?Q?y9tpUG0Qma3AVVHe7QVZXmr8PoYMMeOcD6ZhoDd79qKeLKyXO8DOOLBw7lu/?=
 =?us-ascii?Q?VrDIQvM9RyKU+bzhUcdLlVaCe6f0s9TZWkPA5PNiIa62HnW3Q+UcYX5qfzU2?=
 =?us-ascii?Q?TkWHsrj/QjQFykvUAeok48VsEKgY2riJfvfT/OziMIvVogw8epMzTfCXoklv?=
 =?us-ascii?Q?4iek9q2cN5REEJUhMw0pBN4F+uI2hI+Kwt5715VM5a0rM2OslGUqlrQVpC0X?=
 =?us-ascii?Q?RItCO6NlmmWGEWMaK2hpBZlr42BOoaMGq8nMWbXfrL6aUUb9U9p2+AbsTHhk?=
 =?us-ascii?Q?K52QOIo=3D?=
Content-Type: multipart/mixed;
 boundary="_002_AS4P250MB0797F8009F9D90FAE3B1971BB9792AS4P250MB0797EURP_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P250MB0797.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f45ade-6f60-4989-8cbf-08df4688548d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:59:05.7794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0001
Subject: [Buildroot] [PATCH] support/testing: test wget resume past 2 GiB
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_002_AS4P250MB0797F8009F9D90FAE3B1971BB9792AS4P250MB0797EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Jabar Asadi <azhovan@outlook.com>=0A=
=0A=
The short downloads in TestWget leave large resume offsets untested on=0A=
32-bit targets. Resume a download at 2 GiB + 1 on ARMv5 and check the=0A=
HTTP 206 response, the final file size and the appended bytes.=0A=
=0A=
Enable range requests in the test's BusyBox httpd and use sparse files=0A=
so wget only transfers the 17-byte tail.=0A=
=0A=
Signed-off-by: Jabar Asadi <azhovan@outlook.com>=0A=
---=0A=
 support/testing/tests/package/test_wget.py             | 18 ++++++++++++++=
+++-=0A=
 .../testing/tests/package/test_wget/busybox.fragment   |  2 ++=0A=
 2 files changed, 19 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/support/testing/tests/package/test_wget.py b/support/testing/t=
ests/package/test_wget.py=0A=
index 7279b776..b6d826a8 100644=0A=
--- a/support/testing/tests/package/test_wget.py=0A=
+++ b/support/testing/tests/package/test_wget.py=0A=
@@ -4,8 +4,10 @@ import infra.basetest=0A=
 =0A=
 =0A=
 class TestWget(infra.basetest.BRTest):=0A=
+    busybox_fragment =3D infra.filepath("tests/package/test_wget/busybox.f=
ragment")=0A=
     config =3D infra.basetest.BASIC_TOOLCHAIN_CONFIG + \=0A=
-        """=0A=
+        f"""=0A=
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES=3D"{busybox_fragment}"=
=0A=
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=3Dy=0A=
         BR2_PACKAGE_BUSYBOX_HTTPD=3Dy=0A=
         BR2_PACKAGE_WGET=3Dy=0A=
@@ -53,3 +55,17 @@ class TestWget(infra.basetest.BRTest):=0A=
         self.assertEqual(ret, 0)=0A=
         out_str =3D "\n".join(out)=0A=
         self.assertIn("HTTP/1.1 200 OK", out_str)=0A=
+=0A=
+        # Resume above 2 GiB, using sparse files so only the tail is trans=
ferred.=0A=
+        offset =3D 2**31 + 1=0A=
+        tail_size =3D len(msg) + 1=0A=
+        self.assertRunOk(f"truncate -s {offset} large /var/www/data/large"=
)=0A=
+        self.assertRunOk(f"cat {fname} >> /var/www/data/large")=0A=
+        out, ret =3D self.emulator.run("wget -c --no-verbose --server-resp=
onse http://localhost/large")=0A=
+        self.assertEqual(ret, 0)=0A=
+        self.assertIn("HTTP/1.1 206 Partial Content", "\n".join(out))=0A=
+=0A=
+        out, ret =3D self.emulator.run("du -b large")=0A=
+        self.assertEqual(ret, 0)=0A=
+        self.assertEqual(int(out[0].split()[0]), offset + tail_size)=0A=
+        self.assertRunOk(f"tail -c {tail_size} large | cmp - {fname}")=0A=
diff --git a/support/testing/tests/package/test_wget/busybox.fragment b/sup=
port/testing/tests/package/test_wget/busybox.fragment=0A=
new file mode 100644=0A=
index 00000000..803235d6=0A=
--- /dev/null=0A=
+++ b/support/testing/tests/package/test_wget/busybox.fragment=0A=
@@ -0,0 +1,2 @@=0A=
+CONFIG_HTTPD=3Dy=0A=
+CONFIG_FEATURE_HTTPD_RANGES=3Dy=0A=

--_002_AS4P250MB0797F8009F9D90FAE3B1971BB9792AS4P250MB0797EURP_
Content-Type: application/octet-stream;
	name="buildroot-wget-armv5-resume.patch.sig"
Content-Description: buildroot-wget-armv5-resume.patch.sig
Content-Disposition: attachment;
	filename="buildroot-wget-armv5-resume.patch.sig"; size=294;
	creation-date="Thu, 19 Nov 2026 21:59:05 GMT";
	modification-date="Thu, 19 Nov 2026 21:59:05 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBTU0ggU0lHTkFUVVJFLS0tLS0KVTFOSVUwbEhBQUFBQVFBQUFETUFBQUFMYzNO
b0xXVmtNalUxTVRrQUFBQWdWVUpGNm5GLzFvUVFNZThWVEhoVkFVR3Vtbgpaakg2U3puMTdNVXNF
N0tyOEFBQUFFWm1sc1pRQUFBQUFBQUFBR2MyaGhOVEV5QUFBQVV3QUFBQXR6YzJndFpXUXlOVFV4
Ck9RQUFBRUExNFNWZzRKZUs5UmtOcUI5WGpqYis1dFRrSy9sNnhoOWdhWDJUdHR3ek5tQkZmK1p2
aUE1Vkp3S2JKVk12dHgKUnJrZGxTb0VyWmZiUHI2MFVST1A4SgotLS0tLUVORCBTU0ggU0lHTkFU
VVJFLS0tLS0K

--_002_AS4P250MB0797F8009F9D90FAE3B1971BB9792AS4P250MB0797EURP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_002_AS4P250MB0797F8009F9D90FAE3B1971BB9792AS4P250MB0797EURP_--
