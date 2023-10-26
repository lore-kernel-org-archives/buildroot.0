Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA1C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 17:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C673F4012D;
	Thu, 26 Oct 2023 17:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C673F4012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJyOYVjIKUcr; Thu, 26 Oct 2023 17:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9419416CB;
	Thu, 26 Oct 2023 17:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9419416CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4471BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 17:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D74A084043
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 17:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D74A084043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bA1AXOK2413Q for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 17:38:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB9F683F8A
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 17:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB9F683F8A
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E7FBA4C09B9
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 19:38:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48390)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw4JY-0007CS-2G
 for buildroot@buildroot.org; Thu, 26 Oct 2023 19:38:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 19:38:36 +0200
Message-Id: <20231026173836.4149430-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698341917;
 bh=k2UNXb6Uk2FpxV/QON4+pcO/JXiUjRde4gKhuafyUGk=;
 h=From:To:Subject:Date:From;
 b=UMIVdcyZKpBBzg6U9cYYklDVpDVO5tnxqLpWAdCI5lH5AhpbQD6KqRKYolsyKT2XS
 xtEMLWQktxuJtZTuSskT1b2AINsXxdZTpq18tJrpLgJJGT/fu3SJRkmMwsTObfYhEM
 WJHPL8m4bgdDXaVdZ7uJaephIhdQhRQCBl3dqMmDyzFpTVpkmU5q+xAnOMJ9fI8nwD
 cIf8yVRMft8e+qytlE3IoudQrTw0hkADyYGlq5UbRq3ysbG+DTOsZa+MQRF9DSuBt3
 9TSzilifSjiVuBCwfYExfLcnhlNKBcZtwpFR5L/cQwakF+hsAQtNqNkddX3iApVByA
 VGTd3Cs69ZP9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UMIVdcyZ
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 5}.x series
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
index 21313ded51..195b0dc00e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.5.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 720598252b..78d1395e66 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  299cca897d90deaa176eebec42f0a80eeb7516afed330a45c14da9de086cf717  linux-6.5.8.tar.xz
-sha256  627f7724c675036639290fb5c39e3fdeb3d566b80b192c45f4a808ab54c8c0a0  linux-6.1.59.tar.xz
+sha256  c6662f64713f56bf30e009c32eac15536fad5fd1c02e8a3daf62a0dc2f058fd5  linux-6.5.9.tar.xz
+sha256  58520e7ae5a6af254ddf7ddbfc42e4373b0d36c67d467f6e35a3bd1672f5fb0a  linux-6.1.60.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c624b9fe7ee4708d34cfd0b7ebc58037afac7463338cc498641ea31c55eeacb8  linux-5.15.136.tar.xz
-sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
-sha256  39701815a7a1b5ea4253db18e9327a45926a944499628d032da63c1bb6ea623e  linux-5.4.258.tar.xz
+sha256  9749b21609f9e7ad9c46160c2c107db823b99cef77fa6cb080b6c2dc685fb2f7  linux-5.15.137.tar.xz
+sha256  a0ea77a1f5eeb1387d62e7a8df585ffc53758e4da153d98224ccd833bd2624c1  linux-5.10.199.tar.xz
+sha256  ffe6e4fa1266d5480e529fc8659f572c57030040c548face30f56fd5a223bba4  linux-5.4.259.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  636166769dc232d18f399f40c22107c289aab8702e752301588e64ab582860ae  linux-4.19.296.tar.xz
-sha256  bff085d8832dd5c3d717beeebdff78a0b678f0a2307f83acf22764dabdcb0a5a  linux-4.14.327.tar.xz
+sha256  9d89e0bc6503c0d61178fd1605f6ed04b016873b9f370372866644b11fee3d31  linux-4.19.297.tar.xz
+sha256  1db5926e02dc29b30d77f731228d3bd31402e2feba3aa59bfb2c730eedbeecc5  linux-4.14.328.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d48cfa3787..bb624147ec 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -404,13 +404,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.327"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.296"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.136"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.59"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.8"		if BR2_KERNEL_HEADERS_6_5
+	default "4.14.328"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.297"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.259"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.199"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.60"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.9"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
