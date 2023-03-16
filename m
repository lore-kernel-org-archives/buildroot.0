Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D216C761A6
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 14:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6AEA80FB0;
	Thu, 16 Mar 2023 14:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6AEA80FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgGQ6zAVPbXx; Thu, 16 Mar 2023 14:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F0B38101B;
	Thu, 16 Mar 2023 14:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F0B38101B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9F91BF36C
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 14:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55560405AE
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 14:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55560405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXIhUAQN1UGc for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 14:43:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E5B40024
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34E5B40024
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 14:43:40 +0000 (UTC)
Received: from mail-db5eur02lp2107.outbound.protection.outlook.com
 ([104.47.11.107]:30317 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1pcopK-0002g3-2U;
 Thu, 16 Mar 2023 15:43:35 +0100
Received: from AS8P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::18)
 by DB6PR0602MB2936.eurprd06.prod.outlook.com (2603:10a6:4:9e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 14:43:33 +0000
Received: from AM6EUR05FT053.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::6a) by AS8P189CA0005.outlook.office365.com
 (2603:10a6:20b:31f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31 via Frontend
 Transport; Thu, 16 Mar 2023 14:43:32 +0000
X-SASI-Hits: BODY_SIZE_10000_PLUS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 ECARD_KNOWN_DOMAINS 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000,
 LINES_OF_YELLING_3 0.050000, MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_URI_FOUND 0.000000,
 NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000, SUSP_DH_NEG 0.000000,
 __ANY_URI 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __AUTH_RES_ORIG_DKIM_NONE 0.000000, __AUTH_RES_ORIG_DMARC_NONE 0.000000,
 __BANNER_TRUSTED_SENDER 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000, __CT 0.000000,
 __CTE 0.000000, __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000,
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000, __FILESHARE_PHRASE 0.000000,
 __FORWARDED_MSG 0.000000, __FRAUD_BODY_WEBMAIL 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FRAUD_WEBMAIL 0.000000, __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000,
 __HAS_FROM 0.000000, __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000,
 __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __IN_REP_TO 0.000000,
 __LINES_OF_YELLING 0.000000, __MAIL_CHAIN 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __MULTIPLE_RCPTS_TO_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000,
 __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
 __SCAN_D_NEG_HEUR2 0.000000, __SUBJ_ALPHA_END 0.000000,
 __SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_MAILTO 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
 __URI_NS_NXDOMAIN 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.1, AntispamData: 2023.3.16.142117
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com; 
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM6EUR05FT053.mail.protection.outlook.com (10.233.240.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.18 via Frontend Transport; Thu, 16 Mar 2023 14:43:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.177)
 by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Thu, 16 Mar 2023 14:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb8T7ZSpHI+DIerDkFkyKuKsCLIoqBTQDU+92lnTtqWQ0GlH5uRpFJYCMTjYtAlyK2KWClkkQrLKpmZjF34Eh6WZgPgaYu1ytHVUnOzwT+NIizq7ze421L7Mc8/lXaix7zwYsUpxl9GCtOLidXLUhu5xW2ilPLcRgMeKbaC4rMeY+Ma8HxVHD19/McnnHBcIP8wUVBZrmusXCIay6hc7yef/B52hPKpkFVLKC82sP5Y8KRpL8HBtNJmiDKeznFFOalGxt7UmTej9j7wh4nW4b7Sfj5oFmKUXwi9lMfLdHl8jbd6B2csZ5kWq82cwB5S/WFNDv+KHm+BQFUoZMIRQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWQ6G2AQZwSnX7j5gC4+w6V0fOw5xAKX9COchJcI/B0=;
 b=EXtutyaItaMgzXh8y+iTphtPlK764sCsbNJII9whvVcDi2/CZ/5/svKNRF2MMXK3tFd8BQXJEpziJGm3sVksvJTmi13dF1ZxUNGF99tCUSGFya4w7ppIR1GxEG9lxqWG2akoyj/k8BilhFT87j09V+DeDtWMZsMiTCtfrxkTvlfyKK+6ItpLmGD26fJSYzU2Moeg+lWMjvtQFh9De+1LD7+t1kPHAcfWSK3kzux1smNhKFdEDAv3/YMAl9l+e+o4Xfscp8g/dbjc89veJdqZPJpLGU6g6xA2/kqvwBPqNlePjzDusTv73tfu/6PQxgRFfdnZ5OjlyR2uAwCGjyVnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by HE1PR0601MB2697.eurprd06.prod.outlook.com (2603:10a6:3:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 14:43:27 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::9d81:c3d:3776:5acc]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::9d81:c3d:3776:5acc%6]) with mapi id 15.20.6178.030; Thu, 16 Mar 2023
 14:43:27 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Index: AQHZWBWqvrDzjBDV706VyF2P8vBKbA==
Date: Thu, 16 Mar 2023 14:43:26 +0000
Message-ID: <AM5PR06MB3153B2665A7751B46AF971D084BC9@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
 <20230316083440.3466725-10-james.hilliard1@gmail.com>
