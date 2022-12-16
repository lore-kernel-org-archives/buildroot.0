Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE65C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 17:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C54960709;
	Fri, 16 Dec 2022 17:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C54960709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkwrIbzZOeIM; Fri, 16 Dec 2022 17:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9268860BA1;
	Fri, 16 Dec 2022 17:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9268860BA1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7BA1BF2CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A128222F
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 17:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A128222F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCny371VoWG8 for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 17:17:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1EEB82228
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1EEB82228
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 17:17:03 +0000 (UTC)
Received: from mail-vi1eur04lp2056.outbound.protection.outlook.com
 ([104.47.14.56]:48078 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1p6EKI-0001tC-37;
 Fri, 16 Dec 2022 18:16:51 +0100
Received: from AM5PR0601CA0043.eurprd06.prod.outlook.com
 (2603:10a6:203:68::29) by AS4PR06MB8448.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 17:16:48 +0000
Received: from VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::45) by AM5PR0601CA0043.outlook.office365.com
 (2603:10a6:203:68::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Fri, 16 Dec 2022 17:16:48 +0000
X-SASI-Hits: BODY_SIZE_3000_3999 0.000000, BODY_SIZE_5000_LESS 0.000000,
 BODY_SIZE_7000_LESS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IN_REP_TO 0.000000,
 IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000, LINES_OF_YELLING_3 0.050000,
 MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SINGLE_URI_IN_BODY 0.000000, SUSP_DH_NEG 0.000000,
 URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
 __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000,
 __CP_URI_IN_BODY 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FILESHARE_PHRASE 0.000000,
 __FRAUD_BODY_WEBMAIL 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FRAUD_WEBMAIL 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HTTPS_URI 0.000000, __IN_REP_TO 0.000000, __LINES_OF_YELLING 0.000000,
 __MAIL_CHAIN 0.000000, __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000,
 __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SINGLE_URI_TEXT 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
 __TO_REAL_NAMES 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000,
 __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
 __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.1, AntispamData: 2022.12.16.163917
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 VI1EUR05FT025.mail.protection.outlook.com (10.233.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16 via Frontend Transport; Fri, 16 Dec 2022 17:16:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.109)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Fri, 16 Dec 2022 17:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js83IjqgoQU3yzEf/T/RahfimChNxx6bR/1vO0HeEj8ZY/kNJmQpZS6VrC45y6eKq2js/5KcqaoqC9p55Vi2pekytkw8AM/wB//Tgz73esC67+DFy47h1QHS70xYTidnjbwTZfzfQBpkIo3DTHlCTmkZEGAi6JOtLHo4PvJRv2wVt7DJx+K1AK339R34ypuuUGovBTma5uBoFSuTye93jjBthCBaRYEP4nRjNEog1IiBd14wnCHqcfxQ4bCXFBXGcBW5QOoPNqr58+QAYcWqcjbFktENogBZgoql25bSpLKcic1KQmzBjceyxay86wB3bMjByiKWOjFGi4veGSNDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q3ZGkCNGJ6o0qBTbBNSJYHbXGuqYwbu0ZoUJDnhQDE=;
 b=QQUqNeBXaODUpTk9V5xWjX/rD5BGe5nfS8lD3S4SSC9QzljPd2k/Bz2bsMMCq+/O/xw1UQY7TtqnasQJeKOzcv3rs13N4tJR/HJkOBR6OwR/7WvSSYyZEWdjZXuiZXW2r7cNI/fQJA+ErVZpw+R04R5NlDBUe3NHSFMrjecyfnB8EGfJoeHog3kZNkbPoVyJS4rylVz1LdoYEazSnulbBHlvhQRkXNVdyduJ6oKdEXYRN7sRkIk5hfbxKC+cBoWiaQNSi2DLi0vti/hW4ytwkOyVTHV2DTljfbU61lIJTJb1QphmeGlcf49OR8ILtqYu0B3C86azbFNvC9Z0Kh5vPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM0PR06MB4067.eurprd06.prod.outlook.com (2603:10a6:208:b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 17:16:46 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:16:45 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZA1MdHl6Y+zP8oE2PT3ae18giVq5w3Sf8
Date: Fri, 16 Dec 2022 17:16:45 +0000
Message-ID: <AM5PR06MB3153480322FA9974E9AA5F9384E69@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-7-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-7-james.hilliard1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|AM0PR06MB4067:EE_|VI1EUR05FT025:EE_|AS4PR06MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 14030d30-8be5-471e-1761-08dadf8950ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tHwlWgjrtgxZBuDq/msxRifasVO9NUhy/FEGr94dHyNye49pJeZyC/uYrXULNHxH3j6uP33Z4BhIi3HQ9vbcfeqlTTjWAjIfhiNageKsoTREu8is95Zly4GOFDNelEsdVGbsKZi6ZvVLcdWNna5MEhZoYZKamDKcBwKJ/Sl7RtIZMI9E9a6ea0fDoYSm5stb34jNGIu62ziOXhbTpH0PTloOq0scp992wzZBbN22EEMkP4R6/GjLv/+r7YFGxUacrDOHWI/I7BRJx4kjHikxiCPf9U/xcfiN/tveW+zVcIOZPDgRU2S5y/EH+bWoi0PNkY2QU2/bzfNCkJEeTjEGyJVKz2HK9v5mqH+FjIM/bmqQIMz2SoNg/EZTZ+RWLgyRUCU9KLXqH0hrI1du+V/zD44snT7dI+Cjg3ahyNYAGnulmc2kHCwaKUBMKZkj27z7PWu4Yhl+Af5U3nF5qtg2DBKUd0Ahh3xsyTYVvDFdX5MBixD7wAVEgQGDuYFF4bx48Ugp9IsgDiu853jhyP4pzj8koUbpv1wNk3PfbUU0sTatdzhMM7sYpaThJMj7c27/LMV5mWTQL7kI7e6ZEmd1GMEkLU1ot/j5tU/LT59VuQAQ+k+Dyhwm9tllX4SdoAAQIIRO+oJ7UApT8CBkhdwSPfhyDXa0aMSATgu9EOlGkwAOEas5yH4oZ42MgvroI3c1WtcL+Gt++l78KMLYr/sbtPxo00hTyXTXIqhrp2gwwuk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(366004)(396003)(346002)(376002)(451199015)(122000001)(26005)(2906002)(83380400001)(478600001)(38070700005)(966005)(52536014)(86362001)(316002)(41300700001)(5660300002)(8936002)(91956017)(66446008)(66476007)(55016003)(66556008)(38100700002)(6916009)(33656002)(9686003)(76116006)(64756008)(53546011)(54906003)(186003)(66946007)(71200400001)(8676002)(7696005)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4067
X-CodeTwo-MessageID: 8cfe5c45-0bf1-4a2f-a5da-7c680f91d72b.20221216171647@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f279f91f-ef6d-4165-7b58-08dadf894f3c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Anbdj61LpYCoDrq5Z6SIj/G/vSUGX6qudiAN7ZtI1ov4cPUFTSfJdTMZxSzoGfOLA5t5bHRcNfMKvZhP4wCVSZwvCrZoWy0LRO/eHmckaLC/Hh++eD6Eb9R89pmQTj0odcmocjBl8wr1Q23ZkXoTUYg+kE+VHi+SKT6uM7uCB93R7LenOOtMuiseaftXdWC6VIvAtccTFJFi7g3tHwN4oKY5FJocrJi2DrRgsJQOj3h79PDu2hlDrQr+mw9KQo9JADK4RlCRx1x+U/viWkWW69RCxhF2BTaV8qbajkQIzqYQBfa6gS79bqP3sJSmUXcYsJu34QV9D6Yy/nPrfwjGQPHnluv6a1v1kwTP/gWl9GRdWSz4/8ISDKCiaRoCn6mxvkfdpQ7zSvb6FfEZSsWI3vEB9ejjzFGlcX9jWqBnf83EZuSh81H5ChW9MRt5JqJxvHU9Q7f4+bdIojwpDIEMHNmhwtEi6+9v8Z6gAgR9JKCdLTv2QqbHrm2zcbV7kZ2Fx1zY2HOE0zHEl74cjeil5rEksfJF/UH5Lx1xCFAyzJFR2wluX7D2ynlSUHzZt4zL/0osBn8AbrBvZN3wHQkbnKTfDENQZmUXdGy5Xa5tckvm4y2J/UiV2sI6qy2K91NF+fMG05MjEDHT6hg4K0gJ9zUXIvNBbvY9mgd4bue0qujW9T12DINUOqKz/tPdouxbiG07n1RRw0EXrTd8Fiw/Aw==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39840400004)(376002)(136003)(346002)(451199015)(46966006)(36840700001)(26005)(47076005)(41300700001)(186003)(336012)(8936002)(316002)(9686003)(8676002)(52536014)(6916009)(4326008)(70206006)(70586007)(5660300002)(82310400005)(86362001)(36860700001)(7636003)(356005)(7596003)(33656002)(83380400001)(55016003)(40480700001)(2906002)(53546011)(54906003)(6506007)(478600001)(966005)(7696005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:16:48.4137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14030d30-8be5-471e-1761-08dadf8950ce
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8448
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 7/8] package/farmhash: new package
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7827898948414710485=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============7827898948414710485==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----F1A799B30BB0B943352825154459FE7E"

This is an S/MIME signed message

------F1A799B30BB0B943352825154459FE7E
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Acked-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Monday, November 28, 2022 18:58=0A=
To: buildroot@buildroot.org <buildroot@buildroot.org>=0A=
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Fabrice Fontaine <font=
aine.fabrice@gmail.com>; Samuel Martin <s.martin49@gmail.com>; Hager Stefan=
 <Stefan.Hager@ginzinger.com>; James Hilliard <james.hilliard1@gmail.com>=
=0A=
Subject: [PATCH v2 7/8] package/farmhash: new package =0A=
=A0=0A=
From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
=0A=
This package is required by tensorflow-lite.=0A=
=0A=
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
=A0package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +=0A=
=A0package/farmhash/Config.in=A0=A0=A0=A0 |=A0 7 +++++++=0A=
=A0package/farmhash/farmhash.hash |=A0 4 ++++=0A=
=A0package/farmhash/farmhash.mk=A0=A0 | 14 ++++++++++++++=0A=
=A04 files changed, 26 insertions(+)=0A=
=A0create mode 100644 package/farmhash/Config.in=0A=
=A0create mode 100644 package/farmhash/farmhash.hash=0A=
=A0create mode 100644 package/farmhash/farmhash.mk=0A=
=0A=
diff --git a/package/Config.in b/package/Config.in=0A=
index fe636fde9d..a59d074430 100644=0A=
--- a/package/Config.in=0A=
+++ b/package/Config.in=0A=
@@ -1988,6 +1988,7 @@ menu "Other"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/elfutils/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/ell/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/falcosecurity-libs/Config.in"=0A=
+=A0=A0=A0=A0=A0=A0 source "package/farmhash/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/fft2d/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/fftw/Config.in"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/flann/Config.in"=0A=
diff --git a/package/farmhash/Config.in b/package/farmhash/Config.in=0A=
new file mode 100644=0A=
index 0000000000..0ad16f933b=0A=
--- /dev/null=0A=
+++ b/package/farmhash/Config.in=0A=
@@ -0,0 +1,7 @@=0A=
+config BR2_PACKAGE_FARMHASH=0A=
+=A0=A0=A0=A0=A0=A0 bool "farmhash"=0A=
+=A0=A0=A0=A0=A0=A0 depends on BR2_INSTALL_LIBSTDCPP=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 FarmHash, a family of hash functions.=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 https://github.com/google/farmhash=0A=
diff --git a/package/farmhash/farmhash.hash b/package/farmhash/farmhash.has=
h=0A=
new file mode 100644=0A=
index 0000000000..afdfc0f994=0A=
--- /dev/null=0A=
+++ b/package/farmhash/farmhash.hash=0A=
@@ -0,0 +1,4 @@=0A=
+# Locally calculated=0A=
+sha256=A0 18392cf0736e1d62ecbb8d695c31496b6507859e8c75541d7ad0ba092dc52115=
=A0 farmhash-0d859a811870d10f53a594927d0d0b97573ad06d.tar.gz=0A=
+# License files, locally calculated=0A=
+sha256=A0 4162dd091caae234f72d3b57e138174f733e736b2430a4c51b098b17d866fcb6=
=A0 COPYING=0A=
diff --git a/package/farmhash/farmhash.mk b/package/farmhash/farmhash.mk=0A=
new file mode 100644=0A=
index 0000000000..6ab7d1a88b=0A=
--- /dev/null=0A=
+++ b/package/farmhash/farmhash.mk=0A=
@@ -0,0 +1,14 @@=0A=
+##########################################################################=
######=0A=
+#=0A=
+# farmhash=0A=
+#=0A=
+##########################################################################=
######=0A=
+=0A=
+FARMHASH_VERSION =3D 0d859a811870d10f53a594927d0d0b97573ad06d=0A=
+FARMHASH_SITE =3D $(call github,google,farmhash,$(FARMHASH_VERSION))=0A=
+FARMHASH_LICENSE =3D MIT=0A=
+FARMHASH_LICENSE_FILES =3D COPYING=0A=
+FARMHASH_INSTALL_STAGING =3D YES=0A=
+FARMHASH_CONF_ENV +=3D CXXFLAGS=3D"$(TARGET_CXXFLAGS) -std=3Dc++11"=0A=
+=0A=
+$(eval $(autotools-package))=0A=
-- =0A=
2.34.1=0A=

------F1A799B30BB0B943352825154459FE7E
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
BTEPFw0yMjEyMTYxNzE3MDFaMC8GCSqGSIb3DQEJBDEiBCDiuHkzN8MlXH8isrkA
jJfk5/+N+CstNckIVF/1859fHjB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYBv3e1QR36qdrZ2I0bsA41wNsGA1FrD4+/rlp1F4F96
buX2HJqSMhgGl+leMwBSeZZN3PhIn/XHz2VV4pr+GTXlc5B3sUYuojO2aCtooiGc
/KNt8V0vIjYM/sTZ9itJrKUryQ7DmpN/WQ6mHQFkoZZSD3N4f4N0vJ13JDbNx1Zb
hZRgNAxU8T7kc4WWqaMihwKGxpDuxPTwaAXwNnFBxp8S+pM9DQ6rYg7Yb3x3zvl+
T+rJOn3l0qK3cesMRBVuFENHtufOSt6i31+Llt41t7lyhwP5fPoPtYwkbBFT79sX
qxxEPi4A2aGlcWwujp8b1TNcA0gJh6cpVAjqdauQSW1erUdTCw/vRv7qe+I9uRww
85tWjN57wm2gEVw2LlEl4bNHAZT3yz4zgfv4lAZJudVUk9+n8vQW76sfuUnXv2CD
Yn+nVfyRix1/CegzPLsIds8gIbDsofeKC8dwQRD5TVDQmXCS5BLt1MLYtiE+6Qza
+TgP/NyeI0/mBQoESnBYjMI=

------F1A799B30BB0B943352825154459FE7E--


--===============7827898948414710485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7827898948414710485==--

