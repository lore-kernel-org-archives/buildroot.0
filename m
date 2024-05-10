Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E65C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E66F4040A;
	Fri, 10 May 2024 20:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzpgLotpCUE5; Fri, 10 May 2024 20:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E439404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E439404A3;
	Fri, 10 May 2024 20:51:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5101BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55D1984673
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ufVNAERuSyC for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8068084660
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8068084660
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:51:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6429D86F33; Fri, 10 May 2024 20:51:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:39:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f0660ad2d0cb5fd6c399b5d74dd7b70bde4c23d
X-Git-Newrev: 2e6e121496bfcbe09c018558be13733077b6df9b
X-Patchwork-Hint: ignore
Message-Id: <20240510205119.6429D86F33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mokutil: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e6e121496bfcbe09c018558be13733077b6df9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mokutil is a tool to import or delete the machines owner
keys (MOK) stored in the database of shim.

"shim" is the first stage bootloader to support UEFI Secure
Boot. See also the "shim" package in the bootloaders
section.

https://github.com/lcp/mokutil

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/mokutil/Config.in    | 33 +++++++++++++++++++++++++++++++++
 package/mokutil/mokutil.hash |  3 +++
 package/mokutil/mokutil.mk   | 19 +++++++++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b282d64508..456e2b87ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1752,6 +1752,7 @@ F:	package/gnupg2/
 F:	package/highway/
 F:	package/kexec/
 F:	package/libjxl/
+F:	package/mokutil/
 F:	package/octave/
 F:	package/ola/
 F:	package/openblas/
diff --git a/package/Config.in b/package/Config.in
index 190b100609..c7bad67553 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2776,6 +2776,7 @@ menu "System tools"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/moby-buildkit/Config.in"
+	source "package/mokutil/Config.in"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
new file mode 100644
index 0000000000..3f0c760f7d
--- /dev/null
+++ b/package/mokutil/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_MOKUTIL
+	bool "mokutil"
+	# We're not selecting shim, but this package only makes sense
+	# on architectures on which shim is supported
+	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # keyutils
+	depends on !BR2_STATIC_LIBS # efivar, keyutils
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS # efivar
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
+	depends on BR2_TOOLCHAIN_HAS_THREADS # efivar
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
+	select BR2_PACKAGE_EFIVAR
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  mokutil is a tool to import or delete the machines owner
+	  keys (MOK) stored in the database of shim.
+
+	  "shim" is the first stage bootloader to support UEFI Secure
+	  Boot. See also the "shim" package in the bootloaders
+	  section.
+
+	  https://github.com/lcp/mokutil
+
+comment "mokutil needs a toolchain w/ dynamic library, threads, gcc >= 4.9, headers >= 3.12"
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/package/mokutil/mokutil.hash b/package/mokutil/mokutil.hash
new file mode 100644
index 0000000000..86555e6f4d
--- /dev/null
+++ b/package/mokutil/mokutil.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1c0bcba3d2f4ab98235b1edb5eb71b40508f79d93d3e28b1a04b7fbd4a2c1457  mokutil-0.7.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mokutil/mokutil.mk b/package/mokutil/mokutil.mk
new file mode 100644
index 0000000000..6e83d9f138
--- /dev/null
+++ b/package/mokutil/mokutil.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mokutil
+#
+################################################################################
+
+MOKUTIL_VERSION = 0.7.1
+MOKUTIL_SITE = $(call github,lcp,mokutil,$(MOKUTIL_VERSION))
+MOKUTIL_LICENSE = GPL-3.0+
+MOKUTIL_LICENSE_FILES = COPYING
+MOKUTIL_AUTORECONF = YES
+
+MOKUTIL_DEPENDENCIES = \
+	efivar \
+	host-pkgconf \
+	keyutils \
+	openssl
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
