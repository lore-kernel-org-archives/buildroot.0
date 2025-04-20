Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D722C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 16:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBC8A405ED;
	Sun, 20 Apr 2025 16:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mzwRcoVMnZS; Sun, 20 Apr 2025 16:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DD0405C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15DD0405C3;
	Sun, 20 Apr 2025 16:04:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A906968
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A663D403AC
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3A0k9-YedOqd for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 16:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 826D04038E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 826D04038E
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C59485DF1; Sun, 20 Apr 2025 16:04:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Apr 2025 17:37:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4567c35d066ea75050367a364ecdfca6548f4f87
X-Git-Newrev: f438ae3422b0b860ef96cb213c71fe7508777b25
X-Patchwork-Hint: ignore
Message-Id: <20250420160435.6C59485DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add lighttpd runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=f438ae3422b0b860ef96cb213c71fe7508777b25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_lighttpd.py | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 73b24ca60a..3a921c8a74 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1942,6 +1942,7 @@ F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libcurl.py
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_lighttpd.py
 F:	support/testing/tests/package/test_links.py
 F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
diff --git a/support/testing/tests/package/test_lighttpd.py b/support/testing/tests/package/test_lighttpd.py
new file mode 100644
index 0000000000..54dd68bcda
--- /dev/null
+++ b/support/testing/tests/package/test_lighttpd.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestLighttpd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LIGHTTPD=y
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
+        self.assertRunOk("lighttpd -v")
+        self.assertRunOk(f"echo '{msg}' > /var/www/index.html")
+        self.assertRunOk("wget http://localhost/index.html")
+        self.assertRunOk(f"grep -F '{msg}' index.html")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
