Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B6EEEB57B
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063C660C00;
	Sun, 10 Sep 2023 16:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 063C660C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuiljbZ_iy9r; Sun, 10 Sep 2023 16:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B38C60736;
	Sun, 10 Sep 2023 16:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B38C60736
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39C0C1BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 205C1606F2
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 205C1606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-trLLnBLSO3 for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3732260BF0
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3732260BF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23AE186B45; Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 18:32:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b492a5414e49ea18309eb17e8f1d3cc81d92b3fa
X-Git-Newrev: fc942d50334d7fa831f0d47d46aa013f6f26ef5d
X-Patchwork-Hint: ignore
Message-Id: <20230910163504.23AE186B45@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_screen.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc942d50334d7fa831f0d47d46aa013f6f26ef5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_screen.py | 61 ++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a7410d61fa..a0e2dcca27 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1768,6 +1768,7 @@ F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
diff --git a/support/testing/tests/package/test_screen.py b/support/testing/tests/package/test_screen.py
new file mode 100644
index 0000000000..b6264d34df
--- /dev/null
+++ b/support/testing/tests/package/test_screen.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestScreen(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_SCREEN=y
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
+        session_name = "BuildrootSession"
+        message = "HelloBuildroot"
+        screen_dump = "screen.dump.txt"
+
+        # Check the program can execute
+        self.assertRunOk("screen --version")
+
+        # There is no "screen" running yet. Listing sessions is
+        # expected to fail.
+        _, exit_code = self.emulator.run("screen -ls")
+        self.assertNotEqual(exit_code, 0)
+
+        # We now start a detached and named session.
+        self.assertRunOk(f"screen -dmS {session_name}")
+
+        # Since we are supposed to have a running session, it should
+        # appear in the list.
+        output, exit_code = self.emulator.run("screen -ls")
+        self.assertEqual(exit_code, 0)
+        self.assertIn(session_name, "\n".join(output))
+
+        # We send an exec command to print a message in the "screen"
+        # display running in background.
+        cmd = f"screen -S {session_name} -X exec printf {message}"
+        self.assertRunOk(cmd)
+
+        # We request a hardcopy of this "screen" display.
+        cmd = f"screen -S {session_name} -X hardcopy {screen_dump}"
+        self.assertRunOk(cmd)
+
+        # The dump file is supposed to contain our message.
+        self.assertRunOk(f"grep -Fo '{message}' {screen_dump}")
+
+        # We request "screen" to quit...
+        cmd = f"screen -S {session_name} -X quit"
+        self.assertRunOk(cmd)
+
+        # Since the session is supposed to be terminated, listing
+        # sessions is expected to fail (again).
+        _, exit_code = self.emulator.run("screen -ls")
+        self.assertNotEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
