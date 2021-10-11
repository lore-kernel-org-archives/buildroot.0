Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C69FC433FE
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 15:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B448A60EE9
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 15:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B448A60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=abatec.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49ECD401D0;
	Mon, 11 Oct 2021 15:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CB7BHSH1AX9s; Mon, 11 Oct 2021 15:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 520F440114;
	Mon, 11 Oct 2021 15:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5A131BF371
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 15:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2256819D2
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 15:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatecgmbh.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_PT7bi24tq3 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 15:12:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1884C81801
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 15:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ9QYTMLAmX3Aes80fKrRbXeXHl9cc6l5W/oZg2G9CqYWqBKhuFufAk8helsHKpdY/uVWgibWAmz8drc49414oQa7YLFPaQf8ORbWDBwGPNkN0H5qeoX2bk0EvyWkSvm+9mTsWJw6Jh0xUOqRKVQ4V1cvUCl6rLMYAaIeJSEyRx07OQDMekOe8BYCQphOn4rElEHEHw20KOMXqELToVbNOhX0GagY2DCtdydOQwCOi5SBRpTnjIuwXSwZss/1x2fdV2zklaJrCMOkgeDDatnk9j/1mT0CAYuw7BW7gBJIqOTD1IiO6uqouiWI24orO3JS3TZEHO/IjmYsDj8GSg5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3eRExFsusm6BRXm6vB1W4qM53AwlJfoqhonCLA3DjY=;
 b=fpknDfls4W+9bKz5wKembuMIdOpQAevlb5/G68LNQm5qFxG2ZU32xw1sOXHotdFlYYIyiCS7DnMW2Z3IX7K0QuWkPWPJVC30pEyPv7LOZav/SKqKvtoKgDd+OD3Iw2lQqDKXAY6aBUOLawlwbXpBDEmivk7l9MJKZjv07tLNuRT+gih5hwJzNhoXY1c7q/oyjb+KiLuJcYeALAADxkRj59dfnb3yzihNUs/vfksBHhbg4x1sGQw68HVyGYjMsvKrnzrNl/fR6RC7Ngo886OfGB4k8fyqbHZHo6JyiqWMyfA5MtNpEnfrOYbv2+OExDKr8Dr7yVAFuY5UcQbdt6xA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatecgmbh.onmicrosoft.com; s=selector1-abatecgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3eRExFsusm6BRXm6vB1W4qM53AwlJfoqhonCLA3DjY=;
 b=jxPxp4rzkS3z5kT0bTDd5Ag1afA22ouCVHKo9y0rKu8G3zAgeJR9tD/xWTX/WoHWkLTuD5L7MdiCAZKg9WLTmox7TqNq/yTYeHLbt5z6TC+QysNP3H1ok0hH0OWXD5SYvE5KnAWsiTj0aXGRHSBwrUPBVkwuoNr8ry9mwjcRTek=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0800.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 15:12:31 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e%6]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:12:31 +0000
