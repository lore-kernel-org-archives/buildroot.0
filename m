Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B9EC04FE0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 18:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A0A404FE;
	Tue, 15 Aug 2023 18:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A0A404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ulk0rr8-746d; Tue, 15 Aug 2023 18:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3666D405B2;
	Tue, 15 Aug 2023 18:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3666D405B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA5A1BF422
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 18:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D854F408A4
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 18:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D854F408A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8t18awRKADI for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 18:29:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57CEF4086E
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 18:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57CEF4086E
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 169DDA4C1105
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 20:29:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34430)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qVyn6-0002St-2G
 for buildroot@buildroot.org; Tue, 15 Aug 2023 20:29:16 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 20:29:16 +0200
Message-Id: <20230815182916.36363-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692124157;
 bh=HUd5tnitSiB2Z0k8xEwa4A95fEnXhXm/9FuyNJSADB0=;
 h=From:To:Subject:Date:From;
 b=Tg9xlT9wvIfB7V50iOQMuq5ZbbwaeyiO64Nw1HpWjbtUtbF0fEGWNcPCE38J+6cBf
 Q77m01nbJ5O8gPhpz/0CqEQB69j7rEN+u5dHHUF4GIiONW7j73HOWlRyBvhohkER4t
 5olRU523/CMU44Tm7ClNGrRFifopZuoOzxe0sdV1aXqrigVnr0BGCnx90nGhR2Y/eZ
 99TltOBhTkzMUaZJBEmWPKVevmtzIBc15VjM1GWPrhW0Bdu7DuN3NmVV0aSoqE6rPl
 9kyRGGoZM1dfSXptJFy2bkrhIeHZEJJFt5mnCGoItVGRywThxNfIRkM+JefAZNWLrI
 fWnHNpm7sAezA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Tg9xlT9w
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
index 32940bc346..42b432eb90 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 40ace29532..e0cff76f95 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b8b8a29852b999f337c4e93eff6c91fb7fd2d49a6614cbcbeb6fa171ba55cc9f  linux-6.4.9.tar.xz
-sha256  2e51d41fe11d082ae167cee05772bb07ca7f19448d2b46772d8ca2db7673a1a5  linux-6.1.44.tar.xz
+sha256  980b3fb2a97788fd885cbd85ba4520980f76c7ae1d62bfc2e7477ee04df5f239  linux-6.4.10.tar.xz
+sha256  bd2343396e7ddad8974f3689a5a067ec931f4ade793e72b1070a85cd19f1f192  linux-6.1.45.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  150f3846b76cd23a6135f49cef71372bade5a06e851cb4f8558df8b862d8fec7  linux-5.15.125.tar.xz
-sha256  4c03516ae1d417571faaef175932d0892710bcbe0173e40550014d043d9098c9  linux-5.10.189.tar.xz
-sha256  3a78587523940374a7319089b63357c7dc412b90f5879d512265e59173588267  linux-5.4.252.tar.xz
+sha256  adf4aab9840f89ee151b837defbe16e9f388e8eef20df7ee94bf63be33b3ed6f  linux-5.15.126.tar.xz
+sha256  29723df01d40ff07ff6d254eaaf90c7b3ec3c70f4ebe089b80f785f46efaf597  linux-5.10.190.tar.xz
+sha256  1fb2ba5f09aa98fa2a5965372cac438564dcc5270e4abc526dfc19bea6ad26e7  linux-5.4.253.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9fa5e24b7d791583f8cd001bcf02b52f569f261e276dc1dab2552974dca20ecf  linux-4.19.290.tar.xz
-sha256  d0e32bd47a547cc20e0ce09ff45514282742edb2af38df5dc0a03f22d4321715  linux-4.14.321.tar.xz
+sha256  e6735b90d3d8cb20ac649d8a974eb19cd2a9db686a638d964c27f0992bc2b533  linux-4.19.291.tar.xz
+sha256  556b54b10b08370d97a562e19c08dc15372236f436a4dda3057159066e79e1e4  linux-4.14.322.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c7d725aa13..15f74992d1 100644
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
+	default "4.14.322"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.291"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.253"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.190"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.126"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.45"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.10"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
