Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D43C19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 05:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20F8340BF4;
	Thu, 11 Aug 2022 05:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20F8340BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UQG8vquXg48; Thu, 11 Aug 2022 05:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A28E4014B;
	Thu, 11 Aug 2022 05:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A28E4014B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14D0E1BF94B
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 05:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0247417CB
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 05:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0247417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQFJRuTjY48Z for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 05:51:02 +0000 (UTC)
X-Greylist: delayed 00:05:58 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF0341758
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AF0341758
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 05:51:02 +0000 (UTC)
Received: from mail-db3eur04lp2053.outbound.protection.outlook.com
 ([104.47.12.53]:11271 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <Stefan.Hager@ginzinger.com>)
 id 1oM0zx-00058B-2P; Thu, 11 Aug 2022 07:44:50 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000, 
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SINGLE_URI_IN_BODY 0.000000, TO_IN_SUBJECT 0.500000,
 URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_NONE 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_CV_FAIL 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000,
 __CP_URI_IN_BODY 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FRAUD_BODY_WEBMAIL 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FRAUD_WEBMAIL 0.000000, __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000,
 __HAS_FROM 0.000000, __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000,
 __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __HTTPS_URI 0.000000, __IN_REP_TO 0.000000,
 __LINES_OF_YELLING 0.000000, __MAIL_CHAIN 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __MULTIPLE_RCPTS_TO_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SINGLE_URI_TEXT 0.000000,
 __SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
 __TO_IN_SUBJECT2 0.000000, __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000,
 __URI_NO_WWW 0.000000, __URI_NS 0.000000, __URI_WITH_PATH 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 10%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2022.8.11.50918
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=YMSLvs/BpWE6qfbrStkh80pWVWgxhR6uQmNFH73MRdvHRhCRiXM8voTCdssqrJYrs+I7V6MEuv6o/UCFA8aNtA86+Mxk7jAjpaht3lccYI51aWxG0Zqx+dWP9/J0q2R25AvxxcbX6OjZVD1Usnw7ziEPg/K6V2K/C9JPqtPKCwrOW7dlSjytNDvIHlwrv8FFubBsTd5zSobZi9NMzctNftmGJGIdjFmGnb0P/kSJ+iNCut1NF6a4DCCHQFQXnBPIpBscXG+4qHpJ6EPCMUF1gBMKSdWkEo7Ihgu7v07ASiRvfLyYvdgzYY/yecMXWgfKBEfRxeSWB26T43/Nrc+S2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLUjnIBmrWFuuI3qbLnp52kk1ZCSsHN92iBXCB6Lrak=;
 b=GyAriKuAOZxshrztkdRQ5m0Oskwl58cCZrLEZfizkyC/sSvm7ybOFmTs6yr+mFiuSF+n1JD9dUA9kyqxUC4DS4ZAnXwBTdcA6+h+VmyZW4RmOmN4GsUdwc5fbYrK3CgA+OzLTRPXU2FOsCrH3MYFi3bVj2dSPu5OVQahSMiG1tJryb05tOhDv4BSzMKwooJtt9Aq+0DJWhWaj8eiEPztFv7HQlvGORBRXlTIYO7+z4rP+BRJtpCSt9CvRL7f25FQqPUrhRW3GGJg8FX5+05KfGa5Cy4F4igNeWp5obbgYOT0YsPOgfQ8D23j9kMbPasx/9Ppm49+9IgsmBEvF7QYlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=openpixelsystems.org
 smtp.mailfrom=ginzinger.com; dmarc=bestguesspass action=none
 header.from=ginzinger.com; dkim=none (message not signed); arc=fail (48)
