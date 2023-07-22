Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F7EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 16:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 293F340181;
	Sat, 22 Jul 2023 16:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 293F340181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3LAlDGPoMxi; Sat, 22 Jul 2023 16:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC4740ACB;
	Sat, 22 Jul 2023 16:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CC4740ACB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8761BF3A3
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 16:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7459C61455
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 16:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7459C61455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCO01CvtvSnO for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 16:17:19 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CDF66144B
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 16:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDF66144B
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B7F7B13F892;
 Sat, 22 Jul 2023 18:17:14 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 18:17:08 +0200
Message-ID: <20230722161708.402598-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690042636;
 bh=RGbMYvEQovHgIYO5DCSMtb/WmVE+3jTopcDNlFElTE8=;
 h=From:To:Cc:Subject:Date:From;
 b=KcdUX2QD5INpS+s4rMw/eAPVc9aa8owV/1ER654stGYtWdlOSGBJOG9l07QwnGzC7
 T2UmAvg3f8HI59S/Q0/7YCxcPA9piC33oxFzCEVbzFSxavGNs25oh69Sn+aXIiOVN8
 yKjIJ6ExakNXa8P/7lZFc0w3YQruEnIsN6Nw1oE5hc7DUfQ+s6tYsj/0NUVmDxu1Rr
 JlBCx3PWrNKy5mDkl555vptGSQYzHNLnlnoLcYt9SETnu+XgEaGjclkusFyE7mNJNv
 C25wXEYyUdDedNFYiuc3xJUT96eHTZn+MctBR+sIJNbrUAwLoMD4Wah8IWdAmXW9Mx
 86Jb5mQo9nVCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KcdUX2QD
Subject: [Buildroot] [PATCH 1/1]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This test was suggested by Thomas in [1].
This test fails without the patch proposed in [2].

[1] https://lists.buildroot.org/pipermail/buildroot/2023-July/670933.html
[2] https://patchwork.ozlabs.org/project/buildroot/patch/1689767858-17206-1-git-send-email-gwenj@trabucayre.com/
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_gnuradio.py    | 42 ++++++++++++
 .../rootfs-overlay/root/test_gnuradio.py      | 68 +++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 support/testing/tests/package/test_gnuradio.py
 create mode 100755 support/testing/tests/package/test_gnuradio/rootfs-overlay/root/test_gnuradio.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 01050ebf59..ced22151a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1740,6 +1740,8 @@ F:	support/testing/tests/package/test_ddrescue/
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
