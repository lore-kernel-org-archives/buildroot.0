Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCD0EEB56E
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29781403D8;
	Fri,  8 Sep 2023 20:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29781403D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sffkrgs9K9sF; Fri,  8 Sep 2023 20:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF0840939;
	Fri,  8 Sep 2023 20:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF0840939
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 278221BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F262140939
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F262140939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9-2P6FTMi9o for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:55:52 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F290A403D8
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F290A403D8
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BF18113F861;
 Fri,  8 Sep 2023 22:55:48 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 22:55:38 +0200
Message-ID: <20230908205538.8026-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694206550;
 bh=fXneV+rJR1IK1tBwlRChEWm1s+NiPSpLcChmhJoe3rs=;
 h=From:To:Cc:Subject:Date:From;
 b=rZcwWpz+f1mjruVGZdvOUCc24BzbaebZWptZBbAG7NUh2eTaz/qEFou0N97XqjhiN
 B2BLvZkQaZLsEWjdROouuJj1m6PjOzvuP6SvBqBCWv03YAOklI4m0NpRJnv7b+ikM3
 FpcURItKTRWZPam0/wAzDzQBDOHcAQymowFpWqHz5vuHEK/Gb+yW4iZn+AX6eRGPEx
 /ujOrvbdrfxAhaJ+mrGYm1T2Z3lI0fD0hfOLfciUi8i2q1z37dbzh3aNwsm6aM1+ZH
 oB09c/ehLpW609B51W0paWvqbVlM0K6kv3wvsvCKIBFwa9E0V+cgUsBVHfne6WAi5h
 vG6kRBSKGRJhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rZcwWpz+
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_screen.py: new runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_screen.py | 61 ++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 support/testing/tests/package/test_screen.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..bf25f2c61e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1794,6 +1794,7 @@ F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
diff --git a/support/testing/tests/package/test_screen.py b/support/testing/tests/package/test_screen.py
new file mode 100644
index 0000000000..bb3ce29ba0
--- /dev/null
+++ b/support/testing/tests/package/test_screen.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestScreen(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_SCREEN=y
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
+        session_name = "BuildrootSession"
+        message = "HelloBuildroot"
+        screen_dump = "screen.dump.txt"
+
+        # Check the program can execute
+        self.assertRunOk("screen --version")
+
+        # There is no "screen" running yet. Listing sessions is
+        # expected to fail.
+        _, exit_code = self.emulator.run("screen -ls")
+        self.assertNotEqual(exit_code, 0)
+
+        # We now start a detached and named session.
+        self.assertRunOk(f"screen -dmS {session_name}")
+
+        # Since we are supposed to have a running session, it should
+        # appear in the list.
+        output, exit_code = self.emulator.run("screen -ls")
+        self.assertEqual(exit_code, 0)
+        self.assertIn(session_name, "\n".join(output))
+
+        # We send an exec command to print a message in the "screen"
+        # display running in background.
+        cmd = f"screen -S {session_name} -X exec printf {message}"
+        self.assertRunOk(cmd)
+
+        # We request a hardcopy of this "screen" display.
+        cmd = f"screen -S {session_name} -X hardcopy {screen_dump}"
+        self.assertRunOk(cmd)
+
+        # The dump file is supposed to contain our message.
+        self.assertRunOk(f"grep -Fo '{message}' {screen_dump}")
+
+        # We request "screen" to quit...
+        cmd = f"screen -S {session_name} -X quit"
+        self.assertRunOk(cmd)
+
+        # Since the session is supposed to be terminated, listing
+        # sessions is expected to fail (again).
+        _, exit_code = self.emulator.run("screen -ls")
+        self.assertNotEqual(exit_code, 0)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
