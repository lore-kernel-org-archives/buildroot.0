Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB74C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF2F6842B8;
	Sun, 11 Feb 2024 21:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDuK_Uem9bQT; Sun, 11 Feb 2024 21:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A5D840E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A5D840E1;
	Sun, 11 Feb 2024 21:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6B21BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67976408D7
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bd4F4vBC9n3P for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C7274012F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C7274012F
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:49:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4352887803; Sun, 11 Feb 2024 21:49:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:49:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c456fefb9120ef9a9580b1a97d6fd67b90a42a82
X-Git-Newrev: 72c4c5740d52220669b519f6b76d80b748dc012a
X-Patchwork-Hint: ignore
Message-Id: <20240211214949.4352887803@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add ghostscript runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=72c4c5740d52220669b519f6b76d80b748dc012a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_ghostscript.py  | 48 ++++++++++++++++++++++
 .../rootfs-overlay/root/document.ps                |  9 ++++
 3 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8234d578cf..caf8a5fb37 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1782,6 +1782,8 @@ F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
 F:	support/testing/tests/package/test_gawk.py
+F:	support/testing/tests/package/test_ghostscript.py
+F:	support/testing/tests/package/test_ghostscript/
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
 F:	support/testing/tests/package/test_gnupg2.py
diff --git a/support/testing/tests/package/test_ghostscript.py b/support/testing/tests/package/test_ghostscript.py
new file mode 100644
index 0000000000..3c6c16ef2c
--- /dev/null
+++ b/support/testing/tests/package/test_ghostscript.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestGhostscript(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_ghostscript/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_GHOSTSCRIPT=y
+        BR2_PACKAGE_TESSERACT_OCR=y
+        BR2_PACKAGE_TESSERACT_OCR_LANG_ENG=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+        # Check the program can execute.
+        self.assertRunOk("gs --version")
+
+        doc_basename = "document"
+        ps_file = doc_basename + ".ps"
+        pgm_file = doc_basename + ".pgm"
+        txt_file = doc_basename + ".txt"
+
+        # Render a basic PostScript file to an image file.
+        cmd = "gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pgmraw -r150"
+        cmd += f" -dTextAlphaBits=4 -sOutputFile='{pgm_file}' {ps_file}"
+        self.assertRunOk(cmd)
+
+        # Run text recognition on the image file.
+        cmd = f"tesseract {pgm_file} {doc_basename}"
+        self.assertRunOk(cmd, timeout=30)
+
+        # Check we extracted the expected string from the input
+        # PostScript file.
+        cmd = f"cat {txt_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello Buildroot!")
diff --git a/support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps b/support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps
new file mode 100644
index 0000000000..5ca2b3581f
--- /dev/null
+++ b/support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps
@@ -0,0 +1,9 @@
+%!PS
+% See: PostScript: Language Reference, third edition
+% Example 5.1, page 314
+% https://www.adobe.com/jp/print/postscript/pdfs/PLRM.pdf
+/Helvetica findfont
+16 scalefont setfont
+54 720 moveto
+(Hello Buildroot!) show
+showpage
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
