Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5790C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 15:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B8C840B84;
	Fri, 31 May 2024 15:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emrMhs1qe3OL; Fri, 31 May 2024 15:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB8574172F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB8574172F;
	Fri, 31 May 2024 15:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32A8A1D54A5
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B78F40B75
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1cHm7QDaHgU for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 15:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C9D6400DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C9D6400DC
 for <buildroot@buildroot.org>; Fri, 31 May 2024 15:34:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27AD382B92; Fri, 31 May 2024 15:34:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 17:17:34 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a513846df7cbc6f2390bf0dbc23bbccbb7980474
X-Git-Newrev: a103e3dca826c8cbdd512308db03b0f30b66067f
X-Patchwork-Hint: ignore
Message-Id: <20240531153404.27AD382B92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 ethtool runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=a103e3dca826c8cbdd512308db03b0f30b66067f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0623c53054e478bf6faa68a3b95e4e6ae0a84ee0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_ethtool.py      | 71 ++++++++++++++++++++++
 .../package/test_ethtool/linux-e1000e.fragment     |  1 +
 3 files changed, 74 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6a1ec436ff..cc9bac809b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1772,6 +1772,8 @@ F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
+F:	support/testing/tests/package/test_ethtool.py
+F:	support/testing/tests/package/test_ethtool/
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
diff --git a/support/testing/tests/package/test_ethtool.py b/support/testing/tests/package/test_ethtool.py
new file mode 100644
index 0000000000..7a2627c6e9
--- /dev/null
+++ b/support/testing/tests/package/test_ethtool.py
@@ -0,0 +1,71 @@
+import os
+
+import infra.basetest
+
+
+class TestEthtool(infra.basetest.BRTest):
+    # This ethtool test uses an emulated Intel e1000e adapted (which
+    # is well supported by Qemu, the Kernel and ethtool). We are not
+    # using the usual virtio_net because it's not supporting some
+    # ethtool features like adapter testing. For that reason, we need
+    # to compile a Kernel.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_ethtool/linux-e1000e.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_PACKAGE_ETHTOOL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-netdev", "user,id=test_net",
+                                    "-net", "nic,model=e1000e,netdev=test_net",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # We check the program can run.
+        self.assertRunOk("ethtool --version")
+
+        # We check a simple query runs correctly.
+        self.assertRunOk("ethtool eth0")
+
+        # We query the driver name and check it's the expected e1000e.
+        out, ret = self.emulator.run("ethtool -i eth0")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "driver: e1000e")
+
+        # We request an adapter online self test.
+        self.assertRunOk("ethtool -t eth0 online", timeout=30)
+
+        # We query offload parameters and check TSO are enabled (this
+        # is the driver default).
+        out, ret = self.emulator.run("ethtool -k eth0")
+        self.assertEqual(ret, 0)
+        self.assertIn("tcp-segmentation-offload: on", out)
+
+        # We request to disable TSO.
+        self.assertRunOk("ethtool -K eth0 tcp-segmentation-offload off")
+
+        # We check again. TSO should now be disabled.
+        out, ret = self.emulator.run("ethtool -k eth0")
+        self.assertEqual(ret, 0)
+        self.assertIn("tcp-segmentation-offload: off", out)
diff --git a/support/testing/tests/package/test_ethtool/linux-e1000e.fragment b/support/testing/tests/package/test_ethtool/linux-e1000e.fragment
new file mode 100644
index 0000000000..cc3fe0047e
--- /dev/null
+++ b/support/testing/tests/package/test_ethtool/linux-e1000e.fragment
@@ -0,0 +1 @@
+CONFIG_E1000E=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
