Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EF9EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E190E83918;
	Fri, 21 Jul 2023 21:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E190E83918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPvf8cZbm2PP; Fri, 21 Jul 2023 21:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09EF88380B;
	Fri, 21 Jul 2023 21:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09EF88380B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF2A41BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9792A41BEC
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9792A41BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fm3Hsrr1eP4e for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:35:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55B0441BDB
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B0441BDB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 356C57FC49; Fri, 21 Jul 2023 21:35:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:35:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 771fa83920c593fd89593fda1a8a276d2ed8b3a2
X-Git-Newrev: 9e380d0581f29b1ea2ed1f0a14e47db5ca21c64f
X-Patchwork-Hint: ignore
Message-Id: <20230721213556.356C57FC49@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_gawk.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e380d0581f29b1ea2ed1f0a14e47db5ca21c64f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |   1 +
 support/testing/tests/package/test_gawk.py | 120 +++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 43058cedf9..01050ebf59 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1738,6 +1738,7 @@ F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
diff --git a/support/testing/tests/package/test_gawk.py b/support/testing/tests/package/test_gawk.py
new file mode 100644
index 0000000000..7d737a9600
--- /dev/null
+++ b/support/testing/tests/package/test_gawk.py
@@ -0,0 +1,120 @@
+import os
+
+import infra.basetest
+
+
+class TestGawk(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_GAWK=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def basic_gawk_tests(self):
+        # Check the program can execute
+        self.assertRunOk("gawk --version")
+
+        # Check "awk" is "gawk": the Buildroot gawk package recipe is
+        # supposed to install the symbolic link.
+        output, exit_code = self.emulator.run("awk --version")
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(output[0].startswith("GNU Awk"))
+
+        # Check "gawk" can return a specific exit code
+        code = 123
+        cmd = "gawk 'BEGIN { exit(" + str(code) + "); }'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, code)
+
+        # Run a basic print program
+        test_string = "Hello Buildroot"
+        cmd = "gawk 'BEGIN {print \"" + test_string + "\"; }'"
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
+        # Add line numbers with gawk
+        cmd = "gawk '{ print NR \"\\t\" $1; }' data1.txt > data2.txt"
+        self.assertRunOk(cmd)
+
+    def sum_column(self):
+        # Check the sum of the first column is 1+2+3+4 == 10
+        awk_prg = "BEGIN { SUM = 0; } { SUM = SUM + $1; } END { print SUM; }"
+        cmd = f"gawk '{awk_prg}' data2.txt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), 10)
+
+    def uppercase_column(self):
+        # Extract only column 2 and convert it to upper case
+        cmd = "gawk '{ print toupper($2); }' data2.txt > data3.txt"
+        self.assertRunOk(cmd)
+
+        # Prepare the same output using "data1.txt" and the "tr" command,
+        # for verification
+        cmd = "tr a-z A-Z < data1.txt > data3-tr.txt"
+        self.assertRunOk(cmd)
+
+        # "gawk" and "tr" output are expected to be the same
+        self.assertRunOk("cmp data3.txt data3-tr.txt")
+
+    def gawk_head(self):
+        # Show the first 2 lines of a file
+        cmd = "gawk 'NR <= 2 { print $0; }' data2.txt > data4.txt"
+        self.assertRunOk(cmd)
+
+        # Prepare the same output using the "head" command
+        cmd = "head -2 data2.txt > data4-head.txt"
+        self.assertRunOk(cmd)
+
+        # "gawk" and "tr" output are expected to be the same
+        self.assertRunOk("cmp data4.txt data4-head.txt")
+
+    def gawk_specific(self):
+        # Use PROCINFO, which is a gawk specific feature:
+        # https://www.gnu.org/software/gawk/manual/gawk.html#POSIX_002fGNU
+        awk_platform_prog = "BEGIN { print PROCINFO[\"platform\"]; }"
+        cmd = f"gawk '{awk_platform_prog}'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "posix")
+
+        # Using the same gawk feature when running in POSIX mode should not
+        # produce output.
+        cmd = f"gawk --posix '{awk_platform_prog}'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(len(output) == 1 and len(output[0]) == 0)
+
+    def gawk_numeric(self):
+        value = 1234
+        squared_value = value * value
+        cmd = "gawk 'BEGIN { print sqrt(" + str(squared_value) + "); }'"
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
+        self.basic_gawk_tests()
+        self.create_test_data()
+        self.add_line_numbers()
+        self.sum_column()
+        self.uppercase_column()
+        self.gawk_head()
+        self.gawk_specific()
+        self.gawk_numeric()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
