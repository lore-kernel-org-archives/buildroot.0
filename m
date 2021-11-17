Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFCBC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:41:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F68761B6F
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F68761B6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2EE60AB1;
	Wed, 17 Nov 2021 22:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWBjQBoG240g; Wed, 17 Nov 2021 22:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3036160B73;
	Wed, 17 Nov 2021 22:41:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF1A21BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD36980CCC
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5Amwuhn-CvU for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:37:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D183F80CDB
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:37:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B31F58D6B1; Wed, 17 Nov 2021 22:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:27:48 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fc2a80e2eabb9c5c9d230d1e4014a4e9238352d2
X-Git-Newrev: 055342cbc94f2bf7299757979fd633d39acc50de
X-Patchwork-Hint: ignore
Message-Id: <20211117223324.B31F58D6B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 configs/sheevaplug_defconfig: backport gcc >= 10 u-boot patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=055342cbc94f2bf7299757979fd633d39acc50de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966307

The old U-Boot version used does not build with hostcc >= 10.  Backport a
patch fixing that issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d6a5a0cc7c283916df5a7c71f4599b05d296bd1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Remove-redundant-YYLOC-global-declaration.patch | 28 ++++++++++++++++++++++
 configs/sheevaplug_defconfig                       |  1 +
 2 files changed, 29 insertions(+)

diff --git a/board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch b/board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
new file mode 100644
index 0000000000..c9d5d71ca1
--- /dev/null
+++ b/board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
@@ -0,0 +1,28 @@
+From 018921ee79d3f30893614b3b2b63b588d8544f73 Mon Sep 17 00:00:00 2001
+From: Peter Robinson <pbrobinson@gmail.com>
+Date: Thu, 30 Jan 2020 09:37:15 +0000
+Subject: [PATCH] Remove redundant YYLOC global declaration
+
+Same as the upstream fix for building dtc with gcc 10.
+
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 4c3bb21b4a..7f186df22c 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -3,6 +3,7 @@ BR2_arm=y
 BR2_arm926t=y
 
 # system
+BR2_GLOBAL_PATCH_DIR="board/sheevaplug/patches"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
