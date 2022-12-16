Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71E6C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E071B41C57;
	Fri, 16 Dec 2022 17:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E071B41C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fuzpp7gUTPJc; Fri, 16 Dec 2022 17:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D442041C8C;
	Fri, 16 Dec 2022 17:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D442041C8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F094B1BF2C3
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D841A60BB8
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D841A60BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYBFgms3fOOJ for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:01:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE1C360BA1
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE1C360BA1
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:01:54 +0000 (UTC)
Received: from mail-db8eur05lp2109.outbound.protection.outlook.com
 ([104.47.17.109]:62901 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6E5g-0001cN-08;
 Fri, 16 Dec 2022 18:01:44 +0100
Received: from DB6PR07CA0065.eurprd07.prod.outlook.com (2603:10a6:6:2a::27) by
 DB7PR06MB5913.eurprd06.prod.outlook.com (2603:10a6:10:8d::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Fri, 16 Dec 2022 17:01:40 +0000
Received: from DB8EUR05FT042.eop-eur05.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::16) by DB6PR07CA0065.outlook.office365.com
 (2603:10a6:6:2a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.5 via Frontend
 Transport; Fri, 16 Dec 2022 17:01:40 +0000
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000, 
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000,
 SUPERLONG_LINE 0.050000, SUSP_DH_NEG 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000, __CT 0.000000,
 __CTE 0.000000, __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000,
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000, __FRAUD_BODY_WEBMAIL 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FRAUD_WEBMAIL 0.000000, __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000,
 __HAS_FROM 0.000000, __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000,
 __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
 __TO_REAL_NAMES 0.000000, __URI_MAILTO 0.000000, __URI_NO_WWW 0.000000,
 __URI_NS 0.000000, __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
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
 DB8EUR05FT042.mail.protection.outlook.com (10.233.239.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.16 via Frontend Transport; Fri, 16 Dec 2022 17:01:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.52) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Fri, 16 Dec 2022 17:01:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmW8nldGNrZigAxM7/rt5MZ6P/2ge47fG6O9t3m0SHnORxIgPvMaQexwz2dbfKio0AdN1HWJsREzroKi2wUvUqS9j5CA2d9ACG4bSKx/JhjS5YT3PmgZ+4bZxAC1XirJQXR9cMzOLbWw6OHOnO1g6H9XpHJr8Vfl4EZudXM4YVR7Pz/3UiAmcGU/+nWk95wjrigmuJl+1Fyyi1QbwF5oR+YqCK2cjXYutvPkYCCXyinsykOzy2CAd0agTAZ7CEX5i9LNNT9zOXme9OThkiBewHxUit4UBRUwoVUaWsbj1h0w+7pGyRbGy5ZboQL7hVFgGx0Swuuhgc72y2Hh2QM49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2VjJBXqGleZ6hA4YZrzFBeGJA3QWbLuzZ3U2+g8Z7w=;
 b=UsF06egJ0b7LtSJl218cURqC58u1oeGj81ukmpiQIogBdmVRcU2Rih7zKX8oycH9jejHjku61kcOp7N0PKssX3EQr4FqbyexSGqwcQvVux+DzTpCt50muKTaHmP+wwg1lSMurmoO3tFxrxICVl8JtsUMsxiNF+JwHp/1F/kPUOIuNldV6th7lTCn3QQqbDD0Z2Frmj5labHk8h0sFuA0mB7GZQWo+Ww1sqREIyTSBK3RQwTLhJkCfu0nOtN75HFqvVeF+uURpZFdV/BIf6lx4L7D7gGZH+eUVXHvOVoBLStEAyQfW0EngktfrBVTKkg8aYY/6QXEurMGBfY3BhSzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by DB6PR0602MB3286.eurprd06.prod.outlook.com (2603:10a6:6:4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:01:38 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:01:37 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1MacQma4lUSTUWo0Q/BEU0sDa5w14O2
Date: Fri, 16 Dec 2022 17:01:37 +0000
Message-ID: <AM5PR06MB3153069F759035C4C04CDF9C84E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|DB6PR0602MB3286:EE_|DB8EUR05FT042:EE_|DB7PR06MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 4879f106-988e-400b-3ddb-08dadf873395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 38IAxIzU2yzJlar722z3Tadz1RvEALRe3OTu8CS+0sV7GHDa3JugrAAudw768ROoD/XjZIWNCfFHEn4G3wkzbGd1NY5GEwRh54a/woOCmUza1kYVIpkSR6XCXQvPbxWnBcB3Do+REB9ykbunaqpp21JJpJ4OzkAKhqPOyRgG4ZH96SzghqRMRKJhh4JV/TM7cwc/uAEUPWYA6YuQ4BvNsgA1rolesk9iU5S7giseaaxRZAk0tUiWcfIxIRmEf6wurPeCBqUtal8qdimDaipaGOaYIoA4qCjFgKdnrsinHV6bJZBPzJVc4fygfGChsJMMRo1SHWUeyYpA8gOC0ujdaG7jJzbxo70H24fk2OoUo+YDg4fuXH2aRZbu+ZA5TYgyUIv5mW4pf8JDXyPWaDlwuKTbk+YKFrIZUhk794FuLoW8+4nxdYyZOC2RPzMVrCLA5YYgNIyHVvNNju4X0zXZ+JWI2K6VcFehd6+5tLscuR0EotUZ5o53JRO71/p5FGIJCWbVlRkiAUT/3zW4pZ0FByvKr/eCvaYxJw0S/w/Ri1VjeDqQ7s7YcNveTuGfNL4S0CxQjo4VFJHSCeYCnUGCVhZGMah2Rrcc50ndXl2j7CXLGHzn6BB3k51y/gizfSos7u/bn//zKR4fmyFNh0O/eHD2S45o+MW3oQ5DWfN2tgVzwW8MMiZe3kuTEj57wsqGpRwfQh+7TFON9Xa+RVf3LA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39840400004)(396003)(136003)(346002)(451199015)(66556008)(66946007)(91956017)(76116006)(66476007)(316002)(6916009)(66446008)(4326008)(8676002)(64756008)(55016003)(38100700002)(54906003)(8936002)(52536014)(5660300002)(2906002)(33656002)(122000001)(53546011)(41300700001)(7696005)(38070700005)(9686003)(186003)(26005)(71200400001)(478600001)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB3286
X-CodeTwo-MessageID: 895249d1-f9b4-4a09-b73f-a8389aac7846.20221216170139@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT042.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c6340e15-3e4c-401b-4489-08dadf8731e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIJh6CY7s+yYbl0ZNcjBlIEse71duUwAUDbVMz88Y8xocBXABwTEF5ePF2zRMlB/A5qlJH/SYbxDk4fRAa85YpF90Ms8shiz3RJSzOsT1+quPwxgv+4KSmQTtc6IbVEEjDiGG7ZvY7yZn2M8QVjtETifmX5rZCu7WbRIyu9Cyvc31rweFb2iGCjlpWQqDqxSnreVf54ig1BTHjIBPMPUfX/0hFycZd6klHKiwvanTQJXSfyD8tIxkG5IG1/vxrfyFeJ562zGJsmumoiAd9W3yQqKDoECeli01PDthBDv+k2aLHv4mhAhhOsEmLQPjF6AAYOd2kWCL5J8gftm3gzUNPXl4iYQoRBJwRtGVOjfp6ILBLOmtEry7CE7B6mSmsfEgbbnfLCxRtUUUNrTIwEJLbSBw/nTBWxG7JmH0vT4VzwbPbzc0HpoLJWvcRwIVPbSwhI0zpjZiHM19SV5PNSNAmKv8zwnJEsFv1TdJQwdgVbijsqfiAls7hnhxmicF8DZAvI8+Z0yQBFOIsHHS9WmWnb8ib26lyoM4eY5rrKQnI7aZMKEeADQs6+9U6hznz4Zo3qDnwIxZQqXH49NvNsZhbOb0SNo45Bdi1pvOiAUQufF00JhIIxgQIhvmPOFy/4dwlt4B2eqzq4HaL1KK7+HIJvbjQHeoj4Ohv5Cw54QYmQ=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39840400004)(136003)(396003)(451199015)(46966006)(36840700001)(5660300002)(7636003)(7596003)(2906002)(86362001)(47076005)(356005)(36860700001)(33656002)(478600001)(70586007)(52536014)(54906003)(6916009)(4326008)(26005)(41300700001)(82310400005)(336012)(70206006)(8676002)(8936002)(186003)(55016003)(6506007)(316002)(7696005)(40480700001)(9686003)(53546011);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:01:40.4250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4879f106-988e-400b-3ddb-08dadf873395
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT042.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB5913
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/8] package/flatbuffers: build position
 independent code
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
Content-Type: multipart/mixed; boundary="===============0836097892103470592=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============0836097892103470592==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----5067370CEBFC31203237E3F0A3EC9B00"

This is an S/MIME signed message

------5067370CEBFC31203237E3F0A3EC9B00
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Tested-by: Stefan Hager <Stefan.Hager@ginzinger.com>=0A=
Acked-by: Stefan Hager <Stefan.Hager@ginzinger.com>=0A=
=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Monday, November 28, 2022 18:58=0A=
To: buildroot@buildroot.org <buildroot@buildroot.org>=0A=
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Fabrice Fontaine <font=
aine.fabrice@gmail.com>; Samuel Martin <s.martin49@gmail.com>; Hager Stefan=
 <Stefan.Hager@ginzinger.com>; James Hilliard <james.hilliard1@gmail.com>=
=0A=
Subject: [PATCH v2 1/8] package/flatbuffers: build position independent cod=
e =0A=
=A0=0A=
The upcoming tensorflow-lite package requires flatbuffers to be=0A=
built with position independent code.=0A=
=0A=
Fixes:=0A=
/home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../li=
b/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linu=
x-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/=
host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.=
o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers1=
1CharToUpperEc' which may bind externally can not be used when making a sha=
red object; recompile with -fPIC=0A=
=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
=A0package/flatbuffers/flatbuffers.mk | 1 +=0A=
=A01 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatb=
uffers.mk=0A=
index 9d286bf9e1..487d85ee1f 100644=0A=
--- a/package/flatbuffers/flatbuffers.mk=0A=
+++ b/package/flatbuffers/flatbuffers.mk=0A=
@@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES =3D host-flatbuffers=0A=
=A0=0A=
=A0FLATBUFFERS_CONF_OPTS +=3D \=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 -DCMAKE_CXX_FLAGS=3D"-std=3Dc++11" \=0A=
+=A0=A0=A0=A0=A0=A0 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 -DFLATBUFFERS_BUILD_TESTS=3DOFF \=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 -DFLATBUFFERS_FLATC_EXECUTABLE=3D$(HOST_DIR)/bin/f=
latc=0A=
=A0=0A=
-- =0A=
2.34.1=0A=

------5067370CEBFC31203237E3F0A3EC9B00
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
BTEPFw0yMjEyMTYxNzAxNTFaMC8GCSqGSIb3DQEJBDEiBCBZSGqN9uB/424RQBIf
rUWwDDQCT1L+C9eGs5HWdV9BIDB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYCfVY60sQ67b3KilJzASeumsQIRCJ1iXCZmRx8/fctS
Laq30xlML95iRPf8bI4fGxLSOjqLsN+gvW+08xBdaIIh0XV3MIoTQDfjga3SWnyt
UsIdSiBoWIVAPc75446dPRcSNfm7+PyDVSYw0wtcx7niSv8N9cVACTCb1GNejyeV
/hjmkQan8RaWwXdgzwf+wMY+mw4mr5JCVC4owy6HcNbY/vC/K87yk4UIryNOep8R
2pv+l91XklbVkWdo/7iI7t8F1j2zUBot4nbeVzSKzu/asF/7nNp5vC4LS5x32xF1
pS/bsH92ZAe12vRO6+FbZCwSFn2hX/z6RF+2jLyAo4bPSS8yqdZHjj00E/iAY1fM
v9vXzIl87S1LzCD1mWlwfCqZAH1C8/tvAfVTTe2IeU1BqKGL3MQv5+N4LJ2uj+KK
dgaY63wCMj2mgGcd/DFAw5WkooMrlCtqIm8UR3K8ofEIAO2/ngujH028yTUk1tOY
oPwq1aipNxf69E/QtzWsVQw=

------5067370CEBFC31203237E3F0A3EC9B00--


--===============0836097892103470592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0836097892103470592==--

