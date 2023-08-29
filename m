Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C500C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAC36417D3;
	Wed, 30 Aug 2023 20:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAC36417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFF9RDoCooc9; Wed, 30 Aug 2023 20:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FC54417CB;
	Wed, 30 Aug 2023 20:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC54417CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40BCF1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A21A8146B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A21A8146B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjk8IE_M35ho for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:34:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C8E78143F
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C8E78143F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AD0B86622; Wed, 30 Aug 2023 20:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 23:57:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f8047ff5987efc80f6ead51edae126911c02a8ad
X-Git-Newrev: bea949996e193e3d40ea7dd45122f8fce75f8cd0
X-Patchwork-Hint: ignore
Message-Id: <20230830203425.2AD0B86622@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_nu.py: new runtime test
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
Content-Type: multipart/mixed; boundary="===============0133527965247879454=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0133527965247879454==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bea949996e193e3d40ea7dd45122f8fce75f8cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Load sample script support/testing/tests/package/sample_nu.nu onto the
target and verify proper execution by nushell

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  2 ++
 support/testing/tests/package/sample_nu.nu |  6 ++++++
 support/testing/tests/package/test_nu.py   | 32 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 24ec17a7c2..db0ea49f90 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2685,6 +2685,8 @@ F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:	package/nushell/
+F:	support/testing/tests/package/sample_nu.nu
+F:	support/testing/tests/package/test_nu.py
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
diff --git a/support/testing/tests/package/sample_nu.nu b/support/testing/tests/package/sample_nu.nu
new file mode 100644
index 0000000000..5287862cf1
--- /dev/null
+++ b/support/testing/tests/package/sample_nu.nu
@@ -0,0 +1,6 @@
+#! /usr/bin/nu
+def greet [name] {
+  ["hello" $name]
+}
+
+greet "world"
diff --git a/support/testing/tests/package/test_nu.py b/support/testing/tests/package/test_nu.py
new file mode 100644
index 0000000000..14ddacfbc8
--- /dev/null
+++ b/support/testing/tests/package/test_nu.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestNu(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it doesn't
+    # support a host rustc which is necessary for nushell
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_PACKAGE_NUSHELL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+                   infra.filepath("tests/package/sample_nu.nu"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+        cmd = "nu sample_nu.nu"
+        self.assertRunOk(cmd)

--===============0133527965247879454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0133527965247879454==--
