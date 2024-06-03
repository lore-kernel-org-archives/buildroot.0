Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFAFC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D3D408EF;
	Mon,  3 Jun 2024 17:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id og0yWPWcN_GR; Mon,  3 Jun 2024 17:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01DFE40928
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01DFE40928;
	Mon,  3 Jun 2024 17:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B20641BF83B
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F44781144
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2ZL_fMyKBP8 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E0B81137
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E0B81137
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF16E87A1D; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 18:06:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: fe189deeed96779f9fb8c9006a85b50034322365
X-Git-Newrev: 1e70541c8546c215fc3b6f2dd127596cf635c572
X-Patchwork-Hint: ignore
Message-Id: <20240603173429.BF16E87A1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add zbar
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e70541c8546c215fc3b6f2dd127596cf635c572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 85f0941532c424df2d7b1cfc153546d02dd3cd12)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_zbar.py | 37 ++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index de9585bd3f..88b042921c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1872,6 +1872,7 @@ F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
+F:	support/testing/tests/package/test_zbar.py
 F:	support/testing/tests/package/test_zchunk.py
 F:	support/testing/tests/package/test_zstd.py
 
diff --git a/support/testing/tests/package/test_zbar.py b/support/testing/tests/package/test_zbar.py
new file mode 100644
index 0000000000..b840df089a
--- /dev/null
+++ b/support/testing/tests/package/test_zbar.py
@@ -0,0 +1,37 @@
+import os
+
+import infra.basetest
+
+
+class TestZbar(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IMAGEMAGICK=y
+        BR2_PACKAGE_LIBQRENCODE=y
+        BR2_PACKAGE_LIBQRENCODE_TOOLS=y
+        BR2_PACKAGE_ZBAR=y
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
+        txt_msg = "Hello Buildroot!"
+        qr_img = "qr.png"
+
+        # We check the program can execute.
+        self.assertRunOk("zbarimg --version")
+
+        # We generate a QR code image containing a message.
+        self.assertRunOk(f"qrencode -o '{qr_img}' '{txt_msg}'")
+
+        # We decode the QR code image and check the extracted message
+        # is the expected one.
+        out, ret = self.emulator.run(f"zbarimg -q --raw {qr_img}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], txt_msg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
