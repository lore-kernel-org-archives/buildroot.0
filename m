Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5667FC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F20D940C92;
	Thu, 24 Nov 2022 14:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F20D940C92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Bz1RnVcfugU; Thu, 24 Nov 2022 14:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A6CF404CF;
	Thu, 24 Nov 2022 14:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A6CF404CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEAB1BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D8B821EB
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D8B821EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zx4ZWiNE_nA7 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:13:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1CA582101
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1CA582101
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:13:13 +0000 (UTC)
Received: from mail-vi1eur04lp2053.outbound.protection.outlook.com
 ([104.47.14.53]:6256 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1oyCsg-0002lM-04;
 Thu, 24 Nov 2022 15:07:10 +0100
Received: from FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a8::17)
 by AM0PR06MB4547.eurprd06.prod.outlook.com (2603:10a6:208:f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 14:07:08 +0000
Received: from VI1EUR05FT029.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a8:cafe::d0) by FR0P281CA0119.outlook.office365.com
 (2603:10a6:d10:a8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18 via Frontend
 Transport; Thu, 24 Nov 2022 14:07:07 +0000
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000, 
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SINGLE_URI_IN_BODY 0.000000, SUSP_DH_NEG 0.000000,
 URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000,
 __CP_URI_IN_BODY 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FILESHARE_PHRASE 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HAS_X_MAILER 0.000000, __HTTPS_URI 0.000000, __IN_REP_TO 0.000000,
 __LINES_OF_YELLING 0.000000, __MIME_TEXT_ONLY 0.000000,
 __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SINGLE_URI_TEXT 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_STARTS_S_BRACKETS 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NO_NAME 0.000000, __URI_IN_BODY 0.000000,
 __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000,
 __URI_NS 0.000000, __URI_NS_NXDOMAIN 0.000000, __URI_WITH_PATH 0.000000,
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
 VI1EUR05FT029.mail.protection.outlook.com (10.233.243.126) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17 via Frontend Transport; Thu, 24 Nov 2022 14:07:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.55) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 24 Nov 2022 14:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORlIpPOn6EppYcZxXFnn5MZEKayUGip8vBYfkftIf8x1lqZb2YEYJMIEjVYHUIHwbRY2DY7Vxa2YlXMDqJvNkpsPE6LTIJjcZbc5viw7Smt+Di6AekbjIbGSrzSbVli2p/6deHAIBXm6A0RtQrnbdtvKHLDUD/YqTZbQ44kMdv/KnGyduWt5Mpeg+kZCNtO8AsLMUgaHjpZdtj7IOk0vUaEyfipAT5lEMXF9lz6EuSebjQ5L0d+8czMpTa6/NrDag1Jd9/5BUNLjS9Q4kop3ZAJaTeqtkgNbyGwT2q3G83TTrvrSEh0ZbtNiF3DFgOSOm6ipQlrCGnTh7Z/pOJIixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqUDSevMC8uOmWBjcyRTv9Zk48nOn1FXGL7xqKkd1Z8=;
 b=I+F45uqtSGj4t+xCW/664rsX+YtdVwQ1oxdcJiXMBdnKSo4jpMw+CTb+FtitKngws3slmPK90jyRVkO5HMOkntGl2roj8jFKk4XHqNJIGGu85a1weUUkEUa5u6zYL4ukGDUlmh5mPUchnpWnbgFoONY1Kw0s0PhHR5ifCtZz8g9dUzb2TcSixYCEuCitRo+1nMXqes3WIceOZPacGv1LuAeQ155oNgbGY4sQcxF023OVCXfFcC4He8ag0k7Xoo/sVt7Gbyhr/LUUEw7xd5x3+Sa61fg6WvPyjcL0gVPWMmLXk0aHtg242OuwWiw0V9IUv8qaApjU8MvqbWCXI00IPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM8PR06MB7715.eurprd06.prod.outlook.com (2603:10a6:20b:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:07:02 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 14:07:02 +0000
From: Stefan Hager <stefan.hager@ginzinger.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 15:06:25 +0100
Message-ID: <20221124140627.3269192-9-stefan.hager@ginzinger.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM5PR06MB3153.eurprd06.prod.outlook.com
 (2603:10a6:206:6::18)
X-MS-TrafficTypeDiagnostic: AM5PR06MB3153:EE_|AM8PR06MB7715:EE_|VI1EUR05FT029:EE_|AM0PR06MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de1aea3-1622-4592-e117-08dace252bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9uPB1i2VrhVxI20XX90hXJdGUtfU20Kjsw3FkGCyo3tPDHNGsNls9m6jUDCl7xsUm4055ErDLDnnq+/oE3AO2WVL6JkWs3rub/41xcyjvMsXtaZKdBX0Ewe8cC3yejhea4lPJ0JGQC/BcqsWVKcEh159X0gdBjbmMftqobmvnIhDAwWRhKPR28V1i4fnIRMC6L8yEkWzZkLdKh7p9pcCZlXc6ftn3z77sU7+0WaOG71lhHi0ZK5DV7wAKog37WI1UnU1QMBM2SDAoE6uMVEs0Q9ZUdeW/6BJgvRife7gPCHffI0NeFMawVipQn7ik2TjEAJZb1NyIelK1a0Iy+X2BN2ORiL/WFkgak9ECqL6Km5JpqNzCXo/gpWFT24HFh6bkDOCqFigwA3KND5WAQ+aC0Ak7BbMyotW+oHLxDJNFcb2+3Bkn8yZj0/hJHQ40Bs2T5py7H1uwHFt0d8AnnAx5oHYm+5dvR3q+rOjgqd9vMftT6qFe69wJ9gky984R0eivOjOBHvKyqMk8G4w3fGnmyxFep7eR+Rq9Sxpqvi72ogcZamVBdod92qIDPpERLw0YhgwmZ49KA6k3N42wIfFhUQfTykwvgduT3EJMUp1L9AArqPygcyCMttBPfIzLmOtnzHZkK7p0KNNq3yd+3NweN9v5JRTJBahA8WW1grE1JSlWrGAgRyd1vMQVrV3E3aZSH7Jb4IDac83R9IFMRIcnEFwlMN0GjlMxSQaeDj4fhc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(451199015)(966005)(6506007)(6486002)(36756003)(107886003)(6666004)(41300700001)(1076003)(44832011)(2906002)(186003)(2616005)(8936002)(5660300002)(6916009)(26005)(316002)(6512007)(86362001)(54906003)(52116002)(66476007)(8676002)(66946007)(66556008)(4326008)(38100700002)(38350700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7715
X-CodeTwo-MessageID: 4b782e94-79ab-4071-a4df-0b37ed3c2222.20221124140705@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT029.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0d454e58-1b25-4ed8-c053-08dace2528ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hE2uaaxiyT+XthnibkvKrKo62YVAU4MKk/lxc5/W4Y81XG9BYAzBIlvu+gyECmOt4Z7F1e4SRpBH61qvHgvCJngutY4eg0S/HeqiZ5uzh2IMnCzIvTD5EWhx2FRAi3AMaeBX+YsVIfqf41m1OGl+WP0dLykiKuyszFcjiZ4D06LrILC4WFPgr9KsR2mGJVwbh6z/+E7IR6ygKBluOZFXKShAfoefaZhoyEBRdfd0xsactYmJ5/ng3WNkhJ7pbQYtrHF2q1vMBNs7qb6Nvs1gppVeDUkH4DtRmLFK7UvXNYuJ0VJEwHD63wfvZ+0a+UrZ/QQUK3pyuZWF6zv/D8ovAEEYI8+SIBgfBrIXog6nJKtvAz2qLh79UenSyUrkhB2UryhSsWWQ8T22P3khTL64TzisQU9ANBxvkqQfLQOtK/NsVfUTbTCoB+OxYomBq8hxPfn5J9a3k5lqe1dp9Ul/agULlW/HLMhKT5ciX68u2JPtefxEoqYiTPxeHmR4teqQ7E6NDj8Uhh3i12/N2bd2jdvAqKf0Vza7hmbWNv2VDkJYaqTSie+MI95BdEtsaTPFMghSQJquHTvtnNvpGnr1iiHFoU29vTtLRIoNVUEm/1Vg4hLGukOZcYnYzQd9gvE4hOLX+YjvpTWrVMs6YfKmBqodlTyeEsZsA7HOABuozcYt1rBZDC3D6C2K+YnKin6zx0eEaCYi0WBd8eDrdxhE9w==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39840400004)(376002)(396003)(451199015)(46966006)(36840700001)(86362001)(36860700001)(47076005)(44832011)(41300700001)(7636003)(7596003)(2906002)(5660300002)(70586007)(6506007)(82310400005)(6916009)(478600001)(8936002)(6512007)(1076003)(6666004)(40480700001)(107886003)(2616005)(186003)(336012)(4326008)(316002)(8676002)(26005)(966005)(54906003)(6486002)(356005)(70206006)(36756003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 14:07:07.2644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de1aea3-1622-4592-e117-08dace252bfe
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT029.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4547
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 08/10] tensorflow-lite-gemmlowp: new package
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
Content-Type: multipart/mixed; boundary="===============5952817211476313696=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============5952817211476313696==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----9A4D00AB7C7231FBE235EED9F795320A"

This is an S/MIME signed message

------9A4D00AB7C7231FBE235EED9F795320A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

This package adds external sources required by tensorflow-lite. Nothing is =
built or installed within this package, but legal info and source archive i=
s created.
The tensorflow-lite makefile copies the files from this package and uses th=
em for building or to provide headers for the staging folder.

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
---
 package/tensorflow-lite-gemmlowp/Config.in         |  5 +++++
 .../tensorflow-lite-gemmlowp.hash                  |  3 +++
 .../tensorflow-lite-gemmlowp.mk                    | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/tensorflow-lite-gemmlowp/Config.in
 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlo=
wp.hash
 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlo=
wp.mk

diff --git a/package/tensorflow-lite-gemmlowp/Config.in b/package/tensorflo=
w-lite-gemmlowp/Config.in
new file mode 100644
index 0000000000..39faaaa81c
--- /dev/null
+++ b/package/tensorflow-lite-gemmlowp/Config.in
@@ -0,0 +1,5 @@
+# Not user-selectable, it is only needed to be copied
+# into the tensorflow-lite source tree.
+
+config BR2_PACKAGE_TENSORFLOW_LITE_GEMMLOWP
+	bool
diff --git a/package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.hash=
 b/package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.hash
new file mode 100644
index 0000000000..a4fb70aa86
--- /dev/null
+++ b/package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  aff95de30a16132cccb9c219f6489ddf0014742a558d63c443f609dc7f962576  =
tensorflow-lite-gemmlowp-fda83bdc38b1-br1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  =
LICENSE
diff --git a/package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.mk b=
/package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.mk
new file mode 100644
index 0000000000..29c3846ada
--- /dev/null
+++ b/package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.mk
@@ -0,0 +1,14 @@
+##########################################################################=
######
+#
+# tensorflow-lite-gemmlowp
+#
+##########################################################################=
######
+
+TENSORFLOW_LITE_GEMMLOWP_SITE_METHOD =3D git
+TENSORFLOW_LITE_GEMMLOWP_SITE =3D https://github.com/google/gemmlowp
+TENSORFLOW_LITE_GEMMLOWP_VERSION =3D fda83bdc38b1
+TENSORFLOW_LITE_GEMMLOWP_LICENSE =3D Apache-2.0
+TENSORFLOW_LITE_GEMMLOWP_LICENSE_FILES =3D LICENSE
+TENSORFLOW_LITE_GEMMLOWP_INSTALL_TARGET =3D NO
+
+$(eval $(generic-package))
--=20
2.36.1


------9A4D00AB7C7231FBE235EED9F795320A
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
BTEPFw0yMjExMjQxNDA3MTRaMC8GCSqGSIb3DQEJBDEiBCD2AtTFpKvzkZIKPY23
V/Jz5AJUYNMrcuw9zfwPFjPzpjB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYA/1JbFoPbJCak/4PIVDuwHeSsk1UrpMUOp20G7mDXU
gtdnl0/NHdhwP2GVhCQCNwZTT1NStujvqbk90l5H3nVxzEobMvI0XP+F1bhWBvyZ
/drqN18XniN8lF0by8iW81B5f9MiFAx4yYuNsoBmgtM5x++FOLd4DoEOqm7eZzw8
ui2Yuqiz2kwz83O8FzWnd0jP9fAjeBLGBfPqeSVvrImecsc9Zh0w/t+8cswonM/f
iufru8et9AJOnPH+UC+QMgoTzvgW2VqjrvNiTclJ+99JLQZHWTP7tZp345t0+Kgn
bM47OjvhYzDyB9KEimYwQuR9FBNuSEbnL4CUDlSkqaD5PkocYyGp9seHk8JZSgCf
h0m2BCrszQ+afttdTeoYUoV/GDDMnTHvY6yzJ4EhZVjrFwbPq7sZgJwyE4q2jLOD
QjHoPfl8m156wlyVMEGPqecGDf9vKCPX33n0e6fSleGGSRVoQpmR5HWeIeNLfQb1
a25mSsokzWAd5FRcobvFpEk=

------9A4D00AB7C7231FBE235EED9F795320A--


--===============5952817211476313696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5952817211476313696==--

