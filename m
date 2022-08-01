Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C8EC19F2B
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 14:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 030D960B7D;
	Mon,  1 Aug 2022 14:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 030D960B7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qK_SHn1mawuc; Mon,  1 Aug 2022 14:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114D360B3B;
	Mon,  1 Aug 2022 14:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114D360B3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77D951BF2A9
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 14:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F4E0410C2
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 14:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F4E0410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mt7mNO0eFaiA for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 14:49:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE3CE410B9
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE3CE410B9
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 14:49:24 +0000 (UTC)
Received: from mail-vi1eur04lp2053.outbound.protection.outlook.com
 ([104.47.14.53]:5271 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <Henri.Roosen@ginzinger.com>)
 id 1oIWjM-00074y-19; Mon, 01 Aug 2022 16:49:16 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000, 
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_BASE64 0.000000, HDR_COMMON_LOWERCASE 0.000000, HTML_00_01 0.050000,
 HTML_00_10 0.050000, IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
 MSG_THREAD 0.000000, NO_CTA_FOUND 0.000000, NO_CTA_URI_FOUND 0.000000,
 NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000,
 __ARCAUTH_DKIM_NONE 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_CV_FAIL 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FORWARDED_MSG 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
 __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
 __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HIGHBITS 0.000000, __INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000,
 __LINES_OF_YELLING 0.000000, __MAIL_CHAIN 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_TO_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __PHISH_SPEAR_SUBJ_ALERT 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NO_NAME 0.000000, __URI_NO_MAILTO 0.000000, __USER_AGENT 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 7%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2022.8.1.135718
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=jz9Nfnl0DeTl3M80LTOHHnFvehn3ILfCNti9jmJ5+4DTRfLZHaZjPnPBdlhhA+tXV1lskGfnaWHpz0jAex+LJhAcycELLIijqghwFX9uH/4mICPsqkjrr8snE1BNgP6S0sD6faQHHAOpOcPmKDZvN+FIUHU+ej3xdheBRv354Wo0/QRdAV+D+CiacSMFwIRFY1Qn/LuJQlBKmFVeyjSRFGfEiy8JWVG93aW1W++epCJ+QZopKuTINtTGqfLuZnSZXTt/UndQIVz+pVbWvFJjnynpvZ50HULfb1Qn8P1zByQeJXJ/scDGgKoZoxDAt+3VkMRxMNQy8Az+H4Dy7yXJDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVzTRQEBhO3IkIQLIT9FkBUx2hu/J0WlSm31nVC34/U=;
 b=Clh1MWJ2wZeYvn69uF/bl/8+t/dfKjnHzCMdIUJVKcx6+oYBJ2zCs4odTR6Gf/mHyhQg3UfGX8A2VSJsahGUJeQpli1KtcsQtMaozDp47WK554RjinXambXVNjwhnEZXYzEoI8N5y7FrqiPuHu+TG8HlIoVdYYyWRAfUBZk0tgTslezw6T3Hnok5o8YgvOu8EdL4fP601Cadu3zWP/v1TyjY994a6QSHsXvnZ2nu6hwScZcjemdKiOFYt3aC2/lLExej1+a0tnKz4kt1bODDaxfv9fhnI+rsHeeJ65HOM5R3R2EEPVUSiH0Im71p8vXBeKV7TnZ/S/pA4KXwLgCvIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=free.fr smtp.mailfrom=ginzinger.com;
 dmarc=bestguesspass action=none header.from=ginzinger.com; dkim=none (message
 not signed); arc=fail (48)
