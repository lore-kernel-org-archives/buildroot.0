Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC43606A31F
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ml2o5qS9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34CA4098F;
	Thu, 22 Oct 2026 09:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsFGsE_dw91J; Thu, 22 Oct 2026 09:34:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4CDE940810
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661676;
	b=ieHNQhZaownH5u9bXSiFANnMuLDKKzCD84OJWtIraoU+whTcUM+YjC34aMyAQtszVn0C
	 q2Dq748nfk6REuav16ch6e/R+pcgol65F3CTgQTsr938uTUDjtkykcdnYqYPEuukmePUW
	 QmIC59HUuZBwNsc7uMsLIzuOBh7lmmuHjvXGb2yru5H8geF7MtZoSBru3oQNO2eLeXPqQ
	 aj/SNTwVSGFpZtOFRROJuwoeXGYrpEPUth/+yU5FwPsSQDfJ0vJUykvw6QiSUTtX9Mo0D
	 HqAKm41XV9+Q6/2+081uTnFE+gO84ajpyntMIUTfX/aS8ZCm52+mtQthL1c8tyhGr9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ofEBYw4IRDQWvqntdGv+IyI78itetf6smwU8SUcAYNI=;
	b=AqSWWws4BHvqq+6s44fHb3/2sEXBim5Id2etD9Z00b3kc9kQJhOhq6cm5+aAWuEBztKT
	 N97LqqbA6WJbSdWqUC6c+18QtSmNu6hCR6ooiQQTlDmygl5Z841C7Daozc2GOIx311V1V
	 aDLb9lLU/A7yX/F1ZzwSgW/1m6nz13xhHN0vaEiCgOtuOxehiZR2tLlxxIB8f/7/+7tFx
	 GZYru2FZ47WTaC4p6XQqhh6qryTCVyLzrXkefu0GTZKXZnDK1jRdA3O9zk1X7TUF1gEau
	 ZWfgPX/D+EnpgCkNsJm6ztb85tV/vpN4TlJVZmfjYdm3pc2g28mqhoSXnPXYdsxzMOg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661676;
	bh=ofEBYw4IRDQWvqntdGv+IyI78itetf6smwU8SUcAYNI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ml2o5qS9Z7bDkHFWBgfCLP8l5GsK/kHRnCZAVaGdrsT0a/A5UTERNZMv0L4/UiTlD
	 N31TsuAiglbbS3+WgOTkLB0go2HGrv+KqElSbxl4onq13xNJF4mxnuuTRf2TaoldhO
	 Q02nz//CS/L56xjwoALJQLeREZ5TRgvfs0RX+XVAK2+qhy8HxoAE1vCOg3hBGXjgs2
	 /315NOW61m9iDSHLYboLNA4XqenqK2uC2VGJ7QfNS/mN8rHHM0Tkn4yWdRsT4ybqWT
	 KpbSFPfjAZ1165T9q3n22rksL4LTWMRXAldviwryRmvPhKeH04xEbEhJxGjV6gLkKU
	 h/Cmqaia0kHHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CDE940810;
	Thu, 22 Oct 2026 09:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB5643AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC2AE811CD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkfF4LPkmz0p for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D5EA811CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661672;
 b=tC1yEhmmrmU9NXdHSjxOXx+j13hYtf00X8DbuAhn57zF7/i25h3zCRPQ8ehRJUbuGMIc
 Oew5CNRWQ8tywoGuwYcyb0zdRAmCkeezdqAEJkaMwIVJCJKVxKTQp44WP9SdhseHLZHvz
 xdlQyGir9JZ393/Px5rP7Mb6y+J4hCMi0lcWDnrAF4dFyi7UEQaWKznvngEY9h1PUK7tE
 AI6B3Zrm6hPNHzv1guUUCN0stx0mvm6Y+NP254OI4XZj+XcXRP0RlmwUHpDNvRKn65QI+
 ZAdXYnItABsL9eO1ZKtLUyyNU8PLvjjFoqGUq9o8UDnOzxHl+XmOCtCdDqiSDBBdG/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661672;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XPlGrdaXXMwFzXLPDqHsXGch+qmffffRUmEj+hD54hs=;
 b=P4tJZlPzzcTptMOLAd0oKEuQKxpIW7sn9fRNs91V5AIZ5ablJJ1/UooYAw3tZkwKE7u4
 fRLcyeKjc+N7hO5j6Gni1ldeE/LrTpnFEtz+QoyCqdPFZ2c+K+Pmb1iR/lwrU3voaMKWs
 76zwxMD65mnhPHx+Jzho/jTM3rKY2trgsBMDAdrxtpgwrUH8MksVPfbMUotKgKpIK5yhA
 SSYx6krCUI4+sqN0a3bqTOV5pkn1Uc0oaPq7pKeVJS5L/BzNCj3i205nwGKSmShye+SfZ
 WNwEEM7iIx005xGxMcdtc9a4RMYy5i01kCDEAWoa6Z0uU73Ot8vA6DO5N/7hozqLFBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D5EA811CA
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A53C79B985; Thu, 22 Oct 2026 09:33:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:38:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ae12ae10004a41de4fcc1bdfbd47db6658564ec5
X-Git-Newrev: 352c1fb59eebaff863f07182fbddacd00b82daeb
X-Patchwork-Hint: ignore
Message-Id: <20261022093308.A53C79B985@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "support/testing:
 ltp-testsuite: replace runltp by kirk"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/352c1fb59eebaff863f07182fbddacd00b82daeb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The 2025.02.x commit 5151492c6cf862ea8a7544c6b995be9de83e021e [1]
