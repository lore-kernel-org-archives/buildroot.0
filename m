Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92C3C77B71
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 14:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493166FF6E;
	Fri, 21 Apr 2023 14:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493166FF6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36HF0tLJgJJ6; Fri, 21 Apr 2023 14:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 683EA6FF76;
	Fri, 21 Apr 2023 14:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 683EA6FF76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEBFC1C279D
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 14:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0D09428E7
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 14:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D09428E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKrWOvPpoEZo for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 14:12:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84E61428E8
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02olkn20827.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::827])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84E61428E8
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 14:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxY21NhOkSl4To1UGzXA20weGSTtLlF/FhCcOBytTkslrjgV8STag7a4vDAagSkQsIaFymQie9O1/WkYI1mP1eMpiWyikrQY5sraoVpp3T3d7h0RQg/O5fbBB2AFEt2f2/ybXrX9GNrR+pZuSKuKpPei4+tPhIh4igPh0onPrB1/wIDSIz3yuQC+qII6EVEWSCF1CSYTaWqKuOUiZ3FF/QX4+3gmBxAK7nXK5UGZszS4F9HV/4A0T4KV3dfGJ0FGWYkV6dq6vj1uIxHtnKK6TYfXwRwAw85eWF/2bL6b/dmSvyW1g2vLl0wwvNfng5ARXJHVXku3LnC7aswOWFHQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v0Z0VRfg7pHs9JbMRgADPmxdh/I++A48Wjy+BNIKGc=;
 b=TQgBILLmLdhebu+L+clDI4R4nkqGr7Ky4CqcHJ2GBByL+70xJVjevRna++TOO8DFCZAwOzIy8uooTlgUQLjRuuToMgQKP8gAv2hAy0CcxhA9OrgF9zyxbDHTygVkxocx1q3Imbk8bUwtsrOWDtckYkRculkOd4UWaUct8Dml2ePePKP9FSKQVcz/py2IHx1wYA0Vg+2pfpS6lWhaDyKyHrXkO1ltO2TRoTViIRQq19ewDtkxw3tNRUrTX53bVBkRU7jFPXleGfP8kfM5wkoNG7Zx+m1QkaVyfACwSjw6c2mHO42Poer1H3K7pCkCACV3To3QrBcDFtBzrtqX/YyTYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ2P221MB1114.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:544::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 14:12:45 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 14:12:45 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 10:12:08 -0400
