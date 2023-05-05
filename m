Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D11C7EE21
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 03:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 625DE41C80;
	Fri,  5 May 2023 03:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 625DE41C80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcBOgsUWPmgX; Fri,  5 May 2023 03:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595B740CC2;
	Fri,  5 May 2023 03:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 595B740CC2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FBB41BF3FC
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 03:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D60C60B49
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 03:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D60C60B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGjKRifoRL5g for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 03:44:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8245160B8F
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::801])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8245160B8F
 for <buildroot@buildroot.org>; Fri,  5 May 2023 03:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA22ecLy8g4xARGGKHbp5PphUwyxUGz6qi7E1zyNjC8K/TJRJAh4PSglPf5GjUPa3YOLqzEsHQ/RHqzHdbBrVLqY0owYKlxo8ZqgrgUnkircTDvYkOTW2C5kyDrTpMU6OU/lzD4j3RumB7akuPhrtgzY63Qn592k/duwsmPt6Rhmcp3/OcaXMWvkTnPIX8L5awNgo3+wxMXojxKnEug0vEHs6EMbFa2Rlp1tVaLtP1fs5RALr4Fnf62FSoLpjn1hzCvpcdLI1eEQ8Te8632Je2qv2vYT7pX2d97of0noL/bLmD+X7k7fNBEXkDZ5qsqLJ68NSYRYVV8qH8YZoH2/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYUcXNB3bNQjWL7d+JT13ZIzod6eqhWcYxYqiVvsUIc=;
 b=K7SG4b7VWX1G+waAJjm9IVVwNPdYTfMiHwfLJ4vgoeUm3Siwnw7YXNtIIGkZ8M3+jzF6Bk+PCOHW4/9kHO+skH16jbyz0XY5p3jKTCVMGlksflxbch8VjSInEVde2I1fwdJrsDXrywD9btG8jjFmqrNQx720qtRtWII2vVSAvCvzcc6jncD1PHeJ24yps9oJYtkVvNop9s1NyrejGAr5rSSGjAZpDMs7lHoIu5eMUfEWk4ZVySFiczoafgM9vH5717pWELieQDXCnibFQkTtNR+oIT1OOAlQDg+tRStzycMfUEscodyj5itmf5WvzQq+OO4IC1591OwvwBj86RCfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by CO6P221MB0709.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:140::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 03:44:19 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 03:44:19 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 23:43:18 -0400
