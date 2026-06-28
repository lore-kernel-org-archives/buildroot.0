Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E85C43458
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 13:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9286A40C6B;
	Sun, 28 Jun 2026 13:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeY32X_0NvaA; Sun, 28 Jun 2026 13:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9964B40C8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782653627;
	bh=JjOn//hKcT9VPSMVnVDxr41WZOj0Ywk6RwCaTJmyjJI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oabHi5R3X6PJJXbYwwDb3ivpbVTlyBFYUzw9hRgckJHHkmA/WwSYpQqj6/8sQVdZR
	 dHoRvMSaB9BjvD5vW7w9hYT9tsiV/16tTsCV76tjgstTCMGta5FDz+JdwtelZweYRL
	 iMEohbjunyiyCTcGzV7NotaDxbSVi6eBm9LIygKKp2WlhuBt/IK6FFQtHGJn8Oyt3J
	 L8i9cyWCnfv73xguB26cqZNQxacrN2hAZRpffgvttYny4wHQ/Ts8veRQf1BAmtSUfS
	 2ynGgFNAGik6auYPZ2Ic7Oa2XBLLp3DERyDK3evhToeo9dldlc6NZxIPUIr+Vdae6O
	 Cb4SIw2uVr5eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9964B40C8C;
	Sun, 28 Jun 2026 13:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AA752F3
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1104481583
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFAk3A-cJnDN for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 13:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58FFC8156D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58FFC8156D
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6033186E73; Sun, 28 Jun 2026 13:33:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jun 2026 15:32:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5c88de2808a67ade2d9dacb7e03447d35908da6
X-Git-Newrev: 606f9ecbdec0b814e1fd6f07635985fbbf61e62c
X-Patchwork-Hint: ignore
Message-Id: <20260628133318.6033186E73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 7.0.x option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/606f9ecbdec0b814e1fd6f07635985fbbf61e62c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 7.0.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/7.0.14         | 1 -
 package/linux-headers/Config.in.host | 5 -----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b8a95fd812..4894fe7065 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_KERNEL_HEADERS_7_0
+	bool "kernel headers version 7.0.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 7.0.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 	bool "bluez sap plugin removed"
 	select BR2_LEGACY
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index e611478e30..2d6ab0f28a 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  37198c93727be247c9fb5309bb86cd5e496c61e5322cd8c4eca9476bb0b5883f  linux-7.1.2.tar.xz
-sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  a83cd200e6646db52866b8309e9137b9e9048b613cbda10ced2b811aae125255  linux-6.18.37.tar.xz
diff --git a/package/linux-headers/7.0.14 b/package/linux-headers/7.0.14
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/7.0.14
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 54fa189217..d1eb93ce1c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_7_0
-	bool "Linux 7.0.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
-
 config BR2_KERNEL_HEADERS_7_1
 	bool "Linux 7.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
@@ -482,7 +478,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.37"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default "7.1.2"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
