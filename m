Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056F3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 12:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A48F54177C;
	Tue,  8 Mar 2022 12:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXusFkauOyK7; Tue,  8 Mar 2022 12:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92DE41757;
	Tue,  8 Mar 2022 12:46:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5302B1BF3E9
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 12:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 433C341757
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 12:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iS4GirQ4jaR for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 12:46:38 +0000 (UTC)
X-Greylist: delayed 00:06:41 by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.111.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ED23415B3
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 12:46:37 +0000 (UTC)
Received: from CAN01-QB1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-n0JUE7nhOVGBR2ayYZtyuw-1; Tue, 08 Mar 2022 13:40:16 +0100
X-MC-Unique: n0JUE7nhOVGBR2ayYZtyuw-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YT2PR01MB4736.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 12:40:14 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 12:40:14 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/rpi-firmware: fix missing files in overlays
Thread-Index: Adgy6JeH8ewG3BenQquJqcXtOXdVJw==
Date: Tue, 8 Mar 2022 12:40:14 +0000
Message-ID: <YQXPR01MB6121F6337B4EBC7B28B55AB3AE099@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62cb7829-2ba4-4bab-cc71-08da0100cb43
x-ms-traffictypediagnostic: YT2PR01MB4736:EE_
x-microsoft-antispam-prvs: <YT2PR01MB4736A6271B6FF1FBD3B6CCF5AE099@YT2PR01MB4736.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 20iAdT7XGSgbFaiFSXqop35dK3x4vJtR28mcoj9DqFa3tqxgX3dyAXD20l2Vm+IUoC0Kvt2e96fFW/pCdsm+FP8SOFCjsu66sw1IeDzLX+Hdi1370pPWwKoLVo3Qau7fX5SV9Rq4WFRIjr5EiiyUuHXzZjr01TlOxIi9xCAayf3/ghdjmp6MD7ux62pwPkixSXCMKW/KPb6xVEc6xBX/fqOtV6nxxaHBijRy8C8/t2qXLWYli0TjQaeREAH4/kgnZnxDspRNSUP1CddsCNXw40aNzSVxJ8EFv2gDsl+8d03Enp7EBP0zyHXRyyOhciQMDjJkqBp+7VZVIdTI97VoeuhlggtVkFLsS6c1Rmzhzv7qkjvt/B8DI2a5MOBfDj5efhAaUeeu8iybs+k7Ex3WbIvBNAkLZkOXRWDlpcVRgfi4Vh/quo/lqPaak7d0T5a+PxnUa7IXCi0QlbdihNY8B+RJE9NXh5VVuoqhTSJQFhf3LBA0mEVIvU1U2QhMhXPLC9XZxsS6MPjf/s53EeI1gkfiJrou0/WEV8e8fW1n3xlzdHhro1SoxtpVa1o4Oy9VO0ru76zK1tu/IYgj6OargLZX4A/xlgR/45KRRjXCnUeFiYtf8IPn55vH6ggnoz/XpBSqlxboLsu5nFOqHO8gxdfTzpHBSb1+Fbz2Z0K2J4XWzwCeLpiY3ntL7xbPiMwFBq64zbguSKZxmdXCP6licg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(38100700002)(38070700005)(8936002)(5660300002)(122000001)(316002)(8676002)(4326008)(76116006)(66946007)(66556008)(66446008)(64756008)(71200400001)(6506007)(6916009)(9686003)(54906003)(86362001)(186003)(26005)(52536014)(508600001)(83380400001)(7696005)(33656002)(55016003)(66476007);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/+wR1yLpT84eCDe5Y/z7sZCjBTPwZd8S7s4fNR87WQXju2Sk2f9/7kD32Y09?=
 =?us-ascii?Q?xUmTdM2k1YK3reL3QMrJhv91+SVd5c0rU03jciLdB6kbxOeiAkQduNvq7Kz/?=
 =?us-ascii?Q?ii9B/WB14oU0sf8Hgubm1i/J0ngbceBipXBqOdcdeDBwcO2oQHu9NXQqCXAx?=
 =?us-ascii?Q?03IhsYYJkXUltcRwItx4hOiL1jKDzOlswWGG9zxhnmsoUYLBvbjH56KjuWkd?=
 =?us-ascii?Q?A7c/Xx3ft2ydv4lypNEuIkgXMz5eNqTVL6RFo3Ph7WBdnUZmYgJVPctcnWRP?=
 =?us-ascii?Q?aN+52/YPTiljTlI295wijtiMiv2LncfshexVRq0eVhg+vr4P8xvLyghMTCWG?=
 =?us-ascii?Q?GNnBUjK7dWhw8/NaUORgNM8LXqUUTGpPwY8YiLIV5l3Cy3XWhMICBISAvaDc?=
 =?us-ascii?Q?w2y35fuYz48+kEZfIjbdzfsmKFgEa+LcUSEyJn2P/LfcxJwxzgWldeCkoIoq?=
 =?us-ascii?Q?sdKZ2j3JidnTRlrV1GkgkMr7kUlyB/IjL83T8d86za9hCu3bRHFjLMMR7RC1?=
 =?us-ascii?Q?+H2hsQjf0gtyNB+pgHymYo13KZctB6bjmEup3k+yC1dwCuFi0AxKxdXlq0wl?=
 =?us-ascii?Q?aqG9uzSePp05v8qklDBwCmNZ3mfSekdbkXpLp7qSX/f+hVB5HpSuLQZhJy51?=
 =?us-ascii?Q?wcXDr7Kre7uOp/iPYUMpclnN8VWi8tVaksJwk4qMT8ttcoPUnbBK2WX71RCe?=
 =?us-ascii?Q?wp4xll8NR8Y5+AAvbBME1itZpfVWHYQvlvw9gnS8ljbziRJQckNhVp1ey5fk?=
 =?us-ascii?Q?ixlHufCzKOXnza4HOpFLpBtpoB7EZn+5jka3ZGuAYg5B2Z4p9QRacIObeA8Q?=
 =?us-ascii?Q?q5MjaWW2eguNpKzPaKmzHFelA/8+to6rzP2RLV7E745Wgi30HtQ8F3IzJh1H?=
 =?us-ascii?Q?IbhqU8nnwgAKGCEUXgpeQqW2PExG+95HOz5yRovic9GBdEBsqLfUl0JOiz3h?=
 =?us-ascii?Q?wuVmFRp0vWlEKGD6wVL1VQnZcOC8b+ThUF72hv5YKvAxZSvuH7PxywEV5czB?=
 =?us-ascii?Q?1FTrA0EbXR7EJ3txTwGnPAaXS0EZPOYlfbQ7V2nD19hbBngeXXUye7fgaQOn?=
 =?us-ascii?Q?Hb7gJVpn6t8Jy7QjJLSmlfyeI4pAIfl/jo/pGCPxnABOv2bIsUfGb5cc4fTR?=
 =?us-ascii?Q?DJMAV2p5UacmuUSRW1H8Nyr4nB2rmNrvGkDvYZna5OUsCuV1m0wSdFXirmnj?=
 =?us-ascii?Q?ZuIWY2kk3Oo0JBq4ellFOF/QQpsKjxdfcsKXaPZF8ugJxlHkds3eE9OjUj+2?=
 =?us-ascii?Q?RQWM9RTkasKxMrRbwuOsejYEoq40IGSj0Q231B5HJB7YW/HEryQO+xaJjOqz?=
 =?us-ascii?Q?u7TUp7zyzkpzyvK9eP4hMGIdqTw9qLaOsW1WarncJd2+W4uCdxagZ1uW0WSt?=
 =?us-ascii?Q?P70CV71VP2ws4EFpp/nsPdD0G8l0AZfkWCTLOS52K4OXsEV/3IhESoBwHU6g?=
 =?us-ascii?Q?fbehCIR5am9qZ9jQNYVxm3FYCoLUV/I+VTz/zg8L0EcDKkFq29igsKewdKXQ?=
 =?us-ascii?Q?wFBBSyo2bl5HlgJBMMGWtK5HiFFYGnK3YrzMLtrXLpplc3AO7/YKU8nsHfwQ?=
 =?us-ascii?Q?m2eABu73GMQ8deNllcIe3q+cy1DJMJibU31g7XY8fHz1jxeF++IbBtRykY+J?=
 =?us-ascii?Q?KLN1NTK5dPUhn6LvWygwuGD4U4fa/UYA5eO55ietNboqNNlcmOLVVAUYIvXO?=
 =?us-ascii?Q?sj6JRw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cb7829-2ba4-4bab-cc71-08da0100cb43
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 12:40:14.7879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /F5T4JRwNae/WWGYjxIxFoqGeExgadz+ffUX43AjOhjPN4KtcJj+qBdc83Z/aYFhfWFAUkzp5Mx3XU+CONnXUli9IcjvYaz2LVmH6MFalPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4736
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: comecer.com
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix missing files in
 overlays
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: multipart/mixed; boundary="===============2321895323115269573=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2321895323115269573==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203081340170891"

