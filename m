Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB17F55105
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2916E41BC6;
	Sat,  7 Mar 2026 20:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADcymIDHbv3L; Sat,  7 Mar 2026 20:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC0A4183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772914346;
	bh=W9lE50WY8NeB4UsTfFkp/82h8z7DNsHf/+dLX7M1qw0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T1/3Ou1AGKZglvr0dJl9w+9NPQABjC6AooyPY6lm4jQ0uPhXze2FMl2BNQKk72rSD
	 s1h46vlv75DokiF2ljsS9m2DYsSEJA4ox7ZPDFHPc9hXcIV6K3Fxw83LAs/FhqLzc5
	 ha1AuGjtf6Q6EZIlbdDE0H4UvrQRTxw3dYcDlYGTB7BqpMUcqtBc7pJy5b8pC+nEzP
	 fHvzLZ02rdOzR0bUZ851ir66ZA2/4zatrTcx8/j8oaiSujJegI5XjWko16QutgdUD5
	 cj+8AnvI0kv/HJm1ooUDrNZdDSroskjRvzl5zrXjFplzoVnuvq4EJGTvi8Ca+TFGHN
	 NOFRXYQhRNpGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC0A4183F;
	Sat,  7 Mar 2026 20:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0165841B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E781860D69
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVeiUz3MbAnv for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60C06080E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E60C06080E
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E02FA85E1A; Sat,  7 Mar 2026 20:12:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 20:52:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86d0fcd77bba8f4fe0e4d1a054d903de3d40fd15
X-Git-Newrev: 1f9109117846d6fa638a0781f7c11e13ba52612c
X-Patchwork-Hint: ignore
Message-Id: <20260307201223.E02FA85E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvips: bump version to 8.18.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f9109117846d6fa638a0781f7c11e13ba52612c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libvips/libvips/blob/v8.18.0/ChangeLog

Added dependency to gcc >= 4.9 due to C++14 features being used since
this version bump:
https://github.com/libvips/libvips/commit/3fa537480dda6170c3d8fb39abb838161d1c45ce

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libvips/Config.in    | 5 +++--
 package/libvips/libvips.hash | 5 +++--
 package/libvips/libvips.mk   | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index 70d01f0e35..ec2d031141 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBVIPS
 	bool "libvips"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_USE_MMU # fork()
 	# C++ support is required to build libvips
 	# https://github.com/jcupitt/libvips/issues/231
@@ -15,7 +16,7 @@ config BR2_PACKAGE_LIBVIPS
 
 	  http://www.vips.ecs.soton.ac.uk/
 
-comment "libvips needs a toolchain w/ wchar, threads, C++"
+comment "libvips needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
index dd7510ecb2..956ff5924a 100644
--- a/package/libvips/libvips.hash
+++ b/package/libvips/libvips.hash
@@ -1,3 +1,4 @@
-# From https://github.com/libvips/libvips/releases/download/v8.17.2/vips-8.17.2.tar.xz.sha256sum
-sha256  57ea0ec4f30ea04748c9e8eec5415e7c9ac7cafe6822e4788fc110376a1d224a  vips-8.17.2.tar.xz
+# From https://github.com/libvips/libvips/releases/download/v8.18.0/vips-8.18.0.tar.xz.sha256sum
+sha256  b85ab92280c30d22f5c8fe2f68b809cddb7eaac437d8c33474475dac84ddc574  vips-8.18.0.tar.xz
+# Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 729d5fb9e3..8e576038e7 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIPS_VERSION = 8.17.2
+LIBVIPS_VERSION = 8.18.0
 LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.xz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
