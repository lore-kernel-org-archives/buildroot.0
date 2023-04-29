Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEC6C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 18:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE1A161140;
	Sat, 29 Apr 2023 18:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE1A161140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWBgP9eR2M-o; Sat, 29 Apr 2023 18:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B792D60FDE;
	Sat, 29 Apr 2023 18:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B792D60FDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 313161BF4DA
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0653E415F0
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0653E415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCM1gMPJfQbm for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 18:12:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2FA841620
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02olkn20803.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::803])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2FA841620
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 18:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oY09ZHYxoFrGSlHBL/jg5mXCeEbWGWiSTNMlwmgLDsjwTzRMxPfjETmANZvvNrVRbK/DTJaOnt03XBkRjRMZNT2wl/eZkNcwLiERInbRhFpAuOsbNKyhUtI1sIayevOzSTQE2BjmzZuUYhWUPnKVjcS9DnP8usqZ09dgTTxjQ1FkrwQ8nGhveccADEoLeuN11CyZRkEpDlEGEUE65T15eaACfY04k9dX4kkTF47KweYszjp+ni5IAQ7B90JweavmMyFEx4HTAHb4k2ipVfag7ukdGVslX+yzxiot75JLCBmuFiGNkmJAeeR79yDvRuuZn5XIlqwz6OgQucWjsSYbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hOJ9QW+V4gvY8WvkZHrAQghMxhPUZI+4Jui3Dw2SNg=;
 b=Ks7XnvvIUdUQvps/Dr9GGAcI0aBGeldmH5oRCWMIq9ey2RyUTkKD4AH6F58VJVB1lxTXuzMpOy2G0MXPVuyeVk32+pn5y6VWDJ0Xjq8zWxV2XuYB9fMuKPkuTmWoHX6iLBjWyqEu02iYuZn4u4fhe1RbGH0A6oss6liMAgqEBjLMa5zWkgT4vhkTudX6VVs1VBy1Ums4fgIJNDR3vjq4Z83wVwRIHOeipwlFhHubwW6Y5aI8WvQqByFXsewovYYarS5PlmCkh8eT421c/nRGIPW+hJN9ASjd2c4Hw0wbHaIZsCk6pyj8ozp3ehja8cQ1cLRlgyAiuJ7U6wuExeaVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by CYYP221MB1094.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Sat, 29 Apr
 2023 18:12:56 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 18:12:56 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 14:12:05 -0400
