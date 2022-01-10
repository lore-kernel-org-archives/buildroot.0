Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B903C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F54640609;
	Mon, 10 Jan 2022 14:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gurNWGFtza4J; Mon, 10 Jan 2022 14:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18D5F40603;
	Mon, 10 Jan 2022 14:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE6C81BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD13E82CA5
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVs6oeyYcS_B for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:50:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13C0982C99
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:50:23 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 0AAE66000B;
 Mon, 10 Jan 2022 14:50:19 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 15:50:07 +0100
Message-Id: <20220110145007.133329-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110145007.133329-1-herve.codina@bootlin.com>
References: <20220110145007.133329-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 5/5]
 support/testing/tests/package/test_libshdata: new test
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new test ensures that libraries and binaries generated
using Parrot Alchemy build system are correct.
Indeed, the test uses libshdata-stress.
This binary depends on libshdata.
libshdata depends on libfutils and libfutils depends on ulog.
All of these binaries and libraries are built using Alchemy.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changed v1 -> v2:
  none

Changed v2 -> v3:
  none

 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_libshdata.py   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 support/testing/tests/package/test_libshdata.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 8d0258d7e8..68d66e08a7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1201,6 +1201,7 @@ F:	package/php-pam/
 F:	package/php-pecl-dbus/
 F:	package/ulog/
 F:	support/testing/tests/package/test_dtbocfg.py
+F:	support/testing/tests/package/test_libshdata.py
 F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_lua.py
diff --git a/support/testing/tests/package/test_libshdata.py b/support/testing/tests/package/test_libshdata.py
new file mode 100644
index 0000000000..80b032ac69
--- /dev/null
+++ b/support/testing/tests/package/test_libshdata.py
@@ -0,0 +1,25 @@
+import os
+
+import infra.basetest
+
+
+class TestLibshdata(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LIBSHDATA=y
+        BR2_PACKAGE_LIBSHDATA_STRESS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+        # Just run libshdata-stress.
+        # This ensures that library are well compiled and that all dependencies
+        # are met using Parrot Alchemy build system.
+        self.assertRunOk("libshdata-stress")
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
