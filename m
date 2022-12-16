Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F962C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C18E841164;
	Fri, 16 Dec 2022 17:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C18E841164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lka3zDVcntPm; Fri, 16 Dec 2022 17:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C97F44115B;
	Fri, 16 Dec 2022 17:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C97F44115B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 153001BF2CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1B054115C
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B054115C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWXZCss8nnPD for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:06:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9B0A41150
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9B0A41150
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:06:13 +0000 (UTC)
Received: from mail-vi1eur03lp2110.outbound.protection.outlook.com
 ([104.47.30.110]:43745 helo=EUR03-VI1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6E9o-0001hU-1Z;
 Fri, 16 Dec 2022 18:06:01 +0100
Received: from ZR0P278CA0139.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::18)
 by DB7PR06MB4362.eurprd06.prod.outlook.com (2603:10a6:5:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 17:05:56 +0000
Received: from VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
 (2603:10a6:910:40:cafe::f2) by ZR0P278CA0139.outlook.office365.com
 (2603:10a6:910:40::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 17:05:56 +0000
X-SASI-Hits: BODY_SIZE_4000_4999 0.000000, BODY_SIZE_5000_LESS 0.000000,
 BODY_SIZE_7000_LESS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IN_REP_TO 0.000000,
 IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
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
 VI1EUR05FT006.mail.protection.outlook.com (10.233.242.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 17:05:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.58) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Fri, 16 Dec 2022 17:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSqvpmou5WENiWJhGK13QeFyDxne3+bboXbEv+8wOlAsjLTWVS0dw/UZPhDiUN7ly2BYKWZxPYZyB8qF4AL1AVVq6i4wnKKKvudaK3aaYFoE+BoprzladpieBLmGfJOxZtRAafBliBk2cquQD+A8mapkX9vBYh9sgwPV+UFpTOOdN2fjr2m6H79hZmbV3UynnBIPF0OjpaXhkGsWUPFIlpMLQHt3akl6lKIv3PN5LOEXq0UY7luQyA6Bsc8ikzo8XjEfoduKtUwDplBOqqJhDEdZHzo9Out7jk6oJPmHeIHvAUR8IEFWyGex26yAwQUePYGnzS8r99EEzlFO1y4/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrE/iOzOqhaZQG2mCXJs9o0KZScb2TTL+lNFE/uXSrI=;
 b=WsBswQNfCaju4YI9HhvI+Ic4g2rNj9M0/KhisNugsgWlnMnbbI5ytzsCYp6aaVleaJbA8KZFQhr5ZO5UW4PuGeSeWtc5uoiFrRhkvDKdPyZWLZKun0d/Ce6lPfFMCRD4aYU6Olk7sd75OvUJPntVP8p0ZZ3O/TGzr1NoW/aDF7sRlemzczpSNFR+Pw7aNEFxmIh7LKlNC4doquV80H0P7+QyzCFZTJH5WoFgC65oux7kP7JRhi/weooDD0pZk8TddfZPAMl8fgUAvLTCwLqWzTEjATT+U8noLILiHi9hTd1+Uwog0XdvHVzn2vI3iavZ+UuymlWYzVNKy40Ct1jCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by DB6PR0602MB3286.eurprd06.prod.outlook.com (2603:10a6:6:4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:05:50 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:05:50 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1MaAfmu1DF9NU+NKZh86O+Jdq5w2l8r
Date: Fri, 16 Dec 2022 17:05:50 +0000
Message-ID: <AM5PR06MB315336A0EE4DAA47567FF14E84E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-3-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-3-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|DB6PR0602MB3286:EE_|VI1EUR05FT006:EE_|DB7PR06MB4362:EE_
X-MS-Office365-Filtering-Correlation-Id: bde6fa8e-0873-4fe3-d386-08dadf87cc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JqyqiNNF/HWMKgbYFhXNwuhq5Ewk+HBglELYsJtjxTU/aMkxIjwRibbjK592H1DaK8R0eY286vCcKNXxXa6842D0s5dGA01JQOOqgdubK3kOqidzvtj1XTHtmZ8xUzbXIntRAWo1TAyOL5NoTb6MLSkQDVBcU9m/1yHLQRtTLbdkjb+fxTRVFNFnaZm83I6QdL8YEckHA4LQgfG3GY1lklrJOMKyuERKylS81pEUkCjNGdTMRW7CG4GmZwLCwuV+c0xst98+yVJwfa4TOIyrOf6bhi2bE5JoqFCyflz30tdHkhqWHgLRGxW3P+sokf7ADmR3OSnW3PvX0HpB9utbQqxQ4N5vCU0tV2Impj41EdnMmcqLL/ggZOco2UkTV104wA+aQRwrXqzbr2sTlRWt1XogaGCKeTqZ/2pNgcYms1w17dXVKC8tOo4AYzHJsgy6SS9uR0TYG/dmn5Voh4+JHF4TKqLKtTWpZtRu34M/0dBYURk229ZihAoDs+1wpgQmrUeqjyKst6J45DevfFVYO2e9CwnBCujtEYvjedWCDFd6fFIte+gPBjx/PXFQIFzGVKvGKQNAZezET1IyzrnGwUpEpMBaoIDrBzyFexidkVRPpumwIGqj3SDzkZjOYaoBWwoFjTvjzM9PQ4hMnEDTHAF8ON/n4pEODg0Lmd9ZrRt8lxy388xQ9KQ8rRXN5PZcaw/RfQ9iHbzSJclqzEo8X4rvka/kRxIa/VytqrngG44=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39840400004)(396003)(136003)(346002)(451199015)(66556008)(66946007)(91956017)(76116006)(66476007)(316002)(6916009)(66446008)(4326008)(8676002)(64756008)(55016003)(38100700002)(54906003)(8936002)(52536014)(5660300002)(2906002)(33656002)(966005)(122000001)(53546011)(41300700001)(7696005)(38070700005)(9686003)(186003)(26005)(71200400001)(478600001)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB3286
X-CodeTwo-MessageID: e7d95894-e92a-4078-b9f9-58634451d0ec.20221216170554@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6fac8e47-f13d-4118-fb2f-08dadf87c8cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PvmS5vRiags9GKlVtTKtziXO9Mh3G9RJ7V3k4X6b3H9jMWzUj+BZBuTRqLRBlIVx+J8PBuzsB68Aju36hMxDGRJeyauR2p2svBfYTIRpqQAXpWCHnaJlt/slg49oETRa16Z3ZVyNpHEYpZyTNzB3lwXAeND9zWvnF2LHH5qbXquVwqMuFyRRh0FTTGQIrkbThHd2vvEQeWk6qaSHQZyaoEWLxEzBXdaeNMYgHp4WLmz6dRPBdeAFmxZ5yLDhBL96Qj4yuqvYnB67pSQNbOKDFViZKAtExpmjnPdXcsXe4PeMWYw6PD7aGNNbFnRVyjgmnXdcOeQZuH4Tap2rtSEw9bTrKn66tZOMHeYZlrVf/KaRUivllgAgAPx+8hAC2KUiUJn8RIXEedHCK0uW2PCARC7+emTSYl0CgMaYfn1oH2AqtUTudbK+GuK71ufBCPK1jQqx7x5Ozw25ZDvubechTITd/IS/CvTI3vyJ5d13SM6fEdSE/BLzDNKIotzlKouAJMUG2nKC9f5kzKMlhNGKNuqwJnjccnReB1Yadr6MjdS+EViO8X6ZAkOdkOlI+3u+5gVT8s4MrdMfi92y+Z6oNiZ7LO5TNakcFYqZLFGEjUKkRWSQPaf0mOEBguLexzda72AHxSMdf7WIZ5XpUvNjj7ffwgcLt+laevNxWVIRk/SwIl/DeIgE1u5Uv5lCa1SKNgFYViVZ5+R7F4pBMAheg==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39840400004)(346002)(451199015)(36840700001)(46966006)(52536014)(8936002)(5660300002)(336012)(6916009)(70586007)(316002)(33656002)(86362001)(4326008)(70206006)(8676002)(82310400005)(53546011)(7696005)(6506007)(55016003)(40480700001)(356005)(478600001)(41300700001)(186003)(26005)(9686003)(966005)(7636003)(7596003)(54906003)(2906002)(36860700001)(47076005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:05:56.1886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bde6fa8e-0873-4fe3-d386-08dadf87cc0e
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4362
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/8] package/ruy: new package
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
Content-Type: multipart/mixed; boundary="===============5201915671315301616=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============5201915671315301616==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----ECBFC45F5027474E857F6D41EB7012C9"

This is an S/MIME signed message

------ECBFC45F5027474E857F6D41EB7012C9
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
Subject: [PATCH v2 3/8] package/ruy: new package =0A=
=A0=0A=
From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
This package is required by tensorflow-lite.=0A=
=0A=
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
=A0package/Config.in=A0=A0=A0=A0 |=A0 1 +=0A=
=A0package/ruy/Config.in | 11 +++++++++++=0A=
=A0package/ruy/ruy.hash=A0 |=A0 4 ++++=0A=
=A0package/ruy/ruy.mk=A0=A0=A0 | 18 ++++++++++++++++++=0A=
=A04 files changed, 34 insertions(+)=0A=
=A0create mode 100644 package/ruy/Config.in=0A=
=A0create mode 100644 package/ruy/ruy.hash=0A=
=A0create mode 100644 package/ruy/ruy.mk=0A=
=0A=
diff --git a/package/Config.in b/package/Config.in=0A=
index e09fa0b3bd..45e66caa8c 100644=0A=
--- a/package/Config.in=0A=
+++ b/package/Config.in=0A=
@@ -2095,6 +2095,7 @@ endif=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/qhull/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/qlibc/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/riemann-c-client/Config.in"=0A=
+=A0=A0=A0=A0=A0=A0 source "package/ruy/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/shapelib/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/skalibs/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/sphinxbase/Config.in"=0A=
diff --git a/package/ruy/Config.in b/package/ruy/Config.in=0A=
new file mode 100644=0A=
index 0000000000..ce7ab5d585=0A=
--- /dev/null=0A=
+++ b/package/ruy/Config.in=0A=
@@ -0,0 +1,11 @@=0A=
+config BR2_PACKAGE_RUY=0A=
+=A0=A0=A0=A0=A0=A0 bool "ruy"=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_INSTALL_LIBSTDCPP=0A=
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_CPUINFO=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 Ruy is a matrix multiplication library. Its focus=
 is to cover=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 the matrix multiplication needs of neural network=
 inference=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 engines. Its initial user has been TensorFlow Lit=
e, where it=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 is used by default on the ARM CPU architecture.=
=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 https://github.com/google/ruy=0A=
diff --git a/package/ruy/ruy.hash b/package/ruy/ruy.hash=0A=
new file mode 100644=0A=
index 0000000000..98266b5881=0A=
--- /dev/null=0A=
+++ b/package/ruy/ruy.hash=0A=
@@ -0,0 +1,4 @@=0A=
+# Locally calculated=0A=
+sha256=A0 4da8572946007603378c5d0280f48c5b77f4d38763209f5306b57c7513d9a82e=
=A0 ruy-3168a5c8f4c447fd8cea94078121ee2e2cd87df0.tar.gz=0A=
+# License files, locally calculated=0A=
+sha256=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30=
=A0 LICENSE=0A=
diff --git a/package/ruy/ruy.mk b/package/ruy/ruy.mk=0A=
new file mode 100644=0A=
index 0000000000..ceeea8cd58=0A=
--- /dev/null=0A=
+++ b/package/ruy/ruy.mk=0A=
@@ -0,0 +1,18 @@=0A=
+##########################################################################=
######=0A=
+#=0A=
+# ruy=0A=
+#=0A=
+##########################################################################=
######=0A=
+=0A=
+RUY_VERSION =3D 3168a5c8f4c447fd8cea94078121ee2e2cd87df0=0A=
+RUY_SITE =3D $(call github,google,ruy,$(RUY_VERSION))=0A=
+RUY_LICENSE =3D Apache-2.0=0A=
+RUY_LICENSE_FILES =3D LICENSE=0A=
+RUY_INSTALL_STAGING =3D YES=0A=
+RUY_DEPENDENCIES =3D cpuinfo=0A=
+RUY_CONF_OPTS =3D \=0A=
+=A0=A0=A0=A0=A0=A0 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DRUY_FIND_CPUINFO=3DON \=0A=
+=A0=A0=A0=A0=A0=A0 -DRUY_MINIMAL_BUILD=3DON=0A=
+=0A=
+$(eval $(cmake-package))=0A=
-- =0A=
2.34.1=0A=

------ECBFC45F5027474E857F6D41EB7012C9
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
BTEPFw0yMjEyMTYxNzA2MTBaMC8GCSqGSIb3DQEJBDEiBCB0Y1De/ypfMHsGsJVA
7qznZbg2PGUcMPVmZ15TLDJhWDB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYCrfD29ijbZ2zSspN4YKzQmIAvq327KnHNmcGAObTxS
+2bWP6DDdCk6xSzG6nvPDHXPx7Dn4hpoEK5aiOjlS6KBi2EgKwERUJDomgmTJsDV
gMETcH6Ro+ly/hil9NWSHfT+lvfS3uYZHtk3l8HNPWixquM4VVY0SqvJ73IjFN3N
qDWcuY9Mp7EhuClPqNymWI5BZWNGuY1rkGTSaJxINTIVACSx/TNOjWCiukSNFVGM
pyHGzFPMMA2spSBgI+OJk5TF2NjmtU0afpqlqU0DzO+WEjblBQtB267e8Owauu9B
vxxyXf9I+LFaDl7XB0vzQ/zVZEXnsZZKFIIKb3EUDNPDN+pLPTilIpmz8STKJpiv
KVUS0F8AkG1G351OkRXABMwdX3yL2GcYO8u/NsEwPp/91qGK+tbznsruYL6QV5WJ
5Umzi8yAPuoBfYkXMqkYeayBYxHDCDfFq3cNDui6VJkTRUxSSM0wWPaxM6ebs+vt
zMNCvTb1x3iYUYD8KVG7puA=

------ECBFC45F5027474E857F6D41EB7012C9--


--===============5201915671315301616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5201915671315301616==--

