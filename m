Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C0D606A334
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UfVJZNEh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=R6/52UrK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B9E81E1E;
	Wed,  4 Nov 2026 18:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1LgxdBBHqbH; Wed,  4 Nov 2026 18:11:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3FCB483A76
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793815862;
	b=HTyo/WmkmcE30rJEpah5/1cdgmJts7PeCnKPJeJR51rFyYUh8z5sCo46akkRBcUiH4tm
	 ewTh/YhNgtlA6x6PdHuGavk0MSeUSCZ0hhKhI6imM3Rl7I34QnNL1Jl+XcPkz5upPlMs0
	 hVqdiSwUclf6IwrCbGoXL/IPXm7ojtS7u0TYpEZj4f6vL/Mr0GDHE+R9+GXpRxVDml+yH
	 lbcypNK8R2lkfbiXwN0YD5nPx90KXiKvDafeCROEplZeH8tMKVa8XTevMcBqqiSPwiaSE
	 JVsZeR+qBtUFGSoPY3pudCuMU/FtDlWeq0nDPpM+wIIvmLYKpRiN+1Gi/XPRGhInIsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815862;
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
	bh=KoGECDNnG+NWJ5jtu1rRG5G3jI5l5R5mR002f/5Xp80=;
	b=fCPsfhdKuiRU6Z7wELhl0OZScMLFu1WUmVll1mX6HEEQ9o1/aOYii9Xw+yJgfJGTHFX1
	 wc81FU8fuydb9ixDAr6yu2CzklD9XJKlBKdQpnku+mOeiYU3dzEADGhailkFqch70qpo5
	 CZuXmg8xuQ0jtxs8WV0PyBlYrs5b2mQYpG3v0ev/Sw4pW1Xu+r84vaBvcS0yQs2spb49t
	 a+vHNA2YyzhTA4MvJU9QJA10VyLLKxv/5Z7QAu4HjSyzsDesaClMOsvulsOjHwL+PABY9
	 4+7i1JhPY+XB4S02pucTev4JWpjtD5maKHYJJr6IlR/+ddNFlMLIV1i79WYww4mXhjA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793815862;
	bh=KoGECDNnG+NWJ5jtu1rRG5G3jI5l5R5mR002f/5Xp80=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UfVJZNEhSI3oLR/hxTdnuycGQb4ts1xZ6ulkdvu+rMnctzhikPW3ZnSoPzOjjLRGd
	 DkyidinWfVWN4nig4HJPdSemwvSUja/AJgmtNLDeFejlslZTqJ4M/QHy0oktenU1dL
	 lUh+iCD2uPtMSxi2AEJcBHimkps88Vhz/yn9mxxR4v9GDHuPAKIhKm0f9GJVV5rOvv
	 c0mBV55gbVsLmY16fNhQ3f9X9f1mimJqM/2lw9+X00XOyJS4uZp4EKabIA9G5cGZnb
	 WOkS1VT2Fuw2ky8030ZS6u1pQA+k5YvzoqgIhKKrG7CpquKEhruzJJtq0oK2FyNH+Q
	 Eq1qnGeHBX7yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FCB483A76;
	Wed,  4 Nov 2026 18:11:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5774FA10
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C7D42BE8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrtBcwAgTrPN for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 18:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0BF7B42DE6
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::604"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::604;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=R6/52UrK
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0604.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::604])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BF7B42DE6
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqaiksNR7beIEVte6lajv7Cyz3UADvl8Lsxpeklmv5s=;
 b=R6/52UrKarHfTFe8LL6nQjtYK9/A+pjRZye3IjpRmMyz9SNuGLETMpWuyvU15tNlrc3qw07VWEDzeDhlx7VhTTjNHjfvpmatqBmxK4ztpgLS5ig4sRR3auZ50I4YfCFnZJvTj+ghHd6eMMz8flmaam1crdjs6a4pbd4VdEMjczCW+YErJBNkBKxySAjyk0oXyzwVoeSphFGYXlTQi/hZ3Wab3xYCFWhFEi3+43n8eVGNpgEkFriwqQBVlIubdPDDNic2jo/Jax73b05cXMCZ1Ygbw3dxYyWESa7OXbg31KSEgVZIGhFd8kbkMNGLXzBCxl4xZUk2Iis9t8iZzuCfmw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN4P110MB2866.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.29; Wed, 4 Nov
 2026 18:08:30 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0546.025; Wed, 4 Nov 2026
 18:08:30 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Vincent Fazio <vfazio@xes-inc.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Bernd Kuhls <bernd@kuhls.net>
