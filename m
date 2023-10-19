Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA88CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 06:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 725FB83B4F;
	Thu, 19 Oct 2023 06:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725FB83B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7mz2m3Y3Lgs; Thu, 19 Oct 2023 06:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95CA583B52;
	Thu, 19 Oct 2023 06:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95CA583B52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E01371BF3E3
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 06:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0CE24248B
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 06:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0CE24248B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kF2C610_ZO-h for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 06:08:23 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A99EB42481
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 06:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A99EB42481
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 19 Oct 2023 08:08:19 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id E277AB5ABC
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 08:08:18 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 530B2B5AAC
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 08:08:09 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 19 Oct
 2023 08:08:09 +0200
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (104.47.51.232)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 19 Oct 2023 08:08:09 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agM4o5GL8751uS0eEmRLIGrMI7S/GZuzPHBxNjIjTtZXbGrvr3kwl+NXdN6s9T81DBgUjXRI5dHws6I/nfr3fHsEEngP6MsRr99kxpHBgcEEh6U2sTxeQ7aswH5gWA49EKcJq3Ap7C188/PPhSsxRDvZPTaMuNX3MoUHCLAEuvpvx5WcocSbBtmpJVSMH4VuRhgnZL7PA2ltaEtMe/y8kAcxwjhltpuPgxkCAALh4i54pXQJnYSBq4u4wWx1U0RIiiVAqPdiGbgATSVXntmd9j04xN7wwg4VBRinVuMp/OdJ/QqtoMN2ehzCocomLzbfDO7AVYiwovSLYhCvSsZcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+vmYsB014jE5Umm2q7wiqrZcCO7pqJS2Iwm7DgPtJQ=;
 b=ggGxntR9Tb7qMsbzWC0SqnoSz8UTdMAgksFsD0/WE/MD3EW7QqvXov5uLOZTv/PsDwFocQo+BsBth7cbOrqS3bjVgVopM3ICklv4lxbzKki6OGcHlpZjEfZdObJIu0+cgbnUSVryzV6e0uRLm6pqBT9ifi/h65lHrPZnIwrwMlA/gGJjdZnVZpAaF7HFiLfpkEWLu7bm1sTo8k4Z5PCodfjrjuLVdbBWSXv1Ezgl/ObGSK9JDBtT50ynF/gI2u4em/eXbER8V4eLwcQIVkC5v27sW2oMoKXTaW0y3LGlHzJr9Vk2U8Dar51/pbGZM6bBSitUhxMmLXBSHgCU2Jk4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0388.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 06:08:07 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82%7]) with mapi id 15.20.6863.046; Thu, 19 Oct 2023
 06:08:07 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/libzenoh-pico: new package