In-Reply-To: <20230316083440.3466725-10-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|HE1PR0601MB2697:EE_|AM6EUR05FT053:EE_|DB6PR0602MB2936:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a29cdb9-89ab-49a0-e49a-08db262cd0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: THtvhYtWbvon950UlEtOPel6cAtiCJl4Muwvq6vXHNcG6CIBV4XrBQ3mrK6VBrru1z+2VNnlQjkKjxdKHRwD7V33QF/6y5NDVa0rzf0HHLv1xq2gcj5DkUDHSPpGDXC8ujw5yQe/1W5BAIXLFJfw6/tU+wJrhpjj39ecYWEWaon9Jd1+m4egiKORg9bSwDrxzgqAYYPGYuIZhpMjSPDBj99p5tyCftfxGzqJDzI9o+tc3bJibW0GPOdDTHLFnC9JHf8UnI4EcvF7eO9AUfNWlNkPSQ+c2MIuHmcNjR97DO7G7RspuHHrQt9554qxm8j8XBklWRi4FGv4Xi6qksaRUWuury/XZnivfwCUAwqeOJpBjmwF1gL3iy1M488im3DA9LDPTEhtNML6o/az5i+ZyQn4Ir/dlosUYSkYS1kr8fVZSjdwQHLDMPtCb3aBat5//h85zdQ+kwaYY7Au0RfzFol9H5EPBBdE+rB1DxoTdVV2TlqQT7N7fIyB/EGptjBFrHKSjWrXRMs9T3QY0ukqedQ5TSH53B/VpWN5KSZKfvxtzyGvUfXpaTz15dvSbE6Zl8Axh6ZsbkRawk17IgakpeP2Ewp54wuklmhxw2UJeTfUPkf7Nltol+Rew27l2Twdus6vddO6LSRRmFQx3z/Os/+EGEFBSd7VbznjHXwgrPh+1e6LxWD/g76YHDB1hWTz
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(451199018)(33656002)(8676002)(86362001)(4326008)(52536014)(5660300002)(30864003)(8936002)(41300700001)(2906002)(38070700005)(122000001)(38100700002)(7696005)(71200400001)(76116006)(478600001)(66446008)(66946007)(66556008)(91956017)(66476007)(64756008)(55016003)(54906003)(19627235002)(110136005)(316002)(83380400001)(186003)(6506007)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2697
X-CodeTwo-MessageID: c973e377-25c5-4778-b83f-d129d4ad73ac.20230316144331@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM6EUR05FT053.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: eb4efbc0-41b5-493b-3b4c-08db262ccd69
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDPMr2J6GUJJe+7w+HJ58ID7771wPypP7gzBwlMKeLt66ivIg2Y5Nq/amwtc2+cNOjQc+FlicuuyUCZTczKuGxaNryQHerElbxfpXiekWhHU8jUl4FoCaU0RBLl2mAQyDXU78a7zlowMBWU42cugkH64rEehR5T+W/2+MeY6Mopl7PJ+FrfnbFvy/46BMXWodNSTFKukFw1jYB2cK3qhT4q9tSoOGbP06+DGukKc2OU75vv+4RP6NfxnOB9AAwaIqDVXcdDEwj8Oj3tTKfKuHhp4AmIfTmLix45l+UrGY/bsH87QgmOc2chtUawe490rvD4AXodjcz+WrVGEvb1weawI/eX0EDsgjdBbQn9l7zPGZS3mt7AsdJxl2wdvLveb8t4+CiL+3VJ4ZWTRaJclf+Hj75seWKbdOVrtQA2mn+F+YGo3DWLfY2G1GIFoPrd63tHW+WZOQkOEJqI4CihOtmRI3m8cBH7lAcZK5n0N9gRQJEw2b6c13MWRP2O4WbjunC+ZKQeR74+bjsYcQLu3NkHcy3D7QeB26yi7qXIXhqU9el/sZpx0pnynQfB/grlw5g68RHHdDw1xdCJGpbYUAIfF3URfp/2IvIXgQvnRQHUdG/vqVb3xWaxkWUyKTSVtUo8FTYdihn90sYFWkUw4tEyZ1SZ1HmpIWlqJXUUuE5I=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39840400004)(396003)(376002)(136003)(451199018)(46966006)(36840700001)(7696005)(41300700001)(8936002)(30864003)(52536014)(2906002)(356005)(33656002)(86362001)(36860700001)(7596003)(7636003)(5660300002)(8676002)(478600001)(70206006)(70586007)(110136005)(55016003)(4326008)(40480700001)(82310400005)(54906003)(316002)(19627235002)(47076005)(9686003)(336012)(186003)(26005)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:43:32.5685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a29cdb9-89ab-49a0-e49a-08db262cd0c1
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM6EUR05FT053.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB2936
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 10/10] package/tensorflow-lite: new
 package - enable example
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============7551659042461471845=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============7551659042461471845==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----0E471D72BA3B3A3E6C4B4E6AFDC36FA6"

