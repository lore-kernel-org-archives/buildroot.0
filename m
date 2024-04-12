Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD7FC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F6841C50;
	Fri, 12 Apr 2024 15:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sQ_75rXX4P2; Fri, 12 Apr 2024 15:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21AD04064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21AD04064F;
	Fri, 12 Apr 2024 15:50:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AFFC1BF42E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAA5182246
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_SvKHAEI6Rd for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 718CE8223E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 718CE8223E
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58D4F85F3E; Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 17:48:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fa769dae39ea23a14c02606a23db8978a496e19
X-Git-Newrev: 2258fc413a3566722e84def281503e49172c117b
X-Patchwork-Hint: ignore
Message-Id: <20240412155010.58D4F85F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yamllint: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2258fc413a3566722e84def281503e49172c117b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This host package is needed since u-boot 2024.04 for building ti defconfigs.

This is an requirement for using buildman/binman [1].

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                       |  1 +
 package/python-yamllint/Config.in                       |  8 ++++++++
 package/python-yamllint/python-yamllint.hash            |  3 +++
 package/python-yamllint/python-yamllint.mk              | 15 +++++++++++++++
 support/testing/tests/package/sample_python_yamllint.py | 13 +++++++++++++
 support/testing/tests/package/test_python_yamllint.py   | 11 +++++++++++
 6 files changed, 51 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d9bbf64c95..1935077f0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1437,6 +1437,7 @@ menu "External python modules"
 	source "package/python-xmljson/Config.in"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-xmodem/Config.in"
+	source "package/python-yamllint/Config.in"
 	source "package/python-yarl/Config.in"
 	source "package/python-yatl/Config.in"
 	source "package/python-zc-lockfile/Config.in"
diff --git a/package/python-yamllint/Config.in b/package/python-yamllint/Config.in
new file mode 100644
index 0000000000..5c0962f09f
--- /dev/null
+++ b/package/python-yamllint/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_YAMLLINT
+	bool "python-yamllint"
+	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	help
+	  A linter for YAML files.
+
+	  https://github.com/adrienverge/yamllint
diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
new file mode 100644
index 0000000000..d80e0fdf42
--- /dev/null
+++ b/package/python-yamllint/python-yamllint.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd  yamllint-1.35.1.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
new file mode 100644
index 0000000000..ceaca3b0b8
--- /dev/null
+++ b/package/python-yamllint/python-yamllint.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-yamllint
+#
+################################################################################
+
+PYTHON_YAMLLINT_VERSION = 1.35.1
+PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
+PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
+PYTHON_YAMLLINT_SETUP_TYPE = pep517
+PYTHON_YAMLLINT_LICENSE = GPL-3.0
+PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/sample_python_yamllint.py b/support/testing/tests/package/sample_python_yamllint.py
new file mode 100644
index 0000000000..369a3b8d7d
--- /dev/null
+++ b/support/testing/tests/package/sample_python_yamllint.py
@@ -0,0 +1,13 @@
+# example form https://yamllint.readthedocs.io/en/stable/development.html
+
+from yamllint import (config, linter)
+
+data = '''---
+- &anchor
+  foo: bar
+- *anchor
+'''
+
+yaml_config = config.YamlLintConfig("extends: default")
+for p in linter.run(data, yaml_config):
+    print(p.desc, p.line, p.rule)
diff --git a/support/testing/tests/package/test_python_yamllint.py b/support/testing/tests/package/test_python_yamllint.py
new file mode 100644
index 0000000000..226048ae87
--- /dev/null
+++ b/support/testing/tests/package/test_python_yamllint.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonYamllint(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_YAMLLINT=y
+        """
+    sample_scripts = ["tests/package/sample_python_yamllint.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