Thread-Index: AdoCUmjJIMBmVe6HSfGbNu7txBfNhw==
Date: Thu, 19 Oct 2023 06:08:07 +0000
Message-ID: <AS1P250MB0608055A4067BEE19E37EAA4A9D4A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0388:EE_
x-ms-office365-filtering-correlation-id: b2001374-afd5-4c03-69b2-08dbd069c39f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RKp6G/N9K1TMPmsYruMNnrj8o73knx8TZ0e3QZI3yiZdqFgR1Hk584BszzHzvqLlrpRslmkWne9uuJj1qiRPp4c4DRY+5uvmXJLeoklZJje7tSSZ3LO61Bo4NxiL7iWl3tkubipOF/SvcND255Bv5i1DX0dG9uiHCoMZc8KG4T7vxpA1h1li8LzNM0rLcXBv64vcrVENwPgyTk+J2CaqtEufuN8NSjji3Z/nNJDVxi7nhaENOkzITQ8X9vcooGi0F1t6ziTojzTkJ0vohspa/BcsMonEg4N0DFbTV37M73KVkHzKZWvK95ROwUG3l1It49SFt73/T3HdGWUTXWGNjgH4xXF2QjEQoalq5Cf2Eh7TqLxGaPof7BGnQpNTn5mq5HZZjui3JrWu6sTmsKOTUHZGrZhbJwJWMorn7PwNiOWy5Vfk7bQtVFDSzgyqMTCAEoOjvSGv4fn+qy2sl3WakWzv6iws00hW/T+3k//Ey0UNU7jfAIsoYz9zdQSSm4yKzYaxnu/SMLecXzJm/S3fI/SGM2IQ4k+VBHpACi+HLlXagXdlSYRPZeLwA6E7y+Th9uYJ67eIBN1SLWH9g9c52z4QpXAhZOkDyblYXbp7o4g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(136003)(396003)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8676002)(55016003)(33656002)(5660300002)(52536014)(8936002)(2906002)(86362001)(66899024)(71200400001)(38070700005)(38100700002)(6506007)(7696005)(478600001)(9686003)(122000001)(966005)(316002)(6916009)(66556008)(26005)(76116006)(41300700001)(66946007)(66446008)(64756008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tSfkWjSfE9gcBoNl/9M3gIGGcWYgzn3+1wH67oxMN6H0zmXYF3HRBQi0aTBs?=
 =?us-ascii?Q?8vPQuLHm/337qc8bg0PjzdHINCFQk+StgdB62UVsoF2yEGkuHxWp+sQ8dbtA?=
 =?us-ascii?Q?2NpRVOk+ynpYnij5eXkZCgbqXdefdqBkRAwXwDTy2RxqUF+kUoyt8QXIXsko?=
 =?us-ascii?Q?jbrSSdY5SS/BAGKXfjiaaerfqpjSefw4ioI/LfcEaGHjb1f/FcwiHYF8pBUL?=
 =?us-ascii?Q?u7uxTntSL6ILpcesgt5vQGxCjAPHo8zjlvlJgTIj0gaC6Ne9Rw/QjJ1N84sZ?=
 =?us-ascii?Q?4ohLIbn7kaL5fDAuuKut75n/2iFhNUzGLfa+Z0g536vPVbT3Fw5oBQNI0hjl?=
 =?us-ascii?Q?u5bGIHReEgIsYZ6AdHPy9lFdfjSXZ1brJ2MKQ6siz9YSLgMFfLZAkVHKQGEZ?=
 =?us-ascii?Q?Odt79qSGYn/1b75e9UZ7a+FCp8GkUMuOE8NVkO1OUiVa4okwdi1bY4P/C77w?=
 =?us-ascii?Q?7ohbBgVpj+J5jlPP37rHCJe75ULYjQZTddcEoo9q0g1KaJIcqXJQ1Q1+R9S9?=
 =?us-ascii?Q?O10MzUYTC6+/LZzBhHkhQ3Ht/EZkBOtlY6lCqhnC50bRJblxnIPH9hETMVQC?=
 =?us-ascii?Q?RrFE2m7OBqFYvlQwSpeSWtLykV2j8jzC2dUqDjiBug0vOfuJWAR1MUXYEpIl?=
 =?us-ascii?Q?fmIBLpXvQ5gZI5U58s/4AeNZMLnY2MtYc3auGFT/My/GalTvQCr430JNnrHA?=
 =?us-ascii?Q?Opwn9eUEZrl9CVlQ377VDegBrK6vbRAMxY0OFsdISZ6HKt53C3Q6rJCxjTgW?=
 =?us-ascii?Q?tSUxs5+SQlUWlj4KsI4M2rv2sCiYG+srfayMJi2PH1rv68iGf6l4r0wNcwtr?=
 =?us-ascii?Q?S+QiI+Cj0uiTpvCXT1eYaM+C/Sq02EsEUvdUnHvfJkbTvyi6Esr8OHl78YRO?=
 =?us-ascii?Q?q8JvPTgwPQcRcT1PY6y9HWChOgEkmVhUpG8kuV8BNW/0qPai7nCptIfuK1q1?=
 =?us-ascii?Q?UR/GvLbYnpMuZffYHKkOQZZ4vaxk2h1OSQr/sQ4PKhBF/Rc1XExdnd2vWODF?=
 =?us-ascii?Q?uaSYw+JR9Xdjfi/oqTr2rGjEvHPBw/EWKRcXo0VI+uJvCXqFVROD5JY2KOui?=
 =?us-ascii?Q?wNssRO8MN/TOsEYgP5TgQcwWywoNW7U51owUfwndatdtRoiN6n9VSnTCWVsi?=
 =?us-ascii?Q?f8kBitMZQi9ppEI8wg12e1ZWplHRj6HSaJEUhIOR7faJsRF4OISxnZZk5sXW?=
 =?us-ascii?Q?9jK7chOulCPYoPoCRf/4akWfgAzT5xiM6l5PebB3eun/n9bjoLDGzgj/1ZO1?=
 =?us-ascii?Q?fU9JJ0KbYV72f7yscAC47APGe6fmUQbi3/u/WV0H6x53qa4h2Mx7Yb20knRw?=
 =?us-ascii?Q?Um5ojup9/JO+ynuzYKGjz7YkHiijM8zgwVfGCF1KACQrfGZgQhNKKMrkzjH1?=
 =?us-ascii?Q?nd9OP9+8lh7KrcIvBQUmKi/v7vgahC6uao1VfDXRxK8v/IDIe3fJf4tz+TUf?=
 =?us-ascii?Q?Wuc1h91b8eET6gjVaxQSxuw5OXi2lcnGT+/oP6HtZd2P2RDxUe/gK8H+jgkC?=
 =?us-ascii?Q?arKgDxxv0oHswvrZ9kXZT4G94lH4XnV1Ry8muqFYcyV94P2/ns8xYyo55nFj?=
 =?us-ascii?Q?WhTDU4JPFNBPsaSVTzzCflb3sRVd5FuI0pbB2ryxsrABiCxo3r3/n/5ZE0a9?=
 =?us-ascii?Q?bg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: o9MpE0pmdvfU3EGTZi1iOgX2VaLmvmk/AXGyzLYKEKiwQ6zoI+ITxL7Jpfk4fhZExvpe7lNsa8Y/FozftiFtEji8m6PFTMpOA/rM468Zpwx+1xTp034ar59WDeuAp99BNuNzivYEZzx6O5RIsF+t4CgOyb0NXiZgYIQy2Vh1rVEhVTGYgM4yRGSCkfXL+lZPhcR7Jx7iO7/IfJGP10zACZdhrLFw/j4Tm8nzFNZBMCPjuIcn/k41kEf1py9SEN+EBZVqvHhIQo2jOggdm+9Xhr4AOLmdYUiJZ+lT5Th05Jkg3ygCzF8pO+e484cQcbUdVTfSEnVq3gokVNKlX1pb7iHnZw2pnIrYPW3QLkrASmkRc9Un138LY/dtTo6vxWbD2zDE40un1eejec4j2KxxDwwxuCgpaIX51xUWh8gsQ6dhnAX34+KIIxblfALyP54HZQRrI9A/12wJU7DOKUBS1tSJhAxCDLR1wfJzch2NWVxMYRzYjSMzvjSnhxkEpJ/r25mOvtob1Lclviib9kgQfuGUC8PVutVxuhD3hr3gEBiORmRfO8M0m/YRB3+6QVZpt8BFIN9ilaT9z5BH5sOGLQ7U5nnDMwIn6ozYLxsZjFpxzwUFzofiYBVsHyMeeYvOCIsNF0RVRkIamcRt1w9o+34XDuEvWNAalnk/OxM+RQZkpdXQb2GFgHLC9glMtmMHefauErHiUxE2FY1HvdRIqtAIqE31F+yYcbN0+K2sr8XmEyYOX9ViPuMslHItTjES
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2001374-afd5-4c03-69b2-08dbd069c39f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 06:08:07.4697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vTjSLOGno2LrdAF8ymx91JbZIMLmECZ4mSBr0UXhPt3yVdlOlX6+dKpKNM5xXWTJHGNLnjVqYpOa0sGciitCBfK2J5aYz6TcUlEFQl5Akg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0388
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+vmYsB014jE5Umm2q7wiqrZcCO7pqJS2Iwm7DgPtJQ=;
 b=A5nLlavFw9hpb1CpW0XRUSFLgPvtRGQEjlfgDrZDWzvbV1tckhBHxKthZ+TL5XKORTmXuNKn3IbC17DZWdJs0wzpx/bHEZKTI+tS1AzGl+ysZZN+G+irhrKNyWvsamtYq3giJLkEIH0xsrU9FPYF0Le38rFVIQ0wGaDQ2Y4bmtE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=A5nLlavF
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH] package/libzenoh-pico: new package
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

