Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179CAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9DAF40241;
	Sat,  8 Jan 2022 22:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCwQjoLYZUTx; Sat,  8 Jan 2022 22:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BAD340270;
	Sat,  8 Jan 2022 22:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 951371BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 310718146E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2W7fF3tgQoYC for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B8A8148A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9CB40832C8; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffc503fab767c9d2381f7152bcaab024a6358748
X-Git-Newrev: 0fd3770cc64679d5ff541fdaa5d0fdb2f9d16111
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.9CB40832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bat: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fd3770cc64679d5ff541fdaa5d0fdb2f9d16111
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bat is a cat(1) clone with syntax highlighting and Git integration.

Signed-off-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/bat/Config.in | 11 +++++++++++
 package/bat/bat.hash  |  4 ++++
 package/bat/bat.mk    | 12 ++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 259cace487..bc07fdbde3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -680,6 +680,9 @@ F:	linux/linux-ext-ev3dev-linux-drivers.mk
 F:	package/brickd/
 F:	package/ev3dev-linux-drivers/
 
+N:	David Pierret <david.pierret@smile.fr>
+F:	package/bat/
+
 N:	Davide Viti <zinosat@gmail.com>
 F:	board/friendlyarm/nanopi-r1/
 F:	configs/friendlyarm_nanopi_r1_defconfig
diff --git a/package/Config.in b/package/Config.in
index 081268527c..dbfdcf6ce3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2607,6 +2607,7 @@ menu "System tools"
 endmenu
 
 menu "Text editors and viewers"
+	source "package/bat/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
 	source "package/less/Config.in"
diff --git a/package/bat/Config.in b/package/bat/Config.in
new file mode 100644
index 0000000000..515eaf591a
--- /dev/null
+++ b/package/bat/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BAT
+	bool "bat"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	# we need a full version of less
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LESS
+	help
+	  A cat(1) clone with syntax highlighting and Git integration.
+
+	  https://github.com/sharkdp/bat
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
new file mode 100644
index 0000000000..aa6c8d743d
--- /dev/null
+++ b/package/bat/bat.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256  9c345788eb916777a60e7ff32031f1c92edc5565031e0c057bce860982768744  bat-0.18.3.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  64de710b6309a7db5e44ad0af382300c7fb6f6d116d8ae32f0164e05db033068  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
new file mode 100644
index 0000000000..9b619af172
--- /dev/null
+++ b/package/bat/bat.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# bat
+#
+################################################################################
+
+BAT_VERSION = 0.18.3
+BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
+BAT_LICENSE = Apache-2.0 or MIT
+BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
