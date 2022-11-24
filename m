Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8B3C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AD244179A;
	Thu, 24 Nov 2022 14:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD244179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jputGloyfPpZ; Thu, 24 Nov 2022 14:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3527417B6;
	Thu, 24 Nov 2022 14:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3527417B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5ACE1BF964
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0BBF404CF
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0BBF404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00JVQKBsx1Uk for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:13:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 642CC402F3
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 642CC402F3
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:13:11 +0000 (UTC)
Received: from mail-he1eur04lp2055.outbound.protection.outlook.com
 ([104.47.13.55]:13550 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1oyCsc-0002lE-28;
 Thu, 24 Nov 2022 15:07:06 +0100
Received: from DB6PR0601CA0024.eurprd06.prod.outlook.com (2603:10a6:4:7b::34)
 by AM8PR06MB7012.eurprd06.prod.outlook.com (2603:10a6:20b:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 14:07:05 +0000
Received: from DB8EUR05FT008.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::8d) by DB6PR0601CA0024.outlook.office365.com
 (2603:10a6:4:7b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Thu, 24 Nov 2022 14:07:05 +0000
X-SASI-Hits: BODY_SIZE_6000_6999 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000,
 NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, SUSP_DH_NEG 0.000000,
 __ANY_URI 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __AUTH_RES_ORIG_DKIM_NONE 0.000000, __AUTH_RES_ORIG_DMARC_NONE 0.000000,
 __BODY_NO_MAILTO 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __COURIER_PHRASE 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FROM_DOMAIN_IN_ANY_CC1 0.000000,
 __FROM_DOMAIN_IN_RCPT 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __HAS_X_MAILER 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __RCVD_PASS 0.000000, __SANE_MSGID 0.000000, __SUBJ_ALPHA_END 0.000000,
 __SUBJ_STARTS_S_BRACKETS 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NO_NAME 0.000000, __URI_NO_MAILTO 0.000000, __URI_NO_WWW 0.000000,
 __URI_NS_NXDOMAIN 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.1, AntispamData: 2022.11.24.133317
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB8EUR05FT008.mail.protection.outlook.com (10.233.238.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17 via Frontend Transport; Thu, 24 Nov 2022 14:07:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (104.47.11.106)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Thu, 24 Nov 2022 14:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aynrI2ibLr3Ie/yKGt/SectaPakI4mGXASu0y7IFGi01ni5iTAZxidG2PZiB47Ed+rYHgO7W1kDXB6lOZ9psmbMzpn1t3D8wTkCcPa3Z3Odhs0khwUAuJYj6QGkdOeDrrVkha89K7Mu5VxGKNwfEXH7nYRPznCALGyNoJ1AChZbAGfeIdSLxcbbqQPCHSUm9SL28W8Sm0m3QOka1Oh3Wuc/S68bVOCLngWxc4JAVA+tbRPgAgC1eW2h0ELGVtva/xP3ZV7NfTh0LW/Z38jwtl88w3tlI6RUMg+b92fiBY0WmLwsTSG+vyaUkamattjMpG4Y3VDT0g343dT/tVfrmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDcLdwp8imlSMIsluFTG7kxGAOT1ZooiCRHi3uhnQ1A=;
 b=Jw+ymjHdvQ152sQdPozhnZ//uWFl7U+3KOkEL26AZbHhRyQVMP0H/6pyfn6p69EKblWRkBVZCnN655V/ydjgCNV4p6frIq+fELNtEqGhPSxAvJcW/igBS89nHl/RqDprZEEb5G9kQfXNiARn/hNrVqYEQ2Q9O/e5aXHxuNFTxiPHl3EIEtG0AHGZqJUraTA2p81KF+HKwdLheB64Fc1dVS1d1Uve4Bb93x02IBV8blkbcX1iKyo8Dd6/iJ5DS5+qqUAWqWcQ9vGcUzm1oxxeYsUzxrVdsudma+22MwVJRZNekgwsYBpvyZ1E2FJAW61uwyhE7TYTKN2+niBn+Mp/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM8PR06MB7011.eurprd06.prod.outlook.com (2603:10a6:20b:1db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:06:59 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 14:06:59 +0000
From: Stefan Hager <stefan.hager@ginzinger.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 15:06:17 +0100
Message-ID: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
X-Mailer: git-send-email 2.36.1
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM5PR06MB3153.eurprd06.prod.outlook.com
 (2603:10a6:206:6::18)
X-MS-TrafficTypeDiagnostic: AM5PR06MB3153:EE_|AM8PR06MB7011:EE_|DB8EUR05FT008:EE_|AM8PR06MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 0902b938-54c4-4ee0-deaa-08dace252a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KiVTiYe56MVYmW+2m4ztlzWR5jQyGz6jyBhvo/1wdzaxR947sfgGAAwiUTA2HCU8hQQqlRsW/F1UQWXMpWAD+JYA4TcoL114ZUEtEVHKIT6TMvNBdGiCidYGN1htDFf+V7IeSArYuaBIo+O1paUefsBD06l56iU+7WTGX6yielv0Voj6brLzzWoxFEN9uff/IpRK+T+cDchd8CMpX94aCzS9chqqwq+5xr4zh+T51EuyI6qBL1Vsta6eP3rnHmYlKuDHKlKUTawb8wwucHwpO65kvIEI0CQ/ucL93+lDhkGssbQ5LbQpVI5ROtohmrSLGUVdSA+qf4azsaD3j3zyPCgsZpZtd/S0K/QIi78Kakroer9zFRjjBoHnBGpp0Tj4nia7gkXWQKAxl1pBH8YSGIHXrRcLZgewbW2c+mqjh9vmCTqk9Fcs3QLgym0gfjJP1lWUfD1FKalwUn/Bq6ho9qjl9GbWXSrthPX1X2l2d2C4PbOIug5Konu+0QxF+nhPjV9Iz4wH1dao+JZ8fI+YkYf1IpAjzZs+9nalRaT9dFDpyDPD8zjgkZwqpFCC8/9zdqzNiNvtZGNEsVSrtYWaXgSRkz/q/JLfiDTTEJdN/Hugho8mmJBxPHk2E02OhiPMk4xXcvqisjVkGsfFqk3ZBd027B4IjAFYzLMyP3l+ak41DMYSAZLqgBcwApaQHE84luK7dKEDqjzfH1YLOZHNQg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39840400004)(366004)(451199015)(83380400001)(86362001)(54906003)(6506007)(107886003)(6916009)(6486002)(6666004)(36756003)(38100700002)(38350700002)(1076003)(2616005)(186003)(5660300002)(44832011)(6512007)(26005)(52116002)(478600001)(66946007)(66476007)(66556008)(8676002)(316002)(2906002)(4326008)(41300700001)(8936002)(69594002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7011
X-CodeTwo-MessageID: 84866c9a-2e63-418b-b37e-fffaf12b98d7.20221124140703@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT008.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 324717e8-cfa6-4055-8f9b-08dace25270f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hj3cYAuZdgDt+eqnKfOR+Dq/AtYybr+xRdajCpBXYAYSR+1gZTWK5Q5UJf3icpF5GG2Qqzab7iPgwHYXqZNJxlLCDQ5rKi3EIiT0b8xPJhwEi+ZFw26uY2y4dTsHS3t32qMjD0ByzUA422UWA/RlQq02qm3/0Ccm3h4M+v338Unx0Q/lskbmnLLGWO4WR5f3te4fveKITm41PlV6B1FnUv4Oj+sB4qnNpLGegaE4yYYeEBEASDyWLRVRb0roumhYPH+LPKTVUe0MRh78yT/q3RykpeWWVIsUfEwBi/F/vhfWNrmwPq6K7EUVBnkpxANJM3OD9au5m8Wjb8mbopKZTvcOfiSv56nya32Nd0jjbvhQH8CblGtqVRwDiIRO5eZ/qvIXIKvzX8u23InGglRfXw8snZ7Sg7wDCeyMS2xfAXYhDRG0bhHiD05rX7Ti7BeamSQwpjdKCSxaavPBIYYjecFsIYZ6TjSGNqOftB8YDcggpjpHzdPtothIercAMC+iWMlV2qG7nkgvWhaZ4LCiNldcUXs+6iSV9vsj7TuaXk3a5seu/fOsL/hnf2aHTfh+tHDhFWORXcLwARS2lFsioVxHOHBzDIwXvbOVaZ15PPusqYSNAyOHvjGyn3tDUMSGQ0gcgBw/KAco27eKFVwaaJkwZtsYue+7wUNIVHKId+mTQ7dcRaBxyAsQ+Q6jFdOIXOjmvjrFzkzZNSAxeV+7Dg==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39840400004)(396003)(376002)(136003)(451199015)(36840700001)(46966006)(44832011)(5660300002)(86362001)(4326008)(41300700001)(8936002)(8676002)(82310400005)(70586007)(70206006)(2906002)(316002)(54906003)(6506007)(356005)(6916009)(7596003)(7636003)(36860700001)(107886003)(36756003)(6512007)(26005)(6486002)(2616005)(47076005)(478600001)(40480700001)(1076003)(6666004)(83380400001)(186003)(336012)(69594002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 14:07:04.6545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0902b938-54c4-4ee0-deaa-08dace252a6b
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT008.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7012
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============4071166905767873586=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============4071166905767873586==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----9134C0D0773AE03988BEAC98F1406546"

This is an S/MIME signed message

------9134C0D0773AE03988BEAC98F1406546
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

Hello,

this RFC patch series proposes a way to integrate the Tensorflow-lite runti=
me (TFLite) into Buildroot.

This first RFC just integrates the TFLite C++ sahred library.=20
After a sucessful first integration the next step wuld be to activate the p=
ython library for TFlite.=20
As a third step i plan to integrate the NPU Backend Driver for TFLite to us=
e accelerated inference on the i.MX8MP NPU (neural processing unit) for C++=
 an Python.=20
All of this currently works locally as a proof of concept for a few users.

The currently used Version of TFLite is 2.8.0 (official) which is proven to=
 work.=20

TFlite comes with a bunch of external source dependencies which are downloa=
ded by separate hidden packages and then built by the main TFLite package.=
=20
TFLite needs its own versions of libabseil, eigen and flatbuffers wich may =
conflict with the Versions provided by Buildroot.=20
Since i can not gurantee that TFlite will work with other Versions of this =
packages i decided to only let TFlite be activated if this packages are not=
 activated in Buildroot.=20

Currently TFlite only supports a limited set of processor architectures (AR=
MV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-bit Su=
pport).=20
Anyone else may activate further platforms if needed, but testing needs to =
then be done by them.

How to build a minimal config with TFLite:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
$ make raspberrypi4_64_defconfig menuconfig
Activate TFLite in menuconfig: Target packages -> Libraries -> [*] tensorfl=
ow-lite
$ make tensorflow-lite

I'm hoping for Comments to prepare a first patchset.

Stefan Hager (10):
  tensorflow-lite-abseil-cpp: new package
  tensorflow-lite-clog: new package
  tensorflow-lite-abseil-cpuinfo: new package
  tensorflow-lite-eigen: new package
  tensorflow-lite-farmhash: new package
  tensorflow-lite-fft2d: new package
  tensorflow-lite-flatbuffers: new package
  tensorflow-lite-gemmlowp: new package
  tensorflow-lite-ruy: new package
  tensorflow-lite: new package

 package/Config.in                             |   1 +
 package/tensorflow-lite-abseil-cpp/Config.in  |   5 +
 .../tensorflow-lite-abseil-cpp.hash           |   3 +
 .../tensorflow-lite-abseil-cpp.mk             |  14 ++
 package/tensorflow-lite-clog/Config.in        |   5 +
 .../tensorflow-lite-clog.hash                 |   3 +
 .../tensorflow-lite-clog.mk                   |  14 ++
 package/tensorflow-lite-cpuinfo/Config.in     |   5 +
 .../tensorflow-lite-cpuinfo.hash              |   3 +
 .../tensorflow-lite-cpuinfo.mk                |  14 ++
 package/tensorflow-lite-eigen/Config.in       |   5 +
 .../tensorflow-lite-eigen.hash                |   9 +
 .../tensorflow-lite-eigen.mk                  |  14 ++
 package/tensorflow-lite-farmhash/Config.in    |   5 +
 .../tensorflow-lite-farmhash.hash             |   3 +
 .../tensorflow-lite-farmhash.mk               |  14 ++
 package/tensorflow-lite-fft2d/Config.in       |   5 +
 .../tensorflow-lite-fft2d.hash                |   3 +
 .../tensorflow-lite-fft2d.mk                  |  15 ++
 package/tensorflow-lite-flatbuffers/Config.in |   5 +
 .../tensorflow-lite-flatbuffers.hash          |   3 +
 .../tensorflow-lite-flatbuffers.mk            |  14 ++
 package/tensorflow-lite-gemmlowp/Config.in    |   5 +
 .../tensorflow-lite-gemmlowp.hash             |   3 +
 .../tensorflow-lite-gemmlowp.mk               |  14 ++
 package/tensorflow-lite-ruy/Config.in         |   5 +
 .../tensorflow-lite-ruy.hash                  |   3 +
 .../tensorflow-lite-ruy.mk                    |  14 ++
 ...2sse-since-this-is-only-useful-on-x8.patch |  34 +++
 ...build-a-shared-library-instead-of-st.patch |  55 +++++
 ...build-tflite-with-external-delegates.patch |  59 +++++
 ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++
 package/tensorflow-lite/Config.in             |  56 +++++
 package/tensorflow-lite/tensorflow-lite.hash  |   3 +
 package/tensorflow-lite/tensorflow-lite.mk    | 232 ++++++++++++++++++
 35 files changed, 848 insertions(+)
 create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in
 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abse=
il-cpp.hash
 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abse=
il-cpp.mk
 create mode 100644 package/tensorflow-lite-clog/Config.in
 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.hash
 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.mk
 create mode 100644 package/tensorflow-lite-cpuinfo/Config.in
 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo=
.hash
 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo=
.mk
 create mode 100644 package/tensorflow-lite-eigen/Config.in
 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.has=
h
 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.mk
 create mode 100644 package/tensorflow-lite-farmhash/Config.in
 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmha=
sh.hash
 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmha=
sh.mk
 create mode 100644 package/tensorflow-lite-fft2d/Config.in
 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.has=
h
 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk
 create mode 100644 package/tensorflow-lite-flatbuffers/Config.in
 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-fla=
tbuffers.hash
 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-fla=
tbuffers.mk
 create mode 100644 package/tensorflow-lite-gemmlowp/Config.in
 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlo=
wp.hash
 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlo=
wp.mk
 create mode 100644 package/tensorflow-lite-ruy/Config.in
 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.hash
 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.mk
 create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2sse-since=
-this-is-only-useful-on-x8.patch
 create mode 100644 package/tensorflow-lite/0002-Added-option-to-build-a-sh=
ared-library-instead-of-st.patch
 create mode 100644 package/tensorflow-lite/0003-Added-option-to-build-tfli=
te-with-external-delegates.patch
 create mode 100644 package/tensorflow-lite/0004-Removed-source-repositorie=
s-and-git-pull-configurati.patch
 create mode 100644 package/tensorflow-lite/Config.in
 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk

--=20
2.36.1


------9134C0D0773AE03988BEAC98F1406546
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
BTEPFw0yMjExMjQxNDA3MTFaMC8GCSqGSIb3DQEJBDEiBCAgcDLEzL7sg7IhCol9
lu7Mxu5U/7nWtpWAfkC1L3ai3jB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYCRvSe+4IJPFiBDHzk6g8SECWvnxL+7MWArfecBbt/P
6XAW23Fg0eVFPPe8/PUGSO7Bgve88zZ9wPgzrHaqICTo7Ouq9sZNPNONL6IskMT9
AWYnVP7AU0LUKxDzaiefSiNmWIUPqijWxRW13EJ1W5NUeUGIPM1ok7nrLF9ajBiO
NNMb/JBe5tTEInov5uerPCNFRjN4JqyeZMLQSDshwJ0KGroSWwvtd7N0diU6+p+u
4ck5iMgpsJtRF9mPkaATXhEKHGyoeH3requFewYr0qyNCnQ2TWa794Fl/m4JU1iH
uBWjYXSRlUznO7Sv/1bqZwE6D2Ibi6ZZII7l2D42QXO0BN67CdCy5oJ9aNcuFoxi
+sNf9r3rhg5yMoBUNBd7fZePmVbMU8/ACKlHuicF6A98GeACiwbyuzgsxkokDRQD
b3dcFmuSA+KT+t8eWnIbnhxEqeKPaGi6p/Mn6GjFbUsZhnz7GB/lFRrWTUzA/WXw
Pw8lNTs+KKSRTshUmJTkFVE=

------9134C0D0773AE03988BEAC98F1406546--


--===============4071166905767873586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4071166905767873586==--