This is an S/MIME signed message

------0E471D72BA3B3A3E6C4B4E6AFDC36FA6
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi James, all!=0A=
=0A=
Thanks for the update.=0A=
=0A=
To optinally build and install the label_image example, i created the follo=
wing patch:=0A=
(It builds, and the example run on target hardware (aarch64).)=0A=
=0A=
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Co=
nfig.in=0A=
index 8685ec0c71..e518ba28c6 100644=0A=
--- a/package/tensorflow-lite/Config.in=0A=
+++ b/package/tensorflow-lite/Config.in=0A=
@@ -34,3 +34,8 @@ comment "tensorflow-lite needs a toolchain w/ glibc, C++1=
7, threads"=0A=
 =0A=
 comment "tensorflow-lite needs a toolchain w/ shared libraries"=0A=
        depends on !BR2_SHARED_LIBS=0A=
+=0A=
+if BR2_PACKAGE_TENSORFLOW_LITE=0A=
+config BR2_PACKAGE_TENSORFLOW_LITE_BUILD_EXAMPLE=0A=
+        bool "Build tensorflow-lite's label_image example"=0A=
+endif=0A=
diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorflo=
w-lite/tensorflow-lite.mk=0A=
index 433eff3242..5dd29f8df0 100644=0A=
--- a/package/tensorflow-lite/tensorflow-lite.mk=0A=
+++ b/package/tensorflow-lite/tensorflow-lite.mk=0A=
@@ -56,4 +56,17 @@ else=0A=
 TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_XNNPACK=3DOFF=0A=
 endif=0A=
 =0A=
+=0A=
+ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_EXAMPLE),y)=0A=
+define TENSORFLOW_LITE_EXAMPLE_BUILD_CMDS=0A=
+       $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(TENSORFLOW_LITE_BUILDDIR)=
 -t label_image=0A=
+endef=0A=
+TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D TENSORFLOW_LITE_EXAMPLE_BUILD_CMDS=
=0A=
+=0A=
+define TENSORFLOW_LITE_INSTALL_TARGET_EXAMPLE=0A=
+       $(INSTALL) -D -m0755 $(@D)/tensorflow/lite/buildroot-build/examples=
/label_image/label_image $(TARGET_DIR)/usr/bin/label_image=0A=
+endef=0A=
+TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D TENSORFLOW_LITE_INSTALL_TAR=
GET_EXAMPLE=0A=
+endif=0A=
+=0A=
 $(eval $(cmake-package))=0A=
=0A=
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
Best regards=0A=
Stefan=0A=
=0A=
>From: James Hilliard <james.hilliard1@gmail.com>=0A=
>Sent: Thursday, March 16, 2023 09:34=0A=
>To: buildroot@buildroot.org <buildroot@buildroot.org>=0A=
>Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Samuel Martin <s.mart=
in49@gmail.com>; Hager Stefan <Stefan.Hager@ginzinger.com>; James Hilliard =
<james.hilliard1@gmail.com>=0A=
>Subject: [PATCH v6 10/10] package/tensorflow-lite: new package =0A=
> =0A=
>From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
>=0A=
>This package adds the tensorflow lite runtime to buildroot.=0A=
>=0A=
>Tested-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
>Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
>Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
>---=0A=
>Changes v5 -> v6:=0A=
>  - update patches=0A=
>  - add architecture dependency=0A=
>  - backport system farmhash patch=0A=
>Changes v3 -> v4:=0A=
>  - fix min gcc version=0A=
>  - enable xnnpack=0A=
>Changes v2 -> v3:=0A=
>  - drop architecture restrictions which appear inaccurate after adding ne=
on-2-sse=0A=
>  - disable android only nnapi=0A=
>Changes v1 -> v2:=0A=
>  - fix label_image build=0A=
>  - more explicit cmake config=0A=
>---=0A=
> DEVELOPERS                                    |  1 +=0A=
> package/Config.in                             |  1 +=0A=
> .../0001-lite-Update-CMakeLists.txt.patch     | 49 ++++++++++++=0A=
> ...dd-SYSTEM_FARMHASH-cmake-config-flag.patch | 74 +++++++++++++++++++=0A=
> .../0003-Fix-FindFlatBuffers-cmake-file.patch | 51 +++++++++++++=0A=
> ...ink-tensorflow-lite-against-gemmlowp.patch | 32 ++++++++=0A=
> package/tensorflow-lite/Config.in             | 36 +++++++++=0A=
> package/tensorflow-lite/tensorflow-lite.hash  |  4 +=0A=
> package/tensorflow-lite/tensorflow-lite.mk    | 59 +++++++++++++++=0A=
> 9 files changed, 307 insertions(+)=0A=
> create mode 100644 package/tensorflow-lite/0001-lite-Update-CMakeLists.tx=
t.patch=0A=
> create mode 100644 package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake=
-config-flag.patch=0A=
> create mode 100644 package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake=
-file.patch=0A=
> create mode 100644 package/tensorflow-lite/0004-Don-t-link-tensorflow-lit=
e-against-gemmlowp.patch=0A=
> create mode 100644 package/tensorflow-lite/Config.in=0A=
> create mode 100644 package/tensorflow-lite/tensorflow-lite.hash=0A=
> create mode 100644 package/tensorflow-lite/tensorflow-lite.mk=0A=
>=0A=
>diff --git a/DEVELOPERS b/DEVELOPERS=0A=
>index 678c027898..1307949f7a 100644=0A=
>--- a/DEVELOPERS=0A=
>+++ b/DEVELOPERS=0A=
>@@ -2694,6 +2694,7 @@ F:        package/gemmlowp/=0A=
> F:      package/psimd/=0A=
> F:      package/pthreadpool/=0A=
> F:      package/ruy/=0A=
>+F:     package/tensorflow-lite/=0A=
> F:      package/xnnpack/=0A=
> =0A=
> N:      Stefan Ott <stefan@ott.net>=0A=
>diff --git a/package/Config.in b/package/Config.in=0A=
>index 8969672e42..45fca4f15d 100644=0A=
>--- a/package/Config.in=0A=
>+++ b/package/Config.in=0A=
>@@ -2158,6 +2158,7 @@ endif=0A=
>         source "package/sphinxbase/Config.in"=0A=
>         source "package/startup-notification/Config.in"=0A=
>         source "package/tbb/Config.in"=0A=
>+       source "package/tensorflow-lite/Config.in"=0A=
>         source "package/tinycbor/Config.in"=0A=
>         source "package/tl-expected/Config.in"=0A=
>         source "package/tz/Config.in"=0A=
>diff --git a/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch=
 b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch=0A=
