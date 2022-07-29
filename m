Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4542C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6481860B31;
	Fri, 29 Jul 2022 21:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6481860B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqOPOF0RtHZ4; Fri, 29 Jul 2022 21:49:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 642DC606F9;
	Fri, 29 Jul 2022 21:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 642DC606F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1A1B1BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C69E64097F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69E64097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQ8pia3h9qB2 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:49:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0A694087D
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0A694087D
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:49:52 +0000 (UTC)
Received: from mail-db8eur05lp2104.outbound.protection.outlook.com
 ([104.47.17.104]:4608 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <Henri.Roosen@ginzinger.com>) id 1oHXrZ-00036D-0Q
 for buildroot@buildroot.org; Fri, 29 Jul 2022 23:49:41 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000, 
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_BASE64 0.000000, HDR_COMMON_LOWERCASE 0.000000, HTML_00_01 0.050000,
 HTML_00_10 0.050000, NO_FUR_HEADER 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, SINGLE_URI_IN_BODY 0.000000,
 URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_NONE 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_CV_FAIL 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BULK_NEGATE 0.000000, __CP_URI_IN_BODY 0.000000, __CT 0.000000,
 __CTE 0.000000, __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000,
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FROM_NAME_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
 __HAS_FROM 0.000000, __HAS_MSGID 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HTTPS_URI 0.000000, __INVOICE_MULTILINGUAL 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PHISH_SPEAR_SUBJ_ALERT 0.000000,
 __RCVD_PASS 0.000000, __SANE_MSGID 0.000000, __SINGLE_URI_TEXT 0.000000,
 __SUBJ_STARTS_S_BRACKETS 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NO_NAME 0.000000, __URI_IN_BODY 0.000000,
 __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000,
 __URI_NS 0.000000, __URI_WITH_PATH 0.000000, __USER_AGENT 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 7%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2022.7.29.210320
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=LUtw/GxRQ4ynIHrosWLjfa3/HxTHUXClPccqMyhGqN2TVRA/glcWS6yI5bvkBQz06bMAr2dyEq46KE1YQy71Ab8Woul9h5MgbtimiqlDTg2zZsaWCG9OIg0eKYJtyxddK5wcBjkg3ShW786JxepREJh4ua2XcEGuTfCmMlMlf97gT0LpP+jnX1+/JyCBVWG4C2r9sAtvUeN+Rb7bvpUctqQ6KaauHRgHaXXADEdXIXc3XIa7eTrIWTyi85ZMl+zJ8BjNA+lSHWTxeG6VdjGII4rhbDPoKKRhxwvPlKe5hFXu+ZuMdBU9xt6EIQIaZSmWJFbAjNLrPMnkhtw5s1+wsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+1mfrJIAXdoX0tdAHY7jKWrTawFPbpWImDoK3eMp3Q=;
 b=E0st9e5L05ZsmW7xu//sJA+HdK0eaP2efWJ20x1/KfqejZ5gmxAFtxs7Lt7N91doNo+ouj35t8hXC2NngUi6fuHTPTf2dq+ZEavE4+ruuizvz4Uo9ajmj01F5iP+l7KmB7H9ey1XlryiBikT2fY84sMUlIoi937Wsq0AnlbWCH4nd3kSwQh0qx8h4lUE7eS6E5Jt9Lnb+FwoAF9coITHA6VUbJCfYEqPDwpXQAfGhcSjR7XnZoNxlMy2vZORyVWBQ+WKjmBMpJo4iY2m7XITSPTdm5AYPR69c7NgO5/yP0kXmocyLK2oPvXWgijYJ2bFp0xeX3+lYA9nbKoOJMZHrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=buildroot.org smtp.mailfrom=ginzinger.com;
 dmarc=bestguesspass action=none header.from=ginzinger.com; dkim=none (message
 not signed); arc=fail (48)
