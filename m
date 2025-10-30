Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074FCCCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0303843B3;
	Thu, 30 Oct 2025 21:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XIrpWk55zTM; Thu, 30 Oct 2025 21:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA7E843BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEA7E843BB;
	Thu, 30 Oct 2025 21:02:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4701FCD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0E59403EA
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t67uUoThmD0H for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A89A405D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A89A405D1
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEC9582AF9; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:16:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3ce010e986a5b012492a0b8ba64cc03f742f7bd
X-Git-Newrev: 49a81c77d79fabd27e893566a32778b08074a594
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.EEC9582AF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyfatfs: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49a81c77d79fabd27e893566a32778b08074a594
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new host package for python-pyfatfs, which is
needed by Snagboot.

Homepage: https://pypi.org/project/pyfatfs/

A small test doing some minimal verification that pyfatfs works is
also added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 ...-pyproject.toml-relax-version-constraints.patch | 45 ++++++++++++++++++
 package/python-pyfatfs/python-pyfatfs.hash         |  4 ++
 package/python-pyfatfs/python-pyfatfs.mk           | 17 +++++++
 .../testing/tests/package/test_python_pyfatfs.py   | 53 ++++++++++++++++++++++
 5 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cca984780a..fa9fe7bbe2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3259,6 +3259,7 @@ F:	package/python-crccheck/
 F:	package/python-flask-expects-json/
 F:	package/python-fs/
 F:	package/python-git/
+F:	package/python-pyfatfs/
 F:	package/python-qrcode/
 F:	package/python-serial/
 F:	package/python-unittest-xml-reporting/
@@ -3291,6 +3292,7 @@ F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_fs.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_pyfatfs.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
diff --git a/package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch b/package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch
new file mode 100644
index 0000000000..791401f876
--- /dev/null
+++ b/package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch
@@ -0,0 +1,45 @@
+From 9d40ef086d25c8434adcf6552de1d8bb5022a277 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 22 Sep 2025 23:27:47 +0200
+Subject: [PATCH] pyproject.toml: relax version constraints
+
+The version constraints defined with ~= in pyproject.toml are too
+strict, and don't allow using pyfatfs with newer versions.
+
+We have successfully tested with:
+
+- setuptools 80.9.0
+- setuptools-scm 8.3.1
+- python 3.13
+- fs 2.4.16
+
+Upstream: https://github.com/nathanhi/pyfatfs/pull/47
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ pyproject.toml | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 9649c10..a6eb198 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,13 +1,13 @@
+ [build-system]
+-requires = ["setuptools ~= 67.8", "setuptools_scm[toml] ~= 7.1"]
++requires = ["setuptools >= 67.8", "setuptools_scm[toml] >= 7.1"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+ name = "pyfatfs"
+ description = "FAT12/FAT16/FAT32 implementation with VFAT support"
+ readme = "README.rst"
+-requires-python = "~=3.8"
+-dependencies = ["fs~=2.4"]
++requires-python = ">=3.8"
++dependencies = ["fs>=2.4"]
+ keywords = ["filesystem", "PyFilesystem2", "FAT12", "FAT16", "FAT32", "VFAT", "LFN"]
+ license = {file = "LICENSE"}
+ classifiers = [
+-- 
+2.51.0
+
diff --git a/package/python-pyfatfs/python-pyfatfs.hash b/package/python-pyfatfs/python-pyfatfs.hash
new file mode 100644
index 0000000000..05e940779e
--- /dev/null
+++ b/package/python-pyfatfs/python-pyfatfs.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/project/pyfatfs/#pyfatfs-1.1.0.tar.gz
+sha256  9725ccd0a4da1c09c27358abbf10f08c043ac84210af576803e087f51a2b30e0  pyfatfs-1.1.0.tar.gz
+# Locally calculated
+sha256  df8f053d3cbf23fe7002e6a34b06580653a74d40dc2e54f3b717a963ea9b70cb  LICENSE
diff --git a/package/python-pyfatfs/python-pyfatfs.mk b/package/python-pyfatfs/python-pyfatfs.mk
new file mode 100644
index 0000000000..a61fb1afb2
--- /dev/null
+++ b/package/python-pyfatfs/python-pyfatfs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pyfatfs
+#
+################################################################################
+
+PYTHON_PYFATFS_VERSION = 1.1.0
+PYTHON_PYFATFS_SOURCE = pyfatfs-$(PYTHON_PYFATFS_VERSION).tar.gz
+PYTHON_PYFATFS_SITE = https://files.pythonhosted.org/packages/44/3f/d08f1dbc44a7eef9c7fb355b83423fbd15bb3e487c250479a2c179cb39bf
+PYTHON_PYFATFS_LICENSE = MIT
+PYTHON_PYFATFS_LICENSE_FILES = LICENSE
+PYTHON_PYFATFS_SETUP_TYPE = setuptools
+# host-python-fs is not a build time dependency, but is needed at
+# runtime for host-python-pyfatfs to work
+HOST_PYTHON_PYFATFS_DEPENDENCIES = host-python-setuptools-scm host-python-fs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pyfatfs.py b/support/testing/tests/package/test_python_pyfatfs.py
new file mode 100644
index 0000000000..ceb4e924a1
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyfatfs.py
@@ -0,0 +1,53 @@
+import infra.basetest
+import os
+
+
+class TestHostPythonPyfatfs(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pyfatfs",
+                "host-genimage",
+                "host-dosfstools",
+                "host-mtools"]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """
+
+    genimage_cfg = """
+image test.vfat {
+    vfat {
+        files = {
+            "test.txt"
+        }
+    }
+
+    size = 8M
+}"""
+
+    def test_run(self):
+        os.makedirs(os.path.join(self.builddir, "genimage-input"),
+                    exist_ok=True)
+        with open(os.path.join(self.builddir, "genimage-input", "test.txt"), "w") as f:
+            f.write("Hello World!")
+        with open(os.path.join(self.builddir, "genimage.cfg"), "w") as f:
+            f.write(self.genimage_cfg)
+        os.makedirs(os.path.join(self.builddir, "genimage-tmp"),
+                    exist_ok=True)
+        os.makedirs(os.path.join(self.builddir, "genimage-root"),
+                    exist_ok=True)
+
+        cmd = ["host/bin/genimage",
+               "--config", os.path.join(self.builddir, "genimage.cfg"),
+               "--outputpath", self.builddir,
+               "--inputpath", os.path.join(self.builddir, "genimage-input"),
+               "--tmppath", os.path.join(self.builddir, "genimage-tmp"),
+               "--rootpath", os.path.join(self.builddir, "genimage-root"),
+               "--mkdosfs", os.path.join(self.builddir, "host", "sbin", "mkdosfs"),
+               "--mcopy", os.path.join(self.builddir, "host", "bin", "mcopy")
+               ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = ["host/bin/python3", "-c",
+               "import fs; fatfs = fs.open_fs('fat://test.vfat'); assert(fatfs.listdir('/') == ['TEST.TXT'])"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
