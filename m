Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA120606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nze8JPDZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhcGdkWD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3F480E8D;
	Mon, 16 Nov 2026 21:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F0I7SCreH3C; Mon, 16 Nov 2026 21:29:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DE32780FAB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864577;
	b=Y0E0gE70/IhRcptqY7C7AJYXNTZdYR+khLlo0j5Gxd4UVnQ/mouW60CeC82wI5mZRo/f
	 hYZ6mj6Iiz5hQtkNO0EzuV+RbvnZYl9XTgz5Bpqa5JDqexwCWcKvwKJxijgQ3jGL0St61
	 XdezQv0OwT2kAPc29AeQbtlMoLjlwlKAeJsjSvck5ZdyGVb2yb1DrXbyh+jd/mBLVWgLJ
	 8f6FtHSXWaftMOvLAZjgoMGtdSRaKnzdigoi0m3XPJgKO6/rfSN5QZEgJ5b3esZbe3j57
	 N4AppCZ93V0uAGl9d5y6zVCULVvHR5Dm2sqhyD2Z2gqMzikLGsYdH2/1KaPqEbUgVMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=FFZw0NbKUlNPjIANaG79bws9P1uc329XDlk1HkN8g08=;
	b=SSREXUKiuMIo8QdKReF2A6xd7VEG7eAg1wBnMdCM948nJ+nspb8j0N5t/H+lPiBZMUDA
	 0x3LGtHakLf3Iy/uYRSA8Zbg6swkRDGTXkCD7pytvsOE0l4nPThfFh8e8pONn+w1IT9DE
	 2oAY/NCQul4aD0u3kCjhmaRUYYk1H0e9yt3DNwgdVyLu440IFJfbyUDJNLZZwWlIsbQi9
	 4YnSzoLDT2TzApMadtkV7X6WmQnCUp0ek5MJn+k/0CI9TW35YgiQdVcw8BP32Ee+BfuHv
	 PvrfB8rU8Xj1G+xguo2rp+1QixM5j/t5v1Qlz9EmTfe5aJbGAuRGR7KntU2BF/2Bxgg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864577;
	bh=FFZw0NbKUlNPjIANaG79bws9P1uc329XDlk1HkN8g08=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Nze8JPDZ2Ul7S0oZSlHReI5Ykoqv4xcdKGlPIil36Jo9Cdzx9k649/Fttnus6Mprq
	 HqaNq9eojt2K8wEWnu/M9zdWlmZQNBV8evY4UBW54xLztCBhwU6UJjky2lZDBYlc0s
	 GtkptPVSklgZNgN/F+F5bozQSjxdfBZVKbqcDJcvmSVDuYBicX7QB3e/aRbpAuR4Rf
	 DzY0oM92myRWPyE8WCK9WJ39tQrDj9YGEegeUh+spzWKXB3tTQIoU25imsIl0yKBCV
	 S6yII45luNsO4ceZoP6HkH7ssOi/xg9ZRO4rMQk4T4LkTZlHxWDqYT2iS+D8NoAeMa
	 EFq0nJMBHzllw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE32780FAB;
	Mon, 16 Nov 2026 21:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7668F109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CC2B60811
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FjOBpuguLEY for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:29:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60E71606A2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=IhcGdkWD
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60E71606A2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-49465892f7bso3259144f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864566; x=1795469366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pClaJSMBOXuOWR/trwP6loHnVDhbx+awNAQOd5SPZ9M=;
 b=IhcGdkWDdVRAwEnbBH9Cei/WCNK8PtqjjAqkaTbz0PhxQafHD0aqOKf3TcML37K3dj
 4C3SWdccKHl+dL/OuSKyvbtFcWOi2stvMcv+5kmHPynCiHYy3UPgbsydKAl31zqAl/bI
 SfWoqzpOti234sV1EqjQqTOQKGOLZPCHdMv2MR0j2mPV5V/D7NdlwNv1IwxRsArG3JNn
 mjVQiBxsBN242cWbAalOj5SOYXsCOH8yoV/pdtgk8Xj4jO/OfzyokRkvAJn3em37i7xa
 N68A6qfB4roWvjnf1cEHPVs8tsSS9ZGVjY2LRJ9HvwKp2bVnckFGBL7n4+EZNRVtNccG
 r8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864566; x=1795469366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pClaJSMBOXuOWR/trwP6loHnVDhbx+awNAQOd5SPZ9M=;
 b=KWnz257Exsltbvft2/A3oU7nOByLKMUAJuUK2e9eIC1ABE4zyJ16vXXn55hoVmtIkn
 vdJH6H6Hk8vFpAofeW/rEcGcimFE9reB8DX6MGNsVKFmjnf9KQX6x7FCk9mZAqOuI0WS
 QjO0msCQvC+EWR2xwV7OhDNdVs+dGMPIQ1imrZUk+LCY7Ucevw5MPJ+oKUy1ofvggPcb
 wKEFRsvDYvGcnYbOxoL1lqenLDCYbZztibyZfiz9fR7pLFCJkm6HcAXSlv4QK2eESK5A
 r9iwvEj6GjokMSnrG2XmkF0FC/cu8+GhIXN0L4YOhF+v6YlODGRURiYVDAUo4Cof6oEz
 8hUA==
X-Gm-Message-State: APuU4Z/QPuE1uIV7RyG5fcCUOB/+3BW+hP6auY45ww58j1V2kvrkrSpb
 DMcPwkXf18a3x7ByvnDMNx+Z3rNa2Na9cGCHg8VmZOCd0hnVvm5jjsP6bDTDS+Xe
