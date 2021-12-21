Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5164C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 11:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2302260EB1;
	Tue, 21 Dec 2021 11:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUwm1uXHVSpd; Tue, 21 Dec 2021 11:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D480060EC7;
	Tue, 21 Dec 2021 11:48:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75AB41BF35F
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 11:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63AE860EC7
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 11:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJIKypc9B34v for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 11:48:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 282FC60EB1
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 11:48:09 +0000 (UTC)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BLBarE1020894;
 Tue, 21 Dec 2021 03:48:08 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 3d3chmr4tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 03:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYHTyVm3O2J8WOvItWYT8Rz4FuSRkmX9/Ut89BAE81yV9HaY6Khh2z7FG4bkXhgyQgL6JZAHAE18kzmwcRFHhAJ0wi7rVsXhKF+1b3O2l+esFlEZ0CAE0Oqu8zDhLec5JdbJ+EnR3iC09JTYNvBqFsQtsJx5gaIswRYhUgmpAmC4yB9MqV+4WIxRuatURGBuL9066UFJnwMQ++eRT/rj/NjHs4QDHNQvYsC8eJp6szL0zgsFP2ew2ZbKwI7oQFNo7dHo3AyX+vUJvZTQ2EjTm0hzHh6l8v/bzJn64IGWkdTj/aKHX1R+4bfxCe8ggj7DKDol0lmKk28JwYRJ+ADHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il9mKis5DrqdzBOT6i91vUe3v0PHAU/pf5uqRtXQIS8=;
 b=WH7dzgvtSEnmy14bL+we+W+/zLCTd+m9ig/NEuf+tA4DfQJsM0KsdM60GYNRDCl1QGV70FERLzRcxrigqBlxACkAjUzIY0tY1LujGxa7SAVe6EH5RQpwCHWT8JcHb8Vn0ROGxtWsfciOHFQVVABPB3eXSxrdZThHWUl69OdAeMf4dgr2Fqiqlv0EHubktEmAvDw3doFYXzGTJFlC6Ib0SW2QV1UcUsv3AoRf66HFbuSNDNrsYmWzhLNGDMN6u1e/at8qZn1TnMtJy5K1UreYoEboDBVKtYjZkTFxwURsZW0F5/D+0H/fy/7YFIgpq11a3416xF9dof6sMjUKXujt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il9mKis5DrqdzBOT6i91vUe3v0PHAU/pf5uqRtXQIS8=;
 b=eMoWsN6P6G72x/3ABkI0nkzp9icuxp4arBPwz7/bv2dEw4WRNnrFc6XLZ/zHpWeeheMj2pgFMdPjShJ9WM2hdDj7yf4qRR317bPKgD9m1WLHy67t0+aadNXmYf/1npySYa2cqYAt/cDS9cam/vUycb98nbFK6TCOMcwhZn4iu0g=
