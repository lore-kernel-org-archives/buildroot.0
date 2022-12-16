Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9193AC4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 339E661120;
	Fri, 16 Dec 2022 17:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 339E661120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qx6_SY2f6i8Q; Fri, 16 Dec 2022 17:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC3B6060A;
	Fri, 16 Dec 2022 17:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC3B6060A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3805E1BF2CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DE964185B
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE964185B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nmc6z8ZleP6C for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:07:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8E741857
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E8E741857
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:07:53 +0000 (UTC)
Received: from mail-db5eur02lp2104.outbound.protection.outlook.com
 ([104.47.11.104]:19169 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6EBS-0001iT-3B;
 Fri, 16 Dec 2022 18:07:43 +0100
Received: from DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) by VE1PR06MB7006.eurprd06.prod.outlook.com
 (2603:10a6:800:1a5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 17:07:40 +0000
Received: from DB8EUR05FT044.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::9b) by DUZPR01CA0063.outlook.office365.com
 (2603:10a6:10:3c2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 17:07:40 +0000
X-SASI-Hits: BODY_SIZE_3000_3999 0.000000, BODY_SIZE_5000_LESS 0.000000,
 BODY_SIZE_7000_LESS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IN_REP_TO 0.000000,
 IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000, LINES_OF_YELLING_3 0.050000,
 MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SINGLE_URI_IN_BODY 0.000000, SUSP_DH_NEG 0.000000,
 URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000,
 __CP_URI_IN_BODY 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FILESHARE_PHRASE 0.000000,
 __FRAUD_BODY_WEBMAIL 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FRAUD_WEBMAIL 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HTTPS_URI 0.000000, __IN_REP_TO 0.000000, __LINES_OF_YELLING 0.000000,
 __MAIL_CHAIN 0.000000, __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000,
 __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SINGLE_URI_TEXT 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
 __TO_REAL_NAMES 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000,
 __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
 __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
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
 DB8EUR05FT044.mail.protection.outlook.com (10.233.238.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.16 via Frontend Transport; Fri, 16 Dec 2022 17:07:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.111)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Fri, 16 Dec 2022 17:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLP7t7Bx3wRJFshoGa5bLQOctqsWLk7h7q97e4h98WbU2+ljcx9fMR3vn1HUheAxMWy0moY4g+KcB94gdwYkyvJS5sXT2+Hncduqaum2oRbC8QE0Z6TgJS4hjb7Os3Ytj7o46CJFWjXjpYTzaQL8ZuwL5mlNq8+SejzVfhEc52BNZGRSPJnNoJxE6YdOw5rrXiJrT+1A576rMqWaaRRIn2FWY3dY04H+JeSYmB+TLTm2KnZol05h+wPqoSM+V1P4PQxUa6zJ7xJC2raXYXjhEdf4hKrRg82HzEbMzU9tq0f6uBgEXClLWCdhnjNgSTaHsRg4lMKnczoW00ZUXUyvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WET8ecNR5X/Ib25uTb9qp2t0KJhAofE7cd8/MbSwAI4=;
 b=hoQltbIdV00a8UnUty5JsY0LEILryfiBv9oEunmVJuehWQ4Z0pDj2Ntrt95zq04z2DdASB3f2/un3PS+Fw7AV+hHr0KTkPE4WkmutdrC/jxHywWN4KStGrMXUcg0CHlKKfP5SXSVGQJP8L0v67u+XKE76IMR9jdZAiRbGvNlH82pL9DZVQYT/AK9MDhVq0qcW8TNvppkaMWfdW044ctjTCtkp+7Ws9uv2A3Os62/TgRT6D2lyoVU0RoCbIrWM8YOXaI+iFI4uLgsyCOU883q88S62HmD9oTf5OtGDstR32qO0ixTMZ2xNh6lXulSHIZe+D4wTrN8S+o6vESrCzgyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by DB6PR0602MB3286.eurprd06.prod.outlook.com (2603:10a6:6:4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:07:37 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:07:37 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1Mauw+uWSs6/E+RxrZJhfcWrK5w2uX4
Date: Fri, 16 Dec 2022 17:07:37 +0000
Message-ID: <AM5PR06MB31531FBEE40F3987D20434C284E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-4-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-4-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|DB6PR0602MB3286:EE_|DB8EUR05FT044:EE_|VE1PR06MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cb156e-8b38-472c-47ba-08dadf8809be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RFUCJY/eWRXSOKaFOZfdFET5o7c04OGnMxg/EHRwC+5lUkr02beBMnq299XAgWqyUdflyTGE8r9YVFdvArE1HzOexkZ4V8MttsUNXNjYUB9ecvdQhZw3IjWQO2Fy07O3+As6syD0r7ZI/MXEKennMn56h6Bc2/hO9iuMwcEiAyk6+e/an3lwlEnEvskEQ2PtA8jdRsgSPXjq3+6hn4LIAyaFKTZgnKG3ARjYxYq81/vwgnUbX9jYlN8Wt3xYL1EjqNgIcdptli8VotWIaTW+ilDKnZdXqFYHIt34DzDILbNXwIwbsyUeonBNq7AfIGvGunN2wW2aJy4QXUzZjrP/vS4ki9hqwsCOZ5PHB0UVcLJsmtjFVCKUGWTJUHClmRZVEZDAy7+Ug3Q4FZm0AwWnpoz9Jv4xtgMp8xUNj3CwaceoVY8ov0o0b4vnQGNRfOY7eQCfeftuvVj+V8Bw4ZNdU+V3rade/Fyo8o1zCEPMPO3toLzFBJLCEk1nRNB0WvOydWydCT4apdqqEOqHzSreo3+awdcNKGO1NcIA0PfqcrfHKaLAYzgUVoUYd2JQq8Y5r/ROtrwmYfvyUDmorOKE40SrnxqO7I6CdI2bmQgiYpQbJcq5rA20BPe3evpdusAdWwrtPYGbDIB9kVQzN/kzNGQMpxUdX6mQLhhThl41isGFpcB2Ij4crHJKHJomjRNYMiPkmCGYN8iLVUdh+1r3oagauHae4uSXqrKJw26R5Bg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39840400004)(396003)(136003)(346002)(451199015)(66556008)(66946007)(91956017)(76116006)(66476007)(316002)(6916009)(66446008)(4326008)(8676002)(64756008)(55016003)(38100700002)(54906003)(8936002)(52536014)(5660300002)(2906002)(33656002)(966005)(122000001)(53546011)(41300700001)(7696005)(38070700005)(9686003)(186003)(26005)(71200400001)(478600001)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB3286
X-CodeTwo-MessageID: dc62a6a4-110a-44c1-b1e5-a5ed8be1e477.20221216170738@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT044.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d0f8788a-720d-4c40-201b-08dadf880813
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQuKQlFtbXrftD9m3l9p6lT8B+mBVY426X/XTtuPPu4irBOm9Q6NAlKJfCgE8unkiVtep0P3ZnVArwwBZqVEPe7lUjIrJhmL8MuCwdLCz5Y8CIpTEuk8OlhR5gLJuN8KCxnXmPR0IJUUyLib78NReDB4nNpbMJSGF8sxYAgVsXDhxe4tncl0n40RPfujxYLy4OERl5rCBQyOc1YzOewjSMU0HtGUJIx+ROuyyhHNxPjnRfv5ZfCmhI/FqWPYsw3OcSZF4Y4JvKMaj1/vEGj6pLwKA0/T+92wdCgGFKpkFrHPC9+j68fg5jbrVReF2kbR2NRiaDmPCcatKMhKKYvsGn07Cw/VSJZ6HA4244M/dvSRefgp/ugiqsM/oM40JTb6vn6eOlq/vCkdntDzusyjXVpqH4MEIgrzTWzEBkqbYAR1emkNpgpwHrdyqYcNUteAxuCH4w/Ng77jEV/3nLobTPUvSnh0klTLew+zGthDdKytKZDqdG/37rKwTTo3SXA089e8uIIHJttCvsxEn7m0qPvMJud7vjwpcobkhDd53jC/jpYnKeTqqAcH9DJM+ViQtUtetvcPPQj+6HIFJsZIZmxwzOOdiUpDSpvbwI9u4UJGM/e+1C7aCktmTdrZYVEBTr0jdWCcH/DVRN9TPRx01Wo5hCHeYNP6pIESq4VqzG6Pvr9+sGzqXSZvvUqS/6bz7D/CwW/aAkMqOndAwg9Juw==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39840400004)(396003)(136003)(451199015)(36840700001)(46966006)(2906002)(478600001)(8936002)(52536014)(82310400005)(70206006)(70586007)(316002)(966005)(6916009)(54906003)(336012)(47076005)(36860700001)(5660300002)(55016003)(9686003)(7636003)(356005)(86362001)(40480700001)(41300700001)(7696005)(33656002)(8676002)(26005)(6506007)(7596003)(53546011)(4326008)(186003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:07:39.7108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cb156e-8b38-472c-47ba-08dadf8809be
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT044.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7006
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 4/8] package/gemmlowp: new package
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
Content-Type: multipart/mixed; boundary="===============4612759759932777517=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============4612759759932777517==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----44C9DFFD371EE4BBE4BA741BD8351585"

