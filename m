Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6561C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A28C48343B;
	Sat, 22 Jul 2023 21:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A28C48343B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Wc-Xep5spbC; Sat, 22 Jul 2023 21:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59332833CE;
	Sat, 22 Jul 2023 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59332833CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2DC1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15BB460DF6
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BB460DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNxkPQ_m38xR for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:15:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C013C60D94
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C013C60D94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE4538212A; Sat, 22 Jul 2023 21:15:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:14:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e22b450692a6d02da43a453f24ec057bb5517422
X-Git-Newrev: ca3c4d0007e0a6c19c34a40642fd0fe597968b68
X-Patchwork-Hint: ignore
Message-Id: <20230722211520.AE4538212A@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_gnuradio.py: new runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca3c4d0007e0a6c19c34a40642fd0fe597968b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_gnuradio.py     | 42 +++++++++++++
 .../rootfs-overlay/root/test_gnuradio.py           | 68 ++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 469a93449a..d5ac3dd734 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1742,6 +1742,8 @@ F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_gnupg2.py
+F:	support/testing/tests/package/test_gnuradio.py
+F:	support/testing/tests/package/test_gnuradio/
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_gnuradio.py b/support/testing/tests/package/test_gnuradio.py
new file mode 100644
index 0000000000..1fc0479d21
--- /dev/null
+++ b/support/testing/tests/package/test_gnuradio.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestGnuradio(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
+    # not include: BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+    # needed by gnuradio
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.39"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_GNURADIO=y
+        BR2_PACKAGE_GNURADIO_BLOCKS=y
+        BR2_PACKAGE_GNURADIO_PYTHON=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add a gnuradio python test script
+           infra.filepath("tests/package/test_gnuradio/rootfs-overlay"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M", "-initrd", img])
+        self.emulator.login()
+
+        self.assertRunOk("/root/test_gnuradio.py", timeout=30)
diff --git a/support/testing/tests/package/test_gnuradio/rootfs-overlay/root/test_gnuradio.py b/support/testing/tests/package/test_gnuradio/rootfs-overlay/root/test_gnuradio.py
new file mode 100755
index 0000000000..4b63674533
--- /dev/null
+++ b/support/testing/tests/package/test_gnuradio/rootfs-overlay/root/test_gnuradio.py
@@ -0,0 +1,68 @@
+#! /usr/bin/env python3
+
+from gnuradio import blocks
+from gnuradio import gr
+
+INPUT_LENGTH = 100
+MUL_CONST = 3
+ADD_CONST = 5
+
+
+def compute_expected_data(input_data):
+    # demux input
+    even = input_data[::2]
+    odd = input_data[1::2]
+
+    # multiply "even" list by MUL_CONST
+    even = [x * MUL_CONST for x in even]
+
+    # add 5 to all "odd" elements
+    odd = [y + ADD_CONST for y in odd]
+
+    # mux the two lists
+    mux = [v for t in zip(even, odd) for v in t]
+
+    return mux
+
+
+def main():
+
+    gr.log.info("Starting Buildroot Test for GNU Radio " + gr.version())
+
+    input_data = list(range(INPUT_LENGTH))
+
+    tb = gr.top_block()
+
+    # Create Gnuradio Blocks
+    src = blocks.vector_source_i(input_data)
+    demux = blocks.deinterleave(gr.sizeof_int)
+    mul = blocks.multiply_const_ii(MUL_CONST)
+    add = blocks.add_const_ii(ADD_CONST)
+    mux = blocks.interleave(gr.sizeof_int)
+    sink = blocks.vector_sink_i()
+
+    # Create connection in top block
+    tb.connect(src, demux)
+    tb.connect((demux, 0), mul)
+    tb.connect((demux, 1), add)
+    tb.connect(mul, (mux, 0))
+    tb.connect(add, (mux, 1))
+    tb.connect(mux, sink)
+
+    tb.run()
+
+    gnuradio_data = sink.data()
+    expected_data = compute_expected_data(input_data)
+
+    # For easy debugging
+    if gnuradio_data != expected_data:
+        print("Gnuradio output:", gnuradio_data)
+        print("Expected output:", expected_data)
+
+    assert gnuradio_data == expected_data
+
+    gr.log.info("Test PASSED")
+
+
+if __name__ == "__main__":
+    main()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
