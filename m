Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC68C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 19:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E125641B55;
	Mon,  8 Jan 2024 19:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E125641B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwGFtXrtnd1a; Mon,  8 Jan 2024 19:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21DC041BCD;
	Mon,  8 Jan 2024 19:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21DC041BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA451BF2B4
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 19:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E7C83870
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 19:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E7C83870
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXRqnHgzyCvV for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 19:47:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4807A8384B
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 19:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4807A8384B
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13E90A4C0DB7;
 Mon,  8 Jan 2024 20:47:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36232)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rMvab-000000000O4-1uFt;
 Mon, 08 Jan 2024 20:47:13 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 20:47:12 +0100
Message-Id: <20240108194713.1375752-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108194713.1375752-1-bernd@kuhls.net>
References: <20240108194713.1375752-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704743234;
 bh=JRvBBYIbqVSst4/myoovvBK57ir97cXzrqbmqa2DQfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mBByeM4nlPoZ2oeAEGzvMq70zP3qZ+3jb9Tsma5+qN/5ZIWi8lNeOYAb9PUxYhDTL
 CBykrwqa719zMrsmS/V9RmeWUDaV6ll3zr3AX6+bMonsLXMO2EqUlJH0eRiTYSJkQZ
 AboqnsQ6Uzg7pGOntj3Y4Vp0fwDyxc1HXpRFZrBzzZXUK39VBB6YtynS/W7c7qXdNZ
 wYwXQa0fbi0uUb25OT9pgAoaU0YiS3dsBigtAfHcLY8wXSkvoeSnprYuNTdRHV1MVd
 AcLzcwSAACbS4dTEg8Ck6H4FRAqWunFOhHMM6JSw4lCkMrd8Xti4Kh2SmmJQTltCaL
 ZaAP0RI072f3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=mBByeM4n
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.7 headers
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And add (and default to) 6.7 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ff2ca2d6fe..f8b50e50fd 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  ef31144a2576d080d8c31698e83ec9f66bf97c677fa2aaf0d5bbb9f3345b1069  linux-6.7.tar.xz
 sha256  9ee627e4c109aec7fca3eda5898e81d201af2c7eb2f7d9d7d94c1f0e1205546c  linux-6.6.10.tar.xz
 sha256  2df774dd53f9ffd4e57ebf804cf597709295df6a304fe261d25220a134b7f041  linux-6.1.71.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b0dcbd3011..070c57b5a1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_6
+	default BR2_KERNEL_HEADERS_6_7
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
+config BR2_KERNEL_HEADERS_6_7
+	bool "Linux 6.7.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7
+	bool "6.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
-	bool "6.6.x or later"
+	bool "6.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
@@ -415,6 +423,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.146"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.71"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.10"	if BR2_KERNEL_HEADERS_6_6
+	default "6.7"		if BR2_KERNEL_HEADERS_6_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 34e0ae2c5f..12150eff0c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -644,6 +644,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -657,6 +661,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 5554d56719..a7c239dcab 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7
+	bool "6.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
-	bool "6.6.x or later"
+	bool "6.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
