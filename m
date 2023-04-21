Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C01C7618E
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 23:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42CBA60E07;
	Fri, 21 Apr 2023 23:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42CBA60E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooKZwNV1-j5v; Fri, 21 Apr 2023 23:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD9E60BEE;
	Fri, 21 Apr 2023 23:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD9E60BEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52A9C1C2755
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 23:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11DFB4291B
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 23:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11DFB4291B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4iYx8w8tyah for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 23:41:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA7A428DD
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn20828.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::828])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EA7A428DD
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 23:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikLFvQNPwTCJLQhFIzLMSkaUA6Ju8E3aVCgIZwAcb+wgLc5TPX35pT97Z7TuSRfNabgHyV7MQwg/mrlfqBaoKkJDk5BN3ku6QBs2DfPjZ0UQEFG1a+l7/kyC96Dgif4sk9r739+HpswwA+0+SyjHiUtBwUWOeuXmOnGGv3oHG5IgsiH6/A9AavUO2Uhr3UfhwvftS4pwF7iYJofax2zEXhhELIXNG5InVU1ZbX++S9s5ODcGoxb7hjTC3I0FzfTm+aJeqr3/GgPNBSYsV7cEDz8tS7Y4spWFzs+odgsP4rRt5kvE4hFW59brba0Be8oHMHSpSeMXeJoffvBq5sDWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wewszWVbhgkosGxJnPZlqQQAD3+Wfo7yoz9+DmlPRz8=;
 b=DcYZ9X22cFauC8Rtl99/of142dXZ/L8dw4wEnLqbeRdJFwNG4bmCmVCbByx31S748+HpgYhzhV9nnjvYbXF4JAamHmFNyr6q8iCBp73sBUo5+QExrnRVH5gV89bhJ7MXqfqMjUFyxhhXRd163OUqgmhFh504eLLko8TgYFJyib+RFCY2zApLBlmtMtGZ7paOPUUyoSVI8mwSBeCBrpskEBiOlo0vC9e8y3ieFZRvOyuTfXs7meK0v0NNiylv5953r1cNvHMfQ2zFf/u8OkiZ8bZ5iWK8gMnRvJXab3jr2MNjWp/vsIrA28qsLMo1JaRekLiCOauoNWJxwlFfV8w1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by IA0P221MB1084.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 23:41:00 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:41:00 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 19:40:33 -0400
