Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24016CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 08:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24F54016F;
	Wed, 18 Oct 2023 08:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24F54016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwcmjbuOpl5W; Wed, 18 Oct 2023 08:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876A44036E;
	Wed, 18 Oct 2023 08:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876A44036E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6401BF285
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24F7B821E5
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F7B821E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vga33IoA4rzr for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 08:15:35 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1502A82183
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 08:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1502A82183
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 18 Oct 2023 10:15:32 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id DFB7AB5AC0
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 10:15:31 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id A0045B5ABC
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 10:15:31 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Wed, 18 Oct
 2023 10:15:31 +0200
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.51) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Wed, 18 Oct 2023 10:15:31 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OO9Tyt6B4aL/wn9esg3Y3kmBCzD0dOUL5cS3aU6CY0gsYNX3UiDrtvmVceteC3fJ0KYMqWDErXDVsWXDT9AxYjxgI4o2v/jViW/o0D5JINmcpDPnF/rTolI5UDa3Ge+hYxcNsWOadbGnBJ37cCwUMEJOEOkrk34UVlCcmFy6GAxGwx0Df8wt3u5dobKdIDr0NQ9Bg7PI8U7w3vPrGKch6KzvEfnD6UVLUj6CsaQecxCGziOOUqCEoi33gc6V000cw4AGk6wRuh/mxU6OigVBNCU8ugJPu6RoJ6cm7TdDWonMbZs4VThmtuzJxxnBt06/gzgk6uf3c7chpPYNIfTVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bpqy2ItZHMaLP+rRlp3J/EjCRFKasvXADvTecVllaW0=;
 b=ZzWdjezWqWI880PCzYk0ou5nT9VMBVtVxLGiExKjwYH9DiXxVU7cIubAJZYkYREvxbzF33fukVHY4cWZgLnRvB7rtL8i2/I210dtLzkZNrTJei8FffdbaJ+g3VXMJKaVh2U4DOKXJU9Bj0N4xq9SQnHUyVIpU5CfRPLtcAlZ12vcEfGSFi8BRgVST6Dh5AR1Msra3bpY/pwyE7G7Ko8uXQmau6e39ik8mM6z+3KWJL/2mG1unE5IPNK4cIO8yUNgdomnx0xyrV+EkHhg5X/oAGjx5FI53+bCvI7aXy2GPpMLBEECe9/KBE1qbjoQjFyFSn+6VHyp1GQ9ijMU+q7bmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0322.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 08:15:28 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82%7]) with mapi id 15.20.6863.046; Wed, 18 Oct 2023
 08:15:28 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/zenoh-c: new package
