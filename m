Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBDDC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:00:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4706C60F58
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4706C60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=thorlabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C88605E9;
	Tue, 17 Aug 2021 19:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0uCUmH2-Zw3; Tue, 17 Aug 2021 19:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825DC605F8;
	Tue, 17 Aug 2021 19:00:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 644FB1BF215
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 18:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 535B680CEA
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 18:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=thorlabs.com header.b="HcL5Z/bB";
 dkim=pass (2048-bit key) header.d=thorlabsinc.onmicrosoft.com
 header.b="IMmZUxEZ"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKC6-qlJU5pn for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 18:59:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.thorlabs.iphmx.com (esa1.thorlabs.iphmx.com
 [68.232.130.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D30F80CE4
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=thorlabs.com; i=@thorlabs.com; q=dns/txt; s=thorlabs;
 t=1629226794; x=1660762794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LrkmRlHCTqjMRYPOHNG+NOF0cosxLRnyp/vN5dF3xgY=;
 b=HcL5Z/bBdrADd27zhLKSGCOOjbxqJUSbYnOEspI+aDGNf7PuX852Hg4e
 p4Eci1z6IRIkUhWMqsW4s+fHXOeWspW2E6241MSYKplYW/TencUCF3Ig1
 MN9eraeZEKf/y2cldxFCeiQyj7MK+ORbZXuALCPoSRFD+KtoYspqPgp5K s=;
IronPort-SDR: Be69ytpzkIgkCxoWr7XsGDrsdLQ2vqzvkdRlXo4vxSV6n6ONGtaaLTJyn2amxI6M2SOR01nbHF
 coapkSL7mjpqFB2AxJr9QKU+8hTy4EBujjRF4zuAwl2U4x5qHNPH50PVgzkzlyOe6Y7fgApZ6W
 QoP/1SbSi1eYZ5X18dtWr2uPDarvNe3VDReIeCzX4M8tt7/i3u4nYwNRqZDXeyFE1O0sleuhpW
 n8zCk/8DKOCW2FutX7e6gvkYqkANPjPw7xNBEH7qvEecQTFaxaDlgeykW7W9s8wDHt7BU2nkdr
 jFG/JJMCrI8ryQyc4dsLbSI8
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; d="scan'208";a="28119914"
Received: from unknown (HELO mail.thorlabs.com) ([69.172.143.206])
 by esa1.thorlabs.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 17 Aug 2021 14:59:52 -0400
Received: from NWTMBX02.thorlabs.local (10.1.1.129) by NWTMBX02.thorlabs.local
 (10.1.1.129) with Microsoft SMTP Server (version=TLS1_1,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.2176.2; Tue, 17 Aug 2021
 14:59:51 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by NWTMBX02.thorlabs.local (10.1.1.127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2
 via Frontend Transport; Tue, 17 Aug 2021 14:59:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZycDoFn6cqlEloWKA1xhbiS0qA2iQyUVmWmsveYpO3ZVMZSbwCuFZaMxo14yFunFqxTMEzPuCNxdgHxs8GLlM67/+xk1Mn8ZJ4qiFVMcgVI8DMeplmqmdmxpi3fkd0N7g6ZDtI7AAMVp88yZMGb4LVw9OWGGnJIRE4GqbF0sg9VGKoGyr84wc4v6rogjkCqlsddepVoV2ksbXJDLpeDojW9GeDOET6yWSZu9edXXcQBcd5ETmCCaH61ALnfUm0SgnGjODzJLIytcbjE/H8emOrIpFQQrDRHyuSfucNbvzySJPiRDfAnQ5gDv3R73yl1JNOYhHfL04vko7hy7Z7Z4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H994FVRMuMUekRauqnPgcuLqTonAcEU9gx58smOERA=;
 b=Ozu68znt2KpMml6vj0gLQdqLKEbmB/+zyrlf2QRHo7oqMZv4MmNdfmWEgansucAVxsZ1yWsbx4ZSNgs9N3o0Cw6uDpLNbIIqPxHeF0f3vK6SFPaSAUkiGIzOyMSfgYjiyHwYqiIO6FcFMJFDIoPiaJua2lLlVRL8ncgq+E/XKvRBuUbhRaGONLnZMipxxcXI6duGNQS+LP/Dxo85E4qAUuA1ESCoHVENdbUmdz7zp5wtE5Tgde1JbnwZHa4Sj7z9R24k8+qhGsFfM5w1kuCqnToiops8r3zgnbNzOfFmEbFgBzhB/6EutR9ody6y+JakwCgWfPOkFurhb59/xo5IMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thorlabs.com; dmarc=pass action=none header.from=thorlabs.com;
 dkim=pass header.d=thorlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thorlabsinc.onmicrosoft.com; s=selector1-thorlabsinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H994FVRMuMUekRauqnPgcuLqTonAcEU9gx58smOERA=;
 b=IMmZUxEZ/nT+EbFDx7owG1I5JGeb5wRjAW9R8YdtqGD3JKV4l+yL7PZfX+eslnHtaXwroaBGzjJd4gDK2M/wLPWi6//tQ7WTVBaSKur33B96DmPXc7IEGp8wyfWeE4ZtPGAumzRvzfZ1daJ1pglSQ+qW3Pbr4pQiaB+kNRCoeB24IqXf6T5GWlMlKIkkTezHJw+kPzTI+VgnavvjJ6Ozv4LGPA3RFXsvc3Htn0VGjoDnRrrE2TxG5DAyvka9P3JlN1R4BbT4hEbR1G+Ns9gd1ewFk5ysIhBy2w660gEJncXOnDzUHKYE3zcxn8yfo05SZbzA/zzl1EVfeikqzy7q4A==
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com (2603:10b6:a03:2af::13)
 by BYAPR08MB5222.namprd08.prod.outlook.com (2603:10b6:a03:67::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 18:59:49 +0000
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::20af:6cb0:30b0:21a2]) by SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::20af:6cb0:30b0:21a2%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 18:59:48 +0000
From: Scott Bartolett <SBartolett@thorlabs.com>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] EGLFS Could Not Find DRM Device!
Thread-Index: AdeTjscJqPkSzUsVSa6jAVwDmlU2qAABFkgAAAGy50A=
Date: Tue, 17 Aug 2021 18:59:48 +0000
Message-ID: <SJ0PR08MB65425B09DEEB0284364FA644B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210817201014.235cf403@gmx.net>
In-Reply-To: <20210817201014.235cf403@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.net; dkim=none (message not signed)
 header.d=none;gmx.net; dmarc=none action=none header.from=thorlabs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0929ce6c-83cd-41f4-1f86-08d961b12fd7
x-ms-traffictypediagnostic: BYAPR08MB5222:
x-microsoft-antispam-prvs: <BYAPR08MB522294DA868864C020FBE9C2B8FE9@BYAPR08MB5222.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nYWv6fZUJhXnClPWn2Gca5nR5KwTbT86K5BrLqu/iV5IFMJse4yisAFICLadp50yZr2w0PiWARS/8FTbItrx/3Hu3NgWkD5JuL+yvfQjSuwJbxw/EywU55hpZDYCexJqphHCB0aRrHcgcem1VqvAmqWAmf6TE/Ihp40FUV1Vg83bSiwxlQhJ0IFBtIKwPFgjI16Nq1oOg1JcvRM4UrUIUPRvfCUy93momO0Eu0hdMPWrKlM8LWRPqguQCg/+b0xxHwKAmulOot1knFOXL8t7GGyCqL/h4HgiM9G7ks7JvUVF5bDpTaeyL3KCOIp3C6m64rasSx7sWnVAe2p6Udo3yui91Gv/QaczNd7PmmgpGuy6vWbVQ7HbmhY6NmEburdkZWY3Ts/RQnMxlcoYwZpu/qWv+mSeiReOzLfHC0K63x382KNCtW658RazzwE1n66lqq/5pmGjTXBaAf64BvyrnsP6VE8rxldNQtPQqkXe6eLRTe5RROYnHFlfQBLfnnWSV3fyiihigXrkMJLehLik52D0XgfOSbzvI6MyAS8ji0TbaEZkuecslFJpwPec1CDasZZZHukLPaaXB487ebVDL5lu6G69zt+Bkhbj7JHkvtNQNDiNudJJATrANSdC58sfq2x41GyOvAl7chrEsR4YXL2B4hmj2VyjnPxsLR6cwFAIrCN3+yjssbB/3LoPewHaVlk1VdRDXF9walu+vYpB8KE4oXNf7h8zQKkMrj5MfD/xFyWQUDq0fwXioYgFX5k+XW96zepbHYdMWVhJF95/mKTM96KKs0Xtn8OGyU47cDU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR08MB6542.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(376002)(366004)(346002)(396003)(6506007)(86362001)(316002)(478600001)(33656002)(53546011)(2906002)(38070700005)(66476007)(64756008)(45080400002)(8676002)(66446008)(8936002)(7696005)(66556008)(9686003)(122000001)(71200400001)(4326008)(38100700002)(186003)(55016002)(966005)(26005)(52536014)(6916009)(66946007)(76116006)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xw7jQy5XLrozJm9IskpqKQdaj8WuRBFQ3xKuX6Q9ZoZjP4kzm6RecuvAY/II?=
 =?us-ascii?Q?7uREF6B1dzVGZu765+YbwyQ0uCMp9+pvEiJBwjUEt7cmae+Om/UeR7B4tdUX?=
 =?us-ascii?Q?yhN1tCHe3WCyXdD4L9AoRLdbmyoaNCHdifs4ldN8E5ucH36YJ/MBtt96CYfs?=
 =?us-ascii?Q?iR6eZOWiYjCQVc9U8rBvpwnXrDzh2UVxkdGJEChzxhRQewmWgmLPov5acf3V?=
 =?us-ascii?Q?+4eXtSPKMUw/HAExKn/fU9X51aWBxfklJbqBPWUzCcBRmKg7Nv1qqLAr1PHV?=
 =?us-ascii?Q?P2emhviBhPdHQ/MDy+fE+d0/QoGiRr8nBeZo0CvkoNREuO/qyjn6Ro8xpGAU?=
 =?us-ascii?Q?5UrEvFY6arz8EpIIBhawZv1/kGWJhBaTC+rsDLkOaX6epNzHS5eLXhEt7V92?=
 =?us-ascii?Q?ErVdyKNAJG05N/96EdQ0Qi3HkYKQylY+InGFaKwv389wSU5tl6CrAqSdy+n/?=
 =?us-ascii?Q?kmiEI3gYxPN9GSopKzGmPGyTYBugTNTJin2nlBvhVOIMJVn+o2XaZa/cAr93?=
 =?us-ascii?Q?vFtYghzWXXK+cBhz9YeSztvJvJtWy8TmsxuTw0q3Q0XgIYY99HGTdB9mCIsR?=
 =?us-ascii?Q?NryrncF99aCcMO544rv2khROJXY12WURTwv4JECVUSXesdLGm8EtL1GF0HGT?=
 =?us-ascii?Q?sourX+Lb5CeHhHPqF4jeEiv4ZNDNyULZLqU5alZbu3+TwWA2lLhDCwNg+Rha?=
 =?us-ascii?Q?VbcgOG2KlTTegbmnalKrjaYiicX2pwukT5M1LFcU1lGTxU4jOCzPIJoKY/gy?=
 =?us-ascii?Q?cWBDEBGeUpyPqOIfcEBl1Qb0YO8lgAkYO9uscIydm2fQK/CyQHVLtnJdgU6j?=
 =?us-ascii?Q?Hirnpc9SqoJqICVyKbCvYVvdGq4mx6AXKk4Ia9cq63ujXdVUAlVkLOFSXU49?=
 =?us-ascii?Q?XQIWjw9y9HzodF/tc1bcDdUj/m259lFhgRKNdqAiYGInc7Jy46PlwpKfGEaZ?=
 =?us-ascii?Q?39MTFJ2dnCNmqGD0Se3HsEoxx1NiyyLVY8PfjhhCJ5WAjzYBsH4iP5bJLZAh?=
 =?us-ascii?Q?9/Gs1vcROt5x3aG6UgHRMcth3b1zDP9Au5W2wLhNkIM22nPEtrZD7jS+OsNm?=
 =?us-ascii?Q?k/OJFZkX6oDF0gST60dkhG0SG+fvB81pr6RHj28JgtBbOfNVsGCMG5VeAwPN?=
 =?us-ascii?Q?Zmq1oxwjqLDRUAj5aGMQv9+IUtwg5G7/Z6ROlbFeQB8nF0194bBGitj75Whx?=
 =?us-ascii?Q?xlRITRW42Vb0T3K2WpzykjEhJ3gjrBOQayl+ryrotnDxFhGpd+jQJLiEX0bL?=
 =?us-ascii?Q?DNXItMVJrittHaQ2xxiyE3tX4+w9uBoLaTO56vEzA4g9jJE3QrQ6aSJGlodc?=
 =?us-ascii?Q?Fm9ycbYjhASrtJNd4n9bodHu?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6542.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0929ce6c-83cd-41f4-1f86-08d961b12fd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 18:59:48.7586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 41151004-4224-448a-a787-d4279c1f087d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lH6+q+jKmUwB7gIMnAz4qA7W///WGljk2q9aOXhFaTx24yo32RCtwuFh/iUIRytHphV4EUfB86Bo+uCp3R9o5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5222
Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Peter,

Thanks for getting back to me so quickly.  Unfortunately I had already tried adding that to the config.txt file but still get the same result.

Thanks,
Scott


-----Original Message-----
From: Peter Seiderer [mailto:ps.report@gmx.net] 
Sent: Tuesday, August 17, 2021 2:10 PM
To: Scott Bartolett <SBartolett@thorlabs.com>
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!

Hello Scott,

On Tue, 17 Aug 2021 17:47:49 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Hi all,
>
> I'm trying to run a Qt5 application on a Raspberry Pi running buildroot.  The application runs fine when I use the platform plugin linuxfb.  But when I try to use eglfs I'm getting the error that the DRM Device is not found.  I see this error message mentioned often when doing a search, but so far have not found any solution that works for me.  I've selected:
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> BR2_PACKAGE_MESA3D_OPENGL_ES
> BR2_PACKAGE_QT5BASE_OPENGL_ES2
> BR2_PACKAGE_QT5BASE_EGLFS
>
> Does anyone have any suggestions?

Edit the config.txt file on the first/boot partition on the SD card and add (for RPi4):

	dtoverlay=vc4-kms-v3d-pi4

or (for Rpi3,...):

	dtoverlay=vc4-kms-v3d

See [1] for details...

Regards,
Peter

[1] https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fraspberrypi%2Ffirmware%2Fblob%2Fmaster%2Fboot%2Foverlays%2FREADME&amp;data=04%7C01%7CSBartolett%40thorlabs.com%7C919da371d81c4cb2c6b308d961aa4771%7C411510044224448aa787d4279c1f087d%7C0%7C0%7C637648206254285944%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QZiffVLIgJEx40pM6%2BtT7y9teGDYDYaqrl8T%2Fz861rM%3D&amp;reserved=0

>
> Thanks,
> Scott
>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