Message-ID: <SN4P221MB0682F7E2B63C0ED16210383AA0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [GQ2KJK2Kl3aYRTd/kUduc+xUWkIj0UvL]
X-ClientProxiedBy: YQBPR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::9) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230421234034.3044-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|IA0P221MB1084:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bf2e57-ae30-413d-65eb-08db42c1dc8f
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvs+Zhh6OL35slIseIeUQLKVJsZVXArk8WEPLTV31Y/5chaY/HH4Bd7MRdIO5X1Znat8Q21rQ5byh0LfKvs6aqk7vLYKN1odddQAoB1Vg5TTIY2zrsp6aOEZxNPz4+Hi/Xnv/JVnEaBEbXuv9OtBnoUi+yDxs1n0KR/S7fD/6K7LFfj+YdrU0q32uh64Qoytp2p1DRV1k7GLSE3IMBP4Zedm4505kVa/byMD6Log1EV8cUrm9Rn3ZVWtQNxYzt1suy1vbcVvPQaC/PBqAFTsAeY8M47kcfkomOg5KfuSgYtrJkewUjSEFyDA87STr4P/Bx0zWAeMBnuDq1vOjRHuIu0tiVRhKQQO3t/N4nJ7cWJvf7/rRMW/5naqAKg1FwKyaVYV2RnSLqxVR6rZrNHG3OIsMVtuBy3tHSYciTQHU3uChOJCTZsUleUMKTsY8BnMX7cIMx/r6VZSxXwFtMYMqfdy9edLZWMHuJFLXoacHzva2o75HdbG2WYh7RHbo4UaYcL/R9cM+TTYP70D4qdEhvysz54SRU22I/3FSYOfMeOJlw15F+Qwfpvf5W0zEAq0Jbycpdy6+SXy0t0boB5g0oPVos/2uQ0156DZARScG1XMmgo/kbSFFpCVyVkvoNYAZf6bUx6bpCbO01LJ3zFnq7EDgsp6SlD3TupLzAVll6qOeuy4dCDRvMObc/uj5XQhMOQoFbj4qV8XNK06I4GHxMJhZcTOAev+RJktuhjXMjImLBafJmHd5wytBU0s64Fhpec=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yzeVBWVCCqmmn6LiUjV2KATepHMuzTrqlJKGE/v6eS8SMjsPC5riqXseailmt6S4QfuoquZ8AAM7c7XQ4YcqHqrjrOI3/NCFZMV4xkTo6qX8Mahg5g//d2IIl88d3L1DRLWGZH+LhZQV78ZICLbTTj2NMLvd726ZCR54NboJgyjIqMq1kTAuKsJaWcFMl9c2DDZVA+xNZva5nXjKEsIs1mqvf0oERyGsLN3wx0gg7XklW/kQ92dRIwzpH5m5vTJ8YTIywgEE/qLoAwXclXb0eQpSfXBZYIG5bcVYagEr9C41QVTLgCZ0GRVjON0hmhXl2VyOfoj5shhCC03AY6JHss2yR0frmKa74eIz7TVVLrN8cZk1PvdY3plgLbf2h2/HK7Z4K3u/gzk713FG17mxa7xIb6cWNWRQ9sYbGh3xwHlPcgyZD8wZzaqKiszTztBaLuvullM1mwy6/oNPuYSnUrtznjzapX0XLZzaRCShQxBokWEUX1jqiImhvDalr8SgwoO3tj5pMctEMfk20ilH0FaqdWTY0FLo96u+AbuEGYJ3KwGXtm1QWSPk8t2RA3NRzCocPsKNJTSvCFWoBPsUoGU/6HmNcfswYpfeZVEYPrnDvpI24taKEcNutFZgPCdF
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V1zjL9yntt+JiTZCs3GjoKEKyuJpYd2K12VpInRUND2Kr3KPPwJFtl48TOM4?=
 =?us-ascii?Q?bh2zih/d5/EknwlZWQ+UWmSwLgx516hsjRJOW6dMg7kG5ityP/DgargtQBnz?=
 =?us-ascii?Q?dvawSKBSWD+xDpAFbswnZ3/BQ4PuTB87A9HFj9RTb/dtgtP2Bqp2yLTLL0C+?=
 =?us-ascii?Q?NYLXYzu0iPkPbKpBF+HTivqs7X/2yyy+lOAK7p05p8N1VX7+rQAu1YPgrVe4?=
 =?us-ascii?Q?1lP5Q9L/d+0ujrNdNXkaFE0O85A77QQIoaNyEBu4sh6MCWslc9kbLXTqxtD2?=
 =?us-ascii?Q?WvIBsMDSPNvEt9Y5/dJoOQJ2R3sCAnisCqgEjZbYIhvMk1T78l1a9W5CV836?=
 =?us-ascii?Q?PKlI93k8za/tcMZ9dOGb6TxjTD68W4JiKOLGW7+gkfFsylmmKN1gx0B1b+JP?=
 =?us-ascii?Q?eukQrLQZ8n8oerLkzoUKTIW7nsGWov6wke4uWDuVoh1/vqjifLQCcQz6PeH5?=
 =?us-ascii?Q?bRTJqlbTymDBBbIYPgHiFhrzowqCprGh44T224rrHbnOagAPFiNtgkqldspL?=
 =?us-ascii?Q?YcaXb5kBxKT7/7m6O9s1SYAOPBgJTYxJKEW1WBzo4rrhmAhxu33adyAzI7LG?=
 =?us-ascii?Q?kFNemS9jIVcWqTX61tFr0gEjmqMfm2Vo3dRmP3DSDfNUwIsexE6h1uNOfgo5?=
 =?us-ascii?Q?a4xP/QnZ/cieH1b5XOL3j+tcCK+W8tfsYGYYAJRjULqGviEEYNxdjLY2s/A7?=
 =?us-ascii?Q?IcVgUNapmz0LvzvRsNJB9LVSjcPNlaOPzRw8dW6khHawzJYtMwfEkAwSy49k?=
 =?us-ascii?Q?N54rgZfzQaNfxVoTafzFp/wbNL2g+g4eLBmz3puXefL8ivZi8wDkgKXmW9Aw?=
 =?us-ascii?Q?T9ESS1ttzCo7FRCRgdWhVh/zY4s/YV2lc0czO5//JM0oM0tgYvQV0amk41EJ?=
 =?us-ascii?Q?dUfjzoiSwnkV54sovQAZHpWqzodX/taE37EyvyrY+lgZqi5CU/lbr9xAKQXn?=
 =?us-ascii?Q?FZDLU4Sjjfgfrx6z+M6ci+KT9ZWdmKbd8CfmD2TMwJSHxYPsj7gM5W9Uf8jm?=
 =?us-ascii?Q?aMyhxgAkl0xyMa1gfzhghNZmeg/3k8vpcAMoRjxyyL697k2YOzppVmx8wFVK?=
 =?us-ascii?Q?MoJWdlOCqi0mbGotU405VC8myY7pZTD9buY2SsfVbVrgESxci7o3/LC7XrAs?=
 =?us-ascii?Q?PCHCQKtiiwA9nCer8yq3ztCNPGyfqTXW8EKY23cWLVRT0uuVFBKDRpX+9FTp?=
 =?us-ascii?Q?uExyzy/bN9NmeZC9XPRIq/niBbwWcQuwQU/r/1I9ZiuTj1tTExTNSEeqTUs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bf2e57-ae30-413d-65eb-08db42c1dc8f
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:41:00.8677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0P221MB1084
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wewszWVbhgkosGxJnPZlqQQAD3+Wfo7yoz9+DmlPRz8=;
 b=go5f31bl2QRwPymsC2IyAQft+sLRdOsbGUrNqLzzLpvCbCptEsFscgWwKZ6MdCYeTMUaxkm+Vcay4x8XApGImzHiNSfS9S8+of/nYvXTetAsd0lFK3FS+ZmjvLDnf7c+1678v0SefDuni6lOjKT7cMLFjjU8iFng6qiZxfV0s6N9hgWfvA2eBHPv49AFecYmwspaifT1Wmi1U5zEQJ921fISDYNqiTkdNgoX3TU5ztvJwzQv2Zj7jLVL9l7zpHE7KDoNsBsYnieIOI80IyTSWweyqkQSzBnfx8xCmQCteheCL/Rln8oBRxE9OEBHvvF8CvCNX8VZNXVyQKimAC0kig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=go5f31bl
