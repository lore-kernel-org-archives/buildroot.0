Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8C606A33D
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DtwVsIME;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=edjIK5T5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A39406D6;
	Mon, 23 Nov 2026 17:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvJCEhUqzPRt; Mon, 23 Nov 2026 17:44:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0AB07406E1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455851;
	b=JcgCXZfSBomSc8x8RxRQ1TOlcymwzfnF32R6hyDPfStzFrtH4pxQyiIAdlizbHD4PFPt
	 tsl8SUHgm72HM7ncBO4VmivmJag7BYUgeZPa0cnQaF+ZXlw6zoztZpvV68lOkGCV8WwjD
	 wmtXrGfq+9XJlAzzWAOkKii+Od8BnReRnLG/GtLoe3pjRwjIjtUrlHZHEz6wlacPGjEqL
	 pvIm5uwhyv2VKFE2lFCnLKZ7EiV2TMF6VNJW0TyDyZ2rlEbBlhilYbAR679VLEe/Jl/0c
	 WPTaT2aB4Yj1cmdciUAydLjzmjRpj9ZNlOqqyBcVXvMyF0MFW+KLKjGw/bTnZH7IS8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455851;
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
	bh=wApaOMl4dmSU0sHE/KXRLq/NaoC02Rkqf+rcGrdJznY=;
	b=rAl/dnoOI4IDLsXBULCjYVpHWFKh4vjJOIYCXw0TxA6+ems5sKukoJ28pNLTajxArZE5
	 3WMxC5zjs10JD+FytbbXOdLb6CkyG48fa/kA2rElnv39XPvtInv3qP2nEvgz21M6Mvrnk
	 LmnH4d40sfDa6V6NnBKhxbSObwQlURBBXuwqWmxAlIbloUq2JIug+WTGkdgn3DSsTlPqw
	 bnnza5+40f8B/5wFi0qiFaPPYAy+bn4uhmH5xZBFQMWdoXbLhHYE5/7QM2f0BNErTWdJd
	 CTpXYTDrpv3RmsTuUTT7PZJqgwzO6Nx836rdWoERGM8H09ti5Ng+2+XudlEUDsHPeRw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455851;
	bh=wApaOMl4dmSU0sHE/KXRLq/NaoC02Rkqf+rcGrdJznY=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtwVsIMED1jdOSBlLMt3Uknu3BPngin2/rCkBtnUWnTwrG9JZmYNSW/sra7LPFT+O
	 XMzzAYpWOJltKehxNYZS28SkyCROpVtfhHn7ca99R3YokzPKIfC7M1BdlDp2EMVRkn
	 0B6p+ImECCaCZXUPbNE/KaKY8nzN4OmYTdLTwpxrOpJr7tuG7ff2VjGYrEO7rsfOjv
	 kt8K1EAPvi6hr1VAEo3V9mORzBzQ7O1c9eQUqYutHsuzyV4UlqNjepmo08rDhUPQ6C
	 0Co820gumKh2qpOc8M4051YCqucuSc72cP5evALnHaXpHILsOwXWmsp7jgo8H46AFW
	 8+i7TZquNcwgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB07406E1;
	Mon, 23 Nov 2026 17:44:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E6F371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 624A1806AF
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wz40c01sXrBl for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:44:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D95E080683
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::62c"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::62c;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=edjIK5T5
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on062c.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D95E080683
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5FEt2lGtCLjco9Ve4IVnE5YFSQBEJ5bZr6c2hoTZgw=;
 b=edjIK5T5gJEHBoHP4ZfwQLoaZz4aac2a9mtNVLIswv8MdYfeybEIzrPJYjKUWhAZlYZpYDhNhVVlBUCo1UJqpZqniLx09VhWpJYBDhOKsXUoMtZG8aGr7qBGk03K/YbecokoklLOTuIELmefN7a+b3Rgd24MWzL/M51pX+Gy+uwwIoQhs/enhhAs3TGrLcxsW4lCvnjXowTfYeTsPjd++sjxm/Uzxi/sAdHVCFWCyo/oBzMHNvzNyuT5xGJAx3KKCEFxQePBY1/mrNHq1KFOPbwlXjZnkb6bKcORATlq8ThscoNZNvDTBiBLAW7ru9qmFT0eghrDnFM5kVu4aOtr3Q==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH3P110MB2607.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 17:44:01 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0615.017; Mon, 23 Nov 2026
 17:44:01 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Vincent Fazio <vfazio@gmail.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>, Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/gcc: add symver attribute
 support to MicroBlaze
Thread-Index: AQHde3I5l91xPNedW0yiFxnpPzfjqA==
Date: Mon, 23 Nov 2026 17:44:01 +0000
Message-ID: <PH1P110MB16036AFF106E5B0FA361B9C89F45A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240228165300.4158751-1-vfazio@gmail.com>
 <20261123173006.2250595-1-angelo.compagnucci@gmail.com>
