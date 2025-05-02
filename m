Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5C7C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC7942441;
	Fri,  2 May 2025 11:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7DhwfXMRlDh; Fri,  2 May 2025 11:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4B3C426B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B3C426B9;
	Fri,  2 May 2025 11:14:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97AC0229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34C8661273
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcrHXn1EJwfZ for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C37061325
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C37061325
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8952D864AE; Fri,  2 May 2025 11:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:14:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cbe9eb71b005d9f5188ae657875b4a29f578cdf5
X-Git-Newrev: db50ec7255a87410c86cc564f7a9b7e7d66cd862
X-Patchwork-Hint: ignore
Message-Id: <20250502111137.8952D864AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: new
 openocd runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db50ec7255a87410c86cc564f7a9b7e7d66cd862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aaf93ba27f58496e957155ade6213158f3114a34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_openocd.py | 37 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f49308ab7..8d52249db2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1974,6 +1974,7 @@ F:	support/testing/tests/package/test_octave.py
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
