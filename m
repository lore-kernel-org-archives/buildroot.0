Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42EBC77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 01:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B14D41C26;
	Fri, 28 Apr 2023 01:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B14D41C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LUnPkC-jhlu; Fri, 28 Apr 2023 01:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DA741BE0;
	Fri, 28 Apr 2023 01:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0DA741BE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 881611BF316
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 01:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D17360AEC
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 01:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D17360AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jq4AEuAAb40S for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 01:34:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E30960B8B
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2080c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::80c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E30960B8B
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 01:34:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLZeaBJJBCm4QcP+z1auVKPFdwoxeUwmXU1zfMJkNc1yGqi6Yvp92sUY1Pl/qz1qNPVXI+xxfPKIbbDq8BC8B6h2RA8UNgW+t8FrZGd1kEIVd+JycGxbRpUCSPTGxBAEQ4Ov2642nIU5eDKiOTYui92/MS+JpCf+fSaRyK1fcO6oEDWim0PPfCG9Mzjokfu8tZOGvrRLcMYIQdBGq4nQ4DcRlUZ7ttm+jgWcJ+8dZu6OsVx9/hKHxMYJuRaelfrooRCq/n/oyL9gJPWEHANJc5YSUQUuiOVOZeawALBzNK7NU9UQkEE2tz7KBGpkjfdtnT2zIkX1Kg9t0Fzes6yztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwO6ZqtyOlEIn96iWQjVFKTmdVt6vjD6N9oYmRo7KTE=;
 b=gF3KYgqKz1nZGVjk3YhZgvhmw0kp5hLwQq5ItI0G2mY09zhpqLW6Ln7Tbo30iLYorUFWNdkP/dIF7L8Rsi5djKqIYKmke4iGrFo4IfydKfBlEs5ZTbSm65uNyrkbEQtz7klEHTBvMRWqenVLHjcgiv1ICHPb+0F9LFa0ZgKqgCVlq47GomQQAvM3pSaQo8m1boQNoDIsUpFxAnDC2Drr/3TaXE1ol6iV76NfuJh7zLSj7OQBt3eETVU/XYs1wb4z0SWLA27xvVgaNmPqho3pk4o0nFyVOOKIJycqMeWWuI/Q8sNSeJBkqjO4Z2hqXW9kOBhNEKYhZ4p7Ox0x2Q3Ghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by MN0P221MB0897.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:3cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Fri, 28 Apr
 2023 01:34:12 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Fri, 28 Apr 2023
 01:34:12 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Thu, 27 Apr 2023 21:33:35 -0400
