Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846CBC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33EAD419D6;
	Mon,  5 Feb 2024 14:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33EAD419D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvEcUooZB_LL; Mon,  5 Feb 2024 14:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E07D4185D;
	Mon,  5 Feb 2024 14:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E07D4185D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14C851BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2C6D60F3A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C6D60F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qrZfjY3Vbmr for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 218B360E6B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218B360E6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1095486CF0; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 15:55:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a917500442b62441c88ff3f7ab84e6a230d6bc69
X-Git-Newrev: b89435db602e3ce39e73562cfd8b01fcc637368c
X-Patchwork-Hint: ignore
Message-Id: <20240205145609.1095486CF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add tesseract-ocr test
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

commit: https://git.buildroot.net/buildroot/commit/?id=b89435db602e3ce39e73562cfd8b01fcc637368c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 .../testing/tests/package/test_tesseract_ocr.py    | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a03018ab2b..b1178150ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1823,6 +1823,7 @@ F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
