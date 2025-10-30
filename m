Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817C1CCFA00
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E11C4155B;
	Thu, 30 Oct 2025 21:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7ja5WlgZIt5; Thu, 30 Oct 2025 21:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C56C4162C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C56C4162C;
	Thu, 30 Oct 2025 21:02:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E753E2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB526843AA
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dKY7NlOKWg6 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F1A843AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9F1A843AD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6A9482AF6; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:16:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baa5543e58d79659952426bbe83e208405c7c1b1
X-Git-Newrev: f3ce010e986a5b012492a0b8ba64cc03f742f7bd
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.E6A9482AF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3ce010e986a5b012492a0b8ba64cc03f742f7bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a host package for the Python 'fs' module, needed as
a dependency of pyfatfs, itself needed by Snagboot.

Homepage: https://pypi.org/project/fs/

In addition, a very simple test case is adding to check that
host-python-fs is minimally working.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                      |  2 ++
 package/python-fs/python-fs.hash                |  5 +++++
 package/python-fs/python-fs.mk                  | 15 +++++++++++++++
 support/testing/tests/package/test_python_fs.py |  9 +++++++++
 4 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26c8b4ea01..cca984780a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3257,6 +3257,7 @@ F:	package/python3/
 F:	package/python-augeas/
 F:	package/python-crccheck/
 F:	package/python-flask-expects-json/
+F:	package/python-fs/
 F:	package/python-git/
 F:	package/python-qrcode/
 F:	package/python-serial/
@@ -3288,6 +3289,7 @@ F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_crccheck.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
+F:	support/testing/tests/package/test_python_fs.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
diff --git a/package/python-fs/python-fs.hash b/package/python-fs/python-fs.hash
new file mode 100644
index 0000000000..5ebb49128d
--- /dev/null
+++ b/package/python-fs/python-fs.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/project/fs/#fs-2.4.16.tar.gz
+sha256  ae97c7d51213f4b70b6a958292530289090de3a7e15841e108fbe144f069d313  fs-2.4.16.tar.gz
+
+# Locally calculated
+sha256  bcc1fbae1da071a15d17fd7609519af1160a3d72c65622047b61e19ba63e780d  LICENSE
diff --git a/package/python-fs/python-fs.mk b/package/python-fs/python-fs.mk
new file mode 100644
index 0000000000..8d684e6ebd
--- /dev/null
+++ b/package/python-fs/python-fs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-fs
+#
+################################################################################
+
+PYTHON_FS_VERSION = 2.4.16
+PYTHON_FS_SOURCE = fs-$(PYTHON_FS_VERSION).tar.gz
+PYTHON_FS_SITE = https://files.pythonhosted.org/packages/5d/a9/af5bfd5a92592c16cdae5c04f68187a309be8a146b528eac3c6e30edbad2
+PYTHON_FS_SETUP_TYPE = setuptools
+PYTHON_FS_LICENSE = MIT
+PYTHON_FS_LICENSE_FILES = LICENSE
+HOST_PYTHON_FS_DEPENDENCIES = host-python-six host-python-appdirs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_fs.py b/support/testing/tests/package/test_python_fs.py
new file mode 100644
index 0000000000..a53d8a64c8
--- /dev/null
+++ b/support/testing/tests/package/test_python_fs.py
@@ -0,0 +1,9 @@
+import infra.basetest
+
+
+class TestHostPythonFs(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-fs"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import fs; fs.open_fs('mem://'); fs.open_fs('temp://')"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
