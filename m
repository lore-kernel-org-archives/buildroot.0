Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B07C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 23:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5435A6FB29;
	Tue, 11 Jan 2022 23:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMMa-zfl6W5x; Tue, 11 Jan 2022 23:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 900AD6FB50;
	Tue, 11 Jan 2022 23:34:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4E91BF489
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 670B741621
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xyd01y1UuEYQ for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94AD841626
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8DE2383508; Tue, 11 Jan 2022 23:28:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 00:30:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1e8f787e97e4576509143d5c65f02bdf4ffcea4
X-Git-Newrev: af5b1ec68bf0af0af61de6b58e3c64d632a9a1e6
X-Patchwork-Hint: ignore
Message-Id: <20220111232835.8DE2383508@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af5b1ec68bf0af0af61de6b58e3c64d632a9a1e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new test ensures that libraries and binaries generated
using Parrot Alchemy build system are correct.
Indeed, the test uses libshdata-stress.
This binary depends on libshdata.
libshdata depends on libfutils and libfutils depends on ulog.
All of these binaries and libraries are built using Alchemy.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_libshdata.py | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b5be1d6352..c0bfde69da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1204,6 +1204,7 @@ F:	package/php-pam/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