Subject: [Buildroot] [PATCH] package/gpsd: support selection of all protocols
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Knight <james.d.knight@live.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using the gpsd package, the menu options provide a way to select
each individual protocol that is desired in the final process. However,
there is no graceful way to say "select all protocols".

This commit tweaks the menu selection to have all protocols selected by
default. For builds that want to opt out of specific protocols, they can
do so by unchecking the individual protocols as desired.

Signed-off-by: James Knight <james.d.knight@live.com>
---
The reason for this change is a combination of two things. First, when
building gpsd out-of-box, typically each protocol is enabled unless the
configuration stage requests to opt out of using certain protocols.
Buildroot's configuration takes the opposite approach by having each
protocol disabled until selected. Second, in most cases (at least in my
own experience), I typically flag each protocol manually to build. It
would be nice when managing the use of gpsd to just use all protocols
by default.

However, this approach will change a board's experience if new protocols
are added into gpsd (where new protocols would be enabled by default).
---
 Config.in.legacy       | 210 +++++++++++++++++++++++++++++++++++++++++
 package/gpsd/Config.in | 101 ++++++++++++++------
 package/gpsd/gpsd.mk   |  52 +++++-----
 3 files changed, 308 insertions(+), 55 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 366b9d69494e96baacac8b83fe1d315f58fb8606..bf40419321c195802177b4ee682c355ba31088ca 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,216 @@ endif
 
 comment "Legacy options removed in 2023.05"
 
