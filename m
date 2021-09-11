Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646F6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:53:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F12610C9
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3F12610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76BC060757;
	Sat, 11 Sep 2021 12:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiU-IUW5Zohi; Sat, 11 Sep 2021 12:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAAB5607BA;
	Sat, 11 Sep 2021 12:53:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB1B1BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84EAA607BA
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-ZwM-HxpePn for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E15060757
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:53:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 91A7888F3B; Sat, 11 Sep 2021 12:51:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 14:52:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccda2f4bdc97d2f5a4a1efdb357ece8e5b57e10d
X-Git-Newrev: 5ec9542415c92584fe0b986feea6326375bd63b6
X-Patchwork-Hint: ignore
Message-Id: <20210911125132.91A7888F3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/fs: test OCI format
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ec9542415c92584fe0b986feea6326375bd63b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds runtime testing of the OCI archive created by the
sloci scripting. It launches a containerd instance, imports, and
runs the OCI container.

The existing QEMU AARCH64 kernel config was extended to enable common
options used by a container runtime (cgroup and overlayfs).

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
[Arnout: adapt file name which is arm64 now; add to DEVELOPERS]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                           |  1 +
 board/qemu/aarch64-virt/linux.config |  6 ++++
 support/testing/tests/fs/test_oci.py | 57 ++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8473f51726..abb54aa41c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1846,6 +1846,7 @@ F:	package/wpa_supplicant/
 F:	package/wireless_tools/
 F:	package/xen/
 F:	package/xml-security-c/
+F:	support/testing/tests/fs/test_oci.py
 F:	support/testing/tests/package/br2-external/openjdk/
 F:	support/testing/tests/package/test_openjdk.py
 F:	support/testing/tests/package/test_opkg/
diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 02e0812ffd..e3a4a92913 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -3,6 +3,11 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_TASKSTATS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_VEXPRESS=y
@@ -62,5 +67,6 @@ CONFIG_ARM_SMMU_V3=y
 CONFIG_EXT4_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_VIRTIO_FS=y
+CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
new file mode 100644
index 0000000000..347332f30d
--- /dev/null
+++ b/support/testing/tests/fs/test_oci.py
@@ -0,0 +1,57 @@
+import os
+import shutil
+import infra.basetest
+
+
+class TestOci(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.61"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_CGROUPFS_MOUNT=y
+        BR2_PACKAGE_CONTAINERD=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
+        BR2_TARGET_ROOTFS_OCI=y
+        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="df"
+        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="-h"
+        BR2_TARGET_ROOTFS_OCI_ARCHIVE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda", "console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-drive", "file={},format=raw,if=virtio".format(rootfs)])
+        self.emulator.login()
+
+    def place_test_oci(self):
+        shutil.copy(os.path.join(self.builddir, 'images', 'rootfs-oci-latest-arm64-linux.oci-image.tar'),
+                    os.path.join(self.builddir, 'target', 'oci.tar'))
+        # rebuild to make sure oci.tar ends up in rootfs.ext2
+        self.b.build()
+
+    def test_run(self):
+        self.place_test_oci()
+        self.login()
+
+        cmd = "containerd &"
+        self.assertRunOk(cmd)
+
+        cmd = "ctr image import --base-name buildroot-test /oci.tar"
+        self.assertRunOk(cmd, timeout=120)
+
+        cmd = "ctr run --rm --tty buildroot-test:latest v1"
+        self.assertRunOk(cmd, timeout=120)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
