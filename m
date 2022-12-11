Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7184C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7853940210;
	Sun, 11 Dec 2022 13:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7853940210
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uzwSXozCyaA; Sun, 11 Dec 2022 13:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 668E8401C6;
	Sun, 11 Dec 2022 13:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668E8401C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 487DA1BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E329260B8A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E329260B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxoqntbMh5nJ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8F0E60B94
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8F0E60B94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6F8F86094; Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94170d3ecbbf751adfc55c79d6e5619b0a1ce018
X-Git-Newrev: 6ad775fc8118927bde9bf442bbb7e8307280e97d
X-Patchwork-Hint: ignore
Message-Id: <20221211130926.B6F8F86094@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_ncdu.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ad775fc8118927bde9bf442bbb7e8307280e97d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_ncdu.py | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 20677ef8ce..04047d43da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1683,6 +1683,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_ncdu.py b/support/testing/tests/package/test_ncdu.py
new file mode 100644
index 0000000000..cbbb27f751
--- /dev/null
+++ b/support/testing/tests/package/test_ncdu.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestNcdu(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_NCDU=y
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
+        self.assertRunOk("ncdu --version")
+        self.assertRunOk("ncdu -x -o /tmp/ncdu.list /")
+        self.assertRunOk("grep -F '\"name\":\"ncdu\"' /tmp/ncdu.list")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