Message-ID: <SN4P221MB06826BE9E12B14BEBB4F4826A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230421141209.2826-1-james.d.knight@live.com>
References: <20230421141209.2826-1-james.d.knight@live.com>
X-TMN: [531k3ndiJJvUl/wD7burQDgBCzjovIQ8]
X-ClientProxiedBy: YQBPR0101CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::11) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230421141209.2826-3-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ2P221MB1114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3567083c-f5fd-426d-a089-08db42727a3c
X-MS-Exchange-SLBlob-MailProps: a+H6FLLcF3rWTlhCsx8GEXtgjWNkNESf/TGgS6KGgtvbQKIYSzyMrLL3OKca2Zsk05/v/Fo0phc9Ke/qDOR1Xnffg7k8HbU2Utd0B89Qcj2Fscq3rjGioYrbDft0fRRWL4xTT9RxOY6sinO9MA3HuM6IBRbdHdhO4EMhMxkoc3Ce3XnhkNRiFZA8MBeV32mVybeBtVLjRVbBnLec7hLMzrCpdKc6ogF6cHWUaQrXU1Mi4ciA+c5067Polf5HdazRsYHuIDm5VijFRLPu8lcZ1JN89yrCxvRnH0oiuhV6hSBwPvdmB4kyghu0DXBOMfCZ5rpt00Zy/ptD75ObKhNwZhupR987i06trCEeGWrsamr+q+sI4xyAqURnz2SphZK7RKHGhIghmT6e7CoNtZZ5GRQfatmLpkoRHipONEO8Fzr8T7lR+uDuyNi4g1selvES0Zh7bJJZkgf0LxmbVTPC8YO3fb3AFy+1ky5GpZ8KipOu4TdE0H6ypCjJXaKP6QHxsoBUYa3q5Dv/zt4YKvwA8txp8R0sIo+CduRzphtzC9ozoLEPGI0KgS+NC5W21dfiQoRUdQpEnAmEahEJk9hrc6nCzicquloS34xOk2uclxwjcvJLiXTyXoLJLvmnZX3icDjUiFtVBZqvI9AXE2c8GgRRqtsWSOnXluRonsY4xHf6sMUZFPg1GB6HDV/fZYxsec98/k2jXg9beSrc6HEt8d9I2kJBP59vEMkh6PBAEoa3xiHkTHNBrPUIZM3DXmdpqoH+6BGJCRoiHGuYSslnlDjBk/HROCzTo9DpqD1qzUoLYXv63fBkTQ99JkY+ni4C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uQ8VuSpRCTCFRz9XMHxSYVcwwQJGrJ0sk4CfmncCwehh/9M7wHXOGbMcLhcgvytEK81koxj07Lt3LLwSlgw+cJaB/YIKgwsbGCyJWwO9Ac342kkiqJOlop4Q6XBKgcfp/hCsXxwO7DkoyVB0eW8dI2XHCOu9USgBxjkTXHp2F0K3dT7ieUGIeuJoAq3PaUfidfUQPhsKMITYlRNYXe3iP4P5EUhnp/y/pftZHtOnZaSjOk2ny4d/jwIaWO+Pr1Qzgv6HWOOXNhIOJovcFN2Ix/HXfJGowdhQ6WJRCnn7XgMsjGALPlRFGrM/ASLXXp8N+zfDBKr9WiYPiWF+6yZ7W9w5ql/eSk8qWzidlA20ZoG211CHrChDgJdBDiu6bEBUiZGuqaGf52v+Me48DqWv4tgR1Fgn8RQo2rTh67q36hjmD/ZQiCEUuDFOcrzjiM92NJqTqToB3JLnVkZQE53fItYGDzQFfeZlkZq7TKBwcPIbKQIJaLhTK60AOKkf3XwtccjWa1hwFQBbYMxyDkuESU4ZNj5kpjMWgN2L/g8lHRnrHQ2DtLcbPZ/GbxRHLNDErBX24q+80RG3Nmd93/wQnSPKsYAIm6ACYDbPH8f3lcY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jVvcad4iESrDKjN3aYajPs24gvy3mTeEKQCrftZsR30KyhRTIVdHXALov0lx?=
 =?us-ascii?Q?xPhCp2z/57Sf8oWu3hRU2aq9CkfI9IvmkQxa/gh6oQcKoeuLxU7NgaAeSywZ?=
 =?us-ascii?Q?CF2gA3tctpYVsROYgJCtRD9nFhR7Q+CNzAv8Dn989qhk7OxhtY4/q8SEpCnr?=
 =?us-ascii?Q?R/PLkESz5ePJjRIePTBzSiIxAdT0oxyFM1TDULnPjaW4dfsrjAtoWlAwGhW4?=
 =?us-ascii?Q?r6gp4orsRIUHWwO7MllUrNiskNgo3P2xrc/8dZIQuRdVGckLFUbzscx3II2n?=
 =?us-ascii?Q?nr9O5hcnF0XBo1v/vioxUjzCAluaEW95X97hQ453+xjlM4tAdpFrkx1wRALM?=
 =?us-ascii?Q?HmfWAdDP4vu2Q9LJdVIWfnOmCyHVdqP95Lu80Tg7xGb2g7E2JYGUpAWKjdzN?=
 =?us-ascii?Q?15OB0fvdZqbqxCQEwI/EFKHGpDDMuknG2ePzAUZXkgfKXlzrn4UNfSwVddG+?=
 =?us-ascii?Q?f234M0rNqUSdzJLkUMBrJoXN4zSlohabJ40y99uWfvwGRRJNewX55RaUJqYH?=
 =?us-ascii?Q?PvWR55elALExH46NCbPcbwAgBoM8gbZdH6szGcRQjHwpuz+BUpp8r4oUKhPp?=
 =?us-ascii?Q?vMLW+Kw9ZG12X9rHssLBumCzE39Ed9AZGr7FBHsgwLydVvxDSY4Nua/yzV6M?=
 =?us-ascii?Q?PIi0RooIiNY/EoSgCyRJPrN0YuiJfdSIXwfjSfHjLAj2bO7MRNqTYV8TRJbf?=
 =?us-ascii?Q?VXDbad0o4VhB2CSEkhoS+3jSlSmObVeigbnQzyyT6gxxwMFHVhNM+O8WkGhY?=
 =?us-ascii?Q?Brq0Qs8YnMc3nxZZCN6PMZ+zF1hZVMwZEFo9bRFjZlkoT86XXTmqbqmd9cNi?=
 =?us-ascii?Q?2vQE/MV/yXPD2cM3Cfs/J/JgUojz1xz4zhgHENWGC1FTXijJ5yEkKX/FW3eS?=
 =?us-ascii?Q?7IQ7RDcuN7XuhCpvl4FP3YeuyxSxBUfxpPxRF6GoQWXIg7VCR1qYlCZpYf/3?=
 =?us-ascii?Q?H7gm8KxKEhuZPJfx/OVU+xSVhGKOJZzpHcapnnRa/2tpourWI7XCepvPo9Ja?=
 =?us-ascii?Q?2RhQXDXlUpFY4P6SYfno5cG8ESmaaxAXDQchRic+TrwMOfns0xXaToeb+8iD?=
 =?us-ascii?Q?tLlWBdEdoUJw20uR5iy2Yv0rtQVFXTKYjB3s5LwqWfu4rDRuguWxMY+5AZzE?=
 =?us-ascii?Q?VHRhrr2Fd6g3RqfehvfZJYwYuGjIyXoBHfp0l4p+uzUSfv1ZjSljclWcJ7qM?=
 =?us-ascii?Q?LcT41wDiP7wnIz3jnBXheCDCNluq2Nqi3K5qleWl9ZriyRMJfBPYIPgHztk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3567083c-f5fd-426d-a089-08db42727a3c
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 14:12:45.1726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2P221MB1114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v0Z0VRfg7pHs9JbMRgADPmxdh/I++A48Wjy+BNIKGc=;
 b=DWINv3Jc+k5vzlCQrDv4c5l0kD88O97AYffGbqR9vDZAkqbazLHV21FpMC0lz1x85qw0erjTAMva19xmva7QSW7qB0jjSXUK+Ear9cF/gMp+x7tVH1tmwTBwq5FR1III0t8J4+CAYF5LQVxwKu71nvJqB+wZaFMv7KmhoJsUx9gMlGXOrSYzVctAWc8Cz0r1mAb2dB5yZpP3lp/+cpVtu3At0HSEH3hBV9Sn3yy+evJ7VFb2096WRk5OPYCdqdJhib3s1iXajKBR4H51b9+tnDV9nFQV7xq0VEU3KeePvjVRQOjEvSRNG2QylRPkrqnZeCEsYWBa4X5++qLV3uV7Gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=DWINv3Jc