Received: from PR0P264CA0127.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::19)
 by DB9PR06MB7371.eurprd06.prod.outlook.com (2603:10a6:10:257::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 11 Aug
 2022 05:44:47 +0000
Received: from VI1EUR05FT061.eop-eur05.prod.protection.outlook.com
 (2603:10a6:100:1a:cafe::c8) by PR0P264CA0127.outlook.office365.com
 (2603:10a6:100:1a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Thu, 11 Aug 2022 05:44:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 VI1EUR05FT061.mail.protection.outlook.com (10.233.242.254) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 05:44:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.52) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 11 Aug 2022 05:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/B3Tkay4uFx6wcHu9auJ9duevV0hlZLFVUlpi3QHHN10Py4H2hTtKc2oRFGXVlfaWOb99LhxuP+a8ofFn54qplkvo6j4jb+DXR2mkwq23kokU7ys+aljyM4oYk8jmft+Mb5SQBPcl5OkknOtRFsTivwgjZBjOEVH2DymhQP1keG1hChuszNzujq80WMiKVbkcYxt6D0vrsQk1Q/myDRz9yii3/ndyfcyKkQL8BXk/eKxQhRdZp7vgjOE7M+KRG39aMj+MJKUgI5K9CKV9mKWuSFTf56YRWvn9zaW1C+LWQ78i2+4eDmqfxhOrf5eBzCUSeIafvn040ErSAKlMUTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLUjnIBmrWFuuI3qbLnp52kk1ZCSsHN92iBXCB6Lrak=;
 b=RdLjFdvzWYyobR1EffnOksWpk/WPD/L3ASo+m3ep6bmyxd3aWpZ3syXaoVI7+G2vY3KLXWGBC4zHAQELJgqH0tQjfJtjz2c+Hus7eFLgdf9aVEPLCCgApd/z66TTHiaZqzFTATDv9Lv2tZonYK3a/haAxBkSqJWWCo8pYR0vTbCiYkUJtdKilscv/aMx/oeWsaXzxlRuO/8zw2HzH4cgXyPH5qae6RxRr9+f/yNXgn8Zlfzp0vwUVIRQWuGVXLD6POO7Rd8yKJJPAMMJ0bhZUDgQfTFS8ewX5qNTaJ/p3LNKwvQbj6aHN/ffNGsWWEXWN95KlYWZaiRW0n9qFNmbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by VI1PR0602MB2816.eurprd06.prod.outlook.com (2603:10a6:800:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 05:44:43 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::a1c6:c2c5:5541:e6ff]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::a1c6:c2c5:5541:e6ff%6]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 05:44:43 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Index: AQHYrNbcU4vrjMAyEkCGMHOTXbHtNq2pLbV5
Date: Thu, 11 Aug 2022 05:44:43 +0000
Message-ID: <AM5PR06MB315354DB88826A507A36BAE584649@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
 <20220810163211.3694861-1-bram.vlerick@openpixelsystems.org>
In-Reply-To: <20220810163211.3694861-1-bram.vlerick@openpixelsystems.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
X-MS-Office365-Filtering-Correlation-Id: f7e3578b-4333-4f15-b180-08da7b5c99bd
x-ms-traffictypediagnostic: VI1PR0602MB2816:EE_|VI1EUR05FT061:EE_|DB9PR06MB7371:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: TMiRAY5vX0yZykOcC3NVPOfwPNCbUupuPKcWvnX2rtAGFxK938ahmCbO9titYcu9smA1wXxdKgWtd74FavqUYKdHF4vDgwtcbV2Gm4KP5IrZZii1CIHevMZjSUNfx5BLZdmZpAcdLiHaiqWZjF0Dv5T7FFVpidT/LImsMDbQJmYOcZFd6YbcQXwfMl4zT+XJUMgPqrTmo71Lx9fSWIofTFf5XR5FnhmsM3afEpFfqUHWFfgOKsmumV8M8W0AwXuJALfz1cRw0Hzrm7yocM7ugKCceK5IyzE908aHUT23XlSy+xZaDgkc12/MTZGkTvmY1ZLShqjbNNdInchA8pu6LR15WGEIIab6+Fi7hEgmEzIWJ3y2amN/umUC9k01P7eI/Gk0UrnKOP15TtswNdI3GeM94IEI2fEekZlvoHaLkjFeI8RTAFm8TbEon1Ssm2EJ7gMtXcaN9j2yTh6KzLL1goBtiwGd6gU1rkVmteZ1lNiQ3tq2Kn1SeTmMm1QYuOMQkAMQH0zB7YkRFPPcYcL/5wMjDpj2QUuwacb9ibc7VlWXXG3whuliWTpu5HqHO9L12YHAaeoBSuRifGvz4AgDEye76nfxa9QEiBqIohVseGvK6AnnLC0+rTpmVNuOEA9oK6oP5GujEveTcT11ISRJCxasHy49y/BZnPzZw46aejqEyd/75JxnhvKxL2y3iw/Nt/XjhWnoU3BaWEcGPvYDFygR4Ix7OLUj5inJul/hhvsHCSGwZPDrtYgYBvDNHuGtoGsETSsfOwmGLoY86re7MXbc3XlPCP3ewe3ujCCLX08HA0nH8HM5/W5AsXazcagWDv+Gakn0u3TXm6E9PVkmzw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39840400004)(136003)(396003)(366004)(53546011)(186003)(54906003)(6506007)(5660300002)(26005)(9686003)(8936002)(33656002)(966005)(41300700001)(2906002)(71200400001)(7696005)(83380400001)(38100700002)(122000001)(55016003)(38070700005)(478600001)(86362001)(52536014)(4326008)(76116006)(316002)(110136005)(64756008)(91956017)(66476007)(66446008)(66946007)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB2816
X-CodeTwo-MessageID: bc7fb6fa-893c-4c41-b933-e252186a195e.20220811054446@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT061.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e4def9a6-ebee-417e-3c71-08da7b5c9747
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vd9rvHE7al8ONpc+CCNW3I2TdHfQ0IGulnCnpF68f+Ee3rIfHRMbFMUc5EnEbBhTlwqGp6k7p3wWhBEMsUu2vlnGfFtdJp21F8OR6JhC1xV+PMmMdEj9KDulRHtqn7gmB1/MmYGAizDqMoWRNCOSHNa4T266Xti6re3lKuFYbS+XewXt5xBYwG/nWB/k22Jxd0G7fY51iF1hHWOEthj3CM7Ov4rLjbS+VYydI9PBJw5/wwj7yMKfKVyA4XIZDzGFdYc4GBeN1iuaRiMf9jIc7qnDKiF0FYYOS3RI9lxhh5zfJcJC9Y18eAcPs43R912/57lgrp55wshqmRePP5x7FfE5s9bmRiYBreCXIhWuBxPTyDFmgWnGtEl3qPXHoI3ez9jNJ/vup996CkPBgto5vStVHnpsOsjRGn0/tjR/oAEgZCa6OjNq7K14tC7tw4O9R6RYChThBGJDOiTOniEoube8bqY2UbRP2D8EQSSW+//lR3OnZb3Bk6FP3dXCBWOwHQOBwMIrV42dpo2He7bjFZNVYB/0na5axRPjClmiYWnvNR+IdjWU0WcgcGCvYm1a5ObcbRlEbvxQz5LOtUg8BLNzfOm3F7s/oeV+guPxzD8p3rWzbGARzFB1LhopOp0zsIjDMXGTJF+tMxJN72wFGzW8fQKSCvikzysHhTwtmHlWYyWbhtea8CKeSdy7VoPrMtuLMMtsPjknFdUHzpgakGpJnnZEZcWLTd9PEEdSbAnZbK/U77lWBJag7Y53VH0ZxSUQA2MYoXi+b3EwxULE5NoH8FeFpkbE+Lu/BF30PKQw5HWaADdHbJXg36UYw0vb
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39840400004)(346002)(36840700001)(46966006)(40480700001)(82310400005)(86362001)(5660300002)(110136005)(52536014)(8936002)(7636003)(54906003)(356005)(7596003)(70586007)(70206006)(8676002)(4326008)(316002)(55016003)(9686003)(36860700001)(26005)(83380400001)(336012)(47076005)(186003)(53546011)(966005)(478600001)(6506007)(7696005)(41300700001)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 05:44:47.1650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e3578b-4333-4f15-b180-08da7b5c99bd
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT061.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7371
Subject: Re: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.15
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

