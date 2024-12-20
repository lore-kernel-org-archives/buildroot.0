Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E80FC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E1D38479D;
	Fri, 28 Feb 2025 16:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Cqw23ScVIJD; Fri, 28 Feb 2025 16:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255EA847A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255EA847A8;
	Fri, 28 Feb 2025 16:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E4E1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 988AB42937
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEDnZaHCa6WI for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FAD4419F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FAD4419F4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B49885E77; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 22:56:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ed59c2b7aa088b44d5d402bf4ddf454a99e45587
X-Git-Newrev: 15dbc33be847c9b4d137e6311bb8ba68a51a3c27
X-Patchwork-Hint: ignore
Message-Id: <20250228162944.2B49885E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new proj
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

commit: https://git.buildroot.net/buildroot/commit/?id=15dbc33be847c9b4d137e6311bb8ba68a51a3c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Tested-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Reviewed-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_proj.py | 59 ++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 492eb765e0..f2abab2ef3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1956,6 +1956,7 @@ F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_postgresql.py
 F:	support/testing/tests/package/test_pppd.py
 F:	support/testing/tests/package/test_pppd/
+F:	support/testing/tests/package/test_proj.py
 F:	support/testing/tests/package/test_pv.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
diff --git a/support/testing/tests/package/test_proj.py b/support/testing/tests/package/test_proj.py
new file mode 100644
index 0000000000..ed23c229fd
--- /dev/null
+++ b/support/testing/tests/package/test_proj.py
@@ -0,0 +1,59 @@
+import os
+
+import infra.basetest
+
+
+class TestProj(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PROJ=y
+        BR2_PACKAGE_PROJ_APPS=y
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
+        # We check the program can run. The "proj" command does not
+        # have a "--version" option. It will just show its version
+        # when invoked without any argument.
+        self.assertRunOk("proj")
+
+        # The commands in this tests are taken from the Proj
+        # documentation quickstart page, at:
+        # https://proj.org/en/9.5/usage/quickstart.html
+
+        proj_str = "+proj=merc +lat_ts=56.5 +ellps=GRS80"
+        cmd = "echo 55.2 12.2"
+        cmd += f" | proj {proj_str}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_values = [3399483.80, 752085.60]
+        values = list(map(lambda x: float(x), out[0].split()))
+        for i in range(len(expected_values)):
+            self.assertAlmostEqual(values[i], expected_values[i])
+
+        proj_str = "+proj=merc +lat_ts=56.5 +ellps=GRS80 +to +proj=utm +zone=32"
+        cmd = "echo 3399483.80 752085.60"
+        cmd += f" | cs2cs {proj_str}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_values = [6103992.36, 1924052.47, 0.00]
+        values = list(map(lambda x: float(x), out[0].split()))
+        for i in range(len(expected_values)):
+            self.assertAlmostEqual(values[i], expected_values[i])
+
+        proj_str = "+init=epsg:4326 +to +init=epsg:25832"
+        cmd = "echo 56 12"
+        cmd += f" | cs2cs {proj_str}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_values = [6231950.54, 1920310.71, 0.00]
+        values = list(map(lambda x: float(x), out[0].split()))
+        for i in range(len(expected_values)):
+            self.assertAlmostEqual(values[i], expected_values[i])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
