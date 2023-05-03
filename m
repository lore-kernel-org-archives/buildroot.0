Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E2C77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 14:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0990783C3C;
	Wed,  3 May 2023 14:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0990783C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55i8U3fhigvi; Wed,  3 May 2023 14:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E29983C3A;
	Wed,  3 May 2023 14:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E29983C3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DF491BF31F
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 169CC41CBC
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 14:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 169CC41CBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T73KiIumeh9F for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 14:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3345B40B53
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::800])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3345B40B53
 for <buildroot@buildroot.org>; Wed,  3 May 2023 14:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6ETiU9YwkND8MUCDXOnPY1yp4VwBX5qQ/Vt1ZE98apQRJ804WKMChagmmLpPCCpoKKDkrgXL8veRhX/Nlt35j7YaeF7MzEdb2O/8amLr3ibcZVPPEoNqN+1AP2lc+c8dTFHHcLIpj/VhFPwKb7fMfu3vTM80v576epJ8dDIjaygx6mZ0RUQRWSe4zLaWNZlOThfLlx364wSzzf838U/lqwuGJ0Tyfh0pCH/pSQS2SokOWSSGTdQywsvN0K8LfaPdEaWnvQJ8MhB3tXQSjma4DhEnlwn5sVMNJFHB2HRhouAinAIawX8/Kc7ZH8zlMygxHX/KLe66GVEtLECHh98Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRPHwWN9Ey/3Q0w8e4hsS7+GMMnz8/jR0I2MCBofkyM=;
 b=gtVTI3dxWoXJdNVtrJdEOl2NJk7J/QfaKBphKYC5I/10NBUwn3XWkPvNXoJfL6UW1dJt0bpHOlZMSuezJOR3Pz+Zl/bAeiigCJNYmKOrr98gnrQvryQANC7GuvQad9XK1siDCmou+e7R6wBXgKe52fKjpYhVqFJyj8lPLD0BZYN0jNfUpn1vBahgTGsp9QrNAJgM7hk/a6lN975mf7CqfGf8k8RWpdbQcDc3lRfaYinJhqsRUD3ZrXW1AW7Q6iJvNul/KE2rDAVZTsAW8Akc1XFoQ/9Yn31c69lHYfr4ZTANRLZ72SKko1M6Uu6kSutHZeeaPl1F7w9VTyD5B3cy1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:3d1::21)
 by PH0P221MB0720.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Wed, 3 May
 2023 14:53:14 +0000