Message-ID: <SN4P221MB06824359D91BC284DDF6F0A2A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230429181205.3620-1-james.d.knight@live.com>
References: <20230429181205.3620-1-james.d.knight@live.com>
X-TMN: [k6u9545YdEAXhmm+Ou2XKRZUlRF9NDvU]
X-ClientProxiedBy: YQBPR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::27) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429181205.3620-5-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|CYYP221MB1094:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a10aac6-95dc-459c-e83d-08db48dd5b23
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9XmreLwtPaBeZFZid+sA2W5GkWArvMT050OqGq6itiBOCQESDc/v61Fvjg5TzZdCk2s1wdUoYqZxWWj09V86k4csxN5B7A6oVtG3DOklfVW63d1pRjuEvql1rTSiMUCwULGNM9AZOak/neuOacslbqMQ1sSEgIKFRkRwMxFLO7TLNoUIurRvpYLbjeIhd3Hh4UlFUEBUyftswXJ9IvvycSwbxaV3lbJf1MxXttXJoGqSy3K48A5pI9QmjpjRb2Z6AwlaSnQ19jyrh9XRcVuYqX58bvbSNbtALdh2MI+IPh8NeQgdGhkUBzMFfMz0IVqIYZ2U65UJvhaZE89aqdXHSpKB4MPpLkbVCY55mYji68dQxn/vq8CxIpO1jBZ9ft5BAPBzyYTYjxf4j7Kt6mJkXjPnGer5QSt0yTRFDeir8WXZNy2Gc+y7qT3AC07OuRUZksx3SmXlWJdyg3IIh+yPOXOMUgRtCJ/cZUjMUZJG89BeIih5IHs5n+PDKX5v6hBl01rUoT5dcnhIJkqicz0qrYKZEzQA2lBcses3nQAeRMiz3k2PeRxlBahWcTV8f8NXLS1jAOFyUKRO3UuQy7sDikIbDOQTakzrnbNl0la1LaHilRPbafny7Ue0o8ulJ/5JDUTu23IBMCiP/CeJSMc4WIbnp7wcRJuOg5n96uzhjIXqB36Dloa6A63xLaXGnGBeJ+9jxWl90SIzOT1ECiy5uUATI2xFhxtjJ0XQVQAuhqni8Z4XbL+f57F5Zex6wyA8DoCg=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPAe5edVszTUIgyqQsQRRWJQVl5y/9EIEC9372CHm0ZsCU7/shP7et1e3cXTvhNVsZO0U7qHHXpgNkuML2yLtGwnbwDq5g4a453RXb1yzNWSgOOiHcKHYp/N4f9yklxwQlsV0CFEZqGvMaoVu71fsB1eflJaNLtzOkFy/d6ni/HZ9iBsRjRNiP77FLxsqFouBi5JIMaAVQzJm5YMLlIiNQ+rBzvzc80GtHR3KMc1kLL/sk+pbT88plP+yIUBOsyAqekoSuwSxuRML/BtxRmo6uhTQ1SBbfX9rc1XA7lSKBwz7/wwYW/kIPXS7bTKHCO2fiQs7Vk+89z3Cp0LGnirSUYl2ZitXpIWbsbCavB2SXuTCGew2LrkG+xcLJT6SA45YXS/GGu8jTyDH/uGvV2+EacHwe/juPukedlx8M8CfM+vqzk589jOC4cymidJQfHkVVSgtBSROco/CfSVW752cf4nrP+kAlAypaEXZa66L7kTdSTwFcWEVGvgHMHLn4LHLF7odC8L0gu4Eh4nDUN8N99zHpBjnFZ+KMj9lDYrpVsbkOpI4+GHDKNPMMUQu2JDk2t3y/szOPW0yH2fHUdqWzEj7dn89zIamrzBZ3cOuyC/mcuRO/FXqG8YRxPm0/BL
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Ht8PFE0RBjm74v4YpdLU38hwushLGVR8OOpvhdXtWmdDeyI03z9gm5SW66I?=
 =?us-ascii?Q?w3d/Ypw9CcwKxrtQDaP7JUurv5mZJfYsht1wK9xpPsCe+AEWoBp7UqzJb1vu?=
 =?us-ascii?Q?eFqyOfk2bg+NjFVjPsZ9HKzdca++0sHoG0gdJ+TQeqEXG83yH+AGEmBoes8L?=
 =?us-ascii?Q?L+PS/K6cVo4/jDbIx5dsPUeyK4J+/dNxvUSBZnndWnqeLteu7Po4g1JZPon1?=
 =?us-ascii?Q?jUZ1esKogkxfs0QDSlq217w08jfzqH6SU8O8/fCzj/ff9zQe8lQqbDJnb8aR?=
 =?us-ascii?Q?4cL6QA5q3A8p0cVfXEiVMu7T2v1nL+2aplRtVNMuF8uWgp5YN91raKJOI2TH?=
 =?us-ascii?Q?YfGVjzuE7u84XkY5XnW/Dvbih4DBd4i/Ni2Y8CxWrwSCwBvx87GPj1DoiXw8?=
 =?us-ascii?Q?Q+T+ard/Qt6PXDtmOhq+d1L0AEnsG44bHXKXrrxdyUeaFR6DCvMQRqPYVe+E?=
 =?us-ascii?Q?Qfx3xLqSkNTn8RsyhC3NTghK8gkHMBmg4r1tyY+blsm6PE+TBeDecY5HjvKR?=
 =?us-ascii?Q?fvvulJNQYPLFpf0yNoXa95ClybD1ALfZQ7VBjvj4GdLkUYkS1W8OKesleQnR?=
 =?us-ascii?Q?c4+50W3sZlrmT47FWV3mmcF9+mIvRcxOMpuM4MZ4XWMJcO718iKfk4inEULi?=
 =?us-ascii?Q?k6rEdPtyQ0u4v6xmIb/PBtAywoqkMpvByUxG76feOSrUpGrd0fON3T+hEhgY?=
 =?us-ascii?Q?rJl0zxgfGUJKTunHJgsFAyzScUcu7ASPY8RJV4JdXDt1z2ep6T7I3aeCY7wA?=
 =?us-ascii?Q?RO4rZUqi+W3DbZ9fFe1fu9aoLLRIyG2JjTzSP2AY3Jq0VzMDd9dGwyoHJCAe?=
 =?us-ascii?Q?6DurnI64MUqi/PYe+t8rMeF0CZMlMsmJK1K20dfjIRwRWLnxGnB2beEx4oQ+?=
 =?us-ascii?Q?8TMpUo5yo13GT5VV2iPO5/aUt/dZujNrhyeJPC6BS+EuKnXM0rxQYBzUmjrY?=
 =?us-ascii?Q?+l/hsfyDJZRCKkfqbFhJbXElqkSJm7g9wqX4cs+yYSxDkWs7fIdltoSPxUIQ?=
 =?us-ascii?Q?9p1X5OmWVmQhreKazv4WyRewSMbgYzjBIVMSRTfQNoVTdUWX77yMeOhKLvbh?=
 =?us-ascii?Q?Mp45qDV3LdiBHSz0OLreioprarTvDrDUe+Hah+ZESSSTEI2nbpHxivdFrwEW?=
 =?us-ascii?Q?cAN649A0Fxa/MdIWYbPnbchhgYNwBlnRVbkwRXPJ90GM31kFPCBQSn55dHBs?=
 =?us-ascii?Q?QD/X67LNIfGy/KnsFs5T3A410RPJkOH0e/hrvOeWfIOP2Isp0noxkonJbGc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a10aac6-95dc-459c-e83d-08db48dd5b23
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 18:12:56.1929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYP221MB1094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hOJ9QW+V4gvY8WvkZHrAQghMxhPUZI+4Jui3Dw2SNg=;
 b=PEF2BAxWU4cJIsSYjgnk69O9f4New3kmAm9CsF/uY1r2TZXDa4O0ncNCuqiCx3fZ5w848Sm9TKApg4ZOSrf68coTQjIwb2GmTgHc71s7o9/9dCX6xTox2h2XSY4+tQbwCFwQx5lBtSp5h4W/H+AJ7pWB82HO0EqmDFkYVkY2jUZlRAc/Ibx5mCL2+Z4w5nBxt/ckHMxM1r553O+Ksz7eiQi/TslaX+xUIAFLmzh5rfnVQbeEpE/KvsRpyyy6UOy7mD2ywRy4VRMWTPvlIhTN80ggVZUu+CMWoS5hDYZABuWWIr4Dwl0DIIsyCznLrLiDRsmvSf6qjk12la6vLGYx5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=PEF2BAxW
