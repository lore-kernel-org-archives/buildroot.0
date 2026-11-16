Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB569606A339
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c5XpGLiw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luRJ21gf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8958C80C94;
	Mon, 16 Nov 2026 21:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fURgCeYXsb0O; Mon, 16 Nov 2026 21:36:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F23AA810EA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864992;
	b=sOU5rKIlM9DWSVF5iHAXG+/3dLEijAOGZhEg6A9e/VN5d4s/nHOfIhjp/lt2H1NHuDOT
	 ONYMibyIrZ9dvG8Ypr4Vqq4RseoZavwjKuUVqzOHmuxt4TP1bi9d/wyGQcHcxpY2Jw6IK
	 /rep/p+6zUKqoKPLw1Qw+lU6QJ3+/A3tph1We2tPJEcR9KmPgfCHBjSX630WGOsPVSVU5
	 uwCpz2NFGXKRvC0AwxKiGlHXz5m75BTzwTdHtnttjc1R9cOXGxtKoTkX7j4CHkCg/vXvD
	 qjL0jxQ+L6cRrvofVgP3KJevmlK26ffwrTkfqMLjEGQosTWPL1nCAd+Qa1g2KHDDT1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864992;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=dfALhBNrUmqEEQqGPrvPzRs/AjQ+GgmFpmC14RypNks=;
	b=DBqMAgJbBzJDJF4N/0q7uMSqb/iUlk7NTcYPXhuzSp2cNDUaTJq2Gau4aJq9ZePWdigE
	 ZENIuJBcV/9Nr5ucVxSGIQ+zeuez5EVzdr40IWsR0Z1lR6g+ayXpgWB3IlHNY6E2ZHwfm
	 hBA9IHAUvAL1hXLX9Yjc2GaiaCM5xSEI2ufYAsi7cmyBtg6NVZ0PXIUgfIQoKIA+v6ZXL
	 gaCaXULZDIxJzV8uYVCKqREXpMJ9SLxF5jxMqCEFCNwE3xf6/E3aJXfFCUMIcLIJOJFqQ
	 SfeNAa+2dESLljTPeAwlq9NDjgQ2wmGrtFKOeGplmns9p3jnyA4zFZY2GrCL9uoot7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864992;
	bh=dfALhBNrUmqEEQqGPrvPzRs/AjQ+GgmFpmC14RypNks=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=c5XpGLiwUI2ScuxTHBuccjDCnHfK9xqrP8vSTHXi3bIBDHo8JkAnMXafLElRPft8I
	 ZzuodDFUhO+3LcO0NTx9QicIuJ+rxzh4PyZaEHQhIey1VedO/1gEsWYVPd5wb3HJWZ
	 8F2DWiR60zqiUU70VITCsaQ9yCo7lTucwgRgIaCeQeNaNdyzgKto/vO4MfyiZz/FHE
	 N7MS63h0bIlhv/Z/XBBxjqaEzPoJj37T9G8SuZcraKiRezWk45YlGr+YDJ5DD5n9Xu
	 ds21x1U0HkWmA+SaGv7VU5tV7OlsECtH/JJ2rpIqwiQQ9NcGKVIP5PyoAijzhawLyM
	 1tsHYhej98q1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F23AA810EA;
	Mon, 16 Nov 2026 21:36:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5043949B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4255C40612
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxUAlYnRr0xE for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:36:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 390F940606
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=luRJ21gf
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 390F940606
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso41100335e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864985; x=1795469785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HYlLcjR7Ym6YoJl9P4h+OtcNZnELgDL0nvz7YJGR0RA=;
 b=luRJ21gfn6T0D+s4T5dT2f5fGgIgMSqhkizv3yaz/DpkHbdAtOUTjAOC6ordO3ryuG
 s1MRkBjx4REXlnJRTO3I53EIVKYdeSoaFGwluBorQpRt+HnsTur5s8C6TDDiBKYX9GOJ
 IAfY93Vk2WOh8fci344Towok3awGyvr2xuWevzHuQwPQ2uy6NpziIAaoKNxf3R7kLzSv
 vuXgaLC8Ci+Zj9VfCz8pp3XUWcaKGOnTJ6FI2wOMjpPv2J8NyFTNgI6bFQe5/SKuyUam
 +dhodNyAWnnhKQSmmfZd2WgY7KVL1H8aFS9QsKQF0NrjYYya1D0+ffdFC+nD4LUcF91+
 38/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864985; x=1795469785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HYlLcjR7Ym6YoJl9P4h+OtcNZnELgDL0nvz7YJGR0RA=;
 b=njfPUIcwkqsbdc1iZibNgSXHzFP1XZs/nZ2BfiqHMhuyl6mTo9QlcmNAN1owhoMGIj
 1+qlNMXRQlItb6tPtc3MxBhJUavmB7q73HN2MLqf2ZGgBMjGHTVICX7HqKVvCreJlt21
 KrJkUFZAZ4TiA6pAyFaeq/u2/VZSF6W4UYiVY36Gc9006wXDi4p2zGFif5nwQBZJ9Gv5
 ZpRmVelyCkQH1GbAoZ3jXHjufPlKDHEHYXSJmZ+tN9WGb9N9WgbBPltn0YdUQVrxAQXs
 iGvtoukda98Hxj0OMm07gAexwoRSGaVwq5h9SbSh9GUt+E6jASNCBD55wzxz+cHVrYuf
 kcxw==
