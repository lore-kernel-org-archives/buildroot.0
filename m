Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8E1C44500
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 755CE80BB2;
	Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkLpVVesYHRq; Fri, 26 Jun 2026 14:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9739A80ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485501;
	bh=7f3lc3SpLFrJucfOpGLPDlgwgS4ru/UXOLMFb4ArVdc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y9Lyl7fbYs/bfk/OkieMncjZia617AXGnbqIdWkvjoxWlnO/m+16hxsq0+XLAj4qj
	 H+KSuu5i6+9tqUSBgjOz+1peH/OSmDlQiIrYzvCGsxMy8dyMnfygf5yzYA1G/dOSIY
	 ciC5LPLUqNw3xgP6XeAkirdiPwHhWyJYbBHrYc0BIt0oA4rW5hvyS15hwtqrCB0sFm
	 GGFerCVBsnMMxhzAqwq2DRssgjSQW5EyxdSz8UykDoscfXxvklwy97EZxkqXvfzaH5
	 4EP2WXDbMdaJSEngdGIagIpXsgqR0tLNHyOw1RtpUN/ln+j+igz2hkCckgfRndBBID
	 WiD+BLOW6BQmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9739A80ECC;
	Fri, 26 Jun 2026 14:51:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 143993A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1004340AB0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5rSlFc-RJvt for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E88040E21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E88040E21
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 136DF8649C; Fri, 26 Jun 2026 14:51:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:34:36 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 75f6dc84a22bdd2eedbad8b34307ffe9e74cbac5
X-Git-Newrev: d19226ef06e9762b8c67e8f14263ba5e37c60c7d
X-Patchwork-Hint: ignore
Message-Id: <20260626145108.136DF8649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing: infra:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d19226ef06e9762b8c67e8f14263ba5e37c60c7d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
index 13f9b2d398..a1297dc002 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -113,3 +113,14 @@ class BRTest(BRConfigTest):
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