replaced runltp by kirk which made the runtime test fail [2].

The changes introduced in [1] are using the '--run-pattern' argument
introduced in 'kirk' version 2.0 [3]. This version started shipping with
ltp 20250530 [4]. This version has been introduced in buildroot commit
[5] which was not backported in version 2025.02.x.

This revert the change to the test suite to not use kirk anymore as
it's using argument not present in LTS.

[1] 5151492c6c support/testing: ltp-testsuite: replace runltp by kirk
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/17125190886
[3] https://github.com/linux-test-project/kirk/blob/fc28d0b526047b6fd54b931a7aa6e369ed4bc1fb/doc/changelog.rst#v20-2025-04-16
[4] https://github.com/linux-test-project/ltp/releases/tag/20250530
[5] a8446df007 package/ltp-testsuite: bump version to 20250930

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/17125190886
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../testing/tests/package/test_ltp_testsuite.py    | 33 +++++++++-------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
index 6ff59b9700..a85ceb35a6 100644
--- a/support/testing/tests/package/test_ltp_testsuite.py
+++ b/support/testing/tests/package/test_ltp_testsuite.py
@@ -1,4 +1,3 @@
-import json
 import os
 
 import infra.basetest
@@ -8,7 +7,6 @@ class TestLtpTestsuite(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_LTP_TESTSUITE=y
-        BR2_PACKAGE_PYTHON3=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
         BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
@@ -23,24 +21,19 @@ class TestLtpTestsuite(infra.basetest.BRTest):
                            options=["-drive", f"file={drive},if=scsi,format=raw"])
         self.emulator.login()
 
-        ltp_root = "/usr/lib/ltp-testsuite"
-        report_file = "/tmp/ltp-report.json"
-
         # We run a reduced number of tests (read syscall tests) for a
-        # fast execution. See "kirk --help" for option details.
-        cmd = f"LTPROOT={ltp_root}"
-        cmd += f" {ltp_root}/kirk"
-        cmd += " --sut host"
-        cmd += " --framework ltp"
-        cmd += " --run-suite syscalls"
-        cmd += " --run-pattern '^read0[0-9]*'"
-        cmd += f" --json-report {report_file}"
-        self.assertRunOk(cmd, timeout=30)
+        # fast execution. See "runltp --help" for option details.
+        cmd = "/usr/lib/ltp-testsuite/runltp"
+        cmd += " -p -q"
+        cmd += " -s ^read0[0-9]*"
+        cmd += " -l /tmp/ltp.log"
+        cmd += " -o /tmp/ltp.output"
+        cmd += " -C /tmp/ltp.failed"
+        cmd += " -T /tmp/ltp.tconf"
+        self.assertRunOk(cmd)
 
-        # We print the LTP report and check there was at least one
-        # passed test and zero failure in our selection.
-        out, ret = self.emulator.run(f"cat {report_file} && echo")
+        # We print the LTP run log and check there was zero failure in
+        # our test selection.
+        out, ret = self.emulator.run("cat /tmp/ltp.log")
         self.assertEqual(ret, 0)
-        report = json.loads("".join(out))
-        self.assertEqual(report['stats']['failed'], 0)
-        self.assertGreater(report['stats']['passed'], 0)
+        self.assertIn("Total Failures: 0", out)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
