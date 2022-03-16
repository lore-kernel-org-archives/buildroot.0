Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68779C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 10:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5438816F5;
	Wed, 16 Mar 2022 10:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wOS6nGXLdi8; Wed, 16 Mar 2022 10:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D66248140C;
	Wed, 16 Mar 2022 10:08:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAEAC1BF3F0
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 940E4401B7
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 10:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lv4CrpVdz2QE for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 10:08:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 707274027B
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 10:08:46 +0000 (UTC)
Received: from CAN01-TO1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2053.outbound.protection.outlook.com [104.47.61.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-R-g2VQy2PfWq2BR-syClbA-1; Wed, 16 Mar 2022 11:08:43 +0100
X-MC-Unique: R-g2VQy2PfWq2BR-syClbA-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by QB1PR01MB3283.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 10:08:40 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 10:08:40 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/rpi-firmware: fix missing files in
 overlays
Thread-Index: Adg5G+4IApLLKvEwRm+UcenxNcTHRw==
Date: Wed, 16 Mar 2022 10:08:40 +0000
Message-ID: <YQXPR01MB61218BB731C52E212FC43327AE119@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2caf3459-b14e-4b1b-bea9-08da0734f1e3
x-ms-traffictypediagnostic: QB1PR01MB3283:EE_
x-microsoft-antispam-prvs: <QB1PR01MB3283BA32FB5E58FA623EB6D5AE119@QB1PR01MB3283.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: QAuv7OmW18H5e/w7z4y6/vIHEIamsQgDcFVdFQAK7/MnEfbzGxAhdAq3F7nHhR2fDw4hyn98RlO1CyCOilAtus9nsY8DfC4jBXq0s+XGK+0+IgutBE+X6JKXgb/A3Pr803etGO8WfSgsKyfEVsK/xOus6zr8RpIOiC4ZxDX1a7PDLFqUy8F+tREX45/eTiJ1A53pLUD6YR1+zKKSGbn3pUkluEeAoLk1Ds+rnCejJzPCPdzb8VQQjARZaBB652nLSC6FXhHDNSqDBsNE/4wqjlAGLe1Gc6YyJu4tsWBuuVbLxMUdaVrcjUW0JpfmskEOeGqRTaCejre+L8Mm0RR/zFBi9ExUO+3BFmcd1HszrpPPfxREOWIheqvGTToD1Yw6wh+R4NnTc64nFwE4ofa3CSACmXfd1+ykkEKVXORhtoKjWVzxedj15705/JUuH1vjuo3C8ZMKPH1Hy8laYjEPYMX7sJDO+NZwGtdyaXeur3i0B9ACu47oMuP7R17z31Z31DXTqJnKfndPVgAV4m8unqLQrzec2ja+7cTdxsRLAsVPQhWjqDIBxGQaUTQaeNBranfEg3Zgh2OMPthtqooIIp+POyhmO0YhOmXGm640Mw1Bf1HW97gVTN+3fXvM4qpxefg3ZDHCcZNT2tgO6ThqceCFyBdrVwZwYZ+vFScHUiwcEf9IqEb5k6iGmUMd/7TM8s3i4monpENIReLFqFdtbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(76116006)(66476007)(66946007)(66446008)(66556008)(508600001)(8676002)(86362001)(5660300002)(4326008)(38070700005)(71200400001)(7696005)(54906003)(316002)(6506007)(9686003)(6916009)(52536014)(8936002)(186003)(2906002)(26005)(122000001)(33656002)(38100700002)(55016003);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?49wWW54TBe+1bjoITbGKUBxBBNYUNi1WLFc17jrQ6Df5I4w/0ZROO3CqUZOs?=
 =?us-ascii?Q?PLFF7CrppzHhvPqz2h/Vx591EFubdMt2VuK3ZMcyj9/ANazzDjOOKHi4RblK?=
 =?us-ascii?Q?j5AbrVzrFjno1EYLhY/8EUlAiD6l6/dtiGjbymGTUolE18snKmpc6t+ctoD6?=
 =?us-ascii?Q?UDsGaM/9/6tOtub7Z7fM4GLyr2s2LzlH2kmSZIV6PxLUXdBagem5MEU5gmNz?=
 =?us-ascii?Q?djRKY55xJheQc3SnMu/eGPA26xsP1aXfz7uEJbjFpBRvYXcjsqCP517qM8ix?=
 =?us-ascii?Q?jR3Q15wGTwCm0TSsTiLD+tPT2J3EmwLCmqmRh4J9Ss3uv0J8ZKwHAoflHw8W?=
 =?us-ascii?Q?P9vw6ojcv94n7TkpHklu/qBet0Us27WDgeu6sh3Px1In0quMzgISdP366GQT?=
 =?us-ascii?Q?BD5lXQ/tqsf9CD429DGtGwWuHEOaC29m9SaMr4pIq4+AvL0DklHrKgpoTULl?=
 =?us-ascii?Q?YjvwqSGvcGGs5mtWIQIrXw53qRdvqgCwxau2LT7uvTDV99muCOHQn+NxupfM?=
 =?us-ascii?Q?s0JgxSEBfL1Ah5z1lxeAPHmyOwfJ0nCv+aWgm122OfKkWdmcW8fktm5glN+I?=
 =?us-ascii?Q?hI8J43Rt6F0UqC7qREl7eS4eQpwkRuWQ1E9YP/rbMFR54T2slrwgQdJizhgx?=
 =?us-ascii?Q?kEVMRTnbxcmuXjbKNG4uutAXD0t0BUDch1TAYmuQEQ1GKCmoJpmFDbICSHtQ?=
 =?us-ascii?Q?MeTvoj4vzaWcb/hhuujZ7FMKyTn1AWiU97N8+meNOd6TAXzi++cYZLAXvA5/?=
 =?us-ascii?Q?0ANsq3O6m/Y+pGzJkklvVL9/SR+1DxxqH+2d/Qs/ycE1a+B+/ITgYdfdOyYq?=
 =?us-ascii?Q?4PjHqUnL1AImoj/Iv889cIRvdZNb2NkZw2E8M6LKQTUK3SN1VTV6FDeaJbKV?=
 =?us-ascii?Q?bUaBIULKOCuYND7O1/Ri0WDsB4zEjj/6TxVtI2XBRTXlR7I5jC3PaWkMAEdH?=
 =?us-ascii?Q?tWsNButPkXa3GXPauY57L298vmKJxvwws8ndyQhEvIilxeGo4U5rtyhuMZN/?=
 =?us-ascii?Q?CQ/S3wlzozuKamY3QKt0T/H92BnhVV04ZAOiVXfvDwG0MnvRM5OwpQVpDb3h?=
 =?us-ascii?Q?kRvI6YJ6a5KrSNMRmxWDJgZd0cz8RFk9IItvi5TkACFih0Dq4TMsfgqotoPy?=
 =?us-ascii?Q?o+bgD16/qv9wEjdnaOu2g9TI6e1Mss3+06l5cyqhqDnOshjUJAfe9DRRa92h?=
 =?us-ascii?Q?8TciPcU/jdRksEUcZbTrBDMbHSVceFSP+xj4c22gfilLia1ZMQumrMH40G7k?=
 =?us-ascii?Q?8SlyVTi5MVFiUDbN0IpR2kCESl3Ouc9iblQqmyfbh7HR+KZ5UTGrflkfBnid?=
 =?us-ascii?Q?fxYxWVr9HTJrKm5rSK6eq4Jj2eHNzVE81k0eu++4bMiEUFbMs5CVIzogEX44?=
 =?us-ascii?Q?y5HxlHJlIjnuQwnURNNdSZRKOCO/XY83GCGSCQcRNdCNK4z7iq/czZptdaIB?=
 =?us-ascii?Q?dXaH6xEpyl4QRnEDsc0TXYAOwDVBwiMmn4tSUPp+BV4/T7drVgd+9Q=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2caf3459-b14e-4b1b-bea9-08da0734f1e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 10:08:40.3337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0fhgPyYDXzgG12TwXspesU0dgddxLUHwGErc8j2Gw7mZ6rymP0Nc+z08UxurBGZ+O3Rlbp3dtFQE7uAW5HyFIRUMg3gJch0TK7H5lu1F4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB3283
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE5A40 smtp.mailfrom=rsassen@comecer.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: comecer.com
Subject: [Buildroot] [PATCH v2 1/1] package/rpi-firmware: fix missing files
 in overlays
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: multipart/mixed; boundary="===============4527432546874225007=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4527432546874225007==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203161108434701"

--MCBoundary=_12203161108434701
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When supporting multiple hardware targets, overlay_map.dtb might
be needed to map overlay names to one of several implementations.

Signed-off-by: Rutger Sassen <rsassen@comecer.com>
---
Changes v1 -> v2:
  - instead of always copying overlay_map.dtb, make it configurable
    (suggested by Peter Seiderer)
  - do not copy README since it a special case, only needed when
    installing overlays to a non-standard location (suggested by Peter
    Seiderer)

 package/rpi-firmware/Config.in       | 9 +++++++++
 package/rpi-firmware/rpi-firmware.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.i=
n
index 8070dc3019..13efa3dc87 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -93,6 +93,15 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 =09  overlays, to support HATs (Hardware Attached on Top, add-on
 =09  modules).

+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
+=09bool "Install DTB overlay map"
+=09default n
+=09depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
+=09help
+=09  Say 'y' here if you need to support multiple hardware targets
+=09  and you need target dependent mapping of overlay names to one
+=09  of several overlay implementations.
+
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 =09bool "vcdbg"
 =09depends on BR2_arm # prebuilt arm binary, rpi-userland
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rp=
i-firmware.mk
index b46a7f5270..800b560070 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif

+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)
+define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
+=09$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DI=
R)/rpi-firmware/overlays/
+endef
+endif
+
 # Install prebuilt libraries if RPI_USERLAND not enabled
 ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
 define RPI_FIRMWARE_INSTALL_TARGET_LIB
