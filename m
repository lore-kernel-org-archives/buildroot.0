Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD80C7618E
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 14:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D5D6FF8A;
	Fri, 21 Apr 2023 14:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D5D6FF8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AS23Pp2JfmEb; Fri, 21 Apr 2023 14:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30296FF6C;
	Fri, 21 Apr 2023 14:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B30296FF6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFBA1C279D
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 14:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B4E381DFF
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 14:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B4E381DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEStiYBCD3Ra for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 14:12:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E4B81DF4
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::800])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9E4B81DF4
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 14:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSiiXLYPm90ZnxnIPHNSO75HqbF85LB6cb8wqfItRbiYTyNILsG0qPHct6Us8i3TmJecp2KpihZhNZ7wveg2WeByWXfW10yV+jR836UYtRMGT1PtcGmef1Jbt2i8tqsNweKl8VV4wmAflmMuDeVBquZzk4ThGWel8kqV9y7+IRU3OJ1X0N8EDzDSaXy9jWNjy1nowPQTZC3WySlotMht2mLE4LlTv9At6wfJTIoaEp6/DFfh5eU7mWQGNP2iq/otTpWpZhZLs4Uz6R9o9qNkQ8W6+dVcIiMYatwgAtZ1gaPWjRm4Tfwh4xuZ3MqN3TVUbve+WIWjz129/SjiOSWixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYf7NHCMJjFbppkFj/C6dv4RcZmhNLGXR9mSaaiHvuw=;
 b=Cj+00iC3Zjc3xAbHz5cbrZkO4Pks+ZaG9V5+1J2rAnudCKKlweLUWMmh+IJ2WaWhh4B6/Uaoh8qzp0gSVnAcY6L9pQaCj1L/9EmOKcs/FP+6319PssCEZUqrXRwa1Ix5WwVwHL/p0hGwmKNsWyRw15/DM9uP0PeOImASAd4AQ4tLYOaNx/BWpk2UrfkccorDAtVjA0YlmApnx2g5xMwVwgI3Givowmrnl2UgkDrc8Ozo77T+y4LFDtumq6M2ZRIzpbhNdzJXt55ebxClH0vfqvNrwdzv1MjnF2adez4wwZmSWz7vW98MBQSwp2kH5gKGFz6j0GyJES8nDmZAdZ2KbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SA1P221MB1127.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:38b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 14:12:46 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 14:12:46 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 10:12:09 -0400
