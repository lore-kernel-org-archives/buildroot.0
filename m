Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640ECC02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30CA080AB3;
	Tue,  4 Feb 2025 14:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OzFRPmbS_9F; Tue,  4 Feb 2025 14:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35821818D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35821818D0;
	Tue,  4 Feb 2025 14:36:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 802CE185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56D5060FE3
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnwC8bHIJxF9 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6844160FE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6844160FE6
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:36:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 596B286D69; Tue,  4 Feb 2025 14:36:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:21:16 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c4a75ea14d4c8a8566404ca3b9dfc12782f3ed3e
X-Git-Newrev: 96e238c7066b99ddf966682e4f9c973a423bf4d8
X-Patchwork-Hint: ignore
Message-Id: <20250204143642.596B286D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 libcurl runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96e238c7066b99ddf966682e4f9c973a423bf4d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 292631cd090fb3453c02926b77d6361dd965c112)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_libcurl.py | 55 +++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9498e9898b..96d009e5a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1799,6 +1799,7 @@ F:	support/testing/tests/package/test_kmscube/
 F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
+F:	support/testing/tests/package/test_libcurl.py
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_links.py
diff --git a/support/testing/tests/package/test_libcurl.py b/support/testing/tests/package/test_libcurl.py
new file mode 100644
index 0000000000..b326f9308f
--- /dev/null
+++ b/support/testing/tests/package/test_libcurl.py
@@ -0,0 +1,55 @@
+import os
+
+import infra.basetest
+
+
+class TestLibCurl(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
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
+        # We check the program can execute.
+        self.assertRunOk("curl --version")
+
+        # We create a simple file to serve.
+        self.assertRunOk(f"echo '{msg}' > /var/www/data/{fname}")
+
+        # We try to download that file, using our local httpd server.
+        self.assertRunOk(f"curl -o {fname} {url}")
+
+        # We check the downloaded file contains our initial message.
+        out, ret = self.emulator.run(f"cat {fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download again the file without saving it, but printing
+        # it on stdout this time.
+        out, ret = self.emulator.run(f"curl -q {url}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download one last time, showing the server response. We
+        # check we can see the OK status and our thttpd server
+        # identification.
+        cmd = f"curl --no-progress-meter --dump-header - -o /dev/null {url}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out)
+        self.assertIn("HTTP/1.1 200 OK", out_str)
+        self.assertIn("Server: thttpd/", out_str)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
