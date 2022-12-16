Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE20C4167B
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C966076C;
	Fri, 16 Dec 2022 17:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90C966076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaSRD9acAv0y; Fri, 16 Dec 2022 17:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F8E60B2F;
	Fri, 16 Dec 2022 17:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67F8E60B2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A11BA1BF2CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BB0C410CC
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB0C410CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_1M4PlJj2Fw for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:18:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FECB410A1
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FECB410A1
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:18:43 +0000 (UTC)
Received: from mail-vi1eur05lp2174.outbound.protection.outlook.com
 ([104.47.17.174]:18537 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6ELz-0001um-19;
 Fri, 16 Dec 2022 18:18:35 +0100
Received: from AS9PR06CA0150.eurprd06.prod.outlook.com (2603:10a6:20b:467::16)
 by VE1PR06MB6846.eurprd06.prod.outlook.com (2603:10a6:800:1ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 17:18:32 +0000
Received: from VI1EUR05FT011.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::bb) by AS9PR06CA0150.outlook.office365.com
 (2603:10a6:20b:467::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 17:18:32 +0000
X-SASI-Hits: BODY_SIZE_10000_PLUS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 ECARD_KNOWN_DOMAINS 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000,
 MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000,
 __ANY_URI 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __AUTH_RES_ORIG_DKIM_NONE 0.000000, __AUTH_RES_ORIG_DMARC_NONE 0.000000,
 __BODY_NO_MAILTO 0.000000, __BOUNCE_CHALLENGE_SUBJ 0.000000,
 __BOUNCE_NDR_SUBJ_EXEMPT 0.000000, __BULK_NEGATE 0.000000,
 __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000,
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000,
 __CP_URI_IN_BODY 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FILESHARE_PHRASE 0.000000,
 __FRAUD_BODY_WEBMAIL 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FRAUD_WEBMAIL 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HTTPS_URI 0.000000, __IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __MULTIPLE_URI_TEXT 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __STOCK_PHRASE_7 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
 __TO_REAL_NAMES 0.000000, __URI_ENDS_IN_SLASH 0.000000,
 __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000,
 __URI_NO_WWW 0.000000, __URI_NS 0.000000, __URI_WITH_PATH 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.1, AntispamData: 2022.12.16.163917
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 VI1EUR05FT011.mail.protection.outlook.com (10.233.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16 via Frontend Transport; Fri, 16 Dec 2022 17:18:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.108)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Fri, 16 Dec 2022 17:18:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhYXpbYh/yuk3uBPSKHJrNJ8kdbLGxqznMbVgUNotSqgQErDt2hmvRB2gGW7wruoi0cDFcYlDjHA/GsUfbesrdC4PE7XcopDX/rtBM0uxNMu84q6F6F/hBYYLDJMZoXumrb+tS6RvcSIGz0pDnLXmDfic6T7E36iMvXWIsEBum8jqmz4uV09H3H17zmsyYdAy1n/99axkjSFhehOgug4zeSrBKiAha4U67TnYiFLkUT7rd+WYybiLtTw7elnsXU4wONlFhbc5V7fk2+Oq93H5GKg2p2k4xmX2UFWy1U/0/tdTgjJYldAuFQ6DVxKrxWv51rbfCFOmYdk1JKUmQgt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxfbN+21CE58NP8fusBD1FBw+K7uMpe3KTbkcDn5VQo=;
 b=YBwlSImvqG9xrn2E8ejHjppGkWzYpl4efxw+2eLnx+dpJyoAOQ5S/M/gi134UGuo1/nnvN4zZvhRyx8/BhbxX7YtDDxx0SHQsExrEGOtbAbF+DdpWOgJC4AueBqYtKg2TpCaT04FURYAu8zmIiU0VgPvxuufp7DbQBridAMlePKmBRfHwy3hNJBTQlJH+xskr1PGt3btGIYxVY+HOLD3KHHyKkv/lKwXxF3AXyWbzg1AMlFKuzAFzEKik0AR2QXajWA+6XOWF/YhzLoGRISdQjM1QKQCaMcXXYpXpc7EjQKqXOi9TjBk3PsCnPX7A96A3Gk4pVhK5ntTMV10VMDyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM0PR06MB4067.eurprd06.prod.outlook.com (2603:10a6:208:b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:18:29 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:18:29 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1Md+T4bAv4oxUq3lcM07CUUVK5w3byQ
Date: Fri, 16 Dec 2022 17:18:29 +0000
Message-ID: <AM5PR06MB3153258952988B9F8B96E76F84E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-8-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-8-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|AM0PR06MB4067:EE_|VI1EUR05FT011:EE_|VE1PR06MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 586c0705-a8bb-48ad-48c4-08dadf898e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3QotmBfWeHmHnFS8NW5MGqgY5LEf1/oqRG4LQzxawJ6Fib/+kEP7DZ54oAQ/EREKIq7S1KEN0z9RAy4QO2USK9DYLCuLwnQwanvGRGOqJuQfdPn7jV0wuoiROw+RalDp9xHFXVpl25DgGhIZE9a968MdfDuzPhzb8AOVc0LAAWmahvWeZoglxMu4oRMpqTHxqL2wRXGyX1/Uwzu1DsRC1uSzCTVc4o0hwlDkYP1J9i+ITvVb78cuWZcckN7nibRuUvnlVVDjvvL7mhBhlGrmiybZ27rLg/2EZSZjeBkJL8aifANNlApaOVvsocz6jZRAcH/Fy++WP/wATlEVpa+47E2deKv6PiBtUMfALH4jm58iDvK2xSBI5goEKMA9CbgGBrU0psiwgVXwBGAlB8iHGZi/N3E8DAT2z9+Jma0gYJ04u4w/F1dHP+UsD/N2gjQJxPu5MkWiitldVGQBy3Hnx3ikWSTWv3vtGQ4w6zDW6ZelQJhiFxXNUrKdYrtg8Fn57jrfIX66Rpk59EMDgIoiPr2S91zfOdLPgORjdlfvXUHOcLruocp60Zg7fb2MsakyJ1BpdOo9GpTd0O7FmrZQUpjN2Ogitf+dyJYth0aj1hffZbEa2vao7kdSI+hoG3ObdvTScXsV1+bwdK4sts29J2/uFKkrgkwPYejp6+7Mesmql76buzzq3+L3THlFCDdMu2uS9OcFHNazjuOLtAH5p4M+umyg6zACe4A+BDVDO4g=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(366004)(396003)(346002)(376002)(451199015)(122000001)(26005)(2906002)(30864003)(83380400001)(478600001)(38070700005)(52536014)(86362001)(316002)(19627235002)(41300700001)(5660300002)(8936002)(91956017)(66446008)(66476007)(55016003)(66556008)(38100700002)(6916009)(33656002)(9686003)(76116006)(64756008)(53546011)(54906003)(186003)(66946007)(71200400001)(8676002)(7696005)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4067
X-CodeTwo-MessageID: 11fb2f9a-9f7a-4f60-a050-85f2fadd25f0.20221216171830@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a2b4c981-1a58-456f-1181-08dadf898ccb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZMtIom+6nfxZJlyy0lJjUdt9zrTqyJjy2tTcxnH7OtyDr8qvbkcXPie31EzHmNU1GBb74fEoeY90oiwdWWCYZAtU+sNIyWJNZ71wNS3f/QUyWQccR7g3u125Tl5pBI0okFt+RMQvCtuRJxKaaZ1TaqnbJusxnb3HmiThIMzTeyOl30zhwQAQi70SerGfpRNiTCQKV9TuYoJFFqoWPJW3TjZV+qsTBPjHzEVtVA1M4MUPad8+fXUKSY1ukCu5BMnxAiEav6buCXugYWBxW5jl6XRRNGUTm2BO+c61oKnzHvyTG3v/r9FtsaWc04132NQzXdlCUK02aQfm2nb2ZPmgYqacPAq4HHkk8bO6qhFiEXXBH5QJY+0Q5WO5LfSiVlU8N+1yINq9pRdWu2TSalvJVx+NvjmLNzEGRJ5CwkmlMCeOQ7mKViaxb0FCmjtjnxUQBvOX2HZTasroX7sn2Wn+PRT+h/ZorJP+0ETXR3c9PE1M08f03tcaLr2jJC8tdV4ck0xAseqyMwinwomZdv1GoIECyGqNMnPV9xofXvUFx7sBIUAFu7hvG5z9SiGwUiw8ka3VhN17s2PzVd/huq31wsnJE+zvdXAv7hG28Y2V2sjxwFg9ioYzYhDXuWoF6JRMExsJdf5a4Rcy/73jr8qh0BTaY7sVxdmib05mcAXhnVycYj1sfy1d2jcaHbhqclKK0OE4e+Qdmfz16PGW/nUEg==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39840400004)(136003)(451199015)(36840700001)(46966006)(82310400005)(2906002)(7696005)(8676002)(4326008)(47076005)(36860700001)(41300700001)(30864003)(70206006)(86362001)(54906003)(478600001)(6916009)(8936002)(70586007)(52536014)(5660300002)(316002)(19627235002)(83380400001)(7636003)(356005)(7596003)(33656002)(53546011)(6506007)(336012)(186003)(55016003)(9686003)(40480700001)(26005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:18:32.0249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586c0705-a8bb-48ad-48c4-08dadf898e92
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6846
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 8/8] package/tensorflow-lite: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0514971067642822953=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============0514971067642822953==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----5C385E9D48BE7EC7B0CB0AF28FD58259"

This is an S/MIME signed message

------5C385E9D48BE7EC7B0CB0AF28FD58259
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Acked-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Monday, November 28, 2022 18:58=0A=
To: buildroot@buildroot.org <buildroot@buildroot.org>=0A=
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Fabrice Fontaine <font=
aine.fabrice@gmail.com>; Samuel Martin <s.martin49@gmail.com>; Hager Stefan=
 <Stefan.Hager@ginzinger.com>; James Hilliard <james.hilliard1@gmail.com>=
=0A=
Subject: [PATCH v2 8/8] package/tensorflow-lite: new package =0A=
=A0=0A=
From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
This package adds the tensorflow lite runtime to buildroot.=0A=
=0A=
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
Changes v1 -> v2:=0A=
=A0 - fix label_image build=0A=
=A0 - more explicit cmake config=0A=
---=0A=
=A0package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +=0A=
=A0.../0001-lite-Update-CMakeLists.txt.patch=A0=A0=A0=A0 | 49 +++++++++++++=
++++++=0A=
=A0.../0002-Fix-FindFlatBuffers-cmake-file.patch | 37 ++++++++++++++=0A=
=A0...ink-tensorflow-lite-against-gemmlowp.patch | 32 ++++++++++++=0A=
=A0package/tensorflow-lite/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | =
32 ++++++++++++=0A=
=A0package/tensorflow-lite/tensorflow-lite.hash=A0 |=A0 4 ++=0A=
=A0package/tensorflow-lite/tensorflow-lite.mk=A0=A0=A0 | 49 +++++++++++++++=
++++=0A=
=A07 files changed, 204 insertions(+)=0A=
=A0create mode 100644 package/tensorflow-lite/0001-lite-Update-CMakeLists.t=
xt.patch=0A=
=A0create mode 100644 package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmak=
e-file.patch=0A=
=A0create mode 100644 package/tensorflow-lite/0003-Don-t-link-tensorflow-li=
te-against-gemmlowp.patch=0A=
=A0create mode 100644 package/tensorflow-lite/Config.in=0A=
=A0create mode 100644 package/tensorflow-lite/tensorflow-lite.hash=0A=
=A0create mode 100644 package/tensorflow-lite/tensorflow-lite.mk=0A=
=0A=
diff --git a/package/Config.in b/package/Config.in=0A=
index a59d074430..c979710f32 100644=0A=
--- a/package/Config.in=0A=
+++ b/package/Config.in=0A=
@@ -2105,6 +2105,7 @@ endif=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/sphinxbase/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/startup-notification/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/tbb/Config.in"=0A=
+=A0=A0=A0=A0=A0=A0 source "package/tensorflow-lite/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/tinycbor/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/tz/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/tzdata/Config.in"=0A=
diff --git a/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch =
b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch=0A=
new file mode 100644=0A=
index 0000000000..53b5170681=0A=
--- /dev/null=0A=
+++ b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch=0A=
@@ -0,0 +1,49 @@=0A=
+From 081c2e4e3cf021efb2853a485a18b563e88f6117 Mon Sep 17 00:00:00 2001=0A=
+From: Terry Heo <terryheo@google.com>=0A=
+Date: Tue, 1 Nov 2022 15:55:30 -0700=0A=
+Subject: [PATCH] lite: Update CMakeLists.txt=0A=
+=0A=
+This changes are needed to build kernel tests.=0A=
+=0A=
+PiperOrigin-RevId: 485439972=0A=
+=0A=
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
+[james.hilliard1@gmail.com: backport from upstream commit=0A=
+081c2e4e3cf021efb2853a485a18b563e88f6117]=0A=
+---=0A=
+ tensorflow/lite/CMakeLists.txt | 7 ++++++-=0A=
+ 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt=0A=
+index 9dfbb4b72f3..fd8b3faf1e2 100644=0A=
+--- a/tensorflow/lite/CMakeLists.txt=0A=
++++ b/tensorflow/lite/CMakeLists.txt=0A=
+@@ -209,6 +209,9 @@ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tflite_with_x=
nnpack\\.cc$")=0A=
+ # Exclude Flex related files.=0A=
+ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*with_selected_ops\\.cc$")=0A=
+ =0A=
++# Exclude tensorflow_profiler_logger files.=0A=
++list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tensorflow_profiler_logger\\.cc$=
")=0A=
++=0A=
+ if(_TFLITE_ENABLE_MMAP)=0A=
+=A0=A0 list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation_disabled\\=
.cc$")=0A=
+ else()=0A=
+@@ -222,6 +225,7 @@ if(NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")=0A=
+ endif()=0A=
+ populate_tflite_source_vars("core" TFLITE_CORE_SRCS)=0A=
+ populate_tflite_source_vars("core/api" TFLITE_CORE_API_SRCS)=0A=
++populate_tflite_source_vars("core/c" TFLITE_CORE_C_SRCS)=0A=
+ populate_tflite_source_vars("c" TFLITE_C_SRCS)=0A=
+ populate_tflite_source_vars("delegates" TFLITE_DELEGATES_SRCS)=0A=
+ if(TFLITE_ENABLE_GPU)=0A=
+@@ -483,6 +487,7 @@ endif()=0A=
+ # TFLite library=0A=
+ set(_ALL_TFLITE_SRCS=0A=
+=A0=A0 ${TFLITE_CORE_API_SRCS}=0A=
++=A0 ${TFLITE_CORE_C_SRCS}=0A=
+=A0=A0 ${TFLITE_CORE_SRCS}=0A=
+=A0=A0 ${TFLITE_C_SRCS}=0A=
+=A0=A0 ${TFLITE_DELEGATES_FLEX_SRCS}=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.pa=
tch b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch=0A=
new file mode 100644=0A=
index 0000000000..e97bb3e52f=0A=
--- /dev/null=0A=
+++ b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch=0A=
@@ -0,0 +1,37 @@=0A=
+From a4ff4b5e952a22906ac0ed01e73f84f42926c325 Mon Sep 17 00:00:00 2001=0A=
+From: James Hilliard <james.hilliard1@gmail.com>=0A=
+Date: Thu, 24 Nov 2022 14:29:06 -0700=0A=
+Subject: [PATCH] Fix FindFlatBuffers cmake file=0A=
+=0A=
+Capitalization needs to match for system cmake override to work:=0A=
+https://github.com/google/flatbuffers/blob/v22.11.23/CMake/FindFlatBuffers=
.cmake=0A=
+=0A=
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
+[Upstream status:=0A=
+https://github.com/tensorflow/tensorflow/pull/58677]=0A=
+---=0A=
+ tensorflow/lite/CMakeLists.txt=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-=0A=
+ .../modules/{FindFlatbuffers.cmake =3D> FindFlatBuffers.cmake}=A0=A0=A0 |=
 0=0A=
+ 2 files changed, 1 insertion(+), 1 deletion(-)=0A=
+ rename tensorflow/lite/tools/cmake/modules/{FindFlatbuffers.cmake =3D> Fi=
ndFlatBuffers.cmake} (100%)=0A=
+=0A=
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt=0A=
+index f9c30d6a046..c2ee9edfb61 100644=0A=
+--- a/tensorflow/lite/CMakeLists.txt=0A=
++++ b/tensorflow/lite/CMakeLists.txt=0A=
+@@ -143,7 +143,7 @@ find_package(absl REQUIRED)=0A=
+ find_package(Eigen3 REQUIRED)=0A=
+ find_package(farmhash REQUIRED)=0A=
+ find_package(fft2d REQUIRED)=0A=
+-find_package(Flatbuffers REQUIRED)=0A=
++find_package(FlatBuffers REQUIRED)=0A=
+ find_package(gemmlowp REQUIRED)=0A=
+ find_package(NEON_2_SSE REQUIRED)=0A=
+ find_package(cpuinfo REQUIRED)=A0 #CPUINFO is used by XNNPACK and RUY lib=
rary=0A=
+diff --git a/tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake b/t=
ensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake=0A=
+similarity index 100%=0A=
+rename from tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake=0A=
+rename to tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-agains=
t-gemmlowp.patch b/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-=
against-gemmlowp.patch=0A=
new file mode 100644=0A=
index 0000000000..dbee9942b3=0A=
--- /dev/null=0A=
+++ b/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemml=
owp.patch=0A=
@@ -0,0 +1,32 @@=0A=
+From fb584589f707853d85a081c99b1b82598c2631c1 Mon Sep 17 00:00:00 2001=0A=
+From: James Hilliard <james.hilliard1@gmail.com>=0A=
+Date: Thu, 24 Nov 2022 15:10:27 -0700=0A=
+Subject: [PATCH] Don't link tensorflow-lite against gemmlowp=0A=
+=0A=
+We can't link against gemmlowp as it is a header only library.=0A=
+=0A=
+Fixes:=0A=
+/bin/ld: cannot find -lgemmlowp: No such file or directory=0A=
+=0A=
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
+[Upstream status:=0A=
+https://github.com/tensorflow/tensorflow/pull/58678]=0A=
+---=0A=
+ tensorflow/lite/CMakeLists.txt | 1 -=0A=
+ 1 file changed, 1 deletion(-)=0A=
+=0A=
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt=0A=
+index f9c30d6a046..3fe5ed15605 100644=0A=
+--- a/tensorflow/lite/CMakeLists.txt=0A=
++++ b/tensorflow/lite/CMakeLists.txt=0A=
+@@ -560,7 +560,6 @@ target_link_libraries(tensorflow-lite=0A=
+=A0=A0=A0=A0 farmhash=0A=
+=A0=A0=A0=A0 fft2d_fftsg2d=0A=
+=A0=A0=A0=A0 flatbuffers::flatbuffers=0A=
+-=A0=A0=A0 gemmlowp=0A=
+=A0=A0=A0=A0 ruy::ruy=0A=
+=A0=A0=A0=A0 pthreadpool=0A=
+=A0=A0=A0=A0 ${CMAKE_DL_LIBS}=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Co=
nfig.in=0A=
new file mode 100644=0A=
index 0000000000..9231d674bd=0A=
--- /dev/null=0A=
+++ b/package/tensorflow-lite/Config.in=0A=
@@ -0,0 +1,32 @@=0A=
+config BR2_PACKAGE_TENSORFLOW_LITE=0A=
+=A0=A0=A0=A0=A0=A0 bool "tensorflow-lite"=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_TOOLCHAIN_USES_GLIBC=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_INSTALL_LIBSTDCPP=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_TOOLCHAIN_HAS_THREADS=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_SHARED_LIBS=0A=
+=A0=A0=A0=A0=A0=A0 depends on ( BR2_arm && BR2_ARM_CPU_ARMV7A ) || ( BR2_a=
arch64 && BR2_ARM_CPU_ARMV8A )=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_CPUINFO=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_EIGEN=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_FARMHASH=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_FFT2D=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_FLATBUFFERS=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_GEMMLOWP=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_LIBABSEIL_CPP=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_NEON_2_SSE=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_RUY=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 Tensorflow Lite dynamic library and headers: Infe=
rence engine to run previously trained machine learning models.=0A=
+=0A=
+comment "tensorflow-lite needs needs a toolchain w/ gcc >=3D 9"=0A=
+=A0=A0=A0=A0=A0=A0 depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9=0A=
+=0A=
+comment "tensorflow-lite needs a toolchain w/ glibc, C++, threads"=0A=
+=A0=A0=A0=A0=A0=A0 depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LI=
BSTDCPP || \=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !BR2_TO=
OLCHAIN_HAS_THREADS=0A=
+=0A=
+comment "tensorflow-lite needs a toolchain w/ shared libraries"=0A=
+=A0=A0=A0=A0=A0=A0 depends on !BR2_SHARED_LIBS=0A=
+=0A=
+comment "tensorflow-lite in buildroot currently only supports arm + armv7a=
 cpu or arm64 + armv8a cpu targets"=0A=
+=A0=A0=A0=A0=A0=A0 depends on ( BR2_arm && !BR2_ARM_CPU_ARMV7A ) || ( BR2_=
aarch64 && !BR2_ARM_CPU_ARMV8A) || (!BR2_arm && !BR2_aarch64)=0A=
diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/tensorf=
low-lite/tensorflow-lite.hash=0A=
new file mode 100644=0A=
index 0000000000..7d9035707b=0A=
--- /dev/null=0A=
+++ b/package/tensorflow-lite/tensorflow-lite.hash=0A=
@@ -0,0 +1,4 @@=0A=
+# Locally calculated=0A=
+sha256=A0 99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc92dac48=
=A0 tensorflow-lite-2.11.0.tar.gz=0A=
+# License files, locally calculated=0A=
+sha256=A0 71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1aec65=
=A0 LICENSE=0A=
diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorflo=
w-lite/tensorflow-lite.mk=0A=
new file mode 100644=0A=
index 0000000000..1f75f3813c=0A=
--- /dev/null=0A=
+++ b/package/tensorflow-lite/tensorflow-lite.mk=0A=
@@ -0,0 +1,49 @@=0A=
+##########################################################################=
######=0A=
+#=0A=
+# tensorflow-lite=0A=
+#=0A=
+##########################################################################=
######=0A=
+=0A=
+TENSORFLOW_LITE_VERSION =3D 2.11.0=0A=
+TENSORFLOW_LITE_SITE =3D=A0 $(call github,tensorflow,tensorflow,v$(TENSORF=
LOW_LITE_VERSION))=0A=
+TENSORFLOW_LITE_INSTALL_STAGING =3D YES=0A=
+TENSORFLOW_LITE_LICENSE =3D Apache-2.0=0A=
+TENSORFLOW_LITE_LICENSE_FILES =3D LICENSE=0A=
+TENSORFLOW_LITE_SUBDIR =3D tensorflow/lite=0A=
+TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD =3D NO=0A=
+TENSORFLOW_LITE_DEPENDENCIES +=3D \=0A=
+=A0=A0=A0=A0=A0=A0 host-pkgconf \=0A=
+=A0=A0=A0=A0=A0=A0 host-flatbuffers \=0A=
+=A0=A0=A0=A0=A0=A0 cpuinfo \=0A=
+=A0=A0=A0=A0=A0=A0 eigen \=0A=
+=A0=A0=A0=A0=A0=A0 farmhash \=0A=
+=A0=A0=A0=A0=A0=A0 fft2d \=0A=
+=A0=A0=A0=A0=A0=A0 flatbuffers \=0A=
+=A0=A0=A0=A0=A0=A0 gemmlowp \=0A=
+=A0=A0=A0=A0=A0=A0 libabseil-cpp \=0A=
+=A0=A0=A0=A0=A0=A0 neon-2-sse \=0A=
+=A0=A0=A0=A0=A0=A0 ruy=0A=
+=0A=
+TENSORFLOW_LITE_CONF_OPTS =3D \=0A=
+=A0=A0=A0=A0=A0=A0 -Dabsl_DIR=3D$(STAGING_DIR)/usr/lib/cmake/absl \=0A=
+=A0=A0=A0=A0=A0=A0 -DBUILD_SHARED_LIBS=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DCMAKE_CXX_FLAGS=3D"$(TARGET_CXXFLAGS) -I$(STAGING_DIR=
)/usr/include/gemmlowp" \=0A=
+=A0=A0=A0=A0=A0=A0 -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DEigen3_DIR=3D$(STAGING_DIR)/usr/share/eigen3/cmake \=
=0A=
+=A0=A0=A0=A0=A0=A0 -DFARMHASH_SOURCE_DIR=3D$(FARMHASH_DIR) \=0A=
+=A0=A0=A0=A0=A0=A0 -Dfarmhash_DIR=3D$(STAGING_DIR)/usr/lib \=0A=
+=A0=A0=A0=A0=A0=A0 -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DFETCHCONTENT_QUIET=3DOFF \=0A=
+=A0=A0=A0=A0=A0=A0 -DFFT2D_SOURCE_DIR=3D$(STAGING_DIR)/usr/include/fft2d \=
=0A=
+=A0=A0=A0=A0=A0=A0 -DFlatBuffers_DIR=3D$(STAGING_DIR)/usr/lib/cmake/flatbu=
ffers \=0A=
+=A0=A0=A0=A0=A0=A0 -DNEON_2_SSE_DIR=3D$(STAGING_DIR)/usr/lib/cmake/NEON_2_=
SSE \=0A=
+=A0=A0=A0=A0=A0=A0 -DTFLITE_ENABLE_EXTERNAL_DELEGATE=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DTFLITE_ENABLE_GPU=3DOFF \=0A=
+=A0=A0=A0=A0=A0=A0 -DTFLITE_ENABLE_INSTALL=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DTFLITE_ENABLE_MMAP=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DTFLITE_ENABLE_NNAPI=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DTFLITE_ENABLE_RUY=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DTFLITE_ENABLE_XNNPACK=3DOFF=0A=
+=0A=
+$(eval $(cmake-package))=0A=
-- =0A=
2.34.1=0A=

------5C385E9D48BE7EC7B0CB0AF28FD58259
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIISDQYJKoZIhvcNAQcCoIIR/jCCEfoCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGggg7BMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkq
hkiG9w0BAQsFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5j
MRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBB
c3N1cmVkIElEIFJvb3QgRzIwHhcNMTkwOTIzMTIyNTMyWhcNMzQwOTIzMTIyNTMy
WjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQL
ExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1cmVkIElE
IENsaWVudCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOqx
Ra06rLwKBvrDb/qQ8RtXfeKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln
4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeGvJoT0LS5t/zXeUcbMuDFWgyj33kiesnu
usnOWvpISoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9kKvHQvHC4x2u7wYv5+NX
jnbOhJS/1NjGq+ugLMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrgunsrYj9w
gfW7XuhAi2j0y5d9oMT0SuVeKFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8Rp
Lt05WI2G2RNVVlHYaU0CAwEAAaOCAgQwggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5et
I4814lRsqX75TjAfBgNVHSMEGDAWgBTOw0q5mVXyuNtgv6l+vVa1lzan1jAOBgNV
HQ8BAf8EBAMCAYYwTAYDVR0lBEUwQwYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEE
AYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUwEgYDVR0T
AQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3Js
My5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNV
HSAEgcYwgcMwgcAGBFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRp
Z2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBD
ZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5n
IFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0
LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQCo3MAIqR0kekGYrC7
0EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJdgkASGsI
NabAfY2ljUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fj
CMf4NMWLUC8TqotnnrKNuw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2V
joECzez2y/1IVTPlh57zBfjHJQFqLWzHdou8M+ucdJtr2swXII6s3nkq4pfEn7Kn
bzMS9quFSuyOGILcg/3qVwaHNLM5R+8nB5gPI5+u5Uh56w1i+9Ds1pjYAiTHdeUw
ggOWMIICfqADAgECAhALkxw61jln6mcjv8OvmvRLMA0GCSqGSIb3DQEBCwUAMGUx
CzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3
dy5kaWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9v
dCBHMjAeFw0xMzA4MDExMjAwMDBaFw0zODAxMTUxMjAwMDBaMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2Vy
dC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANnnKC9SPzZySYiTNPP4ah4xVICf
rVRBtUfflqjUr4AtuQrPdf2JpX0k+uMiDCu8lRcLM78ZTUEGkAC9DE0Q/ge15xxu
IlUxZZe90xfSHmLz2+psUIw/hAyWz7fLA+DKbaEUTBuJ3e0AsFJ8r5FssTgT0ekS
CMAAsBwrEdp3cDabrs55h9yCcOYJdHBVaa+jaJ+/3bZ5s/KdcClV9Kv/lWHzyUBv
HdG+k7vTiCq7nb9yWlZxOz/U89EK/ijvo+7Zma8D049gt/KSobG9iYkfMM3Dpi5i
M64WAndEWueBCjynRC55uD8EvFygh+Ebr1GOzews+vj+bfA6fKqL5GeVMY0CAwEA
AaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0OBBYE
FM7DSrmZVfK422C/qX69VrWXNqfWMA0GCSqGSIb3DQEBCwUAA4IBAQDKpVWM48hB
bmknp3UR7zyGNm/SncZ4OB1plqKSaS44bJt9BNSJpbExN4rJIcyrbM2LHJrWv0jS
MmbBisDzLzrvwOPUkYbRUOMD23N3b0o5U+3eJse1fa8rQtF1YuNKKwLHUEvgaeKW
bA5EZhBEj60F6/h5rKYb6Dc0nVPJYaqiUq9KcBaGwjrIsRNwNtjP7vQKNNVbTP0H
nKK62QFyXPNNwd0OsRwNxGO+rfQU+4nsokEOTMzIV0DQbgOqzQyOiZmZbPA8MK84
32+8o74pICerdP8TInjel1JVHoO1VCAD7q7AT1beN8zDf6oEJ7vTd7hi2xd8nCgi
E3Nszyb1iinnMIIFwDCCBKigAwIBAgIQDGW+hPuss5Tc1j96Q5g6rTANBgkqhkiG
9w0BAQsFADBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkw
FwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1
cmVkIElEIENsaWVudCBDQSBHMjAeFw0yMjEwMDcwMDAwMDBaFw0yNTEwMDcyMzU5
NTlaMFAxIzAhBgNVBAMMGnN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tMSkwJwYJ
KoZIhvcNAQkBFhpzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbTCCAaIwDQYJKoZI
hvcNAQEBBQADggGPADCCAYoCggGBALLxSkM9EsxkQXXj3kZ/6dJOhNoLOTjKGQW1
ddcuYyOhaOFAlwTiWOJsF+zupjR6cNzNorR8PZfAYjdrE3L8ROzQy1+HpJnOF0a7
gXgjF+AwyHz5Cuu083jZAaCw/csVTrQZe9T0a8/b2g+MUUhmvlfo7jMby0TiV4eE
AUe3X3COMvna1i9j9Uk2QruwgrfZsG/tG6IEUBKyjcRBbh76LuFym6tKum+dQxMG
RxuQ8KzthVoSndJ4uWL9yZz6/03yTSknRaS1qlwEDsThZ8M642/feqQ1dg4t+0P6
OKGYz40Lln6KtCE+f8WMjwZ0zwVzylCdXxYGDuo7vkMTlbkrzg4vl3U8Sxm8uwVO
tx6mVxkXWfUMJ6pAjmHVgvwIDpvFlXQChoMB+fNx9MtxGRB/x4bvbruvvcMg3HsR
b+nzQPQhTRmZ5Tnv/d88Wlriby3pZtz+jkk0/eNEbiJsV4FFE15VMhvdnqB9u8c1
WQjk5k/4VNUtzxvuGAi3JcTWWfSrywIDAQABo4IB+jCCAfYwHwYDVR0jBBgwFoAU
pWIgUNy7W1eXrSOPNeJUbKl++U4wHQYDVR0OBBYEFBKUfzpvibxxH4xLryC37QDB
TEu0MAwGA1UdEwEB/wQCMAAwJQYDVR0RBB4wHIEac3RlZmFuLmhhZ2VyQGdpbnpp
bmdlci5jb20wDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggr
BgEFBQcDAjBDBgNVHSAEPDA6MDgGCmCGSAGG/WwEAQEwKjAoBggrBgEFBQcCARYc
aHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBiwYDVR0fBIGDMIGAMD6gPKA6
hjhodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURDbGll
bnRDQUcyLmNybDA+oDygOoY4aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lD
ZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcmwwfQYIKwYBBQUHAQEEcTBvMCQGCCsG
AQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wRwYIKwYBBQUHMAKGO2h0
dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENsaWVu
dENBRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBIPYM+hSk3JsrbTSvw969Hyo0q
5+maixbUrVPlQdS+4brWiFdcKLOEhmqliUVeuEYIpstCSf+jRtuupI7m5EnIwf6s
aiGxHcLmC/BZ7C7eIXGUx3eYDzZ0aqyXnmzo+WYSHnIhUeVRJMmzIOgLOqfiOdGI
slKn5jrR8AgHpc3KO0p4yATSp9f0X6V7RSXuxL56BRzsponJiPkUu5ZlIUlvkXpQ
8FHSRqgAZU+h7lkXDUfpXB3pMRqpWUdPTFfLVGOfnfVAzoq1227xYYnb7NgcLbCw
tQDB/J7BifTyjx203oQ2Pqw2FbSYNFIKyyc9gDEMAh7+RVEY6Bj05nR+UjN7MYID
EDCCAwwCAQEwfjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5j
MRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBB
c3N1cmVkIElEIENsaWVudCBDQSBHMgIQDGW+hPuss5Tc1j96Q5g6rTANBglghkgB
ZQMEAgEFAKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yMjEyMTYxNzE4NDFaMC8GCSqGSIb3DQEJBDEiBCDJQoEpQdxxCEmGYJKz
pZo3GpvTs3wDhApCO7O0tsF5uTB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYBKGb5vzf8Sqf3B6y5+G7sTpkTuTYC1tuSzGiY4f2GY
JRrmZpqqO+TRJ3v+zaZSR1RbXlgoISq0wCXsqsPVEJjHB1eIYiDHTdQetq+D5N1U
Jnw+xGYwxH7hn0J511eZs8oCY8lUmwVwAY8mTW+J9vMEelKEgEfgNaVwcNNfJEVf
X9PXbrJSpRMvoHR8Sfj+GE9ynV4N3piRDMqaG78mo1k0qabWi0puS6of4E2a906p
P9cEwEMgAy2MsikSLUqN1mmivN6ZeS4rt/ErO0AMkOC6YhSOUv639goZm2vThll8
QZTknyK3TBx2TNKb/wXtKTUbsYXGCV4lGpS0B81Q1bZQP1ipujVk+WEvhhkd08sI
d/2pZUP6ZRg2KVVQWCVNi1gQRkvreMNNu1ph/DrQTNri6Lg3x41Kkz/vKSP/eF5/
PRZRW3zan4LyvZNKBlZJvUssoDBzI/sU5g+qjoOzH+h4TdEwU5UXrBKOy75SLfIQ
MRyxcCeZhzhVlwq8ra6KXh4=

------5C385E9D48BE7EC7B0CB0AF28FD58259--


--===============0514971067642822953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0514971067642822953==--