What about the license file SCR.txt in that package?
This file describes the type of license grant: specially if section 2.3 (re=
distribution) of the EULA/COPYING can be applied.

Imho SCR.txt should also be added to firmware-imx.mk  as well as the hashes=
 to the corresponding file.

Best regards
Stefan Hager

From: buildroot <buildroot-bounces@buildroot.org> on behalf of Bram Vlerick=
 <bram.vlerick@openpixelsystems.org>
Sent: Wednesday, August 10, 2022 18:32
To: buildroot@buildroot.org <buildroot@buildroot.org>
Cc: Bram Vlerick <bram.vlerick@openpixelsystems.org>; Refik Tuzakli <tuzakl=
i.refik@gmail.com>; Gary Bisson <bisson.gary@gmail.com>
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx: bum=
p version to 8.15 =

=A0
New version contains updated binaries which are part of the NXP
5.15.5-1.0.0 Yocto release.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
=A0package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
=A0package/freescale-imx/firmware-imx/firmware-imx.mk=A0=A0 | 2 +-
=A02 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package=
/freescale-imx/firmware-imx/firmware-imx.hash
index 98a0e73048..c86e4244ef 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
=A0# Locally calculated
-sha256=A0 6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef=
=A0 firmware-imx-8.12.bin
-sha256=A0 ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee=
=A0 COPYING
-sha256=A0 50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c=
=A0 EULA
+sha256=A0 937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3=
=A0 firmware-imx-8.15.bin
+sha256=A0 35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31=
=A0 COPYING
+sha256=A0 30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4=
=A0 EULA
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/f=
reescale-imx/firmware-imx/firmware-imx.mk
index 211a43c4ca..2d1818334a 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
=A0#
=A0########################################################################=
########
=A0
-FIRMWARE_IMX_VERSION =3D 8.12
+FIRMWARE_IMX_VERSION =3D 8.15
=A0FIRMWARE_IMX_SITE =3D $(FREESCALE_IMX_SITE)
=A0FIRMWARE_IMX_SOURCE =3D firmware-imx-$(FIRMWARE_IMX_VERSION).bin
=A0
-- =

2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
