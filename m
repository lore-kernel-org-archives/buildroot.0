Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6C4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 10:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77E1C40AF3;
	Wed,  9 Mar 2022 10:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0u930leO_qoV; Wed,  9 Mar 2022 10:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD6AD40AE5;
	Wed,  9 Mar 2022 10:25:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B088B1BF576
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F569417E1
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xqcsi1sQlx0x for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 10:25:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 211E8417CB
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 10:25:01 +0000 (UTC)
Received: from CAN01-TO1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2055.outbound.protection.outlook.com [104.47.61.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-F7YYr8SzOvSvWYCiywCk3Q-1; Wed, 09 Mar 2022 11:24:59 +0100
X-MC-Unique: F7YYr8SzOvSvWYCiywCk3Q-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YT1PR01MB4043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:24:56 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:24:56 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] [PATCH 0/1] package/rpi-firmware: fix missing files
 in overlays
Thread-Index: Adgzn+q6MZHzTJvVSwuFUAtkb7zu7w==
Date: Wed, 9 Mar 2022 10:24:56 +0000
Message-ID: <YQXPR01MB6121B5BE7F63DB8A3CD0305FAE0A9@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f3fbc18-0cc1-4d2e-18ba-08da01b70f03
x-ms-traffictypediagnostic: YT1PR01MB4043:EE_
x-microsoft-antispam-prvs: <YT1PR01MB404386399900660578109201AE0A9@YT1PR01MB4043.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 1gv5pQqKsQgRjPR/seX+wUVRALPvfWvNwEOGY1fX5S3X+ElIo9iY4EVWxmj6SGIR47uPRj6aHknx5eZ8qU7KorIx5Zf3cvqaCtdcEiU229l+ECEzqd0RpTAKMsR/JWDF1fDgEP9z2Kxxkv7tNuf1C3NBGBj75TgvWY0NknvYTzKNJoJBGfZym6Ds7qSdUqty0CFLhoABMTFNF572uaRiIemZYhXU2YReZHzn1u9iaCr64ujMKXha6kUmsBS+rZvNu5V3MNwpcHI2glyamzbAqtoee1yLEh2kvvuQvgC3vlQkxif5YQbujxWsq0U7grg0qIrGlvdZedQ6R5Esc7qx85IKGBnFWIBE2zhS0SFoBY9TD1ozQMTTK35H5BYf9mLdmZdiLaKwxIbqUHg5ZC8RrzDWH6kuExI6BgYaxkKsBxUgMEB8YYi8QeiKwuIWDm3gfwmyOU2Z/miHoSdWvd5TpF02i2AlsG0npVCzlvzABobhE7eWWBzBJ4mJKBzPNEZE/327lgfxKsFYU6z1dq3NyDCmsZYTVu/N7cOdgj84jqaRrEA4OZSHMrD821Q/aUXPjvevFegotDE5Bt0N9CHzg9oLASGAr3/CtKPoxeRDNO5Hta46jv7g+QFEe5HgTamBYcG74Y/ZJoYsRdT1grdmiWosWUJ2PrwIA3/83i7bqaQErFTn3sptKCk6Qr9Z7wqNCvCI3mnD0pWgpbYUS/idpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6506007)(316002)(33656002)(7696005)(508600001)(26005)(186003)(83380400001)(9686003)(66556008)(66446008)(4326008)(66946007)(8676002)(66476007)(76116006)(38100700002)(64756008)(2906002)(55016003)(38070700005)(8936002)(6916009)(5660300002)(122000001)(52536014)(71200400001)(54906003);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zo2BBCgWyHf0RPtlaMbs6qf9UU7XYGuA/n1boD8hrLou4oWXxG/3ZHUjpYrj?=
 =?us-ascii?Q?wR0ME4z5dXGLsFicxfW3niPGd8yufQMz+SuKIt6o1CSu0XNTnrZwqMutFmCK?=
 =?us-ascii?Q?rPP/foygxbKqJjEvdWlsa6y8t/csJ+Bu4rC5vK6sx9TS5WzitPyahgJk4wgU?=
 =?us-ascii?Q?B/Wk4OQ27Gb5lhA4WKDDnHRIRaIEaWPZyfUDqNHJpwUQMcpqeJTZMM6Udnp5?=
 =?us-ascii?Q?lK1fi+zXB7n7Dc3YkO1jD5Gua5nuk94Ym4c+HniZAhOd+EArKszg/1yK93Uw?=
 =?us-ascii?Q?5ZjkbUSNPn8JO0LK6jTkkuB0D47ygfUs7pTiBHImwr5tWoDXIcag2R7fCaE+?=
 =?us-ascii?Q?CoOQ8iLVEcih37zrKCTsV/qDfXJfIex33BR1U+fPkdBaS2as3Ns3r5WG9lbJ?=
 =?us-ascii?Q?xH7/LQEoBRu5iMf+fgy5+zkYVRmU5I29he9hYrSjc/a7tSsJ1NYYAn858b+Y?=
 =?us-ascii?Q?HK6KRBVMDxDmHTCZXQmchueacB6WAANHo6ih9F9VYrb/AFo4oOgS4ftp9ZqS?=
 =?us-ascii?Q?mps1dXFZMcGuO3kgwP4k/TPTT11h+dP1qOM622KOVfp6edvlpqNLbTS7phCB?=
 =?us-ascii?Q?EHXgWiUpRg8yYMXisE+eRFtmfWeznghfN56qwVN+bmb6LDe4aVkiw4MUInwd?=
 =?us-ascii?Q?4Izlqai1Z18XSCm3MEMzqcLMkC9Y+oNYay5zTjhQATcH+RyeRQP/IbDo4gVi?=
 =?us-ascii?Q?TxM8DEo923GN7hhUlspHkCd/WH9VxoWpI3WkrEw7wT4eJSMWbSsVN/UmOrjD?=
 =?us-ascii?Q?PD3KYsjX0Zr0V5JVvlkqEtFc0T8OX+BM0kz1IlIDWokjmDTbGnzNU28omn/Q?=
 =?us-ascii?Q?/Iz8e0A2VS5/5TE+jmO5f4iPGAyB89yLhmNcHssr73A733BdYIJeL8uf3s8U?=
 =?us-ascii?Q?/Ku4dwSj/S+tyHeTiCywN70gJr5c2xYgw/9UohYgO9/6i2MSxji1JE+9kf+e?=
 =?us-ascii?Q?yHw0KAj6/1qhXwLMbkhhqlT8p3/R1keRyvkL/cF8VMerLbkXLw+xqeDEm9uQ?=
 =?us-ascii?Q?YFSyf4D13MjmuE4i5H/NH+akszB9TLfImFpMXijEX58wg8l4Emz673iolsc1?=
 =?us-ascii?Q?kPmR0f63zfMwxiHewnrAvibzww2CbiObnMHWZ4xPuPPlXLH2mNcNi4SmYeJa?=
 =?us-ascii?Q?cLsmd9yuA1W0zD0AnQCMkFd3XuDqbcoUz82tXNKwcrwTSZdsmYJp3pHwcUpz?=
 =?us-ascii?Q?s1UzLdum5zlN9njBhdoair8L9OJBGeGz5I3NFSOZrHn207o6RowbZu7onP6G?=
 =?us-ascii?Q?fiv3qlrOxWrblftWUu6B1zlpS4yiw2VkC7Crk1lIhRewzpqKcoNYd4apdRBf?=
 =?us-ascii?Q?qLT9TSrUgxV9oS/so2BasZB/Oj7TY8I/2vR0kh7/LXYCCqSl48R93AQgdEOG?=
 =?us-ascii?Q?H/xZXgy6aqskTeiSm3s9ik45DIlgSpdlczTGeaMfRFNwltGMGqAti2hINJrt?=
 =?us-ascii?Q?sliY9il4LCKCvGQDkbgn6YzHFizzNamE2xzfpGlbbJrR3hZXtlHU3cztnBC0?=
 =?us-ascii?Q?iIYtptyXy8u7PnPN/HzsD8ZSz3LrQGZOjOXwD31nDQBADk58YB8HaNfLV3Ku?=
 =?us-ascii?Q?ft8bj+Hs3lvchHDEYpXXyFOb7tt278saV78EdRImmDpNp8C1STxz4EB4fUPb?=
 =?us-ascii?Q?B3n+wfSf9o8HwUNT9Y0gl8/fbIoTyqdJFcTJVDxRxf8pqqMPYbLYXxpWbVoC?=
 =?us-ascii?Q?VS9IbA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3fbc18-0cc1-4d2e-18ba-08da01b70f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 10:24:56.6819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3n72SAMiVzvnNxdEZHf9FnEGELdNKEqoA8tIGpvAj/Be6aZf2+JPK2fmSq6bf3vethYYuW+OEg8oworMuTW2IdU8sTInbBlaJFRaQeU3VOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4043
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE5A40 smtp.mailfrom=rsassen@comecer.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: comecer.com
Subject: Re: [Buildroot] [PATCH 0/1] package/rpi-firmware: fix missing files
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
Content-Type: multipart/mixed; boundary="===============8363246723069910574=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8363246723069910574==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203091124593691"

