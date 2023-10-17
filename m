Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEACCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 13:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B8740B05;
	Tue, 17 Oct 2023 13:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B8740B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klBD3jhROBsF; Tue, 17 Oct 2023 13:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAC784138F;
	Tue, 17 Oct 2023 13:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAC784138F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD8E1BF82C
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 633B44138F
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 633B44138F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQ_-WiEuKJic for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 13:53:15 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6630D40B05
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 13:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6630D40B05
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 17 Oct 2023 15:53:12 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 5C670B5ABC
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 15:53:12 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 1D37EB5AAC
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 15:53:12 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Tue, 17 Oct
 2023 15:53:11 +0200
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Tue, 17 Oct 2023 15:53:11 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdFZmWQNqgIDhKPu3pmGZ1QzEBx4qg6/n9cAt69nZMOwBuN6JofslFSiPaCTKwcXT4atrLX58QaIyTV8Wp0+NYgVUtH6sc4t7EAhD97jQSbByo5LhbYPt6iENTxTs2h2rxeOBqj51DiD7S8xO/xcQZFXpRf1Pxu7QQufGadIKDt4zu/0F78mAEOaDPesADbDowzFX3BEy4yCe1ifwzEgyGKpHl62vQWDpGFgsy9S4DK7RbrW1TISzcGK9MQ2mYEEi4Fo3v1lUtdLnDebakohvo9ahUEELJ2zVrNzX+kiy27VRc0Qq8mtvfU+PxHHTIdj9OHJnMskSyygPQ9cjSSKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMG5/pmaC/88jKvtDlxgVgBP3F1N6k8xQ0ur9bgbPIM=;
 b=he8zTHqYN3C2X4LwpOA0tC5zfaeLW+SbYpKU5tBRl6+3wzge6zaPcPOWJXBTLbCro3gMNJaBSH5oD+bGKI8Cw0GcTrZIbY7L4TAp4mgAplPqchDQvyqWONARvjP2F06SdcgiJH3Jw/Bq1Xb7nC4y909biTCYe2iBXgFTRDaMxBTTDFkwlS10zotHRy94Xz0iOVvBQ3aQDjNZvloX9k7/pkW6ntccsDgAg2KwFltAcX/TcWzpqIrBrMvfgVLQdYjgGkUtgdWODiDzm15x0puJUKvhlZ8nJawHV9ic9IhLejklfhBupa0qinTabikWSEbUse3BnHR3JAT5vU2GgqPPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2P250MB0381.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:270::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 13:53:09 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82%7]) with mapi id 15.20.6863.046; Tue, 17 Oct 2023
 13:53:09 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Need help for adding a cargo package