+config BR2_PACKAGE_GPSD_AIVDM
+	bool "gpsd Aivdm protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_AIVDM
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_AIVDM.
+
+config BR2_PACKAGE_GPSD_ASHTECH
+	bool "gpsd Ashtech protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH.
+
+config BR2_PACKAGE_GPSD_EARTHMATE
+	bool "gpsd Earthmate protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE.
+
+config BR2_PACKAGE_GPSD_EVERMORE
+	bool "gpsd EverMore protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE.
+
+config BR2_PACKAGE_GPSD_FURY
+	bool "gpsd Fury protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_FURY
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_FURY.
+
+config BR2_PACKAGE_GPSD_FV18
+	bool "gpsd FV-18 protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_FV18
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_FV18.
+
+config BR2_PACKAGE_GPSD_GARMIN
+	bool "gpsd Garmin (kernel) protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_GARMIN
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GARMIN.
+
+config BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT
+	bool "gpsd Garmin (simple text) protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT.
+
+config BR2_PACKAGE_GPSD_GEOSTAR
+	bool "gpsd Geostar protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR.
+
+config BR2_PACKAGE_GPSD_GPSCLOCK
+	bool "gpsd GPSClock protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK.
+
+config BR2_PACKAGE_GPSD_GREIS
+	bool "gpsd Greis protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_GREIS
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GREIS.
+
+config BR2_PACKAGE_GPSD_ISYNC
+	bool "gpsd iSync protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_ISYNC
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ISYNC.
+
+config BR2_PACKAGE_GPSD_ITRAX
+	bool "gpsd iTrax protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_ITRAX
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ITRAX.
+
+config BR2_PACKAGE_GPSD_NAVCOM
+	bool "gpsd Navcom protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM.
+
+config BR2_PACKAGE_GPSD_NMEA2000
+	bool "gpsd NMEA2000 protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_NAVCOM
+	select BR2_PACKAGE_GPSD_AIVDM
+	select BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000.
+
+config BR2_PACKAGE_GPSD_OCEANSERVER
+	bool "gpsd OceanServer protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER.
+
+config BR2_PACKAGE_GPSD_ONCORE
+	bool "gpsd OnCore protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_ONCORE
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ONCORE.
+
+config BR2_PACKAGE_GPSD_RTCM104V2
+	bool "gpsd RTCM104 v2 protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2.
+
+config BR2_PACKAGE_GPSD_RTCM104V3
+	bool "gpsd RTCM104 v3 protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3.
+
+config BR2_PACKAGE_GPSD_SIRF
+	bool "gpsd SiRF protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_SIRF
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_SIRF.
+
+config BR2_PACKAGE_GPSD_SKYTRAQ
+	bool "gpsd Skytraq protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ.
+
+config BR2_PACKAGE_GPSD_SUPERSTAR2
+	bool "gpsd SuperStarII protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2.
+
+config BR2_PACKAGE_GPSD_TRIMBLE_TSIP
+	bool "gpsd Trimble TSIP protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP.
+
+config BR2_PACKAGE_GPSD_TRIPMATE
+	bool "gpsd TripMate protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE.
+
+config BR2_PACKAGE_GPSD_TRUE_NORTH
+	bool "gpsd True North Technologies protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH.
+
+config BR2_PACKAGE_GPSD_UBX
+	bool "gpsd UBX protocol renamed"
+	select BR2_LEGACY
+	select BR2_LEGACY_GPSD_PROTOCOLS
+	select BR2_PACKAGE_GPSD_PROTOCOL_UBX
+	help
+	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_UBX.
+
 config BR2_PACAKGE_OPENFPGALOADER_CMSIS
 	bool "openfpgaloader cmsis option name fixed"
 	select BR2_LEGACY
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 8c28c05efd61e902ff760e034da3e1a6edafd758..60329783542e5712aa98b18cf9fd32c280abe949 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -87,138 +87,181 @@ config BR2_PACKAGE_GPSD_PYTHON
 comment "GPSD python support not available with toolchain w/o wide characters support"
 	depends on !BR2_USE_WCHAR
 
