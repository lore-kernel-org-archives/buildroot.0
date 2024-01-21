Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB11FC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49A5B40494;
	Sun, 21 Jan 2024 10:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A5B40494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8g-Td-TGl4eY; Sun, 21 Jan 2024 10:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7257140518;
	Sun, 21 Jan 2024 10:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7257140518
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4400B1BF865
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BED415D5
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BED415D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvvmsBPPEuW4 for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EE0A41559
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE0A41559
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC34D8639C; Sun, 21 Jan 2024 10:18:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 11:17:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5fc5e4df8bc52a7c99c68a102550b7a2554fa9b
X-Git-Newrev: c20bf23fe920b7caefdc6f29339fb11c98c24439
X-Patchwork-Hint: ignore
Message-Id: <20240121101813.EC34D8639C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add netcat runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c20bf23fe920b7caefdc6f29339fb11c98c24439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_netcat.py | 41 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 38db10b2e0..2cb4783aa8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1793,6 +1793,7 @@ F:	support/testing/tests/package/test_lzop.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_mtr.py
 F:	support/testing/tests/package/test_ncdu.py
+F:	support/testing/tests/package/test_netcat.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_netcat.py b/support/testing/tests/package/test_netcat.py
new file mode 100644
index 0000000000..b3efa4c40b
--- /dev/null
+++ b/support/testing/tests/package/test_netcat.py
@@ -0,0 +1,41 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestNetCat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NETCAT=y
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
+        self.assertRunOk("nc --version")
+
+        in_file = "input.bin"
+        out_file = "output.bin"
+        port = 12345
+
+        cmd = f"dd if=/dev/urandom of={in_file} bs=1k count=1k"
+        self.assertRunOk(cmd)
+
+        cmd = f"nc -l -p {port} > {out_file} &"
+        self.assertRunOk(cmd)
+
+        time.sleep(1)
+
+        cmd = f"cat {in_file} | nc -c 127.0.0.1 {port}"
+        self.assertRunOk(cmd)
+
+        cmd = f"cmp {in_file} {out_file}"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