CC: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
Thread-Index: AQHdaHsBkNMBUHWr+kWy1xMcbnzqvrcePgbw
Date: Wed, 4 Nov 2026 18:08:30 +0000
Message-ID: <PH1P110MB1603A8AE120C82FC05515C599F68A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261029204953.1447140-1-bernd@kuhls.net>
 <20261029204953.1447140-2-bernd@kuhls.net> <auO2ugenOrGrEKGM@windsurf>
 <BN0P110MB16090AD1C42FD6EAAAFABCD69F6DA@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB16090AD1C42FD6EAAAFABCD69F6DA@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN4P110MB2866:EE_
x-ms-office365-filtering-correlation-id: e66ed24f-df58-43e2-a48c-08df3a9ea1fa
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|38070700021|4143699003|56012099006|261009221227099003|261009223027099003|261022115727099003|261102123227099003|261021121427099003|261022075727099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|10067099003|55112099003|18002099003|22082099003;
x-microsoft-antispam-message-info: ansy9MstWH9NHVodBzRXWjhPhmfCt7sHO3dzvBWN8enKrEY/9cOj+SE7B5GtUqimBSc2FeSDOi1XiKK/Qq4tf46k1CLy38O355v+PQfdTgRbUX4rBG9CrwX1od+In6kgd/AuJYPfyFL7o07fMmYLQJvIXPfpWv5brmixlfoRrEg3UY94uOt8ZEm1A3iRBdoPXNyHfA8yBNWKbKia9dKBnYc4XyvfVfP62qBFvyZwQBjvRfLyqnVNZdmZoUTF3N6BY33egNnDRPke5JcU5PeLJjF91sG+C01t6ovCJb6rpHAUO/FaPVOrFKQ77Vo5kEBM8B1yp2bKIP/FiaiuBnCiwui6eYSMVKn1fT8kduujQqulCw3/646rrPeNhdfBgfNyCBvq+XqdbWfEJRnbBQWMbqlhwkBAB+SFuLr+sc0D5PoXPDs+0OCh+MOzRB74pdizmCYUSxeVAZXF2/vpHiWrSHDX8rQAM0lexqVly2CVKj+wFvl8vqdIQaMOWgDPW3LVqtPl5A/9BU6wcs01R9lXwn/nUgY6D73d0ZteHqNulo96zynZTIAJdU+Inh8adFYHWbj2BkGQo6Yz2U7XjnCfBkojcUVFmzj8WcSDr3eJtDpAuyadIYvXQSkl2WDaZ12ZMflSKhbro6frU4XuW5NZeZn+LsPcm/RUEUG08sAaRuU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(38070700021)(4143699003)(56012099006)(261009221227099003)(261009223027099003)(261022115727099003)(261102123227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(55112099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ILsP8L8iPtVv5b2mwJEJM3+vr7CGGv2ObLDfSKFz9U+QkG1fXZ92w7uMMmmI?=
 =?us-ascii?Q?R2pHXHxZY1dmBNJWwgnmB4HadMSZz+BJAmFjAMNzyjfzKDPUWxTbfep75MDf?=
 =?us-ascii?Q?L6pK8e5cbAHLpYkJ9nwxvoj4vlmBmlQ3ec+WIdhJ0drluzyG40RptqaShWHd?=
 =?us-ascii?Q?OfDp6mJ+wkNIuRpbVrwORxjjaT++7Y58STur415BN2gMoxzPHQegnp/YSGKN?=
 =?us-ascii?Q?vg3rNOUKhaDgh33OEwslgM7dXoC6UXK/9kpviA03RomLxyuGT0THX1Yer1DW?=
 =?us-ascii?Q?y10iTV56RSH+/++DmGe21+gRn/mmbtCmMr5iwSvlZxrHSb109S1eDa6gCoRO?=
 =?us-ascii?Q?xucXg+7VFcQkq//+QfYEHMDjcCpKHP/SPwmADqzpMbIdvQRQtwPsMPoe9i+S?=
 =?us-ascii?Q?2GFFzZ/aOeyYuXocxc4UFCwCajsDyF81HTbbbo41ZBSjWv3J+G7HRFOktF9m?=
 =?us-ascii?Q?HGVHnnrzAhpyI8QKNlLKZGsnRw0Ox/eTviZQe0hdmxtpfMOmGEoL2EePQKhb?=
 =?us-ascii?Q?b1pv9sSvF9G8eHQOlG6epcJ1ZIXmVCDb90G5c07qCPw5hh5/KqDUHqFuj9ji?=
 =?us-ascii?Q?eMFFTMeNYGKNbQPo7nqXA+mSJq3W5C26vIVxyxnIEgIznh1LjFZaxaXdOcu7?=
 =?us-ascii?Q?hJV7YRsrp/gecaGDCjXwSDmHSRCLgsHrhRYgDPOjASI3OYlL6NM3dZjuv4lN?=
 =?us-ascii?Q?nS6C6R5QN+EDJtiGufnQIUgNc4A0+7Tft7Es02xM9qQremeadT2TLuXO8zX6?=
 =?us-ascii?Q?YBG5108LdYM/kXlcd5QdS9xo+FSo7i/rJfJ6PCte0TiKoTK7kdIDdx74eh4Y?=
 =?us-ascii?Q?ArKUbqXSRZZ7GKexG0ehgL+K7Q4kRdffuYK1Y7jdrcbI+5wmYNqPLh+/h3Z0?=
 =?us-ascii?Q?dwcdAY5btopIt0/x5o9dNtC8cGa+6j20m7Gca51IXNinyByvXrgmFuY4rZQA?=
 =?us-ascii?Q?HomTxw8N7LS8xpkf7hVC91GzntM4c7V/T3IisyDWR6mj5yDTqbeB1vAVf0aD?=
 =?us-ascii?Q?7y8CodiSbDzhO1v5M6o1YPBKa2qyPKVGkY0PF9HqseMaPxC7zwOv7SLBGcqw?=
 =?us-ascii?Q?d84ioiwZsip6G04JmmLPdNJNYS9zYvSI+ZHlqotPxC1dMkp3wkNWRIXJGOhA?=
 =?us-ascii?Q?8Uz7JvViqPbrWH3ovlzgtDMD94EBHg0GIVRctewq7fGb2eIwupvha5epy9JY?=
 =?us-ascii?Q?vR/WXNa6EvFF1HAywusNMt1Sa7NUVCIWGckKtzRaFT50xZ1fux/Y5CBGInzM?=
 =?us-ascii?Q?Yrl8fs81rsoOYjtbYBudiG6xIfkPsl4XbwzWLIopkzimav5QbS92we1WJoEV?=
 =?us-ascii?Q?6pLAM5R3Y8XwJQTX6g4XyQnBfjS9wAEPjMlDivOZLut/K7KkbyH98us0n4cw?=
 =?us-ascii?Q?jLPdOSOUwHuFC+zCDe7cuPXPcmH/X9rh8cl+rMarnNHgH48PtWgpYkAJNe/e?=
 =?us-ascii?Q?Sv1LinCtqcF3Kyg7KMSIvRkAoOfyyl42RLC4K4d4nI3C5R8AxuV+ccd1xkBu?=
 =?us-ascii?Q?IoKUXvqvSPqqdkx0phnqlHENy1u3RJNAuNBUPPeg0PC3d2ceNG3pgWUdnnVD?=
 =?us-ascii?Q?y4DlTzUCtFN57m6dz89hUHj3tyB2mFqGqHQBHfna6kcVa5C5adrLvTtISw/m?=
 =?us-ascii?Q?rbCx5HhejAFDtOw2P9BZ5wLFrvPJlgGJkbh2josfLHUa?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e66ed24f-df58-43e2-a48c-08df3a9ea1fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 18:08:30.6352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4P110MB2866
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_SPF_HELO,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,T_SPF_PERMERROR
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Vincent Fazio
> Sent: Friday, October 30, 2026 9:29 AM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Bernd Kuhls
> <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>; buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] [PATCH 2/2] package/python3: bump version
> to 3.15.2
> 
> 
> >
> > Are you coordinating with Vincent Fazio on this python bump? He has
> > been doing a lot of testing work with Python 3.15, and my
> > understanding things are not yet ready.
> >
> > Vincent?
> 
> I may be performing more due diligence than is necessary, but here's what I
> know:
> 
> General:
> - python-dbusnext is broken and needs to be removed in favor of python-
> dbusfast (already in-tree)
> - python-pymupdf needs a bump but there is a patch I've already tested that
> handles this
> - python-treq needs a new dependency `multipart` which is different than
> `python-multipart` which we have as `python-multipart` in-tree
> - The python-magicwormhole unit test probably should move to using a block
> device and not an initramfs as it runs out of memory
> - I noticed that we're building the interpreter in shared lib mode. CPython's `--
> enable-shared` is interpreted differently than general autoconf recipes. There is
> a new flag I recommend we use in 3.15 [0] so there is less of a performance
> penalty on the interpreter.
> 
> glibc:
> - Unit tests build and mostly pass except as outlined above
> - Python's builtin test suite largely passes, I'm not sure I really want to sift
> through all of the failures
> 
> musl:
> - Unit tests build and mostly pass except as outlined above and except for some
> packages who need defconfig tweaking (TODO)
> - I have not run Python's builtin test suite
> 
> uclibc:
> - Unit tests build and mostly pass except as outlined above and except for some
> packages who need defconfig tweaking (TODO)
> - I have not run Python's builtin test suite
> 
> [0]: https://docs.python.org/3/using/configure.html#cmdoption-enable-static-
> libpython-for-interpreter

Builds for uclibc and musl seem to work fine(-ish).

The python unit tests largely pass for all libc variants and fail similarly across the board. There are some variances but probably not enough to block the update as I'm not sure they're directly tied to 3.15.

Other notes I mentioned still apply.

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
