Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37E6C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3376841DB;
	Tue,  7 Jun 2022 20:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIcyJOQBDagU; Tue,  7 Jun 2022 20:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670CD84194;
	Tue,  7 Jun 2022 20:59:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9651BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C11F8418F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsDUzgt-gHMu for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:59:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF7748418B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:59:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 19E0640008;
 Tue,  7 Jun 2022 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654635573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+8z/y21z8Pg+D8xmtIjaFTmuuWwJ2kPby3lhfv6BVg=;
 b=aslpOFwgIhYUohhxcNWrQsGI/XOHaQZRLGhgp1nVXiYbRDRDtS5eDBZB2fzGvS7fysFEGC
 FzoFZuof/VMnCm0MW3pibsCdxHdcIypQrG2rYEfgPUiD8H4yGH5gTQ/O+KPkFJSY2ePFT7
 U091j5/i3qMN7FdvXnjOkYHh1rc2GPr+Wn6ZVZDPcNPRtnec65K2dSj22+FEuQwzdQ1+aj
 COryLvCMku7nPM+VV9grhJ8Ka1o7yOW8jg4K12ncG9S0HTZeD8s6e40vj/pVyc7SZ5lQC4
 caEthNrWlRXohmomlyNATgBYyxLBrrKp3lePRjXUB2yodoU1wC4IMM3ui8m+7Q==
To: Buildroot List <buildroot@buildroot.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>
Date: Tue,  7 Jun 2022 22:59:18 +0200
Message-Id: <20220607205921.3312256-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607205921.3312256-1-thomas.petazzoni@bootlin.com>
References: <20220607205921.3312256-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] configs/andes_ae300: remove defconfig
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the nds32 architecture support, remove the
only defconfig that used this CPU architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 -
 board/andes/ae300/ae300.fragment              |  1 -
 ...0001-nds32-Fix-boot-messages-garbled.patch | 28 ----------
 ...ve-redundant-YYLOC-global-declaratio.patch | 52 -------------------
 board/andes/ae300/readme.txt                  | 49 -----------------
 configs/andes_ae300_defconfig                 | 10 ----
 6 files changed, 141 deletions(-)
 delete mode 100644 board/andes/ae300/ae300.fragment
 delete mode 100644 board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
 delete mode 100644 board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
 delete mode 100644 board/andes/ae300/readme.txt
 delete mode 100644 configs/andes_ae300_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fec764812..25a5f82e79 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2164,7 +2164,6 @@ F:	package/tcf-agent/
 N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	arch/Config.in.nds32
 F:	board/andes
-F:	configs/andes_ae300_defconfig
 F:	configs/andes_ae350_45_defconfig
 F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
diff --git a/board/andes/ae300/ae300.fragment b/board/andes/ae300/ae300.fragment
deleted file mode 100644
index 3b13d10740..0000000000
--- a/board/andes/ae300/ae300.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_NDS32_BUILTIN_DTB="ae3xx"
diff --git a/board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
deleted file mode 100644
index adb60937bd..0000000000
--- a/board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 90d52d180dcc5d1300dc352ca709eb6453894143 Mon Sep 17 00:00:00 2001
-From: Nylon Chen <nylon7@andestech.com>
-Date: Wed, 28 Nov 2018 16:26:46 +0800
-Subject: [PATCH] nds32: Fix boot messages garbled
-
-In order to display uart correctly we have to pass the correct setting of uart to kernel by bootarg.
-This patch will provide such settings to set the correct uart baud rate.
-
-Signed-off-by: Nylon Chen <nylon7@andestech.com>
----
- arch/nds32/boot/dts/ae3xx.dts | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/nds32/boot/dts/ae3xx.dts b/arch/nds32/boot/dts/ae3xx.dts
-index bb39749a6673..aefe2090926a 100644
---- a/arch/nds32/boot/dts/ae3xx.dts
-+++ b/arch/nds32/boot/dts/ae3xx.dts
-@@ -6,6 +6,7 @@
- 	interrupt-parent = <&intc>;
- 
- 	chosen {
-+		bootargs = "memblock=debug earlycon console=ttyS0,38400n8 debug loglevel=7";
- 		stdout-path = &serial0;
- 	};
- 
--- 
-2.18.0
-
diff --git a/board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
deleted file mode 100644
index 71ae991816..0000000000
--- a/board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f9df4186c17d686f1ca38f973d7a3a49e8e37c01 Mon Sep 17 00:00:00 2001
-From: Dirk Mueller <dmueller@suse.com>
-Date: Tue, 14 Jan 2020 18:53:41 +0100
-Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
-
-gcc 10 will default to -fno-common, which causes this error at link
-time:
-
-  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
-
-This is because both dtc-lexer as well as dtc-parser define the same
-global symbol yyloc. Before with -fcommon those were merged into one
-defintion. The proper solution would be to to mark this as "extern",
-however that leads to:
-
-  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
-   26 | extern YYLTYPE yylloc;
-      |                ^~~~~~
-In file included from dtc-lexer.l:24:
-dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
-  127 | extern YYLTYPE yylloc;
-      |                ^~~~~~
-cc1: all warnings being treated as errors
-
-which means the declaration is completely redundant and can just be
-dropped.
-
-Signed-off-by: Dirk Mueller <dmueller@suse.com>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-[robh: cherry-pick from upstream]
-Cc: stable@vger.kernel.org
-Signed-off-by: Rob Herring <robh@kernel.org>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- scripts/dtc/dtc-lexer.l | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
-index 06c040902444..d1b3810156c7 100644
---- a/scripts/dtc/dtc-lexer.l
-+++ b/scripts/dtc/dtc-lexer.l
-@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
- #include "srcpos.h"
- #include "dtc-parser.tab.h"
- 
--YYLTYPE yylloc;
- extern bool treesource_error;
- 
- /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
--- 
-2.25.1
-
diff --git a/board/andes/ae300/readme.txt b/board/andes/ae300/readme.txt
deleted file mode 100644
index 51c05c9235..0000000000
--- a/board/andes/ae300/readme.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Intro
-=====
-
-Andestech(nds32) AE300 Platform
-
-The AE300 prototype demonstrates the AE300 example platform on the FPGA.
-It is composed of one Andestech(nds32) processor and AE300.
-
-How to build it
-===============
-
-Configure Buildroot
--------------------
-
-The andes_ae300_defconfig configuration is a sample configuration with
-all that is required to bring the FPGA Development Board:
-
-  $ make andes_ae300_defconfig
-
-Build everything
-----------------
-Note: you will need to have access to the network, since Buildroot will
-download the packages' sources.
-
-  $ make
-
-Result of the build
--------------------
-
-After building, you should obtain this tree:
-
-output/images/
-    +-- vmlinux
-    +-- rootfs.cpio
-    +-- rootfs.tar
-
-How to run it
-=============
-
-Run
----
-
-  Setup the Console with the rate 38400/8-N-1.
-
-  $ cd output/images
-  $ ../host/bin/nds32le-linux-gdb vmlinux
-  $ target remote [your host]
-  $ lo
-  $ c 
diff --git a/configs/andes_ae300_defconfig b/configs/andes_ae300_defconfig
deleted file mode 100644
index ffcb4d7d38..0000000000
--- a/configs/andes_ae300_defconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_nds32=y
-BR2_GLOBAL_PATCH_DIR="board/andes/ae300/patches"
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae300/ae300.fragment"
-BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
