Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2554C77B71
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 14:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC1EA6FF70;
	Fri, 21 Apr 2023 14:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC1EA6FF70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjBVMK_nookg; Fri, 21 Apr 2023 14:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B2D6FF6C;
	Fri, 21 Apr 2023 14:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B2D6FF6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBCCB1C279D
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 14:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D2C428E9
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 14:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D2C428E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29T9jaubHwng for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 14:12:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B4B428E7
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02olkn20827.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::827])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31B4B428E7
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 14:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7dhEeVcp3BwD+IpqrmQDENggXkuIPDq8ac0otBiPy4lXs2f1HK4xh1ACTQYpi+JYR1DF+6L+8fgnmIxqyE92flTI2rcpl9otX0dr1KjrcujYeqFfZilkRWuUgYGbteGPePOW40lYKLy4dGSsDsyNSytfZyo+77QPliWNTpZ01uQCpqTZTwXp9T59D+TFPEaeCdDWsZjsnxfzFb25JiYmzXk3sFKLmqh9EbNvt6y+aXbRbU64T97HOg6+qbc9ehGSo4DRc0uLZo76XzWbwKmwHYCDVYZpCQfD2vMUGAuh6eJ9dGUIdJiKcxJLRoJa3WGomviQfVsIlnmp1C8v74DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYPfk1sybbPO+ZNr7+Lfn87pUKZ1QCxoIfCltSQoCC8=;
 b=YHelDg2XAzoEPH/dq0qkhpxwFXdqbHnd6i5HTYOaPBTWQUkmh7cLgnl8/GLfWzSPUZs6ZVw/TEXm/iN/j6tT8sGE410rPWW+g42Rz0g2L66jywRQePbEDYDzb/RfrQQy8BZ1bJU1b1hGgJZWkIJdNUTUkPVPjLBlukNp+F+LoHaJwiqCys130VeAygvPPQUbgd13v83iqzv6g+uIs6VISt+iP/KyQNdjYidM4fb+qy+6FBMQetDM4zB4TkO+H7FXxxU2/7ZTgF1S3AExLJHcmlH5+jTpR/+3JfwQsoIU1lzHzNWDipeniP5lQEKXZvr0bhblEzPWlm6Q7RCafYeMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ2P221MB1114.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:544::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 14:12:44 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 14:12:44 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 10:12:07 -0400
