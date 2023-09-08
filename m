Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63C5EEB570
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 21:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72C7440162;
	Fri,  8 Sep 2023 21:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72C7440162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIBN8TvdFPre; Fri,  8 Sep 2023 21:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A3D40169;
	Fri,  8 Sep 2023 21:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A3D40169
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F081A1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 21:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08E14033F
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 21:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08E14033F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PtPQd_3RXV8 for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 21:03:10 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1582740220
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 21:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1582740220
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 177D713F880;
 Fri,  8 Sep 2023 23:03:06 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 23:02:53 +0200
Message-ID: <20230908210253.9480-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694206987;
 bh=n9PjUMxjyfy25tVTdobBn1obwf7+JOO58UNR4mtuEX8=;
 h=From:To:Cc:Subject:Date:From;
 b=kONLB/UnEsFLS++kmE9bpL+RBw541j5a6lfkjmE+OufoUIkJehHCwBCfS+QKG1Dtn
 Vbki6ZOYzyHi8HaoD01cd0bp+p4l21JTO0tIDEo4wMnoCKGMJBOjcoV5EwTcyx9MAt
 54KrxPvr8nM7Rx/rBIt2s3yudJ0pxSNtTUArALAV6IIydvY8ZeFqp1IIusOmRIm77J
 uhFs6dA2jHC20z7s19jDEfhdTtFZjD7DR/n6uvoDdRN2DpD7kJfgb3Tg7lIJMsP9nH
 5cQLmKmwSygC2dLCeFf+KDonhwYpUiErRvISHGyVJjBMJLsH+1A2WoaBjKp+A2JK0J
 CPWY4NjTwE5Bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kONLB/Un
Subject: [Buildroot] [PATCH 1/1]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_libgpgme.py    | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 support/testing/tests/package/test_libgpgme.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 26d0a0c223..b3dcfce6c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1769,6 +1769,7 @@ F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
+F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
new file mode 100644
index 0000000000..5f39f4a610
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
+        # We did not created a gpg key yet. We should not be able to
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
