Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E768C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 15:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D891381CE1;
	Mon,  1 Aug 2022 15:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D891381CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pl1BHVhDkoGc; Mon,  1 Aug 2022 15:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71D1881497;
	Mon,  1 Aug 2022 15:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71D1881497
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4BF1BF343
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47005403FF
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47005403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqtQyS72UY1R for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 15:37:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBF3340393
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBF3340393
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 15:37:49 +0000 (UTC)
Received: from mail-he1eur04lp2059.outbound.protection.outlook.com
 ([104.47.13.59]:1464 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <Henri.Roosen@ginzinger.com>)
 id 1oIXUG-00081y-11; Mon, 01 Aug 2022 17:37:44 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000, 
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_BASE64 0.000000, HDR_COMMON_LOWERCASE 0.000000, HTML_00_01 0.050000,
 HTML_00_10 0.050000, IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
 MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000, NO_CTA_FOUND 0.000000,
 NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000,
 NO_URI_HTTPS 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, __ARCAUTH_DKIM_NONE 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_CV_FAIL 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __AUTH_RES_ORIG_DKIM_NONE 0.000000, __AUTH_RES_ORIG_DMARC_NONE 0.000000,
 __BODY_NO_MAILTO 0.000000, __BOUNCE_CHALLENGE_SUBJ 0.000000,
 __BOUNCE_NDR_SUBJ_EXEMPT 0.000000, __BULK_NEGATE 0.000000,
 __CC_NAME 0.000000, __CT 0.000000, __CTE 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FORWARDED_MSG 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000,
 __LINES_OF_YELLING 0.000000, __MAIL_CHAIN 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __PHISH_SPEAR_SUBJ_ALERT 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NO_NAME 0.000000, __URI_NO_MAILTO 0.000000, __USER_AGENT 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2022.8.1.145717
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=JRzwut6SOrFE9PfJLo2KDbubyRFhjZLa9rZ2bt8siw1eZ/taLXZx581CzUwAEyUM4dBJR0KAmFRZWS0fji61UFbkvhs6n1PX8g/QyNNL7xPwmZHqCrATzj9xS1uymYI8w+xh0mgYPn7wU0TXRaUg8JWeacQYBdwl9XPrXJVRQvKlW2/8815/9YeK+sSXEgRc9M9OeePpr9nCzi/Fcwm+InB5/bdUbUCp4IoTnCdKyRqUzLCxqOshujPs0mCav1Bq84gIC1ZpS8j/fIlF5UwmgMGD0bQeWVSQpbhzOr2PMHE20Cj+bx7JPuZwxiBvFLUCpyoqXm1C6WViOfNdv6RCUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pohqs+Fv4if+Hay6e2U76Er7RWLlfX7y//BPT5nUA6E=;
 b=S4mmEosIN+y6lckaiKga1Oqo3kov2qREBLhrjBOwRnKxaXcXgO0X/9KGBr2Rh3esP3Uu8Jw4VYntHao3mnu/VQPkmAdaQfWifoaAuymLFwnziW8j/58O6p8LvvpDu2fbhhab3E5txv6PLc5He/BBvqbwUvyBaVHLevrJFH2BKc8YrevqhnQ0+GlRMJ2ZXcn7lnjtcoFeCPAcCzVN3jLrAPBamMgQ5FeKCL5abGieYV6+emyfl9CsYJylB6L1/obGo1vtXHjxaWfje5tyEng6wxWpC1Rhc7j6Sd79dUmFEwYpVC1uCA+YtQeljSeQTwkPbSfvcRb6fdXJlisttZJZUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=free.fr smtp.mailfrom=ginzinger.com;
 dmarc=bestguesspass action=none header.from=ginzinger.com; dkim=none (message
 not signed); arc=fail (48)
