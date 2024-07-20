Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049D0C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8AD44055F;
	Sat, 20 Jul 2024 21:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id votG6uNa31Zt; Sat, 20 Jul 2024 21:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233C9404AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 233C9404AA;
	Sat, 20 Jul 2024 21:12:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF9A1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15C1760731
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wKT_YaU-ATw for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F996068A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16F996068A
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:12:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03D2786EB2; Sat, 20 Jul 2024 21:12:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:11:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 124087c51c6bf751b0caa5cd6327f7ce3d89d0e1
X-Git-Newrev: f04a95f79f087869a44ea3d63d55ce7b27b8e922
X-Patchwork-Hint: ignore
Message-Id: <20240720211206.03D2786EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add mawk runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=f04a95f79f087869a44ea3d63d55ce7b27b8e922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |   1 +
 support/testing/tests/package/test_mawk.py | 114 +++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c4f1565edd..06eef3740f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1901,6 +1901,7 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_mawk.py
 F:	support/testing/tests/package/test_mdadm.py
 F:	support/testing/tests/package/test_mdadm/
 F:	support/testing/tests/package/test_micropython.py
diff --git a/support/testing/tests/package/test_mawk.py b/support/testing/tests/package/test_mawk.py
new file mode 100644
index 0000000000..5caf77c116
--- /dev/null
+++ b/support/testing/tests/package/test_mawk.py
@@ -0,0 +1,114 @@
+import os
+
+import infra.basetest
+
+
+class TestMawk(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MAWK=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def basic_mawk_tests(self):
+        # Check the program can execute
+        self.assertRunOk("mawk --version")
+
+        # Check "mawk" can return a specific exit code
+        code = 123
+        cmd = "mawk 'BEGIN { exit(" + str(code) + "); }'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, code)
+
+        # Run a basic print program
+        test_string = "Hello Buildroot"
+        cmd = "mawk 'BEGIN {print \"" + test_string + "\"; }'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], test_string)
+
+    def create_test_data(self):
+        # Create some test data
+        entries = ["one", "two", "three", "four"]
+        for entry in entries:
+            self.assertRunOk(f"echo {entry} >> data1.txt")
+
+    def add_line_numbers(self):
+        # Add line numbers with mawk
+        cmd = "mawk '{ print NR \"\\t\" $1; }' data1.txt > data2.txt"
+        self.assertRunOk(cmd)
+
+    def sum_column(self):
+        # Check the sum of the first column is 1+2+3+4 == 10
+        awk_prg = "BEGIN { SUM = 0; } { SUM = SUM + $1; } END { print SUM; }"
+        cmd = f"mawk '{awk_prg}' data2.txt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), 10)
+
+    def uppercase_column(self):
+        # Extract only column 2 and convert it to upper case
+        cmd = "mawk '{ print toupper($2); }' data2.txt > data3.txt"
+        self.assertRunOk(cmd)
+
+        # Prepare the same output using "data1.txt" and the "tr" command,
+        # for verification
+        cmd = "tr a-z A-Z < data1.txt > data3-tr.txt"
+        self.assertRunOk(cmd)
+
+        # "mawk" and "tr" output are expected to be the same
+        self.assertRunOk("cmp data3.txt data3-tr.txt")
+
+    def mawk_head(self):
+        # Show the first 2 lines of a file
+        cmd = "mawk 'NR <= 2 { print $0; }' data2.txt > data4.txt"
+        self.assertRunOk(cmd)
+
+        # Prepare the same output using the "head" command
+        cmd = "head -2 data2.txt > data4-head.txt"
+        self.assertRunOk(cmd)
+
+        # "mawk" and "tr" output are expected to be the same
+        self.assertRunOk("cmp data4.txt data4-head.txt")
+
+    def mawk_specific(self):
+        # Use the "-W dump" mawk specific option.
+        # See: https://invisible-island.net/mawk/manpage/mawk.html
+        # We create an arbitrary awk program with an integer and
+        # string constant. We then check those constants are in the
+        # mawk "assembler" output.
+        awk_int = 12345
+        awk_str = "Buildroot"
+        awk_expr = f"print ($1 + {awk_int}) \"{awk_str}\";"
+        awk_prg = "BEGIN { " + awk_expr + " }"
+        cmd = f"mawk -W dump '{awk_prg}'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        out_str = "\n".join(output)
+        self.assertIn(str(awk_int), out_str)
+        self.assertIn(awk_str, out_str)
+
+    def mawk_numeric(self):
+        value = 1234
+        squared_value = value * value
+        cmd = "mawk 'BEGIN { print sqrt(" + str(squared_value) + "); }'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), value)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.basic_mawk_tests()
+        self.create_test_data()
+        self.add_line_numbers()
+        self.sum_column()
+        self.uppercase_column()
+        self.mawk_head()
+        self.mawk_specific()
+        self.mawk_numeric()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