X-Gm-Gg: AZFdTZeY6gx60FuUGv4uP7RIhCPWlTG0sScqRTs2zRVKUp/FLUkZ7c4sPvyTIKWZT7b
 Mzh92JxJJ8vXH/C+1JJRERgiC1XxHgv5pfBE+O7sF0v8NNYsVZ0+PEQWLjLTMR1kb30RfWWNM13
 sGa+y4ooZiczjeodSzyVh/zwdCRYJzZolrDjkvTO+9p1V0qXS0PWrpoZYA9r1XtNFdFec7vYWu7
 +ICoZ1NC7XMhJspPIStX5MSSKj/6TnW/U7WPx2fVsLEDqrc2RLte58nMs/smzq5WsF53R2edizz
 mUafoyzi6ZlzaCjGHUA9ctIBs9l8q+IWEQomBdYXEo5Xzsg6scDarOyhOSKMoHuhTG1zOowEtPC
 b0D1/LYrBqUnUz9M7ZmhzCNfCJ4DWa8Is63YCqRgoZSDZGqSRgW6DtC7prHGa9zGEuoVALSRLjd
 IWHFP/fPIdAPP89CepLkyL4HW8x3gdnH2JAtsllzyCBvA3PvpeLedq6DVVpKAdMzU9ayOfHls2y
 4m6TQkG7wQFeSYqFZ4JtSG6B6V0+ea+M5dR9fXXbPoBp7qKNUoEVneWFVV9YiNkqLziOnF5VzJH
 RXrNvdQNd2cueN8JYfYMGzrL3omLOrYVmkIQqvF22ddhxni29FoX
X-Received: by 2002:a05:6000:29cf:b0:48e:6159:8274 with SMTP id
 ffacd0b85a97d-49c713ae351mr17804670f8f.27.1794864566060; 
 Mon, 16 Nov 2026 13:29:26 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223a29sm24918708f8f.8.2026.11.16.13.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:29:24 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:29:13 +0100
Message-ID: <20261116212913.863975-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116212913.863975-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 5/5] support/testing: add python-matplotlib
 runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Dylan Bespalko <dylan.bespalko@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The test uses the same configuration as the python-pyside6 test: Qt6
with the offscreen platform, on an Aarch64 machine. It checks two
backends of matplotlib:

- Agg, the default one, which draws to PNG and SVG files;
- QtAgg, the Qt backend, which must find the PySide6 bindings.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - New patch: a runtime test of matplotlib with Qt6, based on the
    python-pyside6 test

 DEVELOPERS                                    |  2 +
 .../tests/package/sample_python_matplotlib.py | 39 +++++++++++++++
 .../tests/package/test_python_matplotlib.py   | 48 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_matplotlib.py
 create mode 100644 support/testing/tests/package/test_python_matplotlib.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 14aac54303..5fb0c78b80 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -265,7 +265,9 @@ F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
 F:	package/uthash/
+F:	support/testing/tests/package/sample_python_matplotlib.py
 F:	support/testing/tests/package/sample_python_pyside6.py
+F:	support/testing/tests/package/test_python_matplotlib.py
 F:	support/testing/tests/package/test_python_pyside6.py
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
diff --git a/support/testing/tests/package/sample_python_matplotlib.py b/support/testing/tests/package/sample_python_matplotlib.py
new file mode 100644
index 0000000000..beb84da680
--- /dev/null
+++ b/support/testing/tests/package/sample_python_matplotlib.py
@@ -0,0 +1,39 @@
+import os
+
+import matplotlib
+
+
+def plot(name):
+    import matplotlib.pyplot as plt
+    fig, ax = plt.subplots()
+    ax.plot([1, 2, 3], [1, 4, 9])
+    fig.canvas.draw()
+    fig.savefig(name)
+    assert os.path.getsize(name) > 0
+    return fig
+
+
+def test_agg():
+    # The default backend, with no display
+    matplotlib.use("Agg")
+    fig = plot("/tmp/plot.png")
+    assert type(fig.canvas).__name__ == "FigureCanvasAgg"
+    plot("/tmp/plot.svg")
+
+
+def test_qtagg():
+    # Without DISPLAY, matplotlib takes the system for headless, and
+    # refuses the Qt backend. With a QApplication running, it accepts it.
+    from PySide6.QtWidgets import QApplication
+    app = QApplication([])
+    matplotlib.use("QtAgg")
+    from matplotlib.backends.qt_compat import QT_API
+    assert QT_API == "PySide6"
+    fig = plot("/tmp/plot-qt.png")
+    assert type(fig.canvas).__name__ == "FigureCanvasQTAgg"
+    QApplication.shutdown(app)
+
+
+if __name__ == "__main__":
+    test_agg()
+    test_qtagg()
diff --git a/support/testing/tests/package/test_python_matplotlib.py b/support/testing/tests/package/test_python_matplotlib.py
new file mode 100644
index 0000000000..de07c1975b
--- /dev/null
+++ b/support/testing/tests/package/test_python_matplotlib.py
@@ -0,0 +1,48 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+# gitlab-runner: 2xlarge
+class TestPythonPy3MatplotlibQt6(TestPythonPackageBase):
+    __test__ = True
+    # The same configuration as the python-pyside6 test:
+    # - Aarch64, to have more than 256 MB of memory;
+    # - an ext4 root filesystem on a virtio disk, not a cpio initrd.
+    #   The image is big, and this saves memory.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_QT6=y
+        BR2_PACKAGE_QT6BASE_DEFAULT_QPA="offscreen"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MATPLOTLIB=y
+        BR2_PACKAGE_PYTHON_MATPLOTLIB_QT=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_matplotlib.py"]
+    timeout = 60
+
+    def login(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
