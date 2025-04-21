Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A2EC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF6B1843BA;
	Mon, 19 May 2025 10:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cj3JFRCM8X6z; Mon, 19 May 2025 10:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E173D843BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E173D843BD;
	Mon, 19 May 2025 10:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DD9D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F0F8423D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTooTk9cqIdg for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D58341235
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D58341235
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29AE1872E7; Mon, 19 May 2025 10:39:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 16:23:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1223b4b702cc92602f1abdf3d1210bb05a02d4d1
X-Git-Newrev: aaf93ba27f58496e957155ade6213158f3114a34
X-Patchwork-Hint: ignore
Message-Id: <20250519103954.29AE1872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new openocd
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaf93ba27f58496e957155ade6213158f3114a34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_openocd.py | 37 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 11c490806c..1dfe0eaa02 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1983,6 +1983,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
+F:	support/testing/tests/package/test_openocd.py
 F:	support/testing/tests/package/test_parted.py
 F:	support/testing/tests/package/test_patch.py
 F:	support/testing/tests/package/test_patch/
diff --git a/support/testing/tests/package/test_openocd.py b/support/testing/tests/package/test_openocd.py
new file mode 100644
index 0000000000..fe4d203073
--- /dev/null
+++ b/support/testing/tests/package/test_openocd.py
@@ -0,0 +1,37 @@
+import os
+
+import infra.basetest
+
+
+class TestOpenOCD(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_OPENOCD=y
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
+        # We check the program can run.
+        self.assertRunOk("openocd --version")
+
+        msg = "Buildroot"
+
+        # We check openocd can run, load a "dummy" driver in the
+        # standard search path, and use some of its TCL commands. See:
+        # https://github.com/openocd-org/openocd/blob/v0.12.0/doc/manual/primer/commands.txt#L117
+        # https://github.com/openocd-org/openocd/blob/v0.12.0/src/jtag/drivers/dummy.c
+        cmd = "openocd"
+        cmd += " -f interface/dummy.cfg"
+        cmd += f" -c 'dummy hello {msg}'"
+        cmd += " -c shutdown"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_str = f"Greetings {msg}!"
+        self.assertIn(expected_str, out)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
