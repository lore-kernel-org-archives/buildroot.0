Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08FAC4321E
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 06:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2332A40339;
	Wed, 30 Nov 2022 06:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2332A40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7MPW6YO9cb4; Wed, 30 Nov 2022 06:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EBD40290;
	Wed, 30 Nov 2022 06:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3EBD40290
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 221F31BF859
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 06:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFB1860B13
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 06:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFB1860B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdhdpND8DHte for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 06:43:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64165606C6
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64165606C6
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 06:43:16 +0000 (UTC)
Received: from mail-am6eur05lp2109.outbound.protection.outlook.com
 ([104.47.18.109]:50656 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p0GoJ-0004i7-1g;
 Wed, 30 Nov 2022 07:43:11 +0100
Received: from DB9PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:1d9::8)
 by DB7PR06MB4202.eurprd06.prod.outlook.com (2603:10a6:5:37::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 06:43:08 +0000
Received: from DB8EUR05FT038.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::77) by DB9PR02CA0003.outlook.office365.com
 (2603:10a6:10:1d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 30 Nov 2022 06:43:08 +0000
X-SASI-Hits: BODY_SIZE_10000_PLUS 0.000000, BODY_SIZE_25K_PLUS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_FUR_HEADER 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000, SUPERLONG_LINE 0.050000,
 SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BANNER_TRUSTED_SENDER 0.000000,
 __BODY_NO_MAILTO 0.000000, __BOUNCE_CHALLENGE_SUBJ 0.000000,
 __BOUNCE_NDR_SUBJ_EXEMPT 0.000000, __BULK_NEGATE 0.000000,
 __CC_NAME 0.000000, __COURIER_PHRASE 0.000000, __CP_URI_IN_BODY 0.000000,
 __CT 0.000000, __CTE 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DATING_PHRASE 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FORWARDED_MSG 0.000000,
 __FRAUD_BODY_WEBMAIL 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FRAUD_WEBMAIL 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HTTPS_URI 0.000000, __IN_REP_TO 0.000000, __IOC_PHRASE 0.000000,
 __MAIL_CHAIN 0.000000, __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000,
 __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MULTIPLE_URI_TEXT 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __STOCK_PHRASE_7 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
 __TO_REAL_NAMES 0.000000, __URI_ENDS_IN_SLASH 0.000000,
 __URI_HAS_HYPHEN_USC 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000, 
 __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
 __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.1, AntispamData: 2022.11.30.60317
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB8EUR05FT038.mail.protection.outlook.com (10.233.238.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17 via Frontend Transport; Wed, 30 Nov 2022 06:43:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.113)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Wed, 30 Nov 2022 06:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHsURCmGjX/Q9pIWI/K7vbqlFxtpkOIN3FeKad1BAPWNMXfyBxI7ByMqkutnoF/QLk8WnAo6WwxKoFrqfJJtKK0RCJbDwlxICbgdWafu1xTGfiMHwDnn3kWBXU4ATj2stSV3bJvSjPIO1Cgvdhsyheaqg+G1ObVJ4cpLR4iMpogd1TTlU3qgFH153TD3WVEkXGSEdLdze9WeB3th7fIH95P8SaTBQYISVZzZ91QuCGF4LTpsYKp9Vs3HVZVFJ9nuwthgDEgDsvoisJVdQLJHeYAr9rZkskYeYA1WnLQyBaNpjOGahA9a8UYA1iH0ycDE5EPx+AX0EjuAiVjo5yggGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85OnWPWu6atk29UUh27W4Dja9fKni9JF4gvf8h1hiNw=;
 b=ZrZLUsvKjrn91u9iU6UmOp894u0IOpHhu4HJYjsGV1zwGa7ibL0AE3QH2yslckTrjZmYs3u7w4Z+kW6XQFgm2rjsEt1eiAhbK2uQK0HxznJUpL89/JZnURksUorsgB2Q+6S2MMMnK1SicqfwPtsI3f9/3HHKQ08lz08qABXjbtliGFqma0C1hD6LyvC8DWqe2lFi83boppLXLy4Un87ZZGxl9IFeMiUXkg2T5RBIHPFBJHrVMtk0GnyGESZb2Ht+KKf6DIVrYatWuyr34OcV2I3yMTeGkkwA3NjTfZJlXFadn4S3qxDrG42mYlBMlQN1vN4cCdhB/BuoLV8yODoiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by DB6PR0601MB2104.eurprd06.prod.outlook.com (2603:10a6:4:4d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 06:43:01 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%7]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 06:43:01 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZAA4I4kgHULsEBU23MOO8dSK4y65OKUqAgAErrT+AAH2SAIAEk9jtgABAlACAAmS6bw==
Date: Wed, 30 Nov 2022 06:43:01 +0000
Message-ID: <AM5PR06MB31539056C3F733256DB9E79184159@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
 <CADvTj4rmM5-9_qvHqKCRA3FHebK5O3po2dtUg7bXkPW+Oii8pw@mail.gmail.com>
 <AM5PR06MB315361D4448EE9C17B1C3F65840E9@AM5PR06MB3153.eurprd06.prod.outlook.com>
 <CADvTj4p-u4aELr0Km=cGzh092dMXq0rq=gVOHV5jC=eQagrYXA@mail.gmail.com>
 <AM5PR06MB31539DCE3243B81D0E0B9D6584139@AM5PR06MB3153.eurprd06.prod.outlook.com>
 <CADvTj4pqJYfn7yXPhxE8ofYqHNeZNjqUxgwf4qHr7Uhx7-todQ@mail.gmail.com>
In-Reply-To: <CADvTj4pqJYfn7yXPhxE8ofYqHNeZNjqUxgwf4qHr7Uhx7-todQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|DB6PR0601MB2104:EE_|DB8EUR05FT038:EE_|DB7PR06MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d90238-a392-48a5-db16-08dad29e246e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: a+VSHNRdoKxbd70co/Hp6PRa1nLbFM6D5m3EekLohdLgJBD56hTidc1ppPiBCU0rxKlYFO4JR42DS+Fq/p6mTneWt6Ggut73vgNjzVlIz6ZX291tJBUsnAABrPGtBMOUOAfDu0EYBEkToAqVe82ci+ALNF8OZ9qOXbI6CkYoKB1cDLM6f3uGvH2i4phunSc1TtfgwazPuZp5ne7xEyOzCbnPgKrMPWyuPBS2k1uMYO1/9XfLko4W7uGQUm7ZPH0PULK19NtrvQGzIx6rQobmmZVHJ4gF3jGF36SbwFB0Zg3joVzyFB8IiIMe4pJcX3QqGErfw1fRkhHGoXNicd5DZAelU230d4deYBAUQaFXCGEi0jgl1ifTYQlm6eXD/Bw7zZ3SXPldqYu+fHwFYqJ+L6sIATPf6dg6ewiP0iRInoMguetKxSaiYZNSksNmQlyy0bXHABS1bwc7WZE8utKtacGkrak1NXYQDU9IkB2IdVtome5aQ5zHyc+pX4kIi8MzqedtOs6SluAMNYt9wDjBe3jtH6aKycerS+bHWi4KqDsBwUIn2IV6SxHaClAArEE5vKx284oyT/YIkKUEu5fkNJrtUrbWrotYHLbWn0OnZfELjFwGQedSlSTd3b1/plHIuibqwHeVsuN6xrYec1DK4fVB8FSVaHxcTqXzrtX4uA95f443nOpwYJiHJx4aPVxWcJ4bhCZoVN/jmJ8aDhzPj0b3TLEk8s4f/GoDnVda/NsfFeZhLPYKMLHAJcx/ioJrB2Sz072Htnhz5V8gaO1xlOTE2CavP9zBRhkIDAO6VkI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39840400004)(451199015)(33656002)(122000001)(38070700005)(2906002)(41300700001)(30864003)(66556008)(86362001)(83380400001)(966005)(478600001)(64756008)(8676002)(316002)(76116006)(66446008)(66946007)(71200400001)(6916009)(66476007)(38100700002)(52536014)(4326008)(8936002)(5660300002)(26005)(186003)(6506007)(9686003)(55016003)(7696005)(53546011)(69594002)(21314003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2104
X-CodeTwo-MessageID: c59fc44e-41bc-42c0-b3b3-dbd3c97166b5.20221130064305@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT038.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 81e511bf-c902-4399-6f60-08dad29e206f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JG9ifdM5ABbrXULGvoWKnahp0IHJnXUs4e20ChVhUB+hVzFuoIB8fEqrIXyaHYzLKEtaCBZ739znKvmCVRRPqHm8HmczRhTHAYx2X0enLfzHan38xaWj75zigbD87UkapBEQD/r4x6MmlYMVMWUyVSmF2V9Defc5/1EBAKoXTwQP4SD4cvip4DsUJApqUgWsymD48UJ3xaexiNUzUZGDCUndDqEJDQq1w0xFKWtQiP89jBQNuBRhT9m0kHPgWtF/Ge8W4mTmgFa5OTix0qtMLjuFDUlMABV8EZ2J/3Za4QlqC2tyFmRFdF1sI+jA4nYYegHY5fZDN9KL8GrLAheIDN3SBfwOzDi60iJ3cRjLKK94joJSspLvGT/POpUQF9CgoTZU7bgBQJaQ3zsEht8Ugn2VPzEH5O9DPhtK6b5q/5+XohdKXqeqJKUcwI/fbxG8gRhXWrS8lXxIIIcixnahvgIE4r3hZHwqLHRpAHv0kqlwK67WF/xH2G16/8VteHrwhRhEvXOgnMSn1T4/QnvWjL9udR2YEXGVV0dgXuoA3bStJucs9GU6WKEFL1SAhRKzj5uiTU+wfqeireTKqbkHddhDZ10b8z/US2aDNgwwPZ8B+tSEHqhy7HCPz8iv5mvMihyi4nlBV9brBHQeG2mCkXKhNAAH3Pg+4WXxrj57iILdwjGUSOgi3lIPo0ToijQgcaC8YwISHAjz8zFmhGLHe8olyZiu5gZU/JUok5NDgQpPjpPUt3CtS9ZRVmBF67Z6
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(136003)(346002)(376002)(451199015)(46966006)(36840700001)(316002)(70586007)(70206006)(478600001)(2906002)(7596003)(33656002)(966005)(6916009)(7636003)(356005)(47076005)(26005)(82310400005)(83380400001)(55016003)(40480700001)(36860700001)(6506007)(9686003)(336012)(53546011)(86362001)(7696005)(186003)(30864003)(5660300002)(52536014)(41300700001)(8936002)(8676002)(4326008)(21314003)(69594002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 06:43:08.2694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d90238-a392-48a5-db16-08dad29e246e
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT038.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4202
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
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
Content-Type: multipart/mixed; boundary="===============5985076219203648022=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============5985076219203648022==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----4C8A12359D02EEFDA8837DFBB342CCCA"

This is an S/MIME signed message

------4C8A12359D02EEFDA8837DFBB342CCCA
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi James!=0A=
=0A=
Thanks for integrating the patch. I can confirm that it fixes the build iss=
ues of the label_image example.=0A=
It also run it on the target and the inference results of two tests were eq=
ual to previous tests with tensorflow-lite v2.8.0.=0A=
From my point of view it may be merged to master.=0A=
=0A=
Best regards=0A=
Stefan=0A=
=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Monday, November 28, 2022 19:02=0A=
To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
Cc: buildroot@buildroot.org <buildroot@buildroot.org>=0A=
Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package =0A=
=A0=0A=
On Mon, Nov 28, 2022 at 11:17 AM Hager Stefan=0A=
<Stefan.Hager@ginzinger.com> wrote:=0A=
>=0A=
> Hi James!=0A=
>=0A=
> Thanks four your great work!=0A=
> I was able to successfully build it.=0A=
>=0A=
> Unfortunately i could not build (linking error) the example program label=
_image.=0A=
> I use this to verify if the inference results are the same across differe=
nt Versions=0A=
> on the target hardware.=0A=
>=0A=
> This is what i did:=0A=
> $ make freescale_imx8mpevk_defconfig menuconfig=0A=
> =3D> in Menuconfig: activated C++ Support in the Toolchain Section; activ=
ated tensorflow-lite; activated host environment-setup;=0A=
> $ make=0A=
> # everything built fine=0A=
>=0A=
> $ source output/host/environment-setup=0A=
> $ cd output/build/tensorflow-lite-2.11.0/tensorflow/lite/buildroot-build/=
examples/label_image/=0A=
> $ make label_image=0A=
> # linking error, full log:=0A=
>=0A=
> Consolidate compiler generated dependencies of target fft2d_fftsg=0A=
> [=A0 1%] Built target fft2d_fftsg=0A=
> Consolidate compiler generated dependencies of target farmhash=0A=
> [=A0 1%] Built target farmhash=0A=
> Consolidate compiler generated dependencies of target fft2d_fftsg2d=0A=
> [=A0 1%] Built target fft2d_fftsg2d=0A=
> Consolidate compiler generated dependencies of target tensorflow-lite=0A=
> [ 94%] Built target tensorflow-lite=0A=
> [ 94%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/bitmap_helpers.cc.o=0A=
> [ 95%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/label_image.cc.o=0A=
> [ 95%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/xxx/buildroot/output/build/tensorflow-lite-2.11.0/tensorflow/core/util/st=
ats_calculator.cc.o=0A=
> [ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/profiling/memory_info.cc.o=0A=
> [ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/profiling/profile_summarizer.cc.o=0A=
> [ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/profiling/profile_summary_formatter.cc.o=0A=
> [ 97%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/profiling/time.cc.o=0A=
> [ 97%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/tools/command_line_flags.cc.o=0A=
> [ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/tools/delegates/default_execution_provider.cc.o=0A=
> [ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/tools/delegates/delegate_provider.cc.o=0A=
> [ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/tools/evaluation/utils.cc.o=0A=
> [100%] Building CXX object examples/label_image/CMakeFiles/label_image.di=
r/__/__/tools/tool_params.cc.o=0A=
> [100%] Linking CXX executable label_image=0A=
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../.=
./../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: un=
defined reference to `tsl::profiler::TraceMeRecorder::Record(tsl::profiler:=
:TraceMeRecorder::Event&&)'=0A=
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../.=
./../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: un=
defined reference to `tsl::profiler::internal::g_trace_level'=0A=
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../.=
./../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: un=
defined reference to `tensorflow::profiler::ScopedMemoryDebugAnnotation::Th=
readMemoryDebugAnnotation()'=0A=
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../.=
./../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: un=
defined reference to `tsl::profiler::GetCurrentTimeNanos()'=0A=
> collect2: error: ld returned 1 exit status=0A=
> make[3]: *** [examples/label_image/CMakeFiles/label_image.dir/build.make:=
351: examples/label_image/label_image] Error 1=0A=
> make[2]: *** [CMakeFiles/Makefile2:436: examples/label_image/CMakeFiles/l=
abel_image.dir/all] Error 2=0A=
> make[1]: *** [CMakeFiles/Makefile2:443: examples/label_image/CMakeFiles/l=
abel_image.dir/rule] Error 2=0A=
> make: *** [Makefile:166: examples/label_image/CMakeFiles/label_image.dir/=
rule] Error 2=0A=
>=0A=
> This did peviously work with tensorflow-lite v2.8.=0A=
> Maybe i am missing something?=0A=
>=0A=
> I guess this is broken in v2.11.0.=0A=
> A fix may be in their master: https://github.com/tensorflow/tensorflow/co=
mmit/8562f9764937db51a4742fd10057463880579329=0A=
=0A=
Fix is in master but it's not that specific commit, should be this one:=0A=
https://github.com/tensorflow/tensorflow/commit/081c2e4e3cf021efb2853a485a1=
8b563e88f6117=0A=
=0A=
Pushed the fix to my github branch and v2 series:=0A=
https://patchwork.ozlabs.org/project/buildroot/patch/20221128175851.1913859=
-8-james.hilliard1@gmail.com/=0A=
=0A=
> I can try to use their master branch to see if that issue was addressed i=
n the next days. Alternatively i can Test v2.10.1.=0A=
>=0A=
> Maybe we need to wait for the next release v2.12?=0A=
>=0A=
> Best Regards=0A=
> Stefan=0A=
>=0A=
> From: James Hilliard <james.hilliard1@gmail.com>=0A=
> Sent: Friday, November 25, 2022 17:16=0A=
> To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
> Cc: buildroot <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzo=
ni@bootlin.com>=0A=
> Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package=
=0A=
>=0A=
> On Fri, Nov 25, 2022 at 5:07 AM Hager Stefan <Stefan.Hager@ginzinger.com>=
 wrote:=0A=
> >=0A=
> > Hi James!=0A=
> >=0A=
> > Tanks for your Feedback!=0A=
> >=0A=
> > Yes TFlite 2.8.0 is not the "latest" Release.=0A=
> >=0A=
> > I'm absolutly with you that using special Versions is a bad idea in gen=
eral.=0A=
> > On the other hand, it was my fear that it may be difficult to prove tha=
t everything works properly with newer Libs even if the build succeeds.=0A=
> > It was hard work for me get it running and I was happy that everything =
works even with the known limitations. But i learned a lot ; )=0A=
>=0A=
> It seems to build fine with normal libraries and without all the=0A=
> manual copy hacks:=0A=
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D330091&subm=
itter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D=0A=
>=0A=
> See if that works for you, I refactored your patchset and it seems to=0A=
> build without=0A=
> issues now using system libraries.=0A=
>=0A=
> I also uploaded that series to my personal github if that's easier for=0A=
> you to test:=0A=
> https://github.com/jameshilliard/buildroot/tree/tensorflow-lite=0A=
>=0A=
> >=0A=
> > Maybe it is the best to bump to Version 2.11.0 and they try it again wi=
th buildroot's own packages where they exist.=0A=
> > But this will take some time, maybe next year for the 23.04 Release.=0A=
>=0A=
> I bumped it to 2.11.0 and fixed the build issues I ran into:=0A=
> https://patchwork.ozlabs.org/project/buildroot/patch/20221125160724.17254=
76-8-james.hilliard1@gmail.com/=0A=
>=0A=
> >=0A=
> > And next time i need to add the [Buildroot] tag to the subject so my ma=
il sorting rule will work for my own mails...=0A=
>=0A=
> I think you also accidentally dropped the mailing list from your reply as=
 well.=0A=
>=0A=
> >=0A=
> > Best Regards=0A=
> > Stefan=0A=
> >=0A=
> >=0A=
> >=0A=
> >=0A=
> > From: James Hilliard <james.hilliard1@gmail.com>=0A=
> > Sent: Thursday, November 24, 2022 15:54=0A=
> > To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
> > Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni=
 <thomas.petazzoni@bootlin.com>=0A=
> > Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package=
=0A=
> >=0A=
> > On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager=0A=
> > <stefan.hager@ginzinger.com> wrote:=0A=
> > >=0A=
> > > Hello,=0A=
> > >=0A=
> > > this RFC patch series proposes a way to integrate the Tensorflow-lite=
 runtime (TFLite) into Buildroot.=0A=
> > >=0A=
> > > This first RFC just integrates the TFLite C++ sahred library.=0A=
> > > After a sucessful first integration the next step wuld be to activate=
 the python library for TFlite.=0A=
> > > As a third step i plan to integrate the NPU Backend Driver for TFLite=
 to use accelerated inference on the i.MX8MP NPU (neural processing unit) f=
or C++ an Python.=0A=
> > > All of this currently works locally as a proof of concept for a few u=
sers.=0A=
> > >=0A=
> > > The currently used Version of TFLite is 2.8.0 (official) which is pro=
ven to work.=0A=
> >=0A=
> > This is an outdated release right? Are there issues with 2.11.0?=0A=
> >=0A=
> > >=0A=
> > > TFlite comes with a bunch of external source dependencies which are d=
ownloaded by separate hidden packages and then built by the main TFLite pac=
kage.=0A=
> > > TFLite needs its own versions of libabseil, eigen and flatbuffers wic=
h may conflict with the Versions provided by Buildroot.=0A=
> >=0A=
> > I'm unable to find any documentation indicating this is actually the ca=
se.=0A=
> >=0A=
> > I skimmed the cmakelists and it doesn't seem to have strict version=0A=
> > requirements:=0A=
> > https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/C=
MakeLists.txt=0A=
> >=0A=
> > Have you tried building against the normal buildroot versions of these =
packages?=0A=
> >=0A=
> > > Since i can not gurantee that TFlite will work with other Versions of=
 this packages i decided to only let TFlite be activated if this packages a=
re not activated in Buildroot.=0A=
> >=0A=
> > This is probably not the right approach, other packages may depend on=
=0A=
> > or select the normal versions(flatbuffers seems especially problematic)=
.=0A=
> >=0A=
> > >=0A=
> > > Currently TFlite only supports a limited set of processor architectur=
es (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-=
bit Support).=0A=
> > > Anyone else may activate further platforms if needed, but testing nee=
ds to then be done by them.=0A=
> > >=0A=
> > > How to build a minimal config with TFLite:=0A=
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> > > $ make raspberrypi4_64_defconfig menuconfig=0A=
> > > Activate TFLite in menuconfig: Target packages -> Libraries -> [*] te=
nsorflow-lite=0A=
> > > $ make tensorflow-lite=0A=
> > >=0A=
> > > I'm hoping for Comments to prepare a first patchset.=0A=
> > >=0A=
> > > Stefan Hager (10):=0A=
> > >=A0=A0 tensorflow-lite-abseil-cpp: new package=0A=
> > >=A0=A0 tensorflow-lite-clog: new package=0A=
> > >=A0=A0 tensorflow-lite-abseil-cpuinfo: new package=0A=
> > >=A0=A0 tensorflow-lite-eigen: new package=0A=
> > >=A0=A0 tensorflow-lite-farmhash: new package=0A=
> > >=A0=A0 tensorflow-lite-fft2d: new package=0A=
> > >=A0=A0 tensorflow-lite-flatbuffers: new package=0A=
> > >=A0=A0 tensorflow-lite-gemmlowp: new package=0A=
> > >=A0=A0 tensorflow-lite-ruy: new package=0A=
> > >=A0=A0 tensorflow-lite: new package=0A=
> > >=0A=
> > >=A0 package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +=0A=
> > >=A0 package/tensorflow-lite-abseil-cpp/Config.in=A0 |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-abseil-cpp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-abseil-cpp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-clog/Config.in=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-clog.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-clog.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-cpuinfo/Config.in=A0=A0=A0=A0 |=A0=A0 5 +=
=0A=
> > >=A0 .../tensorflow-lite-cpuinfo.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-cpuinfo.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-eigen/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 =
5 +=0A=
> > >=A0 .../tensorflow-lite-eigen.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 9 +=0A=
> > >=A0 .../tensorflow-lite-eigen.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-farmhash/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-farmhash.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-farmhash.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-fft2d/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 =
5 +=0A=
> > >=A0 .../tensorflow-lite-fft2d.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-fft2d.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 15 ++=0A=
> > >=A0 package/tensorflow-lite-flatbuffers/Config.in |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-flatbuffers.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-flatbuffers.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-gemmlowp/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-gemmlowp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-gemmlowp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-ruy/Config.in=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-ruy.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-ruy.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 ...2sse-since-this-is-only-useful-on-x8.patch |=A0 34 +++=0A=
> > >=A0 ...build-a-shared-library-instead-of-st.patch |=A0 55 +++++=0A=
> > >=A0 ...build-tflite-with-external-delegates.patch |=A0 59 +++++=0A=
> > >=A0 ...epositories-and-git-pull-configurati.patch | 203 ++++++++++++++=
+=0A=
> > >=A0 package/tensorflow-lite/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 56 +++++=0A=
> > >=A0 package/tensorflow-lite/tensorflow-lite.hash=A0 |=A0=A0 3 +=0A=
> > >=A0 package/tensorflow-lite/tensorflow-lite.mk=A0=A0=A0 | 232 ++++++++=
++++++++++=0A=
> > >=A0 35 files changed, 848 insertions(+)=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-l=
ite-abseil-cpp.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-l=
ite-abseil-cpp.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-clog/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-cl=
og.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-cl=
og.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite=
-cpuinfo.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite=
-cpuinfo.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-eigen/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-e=
igen.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-e=
igen.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-farmhash/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lit=
e-farmhash.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lit=
e-farmhash.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-fft2d/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-f=
ft2d.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-f=
ft2d.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/Config.in=
=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-=
lite-flatbuffers.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-=
lite-flatbuffers.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lit=
e-gemmlowp.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lit=
e-gemmlowp.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-ruy/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy=
.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy=
.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2s=
se-since-this-is-only-useful-on-x8.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0002-Added-option-to-bu=
ild-a-shared-library-instead-of-st.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0003-Added-option-to-bu=
ild-tflite-with-external-delegates.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0004-Removed-source-rep=
ositories-and-git-pull-configurati.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk=0A=
> > >=0A=
> > > --=0A=
> > > 2.36.1=0A=
> > >=0A=
> > > _______________________________________________=0A=
> > > buildroot mailing list=0A=
> > > buildroot@buildroot.org=0A=
> > > https://lists.buildroot.org/mailman/listinfo/buildroot=0A=
>=0A=
>=0A=
> From: James Hilliard <james.hilliard1@gmail.com>=0A=
> Sent: Friday, November 25, 2022 17:16=0A=
> To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
> Cc: buildroot <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzo=
ni@bootlin.com>=0A=
> Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package=
=0A=
>=0A=
> On Fri, Nov 25, 2022 at 5:07 AM Hager Stefan <Stefan.Hager@ginzinger.com>=
 wrote:=0A=
> >=0A=
> > Hi James!=0A=
> >=0A=
> > Tanks for your Feedback!=0A=
> >=0A=
> > Yes TFlite 2.8.0 is not the "latest" Release.=0A=
> >=0A=
> > I'm absolutly with you that using special Versions is a bad idea in gen=
eral.=0A=
> > On the other hand, it was my fear that it may be difficult to prove tha=
t everything works properly with newer Libs even if the build succeeds.=0A=
> > It was hard work for me get it running and I was happy that everything =
works even with the known limitations. But i learned a lot ; )=0A=
>=0A=
> It seems to build fine with normal libraries and without all the=0A=
> manual copy hacks:=0A=
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D330091&subm=
itter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D=0A=
>=0A=
> See if that works for you, I refactored your patchset and it seems to=0A=
> build without=0A=
> issues now using system libraries.=0A=
>=0A=
> I also uploaded that series to my personal github if that's easier for=0A=
> you to test:=0A=
> https://github.com/jameshilliard/buildroot/tree/tensorflow-lite=0A=
>=0A=
> >=0A=
> > Maybe it is the best to bump to Version 2.11.0 and they try it again wi=
th buildroot's own packages where they exist.=0A=
> > But this will take some time, maybe next year for the 23.04 Release.=0A=
>=0A=
> I bumped it to 2.11.0 and fixed the build issues I ran into:=0A=
> https://patchwork.ozlabs.org/project/buildroot/patch/20221125160724.17254=
76-8-james.hilliard1@gmail.com/=0A=
>=0A=
> >=0A=
> > And next time i need to add the [Buildroot] tag to the subject so my ma=
il sorting rule will work for my own mails...=0A=
>=0A=
> I think you also accidentally dropped the mailing list from your reply as=
 well.=0A=
>=0A=
> >=0A=
> > Best Regards=0A=
> > Stefan=0A=
> >=0A=
> >=0A=
> >=0A=
> >=0A=
> > From: James Hilliard <james.hilliard1@gmail.com>=0A=
> > Sent: Thursday, November 24, 2022 15:54=0A=
> > To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
> > Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni=
 <thomas.petazzoni@bootlin.com>=0A=
> > Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package=
=0A=
> >=0A=
> > On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager=0A=
> > <stefan.hager@ginzinger.com> wrote:=0A=
> > >=0A=
> > > Hello,=0A=
> > >=0A=
> > > this RFC patch series proposes a way to integrate the Tensorflow-lite=
 runtime (TFLite) into Buildroot.=0A=
> > >=0A=
> > > This first RFC just integrates the TFLite C++ sahred library.=0A=
> > > After a sucessful first integration the next step wuld be to activate=
 the python library for TFlite.=0A=
> > > As a third step i plan to integrate the NPU Backend Driver for TFLite=
 to use accelerated inference on the i.MX8MP NPU (neural processing unit) f=
or C++ an Python.=0A=
> > > All of this currently works locally as a proof of concept for a few u=
sers.=0A=
> > >=0A=
> > > The currently used Version of TFLite is 2.8.0 (official) which is pro=
ven to work.=0A=
> >=0A=
> > This is an outdated release right? Are there issues with 2.11.0?=0A=
> >=0A=
> > >=0A=
> > > TFlite comes with a bunch of external source dependencies which are d=
ownloaded by separate hidden packages and then built by the main TFLite pac=
kage.=0A=
> > > TFLite needs its own versions of libabseil, eigen and flatbuffers wic=
h may conflict with the Versions provided by Buildroot.=0A=
> >=0A=
> > I'm unable to find any documentation indicating this is actually the ca=
se.=0A=
> >=0A=
> > I skimmed the cmakelists and it doesn't seem to have strict version=0A=
> > requirements:=0A=
> > https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/C=
MakeLists.txt=0A=
> >=0A=
> > Have you tried building against the normal buildroot versions of these =
packages?=0A=
> >=0A=
> > > Since i can not gurantee that TFlite will work with other Versions of=
 this packages i decided to only let TFlite be activated if this packages a=
re not activated in Buildroot.=0A=
> >=0A=
> > This is probably not the right approach, other packages may depend on=
=0A=
> > or select the normal versions(flatbuffers seems especially problematic)=
.=0A=
> >=0A=
> > >=0A=
> > > Currently TFlite only supports a limited set of processor architectur=
es (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-=
bit Support).=0A=
> > > Anyone else may activate further platforms if needed, but testing nee=
ds to then be done by them.=0A=
> > >=0A=
> > > How to build a minimal config with TFLite:=0A=
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> > > $ make raspberrypi4_64_defconfig menuconfig=0A=
> > > Activate TFLite in menuconfig: Target packages -> Libraries -> [*] te=
nsorflow-lite=0A=
> > > $ make tensorflow-lite=0A=
> > >=0A=
> > > I'm hoping for Comments to prepare a first patchset.=0A=
> > >=0A=
> > > Stefan Hager (10):=0A=
> > >=A0=A0 tensorflow-lite-abseil-cpp: new package=0A=
> > >=A0=A0 tensorflow-lite-clog: new package=0A=
> > >=A0=A0 tensorflow-lite-abseil-cpuinfo: new package=0A=
> > >=A0=A0 tensorflow-lite-eigen: new package=0A=
> > >=A0=A0 tensorflow-lite-farmhash: new package=0A=
> > >=A0=A0 tensorflow-lite-fft2d: new package=0A=
> > >=A0=A0 tensorflow-lite-flatbuffers: new package=0A=
> > >=A0=A0 tensorflow-lite-gemmlowp: new package=0A=
> > >=A0=A0 tensorflow-lite-ruy: new package=0A=
> > >=A0=A0 tensorflow-lite: new package=0A=
> > >=0A=
> > >=A0 package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +=0A=
> > >=A0 package/tensorflow-lite-abseil-cpp/Config.in=A0 |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-abseil-cpp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-abseil-cpp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-clog/Config.in=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-clog.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-clog.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-cpuinfo/Config.in=A0=A0=A0=A0 |=A0=A0 5 +=
=0A=
> > >=A0 .../tensorflow-lite-cpuinfo.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-cpuinfo.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-eigen/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 =
5 +=0A=
> > >=A0 .../tensorflow-lite-eigen.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 9 +=0A=
> > >=A0 .../tensorflow-lite-eigen.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-farmhash/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-farmhash.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-farmhash.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-fft2d/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 =
5 +=0A=
> > >=A0 .../tensorflow-lite-fft2d.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-fft2d.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 15 ++=0A=
> > >=A0 package/tensorflow-lite-flatbuffers/Config.in |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-flatbuffers.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-flatbuffers.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-gemmlowp/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-gemmlowp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-gemmlowp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 package/tensorflow-lite-ruy/Config.in=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 5 +=0A=
> > >=A0 .../tensorflow-lite-ruy.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 3 +=0A=
> > >=A0 .../tensorflow-lite-ruy.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> > >=A0 ...2sse-since-this-is-only-useful-on-x8.patch |=A0 34 +++=0A=
> > >=A0 ...build-a-shared-library-instead-of-st.patch |=A0 55 +++++=0A=
> > >=A0 ...build-tflite-with-external-delegates.patch |=A0 59 +++++=0A=
> > >=A0 ...epositories-and-git-pull-configurati.patch | 203 ++++++++++++++=
+=0A=
> > >=A0 package/tensorflow-lite/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 56 +++++=0A=
> > >=A0 package/tensorflow-lite/tensorflow-lite.hash=A0 |=A0=A0 3 +=0A=
> > >=A0 package/tensorflow-lite/tensorflow-lite.mk=A0=A0=A0 | 232 ++++++++=
++++++++++=0A=
> > >=A0 35 files changed, 848 insertions(+)=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-l=
ite-abseil-cpp.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-l=
ite-abseil-cpp.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-clog/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-cl=
og.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-cl=
og.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite=
-cpuinfo.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite=
-cpuinfo.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-eigen/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-e=
igen.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-e=
igen.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-farmhash/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lit=
e-farmhash.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lit=
e-farmhash.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-fft2d/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-f=
ft2d.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-f=
ft2d.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/Config.in=
=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-=
lite-flatbuffers.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-=
lite-flatbuffers.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lit=
e-gemmlowp.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lit=
e-gemmlowp.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-ruy/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy=
.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy=
.mk=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2s=
se-since-this-is-only-useful-on-x8.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0002-Added-option-to-bu=
ild-a-shared-library-instead-of-st.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0003-Added-option-to-bu=
ild-tflite-with-external-delegates.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/0004-Removed-source-rep=
ositories-and-git-pull-configurati.patch=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/Config.in=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash=0A=
> > >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk=0A=
> > >=0A=
> > > --=0A=
> > > 2.36.1=0A=
> > >=0A=
> > > _______________________________________________=0A=
> > > buildroot mailing list=0A=
> > > buildroot@buildroot.org=0A=
> > > https://lists.buildroot.org/mailman/listinfo/buildroot=

------4C8A12359D02EEFDA8837DFBB342CCCA
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
BTEPFw0yMjExMzAwNjQzMTRaMC8GCSqGSIb3DQEJBDEiBCAk/dpEhOmbWaF5rHCs
oKXr7JTlsmoald8HPkUr8Oin9TB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYAiiF91F5fYSRZANG3PsZKR0OjkTgsskIilNKe/Ezps
Gt+byPrLuI691YcjyBI6ZBd5UFwu7Hn5Ku6OdunCq1ATC/+8JTXrBZHunG9m9FJM
VX9y4VKIWeizXd0mIXUv9Z/wkkEl14D0BRTGNb22wtQAdi2dvOQ/YiMuTnzhM5Hg
VzBz1gCiraO/YXH4JhlL75nkSNgCWqci2sbbCs90AwAnA95a3GJMdW9nIpfdnMaX
qDvff9oDa5Q6C1tsfcDWklA5NoUZBRmy4mtkYfmJZOa8qKloPSDed+3cprVf8l3c
Rm1Y6NzBzxjY5I3ltS0yB8MQvERxm1gNjjTvUIZJJ1xALJVMeszDIRl7LbDOcpG0
KCZM3JV+78WbJ2hMKGPBEeO+XSaDatrOYEKvtN32e9jjWPj3N1n973iN5V2idkvR
txO41B35ksJGA3gzBOj79iN8PEIJzY93pppwX8/TAiT+GfuYS/Ef5pQjyoH2fQ7f
UFBBZPC/44w1uQA7s2UyQ5U=

------4C8A12359D02EEFDA8837DFBB342CCCA--


--===============5985076219203648022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5985076219203648022==--

