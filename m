Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ADBCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0D461607;
	Sat, 30 May 2026 14:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDMYHsMb9nBm; Sat, 30 May 2026 14:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D9D6F4F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780150652;
	bh=/KYLaSFivKzlhP/efroyOHdCqDKnztjr42Qi07jaERw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FTBdNNY8lXDVHxtHH4foP9RvnwGrNArjM4rMP2C9g9Ck3d4ZldFu24kbL2Pjgv/qt
	 +KeNHG4zNNVM55/Px/1MhbQG/Mv0GOMQFyMYYYbK24GwPfwpdZYKTMIHfkpbrmmL2z
	 GgNDer2BK+R6M7f9rsPk1ml4qiYlK6TgeDbmil6mVZt6nm/Fvt0rWvsS1OV1WEuQWX
	 ocJniLJn6QU9Xnql8Lasf4EsKDIxcmOpBM6R7bFxRze22w/zuU8lCgYQ23Pg8qLVuN
	 Ko4BeJ7AQkqEU3ylc4yculR97Rt3MDNHzgMn+OlU4Lfz4dS9GGplGKzJJnPXNP+ouE
	 MB9tpl11gzpIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D9D6F4F4;
	Sat, 30 May 2026 14:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7088112F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61C6F84D75
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McZVzYiaSpAz for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EBF284D73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EBF284D73
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:17:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7038D8750A; Sat, 30 May 2026 14:17:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:17:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 50d017a2d681e10458f8aac72103a7661e18134d
X-Git-Newrev: 3872cf8a7555774d3093bbf324a9c478be837359
X-Patchwork-Hint: ignore
Message-Id: <20260530141717.7038D8750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-libyang: new
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3872cf8a7555774d3093bbf324a9c478be837359
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Python CFFI bindings for the libyang YANG library, providing the
'libyang' Python module for YANG data modeling operations.

This package is used by higher-level tooling such as python-sysrepo.

https://github.com/CESNET/libyang-python
Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-libyang/Config.in                   | 18 +++++++++
 package/python-libyang/python-libyang.hash         |  5 +++
 package/python-libyang/python-libyang.mk           | 21 ++++++++++
 .../testing/tests/package/sample_python_libyang.py | 46 ++++++++++++++++++++++
 .../testing/tests/package/test_python_libyang.py   | 12 ++++++
 7 files changed, 104 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7f99e8cb53..76d4df4a29 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3368,6 +3368,7 @@ F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libnss-ato/
 F:	package/libyang-cpp/
+F:	package/python-libyang/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 19c4ac2221..c70a64e968 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1211,6 +1211,7 @@ menu "External python modules"
 	source "package/python-libevdev/Config.in"
 	source "package/python-librt/Config.in"
 	source "package/python-libusb1/Config.in"
+	source "package/python-libyang/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
 	source "package/python-log-rate-limit/Config.in"
diff --git a/package/python-libyang/Config.in b/package/python-libyang/Config.in
new file mode 100644
index 0000000000..0442bb2e90
--- /dev/null
+++ b/package/python-libyang/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PYTHON_LIBYANG
+	bool "python-libyang"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libyang
+	depends on !BR2_STATIC_LIBS # libyang
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Python CFFI bindings for the libyang YANG library.
+
+	  This package provides the 'libyang' Python module, used by
+	  higher-level tooling such as python-sysrepo.
+
+	  https://github.com/CESNET/libyang-python
+
+comment "python-libyang needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/python-libyang/python-libyang.hash b/package/python-libyang/python-libyang.hash
new file mode 100644
index 0000000000..077d97cdd8
--- /dev/null
+++ b/package/python-libyang/python-libyang.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/libyang/3.3.0/json
+sha256  97da2c908a8a3607ac834f2acec224ea53a4b9e9770c13e5598513641decf637  libyang-3.3.0.tar.gz
+
+# Locally computed
+sha256  c8d554f918d32b1467f35829e1cfb753764dd683c6edcecc877a4d7e9f05b2a7  LICENSE
diff --git a/package/python-libyang/python-libyang.mk b/package/python-libyang/python-libyang.mk
new file mode 100644
index 0000000000..2e4d1f3b90
--- /dev/null
+++ b/package/python-libyang/python-libyang.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-libyang
+#
+################################################################################
+
+PYTHON_LIBYANG_VERSION = 3.3.0
+PYTHON_LIBYANG_SOURCE = libyang-$(PYTHON_LIBYANG_VERSION).tar.gz
+PYTHON_LIBYANG_SITE = https://files.pythonhosted.org/packages/source/l/libyang
+
+PYTHON_LIBYANG_LICENSE = MIT
+PYTHON_LIBYANG_LICENSE_FILES = LICENSE
+
+# pyproject.toml (PEP517)
+PYTHON_LIBYANG_SETUP_TYPE = pep517
+
+PYTHON_LIBYANG_DEPENDENCIES = \
+	libyang \
+	host-python-cffi
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_libyang.py b/support/testing/tests/package/sample_python_libyang.py
new file mode 100644
index 0000000000..29b2c6cadd
--- /dev/null
+++ b/support/testing/tests/package/sample_python_libyang.py
@@ -0,0 +1,46 @@
+# test from https://github.com/CESNET/libyang-python/blob/master/README.rst
+
+import libyang
+from xml.etree import ElementTree
+
+ctx = libyang.Context()
+
+module = ctx.parse_module_str('''
+module example {
+  namespace "urn:example";
+  prefix "ex";
+  container data {
+    list interface {
+      key name;
+      leaf name {
+        type string;
+      }
+      leaf address {
+        type string;
+      }
+    }
+    leaf hostname {
+      type string;
+    }
+  }
+}
+''')
+
+node = module.parse_data_dict({
+    'data': {
+        'hostname': 'foobar',
+        'interface': [
+            {'name': 'eth0', 'address': '1.2.3.4/24'},
+            {'name': 'lo', 'address': '127.0.0.1'},
+        ],
+    },
+})
+
+xml = node.print_mem('xml', pretty=True)
+tree = ElementTree.fromstringlist(xml)
+assert tree.tag == '{urn:example}data'
+assert tree.find('.//{*}hostname').text == 'foobar'
+assert len(tree.find('.//{*}interface')) == 2
+
+node.free()
+ctx.destroy()
diff --git a/support/testing/tests/package/test_python_libyang.py b/support/testing/tests/package/test_python_libyang.py
new file mode 100644
index 0000000000..ea31b0bc5d
--- /dev/null
+++ b/support/testing/tests/package/test_python_libyang.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonLibyang(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_PYEXPAT=y
+        BR2_PACKAGE_PYTHON_LIBYANG=y
+        """
+    sample_scripts = ["tests/package/sample_python_libyang.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