Message-ID: <SN4P221MB0682AD201BF377F47DCB39D8A06B9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [OdHv7j7Qs8MSuF+2jgFhB0hT0FyzC0Uq]
X-ClientProxiedBy: YQZPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::21) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230428013335.5598-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|MN0P221MB0897:EE_
X-MS-Office365-Filtering-Correlation-Id: a40b1e02-fbba-4eed-8d59-08db4788ab76
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmq94wSHnwUY8x4U3PNO3wDqgJ4TyOKiM7Sz1gbLSk+/7UjE1BHuywEZfAjv58wkheyimddA/1AS7wNmWjnCKa8HWgyrR9BQ41CZJi1xY9UvV9RD+spCA5uDxcp5lVwT0xSPXj0b0NjNsH9AAqPW7YmBF2kxZSJNviY9yWwz5hfmOzHQZQaXiRfr1BdUs5A2fvO247/mCQF1gVpvvvTQ3y0SE6pAGG3vdwzLVsaDssV9zxQyoidjHY4Gu75GmPTDA8Ra1WSOsLLGQ0Aadkatp7MU7KCnhuwJJIFBmZWNpPPHvw8/QjlcKz43iQ/UN1vF3Ps3pz0LahOjPg6lo/nglx08q5trGqEwNIxKOG3nehvbbtCENvUwFN+Tl/gexj3tTyTCT5l5EiSfvFNqIet/yYAqHuRCK2D14iy1+b3Q7FyMh0DTb0wUFz57V6FwxVrgJ5We5HqU7kw7vLsV8vg/ROkg4D3D+WfkrmGyFbSWmssSZCmF9kvqd8Jlj1QBc9iJvdZJm8nZxv9s5Fx2vdGRG9T2jLStllFdl6C2Z7v+fGzrZdw57tzAtI+OV2cxls1lVeiqrJfkPwkb3xfFwNWuBsP6r/xe8/8WehB5mY5cTPlOs8V3/SQ/G16u0LKEnn0s8Ko/15EEN6rOJAWQU7VRqCKDMm7T/7mxpu4N8p5PAEr56HW9gHZoKuUq5xonE6utpqRF/LhAq09F7dtrtVjsT6/ISg65U3xEisdzyUTIVRJCJAVgM/KPD5esOnMXJIbwJRs=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QwuGs0aM0LXAk9HF1t0WoitZFyAKGPNyWitGwpiKnE6wtctHHkdXNUutXZiu8HhM1K8mvl2xD5X3q90l43KRLAUXRzi5GeUP2gATfDaeVx3PAD8s+itlYL7mm1SYsSpopfo8T4SawGNlG5+2Y8czSFtOPEbbFlvTELaGnr9uVObuoQ3DXM3vueb4uDU0VDHxQUc35lA5TwJvJ3RDQScUEYTt/t6QmFScnV+Fv037KeaiX6ZIP5fh8OR4Nz11fGLOF48RmECfq9HA3ARU4AUg1lrw0wukAqmxUllpZwCeHJsZk2VGH/1TrlIxSF+CuClKKYir8Vp8/HoVVVEua+1nu9TbA+b0rEYGr6k6VyahPI+UBdqurZFIlMR6TMKpqWMJ8ZRhXWydOJL7aKKnS9xR1dC3WayC5A9ndzcoD5Bi/YFTdAIsLf/RkXuMusdakurGVEQU+lhU9IbUBcLByCwgjMSxM6VZykFO/P23LkTLmr9sl/G4xGcSu3tKGV3nIKpLAIDZ0AvSU0jd8+xwYg34nAhDjFej+BoBuDdo6d1nn+apZnMGcx2Q6QfTXYxRMZVMnUsiKV4u8+4DDmfzp38Mu2XWL4WWL2fa5ZSqFj+g9M1hRzebBpeti9J4oMUQzzGG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lcoq+bmbPzuHG9jpQdGeEvDsMyHvvO01px9m2lLlVvm/Rc28pXzlIft2D6LT?=
 =?us-ascii?Q?aNC7U8DN8Q+dYLnKGieWPdea0Kg5cC+0FjWw0SEZKhySM1+GORsgt09k5bE+?=
 =?us-ascii?Q?gALRUuZodAP/b9lUeFeaqP/TwuiDSsykbYDgGCN287RHehoZmZdsJAAslkLS?=
 =?us-ascii?Q?7hkB4yd15DGBoYDUUSacoLpvDmEO56pQJ2c6LruWMpzqWwK3u7apdTsxI/G+?=
 =?us-ascii?Q?S+oCZmkhTG+04WZhit3PXmsvQ98ZpWrhqzyc6j1HgZm7mEzVTCVrefN7tRvt?=
 =?us-ascii?Q?tAFJBg52LSTUhsQ86iDktumUBYyEfRA/eGhDcbFzl1r6Ht84/bKCjOs84y5C?=
 =?us-ascii?Q?7uUYhbMwWCqhTTHf4jAZDSoqqML+GrG9TtZawCKKsuFc+eEmL94TeM02H6qo?=
 =?us-ascii?Q?LWF2QPWgwd1q0XOtCmbyUjbK6OERDH0qhsIF9jflg469Gnvjs1wsN36c1WaK?=
 =?us-ascii?Q?yJZpSOJHYdSQ+yGvU/Z2Z/a7AJ1RpfVZIPB66+CbUMQ6otStX2PWKuTZhR0q?=
 =?us-ascii?Q?xXCF/KDz7hwLWxcocS0QGUwUzK+cw0RfMhTCKm2PC0+JiKAUfbEtjDTEmIy/?=
 =?us-ascii?Q?S573flQZBek14yqG1Cts8cL4Dh8VM73HIWvJvrFGB8mUeSk37stWmjAGuYCs?=
 =?us-ascii?Q?oatMcbCN2H+32uKnmNsk7qg/1QeRrFH5ZK4lOECv51vyGR+K5ouoTf/EsWdB?=
 =?us-ascii?Q?wDCgWHkwtl6QQq+3+viXoy+vSETbBhSyddaMXgRlp+s7hVkHmaBSOErbxLrt?=
 =?us-ascii?Q?bip3eTSI6kXGcYI739poTEvQdpWxdypShgbxPQvCG3YQDtUJ3nojgG2hr1iU?=
 =?us-ascii?Q?Qn+ojO17e7FG3OVyoj8wQteiOA0TU3OKS5eO8/xtqUPPw2xkh3y16Us12mlq?=
 =?us-ascii?Q?fZcfOKtCLic0RMiVBNaX2yaDIi4AxduFkpVW2WTvBdxXmPM4DftBof7/tv1u?=
 =?us-ascii?Q?T9Lts8cq/Yb74mNxfacHo1vZQqRFgGu/g1l8lIXTu45j7XPviWiY/OzWD0Wm?=
 =?us-ascii?Q?WZHd15KUsuRAzZOANu0T9DEHMpCwXa1g4hgPdeFgPWokmVFhhbmFrqYKQQQx?=
 =?us-ascii?Q?WQ5Kcsj/mbp9eH24rIZqAhnD4tg7g3zRwmfR+Ow363Wzzka5kdMKXbMLlb7p?=
 =?us-ascii?Q?bWsmYia6qX0NSPqUsk3KXzC4w1PlNFpIiyVx6iN0J9uWB1PRGszHtBEX9bvU?=
 =?us-ascii?Q?V+EjHhJuH6gy8sJP6uqXSAGszs/a9R8TOU8zBJ+9bUxXTJ5iPOSiR+FE474?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a40b1e02-fbba-4eed-8d59-08db4788ab76
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 01:34:12.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0P221MB0897
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwO6ZqtyOlEIn96iWQjVFKTmdVt6vjD6N9oYmRo7KTE=;
 b=aBSM25r4o+NDtFtoD04bDg8+fQauOsdzdfPNmexApwFlQ3QDkafQ902EMk6Wl1vOzLAH2xHtkAADrO1Cg922YfZ9QqaJ9E0mmMTjOqWcFgUvotlwwMda8sd+wgYB6kMwtIC4mlaqUVQS/um5ow3aihtQcRPtlk4WKSuKamCeGwYV9+4HdA+VFfr7IHNeNFeAYSuXVCjUGXsPSLGQ6Ucb3IeRCOAOtMRxuuHcKujJojReUVLxNsvUAfH9uk7fqiKMVieAdypdlA1ofyHnRWOMn3/OUDQhNyEDCwp94UV6fRgX19s2JvEYjaeQGGrRIWkdQZVO/z5702qprm9UvtrPLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=aBSM25r4
