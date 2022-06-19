Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643CFC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06AD560E56;
	Sun, 19 Jun 2022 16:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AD560E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhqQsVMAXKYf; Sun, 19 Jun 2022 16:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB6E607F6;
	Sun, 19 Jun 2022 16:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB6E607F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF311BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56A3740875
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A3740875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BrNUPjqeypQ for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:36:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC32240867
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC32240867
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 70366873F8; Sun, 19 Jun 2022 16:24:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:26:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e122d962a1415fb595286ad71771701f9860765d
X-Git-Newrev: 3d08d23b783fd22e3e153f3f2080d63ab2d36ea4
X-Patchwork-Hint: ignore
Message-Id: <20220619162408.70366873F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae300: remove defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d08d23b783fd22e3e153f3f2080d63ab2d36ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the nds32 architecture support, remove the
only defconfig that used this CPU architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 -
 board/andes/ae300/ae300.fragment                   |  1 -
 .../0001-nds32-Fix-boot-messages-garbled.patch     | 28 ------------
 ...-Remove-redundant-YYLOC-global-declaratio.patch | 52 ----------------------
 board/andes/ae300/readme.txt                       | 49 --------------------
 configs/andes_ae300_defconfig                      | 10 -----
 6 files changed, 141 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86755bfe18..21f2fb21a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2174,7 +2174,6 @@ F:	package/tcf-agent/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
