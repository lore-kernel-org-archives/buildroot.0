Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE91FA3754
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D605D4087C;
	Fri,  2 Jan 2026 17:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vsleu3JFDrqD; Fri,  2 Jan 2026 17:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD97440881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374207;
	bh=PpJySU4adAUIlM4weDuu24XL/qXs+iE/omp5oqzw+U8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UBIxGpoBLI1v03IKj+NiDOs/wZeouczK25dmy4eJUNeGy1Dv9ADBIX88BL4scdv90
	 wVexvQGtWKnTziryHcWoPl1p207SMEWzcnF9xkHOmOzNDzaWChkgH12LZRUxgiRAlX
	 SQrmSA06l1p1k8by3Frou6zmGep73vRNqRwE8fCWUlWEc61yt91S/+27RJtnMRMxyf
	 7o8oAHQsUrzyy+Naa89GusdZ9N7AnYmjtDqQhRCL3xut5fZDP3rF3HsW/msT/wJ441
	 8d+ptwRaGDE/j7HTPFol9FbOeAYihUzH2o3v2BYcueoZkbJGY8aiQ3NNtyqhPvdvoK
	 FWFTpGx9ZTe1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD97440881;
	Fri,  2 Jan 2026 17:16:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 627E8351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54F6C406EB
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gijpiHU5ZYdy for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 655DB4056C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 655DB4056C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5673F86E7A; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:13:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e58321b68045a3d6d829788b0904688c03a882e0
X-Git-Newrev: c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48
X-Patchwork-Hint: ignore
Message-Id: <20260102171641.5673F86E7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-memray: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/python-memray/Config.in                    | 19 +++++++++++
 package/python-memray/python-memray.hash           |  6 ++++
 package/python-memray/python-memray.mk             | 22 +++++++++++++
 .../testing/tests/package/sample_python_memray.py  | 10 ++++++
 .../testing/tests/package/test_python_memray.py    | 38 ++++++++++++++++++++++
 6 files changed, 96 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 43926be751..2b9e31ebb3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1224,6 +1224,7 @@ menu "External python modules"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-mdurl/Config.in"
 	source "package/python-memory-profiler/Config.in"
+	source "package/python-memray/Config.in"
 	source "package/python-midiutil/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-minimalmodbus/Config.in"
diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
new file mode 100644
index 0000000000..afd0adc901
--- /dev/null
+++ b/package/python-memray/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PYTHON_MEMRAY
+	bool "python-memray"
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_LZ4
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	select BR2_PACKAGE_PYTHON_TEXTUAL # runtime
+	help
+	  A memory profiler for Python applications.
+
+	  https://github.com/bloomberg/memray
diff --git a/package/python-memray/python-memray.hash b/package/python-memray/python-memray.hash
new file mode 100644
index 0000000000..bde66a24d9
--- /dev/null
+++ b/package/python-memray/python-memray.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/memray/json
+md5  b48d378a5e5ca043a210781a2023dbe6  memray-1.17.2.tar.gz
+sha256  eb75c075874a6eccddf361513d9d4a9223dd940580c6370a6ba5339bae5d0ba2  memray-1.17.2.tar.gz
+# Locally computed sha256 checksums
+sha256  c973dd08e49022a4017ffd457116b046ebe07fc71a644fd760d64183869ca97f  LICENSE
+sha256  ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  src/vendor/libbacktrace/LICENSE
diff --git a/package/python-memray/python-memray.mk b/package/python-memray/python-memray.mk
new file mode 100644
index 0000000000..ee2605a9b0
--- /dev/null
+++ b/package/python-memray/python-memray.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-memray
+#
+################################################################################
+
+PYTHON_MEMRAY_VERSION = 1.17.2
+PYTHON_MEMRAY_SOURCE = memray-$(PYTHON_MEMRAY_VERSION).tar.gz
+PYTHON_MEMRAY_SITE = https://files.pythonhosted.org/packages/df/40/66e6ae86c0a22b8b998779fa8d6c0ab9ee63f0943198adcf714934286cbf
+PYTHON_MEMRAY_SETUP_TYPE = setuptools
+PYTHON_MEMRAY_LICENSE = Apache-2.0
+PYTHON_MEMRAY_LICENSE_FILES = LICENSE src/vendor/libbacktrace/LICENSE
+PYTHON_MEMRAY_DEPENDENCIES = host-python-cython host-python-pkgconfig lz4 elfutils libunwind
+
+# Define cross-compile target for bundled & patched libbacktrace.
+PYTHON_MEMRAY_ENV = MEMRAY_LIBBACKTRACE_TARGET=$(GNU_TARGET_NAME)
+
+# Sources must be compiled with -fPIC, otherwise linking with -flto
+# (which memray sets by default) fails.
+PYTHON_MEMRAY_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -fPIC"
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_memray.py b/support/testing/tests/package/sample_python_memray.py
new file mode 100644
index 0000000000..a1c6db7b5d
--- /dev/null
+++ b/support/testing/tests/package/sample_python_memray.py
@@ -0,0 +1,10 @@
+# The test needs some code to profile, it does not have to be much.
+
+def run(a):
+    print(a[0])
+
+
+if __name__ == '__main__':
+    # make sure there's at least a small allocation
+    a = ['Hello World!']
+    run(a)
diff --git a/support/testing/tests/package/test_python_memray.py b/support/testing/tests/package/test_python_memray.py
new file mode 100644
index 0000000000..aaf50bcaa4
--- /dev/null
+++ b/support/testing/tests/package/test_python_memray.py
@@ -0,0 +1,38 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+
+
+class TestPythonMemray(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MEMRAY=y
+        """
+    sample_scripts = ["tests/package/sample_python_memray.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        test_trace = "/tmp/trace.bin"
+        test_flame = "/tmp/trace.html"
+
+        # profile the sample script
+        cmd = "%s -m memray run -o %s %s" % (self.interpreter, test_trace, os.path.basename(self.sample_scripts[0]))
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("Hello World!", output)
+
+        # generate statistics
+        cmd = "%s -m memray stats %s" % (self.interpreter, test_trace)
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(any(filter(lambda line: "alloc" in line, output)))
+
+        # generate flamegraph
+        cmd = "%s -m memray flamegraph -o %s %s" % (self.interpreter, test_flame, test_trace)
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+        # rough plausibility check if the output file is HTML
+        cmd = "grep -i '</html>' %s" % (test_flame,)
+        self.assertEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