Subject: [Buildroot] [PATCH v2] package/libxkbcommon: enable wayland support
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
Cc: James Knight <james.d.knight@live.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tweak the applied configuration options to flag support for Wayland if
the wayland package is detected. This will allow the generation of the
`interactive-wayland` utility (when `BR2_PACKAGE_LIBXKBCOMMON_TOOLS` is
also configured).

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - Ensure the selection of Wayland protocols, as well as the Wayland
    build flags only operate within the tools configuration (as they are
    only applicable towards the tools; suggested by Peter Seiderer)
---
 package/libxkbcommon/Config.in       | 1 +
 package/libxkbcommon/libxkbcommon.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index e9f61227a02b55a0123318f27b296ce2c8b4ad36..c7fe188a0ed47f3e8e218c1971fec6fcfdd7505e 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBXKBCOMMON
 
 config BR2_PACKAGE_LIBXKBCOMMON_TOOLS
 	bool "tools"
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	help
 	  Tools: xkbcli, xkbcli-compile-keymap, xkbcli-how-to-type,
 	  xkbcli-interactive-evdev, xkbcli-interactive-x11,
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 236bf4c5d94d163809056691339ed7660e545195..882791b9171377ffa90dfd588068f85105e2c4b6 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -14,7 +14,6 @@ LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
 	-Denable-docs=false \
-	-Denable-wayland=false \
 	-Denable-xkbregistry=false
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -30,4 +29,11 @@ else
 LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS)$(BR2_PACKAGE_WAYLAND),yy)
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
+LIBXKBCOMMON_DEPENDENCIES += wayland wayland-protocols
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
+endif
+
 $(eval $(meson-package))
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
