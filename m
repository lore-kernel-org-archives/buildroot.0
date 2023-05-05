Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E430C77B7F
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 04:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9219240C21;
	Fri,  5 May 2023 04:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9219240C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6T2-NQdw7gO; Fri,  5 May 2023 04:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8160440186;
	Fri,  5 May 2023 04:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8160440186
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC4D21BF39F
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B6760D59
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82B6760D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHZ8OHCYNPY3 for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 04:11:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551FD60BB5
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::801])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 551FD60BB5
 for <buildroot@buildroot.org>; Fri,  5 May 2023 04:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRmvmj/++aieNyhx0syPvxVPSJ7M+HQIuVLvGLJ1N7o1FiJ4s6bjkRsWZRAJNytH5YwGz6LWrX1tru6W5KdtBKWOpakrAd4J4yyNo3XDYokM1foKZ/gSl956SwAiwKJqRMIegkRy5KX9IXTng1/W+lXhRJ1vouFukTn6de8dgfEiAKlkiOKtbU8UxOiYbgcUFOSkTM2EwaIzsuU0UbRbM1ernuVtsEzzL24AqB6DElblf5kYsyXudpUNUSryXEBKoM6Fyq5jaHhrGvWNNqN9y4wUHkby22K3yR70pKmygyih7YGYuY/qJqV5HIMtvdla+qefbCnzdzrMXzAzAqOTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GWIqy4Bn3UWWmAPRvrvBTn0w4p766ey/KJGP4Tml6s=;
 b=n6qc2BHzH0DK/lGTtq9hOwyeziODMfX8qafjjwUm+NtIUo6fwr7Tq86Ik0Bz1+HDbhx5Ep+wdzlm1hUnPMZ9iOxqcLY2Yf2XZ/+Alit5EHTu+t5fy+/BheHXbxLMiiN/SHouYUYO3YkcfAwKmz/OPgJZtjZkIaJXs2IfnEa/8gW11lJYR4mGNDmg5unU1CrKFHVFAuXbofN6SDLmoFmsPRPM7rhSsroGhKnUIbOEttARUe52MYmO0Q+HeBSfLFOUbC7ABkTDsKpz0FfSO9eg3N/G0++Yyoui1tQ96X7wx82ly63gE0H3h4qNC70J+0TKM+AkGuTNdlk6zY8YhL7Dog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SA1P221MB1104.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:384::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Fri, 5 May
 2023 04:11:40 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 04:11:40 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri,  5 May 2023 00:11:18 -0400
