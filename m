Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA77C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC6360008;
	Mon,  3 Feb 2025 22:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yR9gU01UYSkc; Mon,  3 Feb 2025 22:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB50D600D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB50D600D1;
	Mon,  3 Feb 2025 22:06:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D44185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDA3E40159
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7EisX-LiGKo for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCBA440102
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCBA440102
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:06:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C613A8693B; Mon,  3 Feb 2025 22:06:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:05:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 292631cd090fb3453c02926b77d6361dd965c112
X-Git-Newrev: fefe7024a38f11bf0d62e7435aaec9847ede4976
X-Patchwork-Hint: ignore
Message-Id: <20250203220644.C613A8693B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new wget runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=fefe7024a38f11bf0d62e7435aaec9847ede4976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_wget.py | 57 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e71260f60..5a1d9fda7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2012,6 +2012,7 @@ F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_vorbis_tools.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
+F:	support/testing/tests/package/test_wget.py
 F:	support/testing/tests/package/test_which.py
 F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xfsprogs.py
diff --git a/support/testing/tests/package/test_wget.py b/support/testing/tests/package/test_wget.py
new file mode 100644
index 0000000000..c121cbd21c
--- /dev/null
+++ b/support/testing/tests/package/test_wget.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestWget(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_WGET=y
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
+        fname = "file.txt"
+        url = f"http://localhost/{fname}"
+
+        # We check the program can execute. This also checks we have
+        # the GNU wget version, rather than the BusyBox version which
+        # does not know the --version option.
+        self.assertRunOk("wget --version")
+
+        # We create a simple file to serve.
+        self.assertRunOk(f"echo '{msg}' > /var/www/data/{fname}")
+
+        # We try to download that file, using our local httpd server.
+        self.assertRunOk(f"wget --progress=dot {url}")
+
+        # We check the downloaded file contains our initial message.
+        out, ret = self.emulator.run(f"cat {fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download again the file without saving it, but printing
+        # it on stdout this time.
+        out, ret = self.emulator.run(f"wget -q -O - {url}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download one last time, showing the server response. We
+        # check we can see the OK status and our thttpd server
+        # identification.
+        cmd = f"wget --no-verbose --server-response -O /dev/null {url}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out)
+        self.assertIn("HTTP/1.1 200 OK", out_str)
+        self.assertIn("Server: thttpd/", out_str)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
