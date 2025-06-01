Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843CFC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 16:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27936417E2;
	Sun,  1 Jun 2025 16:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJjnTDtOPNfw; Sun,  1 Jun 2025 16:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FB2940E93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB2940E93;
	Sun,  1 Jun 2025 16:48:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15EB0222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0789440445
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIc2SqkyksDF for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 16:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E7C140175
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E7C140175
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:48:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A0CF878D4; Sun,  1 Jun 2025 16:48:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Jun 2025 18:31:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c80d4ca76d53e3dc50f3201c59b4f277e749d0e0
X-Git-Newrev: 18a4a48255280761d395068d024f54d7934ffb09
X-Patchwork-Hint: ignore
Message-Id: <20250601164855.4A0CF878D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-sdbus-modemmanager: new runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=18a4a48255280761d395068d024f54d7934ffb09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: fix check-package errors]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                                |  2 ++
 .../tests/package/sample_python_sdbus_modemmanager.py     | 10 ++++++++++
 .../tests/package/test_python_sdbus_modemmanager.py       | 15 +++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a64d4a017..548185cbf8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2290,12 +2290,14 @@ F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
+F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
+F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
diff --git a/support/testing/tests/package/sample_python_sdbus_modemmanager.py b/support/testing/tests/package/sample_python_sdbus_modemmanager.py
new file mode 100644
index 0000000000..f238a4dab9
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sdbus_modemmanager.py
@@ -0,0 +1,10 @@
+#!/usr/bin/env python3
+
+import sdbus
+
+from sdbus_block.modemmanager import MM
+
+sdbus.set_default_bus(sdbus.sd_bus_open_system())
+mm = MM()
+
+assert mm.version is not None
diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
new file mode 100644
index 0000000000..34ab66e3bf
--- /dev/null
+++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
@@ -0,0 +1,15 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
+    __test__ = True
+    config = (
+        TestPythonPackageBase.config
+        + """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_MODEM_MANAGER=y
+        BR2_PACKAGE_PYTHON_SDBUS_MODEMMANAGER=y
+        """
+    )
+    sample_scripts = ["tests/package/sample_python_sdbus_modemmanager.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