Thread-Index: AdoBmyBiRBd8ExI3RsaabYoZQ4UY8w==
Date: Wed, 18 Oct 2023 08:15:28 +0000
Message-ID: <AS1P250MB06088E27875FEBCE10F3B5F9A9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0322:EE_
x-ms-office365-filtering-correlation-id: 7946221f-c3ad-4852-88ac-08dbcfb263c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HkCSb+V5qNgWXYwEgbysMKgubJlfx91wfj3c9oUqLlOfLAL2Nb1Mq8DCfKSbaV83Tljy0SmbZlsijD41U2N4HHvRWfwrqV6jtUUrFpkSvXWvbB82BDue7sIZkt55+oi2GUstwFD2dySM2eL+y95MpzGnNyLKDwbtcMY1xRbRYYCMB4A5lyxc9shAt36gnBaPLrKYhSBn+KhlOhXu6lcgkTvllGslcJyzAUTBdpUtHbEaXwUhQaZv9n11qMuKhHhXu5E14/l5+Xb7cILv3kPwwPOHkiUrrnGA4Qd7aikB8/NEse0iTia/pR4EUq9UlWFkEFpqovvxsri1iaTXpvYvfDvMn0DUjyBuLnuTNzGEm1Xav/AahmE50R4/SOQfn1Mr9oAhHNqgvm1Kr63Q7kw59sqk6MgeRFEB2IN9Q5nQgqYbK1C4eFhiFqC5wIILzZWN3ftbD2wm9pb41UbkfUjaKwO3czOoW0/Q49B7F43OqinwRLSOqXTK029SV/I1QLk95VKtj9Wh2tUL6uPxMPDVbuNo8NCMBTgj1cZsIDAs81sd7AjfBbPKqqSHVhbf+IQI3IBaCUZd35Fz4cgIeKcJBk1XhoksSa8vMckbxQajbdQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39850400004)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(7696005)(26005)(6506007)(71200400001)(966005)(8936002)(316002)(5660300002)(41300700001)(52536014)(2906002)(8676002)(508600001)(76116006)(66556008)(66946007)(6916009)(66446008)(64756008)(66476007)(86362001)(122000001)(38070700005)(38100700002)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3lf5GRFCIPB0Npq5VFmnxuf3emnw9dKSZyJQd+PYtHWDV37lpPhpnQPWmN8E?=
 =?us-ascii?Q?9wOok5awHa8KFQe/Qe3CgCgI37Pooiyb7Ed9S4IbxohjFfBjV4f5a+qfVvq3?=
 =?us-ascii?Q?x2K7nGOwn7kyeubTZFM4slmcyWMj/vOUDR3a7aL1wWX7/QMatM89xyqZj1qH?=
 =?us-ascii?Q?Vj7puCmDI6XYKvYceaEWxu1dYnu9/hEUuzrE2B+evNNxhMp+1dXn1DrthioY?=
 =?us-ascii?Q?rTzs/CVodRePDKydozjZOA2CSlw6i1nC0eCd9PVR0eoM812n525ZqKlnt+oa?=
 =?us-ascii?Q?5j7kbNbBvhPtGFL1WRST27JywFGo1fz16GqA17Ev1v5Ui9vZa4ibW0iYjrWO?=
 =?us-ascii?Q?HMKt8uSivJvR90olJbqrxIoEoYRN3ByDph5Ap0VITXzw3et7Lh0JLraQQSii?=
 =?us-ascii?Q?G8ndl1tlBK0nod5VyJk9Ym9l91cXdREhvO+TUu3g0qgGYCmR9RRPI4pyiDFu?=
 =?us-ascii?Q?dzPJA9VOsEfwY6sT1oidaWoFwp0wYbGMk+7TSPO5Foj4aBK+ZK4ZapNghD3a?=
 =?us-ascii?Q?zLkyZq57EdJfTRJ1YkTM1NGg8FZ1RWQFbXMwk6QUA9D6Sehkzvack0fDbLFa?=
 =?us-ascii?Q?G/n1oTzqdK/CO2WdgZpOGwQAWKAdsqM9YWDSzWu3P2mepV9U8wuXpTOM/Lzp?=
 =?us-ascii?Q?bAfoZggu1zgiPwVRkUuJvWwWmXLna05Rgrp4rDlrHWQTwpeD9201A+tD3EmB?=
 =?us-ascii?Q?DRxzUYZm/gLsHvwx82ML7lBCXwqMt3bb1wn2Lh/hQXsKd2V3LbOW2m6p5Myy?=
 =?us-ascii?Q?FBWVv1g6g43R+q2QR7UiN/9Wpi270udDCfa0O/xTzxQk6C+XUkNSP58GAJRo?=
 =?us-ascii?Q?bnP3uTVPBNH3Fbhl/d5pgAMkezhr7W0t19weT6FaHEWAKwJGyxKxszVTGMCC?=
 =?us-ascii?Q?nAQSWWHsJBohTuOvihzqE8FNs2FErUi4guqgdD2HXusSqDWmFqGWgyLDPFIx?=
 =?us-ascii?Q?VBWqLO6VONSTjOyk3Sh7Z1e2n6OtYFAHqWJH+aJjV7ezbmxosjakV9whayiW?=
 =?us-ascii?Q?a5tRP5wflay7F92mdYcTPrbV+YkMB1Yz6xlu+xU+zX6e6024m/Hww09w/sek?=
 =?us-ascii?Q?5mY75Lk8oicXGW2NOIcxgeQVPHSLp/EHhzMY73JHqSDAH1AOU8ciBzyeWoS1?=
 =?us-ascii?Q?JngkijvubQyebuQMjFbBXRFdBNUgly+8l4ytmQmjs2YUJjEA+EET6ffv7sOK?=
 =?us-ascii?Q?aAeEExztv49f9yevdp9CcUH8eerwiXrrZcjZcY3gK60N0BVC8WilA35Na3s1?=
 =?us-ascii?Q?rslCgqeu5NVefT4OGBPO2nqvOU/FIrMYcSVyqzQ94JtAXXvC4mhUYXAWjzE/?=
 =?us-ascii?Q?jcwPf6E4Blvk1FFzcBILHqVsJEBEM1bNLyDfdFbFCdBEsNMPAmMPn1e9J6Ji?=
 =?us-ascii?Q?zgOmeXWrPczYVSt61RjaRLA3lQx5CrnqlkYSaWj2M/qqW/pQ6S+OH8NOhp7b?=
 =?us-ascii?Q?bR4RR0U/p/tWnL/TVmcrLyFkDfPlQ/6B4PK5sw2KZVySIZbjI/sIl90Ih7an?=
 =?us-ascii?Q?cT+LHGw6tJxCtYACkA7tlpUYviY2wmP714yaRixPduF0w08tmKCBqaW8ZTo0?=
 =?us-ascii?Q?J+jAtn6pLdKTUL2VB3zf9EX3odc4pxL1o4xWRoWJekA0E2+I7gKj1D3T8WjM?=
 =?us-ascii?Q?Ww=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1bCxUkBnHpy2URgPNWyzlaF+mZnPM8zb5fkxgRSKwN0dhxVqLGISdE8M4cF8WVmRXdKC5UX1wPoZtIeADa6MM5rL41g9mKV2t3GNC/BloSssi8Fr5D3V4niJMN1ZaGZ/h7DfmpLkxvnwqbJHaT27RG0Qt4XcfeLsnD4oGf+gzDXx2wVap7wKkIo5Ulnq5Oqa+QWkhXG2trwIqRd4sI/CXAg0Ow93w8XN2+M8PAl8o8c9t1ZbrAsd4Xojo1ONhzaJ3z9hqWV0FzPgs3UfLqQ3Y+OXjOfovx1/RXLNEOJHnOiKSJwW99PY+cxHpJsCY2HajcVQ1Xk1XBqU+nqD+0uvKE0xsx1nkaVwJXHJOL0Ez7QvBQnvmEt0Yik8TteG/LM/gVfXqrR+eKQge3VaOQAqsE/+1JsSFQtjj+5zVNbKlr0ObtsNHyNg9SKbMMle9xogZ4JTObMfJVxXJVlugXfeLUPdYQnbOuqmJK0JwcOBDwwUzaoLSndmZzZBC1IuaJD43gIsDd+qHC9eyKRe1ubQRrSz1EbAgq4w9KBok56u2l9Gk6HjWxBroCDV4UMFQkkmntl+c2Y+javMpanrRM3n5Nu7JmNjpvTUbooa9qs3MNcnd0n/Ld7EA5lI8UO1swftMIodWRVIIS0BBGGVzim03/rhmAGj8boe7zFAb93X3Td4Rx9aMjoRz2S0lSHLpQrffEwjbTl78pdswEhiY32HuJhzw7RKd1T376c3iSlq1AITg4C0lEWxbCDsZznXbA94
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7946221f-c3ad-4852-88ac-08dbcfb263c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 08:15:28.8033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THQ6vtzjwl9W/dfDqKVpbevBpvM7b9+UKMsnImnF4wKYrZDoeNrT/v3ifpyY66IKrI3CxH15MHr7ldrcPILD2nNqPhwc8Ip8KbGIUdC5qSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0322
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bpqy2ItZHMaLP+rRlp3J/EjCRFKasvXADvTecVllaW0=;
 b=go+nM9ij68XGB64p3100AU4nV/byFHFWxKcr6viZQ9DqEXXFn+oXIcVPDhY9zLlNkfu3UJeGcSpxt2QtlemaHhz4h1/oeiKjLQeJYeQu+NUJRkcfGKuX3LBm+YivWTZ0CyXE9yK+4OXi8otkWDZg6eGYRb5RLPkTBTfPWR6VQHA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=go+nM9ij
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH] package/zenoh-c: new package
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