-comment "Protocols"
+menuconfig BR2_PACKAGE_GPSD_PROTOCOLS
+	bool "Protocols"
+	default y
+	help
+	  Select specific protocols to be supported by gpsd.
+
+# legacy protocol selection
+#
+# Flag to help detect a legacy protocol selection. When legacy implementation
+# can be removed, this flag can be removed and each protocol selection below
+# should default to `y` without the use of this flag.
+config BR2_LEGACY_GPSD_PROTOCOLS
+	bool
+	select BR2_PACKAGE_GPSD_PROTOCOLS
+
+if BR2_PACKAGE_GPSD_PROTOCOLS
 
-config BR2_PACKAGE_GPSD_AIVDM
+config BR2_PACKAGE_GPSD_PROTOCOL_AIVDM
 	bool "Aivdm"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Aivdm support
 
-config BR2_PACKAGE_GPSD_ASHTECH
+config BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH
 	bool "Ashtech"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Ashtech support
 
-config BR2_PACKAGE_GPSD_EARTHMATE
+config BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE
 	bool "Earthmate"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  DeLorme EarthMate Zodiac support
 
-config BR2_PACKAGE_GPSD_EVERMORE
+config BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE
 	bool "EverMore"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  EverMore binary support
 
-config BR2_PACKAGE_GPSD_FURY
+config BR2_PACKAGE_GPSD_PROTOCOL_FURY
 	bool "Fury"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Jackson Labs Fury and Firefly support
 
-config BR2_PACKAGE_GPSD_FV18
+config BR2_PACKAGE_GPSD_PROTOCOL_FV18
 	bool "FV-18"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  San Jose Navigation FV-18 support
 
-config BR2_PACKAGE_GPSD_GARMIN
+config BR2_PACKAGE_GPSD_PROTOCOL_GARMIN
 	bool "Garmin (kernel)"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Garmin kernel driver support
 
-config BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT
+config BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT
 	bool "Garmin (simple text)"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Garmin Simple Text support
 
-config BR2_PACKAGE_GPSD_GEOSTAR
+config BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR
 	bool "Geostar"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Geostar Protocol support
 
-config BR2_PACKAGE_GPSD_GPSCLOCK
+config BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK
 	bool "GPSClock"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  GPSClock support
 
-config BR2_PACKAGE_GPSD_GREIS
+config BR2_PACKAGE_GPSD_PROTOCOL_GREIS
 	bool "Greis"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Greis support
 
-config BR2_PACKAGE_GPSD_ISYNC
+config BR2_PACKAGE_GPSD_PROTOCOL_ISYNC
 	bool "iSync"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Spectratime iSync LNRClok/GRCLOK support
 
-config BR2_PACKAGE_GPSD_ITRAX
+config BR2_PACKAGE_GPSD_PROTOCOL_ITRAX
 	bool "iTrax"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  iTrax support
 
-config BR2_PACKAGE_GPSD_NAVCOM
+config BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM
 	bool "Navcom"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Navcom binary support
 
-config BR2_PACKAGE_GPSD_NMEA2000
+config BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000
 	bool "NMEA2000"
-	select BR2_PACKAGE_GPSD_NAVCOM
-	select BR2_PACKAGE_GPSD_AIVDM
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
+	select BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM
+	select BR2_PACKAGE_GPSD_PROTOCOL_AIVDM
 	help
 	  NMEA2000/CAN support
 
-config BR2_PACKAGE_GPSD_OCEANSERVER
+config BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER
 	bool "OceanServer"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  OceanServer Digital Compass support
 
-config BR2_PACKAGE_GPSD_ONCORE
+config BR2_PACKAGE_GPSD_PROTOCOL_ONCORE
 	bool "OnCore"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  OnCore support
 
-config BR2_PACKAGE_GPSD_RTCM104V2
+config BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2
 	bool "RTCM104 v2"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  RTCM104 v2 support
 
