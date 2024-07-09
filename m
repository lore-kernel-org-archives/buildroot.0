Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C30C3DA45
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1B7340EDF;
	Tue,  9 Jul 2024 20:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkMO7UlEklVa; Tue,  9 Jul 2024 20:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C12840EFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C12840EFA;
	Tue,  9 Jul 2024 20:24:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C87711BF97E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B58D2409B4
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4p5gbXkjoTg for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9113402EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9113402EE
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4538843F9; Tue,  9 Jul 2024 20:24:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 22:15:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e912b3bcfaeb2ea6caa2647c75b63b8c5e5ea186
X-Git-Newrev: 6b625b42aa68a8ab838d0fd9a9d82ca47aa7cf44
X-Patchwork-Hint: ignore
Message-Id: <20240709202415.A4538843F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add atftp test
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b625b42aa68a8ab838d0fd9a9d82ca47aa7cf44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_atftp.py | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2c05337f1d..f817776474 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -551,6 +551,7 @@ F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
 F:	package/unifdef/
 F:	package/vmtouch/
+F:	support/testing/tests/package/test_atftp.py
 F:	support/testing/tests/package/test_zip.py
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
diff --git a/support/testing/tests/package/test_atftp.py b/support/testing/tests/package/test_atftp.py
new file mode 100644
index 0000000000..95e76c07cb
--- /dev/null
+++ b/support/testing/tests/package/test_atftp.py
@@ -0,0 +1,28 @@
+import os
+
+import infra.basetest
+
+
+class TestAtftp(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ATFTP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+
+        self.emulator.login()
+
+        self.assertRunOk("mkdir -p /tftpboot")
+        self.assertRunOk("echo 'Hello World' >/tftpboot/test_atftp.txt")
+
+        # atftpd is launched by /etc/init.d/S80atftpd
+        self.assertRunOk("atftp -g -r test_atftp.txt -l /tmp/test_atftp.txt localhost")
+        output, exit_code = self.emulator.run("cat /tmp/test_atftp.txt")
+        self.assertEqual("".join(output), "Hello World")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
