Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248D4CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC2B041624;
	Thu, 30 Oct 2025 21:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C78NwRFAhAkn; Thu, 30 Oct 2025 21:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18DDB4155B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18DDB4155B;
	Thu, 30 Oct 2025 21:02:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4A12A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FB3C61506
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGg7sydCDwaU for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24B861546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D24B861546
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8E8282AF2; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:10:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 875b4f204cc13d1f0b491a9a00614db8e4c5846d
X-Git-Newrev: b2a657297d6d7570ae35939dc0bbc2abc417fb90
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.B8E8282AF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tftpy: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2a657297d6d7570ae35939dc0bbc2abc417fb90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A host variant of python-tftpy will be needed for Snagboot, so enable
it, and add a very simple test for the host package. We considered
adding a test that actually starts a TFTP server with tftpy and then
downloads from that server with the client-side of tftpy, but
allocating an available UDP port reliably is tricky, so we kept the
test case very simple for now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tftpy/python-tftpy.mk               | 1 +
 support/testing/tests/package/test_python_tftpy.py | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index 66de17eaab..322d514f1f 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -11,3 +11,4 @@ PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_tftpy.py b/support/testing/tests/package/test_python_tftpy.py
index d64f2c29d7..1dfbde0b67 100644
--- a/support/testing/tests/package/test_python_tftpy.py
+++ b/support/testing/tests/package/test_python_tftpy.py
@@ -1,4 +1,5 @@
 from tests.package.test_python import TestPythonPackageBase
+import infra.basetest
 
 
 class TestPythonTftpy(TestPythonPackageBase):
@@ -9,3 +10,11 @@ class TestPythonTftpy(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_TFTPY=y
         """
     sample_scripts = ["tests/package/sample_python_tftpy.py"]
+
+
+class TestHostPythonTftpy(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-tftpy"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import tftpy"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