Received: from SJ0PR17MB5493.namprd17.prod.outlook.com (2603:10b6:a03:386::15)
 by SJ0PR17MB5496.namprd17.prod.outlook.com (2603:10b6:a03:394::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 11:48:06 +0000
Received: from SJ0PR17MB5493.namprd17.prod.outlook.com
 ([fe80::3839:2552:2d4b:b45e]) by SJ0PR17MB5493.namprd17.prod.outlook.com
 ([fe80::3839:2552:2d4b:b45e%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 11:48:06 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/poco: bump version to 1.11.1
Thread-Index: AdfzWOA1xbOm71yuRai4xKKNmHwzig==
Date: Tue, 21 Dec 2021 11:48:05 +0000
Message-ID: <SJ0PR17MB54938C9DC46497D9C09DA979937C9@SJ0PR17MB5493.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d71a97a-c02d-4e57-5828-08d9c477c0aa
x-ms-traffictypediagnostic: SJ0PR17MB5496:EE_
x-microsoft-antispam-prvs: <SJ0PR17MB549649E3DCD348D78C92409C937C9@SJ0PR17MB5496.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pSkRBjl/IOy1r3qsm7wG6i26DWQpNxmRPJOz6vgeCSV4J3TMoXoJHk39lhC8ea6VHuVf/uSP4FXxMHPsDBj2DBfvgdODD1k0L3wPOudqXJl7ejLPREYiN+yV+/IIcqOH/6iB6xhnLxXrNOyqaKVYVmuW1QKKWoHiCBDf8HSnY41vWgfV6RKomqt3ZDffnWflrRV7ftVevxcJcUSec6eCRQZrLd6vBZuC7or8b62CL4j/7Nzg+cnm1TcC/Ak5/mpnWiwy8ZYImdmJ5isITw/rb6Wpd9sgBR1SDH7zoCF4ixj7tNARf2Uj7/fqnI1iEFuoMlvjIIi8w5utFD9dq8P55KvnylpWHjy2GjoaLy++Kv91wyhVIynYMIpshc7lhGfsI0zMXmXwcH6GbTx0Psyv+sZGQNhXu567RhoyRiNsQ6kLBliF2r1Rf5d8QJ/RVxbFxoR9BRlJQXPOR9C5EhfJfhbNxNOIyd26oeU+D5KLiI7v1gFBUX2T+vsmckhcfS0Tr6jmyFmrNTAnIuO3UOFD87TwVQSFj9kD6iqKmEA19hiuYcUfhjNIPqzBnM+lGpbf82HS2af51adEvqjJ9t4zLHiC58qNLhOJXFm6QSM8VSRpe64nwTQekrMRDRxQzcj0WXHjvH9X3cL8P2TZjuIxg0jcfaiPYzr2PjyyXDARFOpq/Z+GU2haCbOGVIurduwg0iU1vL4RjJSe0Gmj6ep8XGt/uh5Hd8o92HUoWHGf/Syl6fmLL1I0wM1mYLrh1NJrky8UhPrpMLwqb8zAR8eHH+pry1bagv1a/jZJyXKum0wJOaSlSIbkeETZIDZxlas+ZCKXNorZr95pSCkgbSHupg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB5493.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(83380400001)(7696005)(316002)(5660300002)(53546011)(9686003)(966005)(186003)(508600001)(38070700005)(55016003)(8676002)(26005)(54906003)(86362001)(66574015)(52536014)(2906002)(64756008)(6916009)(66946007)(66556008)(71200400001)(66476007)(44832011)(4326008)(107886003)(76116006)(122000001)(38100700002)(6506007)(66446008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vn6jNqT5pY66qIxPNMcsJzhg1LKMzsRS/OjnbIRAst8rGhvfCtaF7mu8YQ?=
 =?iso-8859-1?Q?0uxtuBv3QZVMoYuCBktRjwxG7viDCRYprGD2S1MuKQyJKofCFPdTHTIOBY?=
 =?iso-8859-1?Q?tgQ4noDe0LAPF8O/llmVof8VkooALMtqA7KRGYmJySH/GKkFxZ+kFTiDUh?=
 =?iso-8859-1?Q?2fAiz9e4eW77bbXqg0SJ0KWZCzzubkjW08ji+iTC8trt61enfC+GwJCbLd?=
 =?iso-8859-1?Q?grMfX9gMHo7QDOey2IS5zNt5gMLMCQNrIE+1mF2vVAIM4CQNwfhiI/SpvK?=
 =?iso-8859-1?Q?NYHqT8cryTF/q5mZsOBqOxrrdBNE2SDOmPH/zd9+TEQ8vJY1YSVOiGi6Vk?=
 =?iso-8859-1?Q?tNckYColeNAWg/BJrD2HWuKsaupaz28xjVm+uYcWL3+u9qFJOPcF3ZMj2A?=
 =?iso-8859-1?Q?IAZPhpXhutE7TmGB65ZgLptVkct0k2wfe25m/06ROIMd4fvPNNUsattPpX?=
 =?iso-8859-1?Q?kCKpOwXAL8cuqu60lvZBAmgEw5wHH4FK+8fyNQMSvy19RWXcJhH7/IhtvC?=
 =?iso-8859-1?Q?M8knDSSR/rKg8D6ftRzUZiLHgu1/4F5+nYHcwvb8+X//y+2FQ3dWjcDG9p?=
 =?iso-8859-1?Q?JPeByVqgmxYLvw0HiYSheeS8m4cGgAHXKYfkjoablFcHwwxXU97nSRx8NE?=
 =?iso-8859-1?Q?GtXCB6vtAj4hRL7yxshKMuEDBv/tIEESLcC8t0Ctt6doqBdFWZaJHXSFJx?=
 =?iso-8859-1?Q?23ag2tkWH53i7cB7yjPexXmdT5KXAes8HX38GlFS1rNpPhWY5FqUlmgS13?=
 =?iso-8859-1?Q?VMkSgpCCO9VMgE7u1UjRQDlFoE9EYD/XzEm+Jy5wB9i9N3SqPS91wk6+jl?=
 =?iso-8859-1?Q?h98/dSyaEfcXHlPGSAnM6LWCMNRydHt7XLkYJO6Oz32dFSKC9BVsHJehOs?=
 =?iso-8859-1?Q?u4/2fOTh8S/PGYH1pbt5RPtkWeh7QGty4geRYFCOAgo5OdS2VVe1o+7J+C?=
 =?iso-8859-1?Q?2rM9iPfKGCFrOWSQeWxIvKOH6un6NbJgZjVivaLepynXxuQrA5eVrkYktH?=
 =?iso-8859-1?Q?GnJ40wW/ucfgdfaeghuTatabBfKU4f17IkIxl3kMj/elDFO9Utx5ZNM/c5?=
 =?iso-8859-1?Q?wMuZ0X5aXLsTjVlqeLbRCF/AI82vA4SsYGNvnEKuTPOeC84/kZq7xmFAyx?=
 =?iso-8859-1?Q?rvQE9mVhASQoYgVH6qRo0ih4tednpps3nzIV8Hyrkt8iT5wly2TwUubGPO?=
 =?iso-8859-1?Q?R/SHvU7LhB8+Fr8GXVYRwAOiapoWamVVW58QMk9KSFvCfRo5RWxTUqeqdw?=
 =?iso-8859-1?Q?c6K2Sp1AqTGpvjnBG2AGEK1UMbP9uBiAILRBNkC5Kea9z6ir5nn3E8WHP0?=
 =?iso-8859-1?Q?r0BOIHMDIzoz+xkz2TZznzq5aigy6K5X0hXrDPU8jYvLiSwozqr6F2qk0M?=
 =?iso-8859-1?Q?8UeAxVzGXG38fBjj/hT5EJRuIN1BhjN48VV//h4AbGO80TWCxp+2liq22E?=
 =?iso-8859-1?Q?kiaotwuKWk1v2/n/mIsQhOZW0WDTeXzNFnSjCneLHhKs+Jno4R0k+jr2DI?=
 =?iso-8859-1?Q?ymYB3ZJ1aeAmvBab0wx6MSwe06hIPHVHPwgTUSbiipFDvLt7qKVBW5q8H0?=
 =?iso-8859-1?Q?NFgtjUiZTR15NgC3LvtzxLIGW9Nhl4aL6YzAFuQTA3Ym6bk1En7gddLDgM?=
 =?iso-8859-1?Q?yYS2BCCs10Uyh4OU2MumWha6ny6j4jwV3cxl6F8Hp0RoKnmYF5xtgZeUlf?=
 =?iso-8859-1?Q?ULjGNiNFhsm8Yp4VnEbrUCIxuQSWUqmRvImUbm5C4YJIHJHk2E3vZq+FRu?=
 =?iso-8859-1?Q?lAnw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB5493.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d71a97a-c02d-4e57-5828-08d9c477c0aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 11:48:06.0927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VrqQpidCy+UdDpRfipB9VP0M+pSMYAXqD5m9q8X+T1PFjc8RUy6oyhfftxV2UU7d/4bXHpVQJ7zRcj2N9r9i+XMxd6cJlJOm3+YinHm8M1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5496
X-Proofpoint-GUID: OTW4OIB3630EBbylUpRoCR9c5_Lk719X
X-Proofpoint-ORIG-GUID: OTW4OIB3630EBbylUpRoCR9c5_Lk719X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_04,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210053
Subject: [Buildroot] [PATCH 1/1] package/poco: bump version to 1.11.1
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
From: Tudor Barbu via buildroot <buildroot@buildroot.org>
Reply-To: Tudor Barbu <tudor.barbu@keysight.com>
Cc: Tudor Barbu <tudor.barbu@keysight.com>
Content-Type: multipart/mixed; boundary="===============0920165092035257266=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0920165092035257266==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR17MB54938C9DC46497D9C09DA979937C9SJ0PR17MB5493namp_"

--_000_SJ0PR17MB54938C9DC46497D9C09DA979937C9SJ0PR17MB5493namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 14cb284a085107a11c6d3636660e5a7ad5550a98 Mon Sep 17 00:00:00 2001
From: Tudor Barbu <tudor.barbu@keysight.com>
Date: Fri, 17 Dec 2021 14:51:20 +0200
Subject: [PATCH 1/1] package/poco: bump version to 1.11.1

This version contains multiple bug fixes and introduces ActiveRecord

Removed: 0001-poco-add-the-staging-path-to-search-path.patch

Selecting custom mysql lib and include is now supported via the
configure script

The following patches are integrated in upstream:
0002-Add-support-for-m68000-1856.patch
0003-Foundation-src-utils.h-backport-double-conversion-ch.patch

I have performed a test build for aarch64 with gcc10 without issues

Signed-off-by: Tudor Barbu <tudor.barbu@keysight.com>
---
...-add-the-staging-path-to-search-path.patch | 40 -------------------
.../0002-Add-support-for-m68000-1856.patch    | 32 ---------------
...tils.h-backport-double-conversion-ch.patch | 34 ----------------
package/poco/poco.hash                        |  2 +-
package/poco/poco.mk                          |  8 ++--
5 files changed, 5 insertions(+), 111 deletions(-)
delete mode 100644 package/poco/0001-poco-add-the-staging-path-to-search-pa=
th.patch
delete mode 100644 package/poco/0002-Add-support-for-m68000-1856.patch
delete mode 100644 package/poco/0003-Foundation-src-utils.h-backport-double=
-conversion-ch.patch

diff --git a/package/poco/0001-poco-add-the-staging-path-to-search-path.pat=
ch b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
deleted file mode 100644
index fbabfc8f26..0000000000
--- a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a53f3fd64a0f36ec9bc1307d7e66cdc2dee4aeaa Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 4 Aug 2015 10:14:00 +0200
-Subject: [PATCH] poco: add the staging path to search path
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Add the mysql headers and client libraries to the search path of the
-preprocessor and the linker. The $MYSQL_LIBDIR / $MYSQL_INCIDR variables
-must be set from the make command line.
-
-[Peter: Remove host dirs, add MYSQL_INCDIR]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[J=F6rg: Update to version 1.6.1 from github]
-Signed-off-by: J=F6rg Krause <joerg.krause@embedded.rocks>
-[Julien: Rebased on version 1.10.1]
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- Data/MySQL/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Data/MySQL/Makefile b/Data/MySQL/Makefile
-index 64a7d3f82..955fee2d4 100644
---- a/Data/MySQL/Makefile
-+++ b/Data/MySQL/Makefile
-@@ -6,8 +6,8 @@
-
- include $(POCO_BASE)/build/rules/global
-
--SYSLIBS +=3D -L/usr/local/lib -L/usr/local/lib$(LIB64SUFFIX)/mysql -L/usr=
/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFFIX) -L/usr/mysql/lib$(L=
IB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFIX) -lmysqlclient
--INCLUDE +=3D -I/usr/local/include/mysql/ -I/usr/include/mysql/ -I/usr/mys=
ql/include/mysql -I/usr/local/mysql/include
-+SYSLIBS +=3D -L$(MYSQL_LIBDIR) -lmysqlclient
-+INCLUDE +=3D -I$(MYSQL_INCDIR)
- SYSFLAGS +=3D -DTHREADSAFE -DNO_TCL
-
- objects =3D Binder Extractor SessionImpl Connector \
---
-2.26.2
-
diff --git a/package/poco/0002-Add-support-for-m68000-1856.patch b/package/=
poco/0002-Add-support-for-m68000-1856.patch
deleted file mode 100644
index bc04a9bf69..0000000000
--- a/package/poco/0002-Add-support-for-m68000-1856.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 221e308ad452035f4c1dc25e194f817a30f38f7b Mon Sep 17 00:00:00 2001
-From: Jochen Sprickerhof <github@jochen.sprickerhof.de>
-Date: Wed, 23 Aug 2017 16:50:51 +0200
-Subject: [PATCH] Add support for m68000 (#1856)
-
-Originally taken from
-
-https://github.com/google/double-conversion/commit/da11179623145f53b204105=
a93b8bbca431141da
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Julien: rebased on version 1.10.1]
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- Foundation/src/utils.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index c87cee13c..e891c0f10 100644
---- a/Foundation/src/utils.h
-+++ b/Foundation/src/utils.h
-@@ -66,6 +66,8 @@
-              defined(__AARCH64EL__) || \
-     defined(nios2) || defined(__nios2) || defined(__nios2__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
-+#elif defined(__mc68000__)
-+#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
- // Windows uses a 64bit wide floating point stack.
---
-2.26.2
-
diff --git a/package/poco/0003-Foundation-src-utils.h-backport-double-conve=
rsion-ch.patch b/package/poco/0003-Foundation-src-utils.h-backport-double-c=
onversion-ch.patch
deleted file mode 100644
index c06eebe8b0..0000000000
--- a/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-c=
h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fe7d230da03a35725ef768c07ce064324f941863 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 1 Jul 2018 15:37:47 +0200
-Subject: [PATCH] Foundation/src/utils.h: backport double-conversion change=
 for
- AArch64 BE support
-
-This commit, identical to upstream double-conversion commit
-https://github.com/google/double-conversion/commit/cb2beeb6771025377c665d1=
c3ea08388bc6e619a
-allows Poco to build on AArch64 big-endian.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/pocoproject/poco/pull/2378
-[Julien: rebased on version 1.10.1]
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- Foundation/src/utils.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index e891c0f10..892f7db18 100644
---- a/Foundation/src/utils.h
-+++ b/Foundation/src/utils.h
-@@ -63,7 +63,7 @@
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__riscv) || \
--             defined(__AARCH64EL__) || \
-+            defined(__AARCH64EL__) || defined(__aarch64__) || \
-     defined(nios2) || defined(__nios2) || defined(__nios2__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__)
---
-2.26.2
-
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 2a2629733d..78d7d0b96e 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
# Locally computed
-sha256  44592a488d2830c0b4f3bfe4ae41f0c46abbfad49828d938714444e858a00818  =
poco-1.10.1.tar.gz
+sha256  2412a5819a239ff2ee58f81033bcc39c40460d7a8b330013a687c8c0bd2b4ac0  =
poco-1.11.1.tar.gz
sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  L=
ICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 857f215e3a..814f6704da 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
#
###########################################################################=
#####

-POCO_VERSION =3D 1.10.1
+POCO_VERSION =3D 1.11.1
POCO_SITE =3D $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
POCO_LICENSE =3D BSL-1.0
POCO_LICENSE_FILES =3D LICENSE
@@ -66,14 +66,14 @@ define POCO_CONFIGURE_CMDS
                               $(POCO_CONF_OPTS) \
                               --unbundled \
                               --no-tests \
-                              --no-samples)
+                             --no-samples \
+                             --mysql-lib=3D$(STAGING_DIR)/usr/lib/mysql \
+                             --mysql-include=3D$(STAGING_DIR)/usr/include/=
mysql)
endef

 # Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
define POCO_BUILD_CMDS
               $(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OSARCH=3D$(ARCH) CRO=
SS_COMPILE=3D$(TARGET_CROSS) \
-                              MYSQL_LIBDIR=3D$(STAGING_DIR)/usr/lib/mysql =
\
-                              MYSQL_INCDIR=3D$(STAGING_DIR)/usr/include/my=
sql \
                               DEFAULT_TARGET=3D$(POCO_MAKE_TARGET) -C $(@D=
)
endef

--
2.25.1


--_000_SJ0PR17MB54938C9DC46497D9C09DA979937C9SJ0PR17MB5493namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">From 14cb284a085107a11c6d3636660e5a7ad5550a98 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Tudor Barbu &lt;tudor.barbu@keysight.com&gt;<o=
:p></o:p></p>
<p class=3D"MsoNormal">Date: Fri, 17 Dec 2021 14:51:20 +0200<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH 1/1] package/poco: bump version to 1=
.11.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This version contains multiple bug fixes and introdu=
ces ActiveRecord<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Removed: 0001-poco-add-the-staging-path-to-search-pa=
th.patch<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Selecting custom mysql lib and include is now suppor=
ted via the<o:p></o:p></p>
<p class=3D"MsoNormal">configure script<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following patches are integrated in upstream:<o:=
p></o:p></p>
<p class=3D"MsoNormal">0002-Add-support-for-m68000-1856.patch<o:p></o:p></p=
>
<p class=3D"MsoNormal">0003-Foundation-src-utils.h-backport-double-conversi=
on-ch.patch<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have performed a test build for aarch64 with gcc10=
 without issues<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Tudor Barbu &lt;tudor.barbu@keysight.=
com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">...-add-the-staging-path-to-search-path.patch | 40 -=
------------------<o:p></o:p></p>
<p class=3D"MsoNormal">.../0002-Add-support-for-m68000-1856.patch&nbsp;&nbs=
p;&nbsp; | 32 ---------------<o:p></o:p></p>
<p class=3D"MsoNormal">...tils.h-backport-double-conversion-ch.patch | 34 -=
---------------<o:p></o:p></p>
<p class=3D"MsoNormal">package/poco/poco.hash&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<o:p></o:p></p>
<p class=3D"MsoNormal">package/poco/poco.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">5 files changed, 5 insertions(+), 111 deletions(-)<o=
:p></o:p></p>
<p class=3D"MsoNormal">delete mode 100644 package/poco/0001-poco-add-the-st=
aging-path-to-search-path.patch<o:p></o:p></p>
<p class=3D"MsoNormal">delete mode 100644 package/poco/0002-Add-support-for=
-m68000-1856.patch<o:p></o:p></p>
<p class=3D"MsoNormal">delete mode 100644 package/poco/0003-Foundation-src-=
utils.h-backport-double-conversion-ch.patch<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/package/poco/0001-poco-add-the-staging-=
path-to-search-path.patch b/package/poco/0001-poco-add-the-staging-path-to-=
search-path.patch<o:p></o:p></p>
<p class=3D"MsoNormal">deleted file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index fbabfc8f26..0000000000<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/package/poco/0001-poco-add-the-staging-path-to=
-search-path.patch<o:p></o:p></p>
<p class=3D"MsoNormal">+++ /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,40 +0,0 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-From a53f3fd64a0f36ec9bc1307d7e66cdc2dee4aeaa Mon S=
ep 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">-From: Baruch Siach &lt;baruch@tkos.co.il&gt;<o:p></=
o:p></p>
<p class=3D"MsoNormal">-Date: Tue, 4 Aug 2015 10:14:00 +0200<o:p></o:p></p>
<p class=3D"MsoNormal">-Subject: [PATCH] poco: add the staging path to sear=
ch path<o:p></o:p></p>
<p class=3D"MsoNormal">-MIME-Version: 1.0<o:p></o:p></p>
<p class=3D"MsoNormal">-Content-Type: text/plain; charset=3DUTF-8<o:p></o:p=
></p>
<p class=3D"MsoNormal">-Content-Transfer-Encoding: 8bit<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-Add the mysql headers and client libraries to the s=
earch path of the<o:p></o:p></p>
<p class=3D"MsoNormal">-preprocessor and the linker. The $MYSQL_LIBDIR / $M=
YSQL_INCIDR variables<o:p></o:p></p>
<p class=3D"MsoNormal">-must be set from the make command line.<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-[Peter: Remove host dirs, add MYSQL_INCDIR]<o:p></o=
:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Baruch Siach &lt;baruch@tkos.co.il&g=
t;<o:p></o:p></p>
<p class=3D"MsoNormal">-[J=F6rg: Update to version 1.6.1 from github]<o:p><=
/o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: J=F6rg Krause &lt;joerg.krause@embed=
ded.rocks&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">-[Julien: Rebased on version 1.10.1]<o:p></o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Julien Olivain &lt;juju@cotds.org&gt=
;<o:p></o:p></p>
<p class=3D"MsoNormal">----<o:p></o:p></p>
<p class=3D"MsoNormal">- Data/MySQL/Makefile | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">- 1 file changed, 2 insertions(+), 2 deletions(-)<o:=
p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-diff --git a/Data/MySQL/Makefile b/Data/MySQL/Makef=
ile<o:p></o:p></p>
<p class=3D"MsoNormal">-index 64a7d3f82..955fee2d4 100644<o:p></o:p></p>
<p class=3D"MsoNormal">---- a/Data/MySQL/Makefile<o:p></o:p></p>
<p class=3D"MsoNormal">-+++ b/Data/MySQL/Makefile<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -6,8 +6,8 @@<o:p></o:p></p>
<p class=3D"MsoNormal">- <o:p></o:p></p>
<p class=3D"MsoNormal">- include $(POCO_BASE)/build/rules/global<o:p></o:p>=
</p>
<p class=3D"MsoNormal">- <o:p></o:p></p>
<p class=3D"MsoNormal">--SYSLIBS +=3D -L/usr/local/lib -L/usr/local/lib$(LI=
B64SUFFIX)/mysql -L/usr/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFF=
IX) -L/usr/mysql/lib$(LIB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFI=
X) -lmysqlclient<o:p></o:p></p>
<p class=3D"MsoNormal">--INCLUDE +=3D -I/usr/local/include/mysql/ -I/usr/in=
clude/mysql/ -I/usr/mysql/include/mysql -I/usr/local/mysql/include<o:p></o:=
p></p>
<p class=3D"MsoNormal">-+SYSLIBS +=3D -L$(MYSQL_LIBDIR) -lmysqlclient<o:p><=
/o:p></p>
<p class=3D"MsoNormal">-+INCLUDE +=3D -I$(MYSQL_INCDIR)<o:p></o:p></p>
<p class=3D"MsoNormal">- SYSFLAGS +=3D -DTHREADSAFE -DNO_TCL<o:p></o:p></p>
<p class=3D"MsoNormal">- <o:p></o:p></p>
<p class=3D"MsoNormal">- objects =3D Binder Extractor SessionImpl Connector=
 \<o:p></o:p></p>
