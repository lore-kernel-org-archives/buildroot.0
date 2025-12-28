Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA70D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80527404F6;
	Sun, 28 Dec 2025 22:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rntZ8xxKRxyI; Sun, 28 Dec 2025 22:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6803404D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960490;
	bh=faAyUbdXHb/sTM/DX0llA4Iz8a+NY/c42ynyvzuaVc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oauWI8RSoMZXNKL5CePhF3FCqiV7t7hjz1pPO55RyIs8Ou1MFy4SDEzeU5Wv16KWP
	 UMKhr2nHUlkhhcWR9TPvaMERIoxLLfOa16B3HQcWWvsH1CiPM+j2T7TjjT5pHlwNj3
	 FcoSiDLPkFiQpViFOii2ct50BArVttHjwL3KY5rY/ADbif9fKO6Fq5ftyBFXiO9Im4
	 Ns70nVvreEPvu4csuT+TAxVmcq+7E/0cNeLxtsqCF+co6kQFuTWpdoLUtHvUdx+9Ep
	 58sg8PI9YuvfPFyIX+lrBWy38M6L5MSMPi8vrPB4h/F6zfQUGm14PVRVvPNI11FjOl
	 cRZr0lSHKo2mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6803404D0;
	Sun, 28 Dec 2025 22:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AADDED8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CE8C404D0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sP95yIL8BIYP for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADEFB404C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADEFB404C8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:21:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 992E6879FC; Sun, 28 Dec 2025 22:21:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:19:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 023c735f428e1836587b9370e4c039a70543a9dc
X-Git-Newrev: 43e254a646a2780e8e76171ba9318e5f5dc36fb2
X-Patchwork-Hint: ignore
Message-Id: <20251228222128.992E6879FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: ltp-testsuite: replace
 runltp by kirk
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

commit: https://git.buildroot.net/buildroot/commit/?id=43e254a646a2780e8e76171ba9318e5f5dc36fb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The run log of this ltp-testsuite test shows:

    INFO: runltp script is deprecated, try kirk
    https://github.com/linux-test-project/kirk

This commit updates this test to replace this deprecated runltp
shell script with the newer kirk Python script.

The logic of this runtime test remains the same: it runs a small number
of 'read' system call tests, and checks there is no failures and at
least one test succeed.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../testing/tests/package/test_ltp_testsuite.py    | 33 +++++++++++++---------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
index a85ceb35a6..6ff59b9700 100644
--- a/support/testing/tests/package/test_ltp_testsuite.py
+++ b/support/testing/tests/package/test_ltp_testsuite.py
@@ -1,3 +1,4 @@
+import json
 import os
 
 import infra.basetest
@@ -7,6 +8,7 @@ class TestLtpTestsuite(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_LTP_TESTSUITE=y
+        BR2_PACKAGE_PYTHON3=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
         BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
@@ -21,19 +23,24 @@ class TestLtpTestsuite(infra.basetest.BRTest):
                            options=["-drive", f"file={drive},if=scsi,format=raw"])
         self.emulator.login()
 
+        ltp_root = "/usr/lib/ltp-testsuite"
+        report_file = "/tmp/ltp-report.json"
+
         # We run a reduced number of tests (read syscall tests) for a
-        # fast execution. See "runltp --help" for option details.
-        cmd = "/usr/lib/ltp-testsuite/runltp"
-        cmd += " -p -q"
-        cmd += " -s ^read0[0-9]*"
-        cmd += " -l /tmp/ltp.log"
-        cmd += " -o /tmp/ltp.output"
-        cmd += " -C /tmp/ltp.failed"
-        cmd += " -T /tmp/ltp.tconf"
-        self.assertRunOk(cmd)
+        # fast execution. See "kirk --help" for option details.
+        cmd = f"LTPROOT={ltp_root}"
+        cmd += f" {ltp_root}/kirk"
+        cmd += " --sut host"
+        cmd += " --framework ltp"
+        cmd += " --run-suite syscalls"
+        cmd += " --run-pattern '^read0[0-9]*'"
+        cmd += f" --json-report {report_file}"
+        self.assertRunOk(cmd, timeout=30)
 
-        # We print the LTP run log and check there was zero failure in
-        # our test selection.
-        out, ret = self.emulator.run("cat /tmp/ltp.log")
+        # We print the LTP report and check there was at least one
+        # passed test and zero failure in our selection.
+        out, ret = self.emulator.run(f"cat {report_file} && echo")
         self.assertEqual(ret, 0)
-        self.assertIn("Total Failures: 0", out)
+        report = json.loads("".join(out))
+        self.assertEqual(report['stats']['failed'], 0)
+        self.assertGreater(report['stats']['passed'], 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
