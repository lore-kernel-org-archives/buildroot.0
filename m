Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F58EC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 09:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3EAF41762;
	Sun,  5 May 2024 09:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm3QsoLl9AN8; Sun,  5 May 2024 09:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FDA441E98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FDA441E98;
	Sun,  5 May 2024 09:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E51B91BF4E7
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDF6F821A0
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbMXRAxG4i2m for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 09:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 023DC820D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 023DC820D7
 for <buildroot@buildroot.org>; Sun,  5 May 2024 09:16:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF4F086389; Sun,  5 May 2024 09:16:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 11:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 154663c71ea4b6f6061801fe79f7554f695f3d38
X-Git-Newrev: a3d91b0a83339e19594dbc12b6345fb38b00f9ea
X-Patchwork-Hint: ignore
Message-Id: <20240505091608.DF4F086389@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bats-file: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3d91b0a83339e19594dbc12b6345fb38b00f9ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bats-file is a helper library providing common filesystem related
assertions and helpers for Bats.

This library does not provide an installer. Manually install the files
under /usr/lib/bats/bats-file which is what the Arch Linux package
does[1]. This makes the library loadable using `bats_load_library`[2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-file/-/blob/main/PKGBUILD?ref_type=heads
[2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr: move as sub-option of bats-core]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                       |  1 +
 package/bats-core/Config.in      |  1 +
 package/bats-file/Config.in      | 14 ++++++++++++++
 package/bats-file/bats-file.hash |  5 +++++
 package/bats-file/bats-file.mk   | 18 ++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2dfd5afd34..c2d3f52a59 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -541,6 +541,7 @@ N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
 F:	package/bats-assert/
+F:	package/bats-file/
 F:	package/bats-support/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
diff --git a/package/bats-core/Config.in b/package/bats-core/Config.in
index d7c0a13b1f..00beb2115e 100644
--- a/package/bats-core/Config.in
+++ b/package/bats-core/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_BATS_CORE
 if BR2_PACKAGE_BATS_CORE
 
 source "package/bats-assert/Config.in"
+source "package/bats-file/Config.in"
 source "package/bats-support/Config.in"
 
 endif
diff --git a/package/bats-file/Config.in b/package/bats-file/Config.in
new file mode 100644
index 0000000000..c53fcf6643
--- /dev/null
+++ b/package/bats-file/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_BATS_FILE
+	bool "bats-file"
+	select BR2_PACKAGE_BATS_SUPPORT # runtime
+	help
+	  bats-file is a helper library providing common filesystem
+	  related assertions and helpers for Bats.
+
+	  Assertions are functions that perform a test and output
+	  relevant information on failure to help debugging. They return
+	  1 on failure and 0 otherwise. Output, formatted for
+	  readability, is sent to the standard error to make assertions
+	  usable outside of @test blocks too.
+
+	  https://github.com/bats-core/bats-file
diff --git a/package/bats-file/bats-file.hash b/package/bats-file/bats-file.hash
new file mode 100644
index 0000000000..9530dc6d9d
--- /dev/null
+++ b/package/bats-file/bats-file.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  9b69043241f3af1c2d251f89b4fcafa5df3f05e97b89db18d7c9bdf5731bb27a  bats-file-0.4.0.tar.gz
+
+# License files
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-file/bats-file.mk b/package/bats-file/bats-file.mk
new file mode 100644
index 0000000000..0499327fe0
--- /dev/null
+++ b/package/bats-file/bats-file.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bats-file
+#
+################################################################################
+
+BATS_FILE_VERSION = 0.4.0
+BATS_FILE_SITE = $(call github,bats-core,bats-file,v$(BATS_FILE_VERSION))
+BATS_FILE_LICENSE = CC0-1.0
+BATS_FILE_LICENSE_FILES = LICENSE
+
+define BATS_FILE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-file/src
+	$(INSTALL) -m 0755 $(@D)/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-file
+	$(INSTALL) -m 0755 $(@D)/src/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-file/src
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