Message-ID: <SN4P221MB0682333AB41986F29B75010BA0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230505034318.1903-1-james.d.knight@live.com>
References: <20230505034318.1903-1-james.d.knight@live.com>
X-TMN: [cjgaNOnN9RP0827wiAwNrAvQkDkJSlK6]
X-ClientProxiedBy: YQBPR0101CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::12) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230505034318.1903-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|CO6P221MB0709:EE_
X-MS-Office365-Filtering-Correlation-Id: b22baea2-5542-49c2-660c-08db4d1b01de
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvtSuoynPzOBnq86nziGpphYnHygm1lbVN6RwAwNuopaeZAsnudP/SfE76VBHoefKHUgt4D/85mdJ3D3Hc+rfTYIF87gvBt0JWvRnks0YFVrckRda1U8V85f2YlB8aO54v6MB8wZmK1OEgiW4WczqDbaNf3XHXpyVsdDhbQOd2lTSS4IOSSkewZhAcGeWbL9Tkq95eHSfgXdGFQQ3JTao3uXMDOG2Hf1zI5jPHX0VIHjsFs6rj+m7jd+NolYI9bVjiu4bNImzRcXsf5sU4KwEK6NzAkqX+w+SvFUTN4mJkk90YnpHP3OFF0r1Rmcv7KvHqccBhXXbC4z2q4A57odro+KTJGEDxyucBxBLWFOiLcfxRGIW7A4SaHs6UoXUozVil0hO1LeGgpaEWZejf9/qYQjKWeOI4hnw6D+wNLHATS4OaNGwxC8cM5yPtTRwnra2wXgShYXAJZop3zs86nyiUatiR5r2rgcIyWS7tjkqGqVTzDk4nTewMlG5MKgs+r5QdxAiFxife6SfBZocMr/e3oLZbBN+d6YgJMoVAMsjz61iQ+nX7wtUZ+A17O7lTtpVdFdqusj5dPwt/u4QggkvXzK3MeH5Go61bPZR5v6lJAP2Cm9u9vLeIQnhlMbbq7EKhN+F1mGe+VV+ZTl4X1hRNQF1Sl2+ECc9H46u0ZbtwIR7bH90Bh9ghXuEmbWcaldilWa+5v1kaIYoNtU7r4g3PHp7eZpSRbt4Jka/BHfFeEbEcqmt3t8OLZmdd1ic4oQt5w=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4YAU2eXq6p7FagOUYkOB75dNJVvSEXzz4tQBYJFYQU8uymMRt1nIiBlTTSvR07NZaNVzeX1bCd8AQUM1AhxRd8YlzXEDST2wGPXcZ9+40vw1VRUwgdRGUnO6IkF9qVfHVoTZ+IfHAiYAGrn9ySyTvC/rSq/CkvH2FmwIbfFGXQuva1Ug0JH9YH1nGM56pc2wqkQt94gWChaA00KYoS5tb9L65hPD0bBLXu0xMLhoU9CmiSByP4cSY32MuWLgixXLyAAnEYQNBURbQ1lmG3nurgsAFdr77wqyZBDzxwuYwzBCozeds/WdVlLrq/C2QpcFCbjqNiAj8yQaFHEPtFATc4w7i3i5RyT6DXfbu2UV4ghifaHCCNM14bk4h9wJryfXso7taEz5IwlnZSqm68mq8N5MM6pCNDSHHIMZvKlK13xnLKCtNkoVay1/378v/rqHt1WIEwBVF2u+AObQ2UtNpz+XdcZLOcku2G6/Jwiw8Bf7rjBNRJRsZnMiRDy6CFagFm9Jv2Epdvop9g8nvCg8+02pssfDVegfn4Q5Fq0CFrb7IH+hLUm4JTptLTVK+UJC0FRPEkr2YlpKmT7OC4h4JYT5SI56UojWZwDiKogUDmUR8i8ixtKx78HsnDUoRDl
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jB7xg49Kej68wE3OA6rX6WbY2R4T5KiPZfVnTXHE6eGiqzbJKZCubFZzBp1o?=
 =?us-ascii?Q?qF9mv1q7IZHH1eo1sqNSVSenF2Ky+c98UYJtXJMpfc0Deb7ohqUtQKCbEpFw?=
 =?us-ascii?Q?ebJWQZCl1h2lC03Aw9DhrNmw050CbcpcfLtc87AU/8GUUwzLGA5Z7xNSywX0?=
 =?us-ascii?Q?feMsjAvMDZ54Nq2/jpZJ4/4otHULH5mbQn1Y+zLM/Xwbr7VYdm8/14IAKHoh?=
 =?us-ascii?Q?2iQZVRCRkY2twD8dGPGb40AXM8+xU4Ffu8MJ8z3Aq0mCOK/10ObTjonEC1Xt?=
 =?us-ascii?Q?hBwb2NDEp74Lx/7MukAdSdVC1Fr1YJpX0C0U6hN7Q4d7ux1iptE10zk02lww?=
 =?us-ascii?Q?zNWahD+crIs6ikv7j538OtMGMCdsZ2FbDEl9WprYdOtFs3U02nR9+6Kn3DnR?=
 =?us-ascii?Q?Ms2k1yWsoNghxPa1nlRkcTMlFhYKMAkP2DMPFzqame0NZDlJXpISMcjDy3Ng?=
 =?us-ascii?Q?VRxGsI45SIjfHsKGXv3pALu0zON0H8MHsXXGazEEY9K8m4itpoqZrNlWFXrV?=
 =?us-ascii?Q?y24as2UVaHi2/qudqc59Nfytr1wyd1n/soR7eFUp+yBkkxk8g6EvCAzdOiAn?=
 =?us-ascii?Q?dRzIn5w1sBFKRlRVKMZWLhlvqt0LnzVq4V4IDMl4W0FHGui/ZFyWGGs/zupo?=
 =?us-ascii?Q?MQUHyf0PN+cAzhwqHATdxFLB4Zj3llGZWsF8nHjM7V63jVZDQio42WBL+3OT?=
 =?us-ascii?Q?N5wdX3lnCwV3FBGu29Pxfvis2KVRIlJD91JNRjm1sKgROGhrCWcb4+ZQdSTv?=
 =?us-ascii?Q?ulZFqu/0ZYR0aGHSTKZbSEdwP+2iaKPHbL8FlVI80btnWDA6WVHCMtwYF4zb?=
 =?us-ascii?Q?5fKgrJftpBBglo/D9WfkgAKIfMNEcuSMoZfr2rAKLqGNVJlpJhQj9SVSPvQn?=
 =?us-ascii?Q?MjALdjBpKKbnHbocfeFp6i9X/Zf0UtePzLUrFp0UhIAEDcFIzVW3w5yihPYM?=
 =?us-ascii?Q?LF3gNiJRzPNRU1xVTjlcOof3963SXiegm/CX09t7cwSLYK3+biONMNBdqXDg?=
 =?us-ascii?Q?CWm1RShVnslWqjGHNoon4A1fDrj5JJOq8yZmyOuUR/tHvnXQN36590W3BjGh?=
 =?us-ascii?Q?7/T2rfc8GvYDF/FrzEGxE3LED0Rq4hCsxp0C/9BETK159E8XPtsdWmMpZFIB?=
 =?us-ascii?Q?jWFXMuZ1B/lIFAK3oWgFFagcXXhPr6PYaFQRcxIOOGaxN62Lu4VJP24rK81g?=
 =?us-ascii?Q?iujs/+eqrNzM0lOqmpevXWpb3C8iEm9HMxwGOWc73fS7ydKOs7Fwk1Frna0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b22baea2-5542-49c2-660c-08db4d1b01de
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 03:44:19.7995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P221MB0709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYUcXNB3bNQjWL7d+JT13ZIzod6eqhWcYxYqiVvsUIc=;
 b=N/0EzRd253biA6X0UvHkTYGFH6SwJ4GtiXsfSeK7X64taGfA3Gd0jH9OkX82MzGBA3YYpkQJNuTCpPpzktNlNC2JKFiejP/5NQlRNJCuPaCU5QTOr1y1Zd0tX+w5pXR6yaVu2519VLC0VUCvB0DWfT2bYpi38Y2NEJ/G9oa6iIP789VHDCyhoxnmZDO517WgvPxydz6aIb1Hp2kaF4spijBwzVH+SHLYW1/d00q63hnPfO23ZWOV0cKFTGu+jpM//yi/115CVsqyjpyk8sqVZ942hucBPoKAoG3cTE+mymEslaiYUI2WBhIVXCR7PxM54gDibcfw5Ehawgr6Z4kakg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=N/0EzRd2