-config BR2_PACKAGE_GPSD_RTCM104V3
+config BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3
 	bool "RTCM104 v3"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  RTCM104 v3 support
 
-config BR2_PACKAGE_GPSD_SIRF
+config BR2_PACKAGE_GPSD_PROTOCOL_SIRF
 	bool "SiRF"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  SiRF binary support
 
-config BR2_PACKAGE_GPSD_SKYTRAQ
+config BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ
 	bool "Skytraq"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Skytraq support
 
-config BR2_PACKAGE_GPSD_SUPERSTAR2
+config BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2
 	bool "SuperStarII"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Novatel SuperStarII binary support
 
-config BR2_PACKAGE_GPSD_TRIMBLE_TSIP
+config BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP
 	bool "Trimble TSIP"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Trimble TSIP support
 
-config BR2_PACKAGE_GPSD_TRIPMATE
+config BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE
 	bool "TripMate"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  Delorme TripMate support
 
-config BR2_PACKAGE_GPSD_TRUE_NORTH
+config BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH
 	bool "True North Technologies"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  True North Technologies support
 
-config BR2_PACKAGE_GPSD_UBX
+config BR2_PACKAGE_GPSD_PROTOCOL_UBX
 	bool "UBX"
+	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
 	help
 	  uBlox UBX binary support
 
 endif
+
+endif
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index d7425513fd180188e59492042ea0517df38dea1e..35e5caee4404666b02f997cd46751d7c4840ffbd 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -76,82 +76,82 @@ GPSD_DEPENDENCIES += dbus-glib
 endif
 
 # Protocol support
-ifneq ($(BR2_PACKAGE_GPSD_ASHTECH),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH),y)
 GPSD_SCONS_OPTS += ashtech=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_AIVDM),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_AIVDM),y)
 GPSD_SCONS_OPTS += aivdm=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_EARTHMATE),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE),y)
 GPSD_SCONS_OPTS += earthmate=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_EVERMORE),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE),y)
 GPSD_SCONS_OPTS += evermore=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_FURY),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_FURY),y)
 GPSD_SCONS_OPTS += fury=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_FV18),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_FV18),y)
 GPSD_SCONS_OPTS += fv18=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_GARMIN),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GARMIN),y)
 GPSD_SCONS_OPTS += garmin=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT),y)
 GPSD_SCONS_OPTS += garmintxt=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_GEOSTAR),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR),y)
 GPSD_SCONS_OPTS += geostar=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK),y)
 GPSD_SCONS_OPTS += gpsclock=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_GREIS),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GREIS),y)
 GPSD_SCONS_OPTS += greis=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_ISYNC),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ISYNC),y)
 GPSD_SCONS_OPTS += isync=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_ITRAX),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ITRAX),y)
 GPSD_SCONS_OPTS += itrax=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_NAVCOM),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM),y)
 GPSD_SCONS_OPTS += navcom=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_NMEA2000),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000),y)
 GPSD_SCONS_OPTS += nmea2000=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_OCEANSERVER),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER),y)
 GPSD_SCONS_OPTS += oceanserver=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_ONCORE),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ONCORE),y)
 GPSD_SCONS_OPTS += oncore=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_RTCM104V2),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2),y)
 GPSD_SCONS_OPTS += rtcm104v2=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_RTCM104V3),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3),y)
 GPSD_SCONS_OPTS += rtcm104v3=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_SIRF),y)
 GPSD_SCONS_OPTS += sirf=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_SKYTRAQ),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ),y)
 GPSD_SCONS_OPTS += skytraq=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_SUPERSTAR2),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2),y)
 GPSD_SCONS_OPTS += superstar2=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_TRIMBLE_TSIP),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP),y)
 GPSD_SCONS_OPTS += tsip=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_TRIPMATE),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE),y)
 GPSD_SCONS_OPTS += tripmate=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH),y)
 GPSD_SCONS_OPTS += tnt=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
+ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_UBX),y)
 GPSD_SCONS_OPTS += ublox=no
 endif
 
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
