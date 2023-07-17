Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAC2EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 17:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3A0160AB2;
	Mon, 17 Jul 2023 17:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A0160AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ou3gbs8JaI1; Mon, 17 Jul 2023 17:48:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B173360B00;
	Mon, 17 Jul 2023 17:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B173360B00
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153371BF337
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2FBD80ECB
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2FBD80ECB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBzTeCF6XUf0 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 17:48:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD2080C1F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DD2080C1F
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 17:48:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CFD9213F8C4;
 Mon, 17 Jul 2023 19:48:45 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 19:48:40 +0200
Message-ID: <20230717174840.56674-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689616127;
 bh=F0p8KWLfjeIOoWYP+V+s8mpWWElepLGFahQ4vMQULiM=;
 h=From:To:Cc:Subject:Date:From;
 b=A43qkSdZczOwAUN77hIo6UdeQnDZcUG0WlvajW0bojgDA89Gi9HxmRRAPI2GkSeIR
 R9OMSdsEQulOiH8KX58QEV9hS9ldTxEKDyRf7hKoL22U8o2phbAmrZvMg0dar1aN8b
 qTyxcTkdt41RZMR3kJ8MVrg25eGNZ3fMFih5u2ROZB0l6ddo5wT3bKJtjrCSXG+hS0
 Emh2mw9HZPFX42J7lLjx4LpNzAh5sneUGnlEmbZ9Ytd/dU4SN741TkfO9Y3Hh3qfAw
 KGyOAG9pP59UZOktDNrTeCuYFdVJOkXbJRHYU/zACP5Qptqi2QbJn0o3Na9TmcdfoQ
 VWPbK7VVKi6PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A43qkSdZ
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_gawk.py:
 new runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                 |   1 +
 support/testing/tests/package/test_gawk.py | 120 +++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 support/testing/tests/package/test_gawk.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 405ccd645a..f14e0704a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1737,6 +1737,7 @@ F:	support/testing/tests/package/test_compressor_base.py
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
