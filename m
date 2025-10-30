Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0DECCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C76D2411C6;
	Thu, 30 Oct 2025 21:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1TfZVhV7lbD; Thu, 30 Oct 2025 21:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0C5A41156
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0C5A41156;
	Thu, 30 Oct 2025 21:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C75D707
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F49D843B0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9IflBX6m79Y for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B3B843AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B3B843AA
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0F6082AEE; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:10:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d03cfe515bf3ef9519bbf03dfb9a58a3e843f27c
X-Git-Newrev: 875b4f204cc13d1f0b491a9a00614db8e4c5846d
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.B0F6082AEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_serial.py: new test case
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

commit: https://git.buildroot.net/buildroot/commit/?id=875b4f204cc13d1f0b491a9a00614db8e4c5846d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This quickly tests that the host-python-serial package at least
minimally works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                          |  1 +
 support/testing/tests/package/test_python_serial.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 29aa132a78..ed6c673cc4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3289,6 +3289,7 @@ F:	support/testing/tests/package/test_python_crccheck.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
 F:	toolchain/
diff --git a/support/testing/tests/package/test_python_serial.py b/support/testing/tests/package/test_python_serial.py
new file mode 100644
index 0000000000..c4b05a10fb
--- /dev/null
+++ b/support/testing/tests/package/test_python_serial.py
@@ -0,0 +1,12 @@
+import infra.basetest
+
+
+class TestHostPythonSerial(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-serial"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import serial"]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = ["host/bin/python3", "-m", "serial.tools.list_ports"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
