Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0867FC05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B4961058;
	Fri, 10 Feb 2023 22:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B4961058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wdo2B1EOVIxj; Fri, 10 Feb 2023 22:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D801360F2F;
	Fri, 10 Feb 2023 22:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D801360F2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2C41BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07DD5823DD
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DD5823DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2M1pLV0YesYZ for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:38:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12DA2823A0
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DA2823A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3C48851BB; Fri, 10 Feb 2023 22:38:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:36:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d87d6281869d4023e0ff888b99cdd5bdf2a0326
X-Git-Newrev: a82eec628c25f96a15ed7f1443923ff625e0d2bc
X-Patchwork-Hint: ignore
Message-Id: <20230210223815.F3C48851BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_gnupg2.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=a82eec628c25f96a15ed7f1443923ff625e0d2bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |   1 +
 support/testing/tests/package/test_gnupg2.py | 114 +++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0671709..0af1323340 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1708,6 +1708,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
new file mode 100644
index 0000000000..4505e1c339
--- /dev/null
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -0,0 +1,114 @@
+import os
+
+import infra.basetest
+
+
+class TestGnupg2(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_GNUPG2=y
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
+        # Some common data for all the tests
+        plain_data = "Some plain text data"
+        plain_file = "file.txt"
+        gpg_file = plain_file + ".gpg"
+        asc_file = plain_file + ".asc"
+        sig_file = plain_file + ".sig"
+        good_passphrase = "Good Passphrase"
+        gpg_userid = "br-test@buildroot"
+
+        # Test the program can execute
+        self.assertRunOk("gpg --version")
+
+        # Generate plain text data
+        cmd = "echo '{}' > {}".format(plain_data, plain_file)
+        self.assertRunOk(cmd)
+
+        # Test symmetric encrypt
+        cmd = "gpg --batch --symmetric"
+        cmd += " --passphrase '{}' {}".format(good_passphrase, plain_file)
+        self.assertRunOk(cmd)
+
+        # Test symmetric decrypt
+        cmd = "gpg --batch --decrypt"
+        cmd += " --passphrase '{}' {}".format(good_passphrase, gpg_file)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn(plain_data, output)
+
+        # Test a failed decrypt with a bad password
+        cmd = "gpg --batch --decrypt"
+        cmd += " --passphrase 'A-Bad-Password' {}".format(gpg_file)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # Test the generation of an asymmetric key
+        cmd = "gpg --batch --passphrase ''"
+        cmd += " --quick-generate-key {} default default".format(gpg_userid)
+        self.assertRunOk(cmd)
+
+        # Test asymmetric encrypt+sign
+        cmd = "gpg --batch --yes --encrypt --sign"
+        cmd += " --recipient {} {}".format(gpg_userid, plain_file)
+        self.assertRunOk(cmd)
+
+        # Test asymmetric decrypt+verify
+        cmd = "gpg --decrypt {}".format(gpg_file)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn(plain_data, output)
+        self.assertRegex("\n".join(output), r'gpg: Good signature')
+
+        # Test asymmetric armored encrypt+sign
+        cmd = "gpg --batch --yes --armor --encrypt --sign"
+        cmd += " --recipient {} {}".format(gpg_userid, plain_file)
+        self.assertRunOk(cmd)
+
+        # Test asymmetric armored decrypt+verify
+        cmd = "gpg --armor --decrypt {}".format(asc_file)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn(plain_data, output)
+        self.assertRegex("\n".join(output), r'gpg: Good signature')
+
+        # Test detached signature
+        cmd = "gpg --batch --yes --detach-sign {}".format(plain_file)
+        self.assertRunOk(cmd)
+
+        # Test detached signature verification
+        cmd = "gpg --verify {}".format(sig_file)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertRegex("\n".join(output), r'gpg: Good signature')
+
+        # Test detached armored signature
+        cmd = "gpg --batch --yes --armor --detach-sign {}".format(plain_file)
+        self.assertRunOk(cmd)
+
+        # Test detached armored signature verification
+        cmd = "gpg --armor --verify {}".format(asc_file)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertRegex("\n".join(output), r'gpg: Good signature')
+
+        # Test the signature verification of a corrupted file actually fails
+        cmd = "echo 'CORRUPTED' >> {}".format(plain_file)
+        self.assertRunOk(cmd)
+
+        cmd = "gpg --verify {}".format(sig_file)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        cmd = "gpg --armor --verify {}".format(asc_file)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
