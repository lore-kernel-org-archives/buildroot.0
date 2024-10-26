Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F4ED10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67354405E9;
	Sat, 26 Oct 2024 13:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1gknMJvvFA1; Sat, 26 Oct 2024 13:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9746E40586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9746E40586;
	Sat, 26 Oct 2024 13:16:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 506F85C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40C7480AB1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLrGyZcECOdT for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBED80B20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DBED80B20
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:16:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07A4B83AA8; Sat, 26 Oct 2024 13:16:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:13:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba09a448f1e2e3b3123384ddddeb62d18bfa9461
X-Git-Newrev: d8c2c2cb57b87035908e234c0fc2127a34cfcf0d
X-Patchwork-Hint: ignore
Message-Id: <20241026131611.07A4B83AA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add python-pyqt5 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8c2c2cb57b87035908e234c0fc2127a34cfcf0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_python_pyqt5.py | 79 ++++++++++++++++++++++
 .../package/test_python_pyqt5/linux-vkms.fragment  |  1 +
 .../rootfs-overlay/root/pyqt5test.py               | 60 ++++++++++++++++
 4 files changed, 142 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b22b5298b6..409642f96f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1967,6 +1967,8 @@ F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_mpmath.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_pyqt5.py
+F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_python_sympy.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
new file mode 100644
index 0000000000..5f1952b559
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -0,0 +1,79 @@
+import os
+
+import infra.basetest
+
+
+class TestPythonPyQt5(infra.basetest.BRTest):
+    # We use a specific configuration for:
+    # - using Aarch64, to have more than 256MB memory,
+    # - using a kernel config fragment, to enable VKMS,
+    # - to have an ext4 rootfs image exposed as a virtio storage
+    #   (rather than cpio initrd). This will save some memory, as the
+    #   rootfs image is big.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_python_pyqt5/linux-vkms.fragment")
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_python_pyqt5/rootfs-overlay")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_PACKAGE_DEJAVU=y
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYQT5=y
+        BR2_PACKAGE_QT5=y
+        BR2_PACKAGE_QT5BASE_EGLFS=y
+        BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+        BR2_PACKAGE_QT5BASE_WIDGETS=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # We run the test application with a customized message.
+        # NOTE: to manually debug this test, a Qemu emulator with
+        # virtio-gpu can be used by starting it the command line from
+        # the run log generated by this test, and by adding the
+        # arguments "-device virtio-gpu -display gtk". With this, the
+        # test application will be observable on the Qemu window. Once
+        # logged, we can use the "card1" DRM/KMS device (virtio-gpu,
+        # instead of card0, which is vkms on "card0") by using the
+        # command:
+        #     echo '{"device":"/dev/dri/card1"}' > cfg.json
+        #     export QT_QPA_EGLFS_KMS_CONFIG="$PWD/cfg.json"
+        # The Qt debug can also be enabled with the command:
+        #     export QT_LOGGING_RULES=*=true
+        # Then, run the /root/pyqt5test.py application.
+        msg = "Hello Buildroot."
+        cmd = f'/root/pyqt5test.py "{msg}"'
+        self.assertRunOk(cmd, timeout=30)
+
+        # We check the test message is present in the file created by
+        # the previous application execution.
+        cmd = f'grep -F "{msg}" /root/message.txt'
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment b/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
new file mode 100644
index 0000000000..ec2ed4460c
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
@@ -0,0 +1 @@
+CONFIG_DRM_VKMS=y
diff --git a/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py b/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
new file mode 100755
index 0000000000..3efeed7687
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
@@ -0,0 +1,60 @@
+#! /usr/bin/env python3
+#
+# This is a test application for PyQt5. It is showing a text label and
+# a "quit" button. The text of the label can be set with the first
+# (non-Qt) command line argument. A timer will send a click signal to
+# the quit button after 3 seconds. When quitting, the text of the
+# label is saved in a "message.txt" file in the current working
+# directory.
+
+import sys
+
+from PyQt5.QtCore import PYQT_VERSION_STR, QFile, QIODevice, QT_VERSION_STR, QTextStream, QTimer, Qt
+from PyQt5.QtWidgets import QApplication, QLabel, QPushButton, QVBoxLayout, QWidget
+
+
+class TestApp(QWidget):
+
+    def __init__(self, message, parent=None):
+        super(TestApp, self).__init__(parent)
+
+        self.label = QLabel(message)
+        self.label.setAlignment(Qt.AlignCenter)
+
+        self.button = QPushButton("Quit")
+        self.button.clicked.connect(self.on_button_clicked)
+
+        self.layout = QVBoxLayout()
+        self.layout.addWidget(self.label)
+        self.layout.addWidget(self.button)
+
+        self.setLayout(self.layout)
+
+        self.timer = QTimer()
+        self.timer.timeout.connect(self.button.click)
+
+    def on_button_clicked(self):
+        self.save_message()
+        app.quit()
+
+    def save_message(self):
+        f = QFile("message.txt")
+        if f.open(QIODevice.WriteOnly):
+            QTextStream(f) << (self.label.text() + '\n')
+        f.close()
+
+
+if __name__ == "__main__":
+    print("PyQt5 test for Buildroot")
+    print(f"Qt version {QT_VERSION_STR}")
+    print(f"PyQt version {PYQT_VERSION_STR}")
+
+    msg = "Hello World"
+    app = QApplication(sys.argv)
+    args = app.arguments()
+    if len(args) > 1:
+        msg = args[1]
+    testApp = TestApp(message=msg)
+    testApp.show()
+    testApp.timer.start(3000)
+    sys.exit(app.exec())
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
