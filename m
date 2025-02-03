Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF7C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 595D060A3A;
	Mon,  3 Feb 2025 22:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw6laelJaDRy; Mon,  3 Feb 2025 22:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE1C60791
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE1C60791;
	Mon,  3 Feb 2025 22:06:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C48612F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C37040102
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XS8Im1A0Vwka for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEB06401B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEB06401B1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:06:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E46B58693D; Mon,  3 Feb 2025 22:06:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:06:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fefe7024a38f11bf0d62e7435aaec9847ede4976
X-Git-Newrev: 41bceec4e80264b0de2a0c01a0c107bdec09eff2
X-Patchwork-Hint: ignore
Message-Id: <20250203220644.E46B58693D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new patch runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=41bceec4e80264b0de2a0c01a0c107bdec09eff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_patch.py        | 44 ++++++++++++++++++++++
 .../test_patch/rootfs-overlay/root/file.diff       |  8 ++++
 .../test_patch/rootfs-overlay/root/file.txt        |  3 ++
 4 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5a1d9fda7e..3992a82351 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1962,6 +1962,8 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_parted.py
+F:	support/testing/tests/package/test_patch.py
+F:	support/testing/tests/package/test_patch/
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
diff --git a/support/testing/tests/package/test_patch.py b/support/testing/tests/package/test_patch.py
new file mode 100644
index 0000000000..67ecb0497a
--- /dev/null
+++ b/support/testing/tests/package/test_patch.py
@@ -0,0 +1,44 @@
+import os
+
+import infra.basetest
+
+
+class TestPatch(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_patch/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_PATCH=y
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
+        # Check the program can execute. This also checks that we are
+        # not using the patch applet from BusyBox (as it does not
+        # recognize the --version option).
+        self.assertRunOk("patch --version")
+
+        # We check the test file contains our expected string before
+        # the patch.
+        sed_cmd = "sed -n '2p' file.txt"
+        out, ret = self.emulator.run(sed_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello World!")
+
+        # We apply our test patch...
+        self.assertRunOk("patch -p1 < file.diff")
+
+        # We check the test file contains our expected string after
+        # applying the patch.
+        out, ret = self.emulator.run(sed_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello Buildroot!")
diff --git a/support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff
new file mode 100644
index 0000000000..d53324d84b
--- /dev/null
+++ b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff
@@ -0,0 +1,8 @@
+diff -Naur a/file.txt b/file.txt
+--- a/file.txt	2024-12-18 23:11:50.863359248 +0100
++++ b/file.txt	2024-12-18 23:12:26.464561146 +0100
+@@ -1,3 +1,3 @@
+ This is some context...
+-Hello World!
++Hello Buildroot!
+ ...and this is some more context.
diff --git a/support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt
new file mode 100644
index 0000000000..b506c73d9f
--- /dev/null
+++ b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt
@@ -0,0 +1,3 @@
+This is some context...
+Hello World!
+...and this is some more context.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