This is an S/MIME signed message

------44C9DFFD371EE4BBE4BA741BD8351585
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Tested-by: Stefan Hager <Stefan.Hager@ginzinger.com>=0A=
Acked-by: Stefan Hager <Stefan.Hager@ginzinger.com>=0A=
=0A=
=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Monday, November 28, 2022 18:58=0A=
To: buildroot@buildroot.org <buildroot@buildroot.org>=0A=
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Fabrice Fontaine <font=
aine.fabrice@gmail.com>; Samuel Martin <s.martin49@gmail.com>; Hager Stefan=
 <Stefan.Hager@ginzinger.com>; James Hilliard <james.hilliard1@gmail.com>=
=0A=
Subject: [PATCH v2 4/8] package/gemmlowp: new package =0A=
=A0=0A=
From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
This package is required by tensorflow-lite.=0A=
=0A=
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
=A0package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +=0A=
=A0package/gemmlowp/Config.in=A0=A0=A0=A0 |=A0 7 +++++++=0A=
=A0package/gemmlowp/gemmlowp.hash |=A0 4 ++++=0A=
=A0package/gemmlowp/gemmlowp.mk=A0=A0 | 15 +++++++++++++++=0A=
=A04 files changed, 27 insertions(+)=0A=
=A0create mode 100644 package/gemmlowp/Config.in=0A=
=A0create mode 100644 package/gemmlowp/gemmlowp.hash=0A=
=A0create mode 100644 package/gemmlowp/gemmlowp.mk=0A=
=0A=
diff --git a/package/Config.in b/package/Config.in=0A=
index 45e66caa8c..d0d9d2905c 100644=0A=
--- a/package/Config.in=0A=
+++ b/package/Config.in=0A=
@@ -1994,6 +1994,7 @@ menu "Other"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/flatcc/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/gconf/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/gdal/Config.in"=0A=
+=A0=A0=A0=A0=A0=A0 source "package/gemmlowp/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/gflags/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/gli/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/glibmm/Config.in"=0A=
diff --git a/package/gemmlowp/Config.in b/package/gemmlowp/Config.in=0A=
new file mode 100644=0A=
index 0000000000..24ba6e9768=0A=
--- /dev/null=0A=
+++ b/package/gemmlowp/Config.in=0A=
@@ -0,0 +1,7 @@=0A=
+config BR2_PACKAGE_GEMMLOWP=0A=
+=A0=A0=A0=A0=A0=A0 bool "gemmlowp"=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_INSTALL_LIBSTDCPP=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 Low-precision matrix multiplication.=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 https://github.com/google/gemmlowp=0A=
diff --git a/package/gemmlowp/gemmlowp.hash b/package/gemmlowp/gemmlowp.has=
h=0A=
new file mode 100644=0A=
index 0000000000..7c56a18bb6=0A=
--- /dev/null=0A=
+++ b/package/gemmlowp/gemmlowp.hash=0A=
@@ -0,0 +1,4 @@=0A=
+# Locally calculated=0A=
+sha256=A0 cc8a22b6f071c3781e6b4b72654c89b1cdc198e72ebadebb17638eac205344c1=
=A0 gemmlowp-08e4bb339e34017a0835269d4a37c4ea04d15a69.tar.gz=0A=
+# License files, locally calculated=0A=
+sha256=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30=
=A0 LICENSE=0A=
diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk=0A=
new file mode 100644=0A=
index 0000000000..1a36fc48f7=0A=
--- /dev/null=0A=
+++ b/package/gemmlowp/gemmlowp.mk=0A=
@@ -0,0 +1,15 @@=0A=
+##########################################################################=
######=0A=
+#=0A=
+# gemmlowp=0A=
+#=0A=
+##########################################################################=
######=0A=
+=0A=
+GEMMLOWP_VERSION =3D 08e4bb339e34017a0835269d4a37c4ea04d15a69=0A=
+GEMMLOWP_SITE =3D $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))=0A=
+GEMMLOWP_LICENSE =3D Apache-2.0=0A=
+GEMMLOWP_LICENSE_FILES =3D LICENSE=0A=
+GEMMLOWP_INSTALL_STAGING =3D YES=0A=
+GEMMLOWP_INSTALL_TARGET =3D NO=0A=
+GEMMLOWP_SUBDIR =3D contrib=0A=
+=0A=
+$(eval $(cmake-package))=0A=
-- =0A=
2.34.1=0A=