Received: from AS8P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::13)
 by VI1PR0601MB2045.eurprd06.prod.outlook.com (2603:10a6:800:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 15:37:41 +0000
Received: from VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::88) by AS8P250CA0008.outlook.office365.com
 (2603:10a6:20b:330::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Mon, 1 Aug 2022 15:37:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 VI1EUR05FT013.mail.protection.outlook.com (10.233.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Mon, 1 Aug 2022 15:37:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (104.47.9.53) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 01 Aug 2022 15:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj2DjdyjVdc1xioFQKkUUtwc7NlOHKaEteJN48RdBN5YpO+/a3fcXwqexdYTFxhvo45I1py4qldolMH01zKckETxxflGufkxiHE504v0nX8qDq62sh26SHsLyX/pnTuMhL5dj6aMHZcbERaKOWnOC/1OsVMtNR3JoigigAH2WX3OVvnnGTUAVXpkOEtbiKntEeTE/Bl9WHWQFbwcrkEnU9v1yLqs+BY1NXCNK9QJaPBi8+Ra4/fJ/X9Drod0HkivyQfN1M0tkbaE8tF+TGxB0v2uO6NztZss81ZlJuVX8VtxSM4H+Ldc7oxdC8LB9+5HbO+vx6pLv0Nv6NiBW6lq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pohqs+Fv4if+Hay6e2U76Er7RWLlfX7y//BPT5nUA6E=;
 b=jYAtw8TpOVW+fUnbvJolMCnrvb9iuGwqzkHKREbjzI8hpvlILBsWpHaGxceYDimKC5k5xqcnFyU+h+jw/Cq3WiMRbdWzmvJqUJAHVL5LCxbwSG+tS+D5TAOC7M8pYwJ7TaJ9AvVgHrJkMv13HQIX50T1ySSTN1KFPrhqGrxfNlX2bS61AxMaWwz+yT0z9Lq8q2A+mAf1MqgZHNkv3lA8R7nzG/VDaTIUVt2/ZIyla4hJqkROQiMW76LynfOCckR6hoME6TC0ymexXzRzKSVINVBOyepnrYT64hypNFrWC3nW5NCl/N0sD0aB6ZJ81QuS+n76Rp7cpnszhvTK+MkcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM9PR06MB8130.eurprd06.prod.outlook.com (2603:10a6:20b:3a0::20)
 by AM0PR06MB6515.eurprd06.prod.outlook.com (2603:10a6:208:1a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 15:37:37 +0000
Received: from AM9PR06MB8130.eurprd06.prod.outlook.com
 ([fe80::9d05:a177:10c7:7cfa]) by AM9PR06MB8130.eurprd06.prod.outlook.com
 ([fe80::9d05:a177:10c7:7cfa%9]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 15:37:37 +0000
From: Roosen Henri <Henri.Roosen@ginzinger.com>
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Index: AQHYo5UWpQaUuDUFD0+DnJDpJMP2aa2W1jCAgAM6GQCAABRBAIAAC3uAgAACEAA=
Date: Mon, 1 Aug 2022 15:37:37 +0000
Message-ID: <5364150f8362b0f0bf30ec8560fb5427e7470192.camel@ginzinger.com>
References: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
 <20220730121955.GS3168@scaer>
 <c25e9cda-9f84-6049-fc24-a8f442d8455e@theobroma-systems.com>
 <57a89f2ad4d1ffe52344135368be359347d600ac.camel@ginzinger.com>
 <20220801153013.GC3168@scaer>
In-Reply-To: <20220801153013.GC3168@scaer>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
X-MS-Office365-Filtering-Correlation-Id: c4a70e43-dc51-4875-8bea-08da73d3c52c
x-ms-traffictypediagnostic: AM0PR06MB6515:EE_|VI1EUR05FT013:EE_|VI1PR0601MB2045:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Bh0zHxBrM11fkkD6gsprSZRZqKUvMTQhJAVwxuXW7WDoMvlECQnguyUunVfvkps52QjnSPbQmpoeSWCPF7xsuMqA/m9DoMqQNJB2KpbFR6L3C9VmOrNfB3+vbgxKHhgFlIw40bOoXln7+ZyuDKRpc4icqI4aQY1Zf97Z8JKlkOL+euBhrBbjj+o8Ni3bvfBbkjwdz32P77C4xCv8J7I576cMr+suAYpVSp/YPVHH2Du0g31him60idF44wgZB9fkXQDOYYW8dGDrsy4tTzKhnNx9hnrGdkmMdpRvS4iKwjRlf2eX2Q9ta8CHPDSINwCy9Q6VmtH1fE6qLiz/Z9nLgpQgYXaa9iCX6zFlRgBf/2YDea7Wbu5oS1bw87V8NZMDO8dwF417xti6CP33hLhpfRzesAlZ76ol2o4TMvCFNnTHOzDQC1WQbWOWFTksb2jfMZLjckzoF7MQK1RsDw832jNsngg9dywLHMKfJO4auO1/vL+VdjwwD+wqPqip9fv9+Tum+nWP6Q9fDvN1z3Gk+ll0E0pzuy/MArX8bsaw8CfiabBJOQQz9NDUdfQeJOp0a3PUX3ZDWs4ctjNR7+ZoKR8c/2QoZ1ypXWr9lmn3QxTeRs8Iu1WFxEpkEoMI6+fPF1K5zcOgtEKtwmefoF/UxVsrGF89vJQIrPTi/AaDGPQlHztkryRacXHl/CCTL9ZjNjk5owQ6HM8IhCwKkOg4jrTCzWGvSXVoeD7JICxzf7Mrs0rYjPIgjD4vrXbU67joToCDilnS2xMdc8L/cQqFZ2cDzRZBNqeRjRlgvqdD8h6KGZ2uspnBmG9ugsD0XhhVWI0N4wULPa2sp+3PP3FJJA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR06MB8130.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39840400004)(346002)(396003)(376002)(366004)(186003)(66446008)(6506007)(66476007)(76116006)(38100700002)(91956017)(66946007)(6916009)(8676002)(41300700001)(2616005)(64756008)(4326008)(66556008)(6512007)(53546011)(36756003)(2906002)(6486002)(316002)(478600001)(122000001)(71200400001)(86362001)(5660300002)(54906003)(38070700005)(8936002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6515
X-CodeTwo-MessageID: 24de9316-0c42-43ca-9aa2-d551c71de1c7.20220801153739@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b36f6403-2a43-4398-6756-08da73d3c335
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/Jx6sUIzcggjQ5PRqyNxyB0G4aEOpEVo7Gj2ncFyFIznTdVrdnwW2gf1ozI7Vx2jiN4n/IzOE9V/g+ZhatkQLCaxl1PtZv5zFOlwHAAy+kFrIw1K6YDX/5+NuerAnM8B4jq5kh1rV1NHocnm5AUmmipbhbbQBv3n6zyRDIRZVmVJZqZNNIxBNA3CkzweKFoqZ47rLxpGqugsEtuaf/87VJgrJXbFT406ZUKM1lzgP0Gqk3zLwUcTQhOSEDupIgqQe7WTOXGvvIiEPR1AGuN8y5RA6lRz5fNaabbUPtLHS1e/RuBaTXIH+hwBJeml5ypLCUnJMuQZywDqm9umXlWt8f5AWSkvfPz0OQlCNySC970Z5YvLGBbR14Te32WbOxFouAnmGOQvyLgIpbrYRVYfcAxcPlDmu6m90MqTrRZQmB4Xo7x+4Ae++zLUP4eq8tyeuz715v8W+fPekfByvd/G/Nt7j/IY7Hqz6MzxTRrOP+nClnHiNSGTsBLHlykios24vW/9VinpowBcRZ7D4DkhB8yQgKaJ/OGnvADyVgC14OWnWOFJ7fAehJt9sg+l1BdwMr5k656w5xvj7oYZfPKlnwOgvieONn1F2AEF8yKpBbniOp5bFy4BUZzd59lHQzti9zEP4zg5UT1vGwWFNg16eJO21LvKafBaAjQLp9eYmSzS8d0YJ6qkDme2xTYHsFBFKUxMYqRPxnICDfswfGPRXNKXnds4xdEeoXEiSXgXelWIhJI/IQ/udmmq2C+t0vMo9OURZ4428YsocDocFTA8lcYvwAGIWAEnovPkNnJOXXmaj8NQHtdW5hikIFx8cUyo2dk9huuIpHXe79UYAEBAl2r0MDFn3vrsDukhfQXeN8=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230016)(4636009)(39830400003)(136003)(396003)(376002)(346002)(46966006)(36840700001)(41300700001)(6506007)(186003)(53546011)(47076005)(336012)(6512007)(26005)(2616005)(7596003)(8936002)(7636003)(36860700001)(5660300002)(356005)(2906002)(40480700001)(82310400005)(36756003)(86362001)(478600001)(6486002)(8676002)(4326008)(70586007)(70206006)(54906003)(316002)(6916009)(41080700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 15:37:40.8577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a70e43-dc51-4875-8bea-08da73d3c52c
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2045
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
Cc: "quentin.schulz@theobroma-systems.com"
 <quentin.schulz@theobroma-systems.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0326742617513023005=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============0326742617513023005==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----42194F6DC42E2721BF5D857BEBC9E64B"

This is an S/MIME signed message

------42194F6DC42E2721BF5D857BEBC9E64B
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0F95B954F3BB94198FECA0703D2F242@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgWWFubiwNCg0KT24gTW9uLCAyMDIyLTA4LTAxIGF0IDE3OjMwICswMjAwLCBZYW5uIEUuIE1P
UklOIHdyb3RlOg0KPiBIZW5yaSwgUXVlbnRpbiwgQWxsLA0KPiANCj4gT24gMjAyMi0wOC0wMSAx
NDo0OSArMDAwMCwgUm9vc2VuIEhlbnJpIHNwYWtlIHRodXNseToNCj4gPiBPbiBNb24sIDIwMjIt
MDgtMDEgYXQgMTU6MzYgKzAyMDAsIFF1ZW50aW4gU2NodWx6IHdyb3RlOg0KPiA+ID4gT24gNy8z
MC8yMiAxNDoxOSwgWWFubiBFLiBNT1JJTiB3cm90ZToNCj4gPiA+ID4gT24gMjAyMi0wNy0yOSAy
MTo0OSArMDAwMCwgUm9vc2VuIEhlbnJpIHNwYWtlIHRodXNseToNCj4gPiA+ID4gPiBBcyB0aGUg
cm9vdCBjYXVzZSBzZWVtcyB0aGUgJ2ZpbHRlcicgY29tbWFuZCBjYW5ub3QgaGFuZGxlDQo+ID4g
PiA+ID4gbGFyZ2UNCj4gPiA+ID4gPiBjaHVua3Mgb2YgZGF0YSwgbGlrZSAuVkFSSUFCTEVTLCB3
ZSBjYW4gd29ya2Fyb3VuZCB0aGUNCj4gPiA+ID4gPiBwcm9ibGVtIGJ5DQo+ID4gPiA+ID4gdXNp
bmcgYSBmb3JlYWNoIGNvbW1hbmQgb3ZlciAuVkFSSUFCTEVTLCB0aGVuIHVzZSB0aGUgZmlsdGVy
DQo+ID4gPiA+ID4gY29tbWFuZC4NCj4gPiA+IEp1c3QgYSBoZWFkcy11cCB0aGF0IGBtYWtlIHBy
aW50dmFyc2AgaXMgYnJva2VuIChJJ3ZlIHNlbnQgYQ0KPiA+ID4gcGF0Y2gNCj4gPiA+IGZvciAN
Cj4gPiA+IGl0IGp1c3Qgbm93KSBhbmQgYWxzbyB0aGF0IEkgZ2V0IGEgc2VnZmF1bHQgZm9yIGBt
YWtlIHNob3ctdmFyc2ANCj4gPiA+IChgbWFrZSANCj4gPiA+IHNob3ctdmFycyBWQVJTPSJCVVNZ
Qk9YXyUiIHdvcmtzIGp1c3QgZmluZSkuDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGUgaGVhZHMt
dXAhIEkgY2FuIHJlcHJvZHVjZSB5b3VyIHRlc3RzLXJlc3VsdHMuDQo+ID4gDQo+ID4gSSBtYWRl
IHRoZSB3b3JrYXJvdW5kIHRvIGdldCB0aGUgJ21ha2UgcGtnLXN0YXRzJyBmdW5jdGlvbmFsaXR5
IHVwDQo+ID4gYW5kDQo+ID4gcnVubmluZyBhZ2FpbiBvbiByZWNlbnQgc3lzdGVtcyB3aXRoIG1h
a2UgNC4zLiBTbyBJIGRpZCBteSB0ZXN0aW5nDQo+ID4gZm9yDQo+ID4gJ21ha2UgcHJpbnR2YXJz
JyBhbmQgJ21ha2Ugc2hvdy12YXJzJyB3aXRoIHRoZSBWQVJTIHZhcmlhYmxlIHNldA0KPiA+IHRv
Og0KPiA+IA0KPiA+ICJWQVJTPSVfTElDRU5TRSAlX0xJQ0VOU0VfRklMRVMgJV9WRVJTSU9OICVf
SUdOT1JFX0NWRVMgJV9DUEVfSUQiDQo+ID4gDQo+ID4gU29ycnkgSSBtaXNzZWQgdGVzdGluZyB0
aGUgZW1wdHkgVkFSUyAoPWFsbCkuDQo+ID4gDQo+ID4gV2UgbWlnaHQgcmV2ZXJ0IHRoZSB3b3Jr
YXJvdW5kIGZvciAnc2hvdy12YXJzJyBhbmQgaW5zdGFsbCB0aGUgbWFrZQ0KPiA+IDQuMw0KPiA+
IGNoZWNrIGFnYWluLiBGb3IgJ3ByaW50dmFycycgd2UgbWlnaHQga2VlcCB0aGUgd29ya2Fyb3Vu
ZCwgYXMgdW50aWwNCj4gPiBub3cNCj4gPiBubyBzZWdmYXVsdCBjb3VsZCBiZSByZXByb2R1Y2Vk
IGFuZCBJIHRoaW5rIHRoZSAncGtnLXN0YXRzJw0KPiA+IGZ1bmN0aW9uYWxpdHkgaXMgYSBuaWNl
IHRvIGhhdmUuDQo+ID4gDQo+ID4gV2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiBZZXMsIHBsZWFz
ZSBwYXJ0aWFsbHkgcmV2ZXJ0IHRoZSBjaGFuZ2UgdG8gcHJvdGVjdCBqdXN0IHNob3ctdmFycywg
c28NCj4gdGhhdCB0aGUgYXV0b2J1aWxkZXJzIGFuZCBwbGctc3RhdHMgYXJlIHN0aWxsIGhhcHB5
IHdpdGggcHJpbnR2YXJzLg0KDQpPci4uIHdlIG1pZ2h0IGJlIGFibGUgdG8gZml4IHNob3ctdmFy
czsgSSBndWVzcyB0aGUgcm9vdC1jYXVzZSBpcyB0aGUNCmZpcnN0ICQoaW5mbyAuLi4pLiAgSWYg
d2Ugd291bGQgYmUgYWJsZSB0byBicmluZyBpdCBpbnRvIHRoZSAkKGZvcmVhY2gNClYgLi4uKS4u
DQoNCj4gDQo+IFRoYW5rcyENCj4gDQo+IFJlZ2FyZHMsDQo+IFlhbm4gRS4gTU9SSU4uDQo+IA0K
DQo=

------42194F6DC42E2721BF5D857BEBC9E64B
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
KoZIhvcNAQkFMQ8XDTIyMDgwMTE1Mzc0N1owLwYJKoZIhvcNAQkEMSIEIGm/UOkL
AG5+YKYifDfd4b9Qi0rZyX7alaNqNro59urqMHkGCSqGSIb3DQEJDzFsMGowCwYJ
YIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBADYQNYaADH1NJieyet+tps+ufm7YsQHZ
7Wuw0ufR7PBWWGYdpaDW2QcAG6w79UMcLgVdAZLPAfgN3cvkoG/IafyqGMqnzUWO
e7UqKFPxZDT30E3ifUZwVTLgzKIKO7hJ4D0wOEIWdBBtkMacQJNpTLj2lwI/Ag3i
IHz+MN8P2C9Ioain0XVpzw4e6G8XXNa1+RqoQNTgdbFvnNGJBJmNwIFAxduFdaR7
V8b85ixL7afNBSuXYcmRjwcJdRHo5T2kkAlK2VrJM9tBHrn6c7XuZi1mV/3/MTUM
dglo+IW5DLR5lFdcErSxdB7OXch70VMVmhlGmyShilrkkRFICPdeSO4=

------42194F6DC42E2721BF5D857BEBC9E64B--


--===============0326742617513023005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0326742617513023005==--

