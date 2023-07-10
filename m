Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB5AEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC13080C18;
	Mon, 10 Jul 2023 17:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC13080C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ckLJPPNTFdEI; Mon, 10 Jul 2023 17:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CE38106A;
	Mon, 10 Jul 2023 17:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18CE38106A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16F701BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4F34820EE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F34820EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2u5YT5ikMOa for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:48:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 265A3820DB
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 265A3820DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16A3D86C9B; Mon, 10 Jul 2023 17:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:48:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b6ea18e47c88b899ac45d8e60d3a7bc2f983d66
X-Git-Newrev: 3435d52bab9c04d8ee214f3958be3bccd6ec83d1
X-Patchwork-Hint: ignore
Message-Id: <20230710174823.16A3D86C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_dos2unix.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=3435d52bab9c04d8ee214f3958be3bccd6ec83d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_dos2unix.py | 45 ++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 086e0478eb..c1819954ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1729,6 +1729,7 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_dos2unix.py b/support/testing/tests/package/test_dos2unix.py
new file mode 100644
index 0000000000..af5850ae3e
--- /dev/null
+++ b/support/testing/tests/package/test_dos2unix.py
@@ -0,0 +1,45 @@
+import os
+
+import infra.basetest
+
+
+class TestDos2Unix(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_DOS2UNIX=y
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
+        # Check the program can run. This test also checks that we're
+        # using the real "dos2unix" rather than the applet provided in
+        # BusyBox, since the "--version" option is recognized by the
+        # real dos2unix and return an error in BusyBox.
+        self.assertRunOk("dos2unix --version")
+
+        # Create a text file with UNIX new-lines
+        self.assertRunOk("echo -e 'Hello\\nBuildroot' > original.txt")
+
+        # Convert the original UNIX file to DOS
+        self.assertRunOk("unix2dos -n original.txt dos.txt")
+
+        # DOS file is expected to be different than the UNIX file
+        _, exit_code = self.emulator.run("cmp original.txt dos.txt")
+        self.assertNotEqual(exit_code, 0)
+
+        # The "cat -A" command should print '^M$' for CR-LF
+        self.assertRunOk("cat -A dos.txt | grep -Fq '^M$'")
+
+        # Convert back DOS file to UNIX
+        self.assertRunOk("dos2unix -n dos.txt unix.txt")
+
+        # "unix.txt" should be identical to "original.txt"
+        self.assertRunOk("cmp original.txt unix.txt")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
