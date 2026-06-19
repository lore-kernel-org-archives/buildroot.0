Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA48CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F105584BE0;
	Fri, 19 Jun 2026 09:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-3MT1croaKP; Fri, 19 Jun 2026 09:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3732F84C97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859912;
	bh=CKBUA7YnThjyN0A4/bSDdCy70T2SUfV6YDjD87Xk/Gk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BQD1WnjAdGcXjsR3BThJpWG1xsDLRWxJUGbyXGj90DAzqCJhA8dX2UUOlXnylY9EB
	 Dx9aPvX2Dfecnwz8glC0eg4+GQjDaX9vlXFP7MDO5nylxcJz/NCGdfFzDn/bIBWNai
	 wseJ1tYECEQUYagO09mU3R2ChP0PUWiYqLYcWJ0UaVB2ZUl+B4kle4Ica3uHNCQEby
	 oStr0SJGtEJoJqNwXImuLD4Rz1BLltMG6be1ROMUnVBodM1IrVGRf6n13yfNPRLfKG
	 FfFIm0DJ9bHQ5nAGxUJBERdk5YRuyxC0cnWYm/xwfSyvBWCCXYfHY7c7G8Ac1rqcpF
	 iu8cX3xaK10LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3732F84C97;
	Fri, 19 Jun 2026 09:05:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66803D06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5617084C3F
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEz-qUm4VD4B for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9800084BDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9800084BDC
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1286481662; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32bdc4710a483c3ea7b0d5a805b2a857f9a11872
X-Git-Newrev: 03783de150dc782cb0fc7326a87406dec72bc2eb
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.1286481662@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: infra: add
 assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03783de150dc782cb0fc7326a87406dec72bc2eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There are a number of runtime tests that checks that a command fails as
expected, so add an assertRunNotOk() similar to the existing assertRunOk()
to handle that instead of open coding it everywhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/basetest.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5fa902a77f..9b3eef6fa8 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -150,3 +150,14 @@ class BRTest(BRConfigTest):
             0,
             "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
         )
+
+    # Run the given 'cmd' with a 'timeout' on the target and
+    # assert that the command fails; on success, print the
+    # faulty command and its output
+    def assertRunNotOk(self, cmd, timeout=-1):
+        out, exit_code = self.emulator.run(cmd, timeout)
+        self.assertNotEqual(
+            exit_code,
+            0,
+            "\nUnexpected success: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
