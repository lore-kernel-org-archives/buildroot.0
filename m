Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3884FC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABCE3404D8;
	Wed, 27 Jul 2022 11:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABCE3404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHgT3jHsv35E; Wed, 27 Jul 2022 11:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C10404B2;
	Wed, 27 Jul 2022 11:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0C10404B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64E971BF20B
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F229F401D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F229F401D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOHFL7Ugc1jO for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:38:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE63D401BC
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0117.outbound.protection.office365.us [23.103.208.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE63D401BC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:38:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=qpy+VMMMtVRj1i0ve03ypdrYtiQnY/AG/VaKY3jB9TqTHyR85SgXL7gn+eyc9MzenTmJ14bDfRCcpSLMLE5ulgTKZQkebMnInU20cyhs9EK4fWLPTRqXNmZrOhNx1EDUgcohigrdLQb6GcmrxTa5tyqB6pBmWfqjhffPhOt5x1ZiYuA09U1JoY6m2j2A7FZMy1aXqodvRVwmnXGno5UCEldifXgeSUzOxFSzLickle8JaHBukQNOAmyq6igil0qEGQhRCmtGl4so4urOonKzPH4lV+ND+keDfxCBYS5NGgc6GA7JVCA7gslsrJ/A48eUSwirULo8cIoZ9BIvD8TBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTyoZtxPUp+H2vbLPxzsitSxfzoTpTkijf67WmK+Cj0=;
 b=ss3g8s7tmRDoq1EDpJ1wBv8tgWDzinygsBkIWRyKdtmEDpGynWH0ow8A+LwUQtsbyi/YjyvZztlylgxdkHuP2P9efDrOaysCAIJNboZGXz/Q0FsdsGkjO6MAQgYXFSnF8bE/OoeOuMbGnTkMxWDC4MdCeOhDood3B1enZrYfAtxRl8/xpDtlIsA2gKSkitce73mbsIxZ56htbsUPgJqYIy0ke2gAPmnyCcfJj2FMd0u10nJEBZFEUudFGiztXmxPfiLwB+/46LovDS3JSAc+s64koWVMSLyh4iOQF0+C8WDdigY8yofYujAkkZe29bJ/UTh3ztu9kQ4xyCrp+l2sIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 11:38:18 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a01c:a0e2:2eaa:977]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a01c:a0e2:2eaa:977%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 11:38:18 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] - Re: [Buildroot] [PATCH] package/mcelog: bump to
 version 184
Thread-Index: AQHYoRd8t3LoAU/bWE+LDR7DExovla2REFGAgAEH9HA=
Date: Wed, 27 Jul 2022 11:38:18 +0000
Message-ID: <PH1P110MB1603C0224F20D0511A14C3E09F979@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20220726174505.2976048-1-vfazio@xes-inc.com>
 <20220726215235.56555d7b@windsurf>