Received: from DB6PR07CA0170.eurprd07.prod.outlook.com (2603:10a6:6:43::24) by
 PAXPR06MB8483.eurprd06.prod.outlook.com (2603:10a6:102:2b7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.15; Mon, 1 Aug 2022 14:49:14 +0000
Received: from DB8EUR05FT018.eop-eur05.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::e5) by DB6PR07CA0170.outlook.office365.com
 (2603:10a6:6:43::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.4 via Frontend
 Transport; Mon, 1 Aug 2022 14:49:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB8EUR05FT018.mail.protection.outlook.com (10.233.238.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Mon, 1 Aug 2022 14:49:13 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (104.47.5.59) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 01 Aug 2022 14:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvA4CroJvGvr1b9HDt4RS7IREyuCQlap4J31fD7kK+A5bRHaVxFcxEdEqluZIcswBXkU/14cmwUBvKs3t+SpzXg6Q6SQSHib3hxPNPflbqK5wkDhhES+bDkMqLiqLwCTjNv7ysbtrNdVSO+9AlbM5FR65+7vCaO8X7lippj1oidE92wLLp1vf1KMosjmuBFTxu2gif/HUJ8iTGjekCimyaXA45gKvfMqBC0bAsq8PAM1V7NQXDS+yWkJuH1gfaMi+2dsnVfvVIWCvvwJwIYt9SIZ2j1Df9cmr6rcqfZRJBsomDVMN2PXk5yCA4l4I+gGJJR7YTbYjtEE4hNZDoeovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVzTRQEBhO3IkIQLIT9FkBUx2hu/J0WlSm31nVC34/U=;
 b=e10UVT/6b/BmahU61oyhqQztE5v398TD8seYOna9ygBsL4Xdwn0fV3n9Z8EQiw5vL+ZC0481Cme38kGNVMUWdIjNwzf6CW5iKK4crwnKiTrhtnunzGSZoFnwle+pWijtAibXi/L851Dp7p9glMjSb3pT0QZOLlG4RDkn9dq3vDBY2k1PCjgEryxCDJPyVE3JHEWDosbWUq+ZpV+RGK2GlG40xN2FkWpdQAa+4uAGXSl2ByKDn0icfLqCv3s56GZhzJvoUZl7LJzeQQQe80Y4lg7PzTQIYCk/uKgq1XYETkHEAnvsyuXGy3aOitqpq16qcAoULsmrzz92dYqDoYeDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM9PR06MB8130.eurprd06.prod.outlook.com (2603:10a6:20b:3a0::20)
 by AM0PR06MB5330.eurprd06.prod.outlook.com (2603:10a6:208:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 14:49:09 +0000
Received: from AM9PR06MB8130.eurprd06.prod.outlook.com
 ([fe80::9d05:a177:10c7:7cfa]) by AM9PR06MB8130.eurprd06.prod.outlook.com
 ([fe80::9d05:a177:10c7:7cfa%9]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 14:49:09 +0000
From: Roosen Henri <Henri.Roosen@ginzinger.com>
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "quentin.schulz@theobroma-systems.com" <quentin.schulz@theobroma-systems.com>
Thread-Index: AQHYo5UWpQaUuDUFD0+DnJDpJMP2aa2W1jCAgAM6GQCAABRBAA==
Date: Mon, 1 Aug 2022 14:49:09 +0000
Message-ID: <57a89f2ad4d1ffe52344135368be359347d600ac.camel@ginzinger.com>
References: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
 <20220730121955.GS3168@scaer>
 <c25e9cda-9f84-6049-fc24-a8f442d8455e@theobroma-systems.com>
In-Reply-To: <c25e9cda-9f84-6049-fc24-a8f442d8455e@theobroma-systems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
X-MS-Office365-Filtering-Correlation-Id: ba1ff3bc-b5a0-4ce0-3dec-08da73cd0061
x-ms-traffictypediagnostic: AM0PR06MB5330:EE_|DB8EUR05FT018:EE_|PAXPR06MB8483:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P4yfZSk3L+/2nyvz7K9r6f/mQFeShWErh0vmK4GWyPEDX0SZFrHUVNoOKheQA+GTxjpPU8Ow70tQnp0QA2UwHnW0HvA4/k6t3jjnHrNwyhaJctjEra1I8vZxhviNc/2ITxLDDMuBcbIP6lkHJ+6g8cya7sWkDY/pAaOmLtdDc06JYIUr5oIp1SOlSEPvatAUfb1IVzX8sPHJC2/6+VLwIfTKQzQGII7OjAKDbtTJb2exy/udy764VwuPYzy9qOrk4X34VdWJyJ0PKptBqpwxqKlZpm35kfc7JFH8v6ZUAb4gxLVdWop94+uamZt+W4E6IX8dETEtBGOjxjEx9wWyFKfaHl64vS0XM2zqBrsZ5W+x+bCAoG3qMcw33ZTT4e87mECGB9zxdIobdxsWzCWE6D8RmUGEIuedr4AWRs+Ix0HuLgJ4xoQBIqKW5shn9BeUljyxGPhUY2TInsmM4qGVocBnrZwovzNPNYvKxK6jDv1qaLnNGOKbtee8yprTRQuk4hbqkX4v5EhLg+9fbwWMwscbDpusml5IPYRtZtGkN9loHzeRmhmKcLfwPbXeZ6sPM/4bezS8cBSb9rEcMR+glYjyYiHQFGz6jRpR19VbxQ0Fo0/t0ZfAPXTvNKs1O13Ff3vFc2ruMtaDZ91dDLv/r3bwGMDHWhmobPNABrlH01xJjzkkQDVhzWwroFziZv0A+9xNl/JGfmuzyDVIzsJ7nz8rWlqhhJ0q79wVfMSo7vg/Sq8ZFVBSzZ+9u2VWGh8ztP+p7zGnDqqCYCta7q8tv2pwoXcH/AsqFutOBGB/lxN6g0Ao/w3P+PE/4Wq/StE7QstyCONmYZFLf+eh2+sDtw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR06MB8130.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39840400004)(396003)(366004)(376002)(71200400001)(41300700001)(2906002)(6486002)(316002)(36756003)(110136005)(478600001)(66946007)(86362001)(91956017)(76116006)(2616005)(186003)(38100700002)(122000001)(38070700005)(6512007)(53546011)(6506007)(8936002)(4326008)(66556008)(64756008)(66476007)(8676002)(5660300002)(66446008)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5330
X-CodeTwo-MessageID: 2a9c52cd-ae0d-4b39-b791-65260d07b737.20220801144911@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT018.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7c85018d-1b4b-4044-a4a2-08da73ccfda7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sX2KDZ8NJl494jxfZIBS5FnDjPMokw3fGgfVL7LZ46PEzm6hWKDvqBmJ/+FkP/Ds4/Bt/Srnk+C5RglPRJWR4WQUXcwCWPbTWAKsB9N1YvvAqevwjDXWc6GD2TiLjUO0qWGhHBb0ainFZ54WawouWHqpaSCy/UrQLEctY96BVm8ikJryLs14NqobTi0r4Hv8gsR5ei8kowZtoe7HLi2b8AdWNpCUjvH4FaWDM+E45ywufGHhBOUROEWdgOOuPUHaE0xHpKpE2kUktY27QyzKwH+2ZtbMxFFhhfLdzB7tpRPY17X0Lvb2QNBYZTwmGA6IApyu9Q1H2W8154TWmvT+TVzEvMKUDZRxnVEgtrd6TKQh4/JQfmWeSwqzlMgJ28Aephz0KCMf7Tiued3K9fSkBYjeYW26VTZmhnJW94BAaSM8Su+W2hjET7BCFPKfdgjh0Q2s2DhCltv2ctyZz4X9hTAibubMdTg42K5lsLHTha1nf6GpxAaUw3w2gWT9EvAZLzF3qXrD90/s1olc4gvFkEDbw3BRxGQEIhqYYcuBLRKA822pj7VCPbexCjvtxzEKFVL1tLaMvGG3uuhL0bFCXfJn9TU74vLzx49u14Umg9ZPZpoW2dlzwSRNZE/MkrM9k4G5v1MZ3MGqo76c0xSmcXCnlmo89P6NdIO7Uuv/16pt7blMyei6eMyIMh6XvFyU4eTlUggdpcOGrkZ+qyCbmmRq+ZZ6F4UB91Ixv1luCVKr7OyxSvzXPNGPwZVtpGNURpiSHa5YCyzqAcVfOvT1j3yZEHSwP/2sPlElaWB6ScuMCvl+5cnYs1keGxiDG3EG
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230016)(4636009)(39840400004)(376002)(396003)(136003)(346002)(36840700001)(46966006)(36860700001)(2616005)(47076005)(336012)(186003)(7636003)(7596003)(8936002)(5660300002)(356005)(478600001)(26005)(6486002)(36756003)(6506007)(6512007)(41300700001)(53546011)(110136005)(316002)(82310400005)(8676002)(40480700001)(70586007)(4326008)(70206006)(86362001)(2906002)(41080700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 14:49:13.7271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1ff3bc-b5a0-4ce0-3dec-08da73cd0061
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT018.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8483
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: workaround make 4.3 issue for
 'printvars and 'show-vars'
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5645089347665593992=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============5645089347665593992==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----52DFCF07204B73B52E218C3821482448"

This is an S/MIME signed message

------52DFCF07204B73B52E218C3821482448
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <121FCF135D06D44099BE7EE097FBCF95@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

T24gTW9uLCAyMDIyLTA4LTAxIGF0IDE1OjM2ICswMjAwLCBRdWVudGluIFNjaHVseiB3cm90ZToN
Cj4gSGkgYWxsLA0KPiANCg0KSGkgUXVlbnRpbiwNCg0KPiBPbiA3LzMwLzIyIDE0OjE5LCBZYW5u
IEUuIE1PUklOIHdyb3RlOg0KPiA+IEhlbnJpLCBBbGwsDQo+ID4gDQo+ID4gT24gMjAyMi0wNy0y
OSAyMTo0OSArMDAwMCwgUm9vc2VuIEhlbnJpIHNwYWtlIHRodXNseToNCj4gPiA+IEV2ZW50IHRo
b3VnaCB0aGUgYnVnIHdpdGggbWFrZSA0LjMgaGFzIGJlZW4gcmVwb3J0ZWQgYW5kIGZpeGVkLA0K
PiA+ID4gdGhlcmUNCj4gPiA+IGhhcyBub3QgYmVlbiBhIHJlbGVhc2Ugb2YgbWFrZSB3aXRoIHRo
ZSBmaXggZm9yIGEgbG9uZyB0aW1lLCBzZWUNCj4gPiA+IFsxXS4NCj4gPiA+IA0KPiA+ID4gQXMg
dGhlIHJvb3QgY2F1c2Ugc2VlbXMgdGhlICdmaWx0ZXInIGNvbW1hbmQgY2Fubm90IGhhbmRsZSBs
YXJnZQ0KPiA+ID4gY2h1bmtzIG9mIGRhdGEsIGxpa2UgLlZBUklBQkxFUywgd2UgY2FuIHdvcmth
cm91bmQgdGhlIHByb2JsZW0gYnkNCj4gPiA+IHVzaW5nIGEgZm9yZWFjaCBjb21tYW5kIG92ZXIg
LlZBUklBQkxFUywgdGhlbiB1c2UgdGhlIGZpbHRlcg0KPiA+ID4gY29tbWFuZC4NCj4gPiA+IA0K
PiA+ID4gSXQgbWlnaHQgbm90IGJlIGxvZ2ljYWwgdG8gcHJvZ3JhbSBpdCB0aGF0IHdheSwgYnV0
IGF0IGxlYXN0IHRoZQ0KPiA+ID4gZnVuY3Rpb25hbGl0eSBpcyBub3cgdXNhYmxlLg0KPiA+IA0K
PiA+IEF3ZXNvbWUhIEp1c3QgYXdlc29tZSEg8J+RjQ0KPiA+IA0KPiA+IEkganVzdCBhZGRlZCBh
IHNtYWxsIGNvbW1lbnQgaW4gdGhlIE1ha2VmaWxlIHRvIGV4cGxhaW4gdGhhdCwgYW5kDQo+ID4g
cmVmZXJlbmNlIHRoZSBidWcuDQo+ID4gDQo+IA0KPiBKdXN0IGEgaGVhZHMtdXAgdGhhdCBgbWFr
ZSBwcmludHZhcnNgIGlzIGJyb2tlbiAoSSd2ZSBzZW50IGEgcGF0Y2gNCj4gZm9yIA0KPiBpdCBq
dXN0IG5vdykgYW5kIGFsc28gdGhhdCBJIGdldCBhIHNlZ2ZhdWx0IGZvciBgbWFrZSBzaG93LXZh
cnNgDQo+IChgbWFrZSANCj4gc2hvdy12YXJzIFZBUlM9IkJVU1lCT1hfJSIgd29ya3MganVzdCBm
aW5lKS4NCg0KVGhhbmtzIGZvciB0aGUgaGVhZHMtdXAhIEkgY2FuIHJlcHJvZHVjZSB5b3VyIHRl
c3RzLXJlc3VsdHMuDQoNCkkgbWFkZSB0aGUgd29ya2Fyb3VuZCB0byBnZXQgdGhlICdtYWtlIHBr
Zy1zdGF0cycgZnVuY3Rpb25hbGl0eSB1cCBhbmQNCnJ1bm5pbmcgYWdhaW4gb24gcmVjZW50IHN5
c3RlbXMgd2l0aCBtYWtlIDQuMy4gU28gSSBkaWQgbXkgdGVzdGluZyBmb3INCidtYWtlIHByaW50
dmFycycgYW5kICdtYWtlIHNob3ctdmFycycgd2l0aCB0aGUgVkFSUyB2YXJpYWJsZSBzZXQgdG86
DQoNCiJWQVJTPSVfTElDRU5TRSAlX0xJQ0VOU0VfRklMRVMgJV9WRVJTSU9OICVfSUdOT1JFX0NW
RVMgJV9DUEVfSUQiDQoNClNvcnJ5IEkgbWlzc2VkIHRlc3RpbmcgdGhlIGVtcHR5IFZBUlMgKD1h
bGwpLg0KDQpXZSBtaWdodCByZXZlcnQgdGhlIHdvcmthcm91bmQgZm9yICdzaG93LXZhcnMnIGFu
ZCBpbnN0YWxsIHRoZSBtYWtlIDQuMw0KY2hlY2sgYWdhaW4uIEZvciAncHJpbnR2YXJzJyB3ZSBt
aWdodCBrZWVwIHRoZSB3b3JrYXJvdW5kLCBhcyB1bnRpbCBub3cNCm5vIHNlZ2ZhdWx0IGNvdWxk
IGJlIHJlcHJvZHVjZWQgYW5kIEkgdGhpbmsgdGhlICdwa2ctc3RhdHMnDQpmdW5jdGlvbmFsaXR5
IGlzIGEgbmljZSB0byBoYXZlLg0KDQpXaGF0IGRvIHlvdSB0aGluaz8NCg0KVGhhbmtzLA0KSGVu
cmkNCg0KPiANCj4gQ2hlZXJzLA0KPiBRdWVudGluDQoNCg==

------52DFCF07204B73B52E218C3821482448
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIfFQYJKoZIhvcNAQcCoIIfBjCCHwICAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgghwbMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkq
hkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqS
vysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEib
ivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFb
me/SoY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManR
y6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMC
AwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0G
A1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYD
VR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEA
QUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFu
SUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFT
vSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwp
Tf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn
2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZG
Xq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmd
WC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4
hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svq
w1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggXeMIIDxqADAgECAhAB
/W0w/KPKUagbvGQONQMtMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQGEwJVUzET
MBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNV
BAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJT
QSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xMDAyMDEwMDAwMDBaFw0zODAx
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
YwmAYUM2MA0GCSqGSIb3DQEBDAUAMG8xCzAJBgNVBAYTAlNFMRQwEgYDVQQKEwtB
ZGRUcnVzdCBBQjEmMCQGA1UECxMdQWRkVHJ1c3QgRXh0ZXJuYWwgVFRQIE5ldHdv
cmsxIjAgBgNVBAMTGUFkZFRydXN0IEV4dGVybmFsIENBIFJvb3QwHhcNMDAwNTMw
MTA0ODM4WhcNMjAwNTMwMTA0ODM4WjCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
Ck5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUg
VVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlm
aWNhdGlvbiBBdXRob3JpdHkwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
AQCAEmUXNg7D2wiz0KxXDXbtzSfTTK1Qg2HiqiBNCS1kCdzOiZ/MPans9s/B3PHT
sdZ7NygRK0faOca8Ohm0X6a9fZ2jY0K2dvKpOyuR+OJv0OwWIJAJPuLodMkYtJHU
YmTbf6MG8YgYapAiPLz+E/CHFHv25B+O1ORRxhFnRghRy4YUVD+8M/5+bJz/Fp0Y
vVGONaanZshyZ9shZrHUm3gDwFA66Mzw3LyeTP6vBZY1H1dat//O+T23LLb2VN3I
5xI6Ta5MirdcmrS3ID3KfyI0rn47aGYBROcBTkZTmzNg95S+UzeQc0PzMsNT79uq
/nROacdrjGCT3sTHDN/hMq7MkztReJVni+49Vv4M0GkPGw/zJSZrM233bkf6c0Pl
fg6lZrEpfDKEY1WJxA3Bk1QwGROs0303p+tdOmw1XNtB1xLaqUkL39iAigmTYo61
Zs8liM2EuLE/pDkP2QKe6xJMlXzzawWpXhaDzLhn4ugTncxbgtNMs+1b/97lc6wj
Oy0AvzVVdAlJ2ElYGn+SNuZRkg7zJn0cTRe8yexDJtC/QV9AqURE9JnnV4eeUB9X
VKg+/XRjL7FQZQnmWEIuQxpMtPAlR1n6BB6T1CZGSlCBst6+eLf8ZxXhyVeEHg9j
1uliutZfVS7qXMYoCAQlObgOK6nyTJccBz8NUvXt7y+CDwIDAQABo4H0MIHxMB8G
A1UdIwQYMBaAFK29mHo0tCb3+sQmVO8DveAky1QaMB0GA1UdDgQWBBRTeb9aqitK
z1SA4dibwJ3ysgNmyzAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAR
BgNVHSAECjAIMAYGBFUdIAAwRAYDVR0fBD0wOzA5oDegNYYzaHR0cDovL2NybC51
c2VydHJ1c3QuY29tL0FkZFRydXN0RXh0ZXJuYWxDQVJvb3QuY3JsMDUGCCsGAQUF
BwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTAN
BgkqhkiG9w0BAQwFAAOCAQEAk2X2N4OVD17Dghwf1nfnPIrAqgnw6Qsm8eDCanWh
x3nJuVJgyCkSDvCtA9YJxHbf5aaBladG2oJXqZWSxbaPAyJsM3fBezIXbgfOWhRB
OgUkG/YUBjuoJSQOu8wqdd25cEE/fNBjNiEHH0b/YKSR4We83h9+GRTJY2eR6mcH
a7SPi8BuQ33DoYBssh68U4V93JChpLwt70ZyVzUFv7tGu25tN5m2/yOSkcZuQPiP
KVbqX9VfFFOs8E9h6vcizKdWC+K4NB8m2XsZBWg/ujzUOAai0+aPDuO0cW1AQsWE
tECVK/RloEh59h2BY5adT3Xg+HzkjqnR8q2Ks4zHIc3C7zCCBSEwggQJoAMCAQIC
ED2+E2JWZiGtyoHfoUYVDP8wDQYJKoZIhvcNAQELBQAwgZYxCzAJBgNVBAYTAkdC
MRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQx
GDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMjEw
NjMwMDAwMDAwWhcNMjQwNjI5MjM1OTU5WjArMSkwJwYJKoZIhvcNAQkBFhpoZW5y
aS5yb29zZW5AZ2luemluZ2VyLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBANL/Z978HgGzFotp2copfygKPkPMIeAaPDmrNM5h22oYDYwNogn/KrGK
6BCuCTJON7JFwqKVqOfj+SR+wO8EtdMTIUNDK+vR2buRT83RrWqJu2joxXMfbJVP
CqefO+KNcQdQUh+nftgDbWi2wPAO6m3SEj21x/J8dqeoZ9qibqzyQEfrfhDPS2VC
uwFOeU5Eb37JFUsFkh3C+NY3lvwPBskJAWTxpVWCQjwex/pqbV9APotJTQGF2mOE
6+Ac6fZ6qOtk4w/bBzIm8QP8GExIjPWyh9LDxSqBevxiPMtmzt1KAGJqcOoHhom3
mwOJrQeePGny1QEYDppkeNUoaJ9BUKkCAwEAAaOCAdMwggHPMB8GA1UdIwQYMBaA
FAnA8vwL2pTbX/4r36iZQs/J4K0AMB0GA1UdDgQWBBTyB4IccnS0Ta1QpIZDoETK
UBSRrjAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggr
BgEFBQcDBAYIKwYBBQUHAwIwQAYDVR0gBDkwNzA1BgwrBgEEAbIxAQIBAQEwJTAj
BggrBgEFBQcCARYXaHR0cHM6Ly9zZWN0aWdvLmNvbS9DUFMwWgYDVR0fBFMwUTBP
oE2gS4ZJaHR0cDovL2NybC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0
aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNybDCBigYIKwYBBQUHAQEEfjB8
MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29SU0FD
bGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCMGCCsGAQUF
BzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAlBgNVHREEHjAcgRpoZW5yaS5y
b29zZW5AZ2luemluZ2VyLmNvbTANBgkqhkiG9w0BAQsFAAOCAQEAvnhZZj7ypNYO
PwTT2S8/Af93HM1WQ0xs4SZmr+fhrPX5eqy2/N8nvfFWeLvtz44azO53h0fqe00n
Jl6LN0io98A9TjO4O7o43X+uKOruO2d83DlkpfHlh1MoCCXIx2GmBcpZX4rQUOug
YBs8iTEmFTzVezLsnuvIYG3DyD7kJMj+lJ6vYJTxR5Pt+Jbm3K/xRuD6Ms3xJ4c8
OH8SA942rIgYSXF/uGJTCfUEMu8i8fdV4NGKXIdRFMl3Sbznt65QdFpv2HO6yfpw
7sMSL39bvz4aqib6Lp7oxet95K3vYfJyQpcSLhvk/KYKw/a5H7kGtNB/FPPZ6Mef
80qCLqoopDGCAr4wggK6AgEBMIGrMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMS
R3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9T
ZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhA9vhNiVmYhrcqB36FGFQz/
MA0GCWCGSAFlAwQCAQUAoIHkMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTIyMDgwMTE0NDkyMFowLwYJKoZIhvcNAQkEMSIEILeATCQ6
857BlkVYTe9MPO2hxxg14s4DplFQX56GYrcOMHkGCSqGSIb3DQEJDzFsMGowCwYJ
YIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAH2o6BH84C43zGQSR06H/KsK+J0YmUqA
qv9Yrc0s+pcol4G0B5G0xOudD8eYbzEDe/K3KG4q3gITntp1KkQ6YNqjlU06NVOE
sSRmKfbzZDpt1Fyr7Iwl3w5chQd8KNSsJCEo4KI8kLO50h2N6e9Ecz1SzG5ppVW+
+QwzueleiAqpMtslUMTcDQRGMS10rU8TNsB5EHPwxcT2CGm3V2ur1hKH7KWNnM/y
M8O2kmTbZqdoWVEGA6Q9Ga8bj0t+E9TfUuCjae43r8JJCqbKl4jWHZHK3udPYxhE
lLvP+YvTttdGOYfOOfCSadJQDVNDZI5yaDEauik0bhdJZagqXO5U/dw=

------52DFCF07204B73B52E218C3821482448--


--===============5645089347665593992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5645089347665593992==--

