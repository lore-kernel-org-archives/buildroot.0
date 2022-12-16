Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D0C4167B
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E74DD40131;
	Fri, 16 Dec 2022 17:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74DD40131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnU7hWjrlW1R; Fri, 16 Dec 2022 17:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0782B410A1;
	Fri, 16 Dec 2022 17:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0782B410A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA5681BF2CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4BB680F2C
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4BB680F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxwlR5SKyqvI for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:04:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D94F80D4B
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D94F80D4B
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:04:23 +0000 (UTC)
Received: from mail-he1eur01lp2057.outbound.protection.outlook.com
 ([104.47.0.57]:6113 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6E85-0001eU-2H;
 Fri, 16 Dec 2022 18:04:14 +0100
Received: from AS8P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::27)
 by VI1PR06MB6365.eurprd06.prod.outlook.com (2603:10a6:800:128::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 17:04:11 +0000
Received: from AM6EUR05FT056.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::a0) by AS8P251CA0024.outlook.office365.com
 (2603:10a6:20b:2f2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 17:04:11 +0000
X-SASI-Hits: BODY_SIZE_3000_3999 0.000000, BODY_SIZE_5000_LESS 0.000000,
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
 AM6EUR05FT056.mail.protection.outlook.com (10.233.241.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 17:04:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.53) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Fri, 16 Dec 2022 17:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af3mePP4XHfqI2VloH806Sgu8/8YAnZ0PtL7bsYosNsEaBR5l2zb6x7jOTATCh1d4qUXkuY0wGCnOeD+cJRjlS6FZpgilN0tpiVXSQLO1QY4xuO/ra7oAoUn8q4du0n2h3qz/ps3va4tdqDdEAfGouye0/hMOODZYenb7ffOnc909/YdtPkliKzadjurhmtEWZCBEIgoRD+LlpnL1hbxpKRPs6y5Ji1HZDjcC7c0AA09P1vU5B3Q9dk7PmSDXZtPkB6+LgSATI2BZ1d4IbosT25PjiqAfEI2MgOUfVeVgXq2BFsBu07yv3hClpUYdf18piXnEYK8T3YLyT1IdfWVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=263YUbIJ+jImkxRkkyMn8/qYANLr2h7JbXQoSjTqbhs=;
 b=hQFV3CLQtLFrFTzPsFnXdPueIxX/7jVUPUOUc2oRApM4a8EJlGhsLfL9n9SzRKpPG16moslTHh4bK4yS+cdLsJGPKyxQw8se/fdWkjlX0BwfsysmuYs1Nn8f5MZCTpVmwgFt2OCgTyiFOi/GVjhyCByVPIipF15E9OcTXJGu8WVSPCllXXzJHE7zMki2Uu7Y1nz81kmJTuu1pW08EX+QMTksKTpTuIjOEwNRKKZzPfVIzv4GQNa3BnK/oEP5OVYKjyKLFNmW8bF8KX+1TF4ecxzSIj8gEyL1PXeimspYzTU4TM7BpTzQy/7qerlnyqo2M1/Z+vK9uXakUDurGES3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by DB6PR0602MB3286.eurprd06.prod.outlook.com (2603:10a6:6:4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:04:09 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:04:09 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1MZ1MUeC+oE50iuL8faVFtup65w2ddj
Date: Fri, 16 Dec 2022 17:04:09 +0000
Message-ID: <AM5PR06MB31531896EC0620E6C8AE6CD084E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-2-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-2-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|DB6PR0602MB3286:EE_|AM6EUR05FT056:EE_|VI1PR06MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: a8088483-1d9a-4f68-1b0e-08dadf878d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: w1uqJ3O6zV7YRNKh3g54+dwIbM64j/CYZpjlxyjEQadxiFsIZC02VYgwar3EGp+W+9xlfB7MGSUQ7M30nNGnGDbHWcsq6EksPIAyXAVR+k+djPbf/no8/Dea9FTWMo3end9SjUnD8eq8lBOqvocMTlW763fVvCuChb5t931AfcgRqi5YGqQzEOzKOMdQWZEjE+wf/f1gA7CCAfD33zJhX9v+XM7SY+IeOSUKrJRYokKq2Wu+XtxdgKjRn3Wy84Mr8sBxZ/un/ecvzonvNbCeKl4MbvUO4zE1cTsRcyfH3hQ3C6+Ji1gGByU68Bj8+rQ0OBdIJUl30TMVwDDaap3uy0tINZcBYZfN7nVlkrV/xeE71UwVVUvk5JmeIINPa8EujkYklxlurWd4rIFV755L3NmhQqcDDO2AMQ0plY0l1YwsTI8RWbWpH7/47LpPJvNRebunBTPnlW6xTuzSTJZ4rrJUULWoKenYazUN8Rsgo9GC3fppr0THk77atIquyjR+LE9cKvvl4gcZK3WnuGBHGx/I7+YQf3+Kp7AOFsjc6N0sF+jkIwwSGBWHL58hRzrqnRYxGbjtxt1eQyN/yP917NewXF1yRuHDuQMOsC3bZy5g/a8gAIpyjfsIHb0lQ+3lMTnkS4kKIBL9lqT/9scGN+v7Fouu8yn0T22Jj84JHSfov4H7+4RyZpWkVd6DW9E5lBS7sdJN9/NZAeg3R1BmhhywJUCyNf15nw4brDm0EKc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39840400004)(396003)(136003)(346002)(451199015)(66556008)(66946007)(91956017)(76116006)(66476007)(316002)(6916009)(66446008)(4326008)(8676002)(64756008)(55016003)(38100700002)(54906003)(8936002)(52536014)(5660300002)(2906002)(33656002)(966005)(122000001)(53546011)(41300700001)(7696005)(38070700005)(83380400001)(9686003)(186003)(26005)(71200400001)(478600001)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB3286
X-CodeTwo-MessageID: 52fda726-a001-4668-917e-c33854442ac5.20221216170410@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM6EUR05FT056.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 859ecc50-d852-4bc1-4183-08dadf878c30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axDNJSiATGogKBJRgQOSuN37We3O7dLd63ZDEu4ui14fmEqO7z4yKM5DAcnp7YHcNv/XOGOHeXho/xSTmWOpZoDTqWqeEQ0Ec5x8iw6lRIA+uWAz3lE0U3Jam5NhMYSmZN7gsqtEICF+Jgh+1ONHESy07S9lGZNikTf6Yd34D3V3bqqybwUzOxUofvU3FZ74lhO4jtwJMghtCAN10ox0m3hUNdsTQpvjIVHduv6xe85Wn4eYIL6E5L4Sc4Qrrd4OPu1hgjYNJvWvFidqo4TWQkjeXiP84cpkbKz6KKsBRAs6VHVyy2EatHWX1FATltZ2ZnNpTIuhOTFOjmjuUWUiUj7gDGLC6cYlJtLFz4HnhF+Gy/co+GhLnd4UhJIXDMLql8QJWdWCLIwXQe1DxsV4t7c6FRib/E9En84viHUAXSHkAJEOSkSSp3VcSyG0C85xzOU/gJmTWbc6eSs84nLAPGn5/AX8seuvFzQKzuZ/6bb3mAT/olpSjtT+o4tBOrzQK8OuT+eOgUZ9K8OEFIsN8q76Dpzz5WfLpWeH8iqDLcOzyJEAUdokOOM4src1Jjxh6gd9GMhxKPXLqaMHLXHhfKiINz+xrvr2gMGokO1WlqhDdkmrA+BXb6QBdzovNHoFBiseh+Nflra5ZkU4zf4a4Ewh72z79Z41nnxta/3gUaqSw4JkoqGMrM7/AdJTrzIV+znzvSIKLIX9EuTcg8K9jA==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39840400004)(376002)(396003)(451199015)(46966006)(36840700001)(316002)(55016003)(40480700001)(33656002)(2906002)(966005)(7636003)(478600001)(54906003)(6916009)(7596003)(41300700001)(86362001)(82310400005)(70586007)(70206006)(7696005)(5660300002)(356005)(186003)(9686003)(26005)(36860700001)(6506007)(53546011)(8936002)(83380400001)(4326008)(52536014)(8676002)(336012)(47076005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:04:11.3096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8088483-1d9a-4f68-1b0e-08dadf878d76
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM6EUR05FT056.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6365
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/8] package/cpuinfo: new package
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
Content-Type: multipart/mixed; boundary="===============6131428149285461323=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============6131428149285461323==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----AEB8643E9BA42C43819946A01FC375B0"