In-Reply-To: <20220726215235.56555d7b@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 104e9e65-f507-458c-e680-08da6fc48045
x-ms-traffictypediagnostic: PH1P110MB1441:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DcLXjKiZP1zMMqsTSMsboNWKI89hpL8RiMMdSm6/hkHaWMIQgvNoiECesyEMxhvs+6EIWTwtBkBOqL3QOHuGUrkRhrSVavDx2C1uXCLAHGFJhUU5NH34WU4aiwSpnyBld+f8ei28hQpV8eN0/3XnxhGxKhUSMU43z1ZPgA+TWyLwNd2twNfU4z1DT0if8StO6An8eqecTAzCU+RwT/ZxdAAFanMubpGcpkx3aP2NXIgjuf/kER1J1PH014SOOwrtad0jC1/6DYVmom5JerimegeHxeSEmmMw/Q2Svz5QdB+Bz/6etFicEHO8EgYUUDExgBRNjVZ0HOdMSFcJ1/8GViI1P61X9s3KWiweSnMH6ZC6fBxBiM7kp0hpJAFAEsSLzeddogkq6oy5mCbH0hYxJakMw88dGUiVWxqWTBBRqXQE/4zpFgaWljpj4EcoZVs2Y8ohqX8VwHXZ5YmH0K6sNingnKYMe6fS/6vmqv8vPuwkem2wyWfzVpDQb3+gbVPnh/SOqwJsqa/WLJZ1D2yBgTa1LbDN/zKDPQjuKggP2dmGu4HQF691LTOcR91Ywx6eVZHPRGjslG89qgAe4xaFIAwHndqTp0FQEMqnBeEw3zy6sMI1kEkljJK6qvcUwHY9t6x2DZl6Sh20eXtyNNmvCi0zbu6rsWV9vTjg4yRvlDRjnqbajgSZjsYYnFBS3BCPQKZPWneW3o7oocbt6sV2k8OG3hLE35Q0PkOeEXShUn+XkAKZMduPb7t/5TmCDn1UrOd9xl73e1ofiOJ/Pc0vWlamwGRc7U3NB3RL37c8bPctkvtiJ1GORuuU/uXGlBoQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(39830400003)(396003)(8676002)(53546011)(7696005)(186003)(71200400001)(6506007)(52536014)(66446008)(9686003)(4326008)(66476007)(64756008)(66556008)(76116006)(66946007)(54906003)(5660300002)(83380400001)(2906002)(41320700001)(38070700005)(26005)(38100700002)(6916009)(8936002)(33656002)(86362001)(55016003)(122000001)(41300700001)(966005)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rzbxkd5/mSw3j4sURZt+mewCHGC3IzbJmJr5ab9n62kK7bferJjbc+90ysTk?=
 =?us-ascii?Q?R5W+tELs/oJkfenTADyyFplqUPx76RhEAaLDipkV4wdMuwGP0/NpLQ54QT4U?=
 =?us-ascii?Q?e79uztUjtjGXfND8K0SRFSUGV0+IHxNNMI0fWUNqzBnTpBTj0HJM0wV3CSkY?=
 =?us-ascii?Q?hnjHAznaCPTDO9oamvriCYmKaYnSprkiQiYIfxTt5NnpAphNQcwwntDEVl1f?=
 =?us-ascii?Q?8/NcHQnnQUyTEX45eVjI8roYoBiArvY/fGRFU+nBzp+88dYxiQQ/Pg60UOa2?=
 =?us-ascii?Q?r/OvGS4zMF2cTc/X7WUl0YMi8zRBfLh5Aaiw6RYqtjPrM2x5NLWkX8c3V+2U?=
 =?us-ascii?Q?EEipp6QDu8OkhEN62xSqzjYLJs81kfgrGDDQvPkF5TR1tYXUc8r19r01Iw3L?=
 =?us-ascii?Q?FJIUBedTBOD7D0R5P6VRwfI9wvSVfj/G8/LnTpgym2ppOTTkeJ/+P9fMen4l?=
 =?us-ascii?Q?OSDKyhDMN6Y2EsNLfo/Mi9z6+F167LrsPrfkomGD67WjockW3CpzuCHZVVFO?=
 =?us-ascii?Q?NX7q8M3AvHdEWaemw/0Tq1WTKwMfGon6SmoNnDCwgZRcsQGgMqmefwE2TgHt?=
 =?us-ascii?Q?/E2SldKIa+Vn1beup1PPoSUim9bXFQqL/hsUInBT7k4VN4IFe+SgMXgh7nNz?=
 =?us-ascii?Q?X9DT0rPLz8b9eQKFtcFKq+kSCim0EYi8MBkwF4issvOKlMaxvabFesc2uAnu?=
 =?us-ascii?Q?8h2GPwAkosAEDc06qaVSdixYySSxsAr0VMbNyjdDBXIU+Sx3hCIuOpc+pBfz?=
 =?us-ascii?Q?4XLbtOy4QvmGZSATokxRq0RIIV77npWcQWc9lDHtY5JXhj5i09wQlDbEMPCR?=
 =?us-ascii?Q?XxDgWW6myOn904sRUAZUfWOV+oe9REYVNfNvDrG3p8D0G/IjUHwvJPPKzGj9?=
 =?us-ascii?Q?Rl1qBvoXCqVuiE17sNsNehuO8UwDl9/enB6fOLuttu2+uugzGdKi7Oxoh1Iq?=
 =?us-ascii?Q?CLhUbaJNraSwtnNdKN9wM8xGuhklNeR14Xfd/Z/UlDtERpMGKh9vHFfUreTm?=
 =?us-ascii?Q?MLEbcV/HfPRqBoEiIK/+ZzPgW5wV6EgphXSXOizT5vGKHGTSF/BhBoy6Xmef?=
 =?us-ascii?Q?FR7OteA2/UBTL5GJPpRR/9adKYE/jmMAbZFFdqD2oMb7UoKelxcPkS0cQeSd?=
 =?us-ascii?Q?R2lRq5fRGDcAAoSb6rs/JVrqK9zcKnPG1XvLBDhSOGxIiOJ2V4bs5RHE4NeY?=
 =?us-ascii?Q?07ECM+FBMGXabiPYczgtZfpJ9HKIAi5qBB1ttacrtov/GHx4kRO8DVEAjofB?=
 =?us-ascii?Q?VtQA0ZZO39WermyOLO1FcyF9V3j1X0tlMQ1hQccmTxPJxiGtGHMKbWKT2YcB?=
 =?us-ascii?Q?07I/B/W2T54tIZlguSOX/e6JUXH/ozP/GA0Qd2uLPP+LI1tO9jm56Chqs5XY?=
 =?us-ascii?Q?zUwI/gTM6uwtDDcYjGqcAW2KpVY77KWk6DHFS4SH99Y0xp+IVwal5KM+WVFw?=
 =?us-ascii?Q?sl3qbMMYYNV9f7Qu1aozCVFlXD4FilYaAxGU0uxHt3WKgeKfGDLAwXjMAxj2?=
 =?us-ascii?Q?DIZV49JFCDEQkp8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 104e9e65-f507-458c-e680-08da6fc48045
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 11:38:18.2372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1441
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTyoZtxPUp+H2vbLPxzsitSxfzoTpTkijf67WmK+Cj0=;
 b=1sTnTH+793Ea1oAMq7xueQJiBOYX7cSe1EqO1A2R+It9bz8cClgnmtg2wDtILvojXPS2/b/F3HWQbhTjP0NDtq4JkE2ZGlJU0GsQdyUeLfnMuw1LQfsMRi2olOstMNOKWliVx4aZGCT2KLm0fkbpSX8NR+N7nzJqsYHlR31BbDhFn2nOtFNgXAHiQ7JVg/Pgg7hxFf6tqOzpRicbqYcrMw5HKQJsPAqKEQwDvbjnc03joISN5EzHlz/Dy+KVMRMTbSsM9UQfIyabshucbXif7lOcIh9t5m9cuWLyxuw1iWwCEFvKbWbcLVxLd2UhI2GwGoHNSD/wA+isYykwSt+NmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=1sTnTH+7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH] package/mcelog: bump to
 version 184
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, July 26, 2022 2:53 PM
> To: Vincent Fazio <vfazio@xes-inc.com>
> Cc: buildroot@buildroot.org; Romain Naour <romain.naour@gmail.com>
> Subject: [External] - Re: [Buildroot] [PATCH] package/mcelog: bump to
> version 184
> 
> Hello Vincent,
> 
> On Tue, 26 Jul 2022 12:45:05 -0500
> Vincent Fazio <vfazio@xes-inc.com> wrote:
> 
> > diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
> > index 598aa648fd..94b5f2cc37 100644
> > --- a/package/mcelog/mcelog.hash
> > +++ b/package/mcelog/mcelog.hash
> > @@ -1,3 +1,3 @@
> >  # Locally computed
> > -sha256
> e9c82b565da06673c2630f9e6bc668634ad7d2c7f13c70db1900cce110ae62dc
> mcelog-180.tar.gz
> > +sha256
> 067d52006f0aa42045acc6d9c04d590362448bacd8ef415d42729e6f35825028
> mcelog-184.tar.gz
> >  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE
> > diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
> > index da7785ca91..6a0d806661 100644
> > --- a/package/mcelog/mcelog.mk
> > +++ b/package/mcelog/mcelog.mk
> > @@ -4,11 +4,12 @@
> >  #
> >
> ##########################################################
> ######################
> >
> > -MCELOG_VERSION = 180
> > +MCELOG_VERSION = 184
> >  MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
> >  MCELOG_LICENSE = GPL-2.0
> >  MCELOG_LICENSE_FILES = LICENSE
> >  MCELOG_SELINUX_MODULES = mcelog
> > +MCELOG_DEPENDENCIES = host-python3
> 
> If I read correctly the Makefile, it seems like host-python3 is only
> needed to generate the manpage, which we don't need. Perhaps it would
> be useful instead to contribute upstream a make variable that would
> allow to disable building the manpage, and therefore get rid of the
> host-python3 dependency?
> 

This is true. I can look into doing this, I was just trying to be as minimally invasive as possible.

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
