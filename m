Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984E1C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBF2417DE;
	Fri, 12 Jul 2024 13:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppa8VnJ1kOuc; Fri, 12 Jul 2024 13:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CA0417E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65CA0417E2;
	Fri, 12 Jul 2024 13:22:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0AC1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 024D66071E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbgETnBMgKdu for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110156071D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 110156071D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:22:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0C6685E67; Fri, 12 Jul 2024 13:22:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 15:17:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21da0df09db09700948c27782d0bb446a0ad66f8
X-Git-Newrev: f538c7e6bdc07e3bd3db7a34798a47a905af4413
X-Patchwork-Hint: ignore
Message-Id: <20240712132202.F0C6685E67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml-clib: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f538c7e6bdc07e3bd3db7a34798a47a905af4413
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional c extension for python-ruamel-yaml which can speed up yaml
loading/parsing.

Extend the ruamel-yaml runtime test to check if the c extension works
correctly.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-ruamel-yaml-clib/Config.in                  |  8 ++++++++
 .../python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash   |  5 +++++
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk | 14 ++++++++++++++
 support/testing/tests/package/sample_python_ruamel_yaml.py | 12 ++++++++++++
 support/testing/tests/package/test_python_ruamel_yaml.py   |  1 +
 7 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9dedf0a7a4..2f5e1e40bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2157,6 +2157,7 @@ F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/python-jc/
+F:	package/python-ruamel-yaml-clib/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/sample_python_fastapi.py
diff --git a/package/Config.in b/package/Config.in
index 9806f6dc25..81f87fa2d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1331,6 +1331,7 @@ menu "External python modules"
 	source "package/python-rtoml/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-ruamel-yaml/Config.in"
+	source "package/python-ruamel-yaml-clib/Config.in"
 	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
diff --git a/package/python-ruamel-yaml-clib/Config.in b/package/python-ruamel-yaml-clib/Config.in
new file mode 100644
index 0000000000..c747fb61e9
--- /dev/null
+++ b/package/python-ruamel-yaml-clib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_RUAMEL_YAML_CLIB
+	bool "python-ruamel-yaml-clib"
+	depends on BR2_PACKAGE_PYTHON_RUAMEL_YAML
+	help
+	  C version of reader, parser and emitter for ruamel.yaml
+	  derived from libyaml
+
+	  https://sourceforge.net/projects/ruamel-yaml/
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
new file mode 100644
index 0000000000..937afc3df1
--- /dev/null
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ruamel.yaml.clib/json
+md5  b72e549363fa1b9c4f9123e98f2b46cc  ruamel.yaml.clib-0.2.8.tar.gz
+sha256  beb2e0404003de9a4cab9753a8805a8fe9320ee6673136ed7f04255fe60bb512  ruamel.yaml.clib-0.2.8.tar.gz
+# Locally computed sha256 checksums
+sha256  5458f90e82366f660f956b3c929ba5f7a0efdb99a99a847e2f51f2020ffbe887  LICENSE
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
new file mode 100644
index 0000000000..25c3b44131
--- /dev/null
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ruamel-yaml-clib
+#
+################################################################################
+
+PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.8
+PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b
+PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
+PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
+PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_ruamel_yaml.py b/support/testing/tests/package/sample_python_ruamel_yaml.py
index 5b3a079471..55cd696278 100644
--- a/support/testing/tests/package/sample_python_ruamel_yaml.py
+++ b/support/testing/tests/package/sample_python_ruamel_yaml.py
@@ -25,3 +25,15 @@ parsed = yaml.load(yaml_text)
 
 assert parsed['OneMoreRootKey'] == 9.99
 assert parsed['ListRoot'][1]['another-int'] == 1111
+
+# Tests the C extension based loader
+# ruamel.yaml automatically falls back to the pure python version, so we need
+# to explicitly check if importing the CLoader works here.
+# Import this here, so it's clearer what part of the test is failing.
+from ruamel.yaml import CLoader  # noqa: E402
+assert CLoader is not None
+yaml = YAML(typ='safe')
+parsed_from_c = yaml.load(yaml_text)
+
+assert parsed_from_c['OneMoreRootKey'] == 9.99
+assert parsed_from_c['ListRoot'][1]['another-int'] == 1111
diff --git a/support/testing/tests/package/test_python_ruamel_yaml.py b/support/testing/tests/package/test_python_ruamel_yaml.py
index 15062b4455..b145da4b24 100644
--- a/support/testing/tests/package/test_python_ruamel_yaml.py
+++ b/support/testing/tests/package/test_python_ruamel_yaml.py
@@ -7,6 +7,7 @@ class TestPythonPy3RuamelYaml(TestPythonPackageBase):
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_RUAMEL_YAML=y
+        BR2_PACKAGE_PYTHON_RUAMEL_YAML_CLIB=y
         """
     sample_scripts = ["tests/package/sample_python_ruamel_yaml.py"]
     timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
