Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B311D606A32E
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jqJ6x/YW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=nrQt2TEw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ECED40856;
	Thu,  5 Nov 2026 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-ATWVU-OPag; Thu,  5 Nov 2026 17:07:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA11D40825
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793898446;
	b=RVamhX8vu7TlpiitxxfDKrSdx//guCow/VQBqBlHr0XWX54asqrTKJG6GwSEMe8xQ6pW
	 trlltG/VKcSoB81FeMaLhm4CJGJJ3QcmVJiW7drgq6bwDld3mtAa3Hf6fXybxrQVBolc6
	 hfpF2oCHH9srhWXVOrTKSKYljVxeqcEubv1eyR9PnsxKkh8SJScV/TrVLKLlxVpr6Ys3M
	 GZhVZqWxTUv0JI/5pFBI0kUs3FecgNAou/ZlMyEtrQCD/JL7AOuhBg4UVKmyjd2cxs9R+
	 Y91C4duT0wDRL/EzNpwWm2QaCaFDM935tvW8sfYbBo0v2ktgAa4gG8qz+wr6zZ/ABaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793898446;
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
	bh=9X4Bx/aGkJLTnn28AJAyO+MeI0iGEriWIC3u8w3tJVU=;
	b=XpyIwSaJ7KZ5r+mOLSIKUATsAiahcsPeSqsuDLjQvzgGZ4TpzSDhzV9cfExhImhZYtnl
	 3w8FLiQATLrb5Gsafhe+u3IE3GaTW2/+kX3qHoYFPkMn2mM2qpbxc7/qWM5wQIPH5tNxm
	 fXXA97jcanhbHNVKC7SW1LjEbLrNFRFKpqP5u5NXf2rEVs0N3RggvEcJIM8ScdUmtV/jQ
	 nslmSaojNIT0reyD9axtLzmatMmxeri73zlYfrgK1MLki0ocDDLgsspT0GJYLVA3FytOE
	 acCN/2i7lt1W/0vqS0eUs0z2UL5KoDSPGa4eFnXFEMGenZmXuDQ1AYDgQ+j1w04MiMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=xes-inc.com;
	dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=nrQt2TEw;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793898446;
	bh=9X4Bx/aGkJLTnn28AJAyO+MeI0iGEriWIC3u8w3tJVU=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jqJ6x/YWfvHUr3PD0kJMoUTH4mszQCaxTTUjp0GhcsDCk1MpND5vaXjgsMt2ACA8m
	 F5X3UqIMuFPV6YCzk6FORUjFvqYhdEEk0rda86fTH23O2fkGEs5BB0Mm/hkoHBvl80
	 WIy5UIW99h/G9FBHdAThrayEXg1d3WBQXSIor/+rOr88U376aCGYfooDMnjNcXJTen
	 uHBtAkMeC0sItJy++kB9HE3xvrRhGgvNkkxJeFvJTUfOZbOYHe2JO7T73oRqYtuwIp
	 N1zBdpa4uHWSWt/17OoDNQKC0sD7I83JLBXb6HKosHJyYH6GDv/I0JJYOfV0X9o3Ju
	 biIYguNR+plZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA11D40825;
	Thu,  5 Nov 2026 17:07:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6EE235
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0C6E40825
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NI5p3i0L9qel for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 17:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 208A340807
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::62f"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::62f;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=nrQt2TEw
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on062f.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 208A340807
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiCgewnzYLjCyzutkqNBP1gqRp0BmAd6pMPmJqQRhpc=;
 b=nrQt2TEwPQf1PT4LOt990PpRA9PWENoodeW0aqE/cj9vsNY6+H1yIruWGBF5dUfLgwHF1OMKkARm88xfqStTJpZhvp1NmPPC0boupGoNdePMBnPpgHYJkgWUGAzc3NlbC6YHaRkkKXROHHXzO3371uVf82mDoX+ankn4XO+rFnzg4ey/gC4PfUocRwFO2z7ZK0Qp1OBBinfgvDgiOfIVO1YABRbLEwV9Dqj/CprSJ7bPHgpCKAJ+HyXabh7PWUuxU4PggvwBypmVNztYSBnAJvawUBM23U1Xo56qKFe/mt/06zr6EMSBtZ0Sugq+QknnHUoREL3SWVIj3G82D+9jHQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH3P110MB2607.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.29; Thu, 5 Nov
 2026 17:07:17 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0546.029; Thu, 5 Nov 2026
 17:07:17 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/python3: bump version to 3.15.2