Received: from AM6PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:20b:b2::27)
 by DB7PR06MB5130.eurprd06.prod.outlook.com (2603:10a6:10:6c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Fri, 29 Jul
 2022 21:49:38 +0000
Received: from VI1EUR05FT008.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::ee) by AM6PR08CA0015.outlook.office365.com
 (2603:10a6:20b:b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Fri, 29 Jul 2022 21:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 VI1EUR05FT008.mail.protection.outlook.com (10.233.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11 via Frontend Transport; Fri, 29 Jul 2022 21:49:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.51) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Fri, 29 Jul 2022 21:49:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mpw8qZq0kjHY2ud+aYivzhu/eEGQ7pkba7KG2b1fm/HPY4uUyOdZtEGwwJ+/fWAb5ui7xb/fCi+K4WUhr0uC9kqbnVEV1WmNM/zd2W8Tleodbr51ujagFoELOjvjdNRYusapK3MlxW5wkkN11vXbFOaoOfdyFY1x+D62pTikvYFCy5gWhg5kQZXi8vHG2ZwJKDgf4ENjYj/dL6lRkjIIekB08eciL3Rzvd3nsJ1u9dOUKaalH4p8On1gAN9qgK6zKI4L6FpYl70T0VOhAKS2a6kYmY4qVtGXZNAPpL7R/nNoul9lvNhnKj5VPP04xoKmNwlxXCE9TmHQ0FGAi9qbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+1mfrJIAXdoX0tdAHY7jKWrTawFPbpWImDoK3eMp3Q=;
 b=EOfUtxwzUq8zOX6ofsxoQHy+V4zQBohOfWilUq0nCXHERCx4bo70YKwinvX+cyg2Q9vjoV1EkOVsJnsaxC735+nfrD8EhTcoAGumTANDtK8VE6pb45nqRpb7rapb5Rb9zJxDjMU59EWynkHhCXl/o8wKBAgbMiqY1PO8bfYjetFq6y4n8joVzz24XMuyuKF/y44SQPWF5Lm6WAlmU/rj45C43rTJLsNryqsWz+ip53lQPvLqrPDfKNy/uoT8vE7bG+pgDjpQnPuFXl9V/4P9gpLdAJgDC1y6VNMWgFlv3PDcpcyTl7zFDaocKykE/GXLOq15ME/MjAq/agU70iORnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from PAXPR06MB8143.eurprd06.prod.outlook.com (2603:10a6:102:1ac::14)
 by DB7PR06MB5498.eurprd06.prod.outlook.com (2603:10a6:10:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Fri, 29 Jul
 2022 21:49:33 +0000
Received: from PAXPR06MB8143.eurprd06.prod.outlook.com
 ([fe80::9866:8326:eaed:c68c]) by PAXPR06MB8143.eurprd06.prod.outlook.com
 ([fe80::9866:8326:eaed:c68c%6]) with mapi id 15.20.5482.012; Fri, 29 Jul 2022
 21:49:33 +0000
From: Roosen Henri <Henri.Roosen@ginzinger.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Index: AQHYo5UWpQaUuDUFD0+DnJDpJMP2aQ==
Date: Fri, 29 Jul 2022 21:49:33 +0000
Message-ID: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
X-MS-Office365-Filtering-Correlation-Id: 13e95db5-fc44-4938-242a-08da71ac3b90
x-ms-traffictypediagnostic: DB7PR06MB5498:EE_|VI1EUR05FT008:EE_|DB7PR06MB5130:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UhgcIl81R+qOES1mcdie5So/S6d74qiMoIAucMHPyp80HebBh6cNRM6rUpaR72fUSQFxHZO0wT7pYAHDmrHwuG2HUeVBokO6tnvTgTmA7Q4Sk2/bVi5uxh2FUGvjU5QHylj23ghh9d5+WDUPIoEbwxB99sBtRpaeX0lwljCxzFrsgoxX/bTdRb/3hxLWkrD/1G836JOp6h1vkL9cEOf3hGg9Ads5PY4YjDt5A0f4tuiX4cldSKfcEQlupcqD4IVZE2oWoT0INlTQnr4WN9aGUd1CuDdogA77x8uTGeNMGiyi4IebU/zy9EymQRpUVHB+gqeSZ4a21Zr8DZ2Lp47Nht4IsqaYmxBpDEnWmmj58wVZDoDgOQUGG8LkQF9KgHq3kdSmuH8Dt/2LbznTOrYe7Awc8usictip2g4rq9UM/reBZBSvTEr2mtMRMDAaoM+mHnUXgQn0qlx8NiUUGNPxF69q3A0YatolTKHdpQtFH9gb3mJHDYGDa8iUSV1gNqL3XcB4Nxq6RLBfrGSL9uZsjY1qnHCBzCIDAnzKgasdreHR96rdOpPSu5uASkpGddRHC7p0eG2tf9cj7XhsiC4gEQmV8Uz9JAELSuIx3TgDt3kRiEa6YUKVAMUDTvqAqD8MWKeL2+bkhbLjTvSy4qGrCxDS3SuWbCqegg1a1Rw5pzEYApAOFJ3c5g69YxcYRNtqUbbNFqenrVU5/qsiyA8ZHoxcGSKG2PZHLSHX4ZGLynjtkom2hjCJ/p8NkXi2+ZwUj4zOqRrnj1QYPHeUM0jGuVEE6LOH5al9pUxdAOerF/9O+R09B46Nr2vnfmSicj74vWqv483Rv5UGFGxklzXz1w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR06MB8143.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39830400003)(396003)(136003)(366004)(5660300002)(2906002)(6512007)(64756008)(41300700001)(83380400001)(966005)(8936002)(6486002)(2616005)(86362001)(478600001)(186003)(6916009)(6506007)(38100700002)(122000001)(66476007)(66946007)(66446008)(66556008)(8676002)(71200400001)(36756003)(91956017)(76116006)(316002)(38070700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB5498
X-CodeTwo-MessageID: 70fd8f8f-c6fc-44ed-81d2-3024cc1b52f8.20220729214935@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT008.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 88487a4f-73d6-41ae-3e8d-08da71ac3932
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqEd0RRFacv9N9Im0gnQpf6BMwAVUmsazmb6WxKizQIlxq9ewa+aHwEXYug/dyTH6HC9j8LQgVEnKmN/+S8XdjQUg2EchfB1RuxWrQn+qDN/eBqOn4tVu7jlIwdWedeymgipP/dp0Uz9RrUrs+waL1pAO1+z70qPsl7FXKRcBtvQVzYBgEbDFIBhyJsAw+ETfK98xMMkPls+1D/QBR/LbOtUaCxk6q7GoZyURYm/GMSXgJEidBRMgL/EAa0nVwQ0FgT/auhLSHvHsdtR70Px4N3/Ji9atsM6W2VaV2rr02eXgphamWfin0j2l7oylPlKVwUMIwzfMdonAsJRTGdQd8uVq896j9w8CC0hrEJD7FdsrjIedWqJoqEV7Mzl5k1TljVeGkafb7Rr2bV1wskvNPHzFCRLQMg92fsntbseCnTsCzNMCSMyM/pKsk/V8bkH068nq3wNria6nSMEaAdTqEvh/DIa9dlJW3AYbsvADB/z0q0ctnvVc2Roa7SE5xd6j1TpIt5tQ7GiDqUq65aCk6nw5uXQhhGHAdhVwGIr7ZFaJ5EnP51fc1sHLyrCOqV0Tavwnq/jtPo16QPI8x/vDd0HRBW98Of4XhEEowU6+hCm9s1vfzg6ACmG3/LCR3zt4Bx3VnW63gf+rlOwJfC/KxFt21+vI6MSS+R8eKNGyHyomVL1CA53/uIMW8nHi8x0VL0+LqecIp37PaJ0N1P6P/hq+UrbcTVgNZVqq97g125D99L0QGlrJniSCjxSLfAzCSqQp8TZGQ0yIxA1lCOYuOcNYyl6ukds1C5v3RIKSVMJEIndghk+9b3IwneOpRdL
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(39830400003)(136003)(346002)(36840700001)(46966006)(6506007)(36860700001)(36756003)(966005)(2616005)(6916009)(186003)(336012)(83380400001)(41300700001)(6486002)(26005)(6512007)(316002)(478600001)(8676002)(8936002)(82310400005)(70586007)(70206006)(5660300002)(86362001)(356005)(2906002)(47076005)(40480700001)(7596003)(7636003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 21:49:37.3181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e95db5-fc44-4938-242a-08da71ac3b90
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT008.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB5130
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Makefile: workaround make 4.3 issue for
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
Content-Type: multipart/mixed; boundary="===============1299990653971676913=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============1299990653971676913==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----BC87E5A6E5441E79619BBDC8B94AC581"

This is an S/MIME signed message

------BC87E5A6E5441E79619BBDC8B94AC581
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C1D385C701904438A6BE1851D20351F@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

RXZlbnQgdGhvdWdoIHRoZSBidWcgd2l0aCBtYWtlIDQuMyBoYXMgYmVlbiByZXBvcnRlZCBhbmQg
Zml4ZWQsIHRoZXJlDQpoYXMgbm90IGJlZW4gYSByZWxlYXNlIG9mIG1ha2Ugd2l0aCB0aGUgZml4
IGZvciBhIGxvbmcgdGltZSwgc2VlIFsxXS4NCg0KQXMgdGhlIHJvb3QgY2F1c2Ugc2VlbXMgdGhl
ICdmaWx0ZXInIGNvbW1hbmQgY2Fubm90IGhhbmRsZSBsYXJnZQ0KY2h1bmtzIG9mIGRhdGEsIGxp
a2UgLlZBUklBQkxFUywgd2UgY2FuIHdvcmthcm91bmQgdGhlIHByb2JsZW0gYnkNCnVzaW5nIGEg
Zm9yZWFjaCBjb21tYW5kIG92ZXIgLlZBUklBQkxFUywgdGhlbiB1c2UgdGhlIGZpbHRlciBjb21t
YW5kLg0KDQpJdCBtaWdodCBub3QgYmUgbG9naWNhbCB0byBwcm9ncmFtIGl0IHRoYXQgd2F5LCBi
dXQgYXQgbGVhc3QgdGhlDQpmdW5jdGlvbmFsaXR5IGlzIG5vdyB1c2FibGUuDQoNClsxXSBodHRw
czovL3NhdmFubmFoLmdudS5vcmcvYnVncy8/NTkwOTMjY29tbWVudDEwDQoNClNpZ25lZC1vZmYt
Ynk6IEhlbnJpIFJvb3NlbiA8aGVucmkucm9vc2VuQGdpbnppbmdlci5jb20+DQotLS0NCiBNYWtl
ZmlsZSB8IDE1ICsrKystLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQ0K
aW5kZXggYmYxMDFmZjc3MC4uYTg1NmY2OTY4NSAxMDA2NDQNCi0tLSBhL01ha2VmaWxlDQorKysg
Yi9NYWtlZmlsZQ0KQEAgLTEwNTYsMjMgKzEwNTYsMTYgQEAgaWZlcSAoJChORUVEX1dSQVBQRVIp
LHkpDQogCSQoUSkkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL21rbWFrZWZpbGUgJChUT1BESVIp
ICQoTykNCiBlbmRpZg0KIA0KLS5QSE9OWTogY2hlY2stbWFrZS12ZXJzaW9uDQotY2hlY2stbWFr
ZS12ZXJzaW9uOg0KLWlmbmVxICgkKGZpbHRlciAkKFJVTk5JTkdfTUFLRV9WRVJTSU9OKSw0LjMp
LCkNCi0JQGVjaG8gIk1ha2UgNC4zIGRvZXNuJ3Qgc3VwcG9ydCAncHJpbnR2YXJzJyBhbmQgJ3No
b3ctdmFycycgcmVjaXBlcyINCi0JQGV4aXQgMQ0KLWVuZGlmDQotDQogIyBwcmludHZhcnMgcHJp
bnRzIGFsbCB0aGUgdmFyaWFibGVzIGN1cnJlbnRseSBkZWZpbmVkIGluIG91cg0KICMgTWFrZWZp
bGVzLiBBbHRlcm5hdGl2ZWx5LCBpZiBhIG5vbi1lbXB0eSBWQVJTIHZhcmlhYmxlIGlzIHBhc3Nl
ZCwNCiAjIG9ubHkgdGhlIHZhcmlhYmxlcyBtYXRjaGluZyB0aGUgbWFrZSBwYXR0ZXJuIHBhc3Nl
ZCBpbiBWQVJTIGFyZQ0KICMgZGlzcGxheWVkLg0KICMgc2hvdy12YXJzIGRvZXMgdGhlIHNhbWUs
IGJ1dCBhcyBhIEpTT04gZGljdGlvbm5hcnkuDQogLlBIT05ZOiBwcmludHZhcnMNCi1wcmludHZh
cnM6IGNoZWNrLW1ha2UtdmVyc2lvbg0KK3ByaW50dmFyczoNCiAJQDoNCiAJJChmb3JlYWNoIFYs
IFwNCi0JCSQoc29ydCAkKGZpbHRlciAkKFZBUlMpLCQoLlZBUklBQkxFUykpKSwgXA0KKwkJJChz
b3J0ICQoZm9yZWFjaCBYLCAkKC5WQVJJQUJMRVMpLCAkKGZpbHRlciAkKFZBUlMpLCQoWCkpKSks
IFwNCiAJCSQoaWYgJChmaWx0ZXItb3V0IGVudmlyb25tZW50JSBkZWZhdWx0IGF1dG9tYXRpYywg
XA0KIAkJCQkkKG9yaWdpbiAkVikpLCBcDQogCQkkKGlmICQoUVVPVEVEX1ZBUlMpLFwNCkBAIC0x
MDgyLDExICsxMDc1LDExIEBAIHByaW50dmFyczogY2hlY2stbWFrZS12ZXJzaW9uDQogDQogLlBI
T05ZOiBzaG93LXZhcnMNCiBzaG93LXZhcnM6IFZBUlM/PSUNCi1zaG93LXZhcnM6IGNoZWNrLW1h
a2UtdmVyc2lvbg0KK3Nob3ctdmFyczoNCiAJQDoNCiAJJChpbmZvICQoY2FsbCBjbGVhbi1qc29u
LCB7IFwNCiAJCQkkKGZvcmVhY2ggViwgXA0KLQkJCQkkKHNvcnQgJChmaWx0ZXIgJChWQVJTKSwk
KC5WQVJJQUJMRVMpKSksIFwNCisJCQkJJChzb3J0ICQoZm9yZWFjaCBYLCAkKC5WQVJJQUJMRVMp
LCAkKGZpbHRlciAkKFZBUlMpLCQoWCkpKSksIFwNCiAJCQkJJChpZiAkKGZpbHRlci1vdXQgZW52
aXJvbm1lbnQlIGRlZmF1bHQgYXV0b21hdGljLCAkKG9yaWdpbiAkVikpLCBcDQogCQkJCQkiJFYi
OiB7IFwNCiAJCQkJCQkiZXhwYW5kZWQiOiAkKGNhbGwgbWstanNvbi1zdHIsJCgkVikpJChjb21t
YSkgXA0KLS0gDQoyLjMwLjINCg0KDQo=

------BC87E5A6E5441E79619BBDC8B94AC581
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
KoZIhvcNAQkFMQ8XDTIyMDcyOTIxNDk1MFowLwYJKoZIhvcNAQkEMSIEIKRuwFEf
a4LkSreUr1+81H/lsCVQAtuZEXI3Df3JDu++MHkGCSqGSIb3DQEJDzFsMGowCwYJ
YIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAJhV4eXIiPZOBI60o0HZ37esDHxupIjg
c82KWanqzcHkSIrn2kIinsCuZ3Yg6W9rRAIQ4CH1fqn4rCDbXG+5eaLGdR9ZF+Ss
Gn+yCYjz4ZHpvZfarXs0GDhVhAo7Qq25NI6v6vrtZp+YkDJbgG8FTODb+a8QDcsu
3FJJhYxHuq+oc5EgD6DNz/v5vszWO+tFjSHCK2VliUDp8ezK2D4kqLJCXB2284+6
VcOfXqi9w0/r14sn02S5UOL9B7diHd9M0W06nQS34QBrsTglPSgGJ4zjiXqio+L3
hufVIJskCVyus3MUxLAc6zI9lMRucHejFwbk9ubZZ5YYqKawtsdC9Ds=

------BC87E5A6E5441E79619BBDC8B94AC581--


--===============1299990653971676913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1299990653971676913==--

