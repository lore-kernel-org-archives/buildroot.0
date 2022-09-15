Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D69C32771
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 21:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF4B610C5;
	Thu, 15 Sep 2022 21:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF4B610C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qc79sASfofgg; Thu, 15 Sep 2022 21:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693A8610B9;
	Thu, 15 Sep 2022 21:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693A8610B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED5041BF28E
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 21:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFE6A83EF4
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 21:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFE6A83EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ke-mLNMTf4f for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 21:25:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 218B383EEA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 218B383EEA
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 21:25:36 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.86.190])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0C0F4B0055A;
 Thu, 15 Sep 2022 23:25:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 23:24:50 +0200
Message-Id: <20220915212450.1799621-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663277133;
 bh=UmL8igz+Tdl135Q9PQOFXbq+2Cm7cl8Nbkt2Rpa9lwQ=;
 h=From:To:Cc:Subject:Date:From;
 b=feYKmjd1uZ/+9f8OSCbi1VYuDGgWmQmuI/lQcit3trMqNMNxie0UcHqx6A+bxcFyP
 FtmdqrW38ZL5wWfovb3BpI0hfOo+1FzcwUZJLz3PsV6x134q6kij0R/YQVee3yrVpS
 BZTOCTpUUEmJOdkfiBi/Dr67avN3NLAvIOi+E6K6MSxDnRYB02seEmncqOxKguLfuW
 n1aSNAJgL334fDJKvJTmBq7hJlkOyNuYwWX3P66fuLTnBQEJNhAF/nB7blqLC2NYog
 VwlqAWBMwIJypoV3hNQwr9GdOhP6s/M/IuutRpVOYy8UhdYCOr688Oc1eM1VvG8eRH
 LwhXR+el8/qMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=feYKmjd1
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_hwloc.py: new runtime test
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
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_hwloc.py | 22 +++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 support/testing/tests/package/test_hwloc.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a707b0e5e1..5c639fcaec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1690,6 +1690,7 @@ F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_hwloc.py b/support/testing/tests/package/test_hwloc.py
new file mode 100644
index 0000000000..2a776c4038
--- /dev/null
+++ b/support/testing/tests/package/test_hwloc.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestHWLoc(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HWLOC=y
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
+        self.assertRunOk("hwloc-info")
+        self.assertRunOk("hwloc-ls")
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
