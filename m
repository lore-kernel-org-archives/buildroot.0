Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004F2C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 09:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F8B4177F;
	Sun,  5 May 2024 09:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljOaJOzh122P; Sun,  5 May 2024 09:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3B041B4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3B041B4B;
	Sun,  5 May 2024 09:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF5951BF870
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B97C382120
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zht4EytYY87p for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 09:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA5681F9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEA5681F9F
 for <buildroot@buildroot.org>; Sun,  5 May 2024 09:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B89FB86563; Sun,  5 May 2024 09:16:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 11:08:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09bcfb56962afddf29457953b5eedcd51e40333f
X-Git-Newrev: 38ba3d31a4905cc41b87a2ff9e6fee198d416a92
X-Patchwork-Hint: ignore
Message-Id: <20240505091608.B89FB86563@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bats-support: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=38ba3d31a4905cc41b87a2ff9e6fee198d416a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This library provides support functions needed by the bats-assert and
bats-file libraries.

This library does not provide an installer. Manually install the files
under /usr/lib/bats/bats-support which is what the Arch Linux package
does[1]. This makes the library loadable using `bats_load_library`[2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-support/-/blob/main/PKGBUILD?ref_type=heads
[2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries

There are going to be a few such helpers to be introduced later, so we
make them all appear as sub-options of the main package, bats-core.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr:
  - move as sub-option of bats-core
  - explain why in commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                             |  1 +
 package/bats-core/Config.in            |  6 ++++++
 package/bats-support/Config.in         |  7 +++++++
 package/bats-support/bats-support.hash |  5 +++++
 package/bats-support/bats-support.mk   | 18 ++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5d198567d8..7fc46d6b43 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -540,6 +540,7 @@ F:	package/ncdu/
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
+F:	package/bats-support/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
 F:	package/unifdef/
diff --git a/package/bats-core/Config.in b/package/bats-core/Config.in
index 73c38e5a04..7ba119a412 100644
--- a/package/bats-core/Config.in
+++ b/package/bats-core/Config.in
@@ -9,3 +9,9 @@ config BR2_PACKAGE_BATS_CORE
 	  write behave as expected.
 
 	  https://github.com/bats-core/bats-core
+
+if BR2_PACKAGE_BATS_CORE
+
+source "package/bats-support/Config.in"
+
+endif
diff --git a/package/bats-support/Config.in b/package/bats-support/Config.in
new file mode 100644
index 0000000000..ce60978197
--- /dev/null
+++ b/package/bats-support/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BATS_SUPPORT
+	bool "bats-support"
+	help
+	  bats-support is a supporting library providing common
+	  functions to test helper libraries written for Bats.
+
+	  https://github.com/bats-core/bats-support
diff --git a/package/bats-support/bats-support.hash b/package/bats-support/bats-support.hash
new file mode 100644
index 0000000000..847f39e7c7
--- /dev/null
+++ b/package/bats-support/bats-support.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  7815237aafeb42ddcc1b8c698fc5808026d33317d8701d5ec2396e9634e2918f  bats-support-0.3.0.tar.gz
+
+# License files
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-support/bats-support.mk b/package/bats-support/bats-support.mk
new file mode 100644
index 0000000000..765e08ffce
--- /dev/null
+++ b/package/bats-support/bats-support.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bats-support
+#
+################################################################################
+
+BATS_SUPPORT_VERSION = 0.3.0
+BATS_SUPPORT_SITE = $(call github,bats-core,bats-support,v$(BATS_SUPPORT_VERSION))
+BATS_SUPPORT_LICENSE = CC0-1.0
+BATS_SUPPORT_LICENSE_FILES = LICENSE
+
+define BATS_SUPPORT_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-support/src
+	$(INSTALL) -m 0755 $(@D)/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-support
+	$(INSTALL) -m 0755 $(@D)/src/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-support/src
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