Message-ID: <SN4P221MB0682F66DD9BCC6100721CB41A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230421141209.2826-1-james.d.knight@live.com>
References: <20230421141209.2826-1-james.d.knight@live.com>
X-TMN: [NT9E+N3d1Fssilu8VrWbp39+VVMYKNl2]
X-ClientProxiedBy: YQBPR0101CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::11) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230421141209.2826-4-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SA1P221MB1127:EE_
X-MS-Office365-Filtering-Correlation-Id: da421919-d05d-4ddd-a6ed-08db42727acb
X-MS-Exchange-SLBlob-MailProps: feAVlmA1hHUwXCO2pwNFzptQVUyTW3cJLWB+0a4Wv8rRMJw1tS/yswoxuPt6EbsQf6KNOip4zQG3jykZ66/weLqyWNN/Fwc7HfxGLsl9dZAv8Ryv6n5Rdrz05OwHQNyM3n/C0MzgsG7vVp6cqZDjYlU8gVyinzlcOkfsnX1oS+j+qUuPY2JjcV27c72GF2kMhTh+jnGo6qrE5N04itBApUwiqTXanhTz8wPF4h8DZbTTlqJRQw+Eey7e8RdDtngVoWLq1jYmpp5uEi3YjojFCJ6YXQ5R7Grs9iHk5yE8r4uSGqzrB2dGh8AH9C2EHypl8MrhGiBQS0th0/HtsQr0uXkrVDKIfshmx/ev3oZCwRmpI/bA2jaTnQr9GCkmZWgEkCgIM0zBXT4Y9PGyymibOyq8WcPX3wuZ5exoDJ5bjwdutjwLSDGYAzd4JIF7d0VEJWpJhO8QDOYXEVRqZsIxMImVY5NrhJCQaAxBNzoXHqBz7kO3Deb6l9UucQuWD6KRRmknhjIXJQBUBMwdeNX+u7q0LjzuLU0fg/hdjbIKSRMe948CrSD3Jg2R8+qQexvX/XucM/nfIlYhi+GTPQUPyguZzsTiM7wJF+kjHt/zMWVWfx0A3X99g4hgHNOQRKR4LyrS+rpD8+1Ind90gdCvkgvERvdsbI4+6ytQx3ZxM7L65vDb3cD2Vq/IeFdds2FheeEJQ5DdleBdLMEab4QomA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TA53vDvr27261nHUNGdC63VVGSkGeY4iNV8uMy2kaUnHIYo7Tu/KylsEmCim4YXkU8vSJhM1gmTERBxrheZTmBfjqBDRdJm1wOrpwV/P981e4ktOX8O9TrLannOZNZooRqfOi93EHn5HSoVs+nr/SUr9lk2druXqTAUAzZPb0l+fQcB0CAVqOyPJnPl5x5J5TnRaps89I9Cmm2bOEbhSSfYsdq4PFl62XuEtE4Lt6Xcjuj8Cy+oWjAGJ0CaOwZdGATEGRX6YTQWJBLocjAHy2D6YqmcvWisl9m/obyiZ4zIijSJoRanVbTcm5fVDwP1+ji/lWqUnUF8L25+ww7W2YDJzjwuD6Xt6hQ1FbGmQFFxJuHJQ0W2K4j+STGq4gm3Z0XqGbxSZODNXPeE/zhttoU5WjR/IsK+b5AB9CEhezyvMEj94UOiCCIoCCxdzPcsicjIl4HuCyy4MOtS7dvSdXOsZRGZLnF40AnkEI58PFpUeHJV+g0h9gJbZy3efGmJx0oFIDCNTNyUYRfr/fGmnJALR6V7U89AloQJLBnQsxmRebROrKX/UZFhVaS9W2m1+tBm46VC2UwAe8HWn2z+G2MJq2ZhmU+lJl5Q2aBZhRNY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GL8NhPlI/10VgzmRMc4byVQqVNwdXFCPIFZ0XgWeRuzsi9Jin1Gv/x285O1v?=
 =?us-ascii?Q?RNh7yS1xR3xoCOQUsO1tQZNqMMxfltmdfCSJ1DV8a4ln6ItFpOsHwW5LeC/P?=
 =?us-ascii?Q?RHGEnt0k7oMgaA7bYbQ0fpufnIa+OfR059XRwKC1o0+ygvRp044iFymNbV+f?=
 =?us-ascii?Q?ExIP/thiIJgyWhZMr4subarZ3Rvv0y4ZaKN1Gz2E1O3OUOMcgvsWyBAuKZSl?=
 =?us-ascii?Q?UpKSZ0H+evcmx845gqlvflS0MWe1LiCKUWnZCmLaVI8SmcVBenYTm/WN2tjU?=
 =?us-ascii?Q?CB31mCDe+yTSsKlIIMhigf26Lh9uf7IiUzjh5Ro3rVPArgdrwoMf9aNSK1hz?=
 =?us-ascii?Q?ItOgGKOky+FZF5z2yL7xoUvxv185P6RcNmOBy1S1ENXHWweF4jpij05NNaRT?=
 =?us-ascii?Q?ylqiklY7YsmfO/AsEy5eKqE94OdZx9l7JlnIT/LJiWzAyK8N6+mvU6GJaH39?=
 =?us-ascii?Q?JVUB57+kEgk8aOn8Qh+/z6TdSsmOvOUCvi6FQmOM/MA6VkBe4wcathU9+Zr4?=
 =?us-ascii?Q?FanibD9SB/AwBisOWK8FTELHN9V3bFnvuJkf+vber15jBAvblta8wDp224WW?=
 =?us-ascii?Q?WxiaEyRTdWnnpPhLO4H7ZAnmvTkBoPl2d6w1irVPjPiSkcL4/7LwN3gKgEtd?=
 =?us-ascii?Q?derhdkV5lU9ZQ6lQVOZ3p9HHnMjsTsONFkAFsaeYgHavmA26nCB7zu6Bzuez?=
 =?us-ascii?Q?xpibK31JRUSkHvbTGAJUeVYad+G2uG1KJa3HKC8wTx9/tojXVkBvbdfgUEG7?=
 =?us-ascii?Q?KM9CU/v38Obt1emjsC3I/t9RF7GLfBAgr4Gf9IXbwCdaSWteovWxzpRnGK7I?=
 =?us-ascii?Q?lnBh9Xg4gT0+dIqfJFhglvTtHsgwLRATfPTgvmqM1SSeHEyOB3fJUsuIGYQH?=
 =?us-ascii?Q?VDROSuRORFTda3/aKurQ0mGDIoIoVSz5Td5u+BBrip0G2zmerZPa83BYWvt0?=
 =?us-ascii?Q?cWuiVrk1KJtR5JzBiKZZrI/hmfFqhPeanIDLWfqeSOyFi0pen1bJLCDzdyQQ?=
 =?us-ascii?Q?NLHgiTo1rMNdRyCUrKsOARc7PS3pXUaMaCMTZNJUAZ4WnVFUfSWpbyD0peQq?=
 =?us-ascii?Q?dB2FNUtFfPn85bjpcLzq37eVLG6vuLS4NkZdrzHWvZ4au2oUiEbAfrFQhS0Q?=
 =?us-ascii?Q?6QCZYw+XclPx+XWbekvNII5ww3v1iNjN3o/xQ8+c2VzFKleVDLL5LgiL6D8R?=
 =?us-ascii?Q?X2F194Hitcw+ZRlfDHaR47mYLku/QkMEMGJ6xqQcZsW5AHx+4zEP4n7f2gc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: da421919-d05d-4ddd-a6ed-08db42727acb
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 14:12:46.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P221MB1127
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYf7NHCMJjFbppkFj/C6dv4RcZmhNLGXR9mSaaiHvuw=;
 b=X1PPrP6uj1JvXDVWd7nDsZEBWej4SVH4ykO99rLSsF0foXORwdP175sWchVOF+tbGw18g+VE2NQUw47+W0Rya/F9VhpicMeFKAZuea/pDBvyvPci+nby/9VgriEE9Phc+RFSx982AE86aUd7uNRIpKGQH4lsNlFfIX3064CBdBN/0DOn2kjF0HttMsSbsHgD2+c5j9Zxl5pGqFaK42Keo24FwCn8K2HQ6hXZHTdX5Dh24FLHmkSavrp6jT9C4nA1Uw1EyC7Kyg2eLRp7rmoeasuxbdUi67hmcb1Zdo7iqzkldHG737WXntQGdwmyfn2OSvoDxXPs60nbwgjbdMwQkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=X1PPrP6u
Subject: [Buildroot] [PATCH 4/4] .checkpackageignore: drop legacy ignores
 (glib2)
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

Dropping old patch ignores for the `libglib2` and `glib-networking`
packages, as they have been dropped/updated.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 .checkpackageignore | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 02c892c1b3144a14abbc2a0f3d0b3cbfbf7efca7..a072afe70989e36b1c5d033a7621820c36c71663 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -606,7 +606,6 @@ package/giblib/0001-fix-imlib2-detection.patch Upstream
 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
 package/gli/0001-Optional-building-tests.patch Upstream
-package/glib-networking/0001-meson-change-std-to-gnu99.patch Upstream
 package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch Upstream
 package/glmark2/0002-libmatrix-Add-missing-utility-include.patch Upstream
 package/glog/0001-added-emscripten-support.patch Upstream
@@ -801,10 +800,6 @@ package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.pat
 package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
-package/libglib2/0001-fix-compile-time-atomic-detection.patch Upstream
-package/libglib2/0002-remove-cpp-requirement.patch Upstream
-package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch Upstream
-package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch Upstream
 package/libgpgme/0001-Fix-build-without-threads.patch Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
 package/libgsm/0001-misc-fixes-from-archlinux.patch Upstream
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