This package provides a C binding based on the main
Zenoh implementation written in Rust.

https://github.com/eclipse-zenoh/zenoh-c

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/Config.in            |  1 +
 package/zenoh-c/Config.in    |  9 +++++++++
 package/zenoh-c/zenoh-c.hash |  3 +++
 package/zenoh-c/zenoh-c.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/zenoh-c/Config.in
 create mode 100644 package/zenoh-c/zenoh-c.hash
 create mode 100644 package/zenoh-c/zenoh-c.mk

diff --git a/package/Config.in b/package/Config.in
index 4e489c4706..a53b7d29b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2033,6 +2033,7 @@ menu "Networking"
        source "package/usbredir/Config.in"
        source "package/wampcc/Config.in"
        source "package/websocketpp/Config.in"
+       source "package/zenoh-c/Config.in"
        source "package/zeromq/Config.in"
        source "package/zmqpp/Config.in"
        source "package/zyre/Config.in"
diff --git a/package/zenoh-c/Config.in b/package/zenoh-c/Config.in
new file mode 100644
index 0000000000..cde6135356
--- /dev/null
+++ b/package/zenoh-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ZENOH_C
+       bool "zenoh-c"
+       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+       select BR2_PACKAGE_HOST_RUSTC
+       help
+         This package provides a C binding based on the main
+         Zenoh implementation written in Rust.
+
+         https://github.com/eclipse-zenoh/zenoh-c
diff --git a/package/zenoh-c/zenoh-c.hash b/package/zenoh-c/zenoh-c.hash
new file mode 100644
index 0000000000..c343c464b4
--- /dev/null
+++ b/package/zenoh-c/zenoh-c.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9a61829a117526d1a6d92382dd989cee65bfac75d3c06a6b27250580c4ca6dd7  zenoh-c-0.10.0-rc.tar.gz
+sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/zenoh-c/zenoh-c.mk b/package/zenoh-c/zenoh-c.mk
new file mode 100644
index 0000000000..cbfece8068
--- /dev/null
+++ b/package/zenoh-c/zenoh-c.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# zenoh-c
+#
+################################################################################
+
+ZENOH_C_VERSION = 0.10.0-rc
+ZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(ZENOH_C_VERSION))
+ZENOH_C_LICENSE = EPL-2.0
+ZENOH_C_LICENSE_FILES = LICENSE
+
+# Install default config file
+define ZENOH_C_INSTALL_FILES
+       $(INSTALL) -D -m 644 $(@D)/target/*/release/libzenohc.so $(TARGET_DIR)/usr/lib/
+       $(INSTALL) -D -m 644 $(@D)/include/* $(STAGING_DIR)/usr/include/
+endef
+ZENOH_C_POST_INSTALL_TARGET_HOOKS += ZENOH_C_INSTALL_FILES
+
+# no install step necessary because it is not possible to install libraries using cargo command
+# library and header files are installed above
+define ZENOH_C_INSTALL_TARGET_CMDS
+       # empty
+endef
+
+$(eval $(cargo-package))
+
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
