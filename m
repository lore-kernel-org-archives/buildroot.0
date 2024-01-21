Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C46C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 13:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCE524037E;
	Sun, 21 Jan 2024 13:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE524037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsU5cuGGn-BI; Sun, 21 Jan 2024 13:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A5F840465;
	Sun, 21 Jan 2024 13:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A5F840465
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0491BF476
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 13:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77FD040973
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 13:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FD040973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rz-u_-iM9NbR for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 13:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7530F404A6
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 13:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7530F404A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C45B863C1; Sun, 21 Jan 2024 13:52:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 14:45:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c9be611a8b7b4caac746920c08035761a9b9d9c
X-Git-Newrev: 0c6ffa55138e8d70953029a544308560101b55a6
X-Patchwork-Hint: ignore
Message-Id: <20240121135259.4C45B863C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add micropython runtime
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c6ffa55138e8d70953029a544308560101b55a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
[me: rework the test mostly for eye-candyness]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_micropython.py  | 68 ++++++++++++++++++++++
 .../test_micropython/rootfs-overlay/root/mandel.py | 25 ++++++++
 3 files changed, 95 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a6e4b7cdb7..9d2b9a11ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1791,6 +1791,8 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_micropython.py
+F:	support/testing/tests/package/test_micropython/
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_mtr.py
 F:	support/testing/tests/package/test_ncdu.py
diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
new file mode 100644
index 0000000000..0ecd4790bd
--- /dev/null
+++ b/support/testing/tests/package/test_micropython.py
@@ -0,0 +1,68 @@
+import os
+
+import infra.basetest
+
+
+class TestMicroPython(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_MICROPYTHON=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_micropython/rootfs-overlay")}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def run_upy_code(self, python_code, opts=""):
+        cmd = f'micropython {opts} -c "{python_code}"'
+        output, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0, f"could not run '{cmd}', returnd {ret}: '{output}'")
+        return output
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # The micropython binary can execute.
+        self.assertRunOk("micropython -h")
+
+        # Query interpreter version and implementation.
+        py_code = "import sys ; "
+        py_code += "print('Version:', sys.version) ; "
+        py_code += "print('Implementation:', sys.implementation)"
+        self.run_upy_code(py_code)
+
+        # Check implementation is 'micropython'.
+        py_code = "import sys ; print(sys.implementation.name)"
+        output = self.run_upy_code(py_code)
+        self.assertEqual(output[0], "micropython")
+
+        # Check micropython optimization are correctly reported.
+        py_code = "import micropython ; print(micropython.opt_level())"
+        for opt_level in range(4):
+            output = self.run_upy_code(py_code, f"-O{opt_level}")
+            self.assertEqual(
+                int(output[0]),
+                opt_level,
+                f"Running '{py_code}' at -O{opt_level} returned '{output}'"
+            )
+
+        # Check micropython can return a non-zero exit code.
+        expected_code = 123
+        py_code = "import sys ; "
+        py_code += f"sys.exit({expected_code})"
+        cmd = f'micropython -c "{py_code}"'
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, expected_code)
+
+        # Check micropython computes correctly.
+        input_value = 1234
+        expected_output = str(sum(range(input_value)))
+        py_code = f"print(sum(range(({input_value}))))"
+        output = self.run_upy_code(py_code)
+        self.assertEqual(output[0], expected_output)
+
+        # Finally, Check a small script can execute.
+        self.assertRunOk("/root/mandel.py", timeout=10)
diff --git a/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py b/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py
new file mode 100755
index 0000000000..0552f6894c
--- /dev/null
+++ b/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py
@@ -0,0 +1,25 @@
+#! /usr/bin/env micropython
+
+from micropython import mem_info
+
+POINTS = list(",.:-;!/>)|&IH%*Z")
+
+
+def mandel():
+    for y in range(-15, 16):
+        for x in range(1, 85):
+            i = 0
+            r = 0
+            for k in range(112):
+                j = (r*r) - (i*i) - 2 + (x/25)
+                i = 2 * r * i + (y/10)
+                if j*j + i*i >= 11:
+                    break
+                r = j
+            print(POINTS[k & 0xF], end='')
+        print()
+
+
+if __name__ == '__main__':
+    mandel()
+    mem_info()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