Subject: [Buildroot] [PATCH 2/2] linux: cleanup kconfig fixup processing
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

The following is an attempt o cleanup the output generated when fixing
up a Linux's Kconfig:

- Quiet the conditional check host-pahole to avoid having the message
   used to describe a failure generate in the output in its script form.
- Suppress the initfamfs comments that is mainly for developers
   managing the implementation.
- Adding a generic "updating Kconfig..." message, to help inform
   builders that the framework is actively processing Kconfig's (while
   users may be pondering why the closing of a `linux-menuconfig` is
   doing).

Signed-off-by: James Knight <james.d.knight@live.com>
---
 linux/linux.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 37797fc4f0e1b3fc4b05fa2ceeb0bdfbec9cdc3f..32b1213433636606a6629b333cc01bacf5843a47 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -127,7 +127,7 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
-	if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
+	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
 		echo "To use CONFIG_DEBUG_INFO_BTF, enable host-pahole (BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE)" 1>&2; \
 		exit 1; \
 	fi
@@ -367,6 +367,7 @@ endef
 endif
 
 define LINUX_KCONFIG_FIXUP_CMDS
+	@echo "updating Kconfig..."
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES))
 	$(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_COMPRESSION_OPT_y)))
@@ -401,10 +402,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_64K_PAGES))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD))
-	# As the kernel gets compiled before root filesystems are
-	# built, we create a fake cpio file. It'll be
-	# replaced later by the real cpio archive, and the kernel will be
-	# rebuilt using the linux-rebuild-with-initramfs target.
+	@# As the kernel gets compiled before root filesystems are
+	@# built, we create a fake cpio file. It'll be
+	@# replaced later by the real cpio archive, and the kernel will be
+	@# rebuilt using the linux-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		mkdir -p $(BINARIES_DIR)
 		touch $(BINARIES_DIR)/rootfs.cpio
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
