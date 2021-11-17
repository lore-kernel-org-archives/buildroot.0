Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA77C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:41:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0491E61B6F
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0491E61B6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D257D60A8D;
	Wed, 17 Nov 2021 22:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7M_BE1GZsA6; Wed, 17 Nov 2021 22:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E11260625;
	Wed, 17 Nov 2021 22:41:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72E951BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C60874018F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uiU6R0lDcAE for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87C8401BD
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:37:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C97588D6B0; Wed, 17 Nov 2021 22:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:28:44 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 21d4668f5f90a3be1e5d5baa464cda62ed61a1e6
X-Git-Newrev: 5f55b60726726d318c4110a322374a3b43855d32
X-Patchwork-Hint: ignore
Message-Id: <20211117223324.C97588D6B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 configs/olimex_a64_olinuxino: backport gcc >= 10 u-boot and linux patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f55b60726726d318c4110a322374a3b43855d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The old U-Boot version used does not build with hostcc >= 10. Backport a
patch fixing that issue. Same goes for Linux so let's backport a patch for
it too.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966188

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 31bce3d6fb913032b81e7de23eddaac8c663ac7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Remove-redundant-YYLOC-global-declaratio.patch | 52 ++++++++++++++++++++++
 ...Remove-redundant-YYLOC-global-declaration.patch | 28 ++++++++++++
 configs/olimex_a64_olinuxino_defconfig             |  3 ++
 3 files changed, 83 insertions(+)

diff --git a/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
new file mode 100644
index 0000000000..71ae991816
--- /dev/null
+++ b/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
@@ -0,0 +1,52 @@
+From f9df4186c17d686f1ca38f973d7a3a49e8e37c01 Mon Sep 17 00:00:00 2001
+From: Dirk Mueller <dmueller@suse.com>
+Date: Tue, 14 Jan 2020 18:53:41 +0100
+Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
+
+gcc 10 will default to -fno-common, which causes this error at link
+time:
+
+  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
+
+This is because both dtc-lexer as well as dtc-parser define the same
+global symbol yyloc. Before with -fcommon those were merged into one
+defintion. The proper solution would be to to mark this as "extern",
+however that leads to:
+
+  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
+   26 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+In file included from dtc-lexer.l:24:
+dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
+  127 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+cc1: all warnings being treated as errors
+
+which means the declaration is completely redundant and can just be
+dropped.
+
+Signed-off-by: Dirk Mueller <dmueller@suse.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+[robh: cherry-pick from upstream]
+Cc: stable@vger.kernel.org
+Signed-off-by: Rob Herring <robh@kernel.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index 06c040902444..d1b3810156c7 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.25.1
+
diff --git a/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch b/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
new file mode 100644
index 0000000000..ec60fc5825
--- /dev/null
+++ b/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
@@ -0,0 +1,28 @@
+From 018921ee79d3f30893614b3b2b63b588d8544f73 Mon Sep 17 00:00:00 2001
+From: Peter Robinson <pbrobinson@gmail.com>
+Date: Thu, 30 Jan 2020 09:37:15 +0000
+Subject: [PATCH] Remove redundant YYLOC global declaration
+
+Same as the upstream fix for building dtc with gcc 10.
+
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index fd825ebba6..24af549977 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.20.1
+
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index e35c6014bd..7df52dfbdc 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -2,6 +2,9 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
+# System
+BR2_GLOBAL_PATCH_DIR="board/olimex/a64-olinuxino/patches"
+
 # Linux headers same as kernel, a 5.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