This is an S/MIME signed message

------AEB8643E9BA42C43819946A01FC375B0
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
Subject: [PATCH v2 2/8] package/cpuinfo: new package =0A=
=A0=0A=
From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
This package is required by tensorflow-lite.=0A=
=0A=
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
=A0package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +=0A=
=A0package/cpuinfo/Config.in=A0=A0=A0 |=A0 9 +++++++++=0A=
=A0package/cpuinfo/cpuinfo.hash |=A0 4 ++++=0A=
=A0package/cpuinfo/cpuinfo.mk=A0=A0 | 17 +++++++++++++++++=0A=
=A04 files changed, 31 insertions(+)=0A=
=A0create mode 100644 package/cpuinfo/Config.in=0A=
=A0create mode 100644 package/cpuinfo/cpuinfo.hash=0A=
=A0create mode 100644 package/cpuinfo/cpuinfo.mk=0A=
=0A=
diff --git a/package/Config.in b/package/Config.in=0A=
index aef80f9ab0..e09fa0b3bd 100644=0A=
--- a/package/Config.in=0A=
+++ b/package/Config.in=0A=
@@ -465,6 +465,7 @@ endmenu=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/cc-tool/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/cdrkit/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/cpuburn-arm/Config.in"=0A=
+=A0=A0=A0=A0=A0=A0 source "package/cpuinfo/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/crucible/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/cryptsetup/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/cwiid/Config.in"=0A=
diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in=0A=
new file mode 100644=0A=
index 0000000000..137f657d69=0A=
--- /dev/null=0A=
+++ b/package/cpuinfo/Config.in=0A=
@@ -0,0 +1,9 @@=0A=
+config BR2_PACKAGE_CPUINFO=0A=
+=A0=A0=A0=A0=A0=A0 bool "cpuinfo"=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_INSTALL_LIBSTDCPP=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 CPU INFOrmation library, cpuinfo is a library to =
detect=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 essential for performance optimization informatio=
n about=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 host CPU.=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 https://github.com/pytorch/cpuinfo=0A=
diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash=0A=
new file mode 100644=0A=
index 0000000000..c3f70fa90f=0A=
--- /dev/null=0A=
+++ b/package/cpuinfo/cpuinfo.hash=0A=
@@ -0,0 +1,4 @@=0A=
+# Locally calculated=0A=
+sha256=A0 0936848904943381b2c01321101614776e43d583840ee0f3ceeea1e3fb7405f7=
=A0 cpuinfo-de2fa78ebb431db98489e78603e4f77c1f6c5c57.tar.gz=0A=
+# License files, locally calculated=0A=
+sha256=A0 8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70=
=A0 LICENSE=0A=
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk=0A=
new file mode 100644=0A=
index 0000000000..ab6a0269ec=0A=
--- /dev/null=0A=
+++ b/package/cpuinfo/cpuinfo.mk=0A=
@@ -0,0 +1,17 @@=0A=
+##########################################################################=
######=0A=
+#=0A=
+# cpuinfo=0A=
+#=0A=
+##########################################################################=
######=0A=
+=0A=
+CPUINFO_VERSION =3D de2fa78ebb431db98489e78603e4f77c1f6c5c57=0A=
+CPUINFO_SITE =3D $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))=0A=
+CPUINFO_LICENSE =3D BSD-2-Clause=0A=
+CPUINFO_LICENSE_FILES =3D LICENSE=0A=
+CPUINFO_INSTALL_STAGING =3D YES=0A=
+CPUINFO_CONF_OPTS =3D \=0A=
+=A0=A0=A0=A0=A0=A0 -DCPUINFO_BUILD_UNIT_TESTS=3DOFF \=0A=
+=A0=A0=A0=A0=A0=A0 -DCPUINFO_BUILD_MOCK_TESTS=3DOFF \=0A=
+=A0=A0=A0=A0=A0=A0 -DCPUINFO_BUILD_BENCHMARKS=3DOFF=0A=
+=0A=
+$(eval $(cmake-package))=0A=
-- =0A=
2.34.1=0A=

