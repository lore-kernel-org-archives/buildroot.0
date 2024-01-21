Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A31C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7059E40528;
	Sun, 21 Jan 2024 10:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7059E40528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiSOMVoEqbbr; Sun, 21 Jan 2024 10:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 839BD4045C;
	Sun, 21 Jan 2024 10:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 839BD4045C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13A741BF865
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DED444045C
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DED444045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAfzbAQtgTw2 for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E56B34039D
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E56B34039D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCC338639A; Sun, 21 Jan 2024 10:18:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 11:17:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f59c175a484fcc47c6875db49ad03eb83b90523
X-Git-Newrev: ed516e25a1322f0081cbb396cf1dc7a8447dd8fb
X-Patchwork-Hint: ignore
Message-Id: <20240121101813.CCC338639A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add mtr runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed516e25a1322f0081cbb396cf1dc7a8447dd8fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_mtr.py | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..0242b749e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1790,6 +1790,7 @@ F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
 F:	support/testing/tests/package/test_mtools.py
+F:	support/testing/tests/package/test_mtr.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
diff --git a/support/testing/tests/package/test_mtr.py b/support/testing/tests/package/test_mtr.py
new file mode 100644
index 0000000000..d78b33a31a
--- /dev/null
+++ b/support/testing/tests/package/test_mtr.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestMtr(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MTR=y
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
+        self.assertRunOk("mtr --version")
+        self.assertRunOk("mtr -r -c 5 127.0.0.1", timeout=30)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
