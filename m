Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E89C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 21:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C251B8203B;
	Wed,  3 Jul 2024 21:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uu95SyiDD-hW; Wed,  3 Jul 2024 21:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6FCA820AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6FCA820AB;
	Wed,  3 Jul 2024 21:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A44981BF2F0
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9225C61059
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-4FlqGf5Bgc for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 21:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B284A61056
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B284A61056
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 21:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2ED7812CF; Wed,  3 Jul 2024 21:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 23:50:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99423ee495ee28789edcc98ff8f92876a294dc37
X-Git-Newrev: 3ebc7c69d56430c34eba4c869d1d4fe4d1e8de55
X-Patchwork-Hint: ignore
Message-Id: <20240703215920.A2ED7812CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new rt-tests runtime test
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ebc7c69d56430c34eba4c869d1d4fe4d1e8de55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_rt_tests.py | 39 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d9fcd97df..90d1a111ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1893,6 +1893,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_python_sympy.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_rt_tests.py
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_socat.py
diff --git a/support/testing/tests/package/test_rt_tests.py b/support/testing/tests/package/test_rt_tests.py
new file mode 100644
index 0000000000..0795d7afd2
--- /dev/null
+++ b/support/testing/tests/package/test_rt_tests.py
@@ -0,0 +1,39 @@
+import os
+
+import infra.basetest
+
+
+class TestRtTests(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_RT_TESTS=y
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
+        # We cannot easily test realtime properties in a CI/emulator
+        # environment. Instead, this test runs few rt-tests programs
+        # in small scenario configurations (to make sure the execution
+        # will remain short). It just makes sure the execution returns
+        # a success code. Also, to avoid making the logs too big, we
+        # generally pass the "--quiet" option to have a summary at the
+        # end of the execution.
+        test_cmds = [
+            "cyclictest --quiet --loops=200",
+            "hackbench --fds=2 --groups=3 --loops=5",
+            "pi_stress --inversions=100",
+            "ptsematest --quiet --loops=100",
+            "rt-migrate-test --quiet --loops=5",
+            "signaltest --quiet --loops=200",
+            "sigwaittest --quiet --loops=100"
+        ]
+
+        for cmd in test_cmds:
+            self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
