Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23CCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5595460E19;
	Sun, 26 Dec 2021 22:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyCrtmH3yLtb; Sun, 26 Dec 2021 22:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A169860E14;
	Sun, 26 Dec 2021 22:28:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 197B51BF973
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0292D81455
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjwD1i6ZU9Ox for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D1DE81454
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:28:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 695D282B7B; Sun, 26 Dec 2021 22:23:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:28:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d9d6996952c04cf49d3687003cb4d3d69236ce3
X-Git-Newrev: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa
X-Patchwork-Hint: ignore
Message-Id: <20211226222306.695D282B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libseccomp: bump to version 2.5.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- host-gperf is a mandatory dependency since version 2.5.0 and
  https://github.com/seccomp/libseccomp/commit/9b129c41ac1f43d373742697aa2faf6040b9dfab
- RISC-V 64 bits is supported since version 2.5.0 and
  https://github.com/seccomp/libseccomp/commit/5432e15521d5ce5a7d3f26bf78674cbaa9d73d1f
- Add a dependency on kernel >= 3.17 because __NR_seccomp is
  unconditionally used since version 2.5.0 and
  https://github.com/seccomp/libseccomp/commit/dead12bc788b259b148cc4d93b970ef0bd602b1a
  and __NR_seccomp is only available since
  https://github.com/torvalds/linux/commit/48dc92b9fc3926844257316e75ba11eb5c742b2c

https://github.com/seccomp/libseccomp/blob/v2.5.3/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libseccomp/Config.in       | 7 ++++---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index da1d9008e6..7de91c07c5 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -5,12 +5,13 @@ config BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc
+	default y if BR2_RISCV_64
 	default y if BR2_s390x
 
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	help
 	  High level interface to the Linux Kernel's seccomp filter
 
@@ -24,6 +25,6 @@ config BR2_PACKAGE_LIBSECCOMP
 
 	  https://github.com/seccomp/libseccomp
 
-comment "libseccomp needs a toolchain w/ headers >= 3.12"
+comment "libseccomp needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 2d07c1c1fa..20b8864727 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.4.4
-sha256  4e79738d1ef3c9b7ca9769f1f8b8d84fc17143c2c1c432e53b9c64787e0ff3eb  libseccomp-2.4.4.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.3
+sha256  59065c8733364725e9721ba48c3a99bbc52af921daf48df4b1e012fbc7b10a76  libseccomp-2.5.3.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index e7512730d5..ee2cb126f1 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.4.4
+LIBSECCOMP_VERSION = 2.5.3
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_CPE_ID_VENDOR = libseccomp_project
 LIBSECCOMP_INSTALL_STAGING = YES
+LIBSECCOMP_DEPENDENCIES = host-gperf
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
