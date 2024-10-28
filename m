Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD58D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6EA6405B9;
	Mon, 28 Oct 2024 21:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eXMKJCTYlEr; Mon, 28 Oct 2024 21:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664CF405BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664CF405BA;
	Mon, 28 Oct 2024 21:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D2F4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1939400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTF2MUaGQJlK for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 931AB40015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 931AB40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC3B84558; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:34:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10b4c31b812128f255e8ea58050879b953d58f0e
X-Git-Newrev: 0655d9af281fd80f29ded0bbe469acb64935d795
X-Patchwork-Hint: ignore
Message-Id: <20241028213823.8BC3B84558@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: update to 9.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0655d9af281fd80f29ded0bbe469acb64935d795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for changes:
https://wiki.qemu.org/ChangeLog/9.1

The support for the nios2 architecture got removed.

[Romain: Remove BR2_PACKAGE_QEMU_TARGET_NIOS2 from qemu.mk]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy            | 6 ++++++
 package/qemu/Config.in      | 5 -----
 package/qemu/Config.in.host | 1 -
 package/qemu/qemu.hash      | 2 +-
 package/qemu/qemu.mk        | 4 +---
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9a1693dd76..a041d4da42 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_QEMU_TARGET_NIOS2
+	bool "qemu nios2 support has been removed"
+	select BR2_LEGACY
+	help
+	  NIOS2 support has been removed since Qemu 9.1.0.
+
 config BR2_PACKAGE_POPPERJS
 	bool "popperjs has been removed"
 	select BR2_LEGACY
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 608e4d429d..2d15ab1ea9 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -252,11 +252,6 @@ config BR2_PACKAGE_QEMU_TARGET_MIPSN32EL
 	help
 	  MIPS N32 architecture, little-endian.
 
-config BR2_PACKAGE_QEMU_TARGET_NIOS2
-	bool "nios2"
-	help
-	  Nios II architecture.
-
 config BR2_PACKAGE_QEMU_TARGET_OR1K
 	bool "or1k"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 8dd0c7d11b..4db114490a 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -9,7 +9,6 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_microblazebe
 	default y if BR2_mips
 	default y if BR2_mipsel
-	default y if BR2_nios2
 	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 419dd0d1b3..169fe05068 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  a8c3f596aece96da3b00cafb74baafa0d14515eafb8ed1ee3f7f5c2d0ebf02b6  qemu-9.0.2.tar.xz
+sha256  816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834  qemu-9.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a2d164d189..76394b3e77 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 9.0.2
+QEMU_VERSION = 9.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
@@ -63,7 +63,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSEL) += mipsel-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_NIOS2) += nios2-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_OR1K) += or1k-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC) += ppc-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC64) += ppc64-softmmu
@@ -104,7 +103,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSEL) += mipsel-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSN32) += mipsn32-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSN32EL) += mipsn32el-linux-user
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_NIOS2) += nios2-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_OR1K) += or1k-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC) += ppc-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC64) += ppc64-linux-user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