Subject: [Buildroot] [PATCH 3/4] package/glib-networking: bump version to
 2.76.0
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

- Drop "0001-meson-change-std-to-gnu99.patch" since change is available
   in this version.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 .../0001-meson-change-std-to-gnu99.patch      | 30 -------------------
 package/glib-networking/glib-networking.hash  |  4 +--
 package/glib-networking/glib-networking.mk    |  4 +--
 3 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 package/glib-networking/0001-meson-change-std-to-gnu99.patch

diff --git a/package/glib-networking/0001-meson-change-std-to-gnu99.patch b/package/glib-networking/0001-meson-change-std-to-gnu99.patch
deleted file mode 100644
index 9f266bc2c8d2bda6a08a23c5b198589965fc8633..0000000000000000000000000000000000000000
--- a/package/glib-networking/0001-meson-change-std-to-gnu99.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cdfa726bae1d82b7bd3735475fc2b2c6a31c1d2f Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Fri, 12 Nov 2021 11:51:33 +0100
-Subject: [PATCH] meson: change std to gnu99
-
-This is the same as glib and should fix issues with old
-compilers
-
-(cherry picked from commit b192086b9936602a40a14d00a6883b339b9d7955)
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b018ca7b..130a2bf0 100644
---- a/meson.build
-+++ b/meson.build
-@@ -3,7 +3,7 @@ project(
-   version: '2.70.0',
-   license: 'LGPL2.1+',
-   meson_version: '>= 0.50.0',
--  default_options: ['c_std=c99']
-+  default_options: ['c_std=gnu99']
- )
- 
- prefix = get_option('prefix')
--- 
-2.17.1
-
diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 766efd0ced4e786798364a1e14d2a75e86e481ad..72e70ff0edadafb53931a33b6c95e1ce23756d4c 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From https://download.gnome.org/sources/glib-networking/2.70/glib-networking-2.70.1.sha256sum
-sha256  2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc  glib-networking-2.70.1.tar.xz
+# From https://download.gnome.org/sources/glib-networking/2.76/glib-networking-2.76.0.sha256sum
+sha256  149a05a179e629a538be25662aa324b499d7c4549c5151db5373e780a1bf1b9a  glib-networking-2.76.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b6d29110ed53fa8976d154f04a2b705f8e7697bb..24811716582c54df6f00192b67caab4dd947964e 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.70
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
+GLIB_NETWORKING_VERSION_MAJOR = 2.76
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = https://download.gnome.org/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
