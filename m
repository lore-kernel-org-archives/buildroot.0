Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66F3E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740238454A;
	Fri,  6 Sep 2024 20:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6Ittu5rmldO; Fri,  6 Sep 2024 20:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0551849A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0551849A3;
	Fri,  6 Sep 2024 20:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB51F1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A7840C7B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsmZqXyerlYA for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F8D407D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52F8D407D6
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EAB586587; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 18:53:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c30fe396646ab462e7252f0f30f3100d1437651
X-Git-Newrev: b3cdb0e36bf6451a80e5f35e00a31acfa3386ff4
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.4EAB586587@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add parted runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3cdb0e36bf6451a80e5f35e00a31acfa3386ff4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |   1 +
 support/testing/tests/package/test_parted.py | 107 +++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 07dafd5c4e..a4482e5eeb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1946,6 +1946,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
+F:	support/testing/tests/package/test_parted.py
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
diff --git a/support/testing/tests/package/test_parted.py b/support/testing/tests/package/test_parted.py
new file mode 100644
index 0000000000..ca585b7e02
--- /dev/null
+++ b/support/testing/tests/package/test_parted.py
@@ -0,0 +1,107 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestParted(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_PARTED=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        # Prepare the disk image.
+        disk_file = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.logfile.write(f"Creating disk image: {disk_file}\n")
+        self.emulator.logfile.flush()
+        subprocess.check_call(
+            ["dd", "if=/dev/zero", f"of={disk_file}", "bs=1M", "count=256"],
+            stdout=self.emulator.logfile,
+            stderr=self.emulator.logfile)
+
+        # Run the emulator with a drive.
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=[
+                                "-initrd", cpio_file,
+                                "-drive", f"file={disk_file},format=raw"])
+        self.emulator.login()
+
+        # We check the program can run.
+        self.assertRunOk("parted --version")
+
+        dev = "/dev/sda"
+        parted = f"parted {dev}"
+
+        # We print the partition list of our drive. Since the drive is
+        # supposed to be blank, it should not have a partition table.
+        part_list_cmd = f"{parted} print list"
+        out, ret = self.emulator.run(part_list_cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Partition Table: unknown", out)
+
+        # We create a GPT partition table.
+        mklabel_cmd = f"{parted} mklabel gpt"
+        self.assertRunOk(mklabel_cmd, timeout=10)
+
+        # We print again the partition list. We should now see our
+        # partition table.
+        out, ret = self.emulator.run(part_list_cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Partition Table: gpt", out)
+
+        # We create 3 partitions on our drive.
+        partitions = [
+            "MyPart1 ext2 1MiB 25%",
+            "MyPart2 ext4 25% 50%",
+            "MyPart3 ext4 50% 100%"
+        ]
+        for part in partitions:
+            mkpart_cmd = f"{parted} mkpart {part}"
+            self.assertRunOk(mkpart_cmd, timeout=10)
+
+        # We print again the list of partitions, this time in machine
+        # parseable format. We check we have our 3 partitions.
+        cmd = f"parted -m {dev} print list"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        for part in range(1, 4):
+            self.assertTrue(out[1+part].startswith(f"{part}:"))
+            self.assertTrue(out[1+part].endswith(f":MyPart{part}:;"))
+
+        # We format our partitions.
+        self.assertRunOk(f"mkfs.ext2 {dev}1", timeout=10)
+        self.assertRunOk(f"mkfs.ext4 {dev}2", timeout=10)
+        self.assertRunOk(f"mkfs.ext4 {dev}3", timeout=10)
+
+        # We create a random data file in the temporary directory. It
+        # will be the reference source file that will be copied later
+        # on each of our filesystems.
+        data_file = "data.bin"
+        cmd = f"dd if=/dev/urandom of=/tmp/{data_file} bs=1M count=10"
+        self.assertRunOk(cmd)
+
+        # We compute the sha256 hash and save it for later.
+        hash_cmd = f"sha256sum {data_file}"
+        out, ret = self.emulator.run(f"( cd /tmp && {hash_cmd} )")
+        self.assertEqual(ret, 0)
+        data_sha256 = out[0]
+
+        # For each partition, we create a mount point directory, mount
+        # the filesystem, copy the reference data file in it, sync the
+        # filesystem, and compute the sha256 hash of the file. This
+        # sequence will exercise a bit the partitions and filesystems
+        # in read/write operations.
+        for part in range(1, 4):
+            self.assertRunOk(f"mkdir -p /tmp/MyPart{part}")
+            self.assertRunOk(f"mount {dev}{part} /tmp/MyPart{part}")
+            self.assertRunOk(f"cp /tmp/{data_file} /tmp/MyPart{part}/")
+            self.assertRunOk("sync")
+            out, ret = self.emulator.run(f"( cd /tmp/MyPart{part} && {hash_cmd} )")
+            self.assertEqual(ret, 0)
+            self.assertEqual(out[0], data_sha256)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