------44C9DFFD371EE4BBE4BA741BD8351585
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
BTEPFw0yMjEyMTYxNzA3NTBaMC8GCSqGSIb3DQEJBDEiBCC3RxB+U1qebVv6O1mi
ZAmGR5vMMoQ5VpoW5GcSFDTbHTB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYAEWiei43Zo2gGVQmADAEXeDxdSAOYTvHCjqqGmZ2zi
hoziMTNtx7VMwgd7X385/tJrgXHCA26W48Q3o1hnd4PsSJwqpp6FAXSkkxhXbnQ1
TrdxrqkYgxaN12yrzY0OMLNyG08XWpIaJuz9I/gaQngvqnFGMZWEVSuobjOi2dSa
ILnWIhcqpOTvk0jTLz8SlWfFPPD6D91BzltFw37CxvDZWNteyAsFYNfBxqlXFK6p
Aw+SAiqFgDJMEHgNiItNXPirccZ3m69byMuqoNZWZeZ/zGYYo83ND0ph7m775GDx
K7BTayr0dOzce7nP3nVY0ShhY94Vx4HwsAQqfGjVqNC4/CbZ39WrBJLSYqobKWpb
tcaBaM2kRGCOaczsRo/yW0AZJt82K5toarppgDmJpCiouZ+e46PS+A7sqjR+TRjg
zDCaDVzVltHq9+NsVkzWarwV5Dm0+A+vINQaewNOelFjoH6oveY+n8oT647pzhLh
mRaQ/PNv+LELG4zWVgRQ/eU=

------44C9DFFD371EE4BBE4BA741BD8351585--


--===============4612759759932777517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4612759759932777517==--

