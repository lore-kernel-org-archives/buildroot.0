Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EE9C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C724B409F8;
	Tue,  2 Aug 2022 22:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C724B409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsI4BpuvM5rF; Tue,  2 Aug 2022 22:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51CA3409E3;
	Tue,  2 Aug 2022 22:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51CA3409E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 202421BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDA61409E3
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA61409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wY54vgu33cKX for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:05:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2079409C0
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2079409C0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EE99886CE6; Tue,  2 Aug 2022 21:51:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Aug 2022 23:19:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc6e9231c8fa5b4eb5b45bba3ff9745da3e09ef7
X-Git-Newrev: d21d3900bfd510a3ea976e9f3effb0c601d879d2
X-Patchwork-Hint: ignore
Message-Id: <20220802215108.EE99886CE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rtoml: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d21d3900bfd510a3ea976e9f3effb0c601d879d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/python-rtoml/Config.in                     |  7 ++++
 package/python-rtoml/python-rtoml.hash             |  4 ++
 package/python-rtoml/python-rtoml.mk               | 22 ++++++++++
 .../testing/tests/package/sample_python_rtoml.py   | 48 ++++++++++++++++++++++
 support/testing/tests/package/test_python_rtoml.py | 28 +++++++++++++
 7 files changed, 113 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fa6efd210c..63bb80fc9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1375,6 +1375,7 @@ F:	package/python-pycares/
 F:	package/python-pydyf/
 F:	package/python-pypa-build/
 F:	package/python-pyphen/
+F:	package/python-rtoml/
 F:	package/python-snappy/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
@@ -1389,6 +1390,8 @@ F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
 F:	package/zchunk/
+F:	support/testing/tests/package/sample_python_rtoml.py
+F:	support/testing/tests/package/test_python_rtoml.py
 
 N:	James Knight <james.knight@collins.com>
 F:	package/atkmm/
diff --git a/package/Config.in b/package/Config.in
index cb73fc8e83..61783ba400 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1223,6 +1223,7 @@ menu "External python modules"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
+	source "package/python-rtoml/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-ruamel-yaml/Config.in"
 	source "package/python-s3transfer/Config.in"
diff --git a/package/python-rtoml/Config.in b/package/python-rtoml/Config.in
new file mode 100644
index 0000000000..410976f138
--- /dev/null
+++ b/package/python-rtoml/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_RTOML
+	bool "python-rtoml"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  A better TOML library for python implemented in rust.
+
+	  https://github.com/samuelcolvin/rtoml
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
new file mode 100644
index 0000000000..04d22ed1a4
--- /dev/null
+++ b/package/python-rtoml/python-rtoml.hash
@@ -0,0 +1,4 @@
+# Locally calculated after vendoring
+sha256  821a430ab6587bdaaf7cb95044e8e0d99c77c6aed0adce5a370045b270f7ee20  rtoml-0.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
new file mode 100644
index 0000000000..9afe8c0315
--- /dev/null
+++ b/package/python-rtoml/python-rtoml.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-rtoml
+#
+################################################################################
+
+PYTHON_RTOML_VERSION = 0.8.0
+PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
+PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/33/a6/b42d8e0e28bec9fd7fdbafb2d76db3f8578f151a669eba564d422756d909
+PYTHON_RTOML_SETUP_TYPE = setuptools
+PYTHON_RTOML_LICENSE = MIT
+PYTHON_RTOML_LICENSE_FILES = LICENSE
+PYTHON_RTOML_DEPENDENCIES = host-python-setuptools-rust host-rustc
+PYTHON_RTOML_ENV = \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_RTOML_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_RTOML_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_RTOML_DL_ENV = $(PKG_CARGO_ENV)
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_rtoml.py b/support/testing/tests/package/sample_python_rtoml.py
new file mode 100644
index 0000000000..ba1ce1634c
--- /dev/null
+++ b/support/testing/tests/package/sample_python_rtoml.py
@@ -0,0 +1,48 @@
+from datetime import datetime, timezone, timedelta
+import rtoml
+
+obj = {
+    'title': 'TOML Example',
+    'owner': {
+        'dob': datetime(1979, 5, 27, 7, 32, tzinfo=timezone(timedelta(hours=-8))),
+        'name': 'Tom Preston-Werner',
+    },
+    'database': {
+        'connection_max': 5000,
+        'enabled': True,
+        'ports': [8001, 8001, 8002],
+        'server': '192.168.1.1',
+    },
+}
+
+loaded_obj = rtoml.load("""\
+# This is a TOML document.
+
+title = "TOML Example"
+
+[owner]
+name = "Tom Preston-Werner"
+dob = 1979-05-27T07:32:00-08:00 # First class dates
+
+[database]
+server = "192.168.1.1"
+ports = [8001, 8001, 8002]
+connection_max = 5000
+enabled = true
+""")
+
+assert loaded_obj == obj
+
+assert rtoml.dumps(obj) == """\
+title = "TOML Example"
+
+[owner]
+dob = 1979-05-27T07:32:00-08:00
+name = "Tom Preston-Werner"
+
+[database]
+connection_max = 5000
+enabled = true
+server = "192.168.1.1"
+ports = [8001, 8001, 8002]
+"""
diff --git a/support/testing/tests/package/test_python_rtoml.py b/support/testing/tests/package/test_python_rtoml.py
new file mode 100644
index 0000000000..aed2fbc59f
--- /dev/null
+++ b/support/testing/tests/package/test_python_rtoml.py
@@ -0,0 +1,28 @@
+from tests.package.test_python import TestPythonPackageBase
+
+import os
+
+
+class TestPythonPy3rtoml(TestPythonPackageBase):
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_RTOML=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_rtoml.py"]
+    timeout = 30
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
