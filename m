Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCBBC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E840040C92;
	Thu, 24 Nov 2022 14:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E840040C92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aE810uxx5yKF; Thu, 24 Nov 2022 14:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D95D3410D6;
	Thu, 24 Nov 2022 14:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D95D3410D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85BAA1BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FD784056A
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FD784056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6r1IV0L9gck for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:13:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1998F404CF
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1998F404CF
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:13:25 +0000 (UTC)
Received: from [104.47.1.53] (port=10560
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1oyCsd-0002lH-2R;
 Thu, 24 Nov 2022 15:07:07 +0100
Received: from DUZPR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::8) by VI1PR0601MB2224.eurprd06.prod.outlook.com
 (2603:10a6:800:2c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:07:06 +0000
Received: from DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::65) by DUZPR01CA0065.outlook.office365.com
 (2603:10a6:10:3c2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Thu, 24 Nov 2022 14:07:06 +0000
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000, 
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CLOUD_WEB_HOSTS 0.000000, CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, 
 HTML_00_10 0.050000, IN_REP_TO 0.000000, IN_TLD 0.100000,
 LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_FUR_HEADER 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000, SINGLE_URI_IN_BODY 0.000000,
 SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
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
 __URI_NS 0.000000, __URI_NS_NXDOMAIN 0.000000,
 __URI_STORAGE_GOOGLEAPIS_COM 0.000000, __URI_WITH_PATH 0.000000,
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
 DB8EUR05FT033.mail.protection.outlook.com (10.233.238.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17 via Frontend Transport; Thu, 24 Nov 2022 14:07:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.55) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 24 Nov 2022 14:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2NzhLjwDsoM9dCYq4vElyrUR+OntVGyeD0bzVNl3d98coj+q3bTG6x6CpYxPFnKhiGG8R10ww3NYMvEyZTEQhBVRNGtGTVs5wwmdo2vssEfOa+2KDxc5K6USei8nrYSVw4XMbTHrsFrhIuuMXQMQ65rn74IuvD0QgE06W5InFemBPi95trvqUSYz2uEtPOdERY8C8jzdlfaQXVHaEXc4wyRf2v3Jp+metIpjZ84caB/GZQwot+6O4TezxKqhtLvzm6JCD0kVGLsPu89NPB00919rbXMAaQEkOTt45D3Iat3hrzBYFSnJinbptrvvg6OsbtgkdXMa+dP55ya2zEo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LyoS4uQPtvUpgcDEHW8Iw0pfMUxpR3cNSMQePlpQhQ=;
 b=KEjJ0Ps3DAIMTWbXqoYh5iFOg+UtcqXssINe4l/Z25+4wEAMpIld07xQ/Ag/5nPFvMbtl8EuGF542CcvPbAIv3byiu2Ek7DBbuxWHwI0i3tr/XvcgYbs7VjYaMSA1b0SIaz5uOCRlbsA5/0L4MbZNQwkis098iqxfZA4pF1hbe0XZpLD56k4GGjeRrC2xHM58rECUB2++D+lqfhKRPNcuMoT1+ecpb9t8OhWESLOZz3GCjmmZhT+sKeYxC2eTS4IyLp48l9INfI6OOMwhi5+t7C4Bas53HQDNKA2bFLaypXjJ9LzcpyO6QhqtoI5HjJX7LTYJRV6vm8pjzD/Iv9TYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM8PR06MB7715.eurprd06.prod.outlook.com (2603:10a6:20b:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:07:01 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 14:07:01 +0000
From: Stefan Hager <stefan.hager@ginzinger.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 15:06:23 +0100
Message-ID: <20221124140627.3269192-7-stefan.hager@ginzinger.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM5PR06MB3153.eurprd06.prod.outlook.com
 (2603:10a6:206:6::18)
X-MS-TrafficTypeDiagnostic: AM5PR06MB3153:EE_|AM8PR06MB7715:EE_|DB8EUR05FT033:EE_|VI1PR0601MB2224:EE_
X-MS-Office365-Filtering-Correlation-Id: af20a668-7e62-4d60-ec63-08dace252b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WjK0nbhrwQi5l510373VXbCzJFcX/D6rS7tE4UPZc/4qAFanMwXaju3L/PSWY6B/InlX/xSFR5LTDCIqlf/WqbwhMNMRmw99P3xrYdANpyPAHulsiFSTnF0quktVEk3Y+70YqfL6tgJUwJ3fEI0mkqGYwyO6w9uQkXxcBRhEYwEpZwHcap3QvBpun9mAT63xrDNa8slQG46i/A0mOXvQ8tDrc3p5VktMY/UuZ8z5QCbW89ARZ1jSaM0ieRNzdA3noqfOdZgRJMO3jOw3aoQCv822ehDiRyQ39F04lwHWXkxbPlbZXns8RyFjdVKfCQQiwSdbhGIznVB7TY5JWEewn2hS56e7YmPQmRGs+1MmAt/DaLvaeBcS+MYJN3RrkzTyKyS8HELKhOsLmWuyLCDxHbf76EVsj7jZyiXq3qQVuSkRLKUkHgoGmYlxSlGsk8LM5O5duWqO5hngebGppzBcAmzptyyMA9+zQg/bJAsgXqHuIP1EctgVK5um43JBd7gG/XHdT+Asgqg3rsS43zsiMu/3D4yXfqnK7t5S1Jax+OJKk3majA2il46WTYsVg9+iPRUWDX7I/8FruRiOmWdOg395xyPxDehpWYqkeM8Gv+09qA7xL2jJ3pOPN0xZZwaXcsueMy2rA2rYhDpjfZpYMzG+brEoxiN/noETULnJQ7RhaMf7d7Cu2j5jFYy2IyHzxBuFw3Qj0/o7OygfVvVI7Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(451199015)(966005)(6506007)(6486002)(36756003)(107886003)(6666004)(41300700001)(1076003)(44832011)(2906002)(186003)(2616005)(8936002)(5660300002)(6916009)(26005)(316002)(6512007)(86362001)(54906003)(52116002)(66476007)(8676002)(66946007)(66556008)(4326008)(38100700002)(38350700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7715
X-CodeTwo-MessageID: 5db33902-7c67-4911-be71-1a3b73e6ecce.20221124140704@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7375ccd1-dcf0-4655-2a6a-08dace252875
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Es1UMb0Onh7XBfh8CWKFcACjqVcmsRB0ckYQHc5bBXwHBxPQmGswuSUjw9h2VViAccGsWpHNfgISt+nYX5L2rjnZl1POI2GRz95oAnmrMuYn78koIKcqek5v+6aT3e46s9sRRsKx7Ap9KVKZFxcknniKz2+PGIBBVZFpMWoz0eiBTZL/DuVz5XdrFVe1SmTqjAML64NPuCfuT8KJdwBBH1hqjjRd4yR1pnQoE0hrjkmhVG7Lor6CQoauDJrDA0e/9jxRzrYPi5bXCwkyBxXr2YStrqJuwQDOqK6U6S/S7jzXxSp87aSe4L/VDW9lzHaCcRLzw0buHY/3UJQcJH4ozMlKLDVS6Rn9AHgKvsqPEGVlW94wFxu9v06pwuPavnXeQc2R1eXYMEG9vAFq2LmAyqi+VQ9q/ot/GXonrgx80BSi6iV3L0ZveaM6NE51qh2YYB6rcQxzVS4nHnrutLDe3J7ASQWgTGXoCfBm+vU3YFSTUMoHrmvI/sMUdzziYqfqYVTIu5yzIJxolqjGwgpLjN+ruivvrV17WpujmNzsas2MsO/n4kDRzsU8KsWRhWhTpEed5M+6Shc9k4ZjP/z9CKZcxSb7F/aZ3gPdjXLOq61jCBT1oQa0ae1cExM2F5Kz3HViom2ynybzdIGQb+ltsOb7RwUsWHOTP6QkTOJVifi7FVDQ/ZdmWf4kQNhmZ+pjsmhq0Py9DuB1PTQyIYALhw==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39840400004)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(44832011)(5660300002)(2906002)(356005)(7636003)(7596003)(36756003)(70586007)(8676002)(4326008)(70206006)(54906003)(86362001)(6916009)(316002)(8936002)(41300700001)(82310400005)(6486002)(478600001)(966005)(6506007)(26005)(40480700001)(6666004)(107886003)(6512007)(47076005)(36860700001)(2616005)(336012)(1076003)(186003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 14:07:05.6551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af20a668-7e62-4d60-ec63-08dace252b06
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2224
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 06/10] tensorflow-lite-fft2d: new package
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
Content-Type: multipart/mixed; boundary="===============2663624052220539641=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============2663624052220539641==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----A934BA72456C2F2A5AFBA274C3EB67CE"

This is an S/MIME signed message

------A934BA72456C2F2A5AFBA274C3EB67CE
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
 package/tensorflow-lite-fft2d/Config.in           |  5 +++++
 .../tensorflow-lite-fft2d.hash                    |  3 +++
 .../tensorflow-lite-fft2d.mk                      | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/tensorflow-lite-fft2d/Config.in
 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.has=
h
 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk

diff --git a/package/tensorflow-lite-fft2d/Config.in b/package/tensorflow-l=
ite-fft2d/Config.in
new file mode 100644
index 0000000000..03567e05af
--- /dev/null
+++ b/package/tensorflow-lite-fft2d/Config.in
@@ -0,0 +1,5 @@
+# Not user-selectable, it is only needed to be copied
+# into the tensorflow-lite source tree.
+
+config BR2_PACKAGE_TENSORFLOW_LITE_FFT2D
+	bool
diff --git a/package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.hash b/pac=
kage/tensorflow-lite-fft2d/tensorflow-lite-fft2d.hash
new file mode 100644
index 0000000000..40588abfb7
--- /dev/null
+++ b/package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  5f4dabc2ae21e1f537425d58a49cdca1c49ea11db0d6271e2a4b27e9697548eb  =
v1.0.tar.gz
+sha256  0b2a2082537735a2a576dbec2e8f9c1a09812eac6df6a389502a6ba860072906  =
readme2d.txt
diff --git a/package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk b/packa=
ge/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk
new file mode 100644
index 0000000000..cd3f70898b
--- /dev/null
+++ b/package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk
@@ -0,0 +1,15 @@
+##########################################################################=
######
+#
+# tensorflow-lite-fft2d
+#
+##########################################################################=
######
+
+TENSORFLOW_LITE_FFT2D_SITE_METHOD =3D wget
+TENSORFLOW_LITE_FFT2D_SITE =3D https://storage.googleapis.com/mirror.tenso=
rflow.org/github.com/petewarden/OouraFFT/archive
+TENSORFLOW_LITE_FFT2D_VERSION =3D 1.0
+TENSORFLOW_LITE_FFT2D_SOURCE =3D v$(TENSORFLOW_LITE_FFT2D_VERSION).tar.gz
+TENSORFLOW_LITE_FFT2D_LICENSE =3D readme2d.txt
+TENSORFLOW_LITE_FFT2D_LICENSE_FILES =3D readme2d.txt
+TENSORFLOW_LITE_FFT2D_INSTALL_TARGET =3D NO
+
+$(eval $(generic-package))
--=20
2.36.1


------A934BA72456C2F2A5AFBA274C3EB67CE
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
BTEPFw0yMjExMjQxNDA3MTJaMC8GCSqGSIb3DQEJBDEiBCApb6BXnqeTz42tQ7H8
wmPcR1U1qgH+uC92wp90Jwkz7TB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYBfoKiR9CE3Vq4YNDZ6HHG85DvqdqqG1GKBMYfizavB
48lerXE4yY+32PADqd/44y2nnyZAPYM5vIVXKJxFP/SMTOw+vfquczKFpZP+o6ap
UbSpbntVPL4jBDtJR0uv2rqBuJr74d/wsWe1O7TWUmSPuSIoClGF9Ehp3JMdzPvl
z+aZR/D9H/N64bAr2dvCMOc6QYMIsHDThNjoXtmC3dv/BL43Mud3cFY9s7jQqqvV
E2bwMs31mrwGS46Eu9s953/QV1z5smIhEdw+smVESEq+X7Z1lnw4nFYyjX5vWr7J
r+RqJ1Efv51074RYJ08HPsOiIf1/DWgxU5UPQkkq68n7qq3hvj3llBM/XNsMccke
oInUPYSDGS4n7bkc116g3h7BfK3ufIzD7Vu16jnAh3dPUzbRauSy9XpQPhD05la1
EnxpbCZNdCOAVk1Z/qce4eFlAM38Up9tg09j6UPtOjICZVwJUFqZnFZrVHsb0/bu
cDO8ni0evrGH+Hm9RSuYAYU=

------A934BA72456C2F2A5AFBA274C3EB67CE--


--===============2663624052220539641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2663624052220539641==--

