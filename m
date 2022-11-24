Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4BC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92515404CF;
	Thu, 24 Nov 2022 14:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92515404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuNEMC5bO-OB; Thu, 24 Nov 2022 14:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EDC640C92;
	Thu, 24 Nov 2022 14:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EDC640C92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B45891BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03D7140017
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D7140017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6U5bldfUvNSv for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:13:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD0AC414A1
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD0AC414A1
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:13:08 +0000 (UTC)
Received: from mail-am7eur03lp2233.outbound.protection.outlook.com
 ([104.47.51.233]:11930 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1oyCsh-0002le-09;
 Thu, 24 Nov 2022 15:07:11 +0100
Received: from DB8PR03CA0001.eurprd03.prod.outlook.com (2603:10a6:10:be::14)
 by AM8PR06MB7154.eurprd06.prod.outlook.com (2603:10a6:20b:1c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:07:08 +0000
Received: from DB8EUR05FT044.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::d1) by DB8PR03CA0001.outlook.office365.com
 (2603:10a6:10:be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Thu, 24 Nov 2022 14:07:08 +0000
X-SASI-Hits: BODY_SIZE_10000_PLUS 0.000000, BODY_SIZE_25K_PLUS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000,
 __ANY_URI 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __AUTH_RES_ORIG_DKIM_NONE 0.000000, __AUTH_RES_ORIG_DMARC_NONE 0.000000,
 __BODY_NO_MAILTO 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __COURIER_PHRASE 0.000000, __CP_URI_IN_BODY 0.000000, __CT 0.000000,
 __CTE 0.000000, __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000,
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000, __FILESHARE_PHRASE 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HAS_X_MAILER 0.000000, __HTTPS_URI 0.000000, __IN_REP_TO 0.000000,
 __IOC_PHRASE 0.000000, __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000,
 __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SUBJ_ALPHA_END 0.000000,
 __SUBJ_STARTS_S_BRACKETS 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NO_NAME 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000,
 __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
 __URI_NS_NXDOMAIN 0.000000, __URI_WITH_PATH 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
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
 DB8EUR05FT044.mail.protection.outlook.com (10.233.238.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19 via Frontend Transport; Thu, 24 Nov 2022 14:07:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.55) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 24 Nov 2022 14:07:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEHiW9TdGhJukAlQ/DG8fShFcUbW67iSVZ6aiXGabaaL6EBDBFzjnVt0VMuOJ1wq4uj5ADyC7Qymh+KYtcE/GKo0W2euKs1JvmXkcT/hNKK2o18s3FOHQBi/hOA/5+ZGInzY72jbUBzygGuxBxL4Nkt1Y8/bTfJEn9CNvWm9LviKTgbGgrkf9tqcVftW0Zh7vRpJeILOK0fRlWiXBmOciswvKLEQ4HETtV+bnT07ZkJ+ZWV+qc5fJ3ZO0rrIsg3GFeRg3Zku89uAUNu/NbvDKHI4usiUKudMOHm/Reeoz7Bd/DrXvhyLHl5UENe11bqssFv4V4WuzalhvF8J9gWGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHdOGQB/6fXkQYDulyi/kSn9BEbCBhpBVPeSRGkQ8D0=;
 b=l9T0zh5tlB7FwvME5EMYUWnqq5yhdSUyh2/JS3iSdZ/uZybaUjwq5KQIHzeZA2xk2GDdAzObyutmh8QLxxv/eUMqsoFlaSBOsVJj3HjBrhTt3cAzfccl5XL7Y9rPmRMaWjz3SKIV2VzTzpfXn1ilYp2ITZnlM0TT044FEXmTXLVGzttUrQ/q0Ll0vbQilrgPhvJWfzMMBFCIH8rH9OqBzdiBaY00izEj8sctpOZB3SMuVqYjQKYRQHGmqYYFQvZQXGKci1tywhqosdD3mWx40mhZr4H4NJc1Ai/FVC4/RzFigmLuXaF1us8lKZecyTExWvfNCvC6Tsnzp/Eyx88Fcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM8PR06MB7715.eurprd06.prod.outlook.com (2603:10a6:20b:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:07:03 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 14:07:03 +0000
From: Stefan Hager <stefan.hager@ginzinger.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 15:06:27 +0100
Message-ID: <20221124140627.3269192-11-stefan.hager@ginzinger.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM5PR06MB3153.eurprd06.prod.outlook.com
 (2603:10a6:206:6::18)
X-MS-TrafficTypeDiagnostic: AM5PR06MB3153:EE_|AM8PR06MB7715:EE_|DB8EUR05FT044:EE_|AM8PR06MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 5447920f-ea85-41de-06c8-08dace252c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2HGCer5jKYEFe/ktrKqq7swueUTPR/fdjztSvagBwzBaQkG5tq0s8EkyY9XKT+FcrE8yWH8sLLwbe7lysyOhXz2HLr7HpvGeUcP8oUzVVPOR3kQn8BgUfb90OoUJ8zg1vEzEPdTQ7VpOiy/CvW6L7JewJRTifC/PWP1cJsyTZX7upFxxG8BMr/UH/QRRpZEtEWOmbX+vUeoNXDiX+ckEHvKNbpCHY+3rYP+4BfQi9HMWmkU+X6Gvv7BWnkpck+tRltRUhgSPS3DebMKYGPjrfWJkHY5Zex30MoQTBlcPXrsvw2/rwdyl297JYzm5/1h6gwUq5yaiCKf+gqOKYZPKFR1fRTdx09PpRA8gUVofAQX/Lx5hkp+fUffO8tCQKxtLgYRnLdxU5G7jflgLmGbHglnYoZxgjVwYQGpR83v1CyIYf1P0GTCvndocEkk2Qg5yFbfPF8KgaSe3xV/QnM8qW9YWTkyoWzonavvcYhzMVlY+8XDQNknlZ3HJ6JrygAYHgY+n4ddG9hDHa3l8E4rFz+eDNzwuRqUEuHiBKKly0j45qBse93bf5WkXwm0PH5X6sEg/AksK1AszUVQDllGNWQNgQ+iZD7JBO1hC41nlr+4kbccpoDXlvc3zOB2wy85WggptvT/l7uFgnyy8UMuE2fHFokFR6+V4v3MbNiqve1CP79T2dF8SGQhHJ+zGBW0t09rsAx/GNg+1wKhn5pWv/Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(451199015)(966005)(6506007)(6486002)(36756003)(107886003)(6666004)(41300700001)(1076003)(44832011)(2906002)(186003)(83380400001)(2616005)(8936002)(5660300002)(30864003)(6916009)(26005)(316002)(6512007)(86362001)(54906003)(52116002)(66476007)(8676002)(66946007)(66556008)(4326008)(38100700002)(38350700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7715
X-CodeTwo-MessageID: ec6efa09-6d66-438f-8678-10e921869814.20221124140706@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT044.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 766f470b-d4a3-4d31-2f52-08dace252961
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPAD822RaNWgbOs/luVR3Uqf0PAP1/DtY92Ovce4qrqVllPhQrklvNM7nbd4HppQzRZODyg5vnlf8L7bmkABw8uleUF/8iO51ZG06Ph+cBfHD8B4dnWIgZSImoRxYxqqAdW9VmtraIP599YMha9yiwXiDdEHPj2J9QhcFfzhIBepcjiki2qDCH0Y/byhfAVG25gQGkINupdFFVwADEIf5NMJPZKR8WXsQXxX0ffoSSQF1nIyfX2wQNohnMl5XyL0WB0/WqYWPCKHMGXkWT3cd7thFW+rtoGvSmzMtlbO+3Irb80PQ3qVJWeV0f6issGI0Pub6ypNBxAvJOP0t/HOHuNjBAPXDe+UPYx3Qq7dUHUXorwyezRM08lmkcW8gAfdZ9GZUp6nRDWzL384kwFjLwMx7XeYVvTueeLyyjvQU3xiD+7Hsl/r3oCv+GuDJ/23FNsFRch69Oo30dvePagPPP8KBt/XA38MQBLWYHYsHjbRJsejboNjLkGTZvmZf2DbRRtDDsqP3J9NgFaG20SKl18kdaYehdAu6ku2gi4SWVVv7Q7F2XZNYgQKPI25pymRZ3fQgAuF/u0rZnUXTi2ytfcF7GINlNv/jeTom8mcvZCw1Q6Fkk/eIsjc9q86tEfcIqA9y/+/YiJ6eqqckHCLM/t3H7R2Rh9/Sptxo/v7PW8Xm0OXQWab1/2DEXZgHUn/CV6NpgePE6WECjZn9cnEzA==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39840400004)(451199015)(36840700001)(46966006)(8676002)(4326008)(70586007)(6916009)(54906003)(86362001)(41300700001)(44832011)(30864003)(8936002)(5660300002)(316002)(70206006)(966005)(6486002)(36756003)(82310400005)(40480700001)(36860700001)(356005)(2906002)(478600001)(83380400001)(7596003)(186003)(47076005)(2616005)(336012)(7636003)(6666004)(1076003)(6512007)(26005)(107886003)(6506007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 14:07:07.8184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5447920f-ea85-41de-06c8-08dace252c51
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT044.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7154
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 10/10] tensorflow-lite: new package
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
Content-Type: multipart/mixed; boundary="===============6999565002022179195=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============6999565002022179195==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----46F6FC00A3F3198ACDE98D32783AA52B"

This is an S/MIME signed message

------46F6FC00A3F3198ACDE98D32783AA52B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

This package adds the tensorflow lite runtime 2.8.0 (official) to buildroot=
.
Patches are added to build it as a shared library and to add support for ex=
ternal delegates
which enable the usage of external backend plugins to run inference on gpu,=
 npu, etc.
Currently supported Processors: ARMV8A: only 64-bit Toolchains; ARMV7A: onl=
y 32-bit Toolchains;

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
---
 package/Config.in                             |   1 +
 ...2sse-since-this-is-only-useful-on-x8.patch |  34 +++
 ...build-a-shared-library-instead-of-st.patch |  55 +++++
 ...build-tflite-with-external-delegates.patch |  59 +++++
 ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++
 package/tensorflow-lite/Config.in             |  56 +++++
 package/tensorflow-lite/tensorflow-lite.hash  |   3 +
 package/tensorflow-lite/tensorflow-lite.mk    | 232 ++++++++++++++++++
 8 files changed, 643 insertions(+)
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

diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..16ed77dedf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2099,6 +2099,7 @@ endif
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
+	source "package/tensorflow-lite/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/tensorflow-lite/0001-Deactivated-neon2sse-since-this-i=
s-only-useful-on-x8.patch b/package/tensorflow-lite/0001-Deactivated-neon2s=
se-since-this-is-only-useful-on-x8.patch
new file mode 100644
index 0000000000..048a74bffb
--- /dev/null
+++ b/package/tensorflow-lite/0001-Deactivated-neon2sse-since-this-is-only-=
useful-on-x8.patch
@@ -0,0 +1,34 @@
+From 4d68ce073e75aacebb5935dce4d0b9b4826b0197 Mon Sep 17 00:00:00 2001
+From: Stefan Hager <stefan.hager@ginzinger.com>
+Date: Tue, 6 Sep 2022 13:50:44 +0200
+Subject: [PATCH] Deactivated neon2sse since this is only useful on x86
+ targets, but tflite will be built for arm/arm64 targets.
+
+Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
+---
+ tensorflow/lite/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
+index 200d1a7..9658e40 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -142,7 +142,6 @@ find_package(farmhash REQUIRED)
+ find_package(fft2d REQUIRED)
+ find_package(flatbuffers REQUIRED)
+ find_package(gemmlowp REQUIRED)
+-find_package(neon2sse REQUIRED)
+ find_package(clog REQUIRED)
+ find_package(cpuinfo REQUIRED)  #CPUINFO is used by XNNPACK and RUY libra=
ry
+ find_package(ruy REQUIRED)
+@@ -491,7 +490,6 @@ target_include_directories(tensorflow-lite
+ target_link_libraries(tensorflow-lite
+   PUBLIC
+     Eigen3::Eigen
+-    NEON_2_SSE
+     absl::flags
+     absl::hash
+     absl::status
+--=20
+2.36.1
+
diff --git a/package/tensorflow-lite/0002-Added-option-to-build-a-shared-li=
brary-instead-of-st.patch b/package/tensorflow-lite/0002-Added-option-to-bu=
ild-a-shared-library-instead-of-st.patch
new file mode 100644
index 0000000000..e4a161e48b
--- /dev/null
+++ b/package/tensorflow-lite/0002-Added-option-to-build-a-shared-library-i=
nstead-of-st.patch
@@ -0,0 +1,55 @@
+From 2b312e04ef87458103841eaab4d15ac9766bd15d Mon Sep 17 00:00:00 2001
+From: Stefan Hager <stefan.hager@ginzinger.com>
+Date: Tue, 6 Sep 2022 13:56:25 +0200
+Subject: [PATCH] Added option to build a shared library instead of static.
+
+Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
+---
+ tensorflow/lite/CMakeLists.txt | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
+index 9658e40..511bf1b 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -68,6 +68,7 @@ option(TFLITE_ENABLE_MMAP "Enable MMAP (unsupported on W=
indows)" ON)
+ option(TFLITE_ENABLE_GPU "Enable GPU" OFF)
+ option(TFLITE_ENABLE_METAL "Enable Metal delegate (iOS only)" OFF)
+ option(TFLITE_ENABLE_XNNPACK "Enable XNNPACK backend" ON)
++option(TFLITE_BUILD_SHARED_LIB "Build shared library instead of static" O=
FF)
+=20
+ option(TFLITE_KERNEL_TEST "Enable tflite kernel unit test" OFF)
+ if(TFLITE_KERNEL_TEST AND ${CMAKE_CROSSCOMPILING})
+@@ -456,6 +457,10 @@ include_directories(
+     ${TFLITE_INCLUDE_DIRS}
+ )
+=20
++if(${TFLITE_BUILD_SHARED_LIB})
++  set(LIB_TYPE "SHARED")
++endif()
++
+ # TFLite library
+ add_library(tensorflow-lite
+   ${TFLITE_CORE_API_SRCS}
+@@ -483,6 +488,18 @@ add_library(tensorflow-lite
+   ${TFLITE_SOURCE_DIR}/kernels/internal/utils/sparsity_format_converter.c=
c
+   ${TFLITE_SOURCE_DIR}/schema/schema_utils.cc
+ )
++
++if (TFLITE_BUILD_SHARED_LIB)
++  target_link_options(tensorflow-lite PRIVATE "-Wl,-z,defs")
++  target_link_options(tensorflow-lite PRIVATE "-Wl,--version-script,${TEN=
SORFLOW_SOURCE_DIR}/tensorflow/lite/tflite_version_script.lds")
++endif()
++
++set_target_properties(tensorflow-lite
++    PROPERTIES
++        VERSION 2.8.0
++        SOVERSION  2.8.0
++)
++
+ target_include_directories(tensorflow-lite
+   PUBLIC
+     ${TFLITE_INCLUDE_DIRS}
+--=20
+2.36.1
+
diff --git a/package/tensorflow-lite/0003-Added-option-to-build-tflite-with=
-external-delegates.patch b/package/tensorflow-lite/0003-Added-option-to-bu=
ild-tflite-with-external-delegates.patch
new file mode 100644
index 0000000000..0e1a4c7ee7
--- /dev/null
+++ b/package/tensorflow-lite/0003-Added-option-to-build-tflite-with-extern=
al-delegates.patch
@@ -0,0 +1,59 @@
+From 0395f86d50530a4703b20b8afea2c99c27764df6 Mon Sep 17 00:00:00 2001
+From: Stefan Hager <stefan.hager@ginzinger.com>
+Date: Tue, 6 Sep 2022 13:59:56 +0200
+Subject: [PATCH] Added option to build tflite with external delegates enab=
led.
+
+Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
+---
+ tensorflow/lite/CMakeLists.txt | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
+index 511bf1b..43c3d67 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -69,6 +69,7 @@ option(TFLITE_ENABLE_GPU "Enable GPU" OFF)
+ option(TFLITE_ENABLE_METAL "Enable Metal delegate (iOS only)" OFF)
+ option(TFLITE_ENABLE_XNNPACK "Enable XNNPACK backend" ON)
+ option(TFLITE_BUILD_SHARED_LIB "Build shared library instead of static" O=
FF)
++option(TFLITE_ENABLE_EXTERNAL_DELEGATE "Enable external delegate" OFF)
+=20
+ option(TFLITE_KERNEL_TEST "Enable tflite kernel unit test" OFF)
+ if(TFLITE_KERNEL_TEST AND ${CMAKE_CROSSCOMPILING})
+@@ -386,6 +387,17 @@ else()
+     "${TFLITE_SOURCE_DIR}/nnapi/nnapi_implementation_disabled.cc"
+   )
+ endif()
++if(TFLITE_ENABLE_EXTERNAL_DELEGATE)
++   message(STATUS "External delegate is enabled.")
++   populate_tflite_source_vars("delegates/external"
++    TFLITE_DELEGATES_EXTERNAL_SRCS
++    FILTER "(_test_list|_disabled)\\.(cc|h)$"
++   )
++   list(APPEND TFLITE_DELEGATES_EXTERNAL_SRCS
++     ${TFLITE_SOURCE_DIR}/tools/command_line_flags.cc
++   )
++   set(TFLITE_DELEGATES_EXTERNAL_INCL "delegates/external")
++endif()
+ if(TFLITE_ENABLE_XNNPACK)
+   find_package(fp16_headers REQUIRED)
+   find_package(xnnpack REQUIRED)
+@@ -451,6 +463,7 @@ endif()
+ set(TFLITE_INCLUDE_DIRS
+   "${TENSORFLOW_SOURCE_DIR}"
+   "${TFLITE_FLATBUFFERS_SCHEMA_DIR}"
++  "${TFLITE_DELEGATES_EXTERNAL_INCL}"
+ )
+ include_directories(
+   BEFORE
+@@ -466,6 +479,7 @@ add_library(tensorflow-lite
+   ${TFLITE_CORE_API_SRCS}
+   ${TFLITE_CORE_SRCS}
+   ${TFLITE_C_SRCS}
++  ${TFLITE_DELEGATES_EXTERNAL_SRCS}
+   ${TFLITE_DELEGATES_FLEX_SRCS}
+   ${TFLITE_DELEGATES_GPU_SRCS}
+   ${TFLITE_DELEGATES_NNAPI_SRCS}
+--=20
+2.36.1
+
diff --git a/package/tensorflow-lite/0004-Removed-source-repositories-and-g=
it-pull-configurati.patch b/package/tensorflow-lite/0004-Removed-source-rep=
ositories-and-git-pull-configurati.patch
new file mode 100644
index 0000000000..db7ecc3684
--- /dev/null
+++ b/package/tensorflow-lite/0004-Removed-source-repositories-and-git-pull=
-configurati.patch
@@ -0,0 +1,203 @@
+From 45a950cbe2457caafe8d798db5b3949ffd194cdb Mon Sep 17 00:00:00 2001
+From: Stefan Hager <stefan.hager@ginzinger.com>
+Date: Wed, 7 Sep 2022 07:07:56 +0200
+Subject: [PATCH] Removed source repositories and git pull configuration:
+
+In order to prevent fetching external sources which were already
+populated by buildroot packages, the links to external sources were remove=
d.
+
+Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
+---
+ tensorflow/lite/tools/cmake/modules/abseil-cpp.cmake  | 8 ++++----
+ tensorflow/lite/tools/cmake/modules/clog.cmake        | 6 +++---
+ tensorflow/lite/tools/cmake/modules/cpuinfo.cmake     | 6 +++---
+ tensorflow/lite/tools/cmake/modules/eigen.cmake       | 6 +++---
+ tensorflow/lite/tools/cmake/modules/farmhash.cmake    | 6 +++---
+ tensorflow/lite/tools/cmake/modules/fft2d.cmake       | 4 ++--
+ tensorflow/lite/tools/cmake/modules/flatbuffers.cmake | 8 ++++----
+ tensorflow/lite/tools/cmake/modules/gemmlowp.cmake    | 6 +++---
+ tensorflow/lite/tools/cmake/modules/ruy.cmake         | 6 +++---
+ 9 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/tensorflow/lite/tools/cmake/modules/abseil-cpp.cmake b/tensor=
flow/lite/tools/cmake/modules/abseil-cpp.cmake
+index b17f9b3..93bf522 100644
+--- a/tensorflow/lite/tools/cmake/modules/abseil-cpp.cmake
++++ b/tensorflow/lite/tools/cmake/modules/abseil-cpp.cmake
+@@ -22,11 +22,11 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   abseil-cpp
+-  GIT_REPOSITORY https://github.com/abseil/abseil-cpp
++#  GIT_REPOSITORY https://github.com/abseil/abseil-cpp
+   # Sync with tensorflow/third_party/absl/workspace.bzl
+-  GIT_TAG 997aaf3a28308eba1b9156aa35ab7bca9688e9f6
+-  GIT_SHALLOW TRUE
+-  GIT_PROGRESS TRUE
++#  GIT_TAG 997aaf3a28308eba1b9156aa35ab7bca9688e9f6
++#  GIT_SHALLOW TRUE
++#  GIT_PROGRESS TRUE
+   PREFIX "${CMAKE_BINARY_DIR}"
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/abseil-cpp"
+ )
+diff --git a/tensorflow/lite/tools/cmake/modules/clog.cmake b/tensorflow/l=
ite/tools/cmake/modules/clog.cmake
+index 93f10fb..3904030 100644
+--- a/tensorflow/lite/tools/cmake/modules/clog.cmake
++++ b/tensorflow/lite/tools/cmake/modules/clog.cmake
+@@ -21,10 +21,10 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   clog
+-  GIT_REPOSITORY https://github.com/pytorch/cpuinfo
++#  GIT_REPOSITORY https://github.com/pytorch/cpuinfo
+   # Sync with tensorflow/third_party/clog/workspace.bzl
+-  GIT_TAG d5e37adf1406cf899d7d9ec1d317c47506ccb970
+-  GIT_PROGRESS TRUE
++#  GIT_TAG d5e37adf1406cf899d7d9ec1d317c47506ccb970
++#  GIT_PROGRESS TRUE
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/clog"
+ )
+ OverridableFetchContent_GetProperties(clog)
+diff --git a/tensorflow/lite/tools/cmake/modules/cpuinfo.cmake b/tensorflo=
w/lite/tools/cmake/modules/cpuinfo.cmake
+index 71f7f93..757af38 100644
+--- a/tensorflow/lite/tools/cmake/modules/cpuinfo.cmake
++++ b/tensorflow/lite/tools/cmake/modules/cpuinfo.cmake
+@@ -21,10 +21,10 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   cpuinfo
+-  GIT_REPOSITORY https://github.com/pytorch/cpuinfo
++#  GIT_REPOSITORY https://github.com/pytorch/cpuinfo
+   # Sync with tensorflow/third_party/cpuinfo/workspace.bzl
+-  GIT_TAG 5916273f79a21551890fd3d56fc5375a78d1598d
+-  GIT_PROGRESS TRUE
++#  GIT_TAG 5916273f79a21551890fd3d56fc5375a78d1598d
++#  GIT_PROGRESS TRUE
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/cpuinfo"
+ )
+ OverridableFetchContent_GetProperties(cpuinfo)
+diff --git a/tensorflow/lite/tools/cmake/modules/eigen.cmake b/tensorflow/=
lite/tools/cmake/modules/eigen.cmake
+index ed1ba25..1262adc 100644
+--- a/tensorflow/lite/tools/cmake/modules/eigen.cmake
++++ b/tensorflow/lite/tools/cmake/modules/eigen.cmake
+@@ -21,15 +21,15 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   eigen
+-  GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
++#  GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
+   # Sync with tensorflow/third_party/eigen3/workspace.bzl
+-  GIT_TAG 085c2fc5d53f391afcccce21c45e15f61c827ab1
++#  GIT_TAG 085c2fc5d53f391afcccce21c45e15f61c827ab1
+   # It's not currently (cmake 3.17) possible to shallow clone with a GIT =
TAG
+   # as cmake attempts to git checkout the commit hash after the clone
+   # which doesn't work as it's a shallow clone hence a different commit h=
ash.
+   # https://gitlab.kitware.com/cmake/cmake/-/issues/17770
+   # GIT_SHALLOW TRUE
+-  GIT_PROGRESS TRUE
++#  GIT_PROGRESS TRUE
+   PREFIX "${CMAKE_BINARY_DIR}"
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/eigen"
+   LICENSE_FILE "COPYING.MPL2"
+diff --git a/tensorflow/lite/tools/cmake/modules/farmhash.cmake b/tensorfl=
ow/lite/tools/cmake/modules/farmhash.cmake
+index 7a5160f..462d8b3 100644
+--- a/tensorflow/lite/tools/cmake/modules/farmhash.cmake
++++ b/tensorflow/lite/tools/cmake/modules/farmhash.cmake
+@@ -21,15 +21,15 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   farmhash
+-  GIT_REPOSITORY https://github.com/google/farmhash
++#  GIT_REPOSITORY https://github.com/google/farmhash
+   # Sync with tensorflow/third_party/farmhash/workspace.bzl
+-  GIT_TAG 0d859a811870d10f53a594927d0d0b97573ad06d
++#  GIT_TAG 0d859a811870d10f53a594927d0d0b97573ad06d
+   # It's not currently possible to shallow clone with a GIT TAG
+   # as cmake attempts to git checkout the commit hash after the clone
+   # which doesn't work as it's a shallow clone hence a different commit h=
ash.
+   # https://gitlab.kitware.com/cmake/cmake/-/issues/17770
+   # GIT_SHALLOW TRUE
+-  GIT_PROGRESS TRUE
++#  GIT_PROGRESS TRUE
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/farmhash"
+ )
+ OverridableFetchContent_GetProperties(farmhash)
+diff --git a/tensorflow/lite/tools/cmake/modules/fft2d.cmake b/tensorflow/=
lite/tools/cmake/modules/fft2d.cmake
+index 9d44a2c..a7ab036 100644
+--- a/tensorflow/lite/tools/cmake/modules/fft2d.cmake
++++ b/tensorflow/lite/tools/cmake/modules/fft2d.cmake
+@@ -21,9 +21,9 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   fft2d
+-  URL https://storage.googleapis.com/mirror.tensorflow.org/github.com/pet=
ewarden/OouraFFT/archive/v1.0.tar.gz
++#  URL https://storage.googleapis.com/mirror.tensorflow.org/github.com/pe=
tewarden/OouraFFT/archive/v1.0.tar.gz
+   # Sync with tensorflow/workspace2.bzl
+-  URL_HASH SHA256=3D5f4dabc2ae21e1f537425d58a49cdca1c49ea11db0d6271e2a4b2=
7e9697548eb
++#  URL_HASH SHA256=3D5f4dabc2ae21e1f537425d58a49cdca1c49ea11db0d6271e2a4b=
27e9697548eb
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/fft2d"
+   LICENSE_FILE "readme2d.txt"
+   LICENSE_URL "http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html"
+diff --git a/tensorflow/lite/tools/cmake/modules/flatbuffers.cmake b/tenso=
rflow/lite/tools/cmake/modules/flatbuffers.cmake
+index a3d01fd..2438759 100644
+--- a/tensorflow/lite/tools/cmake/modules/flatbuffers.cmake
++++ b/tensorflow/lite/tools/cmake/modules/flatbuffers.cmake
+@@ -21,11 +21,11 @@ include(FetchContent)
+=20
+ OverridableFetchContent_Declare(
+   flatbuffers
+-  GIT_REPOSITORY https://github.com/google/flatbuffers
++#  GIT_REPOSITORY https://github.com/google/flatbuffers
+   # Sync with tensorflow/third_party/flatbuffers/workspace.bzl
+-  GIT_TAG v1.12.0
+-  GIT_SHALLOW TRUE
+-  GIT_PROGRESS TRUE
++#  GIT_TAG v1.12.0
++#  GIT_SHALLOW TRUE
++#  GIT_PROGRESS TRUE
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/flatbuffers"
+ )
+=20
+diff --git a/tensorflow/lite/tools/cmake/modules/gemmlowp.cmake b/tensorfl=
ow/lite/tools/cmake/modules/gemmlowp.cmake
+index da31e3c..741ad09 100644
+--- a/tensorflow/lite/tools/cmake/modules/gemmlowp.cmake
++++ b/tensorflow/lite/tools/cmake/modules/gemmlowp.cmake
+@@ -21,15 +21,15 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   gemmlowp
+-  GIT_REPOSITORY https://github.com/google/gemmlowp
++#  GIT_REPOSITORY https://github.com/google/gemmlowp
+   # Sync with tensorflow/third_party/gemmlowp/workspace.bzl
+-  GIT_TAG fda83bdc38b118cc6b56753bd540caa49e570745
++#  GIT_TAG fda83bdc38b118cc6b56753bd540caa49e570745
+   # It's not currently (cmake 3.17) possible to shallow clone with a GIT =
TAG
+   # as cmake attempts to git checkout the commit hash after the clone
+   # which doesn't work as it's a shallow clone hence a different commit h=
ash.
+   # https://gitlab.kitware.com/cmake/cmake/-/issues/17770
+   # GIT_SHALLOW TRUE
+-  GIT_PROGRESS TRUE
++#  GIT_PROGRESS TRUE
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/gemmlowp"
+ )
+=20
+diff --git a/tensorflow/lite/tools/cmake/modules/ruy.cmake b/tensorflow/li=
te/tools/cmake/modules/ruy.cmake
+index 752f527..4decc31 100644
+--- a/tensorflow/lite/tools/cmake/modules/ruy.cmake
++++ b/tensorflow/lite/tools/cmake/modules/ruy.cmake
+@@ -21,10 +21,10 @@ include(OverridableFetchContent)
+=20
+ OverridableFetchContent_Declare(
+   ruy
+-  GIT_REPOSITORY https://github.com/google/ruy
++#  GIT_REPOSITORY https://github.com/google/ruy
+   # Sync with tensorflow/third_party/ruy/workspace.bzl
+-  GIT_TAG e6c1b8dc8a8b00ee74e7268aac8b18d7260ab1ce
+-  GIT_PROGRESS TRUE
++#  GIT_TAG e6c1b8dc8a8b00ee74e7268aac8b18d7260ab1ce
++#  GIT_PROGRESS TRUE
+   SOURCE_DIR "${CMAKE_BINARY_DIR}/ruy"
+ )
+ OverridableFetchContent_GetProperties(ruy)
+--=20
+2.36.1
+
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Co=
nfig.in
new file mode 100644
index 0000000000..868fc7038a
--- /dev/null
+++ b/package/tensorflow-lite/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_TENSORFLOW_LITE
+	bool "tensorflow-lite"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_SHARED_LIBS
+	depends on !BR2_PACKAGE_LIBABSEIL_CPP
+	depends on !BR2_PACKAGE_EIGEN
+	depends on !BR2_PACKAGE_FLATBUFFERS
+	depends on ( BR2_arm && BR2_ARM_CPU_ARMV7A ) || ( BR2_aarch64 && BR2_ARM_=
CPU_ARMV8A )
+	select BR2_PACKAGE_TENSORFLOW_LITE_ABSEIL_CPP
+	select BR2_PACKAGE_TENSORFLOW_LITE_CLOG
+	select BR2_PACKAGE_TENSORFLOW_LITE_CPUINFO
+	select BR2_PACKAGE_TENSORFLOW_LITE_EIGEN
+	select BR2_PACKAGE_TENSORFLOW_LITE_FARMHASH
+	select BR2_PACKAGE_TENSORFLOW_LITE_FFT2D
+	select BR2_PACKAGE_TENSORFLOW_LITE_FLATBUFFERS
+	select BR2_PACKAGE_TENSORFLOW_LITE_GEMMLOWP
+	select BR2_PACKAGE_TENSORFLOW_LITE_RUY
+	help
+	  Tensorflow Lite dynamic library and headers: Inference engine to run pr=
eviously trained machine learning models.
+
+comment "tensorflow-lite needs needs a toolchain w/ gcc >=3D 9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
+comment "tensorflow-lite needs a toolchain w/ glibc, C++, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
+			!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "tensorflow-lite needs a toolchain w/ shared libraries"
+	depends on !BR2_SHARED_LIBS
+
+comment "tensorflow-lite uses its own version of libabseil-cpp, deactivate=
 buildroot package libabseil-cpp to use tflite"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP
+
+comment "tensorflow-lite uses its own version of eigen, deactivate buildro=
ot package eigen to use tflite"
+	depends on BR2_PACKAGE_EIGEN
+
+comment "tensorflow-lite uses its own version of flatbuffers, deactivate b=
uildroot package flatbuffers to use tflite"
+	depends on BR2_PACKAGE_FLATBUFFERS
+
+comment "tensorflow-lite in buildroot currently only supports arm + armv7a=
 cpu or arm64 + armv8a cpu targets"
+	depends on ( BR2_arm && !BR2_ARM_CPU_ARMV7A ) || ( BR2_aarch64 && !BR2_AR=
M_CPU_ARMV8A) || (!BR2_arm && !BR2_aarch64)
+
+if BR2_PACKAGE_TENSORFLOW_LITE
+source "package/tensorflow-lite-abseil-cpp/Config.in"
+source "package/tensorflow-lite-clog/Config.in"
+source "package/tensorflow-lite-cpuinfo/Config.in"
+source "package/tensorflow-lite-eigen/Config.in"
+source "package/tensorflow-lite-farmhash/Config.in"
+source "package/tensorflow-lite-fft2d/Config.in"
+source "package/tensorflow-lite-flatbuffers/Config.in"
+source "package/tensorflow-lite-gemmlowp/Config.in"
+source "package/tensorflow-lite-ruy/Config.in"
+endif
diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/tensorf=
low-lite/tensorflow-lite.hash
new file mode 100644
index 0000000000..2aef108def
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1aec65  =
LICENSE
+sha256  4715f89770e1cf9be64016b34d63fc531b89b1fc5f12ef723a2bddb3b784711a  =
tensorflow-lite-v2.8.0-br1.tar.gz
diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorflo=
w-lite/tensorflow-lite.mk
new file mode 100644
index 0000000000..dbff6c9855
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.mk
@@ -0,0 +1,232 @@
+##########################################################################=
######
+#
+# tensorflow-lite
+#
+##########################################################################=
######
+
+TENSORFLOW_LITE_RAW_VERSION =3D 2.8.0
+TENSORFLOW_LITE_VERSION =3D v$(TENSORFLOW_LITE_RAW_VERSION)
+TENSORFLOW_LITE_SITE =3D  https://github.com/tensorflow/tensorflow.git
+TENSORFLOW_LITE_SITE_METHOD =3D git
+TENSORFLOW_LITE_INSTALL_STAGING =3D YES
+TENSORFLOW_LITE_LICENSE =3D Apache-2.0
+TENSORFLOW_LITE_LICENSE_FILES =3D LICENSE
+TENSORFLOW_LITE_SUBDIR =3D tensorflow/lite
+TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD =3D NO
+TENSORFLOW_LITE_CONF_OPTS =3D -DBUILD_SHARED_LIBS=3DON
+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_RUY=3DON
+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_EXTERNAL_DELEGATE=3DON
+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_XNNPACK=3DOFF
+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_NNAPI=3DOFF
+TENSORFLOW_LITE_CONF_OPTS +=3D -DFETCHCONTENT_QUIET=3DOFF
+TENSORFLOW_LITE_CONF_OPTS +=3D -DOVERRIDABLE_FETCH_CONTENT_GIT_REPOSITORY_=
AND_TAG_TO_URL=3DON
+TENSORFLOW_LITE_PATCH_DEPENDENCIES +=3D tensorflow-lite-abseil-cpp tensorf=
low-lite-clog tensorflow-lite-cpuinfo tensorflow-lite-eigen \
+	tensorflow-lite-farmhash tensorflow-lite-fft2d tensorflow-lite-flatbuffer=
s tensorflow-lite-gemmlowp tensorflow-lite-ruy
+
+define TENSORFLOW_LITE_CREATE_BUILD_DIR
+	mkdir -p $(@D)/tensorflow/lite/buildroot-build
+endef
+
+define TENSORFLOW_LITE_COPY_ABSEIL_CPP
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/abseil-cpp
+	cp -a $(TENSORFLOW_LITE_ABSEIL_CPP_DIR) $(@D)/tensorflow/lite/buildroot-b=
uild/abseil-cpp
+endef
+
+define TENSORFLOW_LITE_COPY_CLOG
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/clog
+	cp -a $(TENSORFLOW_LITE_CLOG_DIR) $(@D)/tensorflow/lite/buildroot-build/c=
log
+endef
+
+define TENSORFLOW_LITE_COPY_CPUINFO
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/cpuinfo
+	cp -a $(TENSORFLOW_LITE_CPUINFO_DIR) $(@D)/tensorflow/lite/buildroot-buil=
d/cpuinfo
+endef
+
+define TENSORFLOW_LITE_COPY_EIGEN
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/eigen
+	cp -a $(TENSORFLOW_LITE_EIGEN_DIR) $(@D)/tensorflow/lite/buildroot-build/=
eigen
+endef
+
+define TENSORFLOW_LITE_COPY_FARMHASH
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/farmhash
+	cp -a $(TENSORFLOW_LITE_FARMHASH_DIR) $(@D)/tensorflow/lite/buildroot-bui=
ld/farmhash
+endef
+
+define TENSORFLOW_LITE_COPY_FFT2D
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/fft2d
+	cp -a $(TENSORFLOW_LITE_FFT2D_DIR) $(@D)/tensorflow/lite/buildroot-build/=
fft2d
+endef
+
+define TENSORFLOW_LITE_COPY_FLATBUFFERS
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/flatbuffers
+	cp -a $(TENSORFLOW_LITE_FLATBUFFERS_DIR) $(@D)/tensorflow/lite/buildroot-=
build/flatbuffers
+endef
+
+define TENSORFLOW_LITE_COPY_GEMMLOWP
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/gemmlowp
+	cp -a $(TENSORFLOW_LITE_GEMMLOWP_DIR) $(@D)/tensorflow/lite/buildroot-bui=
ld/gemmlowp
+endef
+
+define TENSORFLOW_LITE_COPY_RUY
+	rm -rf $(@D)/tensorflow/lite/buildroot-build/ruy
+	cp -a $(TENSORFLOW_LITE_RUY_DIR) $(@D)/tensorflow/lite/buildroot-build/ru=
y
+endef
+
+TENSORFLOW_LITE_POST_PATCH_HOOKS +=3D TENSORFLOW_LITE_CREATE_BUILD_DIR TEN=
SORFLOW_LITE_COPY_ABSEIL_CPP TENSORFLOW_LITE_COPY_CLOG \
+	TENSORFLOW_LITE_COPY_CPUINFO TENSORFLOW_LITE_COPY_EIGEN TENSORFLOW_LITE_C=
OPY_FARMHASH TENSORFLOW_LITE_COPY_FFT2D \
+	TENSORFLOW_LITE_COPY_FLATBUFFERS TENSORFLOW_LITE_COPY_GEMMLOWP TENSORFLOW=
_LITE_COPY_RUY
+
+define TENSORFLOW_LITE_INSTALL_STAGING_CMDS
+	# Abseil headers:
+	#   create header folder
+	find $(TENSORFLOW_LITE_ABSEIL_CPP_DIR)/absl -name "*.h" \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_ABSEIL_CPP_DIR) {} \
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/{}
+	#   install headers
+	find $(TENSORFLOW_LITE_ABSEIL_CPP_DIR)/absl -name "*.h" \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_ABSEIL_CPP_DIR) {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(TENSORFLOW_LITE_ABSEIL_CPP_DIR)/{} $(=
STAGING_DIR)/usr/include/{}
+	# Abseil .so:
+	find $(@D)/tensorflow/lite/buildroot-build/_deps/abseil-cpp-build/absl -n=
ame "libabsl_*.so" \
+		| xargs -i realpath --relative-to $(@D) {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(@D)/{} $(STAGING_DIR)/usr/lib/
+
+	# Cpuinfo .so
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/buildroot-build/_deps/cpuinfo=
-build/libcpuinfo.so $(STAGING_DIR)/usr/lib/
+
+	# Eigen3 Headers containted within the tensorflow sources
+	#   create 'third_party/eigen3/unsupported/Eigen' header folders
+	find $(@D)/third_party/eigen3/unsupported/Eigen -type f \( -name "*.h" -o=
 ! -name "*.*" \) \
+		| xargs -i realpath --relative-to $(@D)/third_party/eigen3/unsupported/E=
igen {} \
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/third_party/=
eigen3/unsupported/Eigen/{}
+	#   install 'third_party/eigen3/unsupported/Eigen' headers
+	find $(@D)/third_party/eigen3/unsupported/Eigen -type f \( -name "*.h" -o=
 ! -name "*.*" \) \
+		| xargs -i realpath --relative-to $(@D)/third_party/eigen3/unsupported/E=
igen {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(@D)/third_party/eigen3/unsupported/Ei=
gen/{} $(STAGING_DIR)/usr/include/third_party/eigen3/unsupported/Eigen/{}
+	#   additional extension-less 'headers'
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/third_party/eigen3/Eigen
+	$(INSTALL) -D -m 0644 $(@D)/third_party/eigen3/Eigen/* $(STAGING_DIR)/usr=
/include/third_party/eigen3/Eigen
+
+	# Eigen3
+	#   create header folders
+	find $(TENSORFLOW_LITE_EIGEN_DIR)/Eigen -type f \( -name "*.h" -o ! -name=
 "*.*" \) \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_EIGEN_DIR)/Eigen {} =
\
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/Eigen/{}
+	#   install headers
+	find $(TENSORFLOW_LITE_EIGEN_DIR)/Eigen -type f \( -name "*.h" -o ! -name=
 "*.*" \) \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_EIGEN_DIR)/Eigen {} =
\
+		| xargs -i $(INSTALL) -D -m 0644 $(TENSORFLOW_LITE_EIGEN_DIR)/Eigen/{} $=
(STAGING_DIR)/usr/include/Eigen/{}
+	#   create 'unsupported/Eigen/' header folders
+	find $(TENSORFLOW_LITE_EIGEN_DIR)/unsupported/Eigen -type f \( -name "*.h=
" -o ! -name "*.*" \) \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_EIGEN_DIR)/unsupport=
ed/Eigen {} \
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/unsupported/=
Eigen/{}
+	#   install 'unsupported/Eigen/' headers
+	find $(TENSORFLOW_LITE_EIGEN_DIR)/unsupported/Eigen -type f \( -name "*.h=
" -o ! -name "*.*" \) \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_EIGEN_DIR)/unsupport=
ed/Eigen {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(TENSORFLOW_LITE_EIGEN_DIR)/unsupporte=
d/Eigen/{} $(STAGING_DIR)/usr/include/unsupported/Eigen/{}
+
+	# Farmhash .so
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/buildroot-build/_deps/farmhas=
h-build/libfarmhash.so $(STAGING_DIR)/usr/lib/
+
+	# FFT2
+	#   create 'third_party/fft2d' header folders from tensorflow-lite source=
s
+	find $(@D)/third_party/fft2d -name "*.h" \
+		| xargs -i realpath --relative-to $(@D)/third_party/fft2d {} \
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/third_party/=
fft2d/{}
+	#   install 'third_party/fft2d' headers from tensorflow-lite sources
+	find $(@D)/third_party/fft2d -name "*.h" \
+		| xargs -i realpath --relative-to $(@D)/third_party/fft2d {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(@D)/third_party/fft2d/{} $(STAGING_DI=
R)/usr/include/third_party/fft2d/{}
+	#    libs
+	$(INSTALL) -D -m 0755 $(@D)/tensorflow/lite/buildroot-build/_deps/fft2d-b=
uild/libfft2d_fftsg2d.so $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D -m 0755 $(@D)/tensorflow/lite/buildroot-build/_deps/fft2d-b=
uild/libfft2d_fftsg.so $(STAGING_DIR)/usr/lib/
+
+	# Flatbuffers
+	#  create header folders
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/flatbuffers
+	#  install headers
+	$(INSTALL) -D -m 0644 $(TENSORFLOW_LITE_FLATBUFFERS_DIR)/include/flatbuff=
ers/*.h $(STAGING_DIR)/usr/include/flatbuffers
+
+	# Gemmlowp
+	#   create header folders
+	find $(TENSORFLOW_LITE_GEMMLOWP_DIR) -name "*.h" \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_GEMMLOWP_DIR) {} \
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gemmlowp/{}
+	#   install headers
+	find $(TENSORFLOW_LITE_GEMMLOWP_DIR) -name "*.h" \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_GEMMLOWP_DIR) {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(TENSORFLOW_LITE_GEMMLOWP_DIR)/{} $(ST=
AGING_DIR)/usr/include/gemmlowp/{}
+
+	# Ruy - not built since TFLite v2.8.0 but some components need the header=
s for example vx-delegate
+	#   create header folders
+	find $(TENSORFLOW_LITE_RUY_DIR)/ruy -name "*.h" \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_RUY_DIR)/ruy {} \
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/ruy/{}
+	#   install headers
+	find $(TENSORFLOW_LITE_RUY_DIR)/ruy -name "*.h" \
+		| xargs -i realpath --relative-to $(TENSORFLOW_LITE_RUY_DIR)/ruy {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(TENSORFLOW_LITE_RUY_DIR)/ruy/{} $(STA=
GING_DIR)/usr/include/ruy/{}
+
+	# Tensorflow Headers
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/tensorflow/core/public
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/core/public/version.h $(STAGING_DI=
R)/usr/include/tensorflow/core/public/version.h
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/core/util/stats_calculator.h $(STA=
GING_DIR)/usr/include/tensorflow/core/util/stats_calculator.h
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/core/util/stat_summarizer_options.=
h $(STAGING_DIR)/usr/include/tensorflow/core/util/stat_summarizer_options.h
+
+	# Tensorflow-lite Headers
+	#   create header folders
+	find $(@D)/tensorflow/lite -type d -name buildroot-build -prune -o -name =
"*.h" -print \
+		| xargs -i realpath --relative-to $(@D)/tensorflow/lite {} \
+		| xargs dirname \
+		| sort | uniq \
+		| xargs -i $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/tensorflow/l=
ite/{}
+	#   install headers
+	find $(@D)/tensorflow/lite -type d -name buildroot-build -prune -o -name =
"*.h" -print \
+		| xargs -i realpath --relative-to $(@D)/tensorflow/lite {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/{} $(STAGING_DIR)=
/usr/include/tensorflow/lite/{}
+
+	# Headers for example
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/tensorflow/lite/examples=
/label_image/
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/examples/label_image/*.h $(ST=
AGING_DIR)/usr/include/tensorflow/lite/examples/label_image/
+
+	# Tensorflow-lite libs
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/buildroot-build/libtensorflow=
-lite.so $(STAGING_DIR)/usr/lib/
+	ln -sf libtensorflow-lite.so $(STAGING_DIR)/usr/lib/libtensorflow-lite.so=
.$(TENSORFLOW_LITE_RAW_VERSION)
+endef
+
+define TENSORFLOW_LITE_INSTALL_TARGET_CMDS
+	# Abseil
+	find $(@D)/tensorflow/lite/buildroot-build/_deps/abseil-cpp-build/absl -n=
ame "libabsl_*.so" \
+		| xargs -i realpath --relative-to $(@D) {} \
+		| xargs -i $(INSTALL) -D -m 0644 $(@D)/{} $(TARGET_DIR)/usr/lib/
+
+	# Cpuinfo
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/buildroot-build/_deps/cpuinfo=
-build/libcpuinfo.so $(TARGET_DIR)/usr/lib/
+
+	# Farmhash
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/buildroot-build/_deps/farmhas=
h-build/libfarmhash.so $(TARGET_DIR)/usr/lib/
+
+	# FFT2
+	$(INSTALL) -D -m 0755 $(@D)/tensorflow/lite/buildroot-build/_deps/fft2d-b=
uild/libfft2d_fftsg2d.so $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -D -m 0755 $(@D)/tensorflow/lite/buildroot-build/_deps/fft2d-b=
uild/libfft2d_fftsg.so $(TARGET_DIR)/usr/lib/
+
+	# Tensorflow-lite
+	$(INSTALL) -D -m 0644 $(@D)/tensorflow/lite/buildroot-build/libtensorflow=
-lite.so $(TARGET_DIR)/usr/lib/
+	ln -sf libtensorflow-lite.so $(TARGET_DIR)/usr/lib/libtensorflow-lite.so.=
$(TENSORFLOW_LITE_RAW_VERSION)
+endef
+
+$(eval $(cmake-package))
--=20
2.36.1


------46F6FC00A3F3198ACDE98D32783AA52B
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
BTEPFw0yMjExMjQxNDA3MTRaMC8GCSqGSIb3DQEJBDEiBCAmm80TGKzjSwuypHIO
4QP62lRW8sH800LuZTeiKRQ3kDB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYCB1d1sGZQq5+qIqigo++JiT6hNHG/1eNoPaL5na/Ne
WL8oVKw1hact7Fcmc3CdNunL6VDVQfe+i49dIgZ4hm2nuXn8G/rC/r0rQs4UeETF
3W7UuIsE8BIGYxKIRsAyDSIJ5ExJi4MNFfbTGeL/afZfIyvy/aI/muGhYzKtuYQk
bfxmW2dswRNEmlOHOaJ8FefVG2/jKu5gxalj9pnIlBSFHLW19o9pNaVmHkz2qYpL
yKSrx9b6t9zx+nePFhGH9DImkeeD/7AB9oTkxI5M2CrrPUY1R1sI0G0elkqlTDOL
4QTknBoAd1jG6J4B5W8FmQnj0HCEDCxwznGeUGMT9qnDGHNkLQMi23oIuSLtrmt4
3Zt4b+KBV3geSfZwnXcAqtExq/a1Y1H7sx+NGRWON8XUwAWQB9M0lNfdhl2udLUh
9/LzjFCLQZps5dY6qFHaBpi+BADx083cGgJAr8c5okIyjw9q47dHUKGevsV2mn+Z
qMnzlLL/8OBUvtpAG6tQwH4=

------46F6FC00A3F3198ACDE98D32783AA52B--


--===============6999565002022179195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6999565002022179195==--

