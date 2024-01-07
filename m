Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D5AC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 12:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F178C417C2;
	Sun,  7 Jan 2024 12:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F178C417C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWM2_PYNeGGc; Sun,  7 Jan 2024 12:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A4F41803;
	Sun,  7 Jan 2024 12:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A4F41803
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BE251BF310
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51A6E8214A
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A6E8214A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6J0xKyHfFtRk for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 12:09:24 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34A51820EC
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 12:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A51820EC
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 43CA213F8B3;
 Sun,  7 Jan 2024 13:09:18 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 13:09:02 +0100
Message-ID: <20240107120902.136457-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704629360;
 bh=1immmyzaOWIHSBXBdde0Byt215awTkD7FQkmoOFcoMI=;
 h=From:To:Cc:Subject:Date:From;
 b=jeW3J5ke4mzRQ3l11QvYtZGA60Wb8MkNY7NljpVoaqxzP4+PCyMwWlVdks/UwJLfB
 eUVIUWzFUAXyI8nbzOO3GNZoD72eso4KRKUpYCXE6MIkNqpdD+seZ9TyXGKNWOMwMe
 KyQ1L0aTPgtBsLzAbyKjrOhjIp2x5ziGUoDct3spZoCBHMtlf6fRPm29A+FlhQ6UfH
 N3km5i7mNhrEwoimdVG6x/lDIfTUCzMctlSARv+18M7ENySmedu994moivBVefTLZG
 SVbTzvZcl5m+5Pk+qX2f6OFfPAUbDOVMVEK6dxfBeRS2awtJMFy6Gf1JAgLOv6U9yl
 pz8szYqgd4isg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jeW3J5ke
Subject: [Buildroot] [PATCH 1/1] support/testing: add tesseract-ocr test
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
Cc: Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit b372495 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_tesseract_ocr
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 .../tests/package/test_tesseract_ocr.py       | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 support/testing/tests/package/test_tesseract_ocr.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d7543247f2..73b4a1e2da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1813,6 +1813,7 @@ F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
+F:	support/testing/tests/package/test_tesseract_ocr.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_tesseract_ocr.py b/support/testing/tests/package/test_tesseract_ocr.py
new file mode 100644
index 0000000000..232025bad2
--- /dev/null
+++ b/support/testing/tests/package/test_tesseract_ocr.py
@@ -0,0 +1,43 @@
+import os
+
+import infra.basetest
+
+
+class TestTesseractOcr(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_FREETYPE=y
+        BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
+        BR2_PACKAGE_GRAPHICSMAGICK=y
+        BR2_PACKAGE_TESSERACT_OCR=y
+        BR2_PACKAGE_TESSERACT_OCR_LANG_ENG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        msg = "Hello from Buildroot runtime test."
+        img_file = "image.pgm"
+        txt_basename = "text"
+        txt_file = f"{txt_basename}.txt"
+
+        # Check the program execute.
+        self.assertRunOk("tesseract --version")
+
+        # Generate an image file including a text message.
+        cmd = f"gm convert -pointsize 16 label:'{msg}' {img_file}"
+        self.assertRunOk(cmd)
+
+        # Perform the character recognition.
+        cmd = f"tesseract {img_file} {txt_basename}"
+        self.assertRunOk(cmd, timeout=30)
+
+        # Check the decoded text matches the original message.
+        cmd = f"grep -F '{msg}' {txt_file}"
+        self.assertRunOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
