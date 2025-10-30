Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F7CCFA00
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 305E4843B2;
	Thu, 30 Oct 2025 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPocsYR-OMiD; Thu, 30 Oct 2025 21:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45954843D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45954843D0;
	Thu, 30 Oct 2025 21:02:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10ADDCD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4C7E843AF
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcpP_Zj-amiS for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE42B843AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE42B843AC
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCF33828A8; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:10:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2a657297d6d7570ae35939dc0bbc2abc417fb90
X-Git-Newrev: 20afa3be7c28e64ebe475bf39446ed63827342c0
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.CCF33828A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyusb: enable host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=20afa3be7c28e64ebe475bf39446ed63827342c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant of python-pyusb will be neded for Snagboot, so it is
enabled with this commit. In addition, we're adding a very simple test
case to validate that host-python-pyusb minimally works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         | 1 +
 package/python-pyusb/python-pyusb.mk               | 2 ++
 support/testing/tests/package/test_python_pyusb.py | 9 +++++++++
 3 files changed, 12 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed6c673cc4..6a57433e10 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3289,6 +3289,7 @@ F:	support/testing/tests/package/test_python_crccheck.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index 7f4c9724f2..cce48e0df8 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -11,5 +11,7 @@ PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = setuptools
 PYTHON_PYUSB_DEPENDENCIES = host-python-setuptools-scm libusb
+HOST_PYTHON_PYUSB_DEPENDENCIES = host-python-setuptools-scm host-libusb
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pyusb.py b/support/testing/tests/package/test_python_pyusb.py
new file mode 100644
index 0000000000..1e0dbba446
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyusb.py
@@ -0,0 +1,9 @@
+import infra.basetest
+
+
+class TestHostPythonPyusb(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pyusb"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import usb"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
