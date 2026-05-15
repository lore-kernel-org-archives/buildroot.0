Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E7CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B169685786;
	Tue,  9 Jun 2026 13:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37SdGzIWMsDw; Tue,  9 Jun 2026 13:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F319985744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010141;
	bh=SCHgqb9TkArXR8LOx13eK2rrQPuTxVTOFJYfVdYM6hM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F8djDAsDKxVBXpP7hR0u0vARva36crkKo282U0xESeARWVWnvHu+8QhulHu+W0XTu
	 fQLo+digg1t/YwNZTxNxr6EN8htAyMghu6TszA9j4YWHcN1HXliLKU9vyqamB8XGrj
	 yiEOKoa+++MjIytUEmbVJ683rjcForAUPDx5V5ALxudjp/pDilAzVU45LUdO924YWu
	 PRMucv6A2BRYrXYZJFDQSz6Eq/GI3z+6OnywThT79PBBLRRDMqYg1UntfwRB048CJT
	 lXIDpLsCzVqofCR/oh/IQmlW0JnKHMD4Gmm5z8dZN77EAMVFJyTrweqcZ65eZP/xOz
	 ZlV9UnxQMgGuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F319985744;
	Tue,  9 Jun 2026 13:02:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E2D3196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0825E6F694
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8Yj0W9EKr01 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 430926F67E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 430926F67E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D65B87E7E; Tue,  9 Jun 2026 13:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:36:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85a3edc0ba54abe02556682f661068c620596e83
X-Git-Newrev: 9a5369effd22011b52b82c91f702bacde690c41a
X-Patchwork-Hint: ignore
Message-Id: <20260609130116.6D65B87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 11.0.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a5369effd22011b52b82c91f702bacde690c41a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://wiki.qemu.org/ChangeLog/11.0

Note:
  - Support for all 32-bit host systems has been removed.
  - Support for microblazeel has been folded into the microblaze target

Qemu v11.0.0 drops 32-bit support for hosts, all qemu builds must now be
64-bit. Hosts running 64-bit qemu builds can still emulate 32-bit
targets.

Confusingly, the qemu package is also capable of being built and running
on buildroot hosts, and targets. In any case, qemu only supports running
on 64-bit hosts (which may be buildroot targets), so adjust
BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET to indicate no support for 32-bit
buildroot targets, and drop configs for architectures like BR2_arm that
are implicitly 32-bit only.

Separately, the qemu microblazeel target was removed with commit
46a25ae3f0e75e230c06e21435850b1cd1c44f07, as the microblaze (qemu)
target supports both endiannesses, so that's fixed up in the package
Makefile as well.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
[Romain: remove duplicate --disable-download from QEMU_CONFIGURE_CMDS]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy       |  8 ++++++++
 package/qemu/Config.in | 12 +-----------
 package/qemu/qemu.hash |  2 +-
 package/qemu/qemu.mk   | 16 ++++++++++++----
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ead9ceaa08..90606ebd4b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
+	bool "qemu target microblazeel removed"
+	select BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
+	select BR2_LEGACY
+	help
+	  Version 11.0.0 of qemu folded microblazeel support into
+	  the microblaze target.
+
 config BR2_KERNEL_HEADERS_6_19
 	bool "kernel headers version 6.19.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0b16c8c284..2a6aa288d3 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -2,13 +2,9 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
 	default y if BR2_aarch64
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_i386
-	default y if BR2_mips
-	default y if BR2_mipsel
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
-	default y if BR2_riscv
+	default y if BR2_RISCV_64
 	default y if BR2_s390x
 	default y if BR2_x86_64
 
@@ -223,12 +219,6 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
 	help
 	  Xilinx MicroBlaze soft processor.
 
-config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
-	bool "microblazeel"
-	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
-	help
-	  Xilinx MicroBlaze EL soft processor.
-
 config BR2_PACKAGE_QEMU_TARGET_MIPS
 	bool "mips"
 	help
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index f8e750225f..7c7325a6ce 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
+sha256  c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6  qemu-11.0.0.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b7007e3b98..2199db38cf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.2.0
+QEMU_VERSION = 11.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
@@ -28,6 +28,8 @@ QEMU_DEPENDENCIES = \
 	host-pkgconf \
 	host-python3 \
 	host-python-distlib \
+	host-python-setuptools \
+	host-python-wheel \
 	libglib2 \
 	zlib
 
@@ -70,7 +72,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-softmmu
@@ -107,7 +108,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-linux-user
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-linux-user
@@ -318,6 +318,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-curses \
 			--disable-dbus-display \
 			--disable-docs \
+			--disable-download \
 			--disable-dsound \
 			--disable-hvf \
 			--disable-jack \
@@ -345,7 +346,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-xen \
 			--enable-attr \
 			--enable-vhost-net \
-			--disable-download \
 			--disable-hexagon-idef-parser \
 			$(QEMU_OPTS)
 endef
@@ -372,6 +372,8 @@ HOST_QEMU_DEPENDENCIES = \
 	host-pkgconf \
 	host-python3 \
 	host-python-distlib \
+	host-python-setuptools \
+	host-python-wheel \
 	host-slirp \
 	host-zlib
 
@@ -386,6 +388,7 @@ HOST_QEMU_DEPENDENCIES = \
 #       x86_64          x86_64
 #       m68k            m68k
 #       microblaze      microblaze
+#       microblazeel    microblaze
 #       mips            mips
 #       mipsel          mipsel
 #       mips64          mips64
@@ -416,6 +419,10 @@ endif
 ifeq ($(HOST_QEMU_ARCH),i686)
 HOST_QEMU_ARCH = i386
 endif
+ifeq ($(HOST_QEMU_ARCH),microblazeel)
+# since v11.0.0, microblazeel emulation is provided by the microblaze target
+HOST_QEMU_ARCH = microblaze
+endif
 ifeq ($(HOST_QEMU_ARCH),powerpc)
 HOST_QEMU_ARCH = ppc
 endif
@@ -508,6 +515,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-curl \
 		--disable-dbus-display \
 		--disable-docs \
+		--disable-download \
 		--disable-dsound \
 		--disable-jack \
 		--disable-libssh \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