Message-ID: <SN4P221MB0682718D84B7ABFF32345345A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [GkMazielCt0Azwri5bNQsgYdZkmn2lhU]
X-ClientProxiedBy: YQBPR0101CA0350.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::24) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230505041118.1930-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SA1P221MB1104:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bc3911-dab8-4351-107f-08db4d1ed3f6
X-MS-Exchange-SLBlob-MailProps: 5R4zPSLKzf5n1Rv4WEszykM71rTH3+sHBZslcf18Xmhz2m2/ZjgUIP2nIyU99iZyBHO4KTj5X7NJlMTL+MVoS6V1V3y1/t4a2n4emKtOXjyNL+Xwcs8AV83kgEHhDkGWCGHlnuDmD1pnXEFtxu4xYH7EPxTQz8f8pSePem7rRRsB6VFSBPoiZA4TYRaANagAgRVo/NXHYET+RdUcnggKS038z74qdxNVC0HUWwOGaUy4nARU/5AZMBOExeG8F5e6DnRRLo4X/hGrMJ3FSscTad2EMdGspDIIaZS9B8lA4x/fungJMWtenZJTF93L+8LW8B/ur4Wg9C+N7Xq/lUzzGFIMUn6IlJoUzcnKNe/rHDtbzGCLq7s1t5LFH89t1Jgmh5UDBNs8ASAjXSuvSASahgXVIss1hKggu2eFBOmVYFbfkETO0UWBeO0pq0B2zZgXi2Y9KjdTwy2p/Q3WN3aYusBTHOMD6BqnM1tX00XAoRqPpRyySw4yuo5hSgxJhh0xIq3NHA9nw0d16kQgGuFUHkjBsRKycC80fWM8fd7+AgHKAntaKu9p4Do7LxocZXKIGjWZ2m+ZzGcUeqP4HQvI+mFtsrXWULY9bfJFJRfX99S4jmy/G+31GYufZhQHbPWYCrxhHx+c6W7UK8c4CmOOD8dNvNv+zRG9qf1cS98AgzocGD0YE7HMxYx5RBNtCjePKjIhY0i1zFAL11Fsis1FFQCfNtepYfy3aJKp4JKWN834Ub+UnTta8RbG/PFDHYTfON3awO0MU+cOzp62bmr/aAidIj8U6ryvi1/XHxZ8a6Fp1IkKMgCOkMUJbKWGGVRxGGbIQelovGi/KC6BEMd0jSgDgWDMHY45
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrRyqAMvFCVWMzxw1T9nlFHppYlVKVyHBKhCATv+Iz0+keN+GSuEuWz5ZDs9pAfhZe137GjD1qDTUJKaM8tznLspJbOBmgznBo3wCHYeFQS0KVNhyh3FvOp+zVThF46R/Kj4qpYcy9pL261F1NRKlJ3ITjdR5h75P9+j6+T8uU+vzpvOpDiGiZibavZKkIiuK2KvAvNGqZXnIJZNo+V5L2FPXIvvalhoCsX3fEqwXNoJ/+ggo5P0LIsUuGePyRsOEMBxzA7mBD51o0azk4l77cMmfgbjV4psAIO40TAlwH6eC+LWG3RRTFZxTNWccA5aVkTu5fUOJ2YgNglPuUzeIbVbXzDQ04NIEnaBbSlSrMAdjzW5vH0Qt5toqBqbp0iWXDzc1IJRTBc7zoNqIwq8IdNTU/D6Kh/IPZmz+qa+uV99E1UfoaZBaKTLI51k6XHt845PJzmnmTdp8BjN4eOyQwnQkN0xqvFzAeb7yMTDvrzRBbgMPmTGw1uZpTsCP2JtbpfrmOi6hSIKpCYqf7v+mxtIY5LycDJw84MiCOoKPtG1pQzRdR68LbaRr0c/CMheVEeZu9Q2CAuJ9l8HyX4jtxVtc5EBNc+34XU37G2vmys=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zgmHNHe6qqKvoimPAQsxvy8ZISGtMK6Sfd/DR75vpM1Rx7uXIUCP2g1RUrp0?=
 =?us-ascii?Q?EaKn6R3UIicSWMCYLGxzcQxy/v/+tS/6DIuJ8vFP8iCoS9glElBpEjtGIlea?=
 =?us-ascii?Q?QcF4cGMZGAJ9a0Vf7PdieO5T/aMhg1TzFZeOwGawlRnZca3tW/wLxawqATol?=
 =?us-ascii?Q?yvkZhKxzuLUb53/pLZEaE2UXS9aXBLE2+4asGG9FILH+wtrmS8ZivaZsgOTQ?=
 =?us-ascii?Q?f2iZ/gFIpGxCBwTRcGpi/1yA4hGKrcmp5YZF+Y+psBagfDwlqfgG6abJS0nm?=
 =?us-ascii?Q?aZU1EtIddWOBN9uDDiheyFzx3h+XPxltzYComM4KRniQ+HAN2MIP9Z28CkSf?=
 =?us-ascii?Q?qDegz92/VyYKaBEOJPu+Wx42F0E9O4aKZeS1d1lgmR25uF6+BJl0K56USEg/?=
 =?us-ascii?Q?SXtLi3I5u98xgWpavX9fBzMU3x0j/EWsou49Hq7J+2+p8sgCqnvuvbn5XGWe?=
 =?us-ascii?Q?oh1Zl2lhJZ/bGmcnil7XE0sprQ2agN/rZLh63/NhjeKLspmlzdyFaSfZkPrQ?=
 =?us-ascii?Q?k2eRwJsmQ5dG8qg5NB0pJPRw+Lskn/1bx2378BN8BmgYubbWPgwx+71K19w7?=
 =?us-ascii?Q?Eyd0a8ShOM0Id3gLZSzXsW0O/alMBM7CeMXBZ17QKGhntxcmnFgbcoCUOtWb?=
 =?us-ascii?Q?dYESTLiOmvY8shBWxHpadsF8ES+GWCnR29r+1KwnTYsQCamNiT+GxJuhiFmm?=
 =?us-ascii?Q?i05/9OKjbuYT2it4WLL7xbHrLE6+kH+Bn6AT2MoXkFiWaiCHysSsq1FCKpO/?=
 =?us-ascii?Q?Zjw9XmFhtHl8wSVNzMjzX8Dx7NyThac8jbcT3dloY/wX5GQlY0FfjzAQjZvT?=
 =?us-ascii?Q?4b61PvtVu7w9VlAoAwN8J81xtSnfw5q5gdvieGb4xu5rf8hRrmcMUoNbC7+A?=
 =?us-ascii?Q?nCXN4sEZnVlP3VwN4RCEOpoq9xyMc6vkQSJGiCSVMqyOVM+gRXd2SL3hvzED?=
 =?us-ascii?Q?5A+7xY/MUGCmh+yXtnkoc60DlpVti+yznlSwDAMppGseVrOtx8t4mALHipU6?=
 =?us-ascii?Q?P5zKWujmk69kpmgcs/w+7lqUlCFYu0bSM0g/AfBuKasAypy0e1TQjJF5Eedi?=
 =?us-ascii?Q?DcKo9Cu7llTCCQdYV/GLMuZnu/7ne7tH7sW56ZGHbr0d6Dd9B3R/dygDJh+o?=
 =?us-ascii?Q?vjXPiM1otgY9SJECqIj6lgira4D5TVO25yanAvkPUkJ8A6YNS8un7xJz4pTS?=
 =?us-ascii?Q?TmzMbAKKBdRo9ZQftOdnRgSNiIbkWEu467r3Gqer3Fbb1BNXFz+xACqjOdI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bc3911-dab8-4351-107f-08db4d1ed3f6
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 04:11:40.7216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P221MB1104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GWIqy4Bn3UWWmAPRvrvBTn0w4p766ey/KJGP4Tml6s=;
 b=WeYztuRZL9M5kfUSrb5++VzP+nacftVccump6k0Kc7rmKXbM1sxytQU27oZRDem1kf0tav7wCDJ2LHEyq19gaHTCa9QdvCWVZWOfFBUcC7ZTPJMHRUe6menwickhg2FCJ9oMY9q1bptXfKiTV/qAjY2cVGgyy4mk9CFfW6IEp2inqTjoUy3iRdA+UkfcW6DAwTN1RSkWtbJHColPwy5DAgQpZE41kms46+V6udtCycGa2MhYLMiAdZk5nxfVawrRcbr1Sk8whqmWAZeeQWtdNoWnWb1gyK8zClDezqgAjSYvMXqmttfS6eVa7LZAz1X8UWhJpXhmHDzPPp5AV5x5ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=WeYztuRZ
