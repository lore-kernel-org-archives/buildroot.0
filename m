Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F66C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 09:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34B31400A6;
	Mon, 10 Jan 2022 09:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tq_UG26fF5RS; Mon, 10 Jan 2022 09:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2251B400C8;
	Mon, 10 Jan 2022 09:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0E01BF3D0
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA20400C8
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B05R5RPK9dp9 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 09:50:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18471400A6
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:50:50 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9062722246;
 Mon, 10 Jan 2022 10:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1641808247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DxtAl2T67AdhShrZg6ENjjJ8omNkEhYIvgASrakZTUg=;
 b=seIOKGK2tBQOEfTuLYAQrD1rfM5D3eD6qX02eVXQWjDwh1RVaHQtEvNX/DX4K1s7hXhPq1
 ahMjZu4YB+OZHWFkruK2yqazOKFT6ETcyxXZFk+1y6Td+egxFqMr3RrbaIVTOe2nIB5SCk
 v0SRi/HIsGXAJcMorazv2U8YPvWOZLc=
From: Michael Walle <michael@walle.cc>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 10:50:39 +0100
Message-Id: <20220110095040.2212639-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.16
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Walle <michael@walle.cc>
---
 linux/Config.in                                     |  4 ++--
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6c30100921..d2dc33209a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,7 +28,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.15)"
+	bool "Latest version (5.16)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.83-cip1)"
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.83-cip1-rt1" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 2f144427f4..86dc8d7af9 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb  linux-5.16.tar.xz
 sha256  b3e9ba06a299a3e2ead4a15753bc46a3e0c90d3b92ffeed1034ccc9f13a717f0  linux-5.15.6.tar.xz
 sha256  f41a259cb2002dd2e3286524b2bb4e803f4f982992d092706ecea613584023b3  linux-5.14.21.tar.xz
 sha256  ef259a43f33ddb56001283f4f4e50af29b8a48fa066aed7371a90ebf38c29b70  linux-5.10.83.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9bc3c873c5..fb0f147752 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_15
+	default BR2_KERNEL_HEADERS_5_16
 	help
 	  Select the kernel version to get headers from.
 
@@ -65,6 +65,10 @@ config BR2_KERNEL_HEADERS_5_14
 config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+
+config BR2_KERNEL_HEADERS_5_16
+	bool "Linux 5.16.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -139,8 +143,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16
+	bool "5.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
-	bool "5.15.x or later"
+	bool "5.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14
@@ -382,6 +390,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.83"	if BR2_KERNEL_HEADERS_5_10
 	default "5.14.21"	if BR2_KERNEL_HEADERS_5_14
 	default "5.15.6"	if BR2_KERNEL_HEADERS_5_15
+	default "5.16"		if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fd005f4740..adc93ab725 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -566,6 +566,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -579,6 +583,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	default "5.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	default "5.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	default "5.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1cea64d105..9346fa3feb 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,8 +123,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_16
+	bool "5.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_15
-	bool "5.15.x or later"
+	bool "5.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_14
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
