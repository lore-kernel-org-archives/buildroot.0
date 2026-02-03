Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DFDE83071
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C629681EA1;
	Tue,  3 Feb 2026 10:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4RvxYG5hvih; Tue,  3 Feb 2026 10:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A605483B9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770113849;
	bh=gkRbBt4ZQUSD/VWHUm4KFFscfn4FNZJXooogX3KF1AE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=shMVw9mCK1xEO7XPj/6JTBYlK1gF09LKjOYDjFqqxqHQNtQnOXlke1ZpyAGvuQ2XG
	 beAXFjn9yYOdWwjfb6eVc15bVQkU85ACbnUDLnbGd6BU+c04AiSYkOrOJTfJIYJUTG
	 BrDARDnl2qjgATzTpVnDzkqea7aSlfQxR8fLCCdXf+5BR31UmQa1NJv80fiCPGRJHf
	 w7pl90NY35uIRLX+6dCcNV6rAPseQqZ5nf2QuLVxK0jTwajrWqmQxQxoYyI/uoEnFi
	 EmxqhnXjYn6C40vY37rOwY4LprI4fTYaOiOc5JIBTlEtg8G+6mI+vVYtKkJjZI+3Ki
	 v7Vu1bQuwXIeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A605483B9D;
	Tue,  3 Feb 2026 10:17:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 113081A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E034240653
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szI-Ko0fWmgt for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9D040644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF9D040644
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9BDD865D9; Tue,  3 Feb 2026 10:17:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 10:26:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5a8cb5564bd4129e1a55f40fcc45b5ff9385e2b
X-Git-Newrev: 0bad9ad584bd8b02fec1bfe161c3cb2559461b0c
X-Patchwork-Hint: ignore
Message-Id: <20260203101720.C9BDD865D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus-systemd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bad9ad584bd8b02fec1bfe161c3cb2559461b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                                 |  3 +++
 package/Config.in                                          |  1 +
 package/python-sdbus-systemd/Config.in                     | 11 +++++++++++
 package/python-sdbus-systemd/python-sdbus-systemd.hash     |  5 +++++
 package/python-sdbus-systemd/python-sdbus-systemd.mk       | 14 ++++++++++++++
 .../testing/tests/package/sample_python_sdbus_systemd.py   | 11 +++++++++++
 support/testing/tests/package/test_python_sdbus_systemd.py | 14 ++++++++++++++
 7 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4f7f034df7..9fedc81332 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2278,6 +2278,7 @@ F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
+F:	package/python-sdbus-systemd/
 F:	package/python-varlink/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
@@ -2290,6 +2291,7 @@ F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
+F:	support/testing/tests/package/test_python_sdbus_systemd.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_varlink.py
 F:	support/testing/tests/package/test_python_varlink/
@@ -2304,6 +2306,7 @@ F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
+F:	support/testing/tests/package/sample_python_sdbus_systemd.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
diff --git a/package/Config.in b/package/Config.in
index 41fc5af330..258ad1883d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1393,6 +1393,7 @@ menu "External python modules"
 	source "package/python-sdbus/Config.in"
 	source "package/python-sdbus-modemmanager/Config.in"
 	source "package/python-sdbus-networkmanager/Config.in"
+	source "package/python-sdbus-systemd/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-sdbus-systemd/Config.in b/package/python-sdbus-systemd/Config.in
new file mode 100644
index 0000000000..0244f4dc0f
--- /dev/null
+++ b/package/python-sdbus-systemd/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SDBUS_SYSTEMD
+	bool "python-sdbus-systemd"
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_PYTHON_SDBUS # runtime
+	help
+	  Systemd bindings for python-sdbus.
+
+	  https://github.com/bernhardkaindl/python-sdbus-systemd
+
+comment "python-sdbus-systemd needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/python-sdbus-systemd/python-sdbus-systemd.hash b/package/python-sdbus-systemd/python-sdbus-systemd.hash
new file mode 100644
index 0000000000..31eb2a0c64
--- /dev/null
+++ b/package/python-sdbus-systemd/python-sdbus-systemd.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
+md5  726a016b518e3ac47fde0e51b751b6b0  sdbus-systemd-1.0.0.tar.gz
+sha256  80aef69a69685ac7807ba1cc7db48e10e59104260beda1deef6cd5f81e1ad297  sdbus-systemd-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-systemd/python-sdbus-systemd.mk b/package/python-sdbus-systemd/python-sdbus-systemd.mk
new file mode 100644
index 0000000000..0599d2794a
--- /dev/null
+++ b/package/python-sdbus-systemd/python-sdbus-systemd.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sdbus-systemd
+#
+################################################################################
+
+PYTHON_SDBUS_SYSTEMD_VERSION = 1.0.0
+PYTHON_SDBUS_SYSTEMD_SOURCE = sdbus-systemd-$(PYTHON_SDBUS_SYSTEMD_VERSION).tar.gz
+PYTHON_SDBUS_SYSTEMD_SITE = https://files.pythonhosted.org/packages/e1/84/911de0ea63a0dab814dc94f73e7b916bfd4675e1e983b58a725a26a65db4
+PYTHON_SDBUS_SYSTEMD_SETUP_TYPE = setuptools
+PYTHON_SDBUS_SYSTEMD_LICENSE = LGPL-2.1+
+PYTHON_SDBUS_SYSTEMD_LICENSE_FILES = COPYING.LESSER
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_sdbus_systemd.py b/support/testing/tests/package/sample_python_sdbus_systemd.py
new file mode 100644
index 0000000000..07e4a886cc
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sdbus_systemd.py
@@ -0,0 +1,11 @@
+#!/usr/bin/env python3
+
+import sdbus
+
+from sdbus_block.systemd.objects import Systemd, SystemdUnit
+
+sdbus.set_default_bus(sdbus.sd_bus_open_system())
+unit_object_path = Systemd().load_unit("systemd-journald.service")
+unit = SystemdUnit(unit_object_path)
+
+assert unit.active_enter_timestamp is not None
diff --git a/support/testing/tests/package/test_python_sdbus_systemd.py b/support/testing/tests/package/test_python_sdbus_systemd.py
new file mode 100644
index 0000000000..9e97df6465
--- /dev/null
+++ b/support/testing/tests/package/test_python_sdbus_systemd.py
@@ -0,0 +1,14 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SdbusSystemd(TestPythonPackageBase):
+    __test__ = True
+    config = (
+        TestPythonPackageBase.config
+        + """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_PYTHON_SDBUS_SYSTEMD=y
+        """
+    )
+    sample_scripts = ["tests/package/sample_python_sdbus_systemd.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