>new file mode 100644=0A=
>index 0000000000..53b5170681=0A=
>--- /dev/null=0A=
>+++ b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch=0A=
>@@ -0,0 +1,49 @@=0A=
>+From 081c2e4e3cf021efb2853a485a18b563e88f6117 Mon Sep 17 00:00:00 2001=0A=
>+From: Terry Heo <terryheo@google.com>=0A=
>+Date: Tue, 1 Nov 2022 15:55:30 -0700=0A=
>+Subject: [PATCH] lite: Update CMakeLists.txt=0A=
>+=0A=
>+This changes are needed to build kernel tests.=0A=
>+=0A=
>+PiperOrigin-RevId: 485439972=0A=
>+=0A=
>+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
>+[james.hilliard1@gmail.com: backport from upstream commit=0A=
>+081c2e4e3cf021efb2853a485a18b563e88f6117]=0A=
>+---=0A=
>+ tensorflow/lite/CMakeLists.txt | 7 ++++++-=0A=
>+ 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
>+=0A=
>+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.=
txt=0A=
>+index 9dfbb4b72f3..fd8b3faf1e2 100644=0A=
>+--- a/tensorflow/lite/CMakeLists.txt=0A=
>++++ b/tensorflow/lite/CMakeLists.txt=0A=
>+@@ -209,6 +209,9 @@ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tflite_with_=
xnnpack\\.cc$")=0A=
>+ # Exclude Flex related files.=0A=
>+ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*with_selected_ops\\.cc$")=0A=
>+ =0A=
>++# Exclude tensorflow_profiler_logger files.=0A=
>++list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tensorflow_profiler_logger\\.cc=
$")=0A=
>++=0A=
>+ if(_TFLITE_ENABLE_MMAP)=0A=
>+   list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation_disabled\\.cc=
$")=0A=
>+ else()=0A=
>+@@ -222,6 +225,7 @@ if(NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")=0A=
>+ endif()=0A=
>+ populate_tflite_source_vars("core" TFLITE_CORE_SRCS)=0A=
>+ populate_tflite_source_vars("core/api" TFLITE_CORE_API_SRCS)=0A=
>++populate_tflite_source_vars("core/c" TFLITE_CORE_C_SRCS)=0A=
>+ populate_tflite_source_vars("c" TFLITE_C_SRCS)=0A=
>+ populate_tflite_source_vars("delegates" TFLITE_DELEGATES_SRCS)=0A=
>+ if(TFLITE_ENABLE_GPU)=0A=
>+@@ -483,6 +487,7 @@ endif()=0A=
>+ # TFLite library=0A=
>+ set(_ALL_TFLITE_SRCS=0A=
>+   ${TFLITE_CORE_API_SRCS}=0A=
>++  ${TFLITE_CORE_C_SRCS}=0A=
>+   ${TFLITE_CORE_SRCS}=0A=
>+   ${TFLITE_C_SRCS}=0A=
>+   ${TFLITE_DELEGATES_FLEX_SRCS}=0A=
>+-- =0A=
>+2.34.1=0A=
>+=0A=
>diff --git a/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config=
-flag.patch b/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config=
-flag.patch=0A=
>new file mode 100644=0A=
>index 0000000000..99db29e354=0A=
>--- /dev/null=0A=
>+++ b/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.p=
atch=0A=
>@@ -0,0 +1,74 @@=0A=
>+From d8451a9048d09692994c40a6f9bc928e70ed79b5 Mon Sep 17 00:00:00 2001=0A=
>+From: James Hilliard <james.hilliard1@gmail.com>=0A=
>+Date: Mon, 28 Nov 2022 21:36:34 -0700=0A=
>+Subject: [PATCH] Add SYSTEM_FARMHASH cmake config flag=0A=
>+=0A=
>+Since farmhash does not install a cmake package we need to=0A=
>+search for the library and headers to use the provided=0A=
>+version.=0A=
>+=0A=
>+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
>+[james.hilliard1@gmail.com: backport from upstream commit=0A=
>+d8451a9048d09692994c40a6f9bc928e70ed79b5]=0A=
>+---=0A=
>+ tensorflow/lite/g3doc/guide/build_cmake.md    |  1 +=0A=
>+ .../tools/cmake/modules/Findfarmhash.cmake    | 30 +++++++++++++++----=
=0A=
>+ 2 files changed, 26 insertions(+), 5 deletions(-)=0A=
>+=0A=
>+diff --git a/tensorflow/lite/g3doc/guide/build_cmake.md b/tensorflow/lite=
/g3doc/guide/build_cmake.md=0A=
>+index 6950a365bb8..6de955e70b0 100644=0A=
>+--- a/tensorflow/lite/g3doc/guide/build_cmake.md=0A=
>++++ b/tensorflow/lite/g3doc/guide/build_cmake.md=0A=
>+@@ -81,6 +81,7 @@ variables to point to your library installations.=0A=
>+ ```sh=0A=
>+ cmake ../tensorflow_src/tensorflow/lite -DTFLITE_ENABLE_INSTALL=3DON \=
=0A=
>+   -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=3DON \=0A=
>++  -DSYSTEM_FARMHASH=3DON \=0A=
>+   -Dabsl_DIR=3D<install path>/lib/cmake/absl \=0A=
>+   -DEigen3_DIR=3D<install path>/share/eigen3/cmake \=0A=
>+   -DFlatbuffers_DIR=3D<install path>/lib/cmake/flatbuffers \=0A=
>+diff --git a/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake b/ten=
sorflow/lite/tools/cmake/modules/Findfarmhash.cmake=0A=
>+index 1b0dc28f624..97b43298f13 100644=0A=
>+--- a/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake=0A=
>++++ b/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake=0A=
>+@@ -13,12 +13,32 @@=0A=
>+ # See the License for the specific language governing permissions and=0A=
>+ # limitations under the License.=0A=
>+ =0A=
>+-# tensorflow-lite uses find_package for this package, so override the sy=
stem=0A=
>+-# installation and build from source instead.=0A=
>+-include(farmhash)=0A=
>+-if(farmhash_POPULATED)=0A=
>++# tensorflow-lite uses find_package for this package, so build from=0A=
>++# source if the system version is not enabled.=0A=
>++=0A=
>++if(SYSTEM_FARMHASH)=0A=
>++  include(FindPackageHandleStandardArgs)=0A=
>++  find_path(FARMHASH_ROOT_DIR NAMES include/farmhash.h)=0A=
>++  find_library(FARMHASH_LIB NAMES farmhash PATHS ${FARMHASH_ROOT_DIR}/li=
b ${FARMHASH_LIB_PATH})=0A=
>++  find_path(FARMHASH_INCLUDE_DIRS NAMES farmhash.h PATHS ${FARMHASH_ROOT=
_DIR}/include)=0A=
>++  find_package_handle_standard_args(farmhash DEFAULT_MSG FARMHASH_LIB FA=
RMHASH_INCLUDE_DIRS)=0A=
>++endif()=0A=
>++=0A=
>++if(farmhash_FOUND)=0A=
>++  add_library(farmhash SHARED IMPORTED GLOBAL)=0A=
>++  set_target_properties(farmhash PROPERTIES=0A=
>++    IMPORTED_LOCATION ${FARMHASH_LIB}=0A=
>++    INTERFACE_INCLUDE_DIRECTORIES ${FARMHASH_INCLUDE_DIRS}=0A=
>++  )=0A=
>++else()=0A=
>++  include(farmhash)=0A=
>++  if(farmhash_POPULATED)=0A=
>++    get_target_property(FARMHASH_INCLUDE_DIRS farmhash INTERFACE_DIRECTO=
RIES)=0A=
>++  endif()=0A=
>++endif()=0A=
>++=0A=
>++if(farmhash_FOUND OR farmhash_POPULATED)=0A=
>+   set(FARMHASH_FOUND TRUE)=0A=
>+-  get_target_property(FARMHASH_INCLUDE_DIRS farmhash INTERFACE_DIRECTORI=
ES)=0A=
>+   add_library(farmhash::farmhash ALIAS farmhash)=0A=
>+   set(FARMHASH_LIBRARIES farmhash::farmhash)=0A=
>+ endif()=0A=
>+-- =0A=
>+2.34.1=0A=
>+=0A=
>diff --git a/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.p=
atch b/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch=0A=
>new file mode 100644=0A=
>index 0000000000..1d511ca441=0A=
>--- /dev/null=0A=
>+++ b/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch=0A=
>@@ -0,0 +1,51 @@=0A=
>+From d8f98dd9f2b437cca5954b38cb48d9c21733f67d Mon Sep 17 00:00:00 2001=0A=
>+From: James Hilliard <james.hilliard1@gmail.com>=0A=
>+Date: Thu, 24 Nov 2022 14:29:06 -0700=0A=
>+Subject: [PATCH] Fix FindFlatBuffers cmake file=0A=
>+=0A=
>+Capitalization needs to match for system cmake override to work:=0A=
>+https://github.com/google/flatbuffers/blob/v22.11.23/CMake/FindFlatBuffer=
s.cmake=0A=
>+=0A=
>+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
>+[james.hilliard1@gmail.com: backport from upstream commit=0A=
>+d8f98dd9f2b437cca5954b38cb48d9c21733f67d]=0A=
>+---=0A=
>+ tensorflow/lite/CMakeLists.txt                                  | 2 +-=
=0A=
>+ tensorflow/lite/g3doc/guide/build_cmake.md                      | 2 +-=
=0A=
>+ .../modules/{FindFlatbuffers.cmake =3D> FindFlatBuffers.cmake}    | 0=0A=
>+ 3 files changed, 2 insertions(+), 2 deletions(-)=0A=
>+ rename tensorflow/lite/tools/cmake/modules/{FindFlatbuffers.cmake =3D> F=
indFlatBuffers.cmake} (100%)=0A=
>+=0A=
>+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.=
txt=0A=
>+index f9c30d6a046..c2ee9edfb61 100644=0A=
>+--- a/tensorflow/lite/CMakeLists.txt=0A=
>++++ b/tensorflow/lite/CMakeLists.txt=0A=
>+@@ -143,7 +143,7 @@ find_package(absl REQUIRED)=0A=
>+ find_package(Eigen3 REQUIRED)=0A=
>+ find_package(farmhash REQUIRED)=0A=
>+ find_package(fft2d REQUIRED)=0A=
>+-find_package(Flatbuffers REQUIRED)=0A=
>++find_package(FlatBuffers REQUIRED)=0A=
>+ find_package(gemmlowp REQUIRED)=0A=
>+ find_package(NEON_2_SSE REQUIRED)=0A=
>+ find_package(cpuinfo REQUIRED)  #CPUINFO is used by XNNPACK and RUY libr=
ary=0A=
>+diff --git a/tensorflow/lite/g3doc/guide/build_cmake.md b/tensorflow/lite=
/g3doc/guide/build_cmake.md=0A=
>+index 6950a365bb8..9cb7ebac326 100644=0A=
>+--- a/tensorflow/lite/g3doc/guide/build_cmake.md=0A=
>++++ b/tensorflow/lite/g3doc/guide/build_cmake.md=0A=
>+@@ -83,7 +83,7 @@ cmake ../tensorflow_src/tensorflow/lite -DTFLITE_ENABLE=
_INSTALL=3DON \=0A=
>+   -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=3DON \=0A=
>+   -Dabsl_DIR=3D<install path>/lib/cmake/absl \=0A=
>+   -DEigen3_DIR=3D<install path>/share/eigen3/cmake \=0A=
>+-  -DFlatbuffers_DIR=3D<install path>/lib/cmake/flatbuffers \=0A=
>++  -DFlatBuffers_DIR=3D<install path>/lib/cmake/flatbuffers \=0A=
>+   -DNEON_2_SSE_DIR=3D<install path>/lib/cmake/NEON_2_SSE \=0A=
>+   -Dcpuinfo_DIR=3D<install path>/share/cpuinfo \=0A=
>+   -Druy_DIR=3D<install path>/lib/cmake/ruy=0A=
>+diff --git a/tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake b/=
tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake=0A=
>+similarity index 100%=0A=
>+rename from tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake=0A=
>+rename to tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake=0A=
>+-- =0A=
>+2.34.1=0A=
>+=0A=
>diff --git a/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-again=
st-gemmlowp.patch b/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite=
-against-gemmlowp.patch=0A=
>new file mode 100644=0A=
>index 0000000000..d9ad78ef9e=0A=
>--- /dev/null=0A=
>+++ b/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemm=
lowp.patch=0A=
>@@ -0,0 +1,32 @@=0A=
>+From fb584589f707853d85a081c99b1b82598c2631c1 Mon Sep 17 00:00:00 2001=0A=
>+From: James Hilliard <james.hilliard1@gmail.com>=0A=
>+Date: Thu, 24 Nov 2022 15:10:27 -0700=0A=
>+Subject: [PATCH] Don't link tensorflow-lite against gemmlowp=0A=
>+=0A=
>+We can't link against gemmlowp as it is a header only library.=0A=
>+=0A=
>+Fixes:=0A=
>+/bin/ld: cannot find -lgemmlowp: No such file or directory=0A=
>+=0A=
>+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
>+[james.hilliard1@gmail.com: backport from upstream commit=0A=
>+fb584589f707853d85a081c99b1b82598c2631c1]=0A=
>+---=0A=
>+ tensorflow/lite/CMakeLists.txt | 1 -=0A=
>+ 1 file changed, 1 deletion(-)=0A=
>+=0A=
>+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.=
txt=0A=
>+index f9c30d6a046..3fe5ed15605 100644=0A=
>+--- a/tensorflow/lite/CMakeLists.txt=0A=
>++++ b/tensorflow/lite/CMakeLists.txt=0A=
>+@@ -560,7 +560,6 @@ target_link_libraries(tensorflow-lite=0A=
>+     farmhash=0A=
>+     fft2d_fftsg2d=0A=
>+     flatbuffers::flatbuffers=0A=
>+-    gemmlowp=0A=
>+     ruy::ruy=0A=
>+     pthreadpool=0A=
>+     ${CMAKE_DL_LIBS}=0A=
>+-- =0A=
>+2.34.1=0A=
>+=0A=
>diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/C=
onfig.in=0A=
>new file mode 100644=0A=
>index 0000000000..8685ec0c71=0A=
>--- /dev/null=0A=
>+++ b/package/tensorflow-lite/Config.in=0A=
>@@ -0,0 +1,36 @@=0A=
>+config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS=0A=
>+       bool=0A=
>+       default y if BR2_aarch64=0A=
>+       default y if BR2_arm=0A=
>+       default y if BR2_i386=0A=
>+       default y if BR2_x86_64=0A=
>+       depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS=0A=
>+=0A=
>+config BR2_PACKAGE_TENSORFLOW_LITE=0A=
>+       bool "tensorflow-lite"=0A=
>+       depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS=0A=
>+       depends on BR2_INSTALL_LIBSTDCPP=0A=
>+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17=0A=
>+       depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo=0A=
>+       depends on BR2_TOOLCHAIN_USES_GLIBC=0A=
>+       depends on BR2_SHARED_LIBS=0A=
>+       select BR2_PACKAGE_CPUINFO=0A=
>+       select BR2_PACKAGE_EIGEN=0A=
>+       select BR2_PACKAGE_FARMHASH=0A=
>+       select BR2_PACKAGE_FFT2D=0A=
>+       select BR2_PACKAGE_FLATBUFFERS=0A=
>+       select BR2_PACKAGE_GEMMLOWP=0A=
>+       select BR2_PACKAGE_LIBABSEIL_CPP=0A=
>+       select BR2_PACKAGE_NEON_2_SSE=0A=
>+       select BR2_PACKAGE_RUY if BR2_PACKAGE_RUY_ARCH_SUPPORTS=0A=
>+       select BR2_PACKAGE_XNNPACK if BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS=0A=
>+       help=0A=
>+         Tensorflow Lite dynamic library and headers: Inference engine=0A=
>+         to run previously trained machine learning models.=0A=
>+=0A=
>+comment "tensorflow-lite needs a toolchain w/ glibc, C++17, threads"=0A=
>+       depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || =
\=0A=
>+                       !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_HA=
S_THREADS=0A=
>+=0A=
>+comment "tensorflow-lite needs a toolchain w/ shared libraries"=0A=
>+       depends on !BR2_SHARED_LIBS=0A=
>diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/tensor=
flow-lite/tensorflow-lite.hash=0A=
>new file mode 100644=0A=
>index 0000000000..7d9035707b=0A=
>--- /dev/null=0A=
>+++ b/package/tensorflow-lite/tensorflow-lite.hash=0A=
>@@ -0,0 +1,4 @@=0A=
>+# Locally calculated=0A=
>+sha256  99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc92dac48 =
 tensorflow-lite-2.11.0.tar.gz=0A=
>+# License files, locally calculated=0A=
>+sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1aec65 =
 LICENSE=0A=
>diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorfl=
ow-lite/tensorflow-lite.mk=0A=
>new file mode 100644=0A=
>index 0000000000..433eff3242=0A=
>--- /dev/null=0A=
>+++ b/package/tensorflow-lite/tensorflow-lite.mk=0A=
>@@ -0,0 +1,59 @@=0A=
>+#########################################################################=
#######=0A=
>+#=0A=
>+# tensorflow-lite=0A=
>+#=0A=
>+#########################################################################=
#######=0A=
>+=0A=
>+TENSORFLOW_LITE_VERSION =3D 2.11.0=0A=
>+TENSORFLOW_LITE_SITE =3D  $(call github,tensorflow,tensorflow,v$(TENSORFL=
OW_LITE_VERSION))=0A=
>+TENSORFLOW_LITE_INSTALL_STAGING =3D YES=0A=
>+TENSORFLOW_LITE_LICENSE =3D Apache-2.0=0A=
>+TENSORFLOW_LITE_LICENSE_FILES =3D LICENSE=0A=
>+TENSORFLOW_LITE_SUBDIR =3D tensorflow/lite=0A=
>+TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD =3D NO=0A=
>+TENSORFLOW_LITE_DEPENDENCIES +=3D \=0A=
>+       host-pkgconf \=0A=
>+       host-flatbuffers \=0A=
>+       cpuinfo \=0A=
>+       eigen \=0A=
>+       farmhash \=0A=
>+       fft2d \=0A=
>+       flatbuffers \=0A=
>+       gemmlowp \=0A=
>+       libabseil-cpp \=0A=
>+       neon-2-sse=0A=
>+=0A=
>+TENSORFLOW_LITE_CONF_OPTS =3D \=0A=
>+       -Dabsl_DIR=3D$(STAGING_DIR)/usr/lib/cmake/absl \=0A=
>+       -DBUILD_SHARED_LIBS=3DON \=0A=
>+       -DCMAKE_CXX_FLAGS=3D"$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/inclu=
de/gemmlowp" \=0A=
>+       -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=3DON \=0A=
>+       -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \=0A=
>+       -DEigen3_DIR=3D$(STAGING_DIR)/usr/share/eigen3/cmake \=0A=
>+       -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \=0A=
>+       -DFETCHCONTENT_QUIET=3DOFF \=0A=
>+       -DFFT2D_SOURCE_DIR=3D$(STAGING_DIR)/usr/include/fft2d \=0A=
>+       -DFlatBuffers_DIR=3D$(STAGING_DIR)/usr/lib/cmake/flatbuffers \=0A=
>+       -DNEON_2_SSE_DIR=3D$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \=0A=
>+       -DSYSTEM_FARMHASH=3DON \=0A=
>+       -DTFLITE_ENABLE_EXTERNAL_DELEGATE=3DON \=0A=
>+       -DTFLITE_ENABLE_GPU=3DOFF \=0A=
>+       -DTFLITE_ENABLE_INSTALL=3DON \=0A=
>+       -DTFLITE_ENABLE_MMAP=3DON \=0A=
>+       -DTFLITE_ENABLE_NNAPI=3DOFF=0A=
>+=0A=
>+ifeq ($(BR2_PACKAGE_RUY),y)=0A=
>+TENSORFLOW_LITE_DEPENDENCIES +=3D ruy=0A=
>+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_RUY=3DON=0A=
>+else=0A=
>+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_RUY=3DOFF=0A=
>+endif=0A=
>+=0A=
>+ifeq ($(BR2_PACKAGE_XNNPACK),y)=0A=
>+TENSORFLOW_LITE_DEPENDENCIES +=3D xnnpack=0A=
>+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_XNNPACK=3DON -Dxnnpack_POP=
ULATED=3DON=0A=
>+else=0A=
>+TENSORFLOW_LITE_CONF_OPTS +=3D -DTFLITE_ENABLE_XNNPACK=3DOFF=0A=
>+endif=0A=
>+=0A=
>+$(eval $(cmake-package))=0A=
>-- =0A=
>2.34.1=

------0E471D72BA3B3A3E6C4B4E6AFDC36FA6
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
BTEPFw0yMzAzMTYxNDQzMzdaMC8GCSqGSIb3DQEJBDEiBCBZc9DAjrjXgBAGFaKL
2BudnQqJXCDVj5gKAO0eCmj/KTB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYBDs1ybSpnZNALbPGqjo9AQ8DuE31Er/c1k1ROoAbGH
c78rrEzhMCTVon1yi8lKSMyLb3YncWCe02YlyymQH9wj8r+u2hQvFo9PL9Bv7fNt
WwMKn4dWVomAPtDn2K6NPatHw02PHPaLj38lzBSjtaTwsxJu5nrJDae+fqCEx0rH
XQY3IGCbyJ8uGHNHjI0bFhYN9dx5igakrwy4HJ0O17V5UKR+k5pMXir409N0NPZf
3IaglTmOu5a3+d0Rfe0tEaGwQr+ZrhC7/g5yFzMA/lkvSAQI5+SrkZHr6sm3XPTt
21z4ijiPZqrwgWg+ECIq8fKP1UZ+baeNTVyhsKZLz7sv5/ufdHEml5VFwH5vDhzv
Vz+kI6JKVTOQxZetc/p/4jNwKyyDzoh51JnZtpGh7ADPAh3VZeT4RS9XtTG1ZLIE
l9AbvcsnC118XFjKHVAdnp/zRZSbvF55oNXS3QSYLqmIJRI4XCvrinRprQkDP8Lf
LCcpVD8gDoRHLaKcMdzDgVs=

------0E471D72BA3B3A3E6C4B4E6AFDC36FA6--



--===============7551659042461471845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7551659042461471845==--



