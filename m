Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A24CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBAE843B1;
	Thu, 30 Oct 2025 21:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53f6unWxc6l0; Thu, 30 Oct 2025 21:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F95A843B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F95A843B2;
	Thu, 30 Oct 2025 21:02:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 391E02A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BD33401C2
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgWT9UG-TMeB for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4728403EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4728403EA
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D71AC82AEC; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:10:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20afa3be7c28e64ebe475bf39446ed63827342c0
X-Git-Newrev: 7cac4201f3e8568e6b5304a7c149208d6536abbd
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.D71AC82AEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmodem: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cac4201f3e8568e6b5304a7c149208d6536abbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant of python-xmodem will be needed by Snagboot, so this
commit enables it. We also add a very simple test case that simply
makes sure we can import the module. Testing xmodem more extensively
is difficult without an actual serial port to open.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                          | 1 +
 package/python-xmodem/python-xmodem.mk              | 1 +
 support/testing/tests/package/test_python_xmodem.py | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6a57433e10..26c8b4ea01 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3292,6 +3292,7 @@ F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
+F:	support/testing/tests/package/test_python_xmodem.py
 F:	support/testing/tests/toolchain/test_external_arm.py
 F:	toolchain/
 
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
index d7040f7245..1ef5f53bec 100644
--- a/package/python-xmodem/python-xmodem.mk
+++ b/package/python-xmodem/python-xmodem.mk
@@ -12,3 +12,4 @@ PYTHON_XMODEM_LICENSE = MIT
 PYTHON_XMODEM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_xmodem.py b/support/testing/tests/package/test_python_xmodem.py
new file mode 100644
index 0000000000..b9feb78109
--- /dev/null
+++ b/support/testing/tests/package/test_python_xmodem.py
@@ -0,0 +1,9 @@
+import infra.basetest
+
+
+class TestHostPythonXmodem(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-xmodem"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import xmodem"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