Thread-Index: AdoBAT7UTBseiLlZR5Sw9SK6lOmjXw==
Date: Tue, 17 Oct 2023 13:53:09 +0000
Message-ID: <AS1P250MB0608A1D64A9F21ED90E72429A9D6A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2P250MB0381:EE_
x-ms-office365-filtering-correlation-id: b8ff0f7e-94f0-43e8-bda7-08dbcf18656e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8CgBRfInBbVjP/qV2vCBAGJpzEWF4wz6y+immJcUJgFIWguA7tAmU6vdXHEQ5nXJvFNmP/7MZMsYD2W4lSRmmuW00+Ev9XESbaT7CwB5PrRHtOV835w0Aft9bEghCY48fdmHPTZbB92pEZddnNV2wprxPA3J5dMSK6Z1vK0lNvrJ2aW2hsBRIVi/cTJYNIWLce/43aYzV56gUHUY1jeFfQ3wn+HAJGJgB146Y+AIKScgI86q8lmIEiW3XCyXFk6Hi6GNtRUfdbUq1SFfHXskTU61kQrC4o9Ei9ACtzQcDphkra2a96joxYSDAFsho2wKgLYDEnj+9QUdK8VISyrrUGbMq8Fo8TNXXMB903LHDoEzS/AZEr87uCXL1OnPyRn9ep04rzE4RnKMIHdqS9pTIFTQUc4vKlYI2ZxZjqw7qjyJ1l9DENewFlTeZsPnlyTQlzoLIuUeNLxRAZg/7afdUwtKL+zSiSprJLakw47K9IHz7pahg5mICvyKeZzMA3z1HByWv9IQ/t+BmkgOxZ63Y2YmIYNEB8YCp4p5O8a44eWblBuf5A2ZEX8U9JdUw9TkuTCcDOwQV3t9DV6mGalfqkfXxKB9j8zH0hejRPyz1D4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39840400004)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(7696005)(316002)(55016003)(478600001)(66446008)(66476007)(64756008)(66946007)(76116006)(6916009)(71200400001)(966005)(66556008)(83380400001)(38100700002)(86362001)(9686003)(26005)(41300700001)(6506007)(5660300002)(38070700005)(33656002)(122000001)(8936002)(2906002)(52536014)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AgVDulIK0BzrviRG3VM32YYOQV7SFS3Y38lu27j51wuo6OlcBrVLn5ZoAfi/?=
 =?us-ascii?Q?Lrjd/CxTqiNCItSMCZFkXKnwLmMQYedrzjQ3XImJpX8kemkyWWK52NTtwpbq?=
 =?us-ascii?Q?T/Y++Cf1n0kYx1lA13BtLc3I4bNwkJXfvcLp3ngY2TZWRs552NmZHnuJ6IKk?=
 =?us-ascii?Q?cWgVSqi8GANd98RictJh6D2NLIvamI5jcOJYDupxZ0r9pzJQllcl60M2sUAj?=
 =?us-ascii?Q?J8nkW9LHvmBupRfmgmQq+1Ybu1L1K7NDm0xRkckTRsSpwGgt5FsJoh0VTfyu?=
 =?us-ascii?Q?Q82yV6cBV2S6IS8eln/3b7TxKBKtvXVo4s4gZOzmNcvIf+cItdMfAth0kebr?=
 =?us-ascii?Q?3qsMtFoFVwydfOYDCXLVQv82lV32mUa3nCgPDtKNv2R/9mLG4BfOSmKEDeTj?=
 =?us-ascii?Q?GQom2pajesx8MzhjA5oIGmGzkq2T49/tIwcofPm3PtgnmhAI2gSAQ8hZMap8?=
 =?us-ascii?Q?QXiCNGd3R8Pw1dykie6g7nqbWy+pqIlBWONFUy7jHRnz9kf5RLJZCnPfO8VQ?=
 =?us-ascii?Q?AKVjLYYUq3CV9uLy6UkHWWQGyrvgyW/o3DG6Tr8zlvRRqD3/5mzyiebyexkb?=
 =?us-ascii?Q?oESipnAVzoLajKTxF4muQU8+Y4gUhbwtlFx19P6/rFhQ0M4eWKTsdyT24wYT?=
 =?us-ascii?Q?9OSQQYHvVkDgxVTjVmZ9h9BacjF3u55wQqvj6UAUTPgA7QSy4oi9NHafNxud?=
 =?us-ascii?Q?cBeIdxTNKI4P3rBjzJbBmwtlwh+mNzBkn1KNjzDzoGuqykXulWMVMAW+mvCf?=
 =?us-ascii?Q?h7CLdGPfXhPP5m8aVf8xGwdoExup9RQ/HIMC7Qa28RHHMbvQAu2vnwDe0hNm?=
 =?us-ascii?Q?8rCTPRY+XruP+7ehsQt6haEbaVzrmIP4V06Qg/G0jpMFK/vmeImn98HaIY5G?=
 =?us-ascii?Q?tioPbmCj8FHYTgDt+NADFZQT1w+2PTWGwXV9TK7n04yqMU/tUyypl0pBw6X+?=
 =?us-ascii?Q?jGouU/YSEtnNManoMpdcuq/cQThzvN3Vy9GKiPjs1dVdFVb9D5p3Kfxyjiuu?=
 =?us-ascii?Q?8LS+BQkWQPClfBSs6w3n9lOgQ4ggae0RlcWJv5GNKMtoeAZgA/mmNIcND7ga?=
 =?us-ascii?Q?9IGb/IaMJvbaDq2kiAu/yV4Jz752gFM4NXHShUtYa0laTLmNE0JQaGcK5j+8?=
 =?us-ascii?Q?AaqUVSvuVjmvrP0ZVr8vat8EDQhrsqzaMn7g4rB7o0vt7FXwgZPGtrzDHjTA?=
 =?us-ascii?Q?eFANxmCS7JjeGSGZ1B3rnE/kHbfPveYVTiIg59wdVWBE/YHIR9sytEtofBKq?=
 =?us-ascii?Q?82faWw0DdSKeClxt+fByLp4RLvtqNkUvjFKESe56X0VK57kGuJxu+sPhe5t5?=
 =?us-ascii?Q?2w4E3KSSfWfDy7/9tB8vrsyAY1k1lmy94SqYCUtIPJejK8o4fOBZx4vo1gay?=
 =?us-ascii?Q?4BenMRcXF4oLQNcMR5Q+4dMxIL9tqlGCoM+Xhx1A80ZpgWPhN3fOgjqP9r9L?=
 =?us-ascii?Q?aakk1N8nMokQx5sZ5hgcgHBhvZx4CQ6fYGOqU+AQ+qg3VRjlOm/fJaqHjV7U?=
 =?us-ascii?Q?0uqy737cAkeyWVHkMCUlF/wF18ppoP1ji3PdgWf1g+Nslb51KoG7gUrsfh89?=
 =?us-ascii?Q?aHKwgGTFMYk+fc03D/6xvEYTqKyKa1ulROJJcODKQH0fzGVsl08Qhkyu71by?=
 =?us-ascii?Q?ZA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MIktOFSagnxAMsJTaLaH+P95nt66lfdtGJGmPtpPR0kqWnb3P5Fu714oPtx99NzL3tKpuTG7vDXTYBT933RzUWyWz2bntQIPQ6q1iP00+FgiBBmgiOoyPx44CchrW8Fxhm7s2rE0dL84dO+xLqDHYixsWr7EEhcVZr53whwq9t5hNUN/odMI+vLLD7oEIESK+W3TSSLY3sSGXd47ytD8fb4GqJBj9kqiozuscD5e8rLB+6FfXk1V8Avr7AUCtP9H2yf4aOzj6cJafhjwQJg9j0pbziYD0YcgR+3O2ZLVL6Az5PFSfoYRt//DgigVY9TcLaTf0C7NqG/3pAEI6ZnoHLvM8KI72GBh7UMMAuK0tgYxAreC5euieBtZyqtSLm9UmVyGi8Jr+ctlwgysgqQC0fUlJlekNztEfUQ0tUElPrhbjy0hqNVVJePGIPd6G8G2FKpIVOZvi6YcS/C1ismnxRz8B3jz4muLvJm4LipR/TgTjiIoliYzCbWbleK2eaYurXyDHknKf4JwS2WR+ujH+rV+WP9VXMFJTq/GaxG9DvNTlQqNVOQOaZ099gesgQdetsJg+Akr/Z5n47AkLo3GLOFR8H7s58hbIwIBpi6DK/YZnFQM6rDDByLL52+oFzqmnHT8oV+iVCt/NsTnut91N0tQG1CSVlQzVWEgWAqhQlLqDboOGOQFaHy6YQdRZRjopfJnfV48vgkBddnddKzJVaCSirqI5EP2wlUx79yh6g4tEFqZdKxcDL3yasT+H9+a
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ff0f7e-94f0-43e8-bda7-08dbcf18656e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 13:53:09.0840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sw5lj2XQa/DY1bkvOEJtq3+1nRuONR7pBNtUNjdIhFjBrLmFzAkpPIync4qtPtSCsWJRrfAFpFUXfQRxmJGbpH7ah9LSMHvKWY2flGKVnrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0381
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMG5/pmaC/88jKvtDlxgVgBP3F1N6k8xQ0ur9bgbPIM=;
 b=IluoqGuk4+VsuBZPMNAXsm8c1/kaSEOnTajOxgWrUzCvnQxtp0b6rA1X6rIG7AOi/SdBsK+iyf+OFJKyLzatfSVO1ys1QrwETZKYdINEMrCiBQP8U6ZlISaoz5EEQB9j/D7rIhtyMZSyW70Qgr8dpESz5qZCysJ2VxwrFf8Xrwo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=IluoqGuk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] Need help for adding a cargo package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I want to add zenoh-c package  (see https://github.com/eclipse-zenoh/zenoh-c)  to buildroot and need some support.

It is a rust package and, according to the readme file of the zenoh-c, it must be cross-compiled using cmake infrastructure. 

I added new .mk file with following content:

ZENOH_C_VERSION = 0.10.0-rc
ZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(ZENOH_C_VERSION))
ZENOH_C_LICENSE = EPL-2.0
ZENOH_C_LICENSE_FILES = LICENSE
ZENOH_C_SUPPORTS_IN_SOURCE_BUILD = NO
ZENOH_C_INSTALL_STAGING = YES

In order to build it for my ARM target, I have to specify the arm linker in the RUSTFLAGS environment variable as well as to provide the arm-unkown-linux-gnueabihf target as option for cargo build command:


ZENOH_C_CONF_ENV = RUSTFLAGS="-Clinker=arm-linux-gnueabihf-gcc -Car=arm-linux-gnueabihf-ar"
ZENOH_C_MAKE_ENV = RUSTFLAGS="-Clinker=arm-linux-gnueabihf-gcc -Car=arm-linux-gnueabihf-ar"

ZENOH_C_CONF_OPTS = -DZENOHC_CUSTOM_TARGET="arm-unknown-linux-gnueabihf"

$(eval $(cmake-package))


How can I make this cargo specific variables be automatically generated by buildroot, so that this package can be built for other targets too?

Thanks in advance
Alex 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
