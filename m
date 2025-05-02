Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37524C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A1B703AF;
	Fri,  2 May 2025 11:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxaRR29uR98P; Fri,  2 May 2025 11:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34765703AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34765703AE;
	Fri,  2 May 2025 11:15:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 191CE229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C858441A17
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhIlWuFqGc3t for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D1641E65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D1641E65
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A450F863AE; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 37eefef8357192ef28f2a577721b82bcfd139188
X-Git-Newrev: 672f99bdcef11fa8cda742293d83649f925c263b
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.A450F863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/test: new bat
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=672f99bdcef11fa8cda742293d83649f925c263b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add a runtime test for the 'bat' package to verify that the binary executes
correctly in a minimal Buildroot rootfs.The test cheks that:
- 'bat --version' runs without error
- 'bat' can read and display a text file
- the displayed content matches the expected string

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dacf8e3c39652c595519ab6d424009962d8ae9ba)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_bat.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/support/testing/tests/package/test_bat.py b/support/testing/tests/package/test_bat.py
new file mode 100644
index 0000000000..018d0e002f
--- /dev/null
+++ b/support/testing/tests/package/test_bat.py
@@ -0,0 +1,27 @@
+import os
+import infra.basetest
+
+
+class TestBat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+            """
+            BR2_PACKAGE_BAT=y
+            BR2_TARGET_ROOTFS_CPIO=y
+            # BR2_TARGET_ROOTFS_TAR is not set
+            """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the programs can execute
+        self.assertRunOk("bat --version")
+        self.assertRunOk("echo 'hello test' > test.txt")
+
+        # Run bat and capture output
+        output, exit_code = self.emulator.run("bat test.txt", timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("hello test", "\n".join(output))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
