Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07DCC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649EB4167E;
	Sun, 12 Mar 2023 21:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 649EB4167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4mp_oCeIDko; Sun, 12 Mar 2023 21:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA9E41748;
	Sun, 12 Mar 2023 21:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA9E41748
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6095F1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB889408C0
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB889408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YP03iyh1hhUW for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2468C4012B
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2468C4012B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C20C87007; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 14:16:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06fa870d7e8ba385de00e64116df74c1e3b9b31a
X-Git-Newrev: 620098889f74ad924676fca7d8d56eb401a7d0be
X-Patchwork-Hint: ignore
Message-Id: <20230312214625.1C20C87007@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_iperf3.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=620098889f74ad924676fca7d8d56eb401a7d0be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_iperf3.py | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f6e120d92b..ff26021d1d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1718,6 +1718,7 @@ F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
diff --git a/support/testing/tests/package/test_iperf3.py b/support/testing/tests/package/test_iperf3.py
new file mode 100644
index 0000000000..9aac4c6fd0
--- /dev/null
+++ b/support/testing/tests/package/test_iperf3.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestIperf3(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPERF3=y
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
+        self.assertRunOk("iperf3 --version")
+        self.assertRunOk("iperf3 -s -D")
+        self.assertRunOk("iperf3 -c 127.0.0.1 -t 3")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