Thread-Index: AQHdbUgcx1Vw7f9SaUqEvzcM1LMFVw==
Date: Thu, 5 Nov 2026 17:07:17 +0000
Message-ID: <PH1P110MB16038870E573ECAA4D7846F19F77A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261104220820.3290296-1-bernd@kuhls.net>
In-Reply-To: <20261104220820.3290296-1-bernd@kuhls.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH3P110MB2607:EE_
x-ms-office365-filtering-correlation-id: 39aae101-e462-4890-0988-08df3b5f3f0b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|23010399003|38070700021|261022105027099003|261009223027099003|56012099006|261009221227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|55112099003|18002099003|22082099003;
x-microsoft-antispam-message-info: lTpawUgbuxBcHeMe3K3Onw23troMl//xQ73sK88a5t0r0ZCsZ/pTLWdsg+tJgpBnoT8ifjYWfpNDFboPQbc6jo7+OB4Qk6Bb+plyj6C+AR1yNcfZ+0eVgvF8IqPBvItNXYFQuSc+lyhwI9HXzHUQ3+QKJEgPY8SpQM2wDMAlFm4fTa/umVFIaLGIp6CXKmlWUSo+RDyxatLvsPj8ZCoVofKb86OAvfLVZaXRSK17BJgx55+kukd24fSmgE5tNbpFyS+L5ovxCxOt8Fui+/9OWoY0CXUk8N31lB7FXS0n7b2CLRqy3DnXJTdUhlViHc+GBjiP1H7uNoK2Jl7m/CIUB4eihf4omq+67zORCTOoOq+xv8sf6nM7sWORcVWe88Kf+KiHxgIvq5wTLZFHu7KrH816N6qMovaMuy0drYyjCpkZy9/xg9+jgToymnj3nfOSybS4dgLCZj6MUYdrOCQomTOADJ9BxuX1FD+YqCVXDzPifR9pscIoshUKWUsTk15BWygIPlCEYCLWYLJdO6z/u5+4ziq1HI/j4dDOakzvt/kp6wpCV8vFJvIVuaObP8gPAzkIhKLv8pD2JIbp1GFXM9/yUsbxy+LLIZMzEANcf/7ZUMoaDp4SoXSnCu25sOHSL8vmqi29dw5J5EX4dXwoADN5l4Ph49p2aPQzBy2K4x8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(23010399003)(38070700021)(261022105027099003)(261009223027099003)(56012099006)(261009221227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(55112099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i8szmvH42chgMr8vHd/fZATStOK7vsnte/5dAU4z9ngfSSFfHkyoYZiNlUGv?=
 =?us-ascii?Q?1/1F1Es6LkWgEq8FiPRm9hJx+DhIg5ngpR4VsJvedxFxBcVvlZOjp4MdqO+b?=
 =?us-ascii?Q?ns4EE07vBPtA/fq1x3ooKAkd68Jj8WD9DAxrxLiXv4RLyaQkDjbC8CY8kU4B?=
 =?us-ascii?Q?s7TS8LHVi5IrlEG2+2IJMLfxqPrgg5ylalE2DrMB9zIieeo0sgT8Ym7ZmY2M?=
 =?us-ascii?Q?AUMuDpQ9Pq+H8PdSlHEVNEPEesD/XQrvAN368Du3P4WuSktf25psOuHJwgK/?=
 =?us-ascii?Q?yGDy5IPxkQmfLgp8N3dfJl51GEMXrUTsy7g/NWrAvcWunkK94i7t6Ew3Ueh6?=
 =?us-ascii?Q?CjhDd3QmFNY1abchoyD/ZWhNky+f+rqclJJpcOjIG6+6ByVWYbF/V0BjR9cW?=
 =?us-ascii?Q?Onk4FSe6BIe89PP3qMSE1/znhHlnBD6qid1w1PLBSzfNvX6sF2fKzusOAurs?=
 =?us-ascii?Q?ROHq/AonRSCtQFdURLMUGBEXdACU/T62z3rCAwa/kR9mKFl6Z2IDgb84W9ol?=
 =?us-ascii?Q?hkqm719Ymciko93tNi+ufCKP2rFnIQQktZqnbHkDmfs09dz14abepf86FR5v?=
 =?us-ascii?Q?XxayhHtHJV0K6jnwkyVWm2QwV98rNcu605vD6Q2+0VV4v4FwYVYmZUi388pM?=
 =?us-ascii?Q?CPfFotSGaoJUKzCVEZ7gbDOPKP6pf35GUhKNFazvAv9Kpe5UoYx/VzpuA3+P?=
 =?us-ascii?Q?wTRZB8RISM1bOfAFebFFFA2AqrFRr4JfzKTeCgDwk4NfJs28HShfMsA3omFM?=
 =?us-ascii?Q?PuG+Mhw+Ldy9cpAhRZpIhYeYGuuCWhvu8DY0yCJPj/WK1rk7/f3d3kOffM0Z?=
 =?us-ascii?Q?JsOok9bTQ2ncAsnAZ0q8fyDEzju1w/X+XGscEq9CJOUEv04KuWuzyPqNXI9U?=
 =?us-ascii?Q?1fIPOcHzS45tKNnYcQl9KS+C0LbhCkm5GCaBImV0w64vQx/g4aa2dkefCGPc?=
 =?us-ascii?Q?apga+bY/L/nOYjwPcHSsSLllSA9wOCyh4jBtUIOKzAbRnhctT2Ngb4xI+ScO?=
 =?us-ascii?Q?sl5YpxSqnQ3dRDmNP1YDYfVzfTBruTZsQ51biflFBdajdOQ9MZazT4kFHsHN?=
 =?us-ascii?Q?6ANW+CBfyfvcsGnhiXHAeUQmOI7ma3xMmJcmVYJiRavLCcAlMT1i8dlGpdG0?=
 =?us-ascii?Q?K+N/BSv+HqmdhPkmi42g2Kxko8S3nIqTDG0/jodcBU9nDOetgL3cKqY4ELy2?=
 =?us-ascii?Q?JVEHxBbED/C75tQ3A1l0T5xazPXA7iElxoSxG7fEciaAd8Klc6aSdV+u6QXl?=
 =?us-ascii?Q?2fnn932c5ZT4r9X7ai11b+UuDkMbwm9lfL8llta6PjJY6SnhX9dSjWCSyS6q?=
 =?us-ascii?Q?LBfKDRFuLZH5P5coBKhA65kSILPbHu7Sf1g6GunZ7pL/QlgdHSPubbqHdl/v?=
 =?us-ascii?Q?9RASAtG23W+8RtcWqO+8ZEA0tHE40+paqrfM36qjfIT3wfUqOFrcwLTN2jQF?=
 =?us-ascii?Q?Y1a19Clc2nGUPFV0KSvIsvuWlpobWvpVj4F6lwbJ9ln+FTJc6pBV7i3R9b5P?=
 =?us-ascii?Q?zhk3NKwsYRprrSEurmpWdypHcGmaxGCfT1aJ15nFlJH0ifwj0H6ai0Lckxk2?=
 =?us-ascii?Q?U3P/wN5AfbaTkOQc75ZTw8jlh9lGk5x516Mn/HcJflav6x4nPRIwZVDKzXpS?=
 =?us-ascii?Q?hqZaYM3d6hzpFaIMElmEt/RGqRqG6mM5bF50FE8WI348?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aae101-e462-4890-0988-08df3b5f3f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 17:07:17.5073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB2607
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python3: bump version to
 3.15.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_SPF_HELO,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,T_SPF_PERMERROR
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All,

> -----Original Message-----
> From: Bernd Kuhls <bernd@kuhls.net>
> Sent: Wednesday, November 4, 2026 4:08 PM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Yegor Yefremov
> <yegorslists@googlemail.com>; Vincent Fazio <vfazio@xes-inc.com>
> Subject: [External] - [PATCH v2 1/1] package/python3: bump version to 3.15.2
> 
> https://www.python.org/downloads/release/python-3150/
> https://www.python.org/downloads/release/python-3151/
> https://www.python.org/downloads/release/python-3152/
> 
> Rebased patches using --zero-commit option.
> 
> Added new configure option --enable-static-libpython-for-interpreter
> https://docs.python.org/3/using/configure.html#cmdoption-enable-static-
> libpython-for-interpreter
> as proposed by Vincent:
> https://lists.buildroot.org/pipermail/buildroot/2026-October/815406.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>

I did some minor retesting on this patch and things look ok. 

I confirmed the interpreter is statically linked against libpython with the new configure argument.

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