--MCBoundary=_12203081340170891
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Not all files in boot/overlays are copied to the image, which may result
in overlays not being loaded at all, or a wrong overlay being loaded.

When using os_prefix and/or overlay_prefix in the raspberry pi
config.txt, it checks for the existence of README in the overlays
directory. If it is missing, overlays will not be loaded.

The overlay_map.dtb file contains rules for overlays that require
special handling depending on the specific type of raspberry pi
hardware. When this file is missing, the wrong overlay may be loaded.

Fixed by copying all files from boot/overlays, instead of only *.dtbo

Signed-off-by: Rutger Sassen <rsassen@comecer.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rp=
i-firmware.mk
index b46a7f5270..4b9a442bb6 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -45,7 +45,7 @@ endif
=20
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
-=09$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
+$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*), \
=09=09$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays=
/$(notdir $(ovldtb))
=09)
 endef
--=20
2.20.1

This email communication is CONFIDENTIAL. If you are not the intended recip=
ient, you may not use, copy or disclose to anyone the message or any inform=
ation contained in the message and I ask that you please notify me by retur=
n email and delete this communication immediately. Thank you.

--MCBoundary=_12203081340170891
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Not all files in boot/overlays are copied to the im=
age, which may result<BR>
in overlays not being loaded at all, or a wrong overlay being loaded.<BR>
<BR>
When using os_prefix and/or overlay_prefix in the raspberry pi<BR>
config.txt, it checks for the existence of README in the overlays<BR>
directory. If it is missing, overlays will not be loaded.<BR>
<BR>
The overlay_map.dtb file contains rules for overlays that require<BR>
special handling depending on the specific type of raspberry pi<BR>
hardware. When this file is missing, the wrong overlay may be loaded.<BR>
<BR>
Fixed by copying all files from boot/overlays, instead of only *.dtbo<BR>
<BR>
Signed-off-by: Rutger Sassen &lt;rsassen@comecer.com&gt;<BR>
---<BR>
 package/rpi-firmware/rpi-firmware.mk | 2 +-<BR>
 1 file changed, 1 insertion(+), 1 deletion(-)<BR>
<BR>
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rp=
i-firmware.mk<BR>
index b46a7f5270..4b9a442bb6 100644<BR>
--- a/package/rpi-firmware/rpi-firmware.mk<BR>
+++ b/package/rpi-firmware/rpi-firmware.mk<BR>
@@ -45,7 +45,7 @@ endif<BR>
 <BR>
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)<BR>
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
-=09$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \<BR>
+$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*), \<BR>
=09=09$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays=
/$(notdir $(ovldtb))<BR>
=09)<BR>
 endef<BR>
-- <BR>
2.20.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203081340170891--


--===============2321895323115269573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2321895323115269573==--

