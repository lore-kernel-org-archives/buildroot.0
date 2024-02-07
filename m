Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03974C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85548416D4;
	Wed,  7 Feb 2024 17:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcBeI3FKLrXS; Wed,  7 Feb 2024 17:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03FDE41710
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03FDE41710;
	Wed,  7 Feb 2024 17:11:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EED71BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CFB141E2A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8FHffZ1k6wx for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DE9D41E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE9D41E22
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DE9D41E22
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:10:58 +0000 (UTC)
Received: from bubutux.localdomain (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A459A2C838CA;
 Wed,  7 Feb 2024 18:10:55 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 18:09:55 +0100
Message-ID: <20240207170959.2672846-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207170959.2672846-1-buildroot@bubu1.eu>
References: <20240207170959.2672846-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707325856; bh=vX+rOwi/r3bsotUHhkl2osGYJoH/A5o0Q6VqmOhnVrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jgCfodhlS/tx+XyT1eNPUuD3LSQYHJKesk9HJFGw4bpU1BUDnbcchrBFeroFZP9o1
 m+8GhdicyF5ASAY9/Aums1uspluFyCHoPNQ5tL3OMFSLNYXRlQ5CwtkRe3v0ACBoP1
 h6abYiX3GzfyB5+kbu6F0eC1zekoIDTj7Pm2SRN+PiSN5shNLRe/Ixmr3hoaeCcAev
 MIs9q1am5YY11KDMin9cfj2HQMjGJnngUjZI41n+21OL288rPZ7iUMynmiKKSHBcAu
 BRbcCoeCl4Oj0IgyTTr+4TExLXeM2PY+cKcYCKadLSy7mQUdjBqu8h9uOXQsOfw8h5
 iJyD1+FyHFCrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jgCfodhl
Subject: [Buildroot] [PATCH 3/4] package/python-ruamel-yaml-clib: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add optional c extension for python-ruamel-yaml which can speed up yaml
loading/parsing.

Extend the ruamel-yaml runtime test to check if the c extension works
correctly.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/Config.in                                |  1 +
 package/python-ruamel-yaml-clib/Config.in        |  9 +++++++++
 .../python-ruamel-yaml-clib.hash                 |  5 +++++
 .../python-ruamel-yaml-clib.mk                   | 16 ++++++++++++++++
 .../tests/package/sample_python_ruamel_yaml.py   | 12 ++++++++++++
 .../tests/package/test_python_ruamel_yaml.py     |  1 +
 6 files changed, 44 insertions(+)
 create mode 100644 package/python-ruamel-yaml-clib/Config.in
 create mode 100644 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
 create mode 100644 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk

diff --git a/package/Config.in b/package/Config.in
index bf8c325e99..e256202276 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1320,6 +1320,7 @@ menu "External python modules"
 	source "package/python-rtoml/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-ruamel-yaml/Config.in"
+	source "package/python-ruamel-yaml-clib/Config.in"
 	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
diff --git a/package/python-ruamel-yaml-clib/Config.in b/package/python-ruamel-yaml-clib/Config.in
new file mode 100644
index 0000000000..a06080873f
--- /dev/null
+++ b/package/python-ruamel-yaml-clib/Config.in
@@ -0,0 +1,9 @@
+if BR2_PACKAGE_PYTHON_RUAMEL_YAML
+config BR2_PACKAGE_PYTHON_RUAMEL_YAML_CLIB
+	bool "python-ruamel-yaml-clib"
+	help
+	  C version of reader, parser and emitter for ruamel.yaml
+	  derived from libyaml
+
+	  https://sourceforge.net/projects/ruamel-yaml/
+endif
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
index 0000000000..3e5434fa9a
--- /dev/null
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-ruamel-yaml
+#
+################################################################################
+
+PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.8
+PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b
+PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
+PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
+PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
+PYTHON_RUAMEL_YAML_CLIB_CPE_ID_VENDOR = ruamel.yaml_project
+PYTHON_RUAMEL_YAML_CLIB_CPE_ID_PRODUCT = ruamel.yaml
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
