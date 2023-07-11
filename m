Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4F2EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 20:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BD48835C9;
	Tue, 11 Jul 2023 20:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BD48835C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qQA2G9r2E-R; Tue, 11 Jul 2023 20:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87AE483A79;
	Tue, 11 Jul 2023 20:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87AE483A79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB47F1BF97C
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9528C61135
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9528C61135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfVoy4aa7bXm for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8722E60B3C
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8722E60B3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7227486E1C; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 22:31:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc3700ec9a51fc4d89728a363acf6408b0a35b8e
X-Git-Newrev: cf132a137bb2a6b2ec5af38ff901795f16653cb8
X-Patchwork-Hint: ignore
Message-Id: <20230711204359.7227486E1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_compressor_base.py: new helper class
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf132a137bb2a6b2ec5af38ff901795f16653cb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a helper class providing a template for testing data
compressor and decompressor programs such as gzip, bzip2, xz...

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 .../testing/tests/package/test_compressor_base.py  | 126 +++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95f5305d6c..57c25c4cfd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1728,6 +1728,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/support/testing/tests/package/test_compressor_base.py b/support/testing/tests/package/test_compressor_base.py
new file mode 100644
index 0000000000..6555584c10
--- /dev/null
+++ b/support/testing/tests/package/test_compressor_base.py
@@ -0,0 +1,126 @@
+import os
+
+import infra.basetest
+
+
+class TestCompressorBase(infra.basetest.BRTest):
+    """Common class to test a data compression/decompression package.
+
+    Build an image containing the package enabled in config, start the
+    emulator, login to it. It prepares a test data file with some
+    redundancy to let compression program reduce the file size.
+
+    Each test case that inherits from this class must have:
+    __test__ = True  - to let nose2 know that it is a test case
+    config           - defconfig fragment with the packages to run the test
+    compress_cmd     - the compression program command (ex: "gzip")
+                       it can also contain arguments (ex: "gzip -9")
+    It also can have:
+    decompress_cmd   - the decompression program (ex: "gunzip")
+                       if unset, the default value is "un" appended with the
+                       value of "compress_cmd".
+    check_integrity_cmd
+                     - the integrity check command (ex: "gzip -t")
+                       in unset, the default value is "compress_cmd" appended
+                       with " -t".
+    compressed_file_ext
+                     - the file extention of compressed files created by the
+                       compress command. (ex: ".gz")
+                       if unset, the default value is a dot "." appended with
+                       the value of "compress_cmd".
+    timeout          - timeout to the compression command. Some compression
+                       program can take more time than the default value
+                       (set to 5 seconds).
+    """
+    __test__ = False
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    compress_cmd = "compressor-unknown"
+    decompress_cmd = None
+    check_integrity_cmd = None
+    compressed_file_ext = None
+    timeout = 5
+
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestCompressorBase, self).__init__(names)
+
+        if self.decompress_cmd is None:
+            self.decompress_cmd = "un" + self.compress_cmd
+
+        if self.check_integrity_cmd is None:
+            self.check_integrity_cmd = self.compress_cmd + " -t"
+
+        if self.compressed_file_ext is None:
+            self.compressed_file_ext = "." + self.compress_cmd
+
+        self.ref_file = "reference.bin"
+        self.test_file = "test.bin"
+        self.comp_test_file = self.test_file + self.compressed_file_ext
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.prepare_data()
+        self.compress_test()
+        self.check_integrity_test()
+        self.uncompress_test()
+        self.compare_test()
+
+    def prepare_data(self):
+        # Create a data file composed of: 128kB of random data, then
+        # 128kB of zeroes, then a repetition of the 1st 128kB of
+        # random.
+        self.assertRunOk("dd if=/dev/urandom of=rand.bin bs=128k count=1")
+        self.assertRunOk("dd if=/dev/zero of=zeroes.bin bs=128k count=1")
+        self.assertRunOk(f"cat rand.bin zeroes.bin rand.bin > {self.ref_file}")
+
+        # Keep a copy of the reference data since
+        # compressor/decompressor programs usually unlink source data
+        # file.
+        self.assertRunOk(f"cp {self.ref_file} {self.test_file}")
+
+    def compress_test(self):
+        # Run the compression
+        self.assertRunOk(f"{self.compress_cmd} {self.test_file}", timeout=self.timeout)
+
+        # Check that the compressed file was created with the expected name
+        self.assertRunOk(f"test -e {self.comp_test_file}")
+
+        # Remove the input test file. Some compressors (like gzip) are
+        # removing it automatically by default. Some others (like lz4)
+        # are keeping those by default. We always remove it to make
+        # sure a new file will be recreated by the decompression.
+        self.assertRunOk(f"rm -f {self.test_file}")
+
+        # Check the compressed file is smaller than the input.
+        # The "ls -l" command is for simplifying debugging
+        self.assertRunOk(f"ls -l {self.ref_file} {self.comp_test_file}")
+        ref_sz_cmd = f"wc -c < {self.ref_file}"
+        comp_sz_cmd = f"wc -c < {self.comp_test_file}"
+        self.assertRunOk(f"test $({ref_sz_cmd}) -gt $({comp_sz_cmd})")
+
+    def check_integrity_test(self):
+        # Check the compressed file integrity
+        self.assertRunOk(f"{self.check_integrity_cmd} {self.comp_test_file}")
+
+    def uncompress_test(self):
+        # Run the decompression
+        self.assertRunOk(f"{self.decompress_cmd} {self.comp_test_file}")
+
+        # Check the decompressed file was created with the correct name
+        self.assertRunOk(f"test -e {self.test_file}")
+
+    def compare_test(self):
+        # Check the decompressed file is exactly the same as the
+        # reference created at the beginning
+        self.assertRunOk(f"cmp {self.test_file} {self.ref_file}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
