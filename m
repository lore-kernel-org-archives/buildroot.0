Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4E6EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE4660736;
	Sun, 10 Sep 2023 16:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE4660736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93tc3gzuX5N1; Sun, 10 Sep 2023 16:35:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8836660D59;
	Sun, 10 Sep 2023 16:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8836660D59
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BD841BF8C7
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43EB2400A4
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43EB2400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMrKDTWcf7vp for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 442B34032C
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 442B34032C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3152486B47; Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 18:34:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc942d50334d7fa831f0d47d46aa013f6f26ef5d
X-Git-Newrev: 02497626adad0da120315e00ef8a323546ce53b8
X-Patchwork-Hint: ignore
Message-Id: <20230910163504.3152486B47@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_libgpgme.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=02497626adad0da120315e00ef8a323546ce53b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_libgpgme.py | 88 ++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a0e2dcca27..d72dce866f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1742,6 +1742,7 @@ F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
 F:	support/testing/tests/package/test_less.py
+F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
new file mode 100644
index 0000000000..28a33bab03
--- /dev/null
+++ b/support/testing/tests/package/test_libgpgme.py
@@ -0,0 +1,88 @@
+import os
+
+import infra.basetest
+
+
+class TestLibGpgme(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LIBGPGME=y
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
+        # We check the binary program can execute.
+        self.assertRunOk("gpgme-tool --version")
+
+        # Some common data for all the tests.
+        plain_data = "Hello Buildroot!"
+        gpg_userid = "br-test@buildroot"
+        plain_file = "reference-plain.txt"
+        enc_file = "encrypted.dat"
+        dec_file = "decrypted.txt"
+
+        # We did not create a gpg key yet. We should not be able to
+        # list our key.
+        gpgme_listkey = f"echo LISTKEYS | gpgme-tool | grep '{gpg_userid}'"
+        _, exit_code = self.emulator.run(gpgme_listkey)
+        self.assertNotEqual(exit_code, 0)
+
+        # We now create our gpg key.
+        cmd = "gpg --batch --passphrase ''"
+        cmd += f" --quick-generate-key {gpg_userid} default default"
+        self.assertRunOk(cmd)
+
+        # We should now see our key in the list.
+        self.assertRunOk(gpgme_listkey)
+
+        # We generate a plain text data file.
+        cmd = f"echo '{plain_data}' > {plain_file}"
+        self.assertRunOk(cmd)
+
+        # We encrypt the plain text file using gpgme-tool commands.
+        gpgme_enc_cmds = [
+            "RESET",
+            f"INPUT FILE={plain_file}",
+            f"OUTPUT FILE={enc_file}",
+            f"RECIPIENT {gpg_userid}",
+            "ENCRYPT",
+            "BYE"
+        ]
+        cmd = "gpgme-tool <<EOF\n"
+        cmd += "\n".join(gpgme_enc_cmds)
+        cmd += "\nEOF"
+        self.assertRunOk(cmd)
+
+        # The output encrypted file is supposed to exist and to have a
+        # size greater than zero.
+        self.assertRunOk(f"test -s {enc_file}")
+
+        # The output encrypted file is also expected to be different
+        # from the input plain text file.
+        _, exit_code = self.emulator.run(f"cmp {plain_file} {enc_file}")
+        self.assertNotEqual(exit_code, 0)
+
+        # We now decrypt the encrypted file using gpgme-tool commands.
+        gpgme_dec_cmds = [
+            "RESET",
+            f"INPUT FILE={enc_file}",
+            f"OUTPUT FILE={dec_file}",
+            "DECRYPT",
+            "BYE"
+        ]
+        cmd = "gpgme-tool <<EOF\n"
+        cmd += "\n".join(gpgme_dec_cmds)
+        cmd += "\nEOF"
+        self.assertRunOk(cmd)
+
+        # The decrypted file is supposed to be the same as the initial
+        # plain text file.
+        cmd = f"cmp {plain_file} {dec_file}"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
