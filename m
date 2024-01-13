Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA590C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 16:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8375F40462;
	Sat, 13 Jan 2024 16:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8375F40462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V0TsxF1ws2sT; Sat, 13 Jan 2024 16:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F9D5408BD;
	Sat, 13 Jan 2024 16:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F9D5408BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC041BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 16:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42DF860BB3
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 16:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42DF860BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jg582TM3Y_1V for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 16:27:29 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6584E60A81
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 16:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6584E60A81
Received: from fli4l.lan.fli4l (p5b3a0534.dip0.t-ipconnect.de [91.58.5.52])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C4DAA4C0284;
 Sat, 13 Jan 2024 17:26:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58562)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rOgqO-000000000VS-0VdQ;
 Sat, 13 Jan 2024 17:26:48 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 17:26:47 +0100
Message-Id: <20240113162647.3316051-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240113162647.3316051-1-bernd@kuhls.net>
References: <20240113162647.3316051-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705163210;
 bh=UXq0A+t29OC6dz94adMwJUdgxuspofpbeuHinArUuHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qL+dgEKAwduV86nNR/+6pkpGKE00rg/ttpOdfuq0J260K4vYtuac3r9edmnXkUK0X
 DFap8Pkx4q2aT+Xp/RtSEMt4hpkOOCux6UqQqd97jmyBQK0OZusCgH7PyNdpqrZ3eX
 HPpF45jGOYTdVpk1ZDB7nIJ56KEGMT4/BGIV34fu7BMu5RBH4IhgmsgRJ20zvfVnOe
 N+rmWnCAMg711g1tXrA6BRkfKiL+AOtRMTOjNNvYUr1N50aTM+Hy35EWnRXAeYvJ9u
 4lf1n50bEAoqx/sFQEOLuvPF8BOFuwBFVoIi2JKekT1l8aTg+0rR9BN+uYLYjOBuJS
 pPk5hoWEwD4dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=qL+dgEKA
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop 4.14.x option
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 4.14.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 6 ------
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 46ae84997e..82387338d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_KERNEL_HEADERS_4_14
+	bool "kernel headers version 4.14.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.14.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 	bool "libcamera pipeline 'raspberrypi' was renamed to 'rpi/vc4'"
 	depends on BR2_arm || BR2_aarch64
diff --git a/linux/linux.hash b/linux/linux.hash
index daf1368f7e..e15c298953 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,7 +8,6 @@ sha256  86ace9892296bf1534d574894edd27614b68de4085c03fd3f60121751a334f1b  linux-
 sha256  da072f7e6fe719c01e517cac1fa9988b2f5fa87d62a8501b7dc16d3b62b2acb6  linux-5.4.266.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  cdc6a5d51aaff7c50bfe4ac4adf5cc3727043a24641145dc268e858db2a4b598  linux-4.19.304.tar.xz
-sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5b9366aed5..81631caeec 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -24,11 +24,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_4_14
-	bool "Linux 4.14.x kernel headers"
-	depends on !BR2_riscv
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
-
 config BR2_KERNEL_HEADERS_4_19
 	bool "Linux 4.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -416,7 +411,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.336"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.304"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.266"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.207"	if BR2_KERNEL_HEADERS_5_10
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