<p class=3D"MsoNormal">--- <o:p></o:p></p>
<p class=3D"MsoNormal">-2.26.2<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/package/poco/0002-Add-support-for-m6800=
0-1856.patch b/package/poco/0002-Add-support-for-m68000-1856.patch<o:p></o:=
p></p>
<p class=3D"MsoNormal">deleted file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index bc04a9bf69..0000000000<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/package/poco/0002-Add-support-for-m68000-1856.=
patch<o:p></o:p></p>
<p class=3D"MsoNormal">+++ /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,32 +0,0 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-From 221e308ad452035f4c1dc25e194f817a30f38f7b Mon S=
ep 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">-From: Jochen Sprickerhof &lt;github@jochen.spricker=
hof.de&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">-Date: Wed, 23 Aug 2017 16:50:51 +0200<o:p></o:p></p=
>
<p class=3D"MsoNormal">-Subject: [PATCH] Add support for m68000 (#1856)<o:p=
></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-Originally taken from<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-https://github.com/google/double-conversion/commit/=
da11179623145f53b204105a93b8bbca431141da<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Thomas Petazzoni &lt;thomas.petazzon=
i@bootlin.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">-[Julien: rebased on version 1.10.1]<o:p></o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Julien Olivain &lt;juju@cotds.org&gt=
;<o:p></o:p></p>
<p class=3D"MsoNormal">----<o:p></o:p></p>
<p class=3D"MsoNormal">- Foundation/src/utils.h | 2 ++<o:p></o:p></p>
<p class=3D"MsoNormal">- 1 file changed, 2 insertions(+)<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-diff --git a/Foundation/src/utils.h b/Foundation/sr=
c/utils.h<o:p></o:p></p>
<p class=3D"MsoNormal">-index c87cee13c..e891c0f10 100644<o:p></o:p></p>
<p class=3D"MsoNormal">---- a/Foundation/src/utils.h<o:p></o:p></p>
<p class=3D"MsoNormal">-+++ b/Foundation/src/utils.h<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -66,6 +66,8 @@<o:p></o:p></p>
<p class=3D"MsoNormal">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; defined(__AARCH64EL__) || \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp; defined(nios2) || defined(=
__nios2) || defined(__nios2__)<o:p></o:p></p>
<p class=3D"MsoNormal">- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATION=
S 1<o:p></o:p></p>
<p class=3D"MsoNormal">-+#elif defined(__mc68000__)<o:p></o:p></p>
<p class=3D"MsoNormal">-+#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS=
<o:p></o:p></p>
<p class=3D"MsoNormal">- #elif defined(_M_IX86) || defined(__i386__) || def=
ined(__i386)<o:p></o:p></p>
<p class=3D"MsoNormal">- #if defined(_WIN32)<o:p></o:p></p>
<p class=3D"MsoNormal">- // Windows uses a 64bit wide floating point stack.=
<o:p></o:p></p>
<p class=3D"MsoNormal">--- <o:p></o:p></p>
<p class=3D"MsoNormal">-2.26.2<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/package/poco/0003-Foundation-src-utils.=
h-backport-double-conversion-ch.patch b/package/poco/0003-Foundation-src-ut=
ils.h-backport-double-conversion-ch.patch<o:p></o:p></p>
<p class=3D"MsoNormal">deleted file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index c06eebe8b0..0000000000<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/package/poco/0003-Foundation-src-utils.h-backp=
ort-double-conversion-ch.patch<o:p></o:p></p>
<p class=3D"MsoNormal">+++ /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,34 +0,0 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-From fe7d230da03a35725ef768c07ce064324f941863 Mon S=
ep 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">-From: Thomas Petazzoni &lt;thomas.petazzoni@bootlin=
.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">-Date: Sun, 1 Jul 2018 15:37:47 +0200<o:p></o:p></p>
<p class=3D"MsoNormal">-Subject: [PATCH] Foundation/src/utils.h: backport d=
ouble-conversion change for<o:p></o:p></p>
<p class=3D"MsoNormal">- AArch64 BE support<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-This commit, identical to upstream double-conversio=
n commit<o:p></o:p></p>
<p class=3D"MsoNormal">-https://github.com/google/double-conversion/commit/=
cb2beeb6771025377c665d1c3ea08388bc6e619a<o:p></o:p></p>
<p class=3D"MsoNormal">-allows Poco to build on AArch64 big-endian.<o:p></o=
:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Thomas Petazzoni &lt;thomas.petazzon=
i@bootlin.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">-Upstream: https://github.com/pocoproject/poco/pull/=
2378<o:p></o:p></p>
<p class=3D"MsoNormal">-[Julien: rebased on version 1.10.1]<o:p></o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Julien Olivain &lt;juju@cotds.org&gt=
;<o:p></o:p></p>
<p class=3D"MsoNormal">----<o:p></o:p></p>
<p class=3D"MsoNormal">- Foundation/src/utils.h | 2 +-<o:p></o:p></p>
<p class=3D"MsoNormal">- 1 file changed, 1 insertion(+), 1 deletion(-)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-diff --git a/Foundation/src/utils.h b/Foundation/sr=
c/utils.h<o:p></o:p></p>
<p class=3D"MsoNormal">-index e891c0f10..892f7db18 100644<o:p></o:p></p>
<p class=3D"MsoNormal">---- a/Foundation/src/utils.h<o:p></o:p></p>
<p class=3D"MsoNormal">-+++ b/Foundation/src/utils.h<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -63,7 +63,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp; defined(__SH4__) || define=
d(__alpha__) || \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp; defined(_MIPS_ARCH_MIPS32R=
2) || \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp; defined(__riscv) || \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; defined(__AARCH64EL__) || \<o:p></o:p></p>
<p class=3D"MsoNormal">-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; defined(__AARCH64EL__) || defined(__aarch64__) || \<o:p></=
o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp; defined(nios2) || defined(=
__nios2) || defined(__nios2__)<o:p></o:p></p>
<p class=3D"MsoNormal">- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATION=
S 1<o:p></o:p></p>
<p class=3D"MsoNormal">- #elif defined(__mc68000__)<o:p></o:p></p>
<p class=3D"MsoNormal">--- <o:p></o:p></p>
<p class=3D"MsoNormal">-2.26.2<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/package/poco/poco.hash b/package/poco/p=
oco.hash<o:p></o:p></p>
<p class=3D"MsoNormal">index 2a2629733d..78d7d0b96e 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/package/poco/poco.hash<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/package/poco/poco.hash<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,3 +1,3 @@<o:p></o:p></p>
<p class=3D"MsoNormal"># Locally computed<o:p></o:p></p>
<p class=3D"MsoNormal">-sha256&nbsp; 44592a488d2830c0b4f3bfe4ae41f0c46abbfa=
d49828d938714444e858a00818&nbsp; poco-1.10.1.tar.gz<o:p></o:p></p>
<p class=3D"MsoNormal">+sha256&nbsp; 2412a5819a239ff2ee58f81033bcc39c40460d=
7a8b330013a687c8c0bd2b4ac0&nbsp; poco-1.11.1.tar.gz<o:p></o:p></p>
<p class=3D"MsoNormal">sha256&nbsp; c4b1e1e5f36d8331737231fefcc30f5714326ae=
c7c387ad59a8115eb0ba7d6b5&nbsp; LICENSE<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/package/poco/poco.mk b/package/poco/poc=
o.mk<o:p></o:p></p>
<p class=3D"MsoNormal">index 857f215e3a..814f6704da 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/package/poco/poco.mk<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/package/poco/poco.mk<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -4,7 +4,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">#<o:p></o:p></p>
<p class=3D"MsoNormal">####################################################=
############################<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-POCO_VERSION =3D 1.10.1<o:p></o:p></p>
<p class=3D"MsoNormal">+POCO_VERSION =3D 1.11.1<o:p></o:p></p>
<p class=3D"MsoNormal">POCO_SITE =3D $(call github,pocoproject,poco,poco-$(=
POCO_VERSION)-release)<o:p></o:p></p>
<p class=3D"MsoNormal">POCO_LICENSE =3D BSL-1.0<o:p></o:p></p>
<p class=3D"MsoNormal">POCO_LICENSE_FILES =3D LICENSE<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -66,14 +66,14 @@ define POCO_CONFIGURE_CMDS<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(POCO_CONF_OPTS) \<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --unbundled \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --no-tests \<o:p></o:=
p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --no-samples)<o:p></o:p></=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --no-samples \<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --mysql-lib=3D$(STAGING_DIR)/usr=
/lib/mysql \<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --mysql-include=3D$(STAGING_DIR)=
/usr/include/mysql)<o:p></o:p></p>
<p class=3D"MsoNormal">endef<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;# Use $(MAKE1) to avoid failures on heavilly p=
arallel machines (e.g. -j25)<o:p></o:p></p>
<p class=3D"MsoNormal">define POCO_BUILD_CMDS<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OS=
ARCH=3D$(ARCH) CROSS_COMPILE=3D$(TARGET_CROSS) \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MYSQL_LIBDIR=3D$(STAGING_D=
IR)/usr/lib/mysql \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MYSQL_INCDIR=3D$(STAGING_D=
IR)/usr/include/mysql \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEFAULT_TARGET=3D$(PO=
CO_MAKE_TARGET) -C $(@D)<o:p></o:p></p>
<p class=3D"MsoNormal">endef<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR17MB54938C9DC46497D9C09DA979937C9SJ0PR17MB5493namp_--

--===============0920165092035257266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0920165092035257266==--

