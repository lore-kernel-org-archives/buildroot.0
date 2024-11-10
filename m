Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E992D12D4F
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 19:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A58A160639;
	Sun, 10 Nov 2024 19:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlrEaXcTqc8M; Sun, 10 Nov 2024 19:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7246605DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7246605DD;
	Sun, 10 Nov 2024 19:04:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76452DB1
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63B834027D
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZzskDetnmJx for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 19:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4539540278
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4539540278
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:04:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CD6385FC3; Sun, 10 Nov 2024 19:04:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 19:33:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a842df634836b20a613cfd226e754966e0d15284
X-Git-Newrev: dc4a5acfde2b0285548f0524ab8bfb10169294f4
X-Patchwork-Hint: ignore
Message-Id: <20241110190440.3CD6385FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bfscripts: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc4a5acfde2b0285548f0524ab8bfb10169294f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bootstrap the installation of Mellanox/NVIDIA Bluefield scripts
that can be run either on the host CPU or on the onboard ARM64 CPU.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/bfscripts/Config.in      | 12 ++++++++++++
 package/bfscripts/S99bfup        | 20 ++++++++++++++++++++
 package/bfscripts/bfscripts.hash |  3 +++
 package/bfscripts/bfscripts.mk   | 28 ++++++++++++++++++++++++++++
 6 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 456ad03c18..3945803d53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3283,6 +3283,7 @@ F:	support/testing/tests/core/test_root_password.py
 N:	Vincent Jardin <vjardin@free.fr>
 F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
+F:	package/bfscripts/
 F:	package/dpdk/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 541b6a67da..1eb5e1e020 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -475,6 +475,7 @@ endmenu
 	source "package/apcupsd/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
+	source "package/bfscripts/Config.in"
 	source "package/biosdevname/Config.in"
 	source "package/brickd/Config.in"
 	source "package/brltty/Config.in"
diff --git a/package/bfscripts/Config.in b/package/bfscripts/Config.in
new file mode 100644
index 0000000000..73f55e25d8
--- /dev/null
+++ b/package/bfscripts/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BFSCRIPTS
+	bool "bfscripts"
+	depends on BR2_USE_MMU # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_BASH # runtime
+	help
+	  Collection of scripts that are used for Mellanox/NVIDIA
+	  Bluefield SoC management.
+
+	  Currently, it installs: bfcfg, bfrshlog and bfup.
+
+	  https://github.com/Mellanox/bfscripts
diff --git a/package/bfscripts/S99bfup b/package/bfscripts/S99bfup
new file mode 100644
index 0000000000..6c301993dc
--- /dev/null
+++ b/package/bfscripts/S99bfup
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# notify to the root PCIe (/dev/rshimN/misc) that Linux is up
+# and that BF3 board is ready
+
+DAEMON="bfup"
+
+case "$1" in
+	start)
+		printf "bfup: "
+		/usr/bin/$DAEMON
+		exit_code=$?
+		[ $exit_code = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	*)
+		echo "Usage: $0 {start}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/bfscripts/bfscripts.hash b/package/bfscripts/bfscripts.hash
new file mode 100644
index 0000000000..05f2966ab9
--- /dev/null
+++ b/package/bfscripts/bfscripts.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  92123fcaeb8eb9ba7f296e2457e82f56831c6fd19c1ad1a5949b7bc7d5d0a837  bfscripts-3.9.7-1.tar.gz
+sha256  ab52bc4ac5e66e42e0ce14172c4d1d40969919db98cc0e11d2f6178dcc97bf4d  LICENSE
diff --git a/package/bfscripts/bfscripts.mk b/package/bfscripts/bfscripts.mk
new file mode 100644
index 0000000000..aec788e7cb
--- /dev/null
+++ b/package/bfscripts/bfscripts.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# bfscripts
+#
+################################################################################
+
+BFSCRIPTS_VERSION = 3.9.7-1
+BFSCRIPTS_SITE = $(call github,Mellanox,bfscripts,$(BFSCRIPTS_VERSION))
+BFSCRIPTS_LICENSE = BSD-2-Clause
+BFSCRIPTS_LICENSE_FILES = LICENSE
+
+BFSCRIPTS_FILES_TO_INSTALL = \
+	bfcfg \
+	bfrshlog \
+	bfup
+
+define BFSCRIPTS_INSTALL_TARGET_CMDS
+	$(foreach f,$(BFSCRIPTS_FILES_TO_INSTALL),\
+		$(INSTALL) -D -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/bin/$(f)
+	)
+endef
+
+define BFSCRIPTS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/bfscripts/S99bfup \
+		$(TARGET_DIR)/etc/init.d/S99bfup
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
