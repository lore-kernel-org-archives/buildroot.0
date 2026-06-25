Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5C7C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD3B60F4E;
	Fri, 26 Jun 2026 14:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ABag0Ij-TD0; Fri, 26 Jun 2026 14:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E44AE60F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485400;
	bh=3K7FM4mFdjsC5aXzgX1xgduj4dKm56NKs2vyx0p8guw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X3GNUzp2hNEzr9EH15cUaID0kKWgmeM7W9KuIrLWial4i2f/MNH4tWItsF7LFBQ1y
	 CMb+h/dDETEd5lt2MEa0jeYuMAQTUJp4YHyrZjIUIMWnDTPsmqbhyRecgQtjEseh+y
	 gVrbEwnPlomwISWYkjpkRxACncS0H37GcgwcMtpuyMsqMVTnbxOzonkwVX5U0AcE5d
	 MTFOgx8f528lltuxF4jdngnlrC7E0zF1NHqiSkDW5uJL9JmbsE0lYraY+zxzgrcqVv
	 uMP9ze7uLN4Ci1lzIU2Ip9TXekHrZbKj4YCVR4kCNdATQm+NIW/hdkYGxXD/VWd8am
	 tWw9sVyjBSyPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E44AE60F3A;
	Fri, 26 Jun 2026 14:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D29D214A6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7EB88215C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWoHDBeZJPUW for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 310B782170
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 310B782170
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32154864AD; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:34:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6bd78cecedbb6883fcbaaabc40d968558395ae9d
X-Git-Newrev: aeb8e127a23232efb67de32af9eced0f8310f1c1
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.32154864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: infra:
 add assertRunNotOk()
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aeb8e127a23232efb67de32af9eced0f8310f1c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

There are a number of runtime tests that checks that a command fails as
expected, so add an assertRunNotOk() similar to the existing assertRunOk()
to handle that instead of open coding it everywhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 03783de150dc782cb0fc7326a87406dec72bc2eb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/infra/basetest.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 12d96415da..5c3231d2b9 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -91,3 +91,14 @@ class BRTest(BRConfigTest):
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