@@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 =09$(RPI_FIRMWARE_INSTALL_CONFIG)
 =09$(RPI_FIRMWARE_INSTALL_DTB)
 =09$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
+=09$(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)
 endef
=20
 $(eval $(generic-package))
--=20
2.20.1

This email communication is CONFIDENTIAL. If you are not the intended recip=
ient, you may not use, copy or disclose to anyone the message or any inform=
ation contained in the message and I ask that you please notify me by retur=
n email and delete this communication immediately. Thank you.

--MCBoundary=_12203161108434701
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>When supporting multiple hardware targets, overlay_=
map.dtb might<BR>
be needed to map overlay names to one of several implementations.<BR>
<BR>
Signed-off-by: Rutger Sassen &lt;rsassen@comecer.com&gt;<BR>
---<BR>
Changes v1 -&gt; v2:<BR>
  - instead of always copying overlay_map.dtb, make it configurable<BR>
    (suggested by Peter Seiderer)<BR>
  - do not copy README since it a special case, only needed when<BR>
    installing overlays to a non-standard location (suggested by Peter<BR>
    Seiderer)<BR>
<BR>
 package/rpi-firmware/Config.in       | 9 +++++++++<BR>
 package/rpi-firmware/rpi-firmware.mk | 7 +++++++<BR>
 2 files changed, 16 insertions(+)<BR>
