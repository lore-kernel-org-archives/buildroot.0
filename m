Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E68FC43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F1960ED3;
	Sat, 16 Jul 2022 22:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03F1960ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUbhLIVuYv1p; Sat, 16 Jul 2022 22:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B02660BCB;
	Sat, 16 Jul 2022 22:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B02660BCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D437A1BF964
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A794841821
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A794841821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zuwU_MqdCU3 for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:00:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6684B41820
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6684B41820
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9344D83957; Sat, 16 Jul 2022 21:46:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 23:44:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 209290924987b41d82e3b6edc00b6932915e511c
X-Git-Newrev: 49fde7057ed98bee28e12560760fac2edd75945c
X-Patchwork-Hint: ignore
Message-Id: <20220716214654.9344D83957@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for pixz
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5499646067741573078=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5499646067741573078==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=49fde7057ed98bee28e12560760fac2edd75945c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple compress-uncompress test to verify that pixz is working.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_pixz.py | 40 ++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0afd697b6c..9a740d650d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2917,6 +2917,7 @@ F:	configs/uevm5432_defconfig
 F:	package/i7z/
 F:	package/msr-tools/
 F:	package/pixz/
+F:	support/testing/tests/package/test_pixz.py
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
diff --git a/support/testing/tests/package/test_pixz.py b/support/testing/tests/package/test_pixz.py
new file mode 100644
index 0000000000..eeff10eaa1
--- /dev/null
+++ b/support/testing/tests/package/test_pixz.py
@@ -0,0 +1,40 @@
+import os
+
+import infra.basetest
+
+
+class TestPixz(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PIXZ=y
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
+        # Prepare input file with random data and zeroes.
+        # We keep the size small (4 MB) for the sake of test time.
+        cmd = "dd if=/dev/urandom of=orig bs=1M count=2 && " \
+              "dd if=/dev/zero of=orig bs=1M count=2 seek=2"
+        self.assertRunOk(cmd)
+
+        # Compress.
+        # We ask for 3 threads for good measure but with a very small file on a
+        # uniprocessor qemu this is only a light validation.
+        cmd = "cp -v orig compressed && pixz -p 3 compressed"
+        self.assertRunOk(cmd, timeout=60)
+
+        # Uncompress.
+        cmd = "cp -v compressed.xz uncompressed.xz && pixz -d uncompressed.xz"
+        self.assertRunOk(cmd)
+
+        # Verify.
+        # The ls is there for debugging.
+        cmd = "ls -l && cmp orig uncompressed"
+        self.assertRunOk(cmd)

--===============5499646067741573078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5499646067741573078==--