Message-ID: <SN4P221MB068210A82360743E14AC9FD6A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230421141209.2826-1-james.d.knight@live.com>
References: <20230421141209.2826-1-james.d.knight@live.com>
X-TMN: [yeSfQh7jLovy7IYEDHEXXQO0rJy3ZL/S]
X-ClientProxiedBy: YQBPR0101CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::11) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230421141209.2826-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ2P221MB1114:EE_
X-MS-Office365-Filtering-Correlation-Id: 785dbfa6-36af-4f19-0e4a-08db427279c3
X-MS-Exchange-SLBlob-MailProps: a+H6FLLcF3rWTlhCsx8GEXtgjWNkNESfwzucT8Zr3tTEo9ovEJAmPRiBE9mP412mRngSNF1tPOLHxoH4K2FRW7NGLoDs6XRoENwK8mms8mfFLes4TqiNy96Urcy9ygzfOPWf8tQFOHsWv5l/1dux8bGjgjhQ4qMgkaDATdxRlcWbglDEqIsfXasa7AjvilQAwWDi2CarCyYHnDvgNu7nE8OwmIKDfi2HwBOC30DOoP0JmctIYXBg+JC2QGtdcJi3F4+5hhGmjBFeCysVhA4+jhw+ZaBM6OGMKbzzOqHTKgxpvdQzdTQN7VE/VTmYYGTPpLAEUvuSvGyH/GBuHtMvt88al05fB7PW7Gd36TVsSskKub1vchjJhxgVqk2hkIWOOQJm1cj/8QQadbkusuJVNN9pRsJs8f8rdgSEcLDGjmnJyhiqgmYVOZ1a136tkLPHLuiUxQWDtl5jvX8PgjacnVq4WV45JyDhELxdKO/Uv/epV+rrXJQlUUGfP/Q6KXT11Gv3glcWecyc9b7xYt2+lJPVG9uZthtY7262C8+bJ7dwSw4bCJCyxFYo++Wl0snzKSmWaOSbQYcRwkbbs7HDX+op0mDOYO2pxmMrSOjs0hZusREQp37pcvAk2TlbxFrkKc3V0i94ZXaGMBJXEnD13NQ87/lu79EdCIadmfBIyI7DZ+V/so5MsFIvSh2BdWJR9Zi4sObU0TnI8/9L97J4TMx0xp+cdjjlXxKYlauoGu2aUhFSWqFUR9z2BNSxo3gewJ4nB7YIBsmdYoq81N6DwjZ/6DSgu7gEvw/FjHnhWCURCruOluyaCsUthIgimWpw
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ikKMZ71e6ghbhxLDbowwjkoX8Nnz+CVKE4F95jR6AFbLIDYmQm41CB6sLyqx1WS3puFQC8Fi6kwf56njvRlOEnFn0L4aCtNZuiJJmakpM8asfTABaPbnbQMY2V9VuF3mZV7GjBr1Jwk3ud2Phbu393g40NFoAZgeL0PGNzbOwhmBDUuQ2vHfNuh0IPpg7a9br3TSTdUk9LheTVNxHxQPOr4thdSENU9wxYNqCJ+oAAhW45WT7qSKF1TnbIWS6H44SNmIXvQeNbniSVzRmB+smUy0Qz/dgiRqB9kinSjE+HORXA/zz4QdB8ajJHvj6HJjRX93qTtFaT7nrPVNzoovi5jc4B4ZZC15olNg4x+cZicG5UK9wrcm+llw97TFjAQktLBgphse0TY3UXcWiRnmR9kMzRadLhgDiEpIywkUUjj/sL+OlNuy1BKGBzC8z6v6mfW64wZB/rMRvzLpqlhhm/JCCaw+GUPN7psHi20y8AQR8Fnmu8gJef+9lHn8YwBrnf5yJvK9eyme6S7Oiwb/U4H9ltXZ6kNtXaHoBRGnzm01A3PCXd/oy6gexOIjkCByLJfUN2nA5RDE22C4TfSre7oueoFvCFmUX8wFYx2ejEQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OiASqwApSed/YXmfyRelWzlDggsD/ZvW2goEo3rT5oTNwgId5kmplk9YULQX?=
 =?us-ascii?Q?BkCBDWiDjfEj9/YNonaKbRkLfke/MkyJKrPAfzpe5PsM6Z+hnmVpQpOQ/4mD?=
 =?us-ascii?Q?BRCKQUmhz3WMR86g10002AmxCXDZ9EDfaAruL3JRgpS9n5Amr3KCJt+GYvgb?=
 =?us-ascii?Q?TMMsLEfDmn2nYlbrJYCoKnRICFF+S9UMtYeWwMh5ZWuzt1P+M8JmKTiA2QZR?=
 =?us-ascii?Q?f3C94VfKtChfdt/ZCpTPnBn1kenFedXLy0bhA17Xcz/9NwJJ6cerszZGXymu?=
 =?us-ascii?Q?DbRLjbOcmzHTCpOykCMZpl9JfazWA1eGREMLXYD63Zpy3Hq8IDEfjQf0d+tg?=
 =?us-ascii?Q?Z6r/4sHyQSaViG/vuoFnr2KOaPKV2xhUc5EeXSqOceru2uDuqxROThjM71S5?=
 =?us-ascii?Q?TCnS6CCsKJvLurS1w83tZMCj7DqQwZoZYAbSW7IQMr1//ZJtlX85Lp0ugmFo?=
 =?us-ascii?Q?dpj+l5ryqWmxssdjfe0GfR3y6pVqvzzwcImH8mHK3UIQU7XdToZkfVToecVf?=
 =?us-ascii?Q?kpFgICWwnr6mLjHBMnMvE/9XxpMFjXXHpY4QGqHiSzJAa7jzQs2ItxcOeTTJ?=
 =?us-ascii?Q?c8eQUNljXEE6Mkg6yl2EWBZkbiZ/K2DD76M/FwE0jI7lCWMpwDZG3l+6sGSK?=
 =?us-ascii?Q?5E5aP8L3aoBxdbhkQE5uZfaeog8ALO9U7yhu5K/guBCM45RzcTgAlp2RuzGT?=
 =?us-ascii?Q?eRzd+GwdiXfT2pLV62oeYGfOIk0XJShknJZ6NY/vyed11OAb34okvlbYzYDN?=
 =?us-ascii?Q?RCh5y35a+KMlLFF9k49ejNeZPIC9HbBaMxDlLT1MuOoordRHcOn5Vxs1NQ/u?=
 =?us-ascii?Q?qq8VegWq1BY2bHzatYsFaIGwwBpA3oOBETO/Bhpp21TMUufVUVaAyk49+/ML?=
 =?us-ascii?Q?ltci4dBUkJj14+pNJ3iSOcfXF61zF88D2XwiUpKHxJfFwS3XSlhwkgCp0oNJ?=
 =?us-ascii?Q?DCtI4k1AGtAn2e0w2u7uHLrMOnEabl2JyIYTmKRIO0VkROeVfxY7EDMIfuow?=
 =?us-ascii?Q?WZA/DMqkD6e617LmrY1ZWac/ebQofDWu3/oIa4HK9UJyWrYVkA1hY8DplQl3?=
 =?us-ascii?Q?uTtv/kmdFK5JY9SHI4w+3W2z2cv9DqVByE+4xADwEUovTBlo8Sg0SRDYbD2G?=
 =?us-ascii?Q?6M4A5vjTt32hEzaM+Xe432PEZY1yv9+gRoBDBbhnEIpWmKrNd4QKPUJ4euVg?=
 =?us-ascii?Q?D0n1ayUw/h4RbJEJgfqx2tuLFRBTXYOeqIMynebNvxPJJxsIRqDiKVOpkok?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 785dbfa6-36af-4f19-0e4a-08db427279c3
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 14:12:44.2528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2P221MB1114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYPfk1sybbPO+ZNr7+Lfn87pUKZ1QCxoIfCltSQoCC8=;
 b=YiR3cZe/9BYQ2yD/1TDnuwac6qTdLQNa+q43eXy0Us4rxNC5/xj5YV/nTeRMkBTpYV5gJ66b7AQMUsz3s3dcph4DrjpeppMWEpN+nMhwATDFnjWee6HoXCJO16/I1XzEvbn73ma5V1+F7tJ3SZJAmQGIYtIRnhrToMXuWCzksdQypL/SOMVZbmrcoigNoAg+4khklbxmqW311L52QIKzttvHH/LmRtrCkdnb/kIH5p5J0gR/Nm/VGkdm662syHbzqhgU4Ky4Iv8QyywjxrZXRMGKDG2/2GiXZteK/79aWc2S3nUZLsevCprF8IDpXue4Hpa8iT2FbhNBBOn7cZKsQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=YiR3cZe/
Subject: [Buildroot] [PATCH 2/4] package/libglib2: apply upstream status on
 girdir patch
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
Cc: James Knight <james.d.knight@live.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Providing an upstream status for the remaining libglib2 patch from a
recent version bump. This patch was introduced in Buildroot around
November 2021 to help deal with build errors where `GObject-2.0.gir`
could not be found (tied to Buildroot changes made in
`gobject-introspection.mk`). The discussion thread mentions this could
be submitted upstream, but looks like it never was. Reflecting that this
package has not been submitted upstream.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 ...01-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index db77a73203faf38aaa832dde8bbd9526cf39eecc..fb9905724278fb2c0a9be8384cb90108292668e8 100644
--- a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -14,6 +14,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: Never submitted
 ---
  gio/meson.build  | 1 +
  glib/meson.build | 1 +
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
