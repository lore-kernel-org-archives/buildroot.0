Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED07C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 11:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 941718428F;
	Wed, 16 Mar 2022 11:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvU5-TkMvJ5j; Wed, 16 Mar 2022 11:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A40CB84256;
	Wed, 16 Mar 2022 11:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1F791BF407
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 11:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 840B140236
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 11:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOVjdegMHNTi for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 11:09:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CCE740223
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 11:09:26 +0000 (UTC)
Received: from CAN01-QB1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2052.outbound.protection.outlook.com [104.47.60.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-jwsxoKFLMbK1QtPfIWLmjw-1; Wed, 16 Mar 2022 12:09:22 +0100
X-MC-Unique: jwsxoKFLMbK1QtPfIWLmjw-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YQBPR0101MB9935.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 16 Mar
 2022 11:09:20 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 11:09:20 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: package gdk-pixbuf relocatable issue
Thread-Index: Adg5Ja7F/ksluIbpR5GklgV9S6wR8w==
Date: Wed, 16 Mar 2022 11:09:20 +0000
Message-ID: <YQXPR01MB6121BE84B9F8581AC02FCD43AE119@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb59eac0-7f18-4760-baed-08da073d6b77
x-ms-traffictypediagnostic: YQBPR0101MB9935:EE_
x-microsoft-antispam-prvs: <YQBPR0101MB99354BA2DA499986B13FE85CAE119@YQBPR0101MB9935.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: f4JJwCO3Njq2jq+nSoekZuWBRpauMjhE/Bory9ljaQ/GW4oCUiMIYWa6A0NR8d9IUZ4mQmMzx9S+1Ymg2lj59zti2eI6QK86QefYv4drbPg4PW0eUXzIzdoB9tfbvO6S73xfh0r3qC1ZssYhTAttYwJpwI3YBtPvy/Mgg0JFgNBn3MXntWV39hmPCYu+xjcrj1m9wJ1Q0o6ByMraJQ8FJNIxZJ2mgQaMmOq0IpTej+IuBe/6ulhkjcrg78tyX4C/UFrNpnicDZog0lY63VH8zR0eyPEyXq6Eh6pn7DdOSmzuZCSCAmTkQzZ+bqkJ1FSP07NBtgW/t4MNEakYjYoQNECegxFcsT4PEq87RUlO7qBu4ucJb9kzAVdrHGqsWIULFhAodUCax4UrSTIricxVCNpoUF4kcv17iuh4xamHKveNvZk90xG8ebpx302H23OWFkTdKFS0bAo+8mE2LAxvBP7VAufJgvhWqeeDnp0W0qMA8DEjPoiXslYUjFm2sbbmLmjdWvGcsaRswrhQvWhM6LjxVbry2tAWue+Gra44WS9j6/ckZImyGuwfOydh1uLPruszX+l63WmtN0gAE6JzcJ30fDFpUFJ1f/Ab1ueYyzZPZDHTo/CRbb/RCyH9pdMkVbdIMz45gTAox6xk9xfeKTziEamPRADBMoaFge04r7EGeVSarpY+1Rye6NTiD+4SbcWQ2izSoeuEbJip3JskvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(2906002)(8676002)(4326008)(5660300002)(9686003)(86362001)(7696005)(38100700002)(6506007)(76116006)(66946007)(64756008)(52536014)(66446008)(66476007)(66556008)(8936002)(54906003)(316002)(6916009)(38070700005)(122000001)(186003)(26005)(508600001)(55016003)(3480700007)(83380400001)(33656002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ao4kLI/DNqujpHzA6R9rLt+lHh/8hN5shx4oP0zQWhYk4tc2wjrKGmG7H7Bj?=
 =?us-ascii?Q?FMP4srY1nAMkgEqgb++hpZeSrXhezFvnwGDT90Tto4XMUVm3Kb80dYsTOOGq?=
 =?us-ascii?Q?9BG36q837Kq0Nj6YW7frvBZwHCQKD31Wb+ng6sA8d+72V72W7gO7L+6PkGsi?=
 =?us-ascii?Q?83FvX3inEZToGxZeQ/bIDHrGKRsW0zqVZd4F9LwXHZ09Yg1zxqAHoDfx3wCL?=
 =?us-ascii?Q?9Kt2MBbaCCHudxYPUF8QSJsLOxSD/7Lvo0WOa419eKVFmsC59nKG91S5e3sw?=
 =?us-ascii?Q?frWYARPr0UdIGG+dcEtx8RBGwiL/ktZiG1T+WgsBK+cqEsDrJba2nM1pohKI?=
 =?us-ascii?Q?zcGjhDBn+19HajF2Oj6Qjxg792ssEXLH2O72Yjvep8SWq8InkHPu0wGPTYsq?=
 =?us-ascii?Q?5gvU9TaVQzRchF8HljFr6u3VXlt5enFUTKK6q6xK6JJ6/sO5AN1pqAN9S1gJ?=
 =?us-ascii?Q?zhKJuSA2rrtTEZR2SNESC9M0ujbG/QDw3t4YZyojmBMU6u+EjwMd865O/hXF?=
 =?us-ascii?Q?0bmYON81/gkp3UPHygvG5LZT2RSXJBu618E5fcm9IZlpEctvxLCl3wCJmyxc?=
 =?us-ascii?Q?UmkEZSHVXJnm1Bc/F/6l5S0wiFtzzpWPDWUFHOxH/hEa5mwmRlA6iRuURv4f?=
 =?us-ascii?Q?2HBsKbGFIm3cnzm5d9Z7a8jciu6g7sUnKnsvXH4/oTG5Jo/88zTxfInTQRql?=
 =?us-ascii?Q?H2ySzvvrhI4IbxceFaGUKUm+jGJM5qp6efC8QbsOAxLQb1F3LcaYV65mBUbn?=
 =?us-ascii?Q?KCt0p85un9kvztVnTrj5vNUxXMuea1aSk6wqfzLnpKwguknUDfMGxqQR/2Na?=
 =?us-ascii?Q?TM0JYa+ssw+qeFkE9Wd2DNVEu/u4W7xYe8Ml3bi+4wRcGwIbS6InNDR96zUk?=
 =?us-ascii?Q?XOwL8Ni1i0346dPZaKB+Blt83TpLIOdYX5Qr/loLhAXHnQB6HqtNpdEMp2FI?=
 =?us-ascii?Q?Tka2ATlfttFKYHWW38YKoujVusf2sBLxCqbKDBmLyvj0SycZyh1qJtU0vG2c?=
 =?us-ascii?Q?2IG4rT37O2UrSyg6Sy+Pwa5MZh1iC22ZlwQJI8xGWxvdWJah3Y+G7q04R4eg?=
 =?us-ascii?Q?4FpRZOJOfYIIJ9cw9WK6sj/55XQL+ZIwXUddsWpKzU11sO9DbiqM31L2Jq7w?=
 =?us-ascii?Q?uTgzCgCQ7GbhHXhwj5B/WdYFGR1NIXv26qxY+DQguGvVkmXqa7ffB6uncC+c?=
 =?us-ascii?Q?/eY5bnqYDZ3ECeb8ezUMUFwPK2C2DHsvuD9+aOGkw/UijHIsmbjtyI+rbc5e?=
 =?us-ascii?Q?s7PcWZd0oOBJFMLXz2AES1RB2G3LULB7T3Si/TK5T7jew++TesiFsRsDPhow?=
 =?us-ascii?Q?x5OCiU/X8jjv7TQpQmhaaI6b1LuhXWvL0lGmCoRxPCNie0MhpgSXhPx7cVDs?=
 =?us-ascii?Q?0wAYmo9rN5qaBwWT6JbTAwFvQJ8rrAcorWc9I0GBBG4CbseE7p/OrLoIvZjW?=
 =?us-ascii?Q?PpppmoaRVkTwfLUdSy4/e1CBibXomKV8kY93wDQM9xvZ8JAyQ1RLRg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb59eac0-7f18-4760-baed-08da073d6b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 11:09:20.2817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqItL+7Xz3ljiG9cNc9nOv4z1wJmeMIwtMwZEuuM3ey2FfeFe1ogiFruVvD1tntk6pu9ZqWy+uCU536GwiJwV0LAGPDE0JPLE51zSLZ3e/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9935
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: comecer.com
Subject: [Buildroot] package gdk-pixbuf relocatable issue
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: multipart/mixed; boundary="===============6488974249864553793=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6488974249864553793==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203161209232091"

--MCBoundary=_12203161209232091
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

A recent patch for package gdk-pixbuf to enable the relocatable option for =
the host package has introduced a problem for the target package.

The loaders.cache for the target currently is generated by copying the load=
ers.cache from the host package and editing it using a sed command to repla=
ce the host paths with target paths. The sed command is no longer correct, =
since the host loaders.cache does not contain absolute paths anymore.

The consequence is, that the target loaders.cache now contains entries like=
 "lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-*". These paths are inc=
orrect, and applications using gdk-pixbuf will crash because they are no lo=
nger able to load images. Before the patch, it would contain absolute paths=
 like "/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-*".

I'm not sure what the best approach would be to fix this issue. Either by m=
odifying the SED statement, or by modifying the way the target loaders.cach=
e is generated (i.e. by not using the host loaders.cache as a base).

My configuration:
Host: Debian 10 (buster)
Buildroot version: 2022-02
Target: Aarch64 (raspberry pi cm3)
Package: gdk-pixbuf

The problematic snippets from gdk-pixbuf.mk:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
HOST_GDK_PIXBUF_CONF_OPTS =3D \
=09-Dgio_sniffing=3Dfalse \
=09-Dinstalled_tests=3Dfalse \
=09-Dintrospection=3Ddisabled \
=09-Drelocatable=3Dtrue \
=09-Dman=3Dfalse
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# gdk-pixbuf requires the loaders.cache file populated to work properly
# Rather than doing so at runtime, since the fs can be read-only, do so
# here after building and installing to target.
# And since the cache file will contain absolute host directory names we
# need to sanitize (strip) them.
ifeq ($(BR2_STATIC_LIBS),)
define GDK_PIXBUF_UPDATE_CACHE
=09GDK_PIXBUF_MODULEDIR=3D$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
=09=09$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
=09=09> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
=09$(SED) "s,$(HOST_DIR)/lib,/usr/lib,g" \
=09=09$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
endef
GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS +=3D GDK_PIXBUF_UPDATE_CACHE
endif
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Best regards,

Rutger Sassen

p.s. please ignore the email disclaimer that is automatically added to all =
my outgoing mail...

This email communication is CONFIDENTIAL. If you are not the intended recip=
ient, you may not use, copy or disclose to anyone the message or any inform=
ation contained in the message and I ask that you please notify me by retur=
n email and delete this communication immediately. Thank you.

--MCBoundary=_12203161209232091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Hello,<BR>
<BR>
A recent patch for package gdk-pixbuf to enable the relocatable option for =
the host package has introduced a problem for the target package.<BR>
<BR>
The loaders.cache for the target currently is generated by copying the load=
ers.cache from the host package and editing it using a sed command to repla=
ce the host paths with target paths. The sed command is no longer correct, =
since the host loaders.cache does not contain absolute paths anymore.<BR>
<BR>
The consequence is, that the target loaders.cache now contains entries like=
 &quot;lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-*&quot;. These pat=
hs are incorrect, and applications using gdk-pixbuf will crash because they=
 are no longer able to load images. Before the patch, it would contain abso=
lute paths like &quot;/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloade=
r-*&quot;.<BR>
<BR>
I'm not sure what the best approach would be to fix this issue. Either by m=
odifying the SED statement, or by modifying the way the target loaders.cach=
e is generated (i.e. by not using the host loaders.cache as a base).<BR>
<BR>
My configuration:<BR>
Host: Debian 10 (buster)<BR>
Buildroot version: 2022-02<BR>
Target: Aarch64 (raspberry pi cm3)<BR>
Package: gdk-pixbuf<BR>
<BR>
The problematic snippets from gdk-pixbuf.mk:<BR>
<BR>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>
HOST_GDK_PIXBUF_CONF_OPTS =3D \<BR>
=09-Dgio_sniffing=3Dfalse \<BR>
=09-Dinstalled_tests=3Dfalse \<BR>
=09-Dintrospection=3Ddisabled \<BR>
=09-Drelocatable=3Dtrue \<BR>
=09-Dman=3Dfalse<BR>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>
# gdk-pixbuf requires the loaders.cache file populated to work properly<BR>
# Rather than doing so at runtime, since the fs can be read-only, do so<BR>
# here after building and installing to target.<BR>
# And since the cache file will contain absolute host directory names we<BR=
>
# need to sanitize (strip) them.<BR>
ifeq ($(BR2_STATIC_LIBS),)<BR>
define GDK_PIXBUF_UPDATE_CACHE<BR>
=09GDK_PIXBUF_MODULEDIR=3D$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \<B=
R>
=09=09$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \<BR>
=09=09&gt; $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache<BR>
=09$(SED) &quot;s,$(HOST_DIR)/lib,/usr/lib,g&quot; \<BR>
=09=09$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache<BR>
endef<BR>
GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS +=3D GDK_PIXBUF_UPDATE_CACHE<BR>
endif<BR>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>
<BR>
Best regards,<BR>
<BR>
Rutger Sassen<BR>
<BR>
p.s. please ignore the email disclaimer that is automatically added to all =
my outgoing mail...<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203161209232091--


--===============6488974249864553793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6488974249864553793==--

