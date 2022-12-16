Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E0BC10F1B
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1539882208;
	Fri, 16 Dec 2022 17:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1539882208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNwYMEhpOXCZ; Fri, 16 Dec 2022 17:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC1182204;
	Fri, 16 Dec 2022 17:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC1182204
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FFA71BF2CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 161AA4169B
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 161AA4169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EuCunL027HCr for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:10:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61ABB415F6
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61ABB415F6
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:10:23 +0000 (UTC)
Received: from mail-ve1eur01lp2058.outbound.protection.outlook.com
 ([104.47.1.58]:16261 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6EDm-0001mZ-0V;
 Fri, 16 Dec 2022 18:10:06 +0100
Received: from DU2PR04CA0231.eurprd04.prod.outlook.com (2603:10a6:10:2b1::26)
 by HE1PR0601MB2681.eurprd06.prod.outlook.com (2603:10a6:3:56::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 17:10:02 +0000
Received: from DB8EUR05FT051.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::83) by DU2PR04CA0231.outlook.office365.com
 (2603:10a6:10:2b1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 17:10:02 +0000
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
 DB8EUR05FT051.mail.protection.outlook.com (10.233.239.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16 via Frontend Transport; Fri, 16 Dec 2022 17:10:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.172)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Fri, 16 Dec 2022 17:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgWs7oosDDY9V3HWdHz6w7QTt6UqecfCL3BaHkRXmDRwtel4qsFLwb5E3fD8dSipBFr9oL61kfSCUB2IdMdwd/jg7IPvFFymajpue051E7XlkwEgqPhYHOkAdQzjW0CYwKM1sm2EtIX1yj7amcuaDkUOKku/Zn4LPArGflCagj/4r/1fCCjApPWqtPW+CWtRZkUxH0AD/54btSSbeuYq0ofdyOcpc71D879jVkz6WI4X9W4caNVWjFyS0A6EfRo90EBoEvzGmrFnqdD1tYSmM8gIjHNisw4LTFDDMo1xhcwsBZ8L5H0XwMlKNH2oiBn/NWrKz3OWoMreUUvG1HXNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4YcMUYfHYD97HXyl20SpnelNBNnKKnHC+7uy1gVUFw=;
 b=mwa7fIrAWTKpwdcT/qaM7pFBpsshSGGhTZwhxUjufPhDsEs1MtpJxqb4ncMKz6NSwrHALpuGM+CLn2gDcJ+9sIN6wefmPcvtpOOt+Dny+BIPCGLpJHRoGFHKsLJ68zYznRTTRNiQ0VWzw0sio5wuODmO37zk7u6xpCRQkYIOcw7lOelQFYTkU37ckaIOGtUsujhXH3j54i/Xlmuc/wY0r0hwEncDMqILgoh4Do2XZdf2sG2rqi2s3QwVizuI/vq4VzZZ2q8+0U02hcnCwOjArb36tTwvJM1V++bhjC30i5TJiJ+WvslmXdUww+FfADL7zHb0fdkac9gCdVkdD6V3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM0PR06MB4067.eurprd06.prod.outlook.com (2603:10a6:208:b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:09:58 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:09:58 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1MbMqT+8OSsq02RUEJXBqzdw65w25jg
Date: Fri, 16 Dec 2022 17:09:58 +0000
Message-ID: <AM5PR06MB3153B68F7C67008BC0CF6DB484E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-5-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-5-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|AM0PR06MB4067:EE_|DB8EUR05FT051:EE_|HE1PR0601MB2681:EE_
X-MS-Office365-Filtering-Correlation-Id: 4248b125-7e86-447e-92b8-08dadf885e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ImltY8W6lTnobmNxhuF6Sc+WaXmJL0pum2Y1P5PVWhZEmIksgL9r5WgGC/uuwIXPvYGNqVjQ2TUH0N55m9LaJflzjSeVIgQs+kES2isiygz1J2pfJ9iQylXYkrOAzxKKQnW6fINWez3blHO5/bb6ThoKyZfL/KURKYXRXVG6eG3SzGyR7/molBKLbD8Da52izpBnWZCGvlzcJp8lF+JLb5tKLQ6CoZ/V3iB1heC0qFVBbJiaP2e/WH82a2T1/hKpmmEx+wxQJl/RAUfMb+agUXYUuTPeC4EuxGSJ1CA9yA06QiInd5lN01a+1A5WvdQRv24Tk6n6ODX+FjxbgfBYgjIMnRDCa9xucw/lH9JF/mNcoAJ7PgiuYnQGxDz1doRvMEqXu1PdgukoZ7jUn9PvIKpTSQD8AyobuA2ffUbsFywjHEKU8RSdrVUeI9Rhi4yIcb+HCckZB0EVLmMASqxAfif+QsUVwy1yx3Zlpd5k9zVAkVfgYCyQG9A99TqQLOBu8D8IYRjuhEOFngfgA/HYqMK7KwAlWD3LVx7Grbta7hJbhdekuqognx/tgDb0Ja0quICrDlJ5SgwClBGKT2aogB55RqwiG1/GPCtBDayVaGf4o1/DmxPbFB53lDNmx5VCwhL3l0WXkEp8AOhOKeyjf4Xiy6XAWyawB1tCiMxWfBcBb+8D3Rr548DDnK0NgXeyxvx5NlHbbB/53PzyJKfmWHtq9KSho8TN/CgyqbtYvXw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(366004)(396003)(346002)(376002)(451199015)(122000001)(26005)(2906002)(478600001)(38070700005)(966005)(52536014)(86362001)(316002)(41300700001)(5660300002)(8936002)(91956017)(66446008)(66476007)(55016003)(66556008)(38100700002)(6916009)(33656002)(9686003)(76116006)(64756008)(53546011)(54906003)(186003)(66946007)(71200400001)(8676002)(7696005)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4067
X-CodeTwo-MessageID: 695d5c1c-825e-46b1-95df-0d7ae37cbd45.20221216171000@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT051.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3bd5d7c7-d302-4bff-f0eb-08dadf885c2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FEiiem+GLKoYPGLOmtEeuijz2WNl4+aUJgR+EBLZT9OLeV9ccsYzI+CxsXGz7m/RMzWM22naJECec+L3LYJnMoiXRniiUQAtlzShWdME8/R510pFFbFbDAOFkuMIjrBgSycPhyaP8u6Ep2EEzrG3KcEvADVQJFJ7n3zgYDD8tFa/ZB9kIxfWh6AOL/VaMqzjGf4HRELgBs3znNS+iECz+0wnGFAbX2zgsL/pfniWPkksc4FKgQE/5hPufpjfeOmLWlFVtcKQ9BkQgIqZ8d4hId3C06Bsi3Ae45TuKiwolgqV2gSFUvkbInfmRD1m1hbkxaQyPDRNH1gqFhhBiCM7vdt0R/PaRfiCpPZFCSf8y/SIPLyjIxkmzfeJ0h5PGqDhuEHfk+cWnR+JlayNgs0FUvV8ALjvJjsIxsEc+o6TIyPihD0Ytpv4DfASwUvmJKsgFyfZSHvH01arQHUcCKMj3QAzfMglm+cjyy1iu4c9o5nl1vBR8z5skjYa8CwWrwNaveWqtewAx6nOw2Viqma9XSalqJwj7Dxv2GP4sAMVnrAchEwb2H63ofFu6Gbvg/HfezzFwXEM1N8agWqDASu3d71p8nzuJ5+bM4IPW/2VqmIS6veHhwT7Jqd7LhhIkbdjeXxBWGDWgbKPsb2vFHCcZPSAWk73XwmRNkwcMXwX0G7yokGPAwflpoxN2EjJGQ985wx3DX9bwOCo4i/Lxj2GQ==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39840400004)(396003)(376002)(451199015)(36840700001)(46966006)(36860700001)(47076005)(86362001)(7596003)(2906002)(356005)(7636003)(40480700001)(5660300002)(6916009)(52536014)(82310400005)(55016003)(41300700001)(8936002)(4326008)(53546011)(26005)(186003)(8676002)(9686003)(336012)(70206006)(70586007)(316002)(7696005)(6506007)(966005)(478600001)(54906003)(33656002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:10:01.8955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4248b125-7e86-447e-92b8-08dadf885e7b
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT051.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2681
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 5/8] package/neon-2-sse: new package
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
Content-Type: multipart/mixed; boundary="===============3781797110564566779=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============3781797110564566779==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----34DDA1BF0C377FC4FDE12B72472EDB5D"

This is an S/MIME signed message

------34DDA1BF0C377FC4FDE12B72472EDB5D
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
Subject: [PATCH v2 5/8] package/neon-2-sse: new package =0A=
=A0=0A=
This package is required by tensorflow-lite.=0A=
=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
=A0package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 1 +=0A=
=A0package/neon-2-sse/Config.in=A0=A0=A0=A0=A0=A0 |=A0 9 +++++++++=0A=
=A0package/neon-2-sse/neon-2-sse.hash |=A0 4 ++++=0A=
=A0package/neon-2-sse/neon-2-sse.mk=A0=A0 | 14 ++++++++++++++=0A=
=A04 files changed, 28 insertions(+)=0A=
=A0create mode 100644 package/neon-2-sse/Config.in=0A=
=A0create mode 100644 package/neon-2-sse/neon-2-sse.hash=0A=
=A0create mode 100644 package/neon-2-sse/neon-2-sse.mk=0A=
=0A=
diff --git a/package/Config.in b/package/Config.in=0A=
index d0d9d2905c..2ec623ed8f 100644=0A=
--- a/package/Config.in=0A=
+++ b/package/Config.in=0A=
@@ -2086,6 +2086,7 @@ endif=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/msgpack/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/musl-compat-headers/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/musl-fts/Config.in"=0A=
+=A0=A0=A0=A0=A0=A0 source "package/neon-2-sse/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/openblas/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/orc/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/p11-kit/Config.in"=0A=
diff --git a/package/neon-2-sse/Config.in b/package/neon-2-sse/Config.in=0A=
new file mode 100644=0A=
index 0000000000..25613c5ec4=0A=
--- /dev/null=0A=
+++ b/package/neon-2-sse/Config.in=0A=
@@ -0,0 +1,9 @@=0A=
+config BR2_PACKAGE_NEON_2_SSE=0A=
+=A0=A0=A0=A0=A0=A0 bool "neon-2-sse"=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 The platform independent header allowing to compi=
le any=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 C/C++ code containing ARM NEON intrinsic function=
s for=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 x86 target systems using SIMD up to SSE4 intrinsi=
c=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 functions.=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 https://github.com/intel/ARM_NEON_2_x86_SSE=0A=
diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2=
-sse.hash=0A=
new file mode 100644=0A=
index 0000000000..ded20d58f5=0A=
--- /dev/null=0A=
+++ b/package/neon-2-sse/neon-2-sse.hash=0A=
@@ -0,0 +1,4 @@=0A=
+# Locally calculated=0A=
+sha256=A0 019fbc7ec25860070a1d90e12686fc160cfb33e22aa063c80f52b363f1361e9d=
=A0 neon-2-sse-a15b489e1222b2087007546b4912e21293ea86ff.tar.gz=0A=
+# License files, locally calculated=0A=
+sha256=A0 7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc=
=A0 LICENSE=0A=
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-s=
se.mk=0A=
new file mode 100644=0A=
index 0000000000..0e9d066abd=0A=
--- /dev/null=0A=
+++ b/package/neon-2-sse/neon-2-sse.mk=0A=
@@ -0,0 +1,14 @@=0A=
+##########################################################################=
######=0A=
+#=0A=
+# neon-2-sse=0A=
+#=0A=
+##########################################################################=
######=0A=
+=0A=
+NEON_2_SSE_VERSION =3D a15b489e1222b2087007546b4912e21293ea86ff=0A=
+NEON_2_SSE_SITE =3D $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VE=
RSION))=0A=
+NEON_2_SSE_LICENSE =3D BSD-2-Clause=0A=
+NEON_2_SSE_LICENSE_FILES =3D LICENSE=0A=
+NEON_2_SSE_INSTALL_STAGING =3D YES=0A=
+NEON_2_SSE_INSTALL_TARGET =3D NO=0A=
+=0A=
+$(eval $(cmake-package))=0A=
-- =0A=
2.34.1=0A=

