Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E9EC678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C722F409B1;
	Sat,  4 Mar 2023 21:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C722F409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KDvl2H5jGFaD; Sat,  4 Mar 2023 21:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C30BE415C3;
	Sat,  4 Mar 2023 21:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C30BE415C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D23531BF82D
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 21:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B80AA415C3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 21:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B80AA415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51WhgToDh1fF for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 21:41:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53228409B1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53228409B1
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 21:41:33 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.186.38])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id BEBCC2003C6;
 Sat,  4 Mar 2023 22:41:28 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 22:41:20 +0100
Message-Id: <20230304214120.136162-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677966090;
 bh=Sn7IjWg6kL7aRu/GtfTZdhaTmjiLTk0D25dhZe6xTSU=;
 h=From:To:Cc:Subject:Date:From;
 b=N7q5WlnMCh8sSnXST8xo9+CeugCfHyZkgnIErecm4nVFI6r3ruw+sxTn4wdYbVWTU
 Vzj6oVynfE2t6Z69akv2GVPv4fxxArUi1k3JHjAgK1T77U5R0xWuQJFu9hq8VjqSLa
 rbRh0Q+F9kgxpC/b5gOuIUI4QkAHJ2J4a5QF5EXCNW4PF5B5zFHffxG13kAr9hX882
 vuNxRJU1mg7zoJSA4mo900RAffbebJ8okLx+uZRinwhMvYwDZgwuu+qnF6Iafsvfet
 5NC81E6azUE19hDglgCy+PPQH9NIsM/hmQ5wLf853wczdUGkXdLrHM0TtJNKQOUcBF
 w+01rDhi/BWpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N7q5WlnM
Subject: [Buildroot] [PATCH next 1/1]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    python3 -m flake8 support/testing/tests/package/test_mtools.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_mtools
    ...
    OK
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_mtools.py | 72 ++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 support/testing/tests/package/test_mtools.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..48b8a713ad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1719,6 +1719,7 @@ F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_libjxl.py
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
