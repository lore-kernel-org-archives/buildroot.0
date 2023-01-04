Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD30C46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D6560D54;
	Wed,  4 Jan 2023 22:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D6560D54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnGcCgVKyRSY; Wed,  4 Jan 2023 22:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BBA60B1B;
	Wed,  4 Jan 2023 22:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BBA60B1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D71F91BF3A3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF9E181FE8
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF9E181FE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQQ-VPpOfxEF for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:20:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D6781F9B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27D6781F9B
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:20:19 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.188.188])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3A5A7B00593;
 Wed,  4 Jan 2023 23:20:14 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 23:20:07 +0100
Message-Id: <20230104222007.43604-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672870815;
 bh=dOQlFtSi3AHFeEi6RmkMuzss5G+uWK+9r9p77Ti0h3U=;
 h=From:To:Cc:Subject:Date:From;
 b=duMtzo3wEoKcGCK4KQtzt0SJhs6cajV9b1euFwstnm9djEtfAE3JQ8xVioeoohrEf
 D7cP0eO1YFCzvuxw3RwqKca20ABTk/K4TxW6+Sv7r5xzYtHN6aLwe+Covd7GsUr/0L
 t5u9BAlt3XdeVzXGlD93B9ogtIEIzND/QBzQqw/ZFH+VCcH7gPSwA+EoHNDEvJCO7V
 2hHoo7aFfd3j9T3L5IOuddJgOVVHlMrjAhmflSnJRpwTtkIPvWLc9bXk1TYJALVZZz
 EMfww+mqWEERbxJbqRcBQ0uOgeiGjVy6l+1zJF9Eew4A/eocKS30mdYDP9GFhMd/gz
 X0Yj06JBxsaqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=duMtzo3w
Subject: [Buildroot] [PATCH 1/1]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 1ad6b4e with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8 support/testing/tests/package/test_gnupg2.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_gnupg2.TestGnupg2
    ...
    OK
---
 DEVELOPERS                                   |   1 +
 support/testing/tests/package/test_gnupg2.py | 114 +++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 support/testing/tests/package/test_gnupg2.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e3f0e7b1..9b0f076825 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1697,6 +1697,7 @@ F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
