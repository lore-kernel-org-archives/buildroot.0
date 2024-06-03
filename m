Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069EAC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 10:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F22607AA;
	Mon,  3 Jun 2024 10:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ij2J0OtAy1YR; Mon,  3 Jun 2024 10:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC1D160785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC1D160785;
	Mon,  3 Jun 2024 10:55:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C649C1BF31A
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEADE400C6
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N42rlIaHRhQV for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 10:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F331040109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F331040109
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 10:55:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F100879B6; Mon,  3 Jun 2024 10:55:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 12:50:35 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6331561b2a2357288b70453184b7391f43e25e28
X-Git-Newrev: ca30429097249e9b8a2c6daa669511ab58c33699
X-Patchwork-Hint: ignore
Message-Id: <20240603105542.9F100879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 links runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca30429097249e9b8a2c6daa669511ab58c33699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 449ae81faeff23a54693e337439f5c5685bd7bb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 ++
 support/testing/tests/package/test_links.py        | 33 ++++++++++++++++++++++
 .../test_links/rootfs-overlay/root/file.html       |  9 ++++++
 3 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed5962ed08..2fd801f55e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1807,6 +1807,8 @@ F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_links.py
+F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
diff --git a/support/testing/tests/package/test_links.py b/support/testing/tests/package/test_links.py
new file mode 100644
index 0000000000..ed52bb2d5f
--- /dev/null
+++ b/support/testing/tests/package/test_links.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestLinks(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_links/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_LINKS=y
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
+        self.assertRunOk("links -version")
+
+        expected_str = "Hello Buildroot !"
+        html_file = "/root/file.html"
+        url = f"file://{html_file}"
+
+        cmd = f"links -dump {url}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].strip(), expected_str)
diff --git a/support/testing/tests/package/test_links/rootfs-overlay/root/file.html b/support/testing/tests/package/test_links/rootfs-overlay/root/file.html
new file mode 100644
index 0000000000..65b33cb5a7
--- /dev/null
+++ b/support/testing/tests/package/test_links/rootfs-overlay/root/file.html
@@ -0,0 +1,9 @@
+<!DOCTYPE html>
+<html lang="en">
+  <head>
+    <title>Buildroot Test Page</title>
+  </head>
+  <body>
+    <p><b>Hello</b> <i>Buildroot</i> &excl;</p>
+  </body>
+</html>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
