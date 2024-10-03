Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF299CF34B6
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 15:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EE160787;
	Thu,  3 Oct 2024 15:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykks9Qjz4W5a; Thu,  3 Oct 2024 15:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36C4607A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36C4607A3;
	Thu,  3 Oct 2024 15:47:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81ACC1BF5A4
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E5B58209D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otHMh_odxSzm for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 15:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CB378209A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CB378209A
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 15:47:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E94884ED4; Thu,  3 Oct 2024 15:47:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Oct 2024 16:45:25 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 40499fc13a3f5b868cbf4ad140321891807472b9
X-Git-Newrev: d523f2b10c78d05548197fe5dbb9d4fb80c5fcb9
X-Patchwork-Hint: ignore
Message-Id: <20241003154731.4E94884ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add pv
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

commit: https://git.buildroot.net/buildroot/commit/?id=d523f2b10c78d05548197fe5dbb9d4fb80c5fcb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8c5e4be97c8083589665420e438d8b43515b3a00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_pv.py | 57 ++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dff8481af..5e9cd77abe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1865,6 +1865,7 @@ F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_postgresql.py
+F:	support/testing/tests/package/test_pv.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
diff --git a/support/testing/tests/package/test_pv.py b/support/testing/tests/package/test_pv.py
new file mode 100644
index 0000000000..cfa3c29392
--- /dev/null
+++ b/support/testing/tests/package/test_pv.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestPv(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PV=y
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
+        # We check the program can run.
+        self.assertRunOk("pv --version")
+
+        # We check that "pv" works like the "cat" command. We print a
+        # message on its standard input and redirect its output to a
+        # file. We also force the pv terminal width to 80, since
+        # "infra.emulator" is setting a large width to prevent
+        # line wrapping.
+        msg = "Hello Buildroot!"
+        out_file = "/tmp/out.txt"
+        cmd = f"echo '{msg}' | pv -w80 > {out_file}"
+        self.assertRunOk(cmd)
+
+        # We check the pv output file contains exactly our message.
+        cmd = f"cat {out_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # Finally, we check that "pv" correctly shows a progress
+        # bar. We print few lines, one per second into "pv" setup in
+        # line mode. We check the last pv status line contains the
+        # correct count and a "100%" string that shows completion.
+        lines = 5
+        print_ln_cmd = f"( for X in $(seq {lines}) ; do echo $X ; sleep 1 ; done )"
+        cmd = f"{print_ln_cmd} | pv -s{lines} -l -w80 > /dev/null"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        # pv updates status may contain extra spaces, and is updated
+        # with carriage return characters. We strip lines and filter
+        # out empty remaining lines, to make sure we get the last
+        # meaningful status line.
+        pv_out = [ln.strip() for ln in out]
+        pv_out = [ln for ln in pv_out if ln]
+        last_line = pv_out[-1]
+        self.assertTrue(last_line.startswith(str(lines)))
+        self.assertTrue(last_line.endswith("100%"))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
