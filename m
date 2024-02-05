Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56861C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1223E41AFD;
	Mon,  5 Feb 2024 15:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1223E41AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMfjreu_ze5a; Mon,  5 Feb 2024 15:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3D841A84;
	Mon,  5 Feb 2024 15:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C3D841A84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5C8B1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC1C982BFD
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC1C982BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baB_sdSW-jfP for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:13:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B355682ADD
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B355682ADD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97F5286D07; Mon,  5 Feb 2024 15:13:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 16:12:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20b622fd05785906cd8bf6bfd8348cc52830cfb5
X-Git-Newrev: 0f50c4cd2b72b8a04600e525e9d848df0ad42e14
X-Patchwork-Hint: ignore
Message-Id: <20240205151304.97F5286D07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add pciutils runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f50c4cd2b72b8a04600e525e9d848df0ad42e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_pciutils.py | 83 ++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ebc1af84cb..31496cbcc6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1804,6 +1804,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
+F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_python_distro.py
diff --git a/support/testing/tests/package/test_pciutils.py b/support/testing/tests/package/test_pciutils.py
new file mode 100644
index 0000000000..3221b0cfd1
--- /dev/null
+++ b/support/testing/tests/package/test_pciutils.py
@@ -0,0 +1,83 @@
+import os
+
+import infra.basetest
+
+
+class TestPCIUtils(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PCIUTILS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+
+        # Note: we add a qemu pci-testdev in order to have a stable
+        # device ID, and for writing in configuration space without
+        # interfering with the rest of the emulation. See:
+        # https://www.qemu.org/docs/master/specs/pci-testdev.html
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file,
+                                    "-device", "pci-testdev"])
+        self.emulator.login()
+
+        # Check the program executes. This test also check that we
+        # have "lspci" from the pciutils package, rather than the
+        # busybox applet (which does not recognize the --version
+        # option)"
+        self.assertRunOk("lspci --version")
+
+        # Check few program invocations.
+        self.assertRunOk("lspci")
+        for lspci_opt in ["-t", "-n", "-v", "-vv", "-x"]:
+            self.assertRunOk(f"lspci {lspci_opt}")
+
+        # Check we can see the qemu pci-testdev.
+        # Vendor: 1b36: Red Hat, Inc.
+        # Device: 0005: QEMU PCI Test Device
+        pci_vendor_id = "1b36"
+        pci_device_id = "0005"
+        pci_dev = f"{pci_vendor_id}:{pci_device_id}"
+        cmd = f"lspci -d {pci_dev}"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("Red Hat, Inc.", output[0])
+        self.assertIn("QEMU PCI Test Device", output[0])
+
+        # We disable INTx emulation by setting bit 10 of the COMMAND
+        # register in the configuration space. See:
+        # https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/lib/header.h?h=v3.10.0#n26
+        dis_int_x = 0x400
+        data_mask = f"{hex(dis_int_x)}:{hex(dis_int_x)}"
+        cmd = f"setpci -d {pci_dev} COMMAND.w={data_mask}"
+        self.assertRunOk(cmd)
+
+        # We read back and check the value.
+        cmd = f"setpci -d {pci_dev} COMMAND.w"
+        output, exit_code = self.emulator.run(cmd)
+        read_value = int(output[0], 16)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue((read_value & dis_int_x) == dis_int_x)
+
+        # We check lspci now see the disabled INTx emulation.
+        cmd = f"lspci -vv -d {pci_dev} | grep -F 'DisINTx+'"
+        self.assertRunOk(cmd)
+
+        # We re-enable the INTx emulation by clearing the bit 10.
+        data_mask = f"0x0:{hex(dis_int_x)}"
+        cmd = f"setpci -d {pci_dev} COMMAND.w={data_mask}"
+        self.assertRunOk(cmd)
+
+        # We read back and check the value, again.
+        cmd = f"setpci -d {pci_dev} COMMAND.w"
+        output, exit_code = self.emulator.run(cmd)
+        read_value = int(output[0], 16)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue((read_value & dis_int_x) == 0)
+
+        # We check lspci now see the enabled INTx emulation.
+        cmd = f"lspci -vv -d {pci_dev} | grep -F 'DisINTx-'"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
