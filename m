Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13515C74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE54540293;
	Sun, 12 Mar 2023 22:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE54540293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkR87L2XVUz0; Sun, 12 Mar 2023 22:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FD540347;
	Sun, 12 Mar 2023 22:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FD540347
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12ED41BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFFBB40522
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFFBB40522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qf3u94oVrGTQ for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:12:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D89A40106
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D89A40106
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C0C787039; Sun, 12 Mar 2023 22:12:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:12:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44b3aadffaaf26ec9c404dae8b6a8f231870fc63
X-Git-Newrev: 655b18053a344927b9372ff88302b082b1dba2f0
X-Patchwork-Hint: ignore
Message-Id: <20230312221222.1C0C787039@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_mtools.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=655b18053a344927b9372ff88302b082b1dba2f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_mtools.py | 72 ++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6c3498484f..592c0e6b9c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1739,6 +1739,7 @@ F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lsof.py
+F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
diff --git a/support/testing/tests/package/test_mtools.py b/support/testing/tests/package/test_mtools.py
new file mode 100644
index 0000000000..51e5138481
--- /dev/null
+++ b/support/testing/tests/package/test_mtools.py
@@ -0,0 +1,72 @@
+import os
+
+import infra.basetest
+
+
+class TestMtools(infra.basetest.BRTest):
+    # We use a glibc toolchain to have iconv conversion working for
+    # codepage 850.
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        BR2_PACKAGE_MTOOLS=y
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
+        dos_img = "dos-fat.img"
+        mtools_opts = f"-i {dos_img}"
+
+        self.assertRunOk("mtools --version")
+
+        # Create an empty image file to hold the FAT partition
+        self.assertRunOk(f"dd if=/dev/zero of={dos_img} bs=1M count=1")
+
+        # Any Mtools command is expected to fail on an unformated
+        # partition.
+        cmd = f"minfo {mtools_opts} ::"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # Now, let's format the partition file to FAT
+        self.assertRunOk(f"mformat {mtools_opts} ::")
+
+        # Run some Mtools commands on this empty partition
+        self.assertRunOk(f"minfo {mtools_opts} ::")
+        self.assertRunOk(f"mdir {mtools_opts} ::")
+        self.assertRunOk(f"mlabel {mtools_opts} -N 12345678 ::BUILDROOT")
+
+        # Create a reference file on our Linux filesystem
+        self.assertRunOk("echo 'Hello Buildroot!' > file1.txt")
+
+        # Copy the reference file into the DOS image, then perform
+        # various file manipulations
+        self.assertRunOk(f"mcopy {mtools_opts} file1.txt ::file2.txt")
+        self.assertRunOk(f"mcopy {mtools_opts} ::file2.txt ::file3.txt")
+        self.assertRunOk(f"mdel {mtools_opts} ::file2.txt")
+        self.assertRunOk(f"mren {mtools_opts} ::file3.txt ::file4.txt")
+        self.assertRunOk(f"mmd {mtools_opts} ::dir1")
+        self.assertRunOk(f"mmove {mtools_opts} ::file4.txt ::dir1")
+        self.assertRunOk(f"mdir {mtools_opts} ::dir1")
+        self.assertRunOk(f"mdu {mtools_opts} -a ::")
+
+        # Copy back the file from the DOS image to the Linux
+        # filesystem
+        self.assertRunOk(f"mcopy {mtools_opts} ::dir1/file4.txt file5.txt")
+
+        # We expect this last copied file to have the same content as
+        # the reference one created at the beginning
+        self.assertRunOk("cmp file1.txt file5.txt")
+
+        # Delete a directory tree containing a file
+        self.assertRunOk(f"mdeltree {mtools_opts} ::dir1")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
