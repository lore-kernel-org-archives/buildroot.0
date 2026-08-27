Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB8C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF8980EEB;
	Thu, 27 Aug 2026 21:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_I2aqx7yki0; Thu, 27 Aug 2026 21:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787864929;
	bh=AWHbn93qrwo81hkI48F/cMQu2x2DdW4H6HGGy2J+oWc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qaHcQnMBQjDnuwqgOZZJPy8cEXTzAUAcielEPXJcLlpfgmmJrnqedr6x+yU1JSuji
	 brORqaM6dqo55/pqY/5hLV/adID0zeF4LuF9M5O/U5GBRsjfVd7TZBOC/pIjMw75An
	 2ildBuvS8N4pAz9zAhnkBmVMOr8dKqxu5hZc253FhIQvR0VhtCRVE6SSljXWoi8ziP
	 R+52t5X5O/QpckQvKoq/FqiY2gBPJIlDzte4GlW1pMDF6rnYe1THQskaNqz4TIN+wl
	 hHUJ0t4XBtnol4Qvl9293iJBikNV8QZcMqNAcPRbd/KyCmWrzVo6h3ah9eNqXmYbrD
	 PMoyk4ocrp6rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6862580EEC;
	Thu, 27 Aug 2026 21:08:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFD75386
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5FA140800
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9p7UtpI_Qs6 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18D62407D6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C8EC9215F; Thu, 27 Aug 2026 21:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:49:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd4ac802e406d6544fb0726398f275a4949782c3
X-Git-Newrev: 4e62ac3a21111b1df279018c95e83eba2ec235b8
X-Patchwork-Hint: ignore
Message-Id: <20260827210749.5C8EC9215F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: quickjs: new runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e62ac3a21111b1df279018c95e83eba2ec235b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_quickjs.py      | 52 ++++++++++++++++++++++
 .../test_quickjs/rootfs-overlay/root/mandel.js     | 21 +++++++++
 3 files changed, 75 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b0ff1ff86..95a347588f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2030,6 +2030,8 @@ F:	support/testing/tests/package/test_python_pyqt5.py
 F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_python_sympy.py
+F:	support/testing/tests/package/test_quickjs.py
+F:	support/testing/tests/package/test_quickjs/
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_rrdtool.py
diff --git a/support/testing/tests/package/test_quickjs.py b/support/testing/tests/package/test_quickjs.py
new file mode 100644
index 0000000000..5d5354ab26
--- /dev/null
+++ b/support/testing/tests/package/test_quickjs.py
@@ -0,0 +1,52 @@
+import os
+
+import infra.basetest
+
+
+class TestQuickJS(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_quickjs/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_QUICKJS=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check can print a message from the command line.
+        msg = "Hello Buildroot!"
+        js_expr = f"console.log(\"{msg}\");"
+        cmd = f"qjs -e '{js_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We check we can exit with a specific code.
+        exit_code = 123
+        js_expr = f"std.exit({exit_code});"
+        cmd = f"qjs --std -e '{js_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, exit_code)
+        self.assertEqual(len(out), 0)
+
+        # We check we can do basic arithmetic.
+        val1 = 1234
+        val2 = 5678
+        js_expr = f"console.log({val1} * {val2});"
+        cmd = f"qjs -e '{js_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_result = val1 * val2
+        self.assertEqual(int(out[0]), expected_result)
+
+        # We check we can run a slightly more complex program and dump
+        # the memory usage.
+        self.assertRunOk("qjs -d --std mandel.js")
diff --git a/support/testing/tests/package/test_quickjs/rootfs-overlay/root/mandel.js b/support/testing/tests/package/test_quickjs/rootfs-overlay/root/mandel.js
new file mode 100644
index 0000000000..4004a26527
--- /dev/null
+++ b/support/testing/tests/package/test_quickjs/rootfs-overlay/root/mandel.js
@@ -0,0 +1,21 @@
+function mandel(file) {
+    points = ",.:-;!/>)|&IH%*Z";
+    for (y = -15; y <= 15; y++) {
+        for (x = 1; x <= 84; x++) {
+            i = 0;
+            r = 0;
+            for (k = 0; k <= 111; k++) {
+                j = (r*r) - (i*i) - 2 + (x/25);
+                i = 2 * r * i + (y/10);
+                if ((j*j + i*i) >= 11) {
+                    break;
+                }
+                r = j;
+            }
+            file.puts(points[k & 0xF]);
+        }
+        file.puts("\n");
+    }
+}
+
+mandel(std.out);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