------34DDA1BF0C377FC4FDE12B72472EDB5D
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
BTEPFw0yMjEyMTYxNzEwMjBaMC8GCSqGSIb3DQEJBDEiBCCEIS3hIJllEc11L7H1
EZkcEty+pqr2J/nYIDbizWphRTB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYBHbsdwgdsxyJfe9J9SGy5uCBbeVMmy9Be4OKY+Rba9
YdE6mHVDbCGBM8XBonzJDFGstPhvyd1X5H/sfoTcExWD9LTG4TVeosYNayn2+TA0
2btdD3QupE4dn94H/PDPdDrOK77FhH4b/xHdZt47qdVYY876w2Dv339mNWYZtKjn
GQU94koWQxDfkelVoCXKRo+RnBkf9/R0HovhDp3cDzpTWufMRewbdr4xRt37xP3P
YpGRWiZSFqa+tdwHZTRwaGDxQCUcIJAGPlId60Iw7Vz+0UkJhlWho67ULEcPBSyf
Iupk4dKZPF47qqVd2S9b6pmLBfaSQ9SLtzrDXOxWW0tcKlj8OuZYinIJ2MwvXppd
02f+swgGTtwT2sBjuAUFxVpT+j+st7KGbaJIC1wrcuDoGyO0TrHreKMGNJGRI2wr
gw8tngKzPlwSpIxTeKMG34qzWq671m4iX8AH7yM44ZDs1DKxz3rAryT7PbdbOhPL
A/+pLGJBIUYYwgk4M13F0eE=

------34DDA1BF0C377FC4FDE12B72472EDB5D--


--===============3781797110564566779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3781797110564566779==--

