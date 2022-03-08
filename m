Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED981C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 12:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94179408FE;
	Tue,  8 Mar 2022 12:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_8MdJUFBEmW; Tue,  8 Mar 2022 12:46:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66698408EF;
	Tue,  8 Mar 2022 12:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 981BB1BF3E9
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 12:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95A3F8411F
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 12:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJkOUryKHiSl for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 12:46:20 +0000 (UTC)
X-Greylist: delayed 00:05:12 by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E87F84116
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 12:46:20 +0000 (UTC)
Received: from CAN01-QB1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2054.outbound.protection.outlook.com [104.47.60.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-HpeXPoxLMUqdYP2D_6aekg-1; Tue, 08 Mar 2022 13:39:53 +0100
X-MC-Unique: HpeXPoxLMUqdYP2D_6aekg-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YT2PR01MB4736.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 12:39:51 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 12:39:51 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 0/1] package/rpi-firmware: fix missing files in overlays
Thread-Index: Adgy6EkJXMYwNHhqQta0TQO1gAqBcQ==
Date: Tue, 8 Mar 2022 12:39:51 +0000
Message-ID: <YQXPR01MB61219F7B0E78D6C785ABB816AE099@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3916e7d-ce99-4218-2e6d-08da0100bd58
x-ms-traffictypediagnostic: YT2PR01MB4736:EE_
x-microsoft-antispam-prvs: <YT2PR01MB47365A006E28DC509B245869AE099@YT2PR01MB4736.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: BMLqIXegSyeD7tC+bISCDiybUfUO3l7/Uv1MhdATHd9YHo3NOWb2YyVvhYh/kQfHLTOG3shMTVIW8nlye8g6mH25xKV0w8+9HYd2gvTeVnrCLExLBmu+oN2wCvypG6Ot7GpjjD4x4k3mK6ITYVKOgwSHkzUhs0AgZP8O/gZYwyox9vGWU9uwxxOfos8Lv554yEq5e8rvFLEx8vxbfrsEB3Ea2Qnis3ZAdA2eJBtgjHQnNgZ65iY3aHchZ2UHsXgFbBYv5IhaNCLCWh3qV5xCz93Kf8cK2tijIMt2oMhm4rXmXFc4Dxtxlrcz/CRgk49MUHvnHyyfGwohiasq5/5j5Aq+TqwMZBW3xN4WFnE8tMaehFnBCb0XVaeGylj8PrAraUtD29pRbuQ+jHFP0K21k/dF0a4efIqRKIsINcrZ8VOFybu+Kww0b+ljd96PObWqH7gwTIUPpQqNaJegW1koBeTZTBFH/bH0zy3k9KAZRtZFWMsPiRVp273V75KZJYUk9azHtTIeq/9XtLOR4SzLKanh6vlbFa7D/k4W2UqjrK9tFATfAO/OeKa1c3OVLO4P2pTO6gHSLnxudAbhF8l4KhKnY1XzwIu91Ifd6Q2rAV+qBlN6fsCJPorDRR0nKDH3R0ZLlyHmC9JBO9ShiURFHL/50D8sVSogq2LOiAvUXOk1XlI9bQ8yyohqS6I/tpAuCKn/TY0wRotFXiEqgK/OPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(4744005)(38100700002)(38070700005)(8936002)(5660300002)(122000001)(316002)(8676002)(4326008)(76116006)(66946007)(66556008)(66446008)(64756008)(71200400001)(6506007)(6916009)(9686003)(54906003)(86362001)(186003)(26005)(52536014)(508600001)(83380400001)(7696005)(33656002)(55016003)(66476007);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z7ZBY5akLrLY2scnK323t4X2kguOM1NDYvT2xNCu3EnLmMH4Lgb0ZHmpTsat?=
 =?us-ascii?Q?uLoP1zQs39vc/TxPxKObI2giC3tqKZ2u2P9IQbtjfgE9sVqHRuSpXs3eMSpx?=
 =?us-ascii?Q?jcrPxftEW7QWxJ/6MmRGnUKHnDdoYzEkCLi9ll1NlTLdgJCQ5aRtl+B/R2Rx?=
 =?us-ascii?Q?vBn5SZjBJ313eJcjd73JJN+473Kp1sXnDz224iN9sMfxxTCkZfJ5Yu0fJJiK?=
 =?us-ascii?Q?o+Kwa/zOxzzNyvfXZd/clQbxMi5W6TJ9LatSB1lc8kqMsfNiULpLWvYoOM0M?=
 =?us-ascii?Q?5Ubuo8H7FxwCIsBOy37sl+tE0HTy3OwwUQU5VtvyVoFba/9AzeT4ub/ywn4q?=
 =?us-ascii?Q?bY89+4cc8gOv8fzBiIJY7GP2aylIUiBkrErelqiu760VCqRnevk/NPbZ49Pr?=
 =?us-ascii?Q?s3IZJNwCMHZx9N6zdtyV7br/w9DnK9gxb0Kt0EdlNM5yB+7zcqCfNNX4Dirn?=
 =?us-ascii?Q?/OMm6YBX/+a5AFOA4jpc45N+BrrWGuJlSjrCGOD+di8/oNWxtHbcryy943SH?=
 =?us-ascii?Q?GhlHlPxnf/QeIILVr2Cctsryj/lVp4njXEBnfwuFzxs63F+DbUPBiqIbfOF5?=
 =?us-ascii?Q?QWjAcNODubn46NxJ3uV4PGeiyvRb4PMdZtf1P9Ce+Z2460KtIqje8qI5fhms?=
 =?us-ascii?Q?e/7dwtL1UgUh+oDUVvu04Lj5/7ciPFJuyjJU/4qB/SU2XyJUT59iZPAkemJB?=
 =?us-ascii?Q?t1sKzrVLKlqYevhM7z5V5JnISTNeLydZcb3V7YGIsD7ciTcSykfHeaO030Mr?=
 =?us-ascii?Q?/3gU2NXzTrEIrBZttBrveNSCV3QypcG7RDhxO/9oA3TcmorVQ5WGQuiaMogg?=
 =?us-ascii?Q?BbImGODFpdscSOYBrBEDrdWUsYQ/YJTjIRVLodl2N6+Gp8iqHOz7MmMo9/er?=
 =?us-ascii?Q?n2bjn9QmxDtnW9adkLuaAbXP9yuu5IYW3gzQUgQmoTg/mutM6bowu/pwyCrx?=
 =?us-ascii?Q?eYsJAGL/wbXfzFoRu4lWCbknnaxdUgyrEwzx6ly8GVmqGo9zz6jRnzQv3mWl?=
 =?us-ascii?Q?lJE5yV8tqEq9xifh/CVYdI5nvoGQGSX61q1yGOkiKJPivYZ0lZk9XjV1Mx0j?=
 =?us-ascii?Q?zcWKW836K7G9JZlv48fy/K8m66grrCfAQ0VPJ6vqaqbbq6+xqGwTiv3PKiaq?=
 =?us-ascii?Q?YRBem0ZOLq8xVpKdjAKpOSHKm410PiVfu55AXvUqisw9iUpoub7qvSRzM1Pb?=
 =?us-ascii?Q?E/KQDnAkBJfM9lSg47XZqM54r2+aWVuZrMm7RDvN+b4rh+DufAqYuxKZDfMG?=
 =?us-ascii?Q?l3LpwcHjTqfnkmQwZeTn0Ljb7bkKMkuz0k/PpaPubav3nBvoQrObDABHseaI?=
 =?us-ascii?Q?ujeubHqVK+mgaHrbPoPuewLGsl/KEA/KGSz4RNGaVmrMrZ2ejC0kmU0OtBiY?=
 =?us-ascii?Q?FMsMjYEzmFC23nCkjhOdUKmix53oVtDQE4qUT5Idi2zyG60lMm3vlCQAEE4G?=
 =?us-ascii?Q?m4HcmaQFqpC4fctDq2BvBs/geCH4Am7hViy0gEru59Y7IJ+ljojP80dXc0gm?=
 =?us-ascii?Q?Ruhi684P6gNyKcYvtz21vI2Jn0S7sGitfmC1aDLWRW1OoamFQkhhD0wCcNhc?=
 =?us-ascii?Q?y432CVqFvL4IK5ldbfd16o9yhmF+NMpgGl1Mi2ocKgHnLi5IfmB8CCAekzaP?=
 =?us-ascii?Q?PqvR/GrNarfgD+B51xPsojvaQ9ojWfbOsnW+HQgYQSi5GSpgsFBmWHEYCXT1?=
 =?us-ascii?Q?5WuOxQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3916e7d-ce99-4218-2e6d-08da0100bd58
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 12:39:51.4178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RroGOUbZEARntpLJZlNncxu5JOv0F1H9A59aElhoOB5n9vLkNGOT9Z1WgZtLQ5U7pxfHBNjNjR1r/l/1vwQTr3gMdNs/mdM6fAU8Ik76Sf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4736
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE5A40 smtp.mailfrom=rsassen@comecer.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: comecer.com
Subject: [Buildroot] [PATCH 0/1] package/rpi-firmware: fix missing files in
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
Content-Type: multipart/mixed; boundary="===============2109783000454270952=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2109783000454270952==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203081339542561"