--MCBoundary=_12203091124593691
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

> > Also, git stripped the leading TAB character from the changed line in
> > the diff. I'm hesitant to manually edit this, since I'm not sure if
> > this is intended behavior.
>=20
> This should not happen, are you sure the tab is committed?

I think it must have been a mistake on my side. I cannot reproduce it. I wi=
ll fix it in a next revision for the patch.

> > This email communication is CONFIDENTIAL. If you are not the intended
> > recipient, you may not use, copy or disclose to anyone the message or
> > any information contained in the message and I ask that you please noti=
fy
> me by return email and delete this communication immediately. Thank you.
>=20
> According to the email footer I could not look further at your provided p=
atch
> ;-)
>=20
> Please try to re-send without it....

Unfortunately I have no control over this. It is added automatically by our=
 company email gateway. I have submitted a support ticket for it, but I won=
't hold my breath...

Thanks for the suggestions,

Rutger

This email communication is CONFIDENTIAL. If you are not the intended recip=
ient, you may not use, copy or disclose to anyone the message or any inform=
ation contained in the message and I ask that you please notify me by retur=
n email and delete this communication immediately. Thank you.

--MCBoundary=_12203091124593691
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Hi Peter,<BR>
<BR>
&gt; &gt; Also, git stripped the leading TAB character from the changed lin=
e in<BR>
&gt; &gt; the diff. I'm hesitant to manually edit this, since I'm not sure =
if<BR>
&gt; &gt; this is intended behavior.<BR>
&gt; <BR>
&gt; This should not happen, are you sure the tab is committed?<BR>
<BR>
I think it must have been a mistake on my side. I cannot reproduce it. I wi=
ll fix it in a next revision for the patch.<BR>
<BR>
&gt; &gt; This email communication is CONFIDENTIAL. If you are not the inte=
nded<BR>
&gt; &gt; recipient, you may not use, copy or disclose to anyone the messag=
e or<BR>
&gt; &gt; any information contained in the message and I ask that you pleas=
e notify<BR>
&gt; me by return email and delete this communication immediately. Thank yo=
u.<BR>
&gt; <BR>
&gt; According to the email footer I could not look further at your provide=
d patch<BR>
&gt; ;-)<BR>
&gt; <BR>
&gt; Please try to re-send without it....<BR>
<BR>
Unfortunately I have no control over this. It is added automatically by our=
 company email gateway. I have submitted a support ticket for it, but I won=
't hold my breath...<BR>
<BR>
Thanks for the suggestions,<BR>
<BR>
Rutger<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203091124593691--


--===============8363246723069910574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8363246723069910574==--

