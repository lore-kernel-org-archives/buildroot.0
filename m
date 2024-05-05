Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1915C25B4F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 09:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13D641B4B;
	Sun,  5 May 2024 09:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh9j9EJAjlkC; Sun,  5 May 2024 09:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A50441E7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A50441E7A;
	Sun,  5 May 2024 09:16:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1B9E1BF4E7
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB72C82133
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpkocQap37C7 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 09:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E158210B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E158210B
 for <buildroot@buildroot.org>; Sun,  5 May 2024 09:16:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6DF98656B; Sun,  5 May 2024 09:16:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 11:08:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38ba3d31a4905cc41b87a2ff9e6fee198d416a92
X-Git-Newrev: 154663c71ea4b6f6061801fe79f7554f695f3d38
X-Patchwork-Hint: ignore
Message-Id: <20240505091608.C6DF98656B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bats-assert: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=154663c71ea4b6f6061801fe79f7554f695f3d38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bats-assert is a helper library providing common assertions for Bats.

This library does not provide an installer. Manually install the files
under /usr/lib/bats/bats-assert which is what the Arch Linux package
does[1]. This makes the library loadable using `bats_load_library`[2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-assert/-/blob/main/PKGBUILD?ref_type=heads
[2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
yann.morin.1998@free.fr: move as sub-option of bats-core]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                           |  1 +
 package/bats-assert/Config.in        | 15 +++++++++++++++
 package/bats-assert/bats-assert.hash |  5 +++++
 package/bats-assert/bats-assert.mk   | 18 ++++++++++++++++++
 package/bats-core/Config.in          |  1 +
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fc46d6b43..2dfd5afd34 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -540,6 +540,7 @@ F:	package/ncdu/
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
+F:	package/bats-assert/
 F:	package/bats-support/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
diff --git a/package/bats-assert/Config.in b/package/bats-assert/Config.in
new file mode 100644
index 0000000000..8768331c1e
--- /dev/null
+++ b/package/bats-assert/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_BATS_ASSERT
+	bool "bats-assert"
+	select BR2_PACKAGE_BATS_SUPPORT # runtime
+	help
+	  bats-assert is a helper library providing common assertions
+	  for Bats.
+
+	  In the context of this project, an assertion is a function
+	  that perform a test and returns 1 on failure or 0 on success.
+	  To make debugging easier, the assertion also outputs relevant
+	  information on failure. The output is formatted for
+	  readability. To make assertions usable outside of @test
+	  blocks, the output is sent to stderr.
+
+	  https://github.com/bats-core/bats-assert
diff --git a/package/bats-assert/bats-assert.hash b/package/bats-assert/bats-assert.hash
new file mode 100644
index 0000000000..94c3908ab3
--- /dev/null
+++ b/package/bats-assert/bats-assert.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  98ca3b685f8b8993e48ec057565e6e2abcc541034ed5b0e81f191505682037fd  bats-assert-2.1.0.tar.gz
+
+# License files
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-assert/bats-assert.mk b/package/bats-assert/bats-assert.mk
new file mode 100644
index 0000000000..c0e37e0048
--- /dev/null
+++ b/package/bats-assert/bats-assert.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bats-assert
+#
+################################################################################
+
+BATS_ASSERT_VERSION = 2.1.0
+BATS_ASSERT_SITE = $(call github,bats-core,bats-assert,v$(BATS_ASSERT_VERSION))
+BATS_ASSERT_LICENSE = CC0-1.0
+BATS_ASSERT_LICENSE_FILES = LICENSE
+
+define BATS_ASSERT_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-assert/src
+	$(INSTALL) -m 0755 $(@D)/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-assert
+	$(INSTALL) -m 0755 $(@D)/src/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-assert/src
+endef
+
+$(eval $(generic-package))
diff --git a/package/bats-core/Config.in b/package/bats-core/Config.in
index 7ba119a412..d7c0a13b1f 100644
--- a/package/bats-core/Config.in
+++ b/package/bats-core/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_BATS_CORE
 
 if BR2_PACKAGE_BATS_CORE
 
+source "package/bats-assert/Config.in"
 source "package/bats-support/Config.in"
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
