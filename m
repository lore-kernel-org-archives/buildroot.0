Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556ADD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BE94083E;
	Sun,  7 Dec 2025 12:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPcqbuZjATns; Sun,  7 Dec 2025 12:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9D940831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765111797;
	bh=IIa4wfTqme9eZwRJKLmlKXzk8pmxHkE2MfubeoTtLkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s1Tc166gbURVDGSstN/PsM/706SIgS/gkbklsRV5iodKI9od8H/dAosEr/RLYWkXQ
	 COacr/Ql0rXDnB7mlMsz/oHTijWNRCHz9NgSoj0KhuKBokQxOEdqPAI+3McXcO7XsT
	 KJHel+VXb7SjnYdnU0iIWXzbpXShfHpNJ5exiBjqLgEHtPuKGiYLxf/5lZhbfyTI/w
	 e4dcPMYMiwyBvmtSu+YVNo1UxqmyMTP48eeE1ta9AYiNPVOhFVMKE83NkM50s1C0ZR
	 QEAD15+LeUd32gYJV8xSlHHohL1JqLmUhQ3lKJSEGpCrDgcNaO12ykiq07SUnJYqHD
	 UdACYGmL5ttUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9D940831;
	Sun,  7 Dec 2025 12:49:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F5822F1
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4096B407B8
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJ1BxhjDy-Ym for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF46407AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EF46407AF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E8F08662A; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 12:51:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c
X-Git-Newrev: 7c9d6018e6cd31edb4cd43bbcf187bf8d76a5a65
X-Patchwork-Hint: ignore
Message-Id: <20251207124952.6E8F08662A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 5.4.x option
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c9d6018e6cd31edb4cd43bbcf187bf8d76a5a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.4.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Bump kernel version in test_zfs.py.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                          | 7 +++++++
 linux/linux.hash                          | 1 -
 package/linux-headers/Config.in.host      | 7 -------
 support/testing/tests/package/test_zfs.py | 2 +-
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 81396a2ce7..64151b2f44 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_KERNEL_HEADERS_5_4
+	bool "kernel headers version 5.4.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_LIBARGTABLE2
 	bool "libargtable2 has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index d14de29189..d82ccf83c3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,7 +7,6 @@ sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
-sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f4c440fe3f..412232a571 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -24,12 +24,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_5_4
-	bool "Linux 5.4.x kernel headers"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
-
 config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	# Support was introduced in Linux 5.19
@@ -466,7 +460,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index c218cc36a8..698d8d8bbd 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -81,7 +81,7 @@ class TestZfsUclibc(TestZfsBase):
     config = config.replace('BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y\n', '') + \
         """
         BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
-        BR2_KERNEL_HEADERS_5_4=y
+        BR2_KERNEL_HEADERS_5_10=y
         BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
         BR2_PTHREAD_DEBUG=y
         BR2_TOOLCHAIN_BUILDROOT_CXX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
