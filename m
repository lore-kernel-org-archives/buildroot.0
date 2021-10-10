Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C21C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3D0604AC
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA3D0604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBD682813;
	Sun, 10 Oct 2021 17:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlWUma70Z6D0; Sun, 10 Oct 2021 17:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D911D82835;
	Sun, 10 Oct 2021 17:41:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF811BF976
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D22360669
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StrWZ7j28CAW for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:41:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 029BA605FD
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:41:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5C69E94C62; Sun, 10 Oct 2021 17:39:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 19:41:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b2a5cd386301f16959f880a81e2418ae3182171
X-Git-Newrev: 1ea0ae0349dfb905ba8c4a91d43882a12f73b123
X-Patchwork-Hint: ignore
Message-Id: <20211010173900.5C69E94C62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add suite of tests for gdb
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ea0ae0349dfb905ba8c4a91d43882a12f73b123
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The list of tests is as follows:

TestGdbHostOnlyDefault: build just minimal host-gdb, default version

TestGdbHostOnlyAllFeatures: build host-gdb, default version, with all
features enabled (TUI, Python, simulator)

TestGdbserverOnly: build just target gdbserver, default version

TestGdbFullTarget: build just target gdb, default version

TestGdbHostOnly9x: build minimal host-gdb, 9.x version

TestGdbHostGdbserver9x: build minimal host-gdb 9.x + gdbserver

TestGdbHostGdbTarget9x: build minimal host-gdb 9.x + full gdb

TestGdbHostOnly11x: build minimal host-gdb, 11.x version

TestGdbHostGdbserver11x: build minimal host-gdb 11.x + gdbserver

TestGdbHostGdbTarget11x: build minimal host-gdb 11.x + gdb

TestGdbArc: build minimal host-gdb + gdb + gdbserver, for the special
ARC architecture version

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_gdb.py | 215 ++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
new file mode 100644
index 0000000000..a7b0870644
--- /dev/null
+++ b/support/testing/tests/package/test_gdb.py
@@ -0,0 +1,215 @@
+import os
+import infra.basetest
+
+
+class BaseGdb(infra.basetest.BRTest):
+    def verify_host_gdb(self, prefix="arm-linux"):
+        cmd = ["host/bin/%s-gdb" % prefix, "--version"]
+        # We don't check the return value, as it automatically raises
+        # an exception if the command returns with a non-zero value
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+    def boot(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img,
+                                    "-net", "nic",
+                                    "-net", "user"])
+        self.emulator.login()
+
+    def verify_gdbserver(self):
+        cmd = "gdbserver --version"
+        self.assertRunOk(cmd)
+
+    def verify_gdb(self):
+        cmd = "gdb --version"
+        self.assertRunOk(cmd)
+
+
+class TestGdbHostOnlyDefault(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbHostOnlyAllFeatures(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_PACKAGE_HOST_GDB_TUI=y
+        BR2_PACKAGE_HOST_GDB_PYTHON3=y
+        BR2_PACKAGE_HOST_GDB_SIM=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbserverOnly(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_GDB=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.boot()
+        self.verify_gdbserver()
+
+
+class TestGdbFullTarget(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.boot()
+        self.verify_gdb()
+
+
+class TestGdbHostOnly9x(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_9_2=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbHostGdbserver9x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_9_2=y
+        BR2_PACKAGE_GDB=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdbserver()
+
+
+class TestGdbHostGdbTarget9x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_9_2=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdb()
+
+
+class TestGdbHostOnly11x(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_11=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbHostGdbserver11x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_11=y
+        BR2_PACKAGE_GDB=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdbserver()
+
+
+class TestGdbHostGdbTarget11x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_11=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdb()
+
+
+class TestGdbArc(BaseGdb):
+    config = \
+        """
+        BR2_arcle=y
+        BR2_archs4x_rel31=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_SERVER=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb("arc-linux")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
