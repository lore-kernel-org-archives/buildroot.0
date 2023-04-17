Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE816C77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 20:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33007821DF;
	Mon, 17 Apr 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33007821DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zyeUiU08fOU; Mon, 17 Apr 2023 20:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E4FE821CE;
	Mon, 17 Apr 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E4FE821CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6025D1C4224
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45F9760DF6
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F9760DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQ259IoAO9c3 for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 20:52:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4143460D8E
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4143460D8E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E0198424C; Mon, 17 Apr 2023 20:52:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Apr 2023 22:50:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7ad7816262dd1b0db6c51a08f3013e2c473c0b3
X-Git-Newrev: b100440bffea3e47e72a9ccce0bee618658f6a47
X-Patchwork-Hint: ignore
Message-Id: <20230417205233.2E0198424C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-evdev: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b100440bffea3e47e72a9ccce0bee618658f6a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

evdev 1.6.1 https://pypi.org/project/evdev/

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
[yann.morin.1998@free.fr:
  - add missing comment on kernel headers
  - fix flake8 in test
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                    |  1 +
 package/python-evdev/Config.in                       | 10 ++++++++++
 package/python-evdev/python-evdev.hash               |  5 +++++
 package/python-evdev/python-evdev.mk                 | 18 ++++++++++++++++++
 support/testing/tests/package/sample_python_evdev.py | 11 +++++++++++
 support/testing/tests/package/test_python_evdev.py   | 11 +++++++++++
 6 files changed, 56 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 760dda6ac1..eaac32a01a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1049,6 +1049,7 @@ menu "External python modules"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
+	source "package/python-evdev/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
diff --git a/package/python-evdev/Config.in b/package/python-evdev/Config.in
new file mode 100644
index 0000000000..33e43c1f77
--- /dev/null
+++ b/package/python-evdev/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_EVDEV
+	bool "python-evdev"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	help
+	  Bindings to the Linux input handling subsystem.
+
+	  https://github.com/gvalkov/python-evdev
+
+comment "python-evdev needs a toolchain w/ headers >= 4.4"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
new file mode 100644
index 0000000000..9a6d0d07be
--- /dev/null
+++ b/package/python-evdev/python-evdev.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/evdev/json
+md5  905b12ef6136b518ddf418d8d5b053e4  evdev-1.6.1.tar.gz
+sha256  299db8628cc73b237fc1cc57d3c2948faa0756e2a58b6194b5bf81dc2081f1e3  evdev-1.6.1.tar.gz
+# Locally computed sha256 checksums
+sha256  55fd76d7b3f90d312f161d318631b93c58a0e69d662d07c4f5aca2c6c9ecc85e  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
new file mode 100644
index 0000000000..5cf62b5160
--- /dev/null
+++ b/package/python-evdev/python-evdev.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-evdev
+#
+################################################################################
+
+PYTHON_EVDEV_VERSION = 1.6.1
+PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/05/50/629b011a7f61cb2fca754ea8631575784bf8605a1ec4d6970a010bc54e2b
+PYTHON_EVDEV_SETUP_TYPE = setuptools
+PYTHON_EVDEV_LICENSE = Revised BSD License
+PYTHON_EVDEV_LICENSE_FILES = LICENSE
+
+PYTHON_EVDEV_BUILD_OPTS = \
+	build_ecodes \
+	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_evdev.py b/support/testing/tests/package/sample_python_evdev.py
new file mode 100644
index 0000000000..0c00fa6e2f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_evdev.py
@@ -0,0 +1,11 @@
+import evdev
+
+devices = [evdev.InputDevice(path) for path in evdev.list_devices()]
+e = evdev.events.InputEvent(1036996631, 984417, evdev.ecodes.EV_KEY, evdev.ecodes.KEY_A, 2)
+k = evdev.events.KeyEvent(e)
+
+assert(k.keystate == evdev.events.KeyEvent.key_hold)
+assert(k.event == e)
+assert(k.scancode == evdev.ecodes.KEY_A)
+assert(k.keycode == 'KEY_A')
+assert(len(devices) > 0)
diff --git a/support/testing/tests/package/test_python_evdev.py b/support/testing/tests/package/test_python_evdev.py
new file mode 100644
index 0000000000..162e53072e
--- /dev/null
+++ b/support/testing/tests/package/test_python_evdev.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Evdev(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_EVDEV=y
+        """
+    sample_scripts = ["tests/package/sample_python_evdev.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