From: Lang Daniel <d.lang@abatec.at>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/autoconf: disable gtkdocize integration
Thread-Index: AQHXvrH3amCz0Zt58EyAhRl4lidCfg==
Date: Mon, 11 Oct 2021 15:12:31 +0000
Message-ID: <VI1P190MB0493F6B7C3CA5E53F0A7B9049FB59@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3d0194fa-a246-d524-a829-2a01fa8f30bc
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 601adc7e-1679-41d3-c249-08d98cc98c2c
x-ms-traffictypediagnostic: VI1P190MB0800:
x-microsoft-antispam-prvs: <VI1P190MB080042DC1DF862402A6B1DCC9FB59@VI1P190MB0800.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ayfsBFKmFpMbkzpR9godU8epUPK4c26IdKQEhJIFTedakS9KROzHuBj/V3ObXSJF4bJDkHJA+e/xFiQAw1qnhf0iaAK56Dm7rbWx13IIhkyqiKtlaOiG9bedbfZrrKi7cfDpTkGRr4eiNGr34vV+kSJaPW0psq66awnTdLBTyvz7IqnJyeIRJra1+oFdsA/MHh6a6vdywzpTU1rnhFt6SDBEKtM/QsOwhEHfM+fUpXW0etIy5mIEnel/gUzGyd9trfST4q3odipeDjo4sHJWeR6jXYiI+pdnJkYhAASZBUEaqRvDb8Bcmhg0brWGX5tzDCVe4NDFEkXwoZe8HuOWgKp3UKo2XG0OkSmcYwC8tsHRkw8BoBJ28XfSjarwFlW5Mi3FwWEzX6TetASHKIXrrz7K172kIc5wOyGouM2susMGQtMyhZKc3v3MIBkq9NM+4esMowwK12V8MCGM6ab3gJGh4NM0JyVv0xmWXozBWAk+7oGmQLSRgCesePUmfYb1iYSoUEid2WLEB8JEfjhzs+gxZ1ccamJ3GU3rUYbJAxmcFR2ytrvWuv1TPI7QNum4zhNEoG4r1tvbV95ZLoRdNGGd95zvRQ5C6tZLg6w+WkdU30XhDxhWXSNfUx4ybG/iTdNhdzilvwh4qaNv/+yyUGBMXRPRUbkyM5++IzP1q1c8z/ouBZv7tVmJ3XYoaFLJz6Q7q7JCFTYwC14ExciyYJrkMwHB61iMaE6UDT/O/4BZqRnUUURBiGs6jepAEuuU2NzC5h4IcXnBK48JzFLRZkFUMxoWLqT++lnhjnqDRg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39840400004)(376002)(186003)(5660300002)(52536014)(66556008)(508600001)(8936002)(64756008)(66446008)(38100700002)(33656002)(26005)(122000001)(71200400001)(66946007)(6916009)(66476007)(7696005)(9686003)(8676002)(55016002)(966005)(316002)(6506007)(83380400001)(38070700005)(2906002)(86362001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cqnZXnMmNDGqz2+XdaMYS0ibYJHefNY/cxYK24IAFDkIVBZzFV0Rc2xe8A?=
 =?iso-8859-1?Q?LjfoVq7K5bTGB8Km0igo4JJMfiWnRPBP9OvWNrTLzfKoLaH5YDKiPwLnav?=
 =?iso-8859-1?Q?e8IU2+UobRxm7WQXQYroN52sbk3j2gW8qXbl2u9itioG14g4qtlBgzo0iy?=
 =?iso-8859-1?Q?gOGC9o16TFAcJWJJzQAzlgQmXV8MoBoRavCgeEKiPGAUWfdOrwIvWcwKsD?=
 =?iso-8859-1?Q?KATKTwUUSo1u/hxpoL0N+aKoeTMVEKBaiiFbxyWKhD1p3IGorHzPgSZ90B?=
 =?iso-8859-1?Q?bYGL07jOCj9TF9gs+sp7fSY5B7ru/TOYDE0idBf6msNrgMF4ZWkmTxTSXG?=
 =?iso-8859-1?Q?F5cAbQpeQt50hig5XrAhIIy6Nsc8BHtZw7S4ek1MnUoLzYiMejWwXVX1Ve?=
 =?iso-8859-1?Q?/AO8JFx1NOaXrWudXgy3b4o4hvpwu72Rj2A+YYJYeCBjV3IIq+GAQtZvWc?=
 =?iso-8859-1?Q?4MbcALZ/Jn9gxeSYHISkoq4wirnJSKhY067MBpuHmsV9J1wcFKZN3JkNgg?=
 =?iso-8859-1?Q?wBOqhH9l/TLRQKPqE+0BAWB4W5ntEgNqY8XqllxYLJJtoqh+t/Xtbepcof?=
 =?iso-8859-1?Q?rhman2aLvlIgptLUlWvA9mkWCQ8uk7oTrJAQASaVio00ux8NNXX61gEhAt?=
 =?iso-8859-1?Q?JPTGYvwIt4meThZaqXkNC77J8onwvPoNAfHOOF/On2WrIQ3ImJHz1bKiTk?=
 =?iso-8859-1?Q?RijOQ88jhDdKndJq4dYJn7TCibsNx2isd4AvV3qa8XR/2mAphosrBFp+ez?=
 =?iso-8859-1?Q?ooclCzuQoYiakcN3B7gH+L5MQJ0C1VP6jJWLmlL7Yf/gt2TC/GMzTycDxf?=
 =?iso-8859-1?Q?BlOJhav/bXIyvdnslCWoG3kZzMNFsCLlWwQHeoLXusG1+4qNBT12AA7ss2?=
 =?iso-8859-1?Q?G6PFoZyJZdb952u4YwIatAw5CBLO25H/LFX465X/errWFhGVViulwzPGJy?=
 =?iso-8859-1?Q?LVCN9i8Xkph/Lc5OdUK/KncTQXSLLNHw0f603GPgsAxbNLHrMVnc8ARJoV?=
 =?iso-8859-1?Q?WUCmbY3rJfL8wql0XAxZ23NCnjjkQm0qf2eSpn8XbduSRT3PCONMSkMGfg?=
 =?iso-8859-1?Q?qXuOguU15uA1iBGkLUzb45v4WP9UfdEU6mWpg4akRsyIjBpbPeptoABDc8?=
 =?iso-8859-1?Q?/AFpUk/aXURpXC0IcM5yjrPcaxAXwWdiuDnU2IY3/Nn68bk6FcsRr86lpl?=
 =?iso-8859-1?Q?cHPCeX4uhDMIepDiwIupexHkjd87laz43oWP2DQex5U/NBHns482/WnYSc?=
 =?iso-8859-1?Q?RFZxUJyOJ8/+q51MmxB/JXy1LXeZGo2+uVgJq5INYz6l+VYG8/IWqILXn6?=
 =?iso-8859-1?Q?OJ80ZDi679c7+zTdBafTZ8Z7FohKR8/m0F3Sapp98tRtTg4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 601adc7e-1679-41d3-c249-08d98cc98c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 15:12:31.6242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsRc+aocxX/ZdmeCPN1WiZjUmLRAMqNQo9cS/LXBhtLAR03HhgQuY8THUMspRXqYBU+nl4BU+X2ZaK0lnNaVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0800
Subject: [Buildroot] [PATCH 1/1] package/autoconf: disable gtkdocize
 integration
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

Since version 2.70 (which was skipped when bumping to 2.71 in ecd54b65c1)
autoreconf checks if a package uses gtkdoc by check if the macro GTK_DOC_CHECK
is used. If detected, gtkdocize will be run as part of the reconfiguration
process.

http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=dd880a0a6de5602cdd40b770ed6b083b34aa0768

Defining GTKDOCIZE ensures, that autoreconf succeeds without gtkdocize.

Fixes:
http://autobuild.buildroot.net/results/d0259d1f8bed195e35338ead6c7c33fcc571497a/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/autoconf/autoconf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 5742ea6c55..7e0850422b 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
 AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true GTKDOCIZE=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