Received: from SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
 ([fe80::5261:f10:fe0d:f48e]) by SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
 ([fe80::5261:f10:fe0d:f48e%5]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 14:53:14 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 10:52:51 -0400
Message-ID: <SJ0P221MB06893C8381DEF3CD9E251020A06C9@SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [DaA3wxvdADd7MAvastZ6/+3iI8MXEQKk]
X-ClientProxiedBy: YQBPR0101CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::22) To SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:3d1::21)
X-Microsoft-Original-Message-ID: <20230503145251.1522-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0P221MB0689:EE_|PH0P221MB0720:EE_
X-MS-Office365-Filtering-Correlation-Id: a29a291c-d109-49ae-7921-08db4be61ea1
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvt5yZG6IttL1raaQOJY2ybgL0O95d8jQy5jqGMQbWaT6Ral4sXMAXIcWCcJLCZosMx0Zo0QwFTRJ/l+szkbgeNAC+H2ktTZcsgwLsQzzWWbtcIfXw2dypAgX7IAMravkO4e0CwPSLy0HCEjVmqv1F501FagKmjfMK8C4jUxl84E3xGzmCUEkC+b3I/Q2oqAK/GuoGFPymf9k6dJR84zJXYT+IIqQxXFgMG/n3ppyx6oC1pwDgMpakHpIqHpZMx5eutIAV3IF0qPY42ujxrucFwYpONKxZKpCs9TkQEeeisX+HUm9q45zJ4JPozv5E3A5r1TE8LBHEtFQ8IKUfpo6QjUBhcdgOS7HLR5RhqN7SyQ0s/zI8FvCpsQEMCZ/WhuOjjpaZEvwLZ5+pzvx1XmRXvedRSXJ3NdLmchl6B3tLb+13grvbqTZc4cVcxWxNLWrBvmAnHr59GyeYPWI5Lg8t5oAMu1VpoWDhyUKdA9Mu9N0HTBXJHbxnUheZzD/fHrd4in/zJddNn+C6Es6tdzxz5a2e6NK63a5oB0boCH0/jWZNHdTrPmdXKFUwZL+d8XmEGuZ3EHC47i1o41fxXoTG2HRQ2+oLFvCc1x7ThdcwLJxnuqPuUhxI0kRvuG+ZvBhtM35+PVOtekEzIZkK5WY1z5d4V4T2WyUkTAy6vERMBNTr0M4PknJ5jAABmBeOumvyb0HQZ+u5Op9Oa2Hq+2XcfaffFzVjmaC4+/wXkblieCrWvKBLh0HZwlXeVHzSAzR90=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /YpCqjP/++HDo3iVwi0VvT4QHQgZHm5qxfnAOrjfL5O+vKkv+vfLwqe+/UGw/O825MpghM9JaSe4higlpGV7/Gw9Eydp6gEgafFglybf1JDB5hXoQOUYr6RuFRnqbDjnsZ18fFBPSq9Ky1WaPsZvIydnVeRgqx4Ug4iWUAHnNqOT2o8knMUgZ/ufa8ZI14WzLrZJrXsb5fQQRYU9myIUrAaFy4bt7J6rCG5Kae0AQ3/RnFhYSpC29Y+XjHyA+cW3Zk3Rgzz60mtdFyKzbhZbLd0fLzm10f5zd9oTNI2jO+BmKLU4J/rUjuVm8+DiS0qDG1F9k4+5OQjoHbW3rW0eQmQipLTGQrtWEfRwquymiEz8ZYzixek72GPNGCfKivYml4LwqcdklJvY/RbNFED9RFE3sJ+2ZC6yDBh3G9V5qAivfPRwTvd2Sh0MkIzgyTP6c5qdPV/59ZIbKPNkRrZKBMMhT9GxKynpNuk6GICeDDD3Zl+MBziuzv/n6vFZM1iFUJ4tipIeMgfww6DL2GDoNsSeoMfWFQduGzI3p1YWVBWo/5b/68WW/h4rzPwgirjz8pQXkFQVNQqUSGprjT7irVT0dGXQNQX2+0KUe1Uo/ZqtU0ayALl5Qax6TvktM/sH
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8BaNPFiAhjozKgPNX5p0MvuqhK20CQdPFS7myyEoekk3tmiKGDOuXRZCU4lR?=
 =?us-ascii?Q?HkErnXx4J7AKp1IKj4cVjbOJ0n5gElT6rKIAwq85JvV8rliltP1ZtidfT0uI?=
 =?us-ascii?Q?yM8m/OBn9fwktiifDrM0bAddOTQQC5q4lqxOL/zGg3uQdb4stjjsH0vISqvw?=
 =?us-ascii?Q?KeAe14iEQP9oQAx8GxKiDPH31IVQSJSuRSaHljIjLSSQ/DRjd4ESFZwUaOpw?=
 =?us-ascii?Q?j1o2MkLbgrVeflKZlJuxI0JVAM3SEqgW5unJNvH39ZxuzKtcEoQviKp8yxzh?=
 =?us-ascii?Q?+wjqELcARQzqVHF9eFc0tM4f6pJscFfZxVUwsVtu+DGan1tKGgj6lPq/iauK?=
 =?us-ascii?Q?Bs9ym4Ow5BrFY8p4kqq07pvKKWnvfGkb07w5WjxzcrebzXi+riZwDm19IevS?=
 =?us-ascii?Q?BAF7WeFMXe4oQQh0SIIz3dsdiIitsph+1+FdpJ5XEgZcw7s8IJ/UDF1UjNxh?=
 =?us-ascii?Q?4PXIB5Au+bWw3ISOswT9L8dGQoYR3eQrZWarGvzTVg7cGGFV/WAk2npB8/bE?=
 =?us-ascii?Q?DBiq6nMS5B+o/Xc/5IM/lugHjG5Nf26c/w0hsNbzELWoSKcPNWyrhzb3MOBh?=
 =?us-ascii?Q?4562xEx0ZJcfKNmwgVpcWmzRV9LhT/WTbT0JwXkkRtcTRwZEL0R+MVIMbzgg?=
 =?us-ascii?Q?FGCil1PwQpOn9IcDqNXcWQRWnoWCX3yhF7ACNHDEsw4b41lFGHKO5QPnofjm?=
 =?us-ascii?Q?eF0Cs5p1OUK94UXZ+0J6TTnbrVUCDcdXMnyLliaEHch+TeVfZ7YQ/PchLpLo?=
 =?us-ascii?Q?KfVSh8OH8FvlU3R9yfDnAYFW/Dgblr0prjLLELNSqkab+m6opC0msy3j9Ydz?=
 =?us-ascii?Q?O4XMjyI+LBFhdJsIXVsGDBkE21NsqO20J2Rwuof47l2dTZf63wnDN8+Q5/vr?=
 =?us-ascii?Q?ALzJJ3+G8gt3wFzxDAmDyldaaXbCgO8S2XMGCQAuxTtlucAX3DFEex5PZHSb?=
 =?us-ascii?Q?aW+2z+FCsMijPq8g5DN2eZ8yKnSs1z+krutEKXJo2JFmVPlPR6g3wduF1lq/?=
 =?us-ascii?Q?oFAxqb121rbI2jMB0BxKWcQmbXNWX5eNNJVu+Itpnr2/h7b/edXwxEIjDJXc?=
 =?us-ascii?Q?E4bHPSRa6JYDvaCi72YMkPWvdSLDF6It/6AcGNDK5/dVvwghYKkFdlryR2gn?=
 =?us-ascii?Q?US+VFXzVTChSwEumHR1Er3i3mjO2GrLYDMuH7dmHBH3u/0n0qr2dB/JgZUYa?=
 =?us-ascii?Q?3SDXW2nWdWi/KLvt+MAC5TjHCXeHsJJplbeA75jzZswJYtHUh5xJBLkpTxs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a29a291c-d109-49ae-7921-08db4be61ea1
