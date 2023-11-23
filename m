Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C6C61D85
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 07:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A96E404ED;
	Thu, 23 Nov 2023 07:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A96E404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ToXuB3o1k6Wa; Thu, 23 Nov 2023 07:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE8740298;
	Thu, 23 Nov 2023 07:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE8740298
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 668471BF57F
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 07:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 347D540298
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 07:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 347D540298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0Vy6kvx1QMs for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 07:11:34 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78C5340025
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 07:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78C5340025
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 23 Nov 2023 08:11:28 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 80D0AB5AC0
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 08:11:28 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 85F98B5AAC
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 08:11:18 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 23 Nov
 2023 08:11:18 +0100
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.169)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 23 Nov 2023 08:11:18 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcOjz6/jDo5jMbNJxoDsTg6jX3qhh+2KPHR/S86uKGsIpPK27dRz/A/fFr37GFsFVCTihk2YrEtzPqj57FKqRgxoPOye+Rtt3rAX8gS7UL6Tijeuf7NIABY4v133SLMYk6NqRDwQICIk0Bb4+81UlpiPu3POPzR9BBSCIQ3smEZcMbWW9JY43kJaXtW62UxvjRzyyAa2GymoQH7ARJRyBfNxfM7EPdbcGCsVPh84PdqBgobq/SnLDko7VcOzIPmWSb+sVrXrATvCPC1ecagcxD4ufIFIymhgL0nQvyf0QDztEEydMSsR+VMY9QyvmESFdwWoryCj7fzOAd6C7olvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Meo/fzPONSloFKvGv4BXcuGfw0Tu1pJeZIS40qBZcpk=;
 b=nJg96+RTCGrH3AlRbO9yrADYiagcdVxXBixXF9IHSQTeVBvlo62jWDqwr16LPBNSvxD3XxqIqZaDDpbG88POo2qxkJFem+3Nb8XL71VL8MQ0hABZoslmujX/mHztTqwE6qdvluO+a/wZ0ljy3zVyEmO/TyMQzWki2M4tURVvqfT3J7fSUmK51120MAcV1rMJbLh2gTUx5h3ZwvoPVAWRDPVos9xLBLeonjV/RkVhDs3ZF6zjstWnai4rsmlaK539qt90QopYK+U6y1czQlXnEhBUPM0u/HzceXWgnZFXxCZc0dvp14thx7JmFIRzWzz4P2teA+hej9Aki/4Bc1PyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0133.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:374::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 07:11:00 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::e6f7:7b61:cde2:b8bb]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::e6f7:7b61:cde2:b8bb%4]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 07:10:59 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/libzenoh-pico: needs threads
