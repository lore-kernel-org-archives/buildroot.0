Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846C4E7DEF9
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1DC40BC4;
	Mon,  2 Feb 2026 15:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGdnEvjn608T; Mon,  2 Feb 2026 15:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368C440B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770046827;
	bh=JsehrYG6p/pBPH2I+I7QYBpLteh5Wk0iIEjFEqDDsWg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kkd+kqShNPEw5OGeb44aD3mG9Wla05OHKd8KFCkrebG4hmO2iEvIJAINNhPBg8qpG
	 v4p8fJYQ/zff+PLirkEGx7dwKgMnKYhzDsrj8FMwtDnfeOZU9wiPyTNNH9DLkvNLA2
	 qZtyHfHgcrkbf+Ki5QPkGbb9Yx+to3nUYQwLVKM9ieN5vyhx+uRgBxluOe0CZAk9ul
	 xXOnk/dyi+2jG7V/ALTu971w0z/uB9wehhaARhfyKhoHV07w8snw26JviYtXvWUlDJ
	 ANKtRITmVgkAIWPcszA2EC0AGi9XLf035bdyilGQz26XBLMAHdretToaVNz32KLmf+
	 zNmqj7rB+gR1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368C440B11;
	Mon,  2 Feb 2026 15:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B54A1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EBE1402C3
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29Lq8oDXAhRd for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE6DA40064
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE6DA40064
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAD2B863A4; Mon,  2 Feb 2026 15:40:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 16:21:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1063c73edccd3c027d8e76d5e97941624e137873
X-Git-Newrev: 3d1b77f98a079cb6a36c185d6744e1f42bd04951
X-Patchwork-Hint: ignore
Message-Id: <20260202154016.DAD2B863A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/hppa: add new architecture
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
Content-Type: multipart/mixed; boundary="===============6387633398991177368=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6387633398991177368==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3d1b77f98a079cb6a36c185d6744e1f42bd04951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the Precision Architecture (a.k.a. PA-RISC),
a 32-bit architecture developed by Hewlett Packard.

While at it, add this arch to myself in DEVELOPERS.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
[Julien: arch "arch/" prefix in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS          |  2 ++
 arch/Config.in      | 13 +++++++++++++
 arch/Config.in.hppa | 22 ++++++++++++++++++++++
 arch/arch.mk.hppa   | 13 +++++++++++++
 4 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aff26f8012..cb5fc3a4ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3368,6 +3368,8 @@ F:	package/edk2-non-osi/
 F:	support/testing/tests/boot/test_edk2.py
 
 N:	Vincent Stehlé <vincent.stehle@laposte.net>
+F:	arch/Config.in.hppa
+F:	arch/arch.mk.hppa
 F:	board/arm/foundation-v8/
 F:	board/bananapi/bananapi-m2-zero/
 F:	configs/arm_foundationv8_defconfig
diff --git a/arch/Config.in b/arch/Config.in
index 9b8ab20ffc..d21e8cc8f5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -65,6 +65,15 @@ config BR2_aarch64_be
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
 	  http://en.wikipedia.org/wiki/ARM
 
+config BR2_hppa
+	bool "HPPA"
+	select BR2_USE_MMU
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	help
+	  Precision Architecture (a.k.a. PA-RISC) is a 32-bit
+	  (big endian) architecture developed by Hewlett Packard.
+	  https://en.wikipedia.org/wiki/PA-RISC
+
 config BR2_i386
 	bool "i386"
 	select BR2_USE_MMU
@@ -385,6 +394,10 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
+if BR2_hppa
+source "arch/Config.in.hppa"
+endif
+
 if BR2_loongarch64
 source "arch/Config.in.loongarch"
 endif
diff --git a/arch/Config.in.hppa b/arch/Config.in.hppa
new file mode 100644
index 0000000000..5768469f30
--- /dev/null
+++ b/arch/Config.in.hppa
@@ -0,0 +1,22 @@
+choice
+	prompt "Target Architecture Type"
+	help
+	  Architecture type (or version) to use.
+
+config BR2_parisc10
+	bool "PA-RISC 1.0"
+config BR2_parisc11
+	bool "PA-RISC 1.1"
+endchoice
+
+config BR2_ARCH
+	default "hppa"
+
+config BR2_NORMALIZED_ARCH
+	default "parisc"
+
+config BR2_ENDIAN
+	default "BIG"
+
+config BR2_READELF_ARCH_NAME
+	default "HPPA"
diff --git a/arch/arch.mk.hppa b/arch/arch.mk.hppa
new file mode 100644
index 0000000000..9d22e4371f
--- /dev/null
+++ b/arch/arch.mk.hppa
@@ -0,0 +1,13 @@
+#
+# Configure the GCC_TARGET_ARCH variable.
+#
+
+ifeq ($(BR2_hppa),y)
+
+ifeq ($(BR2_parisc10),y)
+GCC_TARGET_ARCH := 1.0
+else ifeq ($(BR2_parisc11),y)
+GCC_TARGET_ARCH := 1.1
+endif
+
+endif

--===============6387633398991177368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6387633398991177368==--