zenoh-pico is the Eclipse zenoh implementation that targets constrained
devices and offers a native C API. It is fully compatible with its main
Rust Zenoh implementation, providing a lightweight implementation of
most functionalities.

https://github.com/eclipse-zenoh/zenoh-pico

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/Config.in                        |  1 +
 package/libzenoh-pico/Config.in          |  9 +++++++++
 package/libzenoh-pico/libzenoh-pico.hash |  3 +++
 package/libzenoh-pico/libzenoh-pico.mk   | 19 +++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/libzenoh-pico/Config.in
 create mode 100644 package/libzenoh-pico/libzenoh-pico.hash
 create mode 100644 package/libzenoh-pico/libzenoh-pico.mk

diff --git a/package/Config.in b/package/Config.in
index a53b7d29b5..077cf959d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1993,6 +1993,7 @@ menu "Networking"
        source "package/libwebsock/Config.in"
        source "package/libwebsockets/Config.in"
        source "package/libyang/Config.in"
+       source "package/libzenoh-pico/Config.in"
        source "package/lksctp-tools/Config.in"
        source "package/mbuffer/Config.in"
        source "package/mdnsd/Config.in"
diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
new file mode 100644
index 0000000000..3baa76da3d
--- /dev/null
+++ b/package/libzenoh-pico/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBZENOH_PICO
+       bool "libzenoh-pico"
+       help
+         zenoh-pico is the Eclipse zenoh implementation that targets constrained
+         devices and offers a native C API. It is fully compatible with its main
+         Rust Zenoh implementation, providing a lightweight implementation of
+         most functionalities.
+
+         https://github.com/eclipse-zenoh/zenoh-pico
diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
new file mode 100644
index 0000000000..edd4c3df4a
--- /dev/null
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  752acec56236fca41dcc438307f4a76e69900383b06803d47f32c480643dc794  zenoh-pico-0.10.0-rc.tar.gz
+sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
new file mode 100644
index 0000000000..46d98a0a49
--- /dev/null
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libzenoh-pico
+#
+################################################################################
+
+LIBZENOH_PICO_VERSION = 0.10.0-rc
+LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
+LIBZENOH_PICO_LICENSE = EPL-2.0
+LIBZENOH_PICO_LICENSE_FILES = LICENSE
+LIBZENOH_PICO_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBZENOH_PICO_INSTALL_STAGING = YES
+
+# - disable all examples
+LIBZENOH_PICO_CONF_OPTS += \
+       -DBUILD_EXAMPLES=OFF
+
+$(eval $(cmake-package))
+
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
