Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EE2C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76A7A81FD3;
	Fri, 16 Dec 2022 17:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A7A81FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0elevcpvw9qP; Fri, 16 Dec 2022 17:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8161282036;
	Fri, 16 Dec 2022 17:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8161282036
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3181BF2CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1467860B2F
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1467860B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BoawICuhFDJW for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:14:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5214F60709
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5214F60709
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:14:53 +0000 (UTC)
Received: from mail-vi1eur03lp2111.outbound.protection.outlook.com
 ([104.47.30.111]:6793 helo=EUR03-VI1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6EIG-0001q9-18;
 Fri, 16 Dec 2022 18:14:44 +0100
Received: from AS9PR06CA0530.eurprd06.prod.outlook.com (2603:10a6:20b:49d::17)
 by PA4PR06MB8498.eurprd06.prod.outlook.com (2603:10a6:102:2a5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 17:14:42 +0000
Received: from AM6EUR05FT044.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:49d:cafe::cb) by AS9PR06CA0530.outlook.office365.com
 (2603:10a6:20b:49d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 17:14:42 +0000
X-SASI-Hits: BODY_SIZE_4000_4999 0.000000, BODY_SIZE_5000_LESS 0.000000,
 BODY_SIZE_7000_LESS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IN_REP_TO 0.000000,
 IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SUSP_DH_NEG 0.000000, URI_ENDS_IN_HTML 0.000000,
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
 __MULTIPLE_RCPTS_CC_X2 0.000000, __MULTIPLE_URI_TEXT 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
 __TO_REAL_NAMES 0.000000, __URI_HAS_HYPHEN_USC 0.000000,
 __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000,
 __URI_NS 0.000000, __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
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
 AM6EUR05FT044.mail.protection.outlook.com (10.233.241.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.17 via Frontend Transport; Fri, 16 Dec 2022 17:14:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.112)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Fri, 16 Dec 2022 17:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqWNtr6pcypZzEDMcW2fYm7xFYWhpi6UJ6UWjRhmAKypG51fblPZo/+2+GkVPFq76sEVMeNy0jcs4XBcM5gDVy73b5vgb3hY1xSoWDpfHh7XAfQmCYCupr3AdjS48ag2wjexKbJ0/1uGfXvuhBgo92RmwjE2a9aNXwRC4eeEXHPn4ln7Xpre7S11BeIdbLQ1psWrZZcPi6fJIvsfuOb1dhY+K4+xNSsa6Ij6AbR/HJwYTUbbeJnsxkS+noTMlq5rAR1/hmjVm/t3RuZ4wqdPYauVs1fh3aIDOwHS8OG9GVM/vGs+p0nDHdhXuDxE6hPK4gxsAlS5ysHnftc4ldqhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m32gesOsf1TwrTvAuo31qiLBNyhg2OYy+ixOvnq8XXQ=;
 b=Gi6malHHLgNf1M84XLZ7lyb9HvoV6zJHPyEs2Kb02fvpbcXe4BEph2nl/nfQQJoVXKWXRzOe2O0v6muRh3D5sATCyQdbk9DOp+odBRYLWuIimry00Q5BC+BlaP/HZ1hWv0APJ9CpPGU9gC0yv8UnMejitP3u8tSRI8eLrnhTxltcZi/hJ5voBTerNt95STys8dwDp7RP5egdrVUKrV2fX2LlFjQOGDi6zY86zCj2s2o43kVtu8/0fXHCacpBlmspieLfoFVjDnanI5FsY1zk2zGlJ7u1C63Hzht4KVWZdXyoTnGkUtBgRqYxflJW5dt33UtDGfdB9SHsqX3CLZREyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM0PR06MB4067.eurprd06.prod.outlook.com (2603:10a6:208:b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:14:39 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:14:39 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1MbB+BFnFnuhkqZPRrzDM2cm65w3Hxo
Date: Fri, 16 Dec 2022 17:14:39 +0000
Message-ID: <AM5PR06MB315359EEE612192EC593697684E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-6-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-6-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|AM0PR06MB4067:EE_|AM6EUR05FT044:EE_|PA4PR06MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b3dd10-eae3-417c-1387-08dadf89059a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ydgiwbl1LF3zpY3wcj5XP54RCr2UjuJarJ9xE4fVgcj9M32lNhWGg+vkhYhglPyOlr2aHH4CF/BwubCqT5GZUefGoQ87E2zSSaTJWJE4JgTwIEA2Ex1KRYJXI7SR8Uvq9mpRYDjiFFV7pUT2NZidYhhy8oNnc0lNHPjN4YM2dmAIQrNzmCxxFQu3datEHGqE+lIlZZP1bLgJA7uO43IycGms4d8ePnX+eyCyOJK9fJyfLm6tbX5L5i8g9B8vgD0ne+YsVwl8p80E9cta/40wxG8PH9g18EXHHdfDy/D5p2KZvG4ezRYlBu2+W8xz4R6hWsBvaLnZ1BkHmI6IXbxFql40jq2PLr6orGHcWl8IWSK5HJ9Ywa7DfEcCxqO45/G2OeTEimbl8xG9qkYa2Z/rwv1GKhZnkwpJ4rg/qlcjA5uT0/MFSPHifnGzujSpppijEAoPDRhd4qECbt5jRBOLRGuGagTDcs4jmUrZgSK/XZorJgFuiBQLeUSEnUdpiFrUalcmcvo2JaDSXuf78MWU7BM+k9v/7sdugo9JgYS1eaOl51y8c6B4jGftzcUQJZaJsPnDS9Nf44FYATHbihm06QF4dccYNv8Kw/QI8R2nFpz2f/Lhkyca7YisPo0oucyCSBbO2w9U5rr6v3l1/LU25ZrzSUL1LhXUxAMS5WCqIcz9tJvmLuEJRgo+5kM2UIW3sQqHdPiLocNCBKaVGjqDNIWzL9kU1KZuiQvDzw1Vk10=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(366004)(396003)(346002)(376002)(451199015)(122000001)(26005)(2906002)(83380400001)(478600001)(38070700005)(966005)(52536014)(86362001)(316002)(41300700001)(5660300002)(8936002)(91956017)(66446008)(66476007)(55016003)(66556008)(38100700002)(6916009)(33656002)(9686003)(76116006)(64756008)(53546011)(54906003)(186003)(66946007)(71200400001)(8676002)(7696005)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4067
X-CodeTwo-MessageID: 15f5f6ac-bb65-44cb-aa8e-e2f8d28bb33f.20221216171441@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM6EUR05FT044.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2e31ebd-da3d-4e15-2706-08dadf8903fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G9CDkIRjfifv80yuxyqTwn1tEY8H3y5sqWcG3wXjBKivY7hlKGpHDN5BaEw8KaYVvUkhRogAmG4EijvlIy0+4YEsgwOkgFKlfFMwdR0FVwQBGSf6erqPK6442NhSNEi5YL+Nn39CoNj0AdchUjNHDHbD4SCwSGUKdSjLmLxfbZ49Y1voSFajEQA9Tt+4swQnwQZlfCiw/CV6OKLKn4F45t5MYa8x9sk4J0jecZafhWqvvGKvROpK21yWsIB6TQ1b9UYbTRkjsoTYdt1fqx2KXQwufAlgQ/iQQohAtGghnQWGPIaCsabu6JrCB1yTJV3QPvaFxxM3hxW6Cyv+ISjZb/iVKLRSuC8c11h4+Ix1pwQ5zMI5ADl2rojyglOPIj7DXSshy3zGXtdUPZYgUU/eIW+tKdWua7c+0fHLo9B7PNqRJfXpLq9iNPvsbvPg+JXGDVhh2rEqUT24Oej5VM2DU5acVYWDndUpgp3RNunI67yanZpzoh5KjVaHnpPCQ7fH4DMnURzLiRrai0g0YkG8AIDmDOfrHv4pp6bicPyBRA7E+dynLaIsgn/1iN/kTMbfue5d9DuKjqxay0p6GEaT39AT77ja/XgAwp3IGe1KVnyX7opfYoqr7JuPwt4YrlB+hRZo/MzFeVazsSResLfrKIleT8HGu7n1Rhqrkayg6MAU4TXN3Uz0ad6mQy4yukAK
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39840400004)(396003)(136003)(346002)(451199015)(36840700001)(46966006)(33656002)(5660300002)(52536014)(8936002)(41300700001)(70586007)(4326008)(70206006)(966005)(83380400001)(316002)(54906003)(36860700001)(8676002)(55016003)(336012)(40480700001)(7636003)(47076005)(7596003)(356005)(86362001)(478600001)(186003)(7696005)(53546011)(6506007)(26005)(82310400005)(6916009)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:14:42.3531 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b3dd10-eae3-417c-1387-08dadf89059a
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM6EUR05FT044.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8498
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 6/8] package/fft2d: new package
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
Content-Type: multipart/mixed; boundary="===============2769946485392928308=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============2769946485392928308==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----A2C214A3154E0F3B01490CD232219AC5"

This is an S/MIME signed message

------A2C214A3154E0F3B01490CD232219AC5
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
Subject: [PATCH v2 6/8] package/fft2d: new package =0A=
=A0=0A=
From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
This package is required by tensorflow-lite.=0A=
=0A=
This package doesn't provide a conventional install mechanism so=0A=
we need to install it manually.=0A=
=0A=
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
=A0package/Config.in=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +=0A=
=A0package/fft2d/Config.in=A0 |=A0 7 +++++++=0A=
=A0package/fft2d/fft2d.hash |=A0 4 ++++=0A=
=A0package/fft2d/fft2d.mk=A0=A0 | 22 ++++++++++++++++++++++=0A=
=A04 files changed, 34 insertions(+)=0A=
=A0create mode 100644 package/fft2d/Config.in=0A=
=A0create mode 100644 package/fft2d/fft2d.hash=0A=
=A0create mode 100644 package/fft2d/fft2d.mk=0A=
=0A=
diff --git a/package/Config.in b/package/Config.in=0A=
index 2ec623ed8f..fe636fde9d 100644=0A=
--- a/package/Config.in=0A=
+++ b/package/Config.in=0A=
@@ -1988,6 +1988,7 @@ menu "Other"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/elfutils/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/ell/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/falcosecurity-libs/Config.in"=0A=
+=A0=A0=A0=A0=A0=A0 source "package/fft2d/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/fftw/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/flann/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/flatbuffers/Config.in"=0A=
diff --git a/package/fft2d/Config.in b/package/fft2d/Config.in=0A=
new file mode 100644=0A=
index 0000000000..38394f6170=0A=
--- /dev/null=0A=
+++ b/package/fft2d/Config.in=0A=
@@ -0,0 +1,7 @@=0A=
+config BR2_PACKAGE_FFT2D=0A=
+=A0=A0=A0=A0=A0=A0 bool "fft2d"=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 This is a package to calculate Discrete Fourier/C=
osine/Sine=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 Transforms of 2,3-dimensional sequences of length=
 2^N.=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html=
=0A=
diff --git a/package/fft2d/fft2d.hash b/package/fft2d/fft2d.hash=0A=
new file mode 100644=0A=
index 0000000000..a1b1a326ae=0A=
--- /dev/null=0A=
+++ b/package/fft2d/fft2d.hash=0A=
@@ -0,0 +1,4 @@=0A=
+# Locally calculated=0A=
+sha256=A0 ada7e99087c4ed477bfdf11413f2ba8db8a840ba9bbf8ac94f4f3972e2a7cec9=
=A0 fft2d.tgz=0A=
+# License files, locally calculated=0A=
+sha256=A0 0b2a2082537735a2a576dbec2e8f9c1a09812eac6df6a389502a6ba860072906=
=A0 readme2d.txt=0A=
diff --git a/package/fft2d/fft2d.mk b/package/fft2d/fft2d.mk=0A=
new file mode 100644=0A=
index 0000000000..6263b1af38=0A=
--- /dev/null=0A=
+++ b/package/fft2d/fft2d.mk=0A=
@@ -0,0 +1,22 @@=0A=
+##########################################################################=
######=0A=
+#=0A=
+# fft2d=0A=
+#=0A=
+##########################################################################=
######=0A=
+=0A=
+FFT2D_VERSION =3D 2006.12.28=0A=
+FFT2D_SITE =3D https://www.kurims.kyoto-u.ac.jp/~ooura=0A=
+FFT2D_SOURCE =3D fft2d.tgz=0A=
+FFT2D_LICENSE =3D readme2d.txt=0A=
+FFT2D_LICENSE_FILES =3D readme2d.txt=0A=
+FFT2D_INSTALL_STAGING =3D YES=0A=
+FFT2D_INSTALL_TARGET =3D NO=0A=
+=0A=
+define FFT2D_INSTALL_STAGING_CMDS=0A=
+=A0=A0=A0=A0=A0=A0 mkdir -p $(STAGING_DIR)/usr/include/fft2d=0A=
+=A0=A0=A0=A0=A0=A0 $(INSTALL) -m 0644 $(@D)/*.c $(STAGING_DIR)/usr/include=
/fft2d=0A=
+=A0=A0=A0=A0=A0=A0 $(INSTALL) -m 0644 $(@D)/*.f $(STAGING_DIR)/usr/include=
/fft2d=0A=
+=A0=A0=A0=A0=A0=A0 $(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include=
/fft2d=0A=
+endef=0A=
+=0A=
+$(eval $(generic-package))=0A=
-- =0A=
2.34.1=0A=

------A2C214A3154E0F3B01490CD232219AC5
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
BTEPFw0yMjEyMTYxNzE0NTFaMC8GCSqGSIb3DQEJBDEiBCAMAhiRDf9PPnM3jvtm
P1+ab/ecfaY02KxDDtKNFORUNTB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYCG9PWEbuPHBCaHwEh2sKGHaZTT2ItbxCsVb5REyMQ9
O/JxOVRsmWfiWu62SAsTk3QFYKvgxGzMGS1t1hH3c0UMGJz3EYmhHAFFrYUh4WH3
hVpvZ77+LWdaFAhTQHaFu/eNjqfC7HES4sKrhBoiAQf0N7EtoRYZkbXEtC2BMg83
srE/SArLr7Mm3IU1fUGLikSTjDZ9C/NHSgJz9i4N0xAyyQavuYPR2AxfDOasi7BJ
kVNltbNdGIL6veguiAkuOoP0hCNcYK6cdfXqqak9OLzbATQdPDFYBtCPC1dGe5Sy
iI56r6Xui6WTW4QxDNHxwRMQG6OM6/jRmii1Ymv0LSW4UwYv0efdn+RYM1u1ebgI
1CAr3WUJmUpHhX+ay0t2YdA2h3A8dl4pxM/nhmbzQ1QclHtZBNeLi/4ThSEHwd0Q
cgn6QHyu2XM/aFIszMTVTQI3wgRypdUPsDcqvbHcpwpjbZRiPGwv+3mTuThjjnfw
WymX0b4m8bjBteu72ATLL1E=

------A2C214A3154E0F3B01490CD232219AC5--


--===============2769946485392928308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2769946485392928308==--