Subject: [Buildroot] [PATCH] package/rpm: bump to version 4.18.1
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The most recent release of RPM is v4.18.1 [1].

- When Python 3 support is detected, enable Python 3-related support.
- When readline support is detected, enable readline support.
- Adding a series of feature-disable configurations of options
   introduced over the recent versions, but where never added.
- Adding an upstream patch to prevent build failures for certain
   toolchains (0001-fix-var-declare-in-label-error.patch). Fix should be
   available next release.
- Drops the use of `RPM_CFLAGS`, which their use has been obsolete when
   this package bumped to v4.17 [2].

[1]: https://rpm.org/wiki/Releases/4.18.1
[2]: 429e247b869027f6ecd4efa0f31bccd2765e3875

Signed-off-by: James Knight <james.d.knight@live.com>
---
 .../0001-fix-var-declare-in-label-error.patch | 40 +++++++++++++++++++
 package/rpm/rpm.hash                          |  4 +-
 package/rpm/rpm.mk                            | 23 +++++++++--
 3 files changed, 61 insertions(+), 6 deletions(-)
 create mode 100644 package/rpm/0001-fix-var-declare-in-label-error.patch

diff --git a/package/rpm/0001-fix-var-declare-in-label-error.patch b/package/rpm/0001-fix-var-declare-in-label-error.patch
new file mode 100644
index 0000000000000000000000000000000000000000..648040c66307d1f896680e79c3fd96fe180c9fa2
--- /dev/null
+++ b/package/rpm/0001-fix-var-declare-in-label-error.patch
@@ -0,0 +1,40 @@
+From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
+From: Florian Festi <ffesti@redhat.com>
+Date: Thu, 16 Mar 2023 19:05:04 +0100
+Subject: [PATCH] Fix compiler error on clang
+
+Turns out variable declarations are not allowed after a label, even in
+C99. And while some compilers don't seem to care others do.
+
+Moving the declaration of mayopen to the start of the function to avoid
+this problem.
+
+Resolves: #2435
+
+Upstream: b960c0b43a080287a7c13533eeb2d9f288db1414
+Signed-off-by: James Knight <james.d.knight@live.com>
+---
+ lib/fsm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 5671ac642d..183293edb0 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
+     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
+     int firstlinkfile = -1;
++    int mayopen = 0;
+     char *tid = NULL;
+     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
+     struct filedata_s *firstlink = NULL;
+@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 
+ setmeta:
+ 	    /* Special files require path-based ops */
+-	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
++	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
+ 	    if (!rc && fd == -1 && mayopen) {
+ 		int flags = O_RDONLY;
+ 		/* Only follow safe symlinks, and never on temporary files */
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index dfe50303f7db47e34a42d6d0f17bf2c097455e1c..fd03f062bc7da37519e4bc95da37c70a17ba7d82 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.18.0.html
-sha256  2a17152d7187ab30edf2c2fb586463bdf6388de7b5837480955659e5e9054554  rpm-4.18.0.tar.bz2
+# From https://rpm.org/wiki/Releases/4.18.1.html
+sha256  37f3b42c0966941e2ad3f10fde3639824a6591d07197ba8fd0869ca0779e1f56  rpm-4.18.1.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index fc57a14fd6518ddcd65a90f294ecabbca8057f67..c66ce6992d9b29d0463a66b43d278b269610c79f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPM_VERSION_MAJOR = 4.18
-RPM_VERSION = $(RPM_VERSION_MAJOR).0
+RPM_VERSION = $(RPM_VERSION_MAJOR).1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
@@ -27,9 +27,11 @@ RPM_SELINUX_MODULES = rpm
 # --enable-openmp is provided and OpenMP is < 4.5:
 # https://github.com/rpm-software-management/rpm/pull/1433
 RPM_CONF_OPTS = \
-	--disable-python \
 	--disable-rpath \
-	--with-gnu-ld
+	--with-gnu-ld \
+	--without-fapolicyd \
+	--without-fsverity \
+	--without-imaevm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
@@ -80,6 +82,20 @@ else
 RPM_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+RPM_DEPENDENCIES += python3
+RPM_CONF_OPTS += --enable-python
+else
+RPM_CONF_OPTS += --disable-python
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+RPM_DEPENDENCIES += readline
+RPM_CONF_OPTS += --with-readline
+else
+RPM_CONF_OPTS += --without-readline
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 RPM_DEPENDENCIES += sqlite
 RPM_CONF_OPTS += --enable-sqlite
@@ -104,7 +120,6 @@ endif
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)" \
 	LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
