Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE333C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58AE34092B;
	Tue,  6 Feb 2024 21:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LW_Rw-jfSvds; Tue,  6 Feb 2024 21:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E7A64092F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E7A64092F;
	Tue,  6 Feb 2024 21:53:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF181BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48880401B1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yw8rsj11bse for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09FC7400D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09FC7400D3
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:53:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01FF987416; Tue,  6 Feb 2024 21:53:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 22:52:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26b7e0f2824e6df7d865ffae8ff2ec17fd58a9e8
X-Git-Newrev: c7bbea9a6c4780210afc6ff6da3513b83a8a0270
X-Patchwork-Hint: ignore
Message-Id: <20240206215310.01FF987416@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add thttpd runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7bbea9a6c4780210afc6ff6da3513b83a8a0270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_thttpd.py | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d916ff6a1..376a1662d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1847,6 +1847,7 @@ F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_tesseract_ocr.py
+F:	support/testing/tests/package/test_thttpd.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_usbutils.py
diff --git a/support/testing/tests/package/test_thttpd.py b/support/testing/tests/package/test_thttpd.py
new file mode 100644
index 0000000000..007bc91f2d
--- /dev/null
+++ b/support/testing/tests/package/test_thttpd.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestThttpd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_THTTPD=y
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
+        msg = "Hello Buildroot!"
+
+        self.assertRunOk("thttpd -V")
+        self.assertRunOk(f"echo '{msg}' > /var/www/data/index.html")
+        self.assertRunOk("wget http://localhost/index.html")
+        self.assertRunOk(f"grep -F '{msg}' index.html")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
