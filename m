Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900B2C77B72
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 21:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB1E6429BA;
	Fri, 14 Apr 2023 21:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB1E6429BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrmnmrk72k6T; Fri, 14 Apr 2023 21:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB2E429B8;
	Fri, 14 Apr 2023 21:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB2E429B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFB581BF2FB
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 21:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DDF0404A5
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 21:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DDF0404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g47a4LprBg-L for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 21:54:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25CFE4046B
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02olkn2080e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::80e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25CFE4046B
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 21:54:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex8nzd2XedWLMKYhtrEQ+b+fOUPt46sQfsjlu4WpcBS4vMNmlEGxA012n4p8aLN5xlZNyqgm7fRd3A7Ky7XOM2go8y3jDhMCVFQW+Z5TqRhJXBAVqrkWWs+wmRThy6A9/+BEz5dmBTeLvFs/qEykeH+Oa4/SbTURuXHyLuHpepT3z6VXGMuV3lE5p4Yb8KsG9lqOfJfRMEDk2/aIVDC0Qo3afLaSq52CrIOwBOrMMja61pFBR0UScRmYDjp1HmS8VKhA8UEhIz6Cqy+ZGXac0D0YVKwo/XEV/CKkrqp/z1KUjVT0g/smwEgGCXUb05/J6k7ZPDSUdVxPpwga7nLbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZVarAQZHEhp3Duw3NVpyz0u4Vrbe/uGSxR/YHg+OK0=;
 b=fTWjVtAl0VmKSI52sOXSlschDtGm6PrnbiDwwe46ffbFwWwvxGs39Yc0uWw10WD24IoMimf0J36geVqyieNVDTPGAfqgL2uNrbM/EnM1wOm7AyNeTZ8afCSVNsoVNscbub2IU8P7tTHK+MmGtkeAlOzCgkRKBXhB+3c5ua6He42FZesQjJ+wz4afT7tKKM0vmBwNMdEyx7Jhwx9E3zoJGGTH86UYY6b94sieas9gJAa8QF/w728rZgr9NXWNo429KEeaIosW4hXkuWBXnkwl3Xzjpq/uLQEGUgX8RT3bEEMKmeT4cZIdaRkhtl52JwJH4scFq94XQs1dIFrYZEuKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ0P221MB0953.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:47e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 21:54:44 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 21:54:43 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri, 14 Apr 2023 17:53:54 -0400
