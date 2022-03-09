Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63973C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 10:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 104A1417FC;
	Wed,  9 Mar 2022 10:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B8-x4H03WYcF; Wed,  9 Mar 2022 10:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0892F417E1;
	Wed,  9 Mar 2022 10:25:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94A5C1BF576
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DDC440AB9
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8G5GSuVA4PC for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 10:25:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9C204002B
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 10:25:29 +0000 (UTC)
Received: from CAN01-TO1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2056.outbound.protection.outlook.com [104.47.61.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-FBUtXBLeP4mQN27V8cuPNg-1; Wed, 09 Mar 2022 11:25:26 +0100
X-MC-Unique: FBUtXBLeP4mQN27V8cuPNg-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YT1PR01MB4043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:25:24 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:25:24 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix missing files
 in overlays
Thread-Index: Adgzn/RZNFevgHKASeSDCEO+0UDMiw==
Date: Wed, 9 Mar 2022 10:25:24 +0000
Message-ID: <YQXPR01MB612157DDAB88721854BBB9B1AE0A9@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6efb31a9-3494-47b3-53a6-08da01b71f58
x-ms-traffictypediagnostic: YT1PR01MB4043:EE_
x-microsoft-antispam-prvs: <YT1PR01MB40430C11672F1E81DC58F1E5AE0A9@YT1PR01MB4043.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: wUYtQ30lqDpMCZkVqsngFfm8Ww1zEjjjXQZ5aOjHdH0fIQzsjoQ0LUPsGMkhcQVfcEH542Rl6zgFQ7fJ5wZLCMV2t3VFvJjEMrJmUtUoC2bSccC6Fxz3kMYzdRJaVNryh7a3ripmwIMhJelref/6PFb5i8a0+knOnR7TaxalbupL8+wGCWIkhMVahPv5Ooy5bZ7+bNYMAp10uVzBW0TPNkJM4yjpwiju0AFrTAfc8WeLm3qzgkUKeHSr6gf0InygXpI8Qdi1weH/rDbDgTuEHM8jNya8ANXr6YpWkSFVSzQY+5FO/pAFu3J7B7y7/eP7P0aSO010nWVnw7iiJmk9REWX/js/rIdj8gRFJU4JLbn7RVjeCKqe88nxkEzlYqf8RVH/yJ7E3+kiPkVdOX43RI3dcL+D5EHTUEm3m0SiXbccLxcZxXjleDHW3/sit2C0S8lyxd9iNmOSlj4u5FYG+83RMADGipOvLUstbMONTvKvp1aeVRG+GOe3E1kB05+DVpmtHoTOw1RQHwv4a7BKL7VyqBKkkXjqfHS5hOHBtC04m13Pzum5pppnVHJ4ElsdC2P5pH2m57taD9mmHuN08dEDO7EpAwkql/WH7Oj4D6osJnCTvdubUnJl90z/TS/ATrinXT5hlMTvr7acsApxPRXmNYQUGq4UhWttbm0APH/c46u9RHbyD/tHF5JVfmff1Q/AdFc00PkS/4jAgUzHVKR9jdrwlcWdaQGax9Te3LX7WPKFGnaZ6k7lGOwsMN9QPkj/xOmpBELqAhj93x4IXbc9lOtr5AaBRX0nEIuWXWA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(966005)(6506007)(316002)(33656002)(7696005)(508600001)(26005)(186003)(83380400001)(9686003)(66556008)(66446008)(4326008)(66946007)(8676002)(66476007)(76116006)(38100700002)(64756008)(2906002)(55016003)(38070700005)(8936002)(6916009)(5660300002)(122000001)(52536014)(71200400001)(54906003);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oDVHNiYewXZlhodRKA+mY9IAI8jpVrTwgjMqck/4D9stYu5mZJX+KFy4phSB?=
 =?us-ascii?Q?2/NGZ2HVETT0YbfCg7zYkiJ6WLyGqA0JXi2dPMOk6iqqwOXr9szwZ/WloZUy?=
 =?us-ascii?Q?SBpqK1t8iVwh4Ure+3bJD91l35y+duKETM7YT/ClSj4XzAx0qlZjh6Rxcg/W?=
 =?us-ascii?Q?z6ilSk04QvpGJ/6cT1wdpNsP0eGF/KqGNlu/mN3xOotLjzCR/1CqM0eywoex?=
 =?us-ascii?Q?tKZtlkWpMgmo6LSCIhZn6uxFpYUCBbTrWiiw4jj+us1VQGRS+4BpM7BTTb2S?=
 =?us-ascii?Q?DETKwVxM6I2RTWtbQuHKhzUifV8n2LtfTnSNyleNqNvWABggTTyKyAB50qpn?=
 =?us-ascii?Q?LNHRRLYPzHoZAaq+wTrgh69ENXqlMr07zONnAG5Eb9gEZx3Heg0RmfX47w8l?=
 =?us-ascii?Q?dypvXki7MASoOlgLdMl5D7fxNtwXBch2VrvhYCWjiausmGrcP9QD6OpJ5m9g?=
 =?us-ascii?Q?FDbTrSRLTBXMNTZsYW2EvkxENVljfI/PEtXjhlLWXOPt+XW7MjLGQgJF9g1/?=
 =?us-ascii?Q?BexxRQofBDse3sGrWBIxHTDIoUEpSf9yawybYjXBP/It+kHU5Fkhe+EjXfKd?=
 =?us-ascii?Q?zHOJtQQBN0laY+oRitmWkK0BZ0a42oWoucVrR091BnC4cTn8DokuErqDNoI1?=
 =?us-ascii?Q?QbnxlEwZR6dTi+I+6kkSKoh97fpHd0MVOaVjCJdDRgo9VEM9XHt/31pBOiGL?=
 =?us-ascii?Q?v+gVDf2J6GNq3p0wWz6NLDLGZmZEh1XhhmiV3rWTwcrBhaB2tEkNl3GzStY/?=
 =?us-ascii?Q?kV+5pvTmWplNmAq1UUY0IAND89PzJkKhJ68S85reQZF4WBsgCeo/BXdxpBKU?=
 =?us-ascii?Q?oecz6qXcr8CeN8AJGO0G2kQuZk0bJJoBjmAx2th476BiBcyHKcZa2UHggk+6?=
 =?us-ascii?Q?3RZ0QrmhSukNHL3csZ/v+pIoXtpAhO795w+i+WnhUG/brt2GcHaVISRHHEqB?=
 =?us-ascii?Q?2qrKiifCW/2gtpi9oYEZYRVjr0f9QS18pnVV4c2OKNnbe18hwYJMUXbRxiC+?=
 =?us-ascii?Q?o0DIj92qlNJ0FYm2kTch+mYcoBCR/PGOz9GiTzKJV9rzqSfvVaTiwxvTKB9C?=
 =?us-ascii?Q?7yWEDkMjS/4lTbJXtSqm0VQ67bEJ1m6FsRz1yeQ60AZbQRSICh4CykR1kblI?=
 =?us-ascii?Q?H7knbGgAllP3aEqZZ22HatBAaBuBxooKkbkjD2pSx/6wdRI60JdOdXAFeUYi?=
 =?us-ascii?Q?7iUB9i4ME0WYng2NYD/Jiy6a+XzGXy7GizAAFjrTgYLRaJO6sMR7vEznoc3m?=
 =?us-ascii?Q?A85eJfqb/fTcFCxhlYBzms1i3mlC7tMnXe+DCDQcLPCimuC0c0N5Bz+P6oDl?=
 =?us-ascii?Q?RNKl8OdNTu1b+IibdmILKIjAkrmVrfFOvMMpWWsxhAMEl3TbA0+zDBH73sp+?=
 =?us-ascii?Q?eBgvv4HhnP6lobeFoCojBfiRsmV78n3yKplm0R1tZgnZx2TzR3Pb2NIibCCV?=
 =?us-ascii?Q?6U/VkmHXCnukpa94VbBSQ233UDH+u84XBEkvpWEgdyR8VPKX5S0qekXvdFv9?=
 =?us-ascii?Q?UL+aBAPQvaAXh0sWp9xA2WLOXEgg4YUzi7iRp86E9VSDUzAwpvgJn8xLqGEh?=
 =?us-ascii?Q?hwdyW9VChVkGmkQm9BJNKqBo5cvTIth8pN2cUx5XfSZHtJt48iLbJ6eLtgSb?=
 =?us-ascii?Q?a61Sb7E5zRpzX2mFm92JoL23ywJ9wm6ZkJYZSVzxyYvNxu3y9n3gODOjWn5u?=
 =?us-ascii?Q?WlOFeA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efb31a9-3494-47b3-53a6-08da01b71f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 10:25:24.2246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwEQjkiPoUFQP/0huisaB7JZ44ihA7Jhp4LZfbLvQMFgDBx1MdXtmo5tBt9SEx2GKjZB5fWaqfz/oZ6N+fUWyVdQbg6jNfDYlFXI+sOLp4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4043
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE5A40 smtp.mailfrom=rsassen@comecer.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: comecer.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix missing files
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0583829817025956132=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0583829817025956132==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203091125319091"

--MCBoundary=_12203091125319091
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

> > Not all files in boot/overlays are copied to the image, which may resul=
t
> > in overlays not being loaded at all, or a wrong overlay being loaded.
> >
> > When using os_prefix and/or overlay_prefix in the raspberry pi
> > config.txt, it checks for the existence of README in the overlays
> > directory. If it is missing, overlays will not be loaded.

> Any prove for this behavior (could not find anything about it in
> the docs)?

Yes, it is documented in the raspberry pi docs for config.txt [3], 2nd para=
graph:

I've also tested it myself and can confirm that e.g. when using os_prefix=
=3Dcustom/ , and /custom/overlays/README does not exist, that overlays will=
 be loaded from the root /overlays instead, or when /overlays does not exis=
t, no overlays will be loaded at all.


> > The overlay_map.dtb file contains rules for overlays that require
> > special handling depending on the specific type of raspberry pi
> > hardware. When this file is missing, the wrong overlay may be loaded.
>
> Only if you use this feature, see [1], [2] (building multiple rpi targeti=
ng sdcard)
> instead of determining the right overlay (exactly targeting one rpi flavo=
ur sdcard,
> as the buildroot rpi example config files do)...

That is correct. You have to be careful however when e.g. switching to a ne=
w rpi target. When no overlay map is present, you'll have to manually chang=
e config.txt to use the correct overlays for your platform instead of relyi=
ng on the overlay map.

> Would prefer to only/explicitly add the overlay_map.dtb file:
>
> $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo) $(@D)/boot/overla=
ys/overlay_map.dtb, \
>
> or
>
> $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo $(@D)/boot/overlay=
s/*.dtb), \
>
> or as it is a (maybe unwanted target feature) add a new buildroot rpi-fir=
mware
> configure option for adding the overlay_map.dtb file...

I had also considered adding only the README and overlay_map.dtb. But I fig=
ured if the raspberry pi firmware adds extra files, they would probably be =
important. Not copying them might introduce unexpected behavior. When not c=
opying all files, each time when bumping rpi-firmware to a new version one =
should check if files were added, and if they are worth copying.

I could add a configure option to also copy overlay_map.dtb and README like=
 you suggested (probably two separate options then; default on?). E.g.

BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_README

How about instead adding a configure option for specifying a list of files =
to be copied instead of all files? That way you could also specify exactly =
which dtbo files should be copied, instead of copying all of them. Currentl=
y there are a lot of overlays copied that we don't use for our system confi=
guration. And if in the future new files are added to the rpi-firmware over=
lays, we don't have to introduce yet another configure option for it. E.g.

BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_FILES

Thanks for the feedback, regards,

Rutger

[3] https://www.raspberrypi.com/documentation/computers/config_txt.html#os_=
prefix

This email communication is CONFIDENTIAL. If you are not the intended recip=
ient, you may not use, copy or disclose to anyone the message or any inform=
ation contained in the message and I ask that you please notify me by retur=
n email and delete this communication immediately. Thank you.

--MCBoundary=_12203091125319091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Hi Peter,<BR>
<BR>
&gt; &gt; Not all files in boot/overlays are copied to the image, which may=
 result<BR>
&gt; &gt; in overlays not being loaded at all, or a wrong overlay being loa=
ded.<BR>
&gt; &gt;<BR>
&gt; &gt; When using os_prefix and/or overlay_prefix in the raspberry pi<BR=
>
&gt; &gt; config.txt, it checks for the existence of README in the overlays=
<BR>
&gt; &gt; directory. If it is missing, overlays will not be loaded.<BR>
<BR>
&gt; Any prove for this behavior (could not find anything about it in<BR>
&gt; the docs)?<BR>
<BR>
Yes, it is documented in the raspberry pi docs for config.txt [3], 2nd para=
graph:<BR>
<BR>
I've also tested it myself and can confirm that e.g. when using os_prefix=
=3Dcustom/ , and /custom/overlays/README does not exist, that overlays will=
 be loaded from the root /overlays instead, or when /overlays does not exis=
t, no overlays will be loaded at all.<BR>
<BR>
<BR>
&gt; &gt; The overlay_map.dtb file contains rules for overlays that require=
<BR>
&gt; &gt; special handling depending on the specific type of raspberry pi<B=
R>
&gt; &gt; hardware. When this file is missing, the wrong overlay may be loa=
ded.<BR>
&gt;<BR>
&gt; Only if you use this feature, see [1], [2] (building multiple rpi targ=
eting sdcard)<BR>
&gt; instead of determining the right overlay (exactly targeting one rpi fl=
avour sdcard,<BR>
&gt; as the buildroot rpi example config files do)...<BR>
<BR>
That is correct. You have to be careful however when e.g. switching to a ne=
w rpi target. When no overlay map is present, you'll have to manually chang=
e config.txt to use the correct overlays for your platform instead of relyi=
ng on the overlay map.<BR>
<BR>
&gt; Would prefer to only/explicitly add the overlay_map.dtb file:<BR>
&gt;<BR>
&gt; $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo) $(@D)/boot/ove=
rlays/overlay_map.dtb, \<BR>
&gt;<BR>
&gt; or<BR>
&gt;<BR>
&gt; $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo $(@D)/boot/over=
lays/*.dtb), \<BR>
&gt;<BR>
&gt; or as it is a (maybe unwanted target feature) add a new buildroot rpi-=
firmware<BR>
&gt; configure option for adding the overlay_map.dtb file...<BR>
<BR>
I had also considered adding only the README and overlay_map.dtb. But I fig=
ured if the raspberry pi firmware adds extra files, they would probably be =
important. Not copying them might introduce unexpected behavior. When not c=
opying all files, each time when bumping rpi-firmware to a new version one =
should check if files were added, and if they are worth copying.<BR>
<BR>
I could add a configure option to also copy overlay_map.dtb and README like=
 you suggested (probably two separate options then; default on?). E.g.<BR>
<BR>
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<BR>
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_README<BR>
<BR>
How about instead adding a configure option for specifying a list of files =
to be copied instead of all files? That way you could also specify exactly =
which dtbo files should be copied, instead of copying all of them. Currentl=
y there are a lot of overlays copied that we don't use for our system confi=
guration. And if in the future new files are added to the rpi-firmware over=
lays, we don't have to introduce yet another configure option for it. E.g.<=
BR>
<BR>
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_FILES<BR>
<BR>
Thanks for the feedback, regards,<BR>
<BR>
Rutger<BR>
<BR>
[3] <a href=3D"https://www.raspberrypi.com/documentation/computers/config_t=
xt.html#os_prefix" target=3D"_blank">https://www.raspberrypi.com/documentat=
ion/computers/config_txt.html#os_prefix</a><BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203091125319091--


--===============0583829817025956132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0583829817025956132==--