Thread-Index: Adod3BjpmF5k9/NmSB2DoxrOWHhA4w==
Date: Thu, 23 Nov 2023 07:10:59 +0000
Message-ID: <AS1P250MB06085F35DEC1B0AF6F37C41AA9B9A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0133:EE_
x-ms-office365-filtering-correlation-id: 5d29116b-7912-4889-d0b5-08dbebf3585b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oGR05X+oDVjhQOwuVH5JGfFx3G5pEeZsyNaGLMWtcy6Gu4mLgPaubl9zFyKOQHw0GDuUeMyHkoWsraKnDkZD/WxHU5rpSA/yhNiD0Aa5d2DB4nodEBTU57jFyxDqv/FacIdnxk4ciOIC1SfCGlHJX9v7Am0tIeZfJxAdm6XShNkR4HysXHBPduxMmvrKn/ILeJeWkCh3D5dkHqAXdw6gR8N6tTATmWoepdIBMGJ0ciK6tTNp+O3nFQ0ubuv3fcoTVTtNXGjlvSwE9Vie0CcydW/XBgmUAvVOGAO0keVRQGk0ghySzJOu4aWz5/xbTou5FXF6gg4i7RkvCBRbsUVr/9u+sy1OlvR+B6WIIqxCOIBMnYBIP36Q0fxdkKh1Hnkz5UKriNNbTnRQKrx3FNsCYnPUadA8zNEZgRKdjJPghjvUtrHaYZRGm6k3BeoW3diBk6wnKbzshGqzXLikGnFe0yIg8eVQFCbsP88mk9QqX5jiZs1WBg7FmSSuw8zqurnUbqfZefy2CwYPqKmfjQV/xdsh1y03JmCdUPw+ayrmHMdteYeAxpVp0rCtbAt7qnUoUgpEFLJuQ/VB11va/2eRSAvaG6KCXXtZjUyGprOTKJs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39840400004)(346002)(396003)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(55016003)(2906002)(4744005)(5660300002)(8936002)(8676002)(52536014)(316002)(64756008)(66556008)(66476007)(66446008)(66946007)(76116006)(6916009)(66899024)(26005)(478600001)(966005)(7696005)(9686003)(6506007)(38070700009)(122000001)(38100700002)(71200400001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?unU2Fnrqh16Rd8gdrzL3iK6IIMYFJMDvgsAo/q5rS+AKi25Kzuxy+ASBopyO?=
 =?us-ascii?Q?/xaH5GtIuQVMQnuQoE+GfK8BujIhJr9xvt8l3R54ft+DVwWB/qnHH7cwypGe?=
 =?us-ascii?Q?zCKAzLm/QiCCROp7BrjHysBnGL5wAcN2b/S3gqDLHUnE/3Sz0DIkw84qLkQO?=
 =?us-ascii?Q?iRA2GhlWmQ4/+hMHIbSYcfM0vBen3K0fFGVX52nNozDIO9wa3hCDA3pPk6yE?=
 =?us-ascii?Q?sCfutFhCsK2mYK74YYSwdsx694/oweJyxI3tQx5oMAnLU96jLupzvZvpiAtm?=
 =?us-ascii?Q?LXHQ8Pz88oTZRoM+bjFEznscsMRG6Uds9/jAIjpx+fMi5pH47yI/LgaRmoZ0?=
 =?us-ascii?Q?XGuMK66PbcQh0ynAdBvvhSTG/7ft9wQJq9fiCk74X+zu46BVUPlxLPhFng5W?=
 =?us-ascii?Q?sio/6juJAfIdcaTDr5BxaHpLGi1ak0jm/lVGk2eJEiwaCs3eBkry4dto/Jta?=
 =?us-ascii?Q?912IsyyjWmBZ16HKGh1KX9ePUg6CRtK3mBEDm0EUMwbWDxS+a0/sJ8b3mNER?=
 =?us-ascii?Q?akHZpjOdalgxahsw83/fJxiG4HZzL9JcHTYPDSrAJlu0M62pIRKeowva4GhL?=
 =?us-ascii?Q?HHS8cWy9Ves9GWPlvqJnTKuZgyTBSF8IKk08CjppZQmVCBV9xLDAZ09waxNQ?=
 =?us-ascii?Q?HBOPNIzuBU7m62FMIjskBZaY+b5re7Uz5lBVss3fhoAQFhaueHRdoZq8U69h?=
 =?us-ascii?Q?4znZUEcwuGtc8a1MrsHwJHjE8Vpqv7mhq9e0nKmYPlDvb/fHdX5rvUgHBMR9?=
 =?us-ascii?Q?FEWO+N0R7YkKJuLfUdvdTJYfZZiklGD+tpxogqYJ0DFlE8ljGvuNJm4T6S36?=
 =?us-ascii?Q?JmYV2tWXkZXn3MF6pHt5Y6YEUurhSOJsYnOspuHc/0ehgHOelHns8bphHDqV?=
 =?us-ascii?Q?CR42xWUp3G+ToTsAsxHEYhJWsP1dXP8R1cGDE6kS9oiDq7gOr5wTfR98Pvsi?=
 =?us-ascii?Q?TBCbaz3d7o2+y4E+S40y1S3fxFg/WQR6lCh8bzBX1LAjyWbNAVLSRs32zV5r?=
 =?us-ascii?Q?V+YQm/1HN8qZTmp1pegxtBjSITRlyVNx51MpgwdSmSaQ5RUUPMd/g3gdTYck?=
 =?us-ascii?Q?0513heTLWR/HSOxYdR8gMqTUAQLC0sThPriHEtqUNzUNnuhmPPby9U1SrurR?=
 =?us-ascii?Q?G+kkTBtSNItWSkFd5jorGzRBug+854OFmGdDr+5UgYpgVobVBRC+2CBYVBVV?=
 =?us-ascii?Q?FUOzEFTm/c2a+NlvTUOoe18APEuu5h7VcOJggR7u1YH0DktivsxnNHPOsRgZ?=
 =?us-ascii?Q?T8XazVBByVSDB4Ce2KEa+PklI16eGkocL1QRZd15VrflsI6BLrgTAp2svP5p?=
 =?us-ascii?Q?AHs7pKbZK4ATss1ZyYHb3NdS5LYTJRu3Y3dGq0ptlEVuKfcFIstzD6L6G5JB?=
 =?us-ascii?Q?pFDuvr4zU5/QsyrNrGIkeD+DTBnMOjA3aK0fy7I9kzxXIwliaQQbSao3eUWY?=
 =?us-ascii?Q?PotWNgO9+0aED0e1iANqdPYtOJpyBVqFiI8OFEKbxYqLwh+7Qth6XXfGaKlz?=
 =?us-ascii?Q?wyxR2IjmEo5+AIulnyKlmhH0VPISGMay4ptN/XCvnyHdpPN5blXKYuRHr3/Y?=
 =?us-ascii?Q?iFu08tIfyHd7auEzwaZ8LNWdElKMB2TOm+6WekAj+vcZudnRKlXJdpojPTPG?=
 =?us-ascii?Q?jA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BqiOQlt+2CYT/eazExSxlW7RHLwM+QwPP4Wp7VzjT/oypvDWHoE169V04dP21ygdexZnvLSE9P56g1yIM+7wC6GVVFxAKC/7xVpchdoZPlPRY/d1fxzt+Us9ZeP4k2hOX2b05Xvkd7g4THMF1y4iyebWOsYQ+qUFRJX4+IBy/FGD9bWW9/dUAYq1588XGMGNaxLUiVdHyYX+Fr8WplJqIytpSgQYe9hwEEtqvgD3mxkZop8fWOc+8j/tgDFQN0rWQRvYWIMFUzskR46JrU5AQYICgc6KZltVqtPKj9E5hdYUFoTx4e2oy5mQUJFtL1eDaT2d2y5J5BeOmB5Q9asg24uOY2Pe+tXfzjyCfPmBbnhFvCnXv1lGTyycuZOXzyOjJvidjNlCKqaG4mftQWfCfcYGwpTJPmhOdHrQfvrgu80sXOgVGbBQ945gK22EiEj7zGM1r/M+213b2dbhjeCzmbH60S/KiLn8KJmPwILz1RTMwAQPn/S3ZlNiMQG31YcbwNoL9VqjCxg56eIyHZMCTqG8dS9NtnSdM8DEvUlWPMUSmS1zt44/Cr8fY6mgK29LvTJzkNsbjZccg9Dv8KCQHiwrrMs23/M6VtMOsTPAklGvQ45J6p35a0+3ykEIkXcGkT0bVsv19D2sFqmJtNCHEZIffAuqNkMprs3xtK5NF2EehZDpqiOCz5eF8Lze3tXxS8vIKRGMh/DcK5xv0iNN0lBID20XoWcbKBkCPJE1T6VgJtG52s3DMx+6HEHJvGqE
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d29116b-7912-4889-d0b5-08dbebf3585b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 07:10:59.4858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBHJySEVcC4zlAXo5bNu8blB12Z5gqXNQRTQUG7JLuK2ZBUGuRGU1zuV7eEH+ESfB2Xm94h+Prcfh2zN8ZN+Pm8yHUBS5q5t31PtfdtNztw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0133
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Meo/fzPONSloFKvGv4BXcuGfw0Tu1pJeZIS40qBZcpk=;
 b=Uk6KPIBm5K/lPavJ0WjJc/reDsyT3g+sY0rZFRGYHEL6rvPiAtyc+mwVE9F15X9BWkZvMrfWlggJivcdIWXbfIDrAUeOw3l8c8soAiS0gF9m3kPzB3+MD7EsZ+1xDlvNwbC5APTlZr0KuFn72ut5pH4P0tjaK1anwRVEI3+nW5M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=Uk6KPIBm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH] package/libzenoh-pico: needs threads
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

Fixes:
http://autobuild.buildroot.net/results/c9138c32157042aa5bb1bfd3a8446e4c9361d0f5/

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
index 093c6d4f75..cb61b0de55 100644
--- a/package/libzenoh-pico/Config.in
+++ b/package/libzenoh-pico/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBZENOH_PICO
        bool "libzenoh-pico"
+       depends on BR2_TOOLCHAIN_HAS_THREADS
        help
          zenoh-pico is the Eclipse zenoh implementation that targets
          constrained devices and offers a native C API. It is fully
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
