Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55F5C43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C4941C24;
	Thu, 24 Nov 2022 14:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53C4941C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 946sJqOAzwtk; Thu, 24 Nov 2022 14:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F84141BFE;
	Thu, 24 Nov 2022 14:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F84141BFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E47531BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9B82404CF
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B82404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWmCC6hDGTqD for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:13:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8264140C92
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8264140C92
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:13:20 +0000 (UTC)
Received: from mail-db8eur05lp2108.outbound.protection.outlook.com
 ([104.47.17.108]:24128 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1oyCsd-0002lF-0J;
 Thu, 24 Nov 2022 15:07:07 +0100
Received: from FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::12)
 by PAXPR06MB8112.eurprd06.prod.outlook.com (2603:10a6:102:19b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:07:05 +0000
Received: from VI1EUR05FT003.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::8) by FR0P281CA0122.outlook.office365.com
 (2603:10a6:d10:97::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Thu, 24 Nov 2022 14:07:05 +0000
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
 VI1EUR05FT003.mail.protection.outlook.com (10.233.243.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Thu, 24 Nov 2022 14:07:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (104.47.11.106)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Thu, 24 Nov 2022 14:07:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaPgK1aE24q5jylyMFuU+EaYhNwEcQziUWccJDY0fm0jGbjt7AoHkRD+rid6gtPcNJKc0wdVD3344KRRH57ir+ExsRJBosAmHokf2UBdtk+vFuYZtA3UuwlGnnof0FjtjxJrhfBqtXs37MPKrrJvFSnUXXGSOzeEe9LHIYih1iqI84Q4WwRc8xD2vYQrid5zr1WRSz3l4lty6dxqeWkNMWPWEtDVIptIJJ7Y8MaHfhgKI1NCKs8KyUDgyXVE+tPwVsdN6CAa8W5pqrucEb2QtnOMHXv+3gUfMFK4av3EZb5ESQXi+2Tx9sleIiFWK+tITnrzkdCmI2UzuacYI2l8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmGGs2O9I25p3QaAr5UwdTs5zG5rEorq7F8u/Y/4PcE=;
 b=lxupph1jsoEXT9dA5JLP+1ubJEKNUNAZEOwBgUMDpeLWEqW8F1ToqigykKV0Sno87pAVQIfCVvGrU3RF2WA8RLQ0KvKWY5dqz59qxmddOAVWjhhPOSz4Xv7QLze4odiaD8L2NUIt81uDt4bA8aaN7+ZyjwYZqOC/nwX+ZyueHmfS0bFISSmzskGF68c0plk8vm6IreVrFx3MNVP39qIpY/HbNtlHrof8eTz3Q6ybheXkbh/O5WTOHY1ETr25ChlSAomPI6ix5QAn9/QSlbiaxW1VwxUcft34qgCvydzQmS/YTrEabYaqzDyxckKxZMvwDK0cE8E0HMizEw98LjMhCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM8PR06MB7011.eurprd06.prod.outlook.com (2603:10a6:20b:1db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:07:00 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 14:07:00 +0000
From: Stefan Hager <stefan.hager@ginzinger.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 15:06:19 +0100
Message-ID: <20221124140627.3269192-3-stefan.hager@ginzinger.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM5PR06MB3153.eurprd06.prod.outlook.com
 (2603:10a6:206:6::18)
X-MS-TrafficTypeDiagnostic: AM5PR06MB3153:EE_|AM8PR06MB7011:EE_|VI1EUR05FT003:EE_|PAXPR06MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 783f9bb0-7aaa-4919-d8ef-08dace252a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jQkzHYuOBQZ0s+l23gZ8V/IpaL6bcwrba8FXTid+BGsD/q4Bcf6Hxv78fAqCZEHpBeqludccHWC96aGqLKTlYrxlcd+2NQCc/L525tctxGWSqDtfRG8/bF7az6H7Y/OrDOuiurz3MfmuaThLNHshh3NPar/qItN+tD3HEGI4JaDWtJuzgRpjSVpqRnrV9SB1fPx00YCGF/+Nh8h2yopjaSaf6A+tZbYfc6lGNNr+Xf8uEpeoGQQfuT6jJilzK8Hsv53f0a6c5oY6updZsIjDt01qFgiGnj6ZVMWihesnFgaa6Ys+w8VnGcAkV8FwPWeWrhPOFDpOr1oU/qaqxFj1pOQT1OfKSHK8hJ0ZWCBW988u9HKj+t4jvdPkQMKDUCtPHBGJF/LwJbsr8Gk6HVPFIVyphvej1zYzZ5RD0Jj1dB/Vcf94zwGMSAtVFV98SoIe9KlZteN+HfPY6iSIet79gFUfo9E6+N36qGGjzlxWNXXo0SxlCRIvSGFYTugxMO/kl6aepgrM+JGMOG123slXd8giIZj8K2K4PjULAwVZTpnbzCPL/NAt7EvAskTtWBuyNDpmwQm8bQygyEdxph88oiZX/JlM2dqHLsliOwmU4Psn5phnmhPN10gpFuQI/UDI7itv6WJ+n6/G4e4uP7VoEVYnvW7XrXZHz+Rlx+HoPjHWGpAkgL66gUWw22fHTpBQiiyLbwVA7xi7kkDa6+V0nkbci33mcpW46BOvmViIZeg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39840400004)(366004)(451199015)(86362001)(54906003)(6506007)(107886003)(6916009)(6486002)(966005)(6666004)(36756003)(38100700002)(38350700002)(1076003)(2616005)(186003)(5660300002)(44832011)(6512007)(26005)(52116002)(478600001)(66946007)(66476007)(66556008)(8676002)(316002)(2906002)(4326008)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7011
X-CodeTwo-MessageID: a2db8aff-dde0-40c2-ae3a-403142ca3624.20221124140702@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT003.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5fd215f6-b769-440f-4c74-08dace252790
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jCv+8K8Ia0fWyDXV64kUm/W9XB1SmpG7ZRtf1Eg/qqQISk6ktwSTLuIjMRQceCN5LMJdGin9+OK5LOW51XlPKzihbQ9b6Bw8oXtgLTsQWVEMwpso8AlmX2YOp0TY7JurPSzAUOMAvpZd9vr0VRFqHU2KeviuAW7hd3exY+igJ5WiSMg7GjNRMGqq6NTIsrwSfO649Y36w0tsnhFgxoQ1+8exokwDblzAAXNuPbQ6tARJwiWWg72+CNvsZLIjg1ybdrXAxm8LzTMCOJSaqjyIqEBGM9202WEgPtqseZXVoLjlGWjpz88df10qp7dmwSoz9T707M8sdeJ509DsxhFQPwL1LwuK0wLuQ4pik5i0ZOsQeWssctz+pVjIOYNeeMK91aN2HaWX+xMvNPfvOE08eOmNRGTXdtQo0oJYHO4fUFL0ys2ukM1icCPtWWK9nBn5tGX1JA9EDDFtVY92S1Gd0fs+9W8yOYAsx2fO5gbkQCU0MNmE1eofg6mXnvs8rydwAOHLPXZSIjG6z7Pp17LWGI7FnJgNhzUsOf1oq/38ZJIBLh9E7SsbLuxBycrzDlH1DR0fXrL/wfnli6tGtYMa+WAnDm4tbpiNHwwQNfs+wj9d06BNihn0qfqNATsmVOAN7jilFpUOhKP4xxyXu2wSHBy80u1C9Pm+CAJ7nryVGRUNxIlqnHX/zztGpvCEDR02pEB36OxQa77/2zXvpsp9ig==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39840400004)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(6506007)(40480700001)(6486002)(966005)(36756003)(6666004)(107886003)(41300700001)(36860700001)(186003)(336012)(47076005)(44832011)(8936002)(5660300002)(2616005)(2906002)(1076003)(316002)(26005)(82310400005)(6512007)(86362001)(4326008)(6916009)(8676002)(54906003)(70206006)(356005)(7636003)(7596003)(478600001)(70586007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 14:07:04.6408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783f9bb0-7aaa-4919-d8ef-08dace252a7c
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT003.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8112
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 02/10] tensorflow-lite-clog: new package
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
Content-Type: multipart/mixed; boundary="===============0072093541966270291=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============0072093541966270291==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----D627C842B1FB46F279CC54AF55F03422"

This is an S/MIME signed message

------D627C842B1FB46F279CC54AF55F03422
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
 package/tensorflow-lite-clog/Config.in             |  5 +++++
 .../tensorflow-lite-clog/tensorflow-lite-clog.hash |  3 +++
 .../tensorflow-lite-clog/tensorflow-lite-clog.mk   | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/tensorflow-lite-clog/Config.in
 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.hash
 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.mk

diff --git a/package/tensorflow-lite-clog/Config.in b/package/tensorflow-li=
te-clog/Config.in
new file mode 100644
index 0000000000..2555a7ad48
--- /dev/null
+++ b/package/tensorflow-lite-clog/Config.in
@@ -0,0 +1,5 @@
+# Not user-selectable, it is only needed to be copied
+# into the tensorflow-lite source tree.
+
+config BR2_PACKAGE_TENSORFLOW_LITE_CLOG
+	bool
diff --git a/package/tensorflow-lite-clog/tensorflow-lite-clog.hash b/packa=
ge/tensorflow-lite-clog/tensorflow-lite-clog.hash
new file mode 100644
index 0000000000..92dc6d3c43
--- /dev/null
+++ b/package/tensorflow-lite-clog/tensorflow-lite-clog.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  820097a94890b35c6f313a6e8be38dc95c405ca2800f141cdf9ec53ec8c48672  =
tensorflow-lite-clog-d5e37adf1406-br1.tar.gz
+sha256  68a14c3e79add023eecd83d611e73f05b8bf1d16852efeb7eb4033a96736da9e  =
deps/clog/LICENSE
diff --git a/package/tensorflow-lite-clog/tensorflow-lite-clog.mk b/package=
/tensorflow-lite-clog/tensorflow-lite-clog.mk
new file mode 100644
index 0000000000..70c650e055
--- /dev/null
+++ b/package/tensorflow-lite-clog/tensorflow-lite-clog.mk
@@ -0,0 +1,14 @@
+##########################################################################=
######
+#
+# tensorflow-lite-clog
+#
+##########################################################################=
######
+
+TENSORFLOW_LITE_CLOG_SITE_METHOD =3D git
+TENSORFLOW_LITE_CLOG_SITE =3D https://github.com/pytorch/cpuinfo
+TENSORFLOW_LITE_CLOG_VERSION =3D d5e37adf1406
+TENSORFLOW_LITE_CLOG_LICENSE =3D BSD-2-Clause
+TENSORFLOW_LITE_CLOG_LICENSE_FILES =3D deps/clog/LICENSE
+TENSORFLOW_LITE_CLOG_INSTALL_TARGET =3D NO
+
+$(eval $(generic-package))
--=20
2.36.1


------D627C842B1FB46F279CC54AF55F03422
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
BTEPFw0yMjExMjQxNDA3MTFaMC8GCSqGSIb3DQEJBDEiBCBQyxb+NxVXiku2r83Z
1Xhd7uwP0cBjiSxR9NSocg14NzB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYB8ctvE6EaMVuscOxJHybtTcX/kpB5BPjibjgbcLKNj
1PKT7NnQJ5XmeG03tXNQ3vX2AvkY8dv5YbNN/Lvm1/0+x0YNGbyOsB+t3QE7cu1r
a8lYC+OdHPLFvUS8/LWi1JdktKsAQfoV46Hkp26as/Yfg9j3dzpcqleUc+aD3Eki
FQiKaIesgto6mcW6x1kvLg9t5G+o6HNcsJ8X1IO/0fhZUdP7+C61g0KV8KZGaM3o
/v8FU4iF4ZBj5/dY0TXzbGF9h9nHOfDuloTIIndO4+doQTAfJ2hCaqVipDMuM6zE
17hygMMvnrB+WYJNmrYVsb//l4Yem4E0dIMteDnsM0pcl9+tKnNxaf2k+cQhrQEs
vK8xlQDnoqosYEqfqIf1pmLssJt/rzjIn2Zckd0sNwZTQdY5b2aRmvtb6RCh6fln
JAZ/ulphrWrdEFzOVJJSDf49pLZjYfB2ispf2+C03RCtDIVzDwNYtu465AtV7iR4
KM6hEHOUotH2OlYeFRuhSX8=

------D627C842B1FB46F279CC54AF55F03422--


--===============0072093541966270291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0072093541966270291==--

