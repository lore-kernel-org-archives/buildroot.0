Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2DCCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 04:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F71B81065;
	Sun, 11 Oct 2026 04:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEv2bUV-udVZ; Sun, 11 Oct 2026 04:52:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B5FA81099
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791694330;
	b=YGZpOT/RPW1oJtbOUhS1y3xnD01iTPpyqxEUkst27h3PSpDBLttaSnV1sA3jWUY39fxh
	 KUcrykda7JeFYJ2QTpdNOGIOmiMYL+vYiXPaeAa9E1TxFbiAElZkny5bNaCqb5xV/YbTr
	 OKFWptZejH+j3Ft7YTqL5DwPaY1wikyvEDVdgMzP2+CJxtOKjcbVvULZZAG5BllrQsXSP
	 dETkPKOuhzaLVq8f4qNGn3JusglnYSgKJO72boQB1ADwl4271RpbgmPVysuiXOAfWw1pR
	 W99Pm59AYDypn8KfYVohv660gm/iFVho8Eo1wy2LyEeHlgeItAibDobw+HAImyFhT2Q==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791694330;
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
	bh=d6AoTZCPPkd3he5GGqHs0NJ6fxP5S9AB1k2wkIKyCZY=;
	b=rweRoBY8q0cc90d2Y88TyYKGPBUZ5IsIFi3FazqZyNdZHj6vDTKarZYPxzcWCyvLU7dt
	 EYzZd1fRHhrliHlJ5BzmheCF3WVRxPUQjkHkLbdr9UYtUkPkmMM4mOjwj/no9zFex6SlM
	 QEOKO4HB2E6y9B9TxkN6w+6YOOkigBqXtQK/6H3qJ0eHMOTlxv4xWj3wf9ps+f3FBgXD1
	 aUFvxSZjp3fJQVYGI7Yzcp9ecFcxkL07YZx6As9wNw3Q7riYb8e+W5AsCNsQrqcacfeMb
	 Tw6l3EOp1tSNne8AuJ6wf1Uyys0FJZCbIiMFPsbG955tYa5sd3I3lQ5GZXUFNELFk9A==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791694330;
	bh=d6AoTZCPPkd3he5GGqHs0NJ6fxP5S9AB1k2wkIKyCZY=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GZ5ClNwRIxakA/afzJDQbDoCg70k75rXiOA0MPOFlAgtfQ4S/K/9MkXLr2Rcsz8I6
	 mGNvqECIw8EoAtYdaMBbRU++wamXIdNMI2lXdY+fswbDGvjXmqlALyPvceQdV0ek8p
	 cR6Mff6fkyBb11YpfbY32dHVwm79/XeMBrgexXMOeodoAzNjdGKwy741LAg0X7fZu8
	 peeY/iKkfPpgWJU0WjK7xzSerOv6ioc9v7ywcbYd8JkjyZddcvHt4jwfUPdIkmmlmY
	 TkWsVCVGs0ROVLL4IPdtajH0OfxggR0wuBYY+TOJS8Uuujxlm6Z0pbBUQsFMmHqcK3
	 hG3g0JxRI0e0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5FA81099;
	Sun, 11 Oct 2026 04:52:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AFD01DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 04:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1878D81099
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 04:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IgowCbLIhZd for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 04:52:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2DCF281065
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791694328;
 b=LifKUJZ5CbExh4Ja+IfT5G1AgjznjT+V6ad3BnlkqF8Cwk9rMHZMDxoMoUQ8Ohua4+vr
 LMngBYRr5XNWnKZxQd3sY+yPqkJQNgKFaChfUZ1hfyb2EOqRBQ0FPm2NRoEtQtPx8XNHc
 HjgZAMeoqOCBsVd7HqMgYvhHBn9AQXDba6N+VOAqkqJqbLAfgboljUT13nhLnMiExQs4i
 SsFgisgDZtmJFdNsR7RkG9HGB1grSVT0k5L1sWGOtpwBnB4qNx7VrNEB256lfZfWMqtNC
 spvGqYGIxnV2UDCa9RxYG83vv2avOShel5UpsA3ektCZzScaok55t3mX7orfszLKuCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791694328;
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
 bh=60GY3YxcuetiwXsxl8NTNTjEKiJUZjJw+HSyn9h63tQ=;
 b=Do9qS249tdljiSYRXRWYyohjggrHJwrb2J2KOkQU1eLH+h75vlykBGX11dwWLTPKp/CF
 qYx95tNAU++Xwq0tAYMVF1qISvFxJorM4jM3eGySEZyChtV2prOwwwj6K9nr+NWr1M2cz
 oZnpFkhjPYkSpwBY0WtmhfCrs7E6cA6nX9xx97k3ga11dKAoDzvB4ZCbi/yfbbP3HHiME
 g1GzEX92I4raqocg6FwlxNwuvnL/TkWrC2VyykZGD35IOTR96YmYPUNAYr4UMW+gsSa5v
 9dnAbYbs7u3e0wDWRd1HnPHCi6vkVZZ96RKpz+hDJHpuJxMVzWys1pRUaSFFJKHD6hw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=amd.com;
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5Zh+pxbl; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c105::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DCF281065
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 04:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVYBIhjLU4VE+C8/940O4A0gWDcoBWtjvVvdFBtq47uj/wlzkmZ1eN62bWNRnR3V4wSow4UMF8c/umir2DS/5pIG6jyf+48DWP5pXUyKUzc5N++9pTqnU+ZSdbS0ZZGOEoOiyoIP+GySOBZUu52mC8LRs3FDTOV4eIB15DRDwtpmePninvBUAcPgdafB4aRnwxqnWGW3Alp6MnKnsP3HqiuvXRZGfsLt5uO2pL0Zzz7UNybmVI0blEJY7424AafjKMH+KHdN8LY+9GmkS1yhV0g5kH440oP7OXE8YV1X5zCuYBqyHbeq8miw+hvXAw+eAk1Fu7yVtAmHdNdhFf5Zaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60GY3YxcuetiwXsxl8NTNTjEKiJUZjJw+HSyn9h63tQ=;
 b=jAapc8yTZHGNQsOeNgO0ce6oM4kFGVbQqQPwCSOfbePKPDBQJoUkuQuCKUwo6ougba7o93wztcR7rAA2yN65j3B7vUWyUtaMdwYvxjs9P9Ac8pL7372F55nRKvVxRE3huZS38Z9vsQT+QkXBtjhhfVsA092lmfAXpfpvWeyaXHpIWDYfWG0NCJaq7DBDSX9TihLVstlFQpH2kHY4eeP4JcRQZEWgqFOKYq5B2bOuqgtwL/AKf1thnRuIUb58cAO2q5HsCVIbl/ozu/FjY4wY1rMkrUyxRvC4L3ahN/7uTgJXiZ0GAo16T8qArM/yUdd/Mdv9oZEndw7fgHbKrIEA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by SA5PPFF1E6547B5.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8ea) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 04:51:57 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 04:51:56 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "joseph@anodize.com"
 <joseph@anodize.com>, "ramin.moussavi@yacoub.de" <ramin.moussavi@yacoub.de>,
 "thesamprice@gmail.com" <thesamprice@gmail.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "arnout@rnout.be" <arnout@rnout.be>, "lordrasmus@gmail.com"
 <lordrasmus@gmail.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "Simek, Michal" <michal.simek@amd.com>, "romain.naour@gmail.com"
 <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
