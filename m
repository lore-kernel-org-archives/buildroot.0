Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1F5C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F35F260E7B;
	Tue, 26 Jul 2022 08:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F35F260E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ULIf4qHBVGW; Tue, 26 Jul 2022 08:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D200960E02;
	Tue, 26 Jul 2022 08:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D200960E02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC3DE1BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94658419DA
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94658419DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfITyPIdMiHs for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A04D4195A
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A04D4195A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E187D85E8E; Tue, 26 Jul 2022 07:56:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 10:07:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9b6bb07356d0dd10cb1f245683d9114acdeb573
X-Git-Newrev: ef321ff4a90acf2133ee29d5fd2a65fc9906c748
X-Patchwork-Hint: ignore
Message-Id: <20220726075637.E187D85E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avocado: new package
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
Content-Type: multipart/mixed; boundary="===============8388658268905566506=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8388658268905566506==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ef321ff4a90acf2133ee29d5fd2a65fc9906c748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
[Thomas: add test case, add missing dependencies]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  2 ++
 package/Config.in                             |  1 +
 package/avocado/Config.in                     | 21 +++++++++++++++++++++
 package/avocado/avocado.hash                  |  3 +++
 package/avocado/avocado.mk                    | 13 +++++++++++++
 support/testing/tests/package/test_avocado.py | 23 +++++++++++++++++++++++
 6 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 504a6bb018..1dede4b83b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1560,6 +1560,7 @@ F:	support/testing/tests/package/test_zfs.py
 
 N:	José Pekkarinen <jose.pekkarinen@unikie.com>
 F:	package/alfred/
+F:	package/avocado/
 F:	package/bmx7/
 F:	package/opensc/
 F:	package/python-aexpect/
@@ -1567,6 +1568,7 @@ F:	package/python-alembic/
 F:	package/python-lark/
 F:	package/softhsm2/
 F:	support/testing/tests/package/sample_python_aexpect.py
+F:	support/testing/tests/package/test_avocado.py
 F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 697c94157c..d264449b30 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -158,6 +158,7 @@ menu "Debugging, profiling and benchmark"
 endmenu
 
 menu "Development tools"
+	source "package/avocado/Config.in"
 	source "package/bats-core/Config.in"
 	source "package/binutils/Config.in"
 	source "package/bitwise/Config.in"
diff --git a/package/avocado/Config.in b/package/avocado/Config.in
new file mode 100644
index 0000000000..cd438350a4
--- /dev/null
+++ b/package/avocado/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_AVOCADO
+	bool "avocado"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_BZIP2
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_XZ
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
+	help
+	  Avocado is an automated testing suite containing
+	  tests for various subsystems.
+
+	  https://avocado-framework.readthedocs.io/
+
+comment "avocado needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/avocado/avocado.hash b/package/avocado/avocado.hash
new file mode 100644
index 0000000000..117d708611
--- /dev/null
+++ b/package/avocado/avocado.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  bec1bfab821030f04306a93d2b2061a4a28db538873702f746d5bc050d92685b  avocado-98.0.tar.gz
+sha256  680ce56e9c4043826f0f1420935d2453ea3ddacd1582cb6f1cef26c1077fcc93  LICENSE
diff --git a/package/avocado/avocado.mk b/package/avocado/avocado.mk
new file mode 100644
index 0000000000..282cb34fd3
--- /dev/null
+++ b/package/avocado/avocado.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# avocado
+#
+################################################################################
+
+AVOCADO_VERSION = 98.0
+AVOCADO_SITE = $(call github,avocado-framework,avocado,$(AVOCADO_VERSION))
+AVOCADO_SETUP_TYPE = setuptools
+AVOCADO_LICENSE = Apache-2.0
+AVOCADO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/test_avocado.py b/support/testing/tests/package/test_avocado.py
new file mode 100644
index 0000000000..7e83c86464
--- /dev/null
+++ b/support/testing/tests/package/test_avocado.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestAvocado(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_AVOCADO=y
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
+        cmd = "avocado run /bin/true"
+        self.assertRunOk(cmd, timeout=30)
+        cmd = "avocado plugins"
+        self.assertRunOk(cmd, timeout=30)

--===============8388658268905566506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8388658268905566506==--