<BR>
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.i=
n<BR>
index 8070dc3019..13efa3dc87 100644<BR>
--- a/package/rpi-firmware/Config.in<BR>
+++ b/package/rpi-firmware/Config.in<BR>
@@ -93,6 +93,15 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
 =09  overlays, to support HATs (Hardware Attached on Top, add-on<BR>
 =09  modules).<BR>
<BR>
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<BR>
+=09bool &quot;Install DTB overlay map&quot;<BR>
+=09default n<BR>
+=09depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
+=09help<BR>
+=09  Say 'y' here if you need to support multiple hardware targets<BR>
+=09  and you need target dependent mapping of overlay names to one<BR>
+=09  of several overlay implementations.<BR>
+<BR>
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG<BR>
 =09bool &quot;vcdbg&quot;<BR>
 =09depends on BR2_arm # prebuilt arm binary, rpi-userland<BR>
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rp=
i-firmware.mk<BR>
index b46a7f5270..800b560070 100644<BR>
--- a/package/rpi-firmware/rpi-firmware.mk<BR>
+++ b/package/rpi-firmware/rpi-firmware.mk<BR>
@@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
 endef<BR>
 endif<BR>
<BR>
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)<BR>
+define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<BR>
+=09$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DI=
R)/rpi-firmware/overlays/<BR>
+endef<BR>
+endif<BR>
+<BR>
 # Install prebuilt libraries if RPI_USERLAND not enabled<BR>
 ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)<BR>
 define RPI_FIRMWARE_INSTALL_TARGET_LIB<BR>
@@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS<BR>
 =09$(RPI_FIRMWARE_INSTALL_CONFIG)<BR>
 =09$(RPI_FIRMWARE_INSTALL_DTB)<BR>
 =09$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)<BR>
+=09$(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)<BR>
 endef<BR>
 <BR>
 $(eval $(generic-package))<BR>
-- <BR>
2.20.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203161108434701--


--===============4527432546874225007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4527432546874225007==--