--MCBoundary=_12203081339542561
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

First of all, this is my first patch I submit for buildroot, or for
any git project for that matter, so please forgive me if it is not in
the expected format.

This patch fixes some files not being copied from the rpi-firmware
boot/overlays directory. I suspect it could also be backported to older
still supported branches, but from the documentation I'm not quite sure
how to specify this in the patch submission, since the package has been
bumped to newer versions in the mean time.

Also, git stripped the leading TAB character from the changed line in
the diff. I'm hesitant to manually edit this, since I'm not sure if this
is intended behavior.

Rutger Sassen (1):
  package/rpi-firmware: fix missing files in overlays

 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.20.1

This email communication is CONFIDENTIAL. If you are not the intended recip=
ient, you may not use, copy or disclose to anyone the message or any inform=
ation contained in the message and I ask that you please notify me by retur=
n email and delete this communication immediately. Thank you.

--MCBoundary=_12203081339542561
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>First of all, this is my first patch I submit for b=
uildroot, or for<BR>
any git project for that matter, so please forgive me if it is not in<BR>
the expected format.<BR>
<BR>
This patch fixes some files not being copied from the rpi-firmware<BR>
boot/overlays directory. I suspect it could also be backported to older<BR>
still supported branches, but from the documentation I'm not quite sure<BR>
how to specify this in the patch submission, since the package has been<BR>
bumped to newer versions in the mean time.<BR>
<BR>
Also, git stripped the leading TAB character from the changed line in<BR>
the diff. I'm hesitant to manually edit this, since I'm not sure if this<BR=
>
is intended behavior.<BR>
<BR>
Rutger Sassen (1):<BR>
  package/rpi-firmware: fix missing files in overlays<BR>
<BR>
 package/rpi-firmware/rpi-firmware.mk | 2 +-<BR>
 1 file changed, 1 insertion(+), 1 deletion(-)<BR>
<BR>
-- <BR>
2.20.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203081339542561--


--===============2109783000454270952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2109783000454270952==--