Message-ID: <SN4P221MB0682F9ABB79DF3B57BF6C4D8A0999@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [Er/Qm9OmdLM16BrtIiCH/KhJGWH+HuuXttTCZb3BRL8=]
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230414215354.824-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ0P221MB0953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2332ffde-1dc4-4774-9495-08db3d32dafe
X-MS-Exchange-SLBlob-MailProps: EgT5Wr3QDKx/5wRYKwbtF7hqq2E99L18Ec+FHjToswJLYVLBsS3bjWvjQYwdc0Tt2m50u4DYKM5m470ASH5u7ijA1cf4XIJGPHbVehhncTsOVSnTEb4cpIz+UNsF+vIIq9CEl8zoeRovLMlr3x1/73QT+OUI8CrGdtxyEKABO7ZRhSx1paDQaq/j16QgfQS7Ew/FvZbK+lyDTKirIahWbAM9Oro8aOozBe4EtFG+uSe45GYoBg5WrbFZQ7CahLYAUeyuCXUe+YHBBtJLdEM6VSlyPSgw2KonwlTnQ+sXn13w+KWkU533wzjB98G2D9Gq/QXsGCeKpn+QQPcUD8pPwdWPucQZMRpU1a8PA9uQoWIqZRMwa4Wa+Q2vsa6gVw9QvstbkW91Uzsz6E9761rDnW7U3PSl0Sh4Rp8IclD3DQe8A1qTn0e+B7TRKFC/aJpYXEBV9LSgIYWf8+UnTjHtp29V5UcK1mEeCh0sEHsrOJOYGsij6YaFIXMDbsqLut0TBY6dO5HbEg/MY3JoI36LTjrQkotzz45AjTrK+IKb2/H42K7FmNv7VmLOEaAhFGA+AGSYibeJlHFE3z4WzhYDDpwJclidDWQ+6OWmE0Ho2CwiMHoclSHu3b4WrBWYtV5LgIFTIzWFMcs9dh/E4If/zwscT3E2dXk3Pjjd3YQgj67M1phNRaxe6yXlr0vo8MLQlbd2EAJ7+17+mIbI0OXCZKOs6OWgRIKh91ptNceI7Bg=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: djALyrMmISIxYTaIfEYS4RHdFout/o7eTChaXlU8pwASpH58VoDoHprENPyyCjQhglluYWAB8FbEX436iHVk90A5xssdQuAcuDJtNvgBlfeeMnnJC8SBziqJvF8WuVBgORxjbm14PtNGN4f6e5NaLSWq2RvJex3kLZxn7tGiBrcopYKS+d3oqS7V+6z+4YO4tnIyiFIsQ4y4vVsDl0PI/cJitmqLWkI6lWLBZRTs01qUCGTUD2PV3OCoksPes89okIYmlHP1qIzxYDsaiaXJtckuqT1g5IsGKnjE+tPCqcggUH3y8eAJ30KgnYJT8oKWvTFNR8pTxqNAIOkA4Bq247kByxDOwkepAf8i/PY+jtq0+OGSRyOWrtfaZmlpfJ+vnQr1pGm9MA/nPeDFjbeqhWdIehtkLsYh0nF+tBGfDsUnDex3YPwGlpJcm4snX5nKcWkFvSz6rFhSXCBXDyqJx3Ge/PxOV47EuOsos2hO86pqJjtz02Kk/g6r7oVlkDL9Hu+wfBrleVVUGMEU3zAhRVdQLJfxT0VeobK5gCXbIvU0AkrQkSfyaJ/mz5sopYimxHPZ5t17A9doZyZsBte91BbWWwH561fmahAHUwBu+EzaHlaFuIY2+a0glFWsO7sG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Fqy7UU3pG9n/aBkjXaKrfl4TJPmEFvtIu1jKvw2EZ0iSYp5ScWuytTRUMvs?=
 =?us-ascii?Q?4B6AX3QmjonZnZV5BtTOt2UUJA/Wo8hkYg0RYu3Tpf4L5D5KBu5Dy25bE/z0?=
 =?us-ascii?Q?YoB424WU2/JCe96rLvu8fxy10rWdwQVLyoae4W3IC0ncnJm0muEpcTOY2zMr?=
 =?us-ascii?Q?Ejg+YqAi/QVLXFZ4K8TQb4tAyAZd98+0hR/Qe8ru+54ch5cKgnPAisM91evM?=
 =?us-ascii?Q?J/8n1P6gZaHxpA5HUhRMzUhZ9Un/jw0PGR2iKYBtEpSrhaGkCCdUo7jC58ZE?=
 =?us-ascii?Q?VsqaVsb7nOA+qcgW0qySQ598Si2UK30HebR8TbrIWqeD1mX+MEoHMCWYK+lI?=
 =?us-ascii?Q?bY/dAyyoU3xQK5Jc5Nvnp7DNCb8xrWa/EOtnX9IklJEkOfMKnLBgRAXvXz5Z?=
 =?us-ascii?Q?Svg/Ooye6Q8QFh0lKNoZZehKFGSZ/dRm4BJi387G1bxpuP98pi+ZAWRhFDGJ?=
 =?us-ascii?Q?uYsvRKf+mrN2okE8pMKjLkxMpDVreWVhDD5sGAsYUDk5plBFR0U2/cwW+5Pc?=
 =?us-ascii?Q?xfRZOKQlbRA8mpyGIG8FbtJt/eqAbTt8N6aoW0LluC9jreJK/C9RZT3T300m?=
 =?us-ascii?Q?7BMJ7qYAQ5ILQ6WUwsSUJ1zXJKe0bfNFttjVa6ekZabD51C5eYPxknQp9DZn?=
 =?us-ascii?Q?rGv/Wa2VkZK0sdjmU+/9jCufEH7LAn1UJbeG8nAWULDMdk9pQFY1AIfLNEmY?=
 =?us-ascii?Q?YEgoae1H/PluyXMiV8AMNK2KUT0QpQ2HjwO8wjqLPHP6sOKjbYwkIqPjnaTq?=
 =?us-ascii?Q?sKpSa1dSXY2TDpS1DV5ygwzlc008zQXuFAwZT59hMjrdWLSn5c5irbXIncNA?=
 =?us-ascii?Q?vH6khX1JKkVc4G56XGrf3Hs40lcEo6tLlgXdDzFzXaUXnBlHgFAVJR6k7K/6?=
 =?us-ascii?Q?R4PA9iDdZkr/VtJiGMSi4whB4kT257vepA50z/MqVpx5Zqt9o4ck9XUrEpVX?=
 =?us-ascii?Q?ZqIYRFqCaN4/4tOGIxeBXDXWzOXw2JyZ9QU5WBxIi8vj6SwWc0ct3ocokgXX?=
 =?us-ascii?Q?n08iKTecex1OMllPfC1VrgTWFi7PuvRUFgR8ZDhTM+eHf3lA/8pIkqL65KAg?=
 =?us-ascii?Q?UQIXzAWC85o4mmcfOzD8Qtjb8OoKhyDbnChYr6v/9vgw81oe1aTMMztih2QA?=
 =?us-ascii?Q?kkKiByQejsPg0GhppME/GZ5xcntkUm3dmgyAHyN29E4ktFVf7PYEPtGF/zBa?=
 =?us-ascii?Q?+vo116u4YbyR0wCNDPj3Omy3Pk8iTVgRuhoyibFpOrkh4hlqMDycalky51s?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2332ffde-1dc4-4774-9495-08db3d32dafe
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 21:54:43.9527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0P221MB0953
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZVarAQZHEhp3Duw3NVpyz0u4Vrbe/uGSxR/YHg+OK0=;
 b=oR5Z0ytgZeAwM+/AqsIU8GwXI0lZQDo/oMcbDAt0X1fQL8x8iXrEugDk849GD3vn1MZTzxkJUClXo6gT5znyNOuBiRkP5mGpUoBjgWatLkeJe+d/QwSYQabpnd3mVcmVNa1tcA34vyymsDGrIFYF1MoSbHJ9FANNJ+wFvwfzstsT/mrrnwG5S/xJrIMuhZqXeF2vkAa9k9mLbgWBRNPBDmXaw8v5naA70yWMNadFHRthUds2Aw0b69WtwlyuFSN5HxpbKrsWiCerE2eR5ekL3X/ix8X7O1uj1TzsSNfGvqjUI7GT0tASPHB2E6Qeoq35u5k07P7hYMi06vgp6cquHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=oR5Z0ytg
Subject: [Buildroot] [PATCH] board/qemu: restore readme globbing
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
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The QEMU board's post-image script will glob through various
`readme.txt` files for an appropriate command line to use. Recent linter
changes [1] prevents this from happening, and results in the following
build error:

    >>>   Executing post-image script board/qemu/post-image.sh
    sed: can't read board/qemu/*/readme.txt: No such file or directory

Reverting part of the shellcheck fixes for the README file arguments and
marking a linter exception.

[1]: b32d7c99c64d6dcb7a68036a7abfa86b8b558627

Signed-off-by: James Knight <james.d.knight@live.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/post-image.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 763287ca391e970aba016fe278fa0d37c8a618ad..e344d1e6bce4e91bfb0f38bc992bb535e4c9971d 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -12,7 +12,8 @@ fi
 
 # Search for "# qemu_*_defconfig" tag in all readme.txt files.
 # Qemu command line on multilines using back slash are accepted.
-QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' \ "${README_FILE}")"
+# shellcheck disable=SC2086 # glob over each readme file
+QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' ${README_FILE})"
 
 if [ -z "${QEMU_CMD_LINE}" ]; then
     # No Qemu cmd line found, can't test.
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