Subject: [Buildroot] [PATCH 4/4] utils/check-package: utilize ignore-indent
 flag for special configs
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
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Applies the `ignore-indent` flag to multiple configuration files,
allowing these special files to removed from an internal list managed
inside `checkpackagelib/lib_config.py`.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/Config.in                   | 2 ++
 package/Config.in.host              | 2 ++
 package/kodi/Config.in              | 2 ++
 package/x11r7/Config.in             | 2 ++
 utils/checkpackagelib/lib_config.py | 6 ------
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eaac32a01af363936edc8a0a8dd2450c458a38ae..9b7899c8da6e98353fba8a360f56df8a4a191b95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,3 +1,5 @@
+# noqa: ignore-indent
+
 menu "Target packages"
 
 	source "package/busybox/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1b0f2799c37dcc70b9e6c1203c4cccd..ab76d2aebc05abd18448336777f8d1b5b439edb8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,3 +1,5 @@
+# noqa: ignore-indent
+
 menu "Host utilities"
 
 	source "package/abootimg/Config.in.host"
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7bd8bc2943d4719b1af4f634d729ae0ae5c50e92..8befa9b6cdcebcf71c06c9e153fabfc776cdb2cf 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,3 +1,5 @@
+# noqa: ignore-indent
+
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4de8922e0d505431181d1df4473c54660311552e..80f25fa94b106f41563727c5fe2de18f110ededc 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,3 +1,5 @@
+# noqa: ignore-indent
+
 menuconfig BR2_PACKAGE_XORG7
 	bool "X.org X Window System"
 	depends on BR2_USE_WCHAR
diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 52539d97ab60664d0466b42e28b3aac5577db5fb..7aa4c535a6814fd479b3cfdc44c6cb10e53aa70f 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -226,12 +226,6 @@ class Indent(_CheckFunction):
             if not text.startswith(entry):
                 if state and 'ignore-indent' in state.noqa_flags:
                     return
-                # four Config.in files have a special but legitimate indentation rule
-                if self.filename in ["package/Config.in",
-                                     "package/Config.in.host",
-                                     "package/kodi/Config.in",
-                                     "package/x11r7/Config.in"]:
-                    return
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
                         text]
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