X-MS-Exchange-CrossTenant-AuthSource: SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 14:53:14.0309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P221MB0720
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRPHwWN9Ey/3Q0w8e4hsS7+GMMnz8/jR0I2MCBofkyM=;
 b=W4ExCvM6LgkO/S6vRF8+4DM2F2M06rrZ2iWWzK2Abpd02LNJFx5MP7uoYfiIm9ZRdRQ60nRPPwS+Cfr2VW8qPlqJDRU61NUxbu4RsqYKvwtstyyWIP8hPL0Qc/LC7Z+lmm5icdV9tdbM8BeYvRTwh1g3EGfi3WUomyvTxHfthmlpcUJPZXSKHAvyKLW//FN30YxLj67wA8pLkNcKrH6J34D8Ojy9Uep89xpTouAOyOogEwe4AZPb8WhcQ3YzhTfoG6Voh9XowVNUpK8HyYOUEgOZKu30dJmXYMqLqctmrQOLYPc3WumSYK+3/fG9wfB7eHfXHl8AtDj3vZmn2UsK8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=W4ExCvM6
Subject: [Buildroot] [PATCH] package/systemd: do not enable networking/time
 components by default
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
Cc: James Knight <james.d.knight@live.com>, Norbert Lange <nolange79@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tweaking the configuration of systemd to not enable networking and time
related service capabilities. The use of the system services are not
required, especially if other packages provide a respective capability
to a target (e.g. a target configured for chronyd will most likely not
want to use systemd's timedate/timesync services).

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/systemd/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bea717a4560f573fafbde53efb846f8be0b663c0..be1c29c2ec3772923a1164f25ce2d3fad78fd195 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -256,7 +256,6 @@ comment "homed support needs a toolchain w/ threads, dynamic library, kernel hea
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
-	default y
 	help
 	  systemd-hostnamed is a system service that may be used as a
 	  mechanism to change the system's hostname.
@@ -329,7 +328,6 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
-	default y
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
 	  Switch (NSS) functionality of the GNU C Library (glibc),
@@ -340,7 +338,6 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
-	default y
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as
@@ -433,7 +430,6 @@ config BR2_PACKAGE_SYSTEMD_REPART
 
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
-	default y
 	help
 	  systemd-resolved is a system service that provides network
 	  name resolution to local applications. It implements a
@@ -507,7 +503,6 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
 
 config BR2_PACKAGE_SYSTEMD_TIMEDATED
 	bool "enable timedate daemon"
-	default y
 	help
 	  systemd-timedated is a system service that may be used as a
 	  mechanism to change the system clock and timezone, as well
@@ -517,7 +512,6 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable timesync daemon"
-	default y
 	help
 	  systemd-timesyncd is a service that may be used to
 	  synchronize the local system clock with a Network Time
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
