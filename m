Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA8FC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 002338406D;
	Tue, 18 Mar 2025 15:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLJ1Gtz7iy5f; Tue, 18 Mar 2025 15:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F05784070
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F05784070;
	Tue, 18 Mar 2025 15:06:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BF60D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7DC640901
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7PCi0IQZhqA for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52D0340D4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52D0340D4B
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 500E584755; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:09:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1add224622319a7c5dc66b073dba0faef98b420
X-Git-Newrev: 5c77357c580f84e5a2986a4155e0cfd194c44b70
X-Patchwork-Hint: ignore
Message-Id: <20250318150245.500E584755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: add target variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c77357c580f84e5a2986a4155e0cfd194c44b70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Skopeo can be used to manipulate container images, and so can be useful
on target devices that are going to be used as a host to run containers.

So, add a target variant for skopeo.

... with a runtime test while at it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                            |  1 +
 package/skopeo/Config.in                     | 25 +++++++++++++++++
 package/skopeo/skopeo.mk                     | 10 +++++++
 support/testing/tests/package/test_skopeo.py | 41 ++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ce8cb95d7e..0c9b5bb6cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2893,6 +2893,7 @@ menu "System tools"
 	source "package/sdbusplus/Config.in"
 	source "package/seatd/Config.in"
 	source "package/shadow/Config.in"
+	source "package/skopeo/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
new file mode 100644
index 0000000000..f1acc3a50f
--- /dev/null
+++ b/package/skopeo/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SKOPEO
+	bool "skopeo"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # btrfs-progs, lvm2
+	depends on !BR2_STATIC_LIBS  # lvm2
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_BTRFS_PROGS
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LVM2
+	help
+	  skopeo is a command line utility that performs various
+	  operations on container images and image repositories.
+
+	  https://github.com/containers/skopeo
+
+comment "skopeo needs a toolchain w/ threads, sahred libs"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 8e3a302e8d..b3b213983f 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -11,13 +11,23 @@ SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE
 SKOPEO_CPE_ID_VALID = YES
 
+SKOPEO_DEPENDENCIES = \
+	host-pkgconf \
+	btrfs-progs \
+	libgpgme \
+	lvm2
+
 HOST_SKOPEO_DEPENDENCIES = \
 	host-btrfs-progs \
 	host-libgpgme \
 	host-lvm2 \
 	host-pkgconf
 
+SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+SKOPEO_BUILD_TARGETS = cmd/skopeo
+
 HOST_SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
 HOST_SKOPEO_BUILD_TARGETS = cmd/skopeo
 
+$(eval $(golang-package))
 $(eval $(host-golang-package))
diff --git a/support/testing/tests/package/test_skopeo.py b/support/testing/tests/package/test_skopeo.py
new file mode 100644
index 0000000000..79c3da8b3d
--- /dev/null
+++ b/support/testing/tests/package/test_skopeo.py
@@ -0,0 +1,41 @@
+import infra.basetest
+import json
+import os
+
+
+class TestSkopeo(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_SKOPEO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file, "-nic", "user,model=rtl8139"])
+        self.emulator.login()
+
+        self.assertRunOk("skopeo --version", timeout=30)
+
+        # First, check we can reach the default registry: docker.io
+        output, _ = self.emulator.run(
+            "skopeo inspect docker://busybox:latest",
+            timeout=60,
+        )
+        bb_info = json.loads("".join(output))
+        self.assertEqual(bb_info["Name"], "docker.io/library/busybox")
+
+        # Now, check we can reach an arbitrary registry: quay.io
+        output, _ = self.emulator.run(
+            "skopeo inspect docker://quay.io/quay/busybox:latest",
+            timeout=60,
+        )
+        skopeo_info = json.loads("".join(output))
+        self.assertEqual(skopeo_info["Name"], "quay.io/quay/busybox")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
