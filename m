Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20A5C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89DA9417E9;
	Wed, 30 Aug 2023 20:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89DA9417E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9N_n-ixNTeD; Wed, 30 Aug 2023 20:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2F80417F6;
	Wed, 30 Aug 2023 20:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F80417F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE0C61BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9051A417F2
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9051A417F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOdfUqhOfOPO for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:42:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B8F5417E9
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8F5417E9
Received: from fli4l.lan.fli4l (p5b3a0af8.dip0.t-ipconnect.de [91.58.10.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFD56A4C02EA
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:42:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59578)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qbS0z-0005p9-38
 for buildroot@buildroot.org; Wed, 30 Aug 2023 22:42:14 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:42:13 +0200
Message-Id: <20230830204213.1158602-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693428134;
 bh=cOKyImJ70EUQg8jAzZR9XwMyRvFwvROR7y2zMSDTib4=;
 h=From:To:Subject:Date:From;
 b=ZcGbqTDeCcJiiff0VjBQY99fO/QWHN3LQWG4syreb9Xm8MiWbBMBEYqst7aCeYoDW
 05zJO51k+WCFGUTzF6WZvTycVRKV87vuTp7KCr/8c9EfaTiGFukN/2VzvHCHbg7XE1
 Huexx60MX4LOpXKqc6mWZ6T6pSaRg3QXo+zV5zCNEWLk0HlwapG7/evq1SmQpzZKsw
 3Onta4Qxw5IyQnBlGmIbZkHepZcRzW7zsQzNwgvqUaec6CoKn2J3/gENxNQC5NrW4T
 T+vNUL3N7fb1i77Baj4dl5Snvb9p4x99+cwWj88GBoyRC7UBLwHgUw7h6faWUTjB6u
 /88PNRg8fj7vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ZcGbqTDe
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
index dcfc31ac8b..de08f755f6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fb2bfebd61..066edd9a7d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  cca91be956fe081f8f6da72034cded96fe35a50be4bfb7e103e354aa2159a674  linux-6.4.12.tar.xz
-sha256  c9ea14231ca4ca6e3882a9339a8c3c414e4c91519d3e50af6822f47e99057a0f  linux-6.1.49.tar.xz
+sha256  5e5511b50bc9fd358bb5d7746fab3c5ea396d42c6bd7a54b2555ede0de5ac8e5  linux-6.4.13.tar.xz
+sha256  b27ac1443eea563bc546ee1f67d9802bc8d6c0f6f18707407fba01f9f78c488c  linux-6.1.50.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0f2eca845183fd76f53b0c867c97f12b9ace2d7e8ee2cdeec7eb2897651b80de  linux-5.15.128.tar.xz
-sha256  c40d11ee56e50a132429badbd1ba1c53e42b3312590b2a39be34c241d1b0b5b9  linux-5.10.192.tar.xz
-sha256  51608da961b5e34d6a9452a7b302699e109633f769a4253c74b1048abba8d9c7  linux-5.4.254.tar.xz
+sha256  750ec97ce4f1473e392b367a55eca4ea7a6b1e9e65ca2fb3bbca2eaa64802b66  linux-5.15.129.tar.xz
+sha256  bd4036da47612d0d8c5f8c43e7700e8c996ae3b51084aa8fc6530c9d00f1ded0  linux-5.10.193.tar.xz
+sha256  34d5ed902f47d90f27b9d5d6b8db0d3fa660834111f9452e166d920968a4a061  linux-5.4.255.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  349728d3d143fcee484b34e34e536fe48dfb8bb71263f81a66fd572cc9162137  linux-4.19.292.tar.xz
-sha256  6f0a9010b2451e7ab5b28e38c81b3c5149277ab5fe0e08059e60eb602b804ebc  linux-4.14.323.tar.xz
+sha256  cd95a8cb8fefb749e32359b8a915c036abc37e80746285da6535cb5a0776b3f0  linux-4.19.293.tar.xz
+sha256  24e8b21647a0f270291ea56d9123d59c511fa10efc23f5d28b5cb51611e1d9f0  linux-4.14.324.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index deb3067b60..0c0b365473 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,13 +400,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.323"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.292"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.192"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.128"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.49"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.12"	if BR2_KERNEL_HEADERS_6_4
+	default "4.14.324"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.293"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.255"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.193"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.129"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.50"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.13"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
