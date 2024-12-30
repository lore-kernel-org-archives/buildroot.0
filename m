Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB69C282D1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569DF4F2FB;
	Fri, 28 Feb 2025 16:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kk61eVTs-j8L; Fri, 28 Feb 2025 16:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52C7D4FE4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C7D4FE4A;
	Fri, 28 Feb 2025 16:49:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EAFE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED0242E65
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoCyjQ2PuNJI for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8156D42697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8156D42697
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C74D87BF7; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 22:43:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b8f2f3a5e45fe2962a9fcdb148d32198929e228
X-Git-Newrev: b118c9dcf344c489b3e78a325060f01540f03eb3
X-Patchwork-Hint: ignore
Message-Id: <20250228162955.7C74D87BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new xxhash
 runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b118c9dcf344c489b3e78a325060f01540f03eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_xxhash.py | 35 ++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4fb5ae023d..a5e273056d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2004,6 +2004,7 @@ F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xfsprogs.py
 F:	support/testing/tests/package/test_xfsprogs/
 F:	support/testing/tests/package/test_xvisor.py
+F:	support/testing/tests/package/test_xxhash.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_xxhash.py b/support/testing/tests/package/test_xxhash.py
new file mode 100644
index 0000000000..00e0f245fc
--- /dev/null
+++ b/support/testing/tests/package/test_xxhash.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestXxHash(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_XXHASH=y
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
+        testfile = "data.bin"
+
+        # Check we can run the program.
+        self.assertRunOk("xxhsum --version")
+
+        # We create a test data file with random data.
+        cmd = f"dd if=/dev/urandom of={testfile} bs=1M count=1"
+        self.assertRunOk(cmd)
+
+        # For the three hash sizes, we compute the xxhash and check
+        # the integrity of the file.
+        for hsize in [32, 64, 128]:
+            hashfile = f"{testfile}.xxh{hsize}"
+            self.assertRunOk(f"xxh{hsize}sum {testfile} | tee {hashfile}")
+            self.assertRunOk(f"xxh{hsize}sum -c {hashfile}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