Thread-Index: AQHdOo/JyztJoKd3BkiNgChDw90O7Lb3gm6AgACAQ6A=
Date: Sun, 11 Oct 2026 04:51:56 +0000
Message-ID: <BL1PR12MB5032C1DBCFDE52533D8A1BE2F0902@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260902040121.1583600-1-neal.frager@amd.com>
 <asqptBFqe5itH4RQ@windsurf>
In-Reply-To: <asqptBFqe5itH4RQ@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-11T04:49:32.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|SA5PPFF1E6547B5:EE_
x-ms-office365-filtering-correlation-id: 98906f8e-c39f-4e8a-04fc-08df27536073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|41080700001;
x-microsoft-antispam-message-info: R3jnvtKwC2c9NyYlKfkirGPzPcYAtlfhG9kAea01D7ooX+KUBdBVBcCaSKHL/sO490TiuOuSssuVJR/Md3Qb+q6t0Gc7mSR5iEn5R5gcVnTAUS+7Dcofz5Vjqa1tW9Is7VRk0gcKQbf+fq4SnQcMdh14eK08eIqSlE7uNhwEb7Cp4cNrorjMo32h1SKPaiRAgJ03hY4QExTloBZwUcqWwvb+8FlWELpzazRn5gV9t1+xUpZ4cIeFDXiCfGV/lUxqfJPrWPZmAgbo+Fr7Ey4rAKkd5ynkgOKofBzP+Q2zd59k5kPxpmOlfOfsEkHibkmd2pQP/9q9pX2ZOf94tfDcDq+Nl1sdsre42J6Ipfna+h4eBklTGiPVLOm/XAvN7qMx8n6hNqvS4JNa3Iqmio9D6kK0Vvg9HpKR+o+cH74vrEDFWXcn2yMxMcLAyym4BHlNWdtT3OOzfmNoMWiBIYg/qIfm5XpX+fPfbZkTJDH0KwDu/s+/90pe0y7KphstuSMJkGjkSkWn5c5DoMBmSQEGH4YngfeJ0GXBXg9X/RLn/nw8NA9rCOhASd9zQUvKF5VwJBtp9xWDpF6DvM0CczPXtexZftLhi5mZyydIR1a4pFU+hGxDCMo2StTkchQ871LT2pz0zwQ4BBnksDv0ngIxzXE/dchEH/Ig9Jb92W1wixGAtWye9SX/qVcBjmqTRaVfzPwz4s2AUuzvuFkrDaoDitO4/KV7IsHezDLgdD6zgHGjm/mAHKWPolAhFuyxnwsGhxBQX+N8H0GWm+R/jMFt0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EkfAbdpnJEXf8uEPmlfI30VjqQmLmA6rAbmattGZF5tuMemlhPmUiYEtVD2A?=
 =?us-ascii?Q?+hyZOrXeKFeznrPNiaryfrUCmrJb8XiQ+ZxPprfwMKFTU4Y/F/Pui+bRy7nx?=
 =?us-ascii?Q?/Bd/NKyQNKyzcA1+15BabgpNkawL6xUPzIYKBjT9qlfKh5fCu8J3ISLcHXBX?=
 =?us-ascii?Q?FI4nAwyKfN3XWBQ+oRS0bG4MhLVEB/C/uCVAnh5hBYlldhN7wnqUt1i3wjcn?=
 =?us-ascii?Q?uzhPwiaSvSBuHwzhaJ0TQymg6Ph6Zi8n0AhfjQPTlHCJxp0WrybIUmA8Ib+m?=
 =?us-ascii?Q?CO2Zq+FPspyCNFCo3pZowjvbJIJLJdhQ1j5R+a1VejrMIKaVdBOB25MB9lu9?=
 =?us-ascii?Q?Rq0E5r05n5GpTsEo/cAH5Wb8V0qgCcAnOnMqQR/ullpwsoF9A0sn6SytVKh2?=
 =?us-ascii?Q?igi/rsQulqFugnYeNV3zDejENW1xlUQrov8w/LSwH8M+Piw9Tn6+x54ZAuBk?=
 =?us-ascii?Q?YII8I8Odm6r7snVWwt0BrO83azugxIEwZL/VCpCBKeSFLwMCMj57nbX7KgAo?=
 =?us-ascii?Q?GLgAdZIMmMRR8tUf2MZhRKsjV/k3OD3PRdoxewneyeaZZKcxOX2GV0sMyY/N?=
 =?us-ascii?Q?04esBr+irsVlOPIfS3K+D3+uSMV0WwZhru31y31eC5IbNiU1kmXKBHwj2CVS?=
 =?us-ascii?Q?DKsXr5x0PeRMVebkqum1DMmh9T9hcCx49T9Gx01Ckrb+TIZ5FQsmb8dNaFzL?=
 =?us-ascii?Q?LXce980zIgXhgFv0x+huCEtPrS2GWNz1rC968v68hfwO6QcVKKk2nYL2CsDE?=
 =?us-ascii?Q?ZBee9is0cjflDeHuxG9hKurmJKQPwneH/eBAn2eu75vtcIwaogJ8YOO+BY21?=
 =?us-ascii?Q?CYDCgwJqEVkPnddf51Hlyg6vOhhZnK/N2WkPgrA94sThP7U1UoGqF6w5hG7c?=
 =?us-ascii?Q?mZSE/6JXgb2PbLfZYhzofq2CZjx/x7p2dFMsvahKtg0N4ruKvavbmpm3COQ3?=
 =?us-ascii?Q?rR9+/a6V6NWE01afoBw0kdTqcp+koKV2OfAuVNwOKuPz65r/9017EF0DL5RI?=
 =?us-ascii?Q?qkRbJgsY8v7sv1nuxDxCUkGJUxn32lKdkbzN7I0nqcS3iO2uz6ytI0PVZI+w?=
 =?us-ascii?Q?wUTbfePaigrjQH4LRBWv9YMlXRbtON7SHewf/MmZvRO7McryzQAgxl6jH6Z8?=
 =?us-ascii?Q?kkNURBwi6Z0ew5fj7PPkC/TbMJlyKAXbCkFFbzo8CyfVtKk2gdQ+RbulkFKK?=
 =?us-ascii?Q?tXrJNW+TovbQ8EWTb6Mbg/rrVQlU8tioi0+/HQ9LDN+drmQCHtDeXqU8pNYE?=
 =?us-ascii?Q?b+wJR2scpYm4MDKJ48fggCWYzQ/lJQSrQClpiYSoFLtEHnSj5QtZ/XSRwNg8?=
 =?us-ascii?Q?OiGbcexraDNscLLPgU/HDqK+QkRskfSPHA+gvtgjRxV3mPSYZM6JTZaabAZB?=
 =?us-ascii?Q?FA6Kmkb3rYWP9lv8mroVD1dm13zL0M5r0s09SwEhTuApRvRmAAR1mkypFZmv?=
 =?us-ascii?Q?ecoE8As9hIo7CX3EgcbfIGch30ppEymLwbYqNlaZQKNsuzQHaUMr8sfHgD5W?=
 =?us-ascii?Q?eYIW2vqWasaJtKxEftlNgKydeHFXSqbApfhZ3ubgL6tFnzyilOkdKO7F8rxt?=
 =?us-ascii?Q?LXS4w0gQ5O48fDEgZsoNskOlqDm2IhgBkQArcuLJWLE/HyZi9DZ6g4yuJuvG?=
 =?us-ascii?Q?zh51QX8WEJ9wIpEk2TDsVftc2d2Nx41vQqf7rp+gG7wDccQVscMCJiAed243?=
 =?us-ascii?Q?VLXj2ivQetRZcKn9vrnHKDGOlZC2U/ztvYkg+cFdCA3vrBg0?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98906f8e-c39f-4e8a-04fc-08df27536073
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2026 04:51:56.3277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XyTYC47ID+XJpPKtRssvYEiy+UOWLGqc+qSQ4n0ilLWzSqIlzMkAIXy4jay2BZMR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF1E6547B5
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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

Hi Thomas,

> Add microblaze signal-frame unwinding fix back port to gcc 15.3.0 and 16.2.0.
>
> Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Applied to master, thanks. What about gcc 14.x? The issue didn't exist?

I believe gcc 14.x needs this patch too. I just never tested gcc 14.x.

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