X-Gm-Message-State: APuU4Z/kF+yGDD41DTzzCeqJjXZUxEj4YDINtnjc2ztJPSPR7P1x03kT
 EB8L43rdZXhfBHcpbJ/zyj+V5VSpLhEPVpOOBgyUiMosA3e9AUG0ocoGgBTSYF5E
X-Gm-Gg: AYBFou3fkGAjvGzszcoLIMqn8pFeu4KB2bHCaC5m/1ilL1t7g8PwsOjFBJ5SoynQ5aa
 QEoeBAEkzgSktdCMGJUsHvI2o0621+tg0StWcc/NhfpESlOMrPobE96rDFVfUS3AdAUXN9Ezvkw
 4gfqe7R6wFR4hxW42yRVG1XeKUdfeEzqgBsnBPrzJRDots86szimH5b0GVDL2TSUYeMGG7ncd+N
 nyBKF2JChsquU2nwZSiQqWnfGcZJGks5c6Hgzmk0FUNIvpPQaS7NqHqvp/JFWJ6OX3J9m6cZGQQ
 jpgVieFtPJVeDtB5HqtQsV/u8chHqIqQgwTCAnbuVvpVpi4fBVMatWsOC4z5pJJj6veeo3YwlZU
 tF9EiptHgScE5qwhHqXmScITiRK+mt1HD0evlDJtiVzEcEcCDaHGv5BKYxLCcIDw5nRhpdmFeFs
 snGzM2udK6XM4R52nR5ZRP8lyjB5AHqV/xX4dcEWYN2NSbDQ3y168OGaL37Q/upfgaJmpe4RaNA
 mJ0bT7R+ZmsO9dwHxkOTE9zZBCyywSc5Wc31u8pfMZoSoKsvKa3vQxqe+pVJKoqxy1KkB6R7DPR
 a2KgWFeOliBB4wPhiXUMt67U3jpXkiwNRos5iTDk1aRwa9H0v4Cc
X-Received: by 2002:a05:600c:548b:b0:4bb:7033:de79 with SMTP id
 5b1f17b1804b1-4bb7033dff4mr95855035e9.35.1794864984590; 
 Mon, 16 Nov 2026 13:36:24 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm20248008f8f.20.2026.11.16.13.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:36:24 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:36:12 +0100
Message-ID: <20261116213612.873856-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116213612.873856-1-angelo.compagnucci@gmail.com>
References: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
 <20261116213612.873856-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 5/5] support/testing: add python-matplotlib
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
Changes v4 -> v5:
  - New patch: a runtime test of matplotlib with Qt6, based on the
    python-pyside6 test. It was already in the second v4, sent by
    mistake

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
