Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44501D10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E4E381F76;
	Sat, 26 Oct 2024 11:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z651gz1v60Dn; Sat, 26 Oct 2024 11:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10ACD81F7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10ACD81F7E;
	Sat, 26 Oct 2024 11:55:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA0E5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7896460634
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJB7u51JQDkm for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58786605FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58786605FD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45990839EE; Sat, 26 Oct 2024 11:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:55:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7334d816976636f1e544711da08ba42cc77029f5
X-Git-Newrev: 8851a2583e09fcd3b9c3c84c9245cdfb68ddd958
X-Patchwork-Hint: ignore
Message-Id: <20241026115532.45990839EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add oath-toolkit runtime
 test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8851a2583e09fcd3b9c3c84c9245cdfb68ddd958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/test_oath_toolkit.py | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d606caa179..fc3e4bdf25 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1944,6 +1944,7 @@ F:	support/testing/tests/package/test_ntp.py
 F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
 F:	support/testing/tests/package/test_numactl/
+F:	support/testing/tests/package/test_oath_toolkit.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_oath_toolkit.py b/support/testing/tests/package/test_oath_toolkit.py
new file mode 100644
index 0000000000..92c0845614
--- /dev/null
+++ b/support/testing/tests/package/test_oath_toolkit.py
@@ -0,0 +1,38 @@
+import os
+
+import infra.basetest
+
+
+class TestOathToolKit(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_OATH_TOOLKIT=y
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
+        self.assertRunOk("oathtool --version")
+
+        # Test commands and expected results are coming from examples
+        # producing stable/reproducible outputs given in the oathtool
+        # manual page. See:
+        # https://www.nongnu.org/oath-toolkit/oathtool.1.html
+
+        tests = [
+            ("echo 00 | oathtool -", "328482"),
+            ("oathtool -c 5 3132333435363738393031323334353637383930", "254676"),
+            ("oathtool -w 10 3132333435363738393031323334353637383930 969429", "3"),
+            ("oathtool --totp --now \"2008-04-23 17:42:17 UTC\" 00", "974945")
+        ]
+
+        for cmd, expected_out in tests:
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0, f"Failed to run '{cmd}'")
+            self.assertEqual(expected_out, out[0])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
