Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4EDC433EF
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 18:54:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B9960F24
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 18:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0B9960F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BF5E60604;
	Mon,  1 Nov 2021 18:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIkicKnxpemD; Mon,  1 Nov 2021 18:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB70B605DB;
	Mon,  1 Nov 2021 18:54:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D33F1BF2FD
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 18:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE85D80B8F
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 18:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRNYjVmdpiLo for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 18:54:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA7A180B53
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 18:54:27 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 50B0D22175;
 Mon,  1 Nov 2021 19:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1635792865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MhlCvuBdYA16jj7nSnpww3omzf3yZaY/OzMMcpzFB6g=;
 b=TyjYdGeQe+QUHmK6JsJVdvZYv2/WDTXi7ldNsljdL1yjYdflpBbwefUzGtMS8WAw/0YRkl
 +vgkRRmtv6U++VoKXQSI3gpJ98LrqnCkjjYPlsiAsVgnohTnAG2izwyLdeTMdsFPHkrq+a
 nRsvevOQCOmrTeK+DRAiCsPNQqkQvRs=
From: Michael Walle <michael@walle.cc>
To: buildroot@buildroot.org
Date: Mon,  1 Nov 2021 19:54:19 +0100
Message-Id: <20211101185420.2338601-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.15
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
 Romain Naour <romain.naour@gmail.com>, Michael Walle <michael@walle.cc>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
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
index 5ada29029b..d35dacc756 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,7 +28,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.14)"
+	bool "Latest version (5.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.198-cip54)"
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.14.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 200d328426..e58f25ae3c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8  linux-5.15.tar.xz
 sha256  4dff4e96d4052195002538027f8a810411ba6116a41bff5575952702d509d06a  linux-5.14.14.tar.xz
 sha256  e877ec724e917c967603225c7e5dc21b6e0f34998c7d086cab8c50324363ab7b  linux-5.13.19.tar.xz
 sha256  0a2b2f5fefb90773190aaef4726ac363e03992aedc424b0a57eca092d084304b  linux-5.10.75.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 95713a4a38..12d2caa20a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_14
+	default BR2_KERNEL_HEADERS_5_15
 	help
 	  Select the kernel version to get headers from.
 
@@ -65,6 +65,10 @@ config BR2_KERNEL_HEADERS_5_13
 config BR2_KERNEL_HEADERS_5_14
 	bool "Linux 5.14.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+
+config BR2_KERNEL_HEADERS_5_15
+	bool "Linux 5.15.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -139,8 +143,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
+	bool "5.15.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14
-	bool "5.14.x or later"
+	bool "5.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13
@@ -378,6 +386,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.75"	if BR2_KERNEL_HEADERS_5_10
 	default "5.13.19"	if BR2_KERNEL_HEADERS_5_13
 	default "5.14.14"	if BR2_KERNEL_HEADERS_5_14
+	default "5.15"		if BR2_KERNEL_HEADERS_5_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0782fc6922..140d07ca38 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -568,6 +568,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -581,6 +585,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	default "5.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	default "5.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 	default "5.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ae78c0ef9e..1cea64d105 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,8 +123,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_15
+	bool "5.15.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_14
-	bool "5.14.x or later"
+	bool "5.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_13
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
