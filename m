Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197B7C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6AF64381F;
	Wed, 10 Jan 2024 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6AF64381F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUKFuRwfPoDy; Wed, 10 Jan 2024 20:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6130343826;
	Wed, 10 Jan 2024 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6130343826
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7F291BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9153B416C6
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9153B416C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDgA9RhNzMLR for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:23:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35ACD416AE
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35ACD416AE
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 524A213F89C;
 Wed, 10 Jan 2024 21:23:32 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:23:19 +0100
Message-ID: <20240110202319.139004-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704918216;
 bh=/fLDrNj6u8asghqTrGF9PNyKGJZtltPhE5mHuJe0NSY=;
 h=From:To:Cc:Subject:Date:From;
 b=NKqaeS05SIg7DXsrJEJfNtDN0e91S/YdFWruoS4WdC6JqArJjH6l4n+G75b3EB2eR
 VqHUIcLAPfQt7BNZLgKUN1Hu2VCRUD0Omw2SErvK1I6EEiTghYcFhD6KjDHe/S7x2Q
 M9iEdv3OFjkCz6fkv0WwpvN+MYShN7WR3WN4xCFhz8ntzi5hAVrIHGpcGOgLbYTHqd
 65Gpafk31QBq95wnZ7nAv3jACnbV+EeYxThCUqI5JV/gWkOC2W20hwn9/4Xnydcd4W
 p5VgtFQPq/7cUJ8k+sgtd/+7f7B7DCTCJwiX+fkMZh20PwG5I/L0WBGIoOTHUnjxP+
 sdJ7ps+G+CQVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NKqaeS05
Subject: [Buildroot] [PATCH RFC 1/1] support/testing: add python-pyqt5 test
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
Cc: Julien Olivain <ju.o@free.fr>, Ralf Dragon <hypnotoad@lindra.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Few notes:

This runtime test was suggested by Thomas in:
https://lists.buildroot.org/pipermail/buildroot/2023-December/681113.html

In order to work, the patch
https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-2-hypnotoad@lindra.de/
needs to be also applied.

I tested this patch on branch master at commit 22393c9 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_pyqt5
    ...
    OK

Doing this test, I've spotted few issues:

The test needs to select BR2_PACKAGE_QT5BASE_WIDGETS=y
otherwise, the build fails. I believe this is a missing build
dependency in python-pyqt5 (to be confirmed).

Also, Qt5 no longer ships fonts. So the test application runs
without any text. It shows a warning on the console:

    QFontDatabase: Cannot find font directory /usr/lib/fonts.
    Note that Qt no longer ships fonts. Deploy some (from https://dejavu-fonts.github.io/ for example) or switch to fontconfig.

It's not a real problem for the test. But using
(Py)Qt5 with EGLFS directly on KMS/DRM (i.e. without X11 nor Weston)
seems a valid use-case. I was not able to install fonts without X11.
---
 DEVELOPERS                                    |  2 +
 .../tests/package/test_python_pyqt5.py        | 61 +++++++++++++++++++
 .../test_python_pyqt5/linux-vkms.fragment     |  1 +
 .../rootfs-overlay/root/pyqt5test.py          | 60 ++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_pyqt5.py
 create mode 100644 support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
 create mode 100755 support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d7543247f2..7aecb828e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1806,6 +1806,8 @@ F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_pyqt5.py
+F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
new file mode 100644
index 0000000000..6ef0577878
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -0,0 +1,61 @@
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
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_python_pyqt5/linux-vkms.fragment")}"
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
+        BR2_PACKAGE_QT5BASE_WIDGETS=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_python_pyqt5/rootfs-overlay")}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            )
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
