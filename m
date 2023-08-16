Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843D9C25B7D
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1511E61336;
	Wed, 16 Aug 2023 20:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1511E61336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTcpplR_Xbxf; Wed, 16 Aug 2023 20:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C7260F6E;
	Wed, 16 Aug 2023 20:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50C7260F6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F22E31BF381
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBC3F60F6E
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC3F60F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLiSVK_9r7vl for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 20:14:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95A160A82
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 20:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95A160A82
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A088EA4C09F0
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 22:14:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33088)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWMuV-00055c-1E
 for buildroot@buildroot.org; Wed, 16 Aug 2023 22:14:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Aug 2023 22:14:31 +0200
Message-Id: <20230816201431.1401207-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692216871;
 bh=UbkHuT9Qp9gmcu+NyAu0Y2T8eaZv6v0ULDItSGeQEyY=;
 h=From:To:Subject:Date:From;
 b=c8gvAZfh2aXN3syvPHUd3VJtxDUDTP/39UFCe5C1yrIj+J6Asbv/UrfogOjMY8Jxt
 OG7RVp9j2sPU0DFy0FCiec2ATcHxz5loROC8Oez6QD/KCQh4NkUPAw6xyJDF4KCQVp
 qW+58rEMgEsD0StvwKrGlnl8Nq64ua2ehbx13mJqMIf9n9okBZELvI9FDfKpj4rMu1
 GGOoIE7WTWWhcLDUkEfedqdc1zc58z/jL4ctm7SqW7PTnTXlAKOb9aVlltWtd/Hz1t
 Vg0hv2WiIBV6JKiKwEDwk9KgRt1hYyubvVdK3Y9BBu8vHnozqwXNBmVJ+upSOj8MVw
 Qo15SBboiaNyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=c8gvAZfh
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 32940bc346..d3448ba744 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 40ace29532..0177988c45 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b8b8a29852b999f337c4e93eff6c91fb7fd2d49a6614cbcbeb6fa171ba55cc9f  linux-6.4.9.tar.xz
-sha256  2e51d41fe11d082ae167cee05772bb07ca7f19448d2b46772d8ca2db7673a1a5  linux-6.1.44.tar.xz
+sha256  546b68b5097d3c0d74722de62aae217729d98e45fbb6bd458b490ac21ea40918  linux-6.4.11.tar.xz
+sha256  f5f67bcfccd47f8d9db2d5ba24e33af7778f40a777577d1fba424f4a1712a296  linux-6.1.46.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  150f3846b76cd23a6135f49cef71372bade5a06e851cb4f8558df8b862d8fec7  linux-5.15.125.tar.xz
-sha256  4c03516ae1d417571faaef175932d0892710bcbe0173e40550014d043d9098c9  linux-5.10.189.tar.xz
-sha256  3a78587523940374a7319089b63357c7dc412b90f5879d512265e59173588267  linux-5.4.252.tar.xz
+sha256  add0a575341b263a06e93599fc220a5dd34cb4ca5b9d05097a5db2a061928f26  linux-5.15.127.tar.xz
+sha256  cb54660ed4917cc4f9a9ab93d117defefd8bcbe745ec6082d909bbfd5ae962c2  linux-5.10.191.tar.xz
+sha256  51608da961b5e34d6a9452a7b302699e109633f769a4253c74b1048abba8d9c7  linux-5.4.254.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9fa5e24b7d791583f8cd001bcf02b52f569f261e276dc1dab2552974dca20ecf  linux-4.19.290.tar.xz
-sha256  d0e32bd47a547cc20e0ce09ff45514282742edb2af38df5dc0a03f22d4321715  linux-4.14.321.tar.xz
+sha256  349728d3d143fcee484b34e34e536fe48dfb8bb71263f81a66fd572cc9162137  linux-4.19.292.tar.xz
+sha256  6f0a9010b2451e7ab5b28e38c81b3c5149277ab5fe0e08059e60eb602b804ebc  linux-4.14.323.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c7d725aa13..8a25067003 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,13 +400,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.321"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.290"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.252"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.189"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.125"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.44"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.9"		if BR2_KERNEL_HEADERS_6_4
+	default "4.14.323"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.292"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.191"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.127"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.46"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.11"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