------AEB8643E9BA42C43819946A01FC375B0
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
BTEPFw0yMjEyMTYxNzA0MjFaMC8GCSqGSIb3DQEJBDEiBCBrlJE1rdcBITMj3wKr
S728Eyext+OiaMigfURjRZnf1DB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYAKtlKIu2TNf8CyfhAzXDN1bQJCcKR22Ub0/iiRIq1K
bON6QduSLe7HBEx5UgM34ddHTxtsoylKbp5cogoYmQOnGE4TMz8QyVRs+lMr5v10
rupyM93+5+pWREcO74ajVTSdAYRgNtX3u4c+ZabGR+JVfrjO8Rv8pnKx4zHGLfCb
F2p+iKzHsZaYXPFJEyo5r8IN9xnLk4jM3O9RLD5Nwjsvo3ZBvrJpH6+KLCwpRSS9
+WUXsoyjsQtGHGzfjp5milvFWPdcdsbrFlzN3v1C7WQ3ExMIfGij/sVzpdk8h3pS
kFYluCmqMPrqBQubuaiZn9n8U47HpN/M2OrS2G+z/MTCYUm7X9q4ND7XKoxHP+fL
g2IBjsWJIr4WYwoqJZTmuLC2CaBtIhHyt3gZy/iC30W5dbAhL/ctmGVBR5tdqdAC
eCJm+ZgR6WCnFnWzbg6NIglYPqcMkYQJIXEvXcCP/5HFCpToVmF0Dl+S9ObZzU8c
Yl54xx6misAo8GmWTzYqaOI=

------AEB8643E9BA42C43819946A01FC375B0--


--===============6131428149285461323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6131428149285461323==--