In-Reply-To: <20261123173006.2250595-1-angelo.compagnucci@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH3P110MB2607:EE_
x-ms-office365-filtering-correlation-id: ee3cb6b9-e2b4-4471-e825-08df49895c22
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|41320700013|366016|261022105027099003|261028144727099003|261026121527099003|261026140227099003|38070700021|4143699003|56012099006|10067099003|22082099003|18002099003|55112099003|261009223027099003;
x-microsoft-antispam-message-info: +kNGZn9v5RQ2KJp3Ewk/slwmwfsgtp0T+XxFejgCNxa9G2DBGWJJXY+GvMN2sBNoNDw7PsvtCfKX0OffisWtHCn8WvhPL1f2hmZKB4++/eljCEc+S8lrJgmZLVCQJMFQiQIpUDiFbbna/b9nO6946417IkPhS2YRU8CwmYi6EnjQfZ/YqfAkRWwEO49s/YbKf3tbY4pQRq/Z5ukY+tSDxyoXckZNdXs0xuqw5QMdjnYD7P8J3/rDArqAgrTCEkzXAsLD2B7zPr2v5lD0dVGo9wi85u3WPMwBow2OHPORQrHzj2V28wR1XJkPzBvxJu0nVlUK1HfaXvW6Baq2Rp6LRvJ0tHbzAWARJSw63e5zK6ZkGBPXrDpSkbVg6NL4Nqys5DutEZNkpcDd2euzohc8OCURSaW3/UcD/qJvMZJNLpbp7LhWA0lOJdJgttSW9P7jkoNM6QxHdXdfVIM9iNPmOMSF2TQUT90NUqsWACZ31GVESBzY4BbnzL0IqojlS+wbAykSGQxUv1TyttoqEQZPRus1GFPqIRCqKW3C5G3arh6/ucuvI3LdPezawkrtAlHuzxxQvzM/eiOQ1bqAjce4p2F95z7NruqdlBxKFE/1nyj4XLGGLA4UUszCFs7g88jRs1YTEPr9Vdenyk/kWqOz6nPRstgYJVWQoUmQmla9p47pXuN1pd2ZporVjtdE6TllNJ9tX6tQG73Wrp3zJcB04BG4TljDwzQ3BRdkcf90WWo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(41320700013)(366016)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(38070700021)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(55112099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lZ+W7X7fRLYdp2Hf9dh8NgPgLVvEX4ECFQsZauAKwzMu1VyFG26eAI8fIBbP?=
 =?us-ascii?Q?VU3vDCPhWI80qqWgR95hcjqoyaRV2+rmAtai1Sd42dtkq9sUbhMvPv5VZsqV?=
 =?us-ascii?Q?fGAcgoy8R0Q3xpub3bh+bYZrdJVkJx5VVwfOO6YakCpw/J3T2xMoRW5kMXhd?=
 =?us-ascii?Q?SGjgK7BJQhncFW5c8RBOtAdt/VIRqizUYM6FG60lCOzapoopTdYlIERV+tWa?=
 =?us-ascii?Q?5JsM36ECGyL+6nFOwM0RX+JDFLxOrMmzUgdrWDko5ibvt8o/v2yUO/U/0UvI?=
 =?us-ascii?Q?AiXRkdCPfi5ui7klRWCJFBFpXzZl0GLnTypAP39gPkWVUJnHGUwl7cYEr0GY?=
 =?us-ascii?Q?TPcjL7lJEDmgx3mhfIhrgg5LGqfKwxharcGR4qP2tQUDxvDNSWAE5f+wxpbt?=
 =?us-ascii?Q?Uodu9sBMgYxTdgiPuxmzvQE8BHauu+tERSXAeJxSk/TaCeAezkKkoy/JwDko?=
 =?us-ascii?Q?gOLq14vAbfL9j6NHv7xBvRrYG9KMbAMiyoK1v4Gk3Fj7SfOnN/XI6FArqgPZ?=
 =?us-ascii?Q?fPzAfuh1j2uGgqAU9KlozcDfurgSpp6dTdnHX9RpTZyKtG6VKEIJq5eB3Rdf?=
 =?us-ascii?Q?q6TC5+9kDSKTOwzDaTTqNR9TY+P3eE/yKlFjaIJRzOlo7SXUyHYRkdvGQNFO?=
 =?us-ascii?Q?1J+iF7g0mZif00Eapbux7M/GYXDDYn+j3iD531b+KUSXm6f7o3f6ZHF4NErf?=
 =?us-ascii?Q?6rBghaqxbGITzWK1PjeRbPH5eWXBJEjMPnRNsgG1Tq8i6FOCn7Nznv8iJUN3?=
 =?us-ascii?Q?hFxZYwL8gH22aX0AuuSveiLU7AWPQmdSxUqYkV5vvHrOPzR6rfczGKxSDxo3?=
 =?us-ascii?Q?gR75wwgs0TD7U79QguYc2LRNJUZkQ5jzAWAsc1Kw7/X0CqP4333hMw9+kbrn?=
 =?us-ascii?Q?aYMtc4cK1Q6Y/fag5h9mE1Km0qE+i4oH6V1bdpZX3IxAo0NZXS8P3ipCEBA4?=
 =?us-ascii?Q?sMZxfVj2r4XTil5HzV7lA+K8qWIG1j1IVmYFQkWSUZRhoUlvDt4viiuCfZIl?=
 =?us-ascii?Q?5TU/JPv71GKo8DOuX7y7YWh/tKy10qnQoNChi8r7CzdzG3NUi99S0xYZOtPK?=
 =?us-ascii?Q?SfM/JWhmdd2jvjNUzJO2nQLYM4vtvqRqpzkLYyDxYS3hrF6RzdRHoY1X0jr8?=
 =?us-ascii?Q?YEep7xPP4hKiJhAGgIUQ+wJPPRY+qRVUmQctl/JtBcRkg1brzXQVRMJAE0J5?=
 =?us-ascii?Q?Zvitz5ziYrEY/NY8FydOwJUdXoarbt5HU5Dk3pWYsCyCaolPKdLbyFpqx2ib?=
 =?us-ascii?Q?km3aBd1fdf8MS4r5R9l/h/IZ6U5sORmGKsl5DxP2XiSwNu6e4qKBF26SRQNl?=
 =?us-ascii?Q?2gyBLuB+HwDXobdk3Ik5VBssErF+20FSLyORepzz9F7pSU3flqn7OdF7QVTh?=
 =?us-ascii?Q?EjU51rXaa6WmlPgZFGcjENkbJrgYlEzu+Outhydsfpxm4EOYHpM38pCyhPl0?=
 =?us-ascii?Q?8dLcihtuXrrjBVG2ikfjnMjo1bcW0YkPqeyyq6JeVWwrec1O7EnnI0X4AVk/?=
 =?us-ascii?Q?LnN2P8suWloDTANK/MNZrk97JXsYejqVbjbyNt6xCUeMoYtehkCDiLU37tO2?=
 =?us-ascii?Q?/7Q+l9Iso7ESWI3f0KTY5kpH6UTnmbDtGggQKLikk5Q8CYWzZChrgjc/Pg+A?=
 =?us-ascii?Q?SaL29AVh8JIp4hzsickGREYlUe7JAHwxyfJvQ+LYXFXS?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3cb6b9-e2b4-4471-e825-08df49895c22
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 17:44:01.4874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB2607
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: add symver attribute
 support to MicroBlaze
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All,


> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Angelo
> Compagnucci
> Sent: Monday, November 23, 2026 11:30 AM
> To: buildroot@buildroot.org
> Cc: Vincent Fazio <vfazio@gmail.com>; Giulio Benetti
> <giulio.benetti@benettiengineering.com>; Romain Naour
> <romain.naour@gmail.com>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Neal Frager <neal.frager@amd.com>; Ibai
> Erkiaga <ibai.erkiaga-elorza@amd.com>
> Subject: [External] - Re: [Buildroot] [PATCH 1/1] package/gcc: add symver
> attribute support to MicroBlaze
> 
> Hi Vincent,
> 
> On 28/02/24 17:53, Vincent Fazio wrote:
> > By adding symver support, there should no longer be any need to patch
> > packages to account for this architecture quirk.
> 
> I think this patch can be dropped:
> 
> 1. GCC 11.4.0, 12.3.0 and 13.2.0 are gone: master has 14.4.0, 15.3.0
>    and 16.2.0.
> 2. The affected packages now handle MicroBlaze themselves: attr 2.6.0
>    and libkcapi 1.5.0 check the symver attribute in configure, xz
>    5.8.4 disables it on MicroBlaze. Buildroot dropped its attr patch
>    in c804ebff55 ("package/attr: security bump version to 2.6.0").
> 3. The GCC change is not upstream, and upstream GCC still lacks
>    symver support for MicroBlaze.

IMO working around this for every package is not the best long term solution. 

I have, admittedly, failed to upstream the patch to GCC in the past 3 years. When I sent an email to the list [0][1], they seemed opened to the idea however.

There was discussion about refactoring MicroBlaze to use elfos.h but that's a much bigger change than the minimum needed here.

I don't necessarily need to be the one to carry this across the finish line, however. 

If the maintainers are willing to continue rediscovering this issue for new packages and fixing it similarly, it seems fine to drop this.

[0]: https://gcc.gnu.org/pipermail/gcc/2023-February/240747.html
[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
