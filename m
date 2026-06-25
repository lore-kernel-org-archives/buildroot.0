Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A292C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CCB160EFD;
	Fri, 26 Jun 2026 14:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4c25SYnztlAO; Fri, 26 Jun 2026 14:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102B160F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485410;
	bh=5kwbMIhKE2ePRBjhJ/JskrkcCWslJ67cnShNx0KYJyQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bjhh02BGuhLcuZdDQ/iMJKv0rp3TE9s6TUFqsLbupMr6NwrAVId6R7JQEWK5aotYg
	 AgndUrQmWMTf7uv66h9HOsqPdWBrJ43zAbt1oLGKUy54JjB+eP3RQBYIpUmeDG5+Eh
	 aGXTAxk/m4PhhNhi2N5d0Ft2HOvJS3tut25FjUmEkdtBy/w1LIGRadOugRS7tR0UlO
	 jW0b3iR4BPrm8JDCl2e/NMqjOzGhjM+MrIzig7wjxSAxMhWBK44FGrW3RSUdaeOqIi
	 mOwb2LwrywFhnjCagWpEb0Qk1CNB4cBLwAPFYgNjOEZmpRyB8aVcYDQLpkNdb8TsXB
	 QxUZFHJrACvfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 102B160F31;
	Fri, 26 Jun 2026 14:50:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2792E14A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A42681FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnXY1bGq5vUV for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF9D821EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF9D821EC
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D231864B9; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8540bfd703821e4931de8e397eab9407dbb2957b
X-Git-Newrev: 2f05b25d566f7bf75528f448ceae3813b671daf5
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.8D231864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_ddrescue.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f05b25d566f7bf75528f448ceae3813b671daf5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d7284778a130e123cc9c1a3705b5da0a2f9a767d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_ddrescue.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index ff2af80cfa..e717144e24 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -70,8 +70,7 @@ class TestDdrescue(infra.basetest.BRTest):
 
         # A normal 'dd' is expected to fail with I/O error
         cmd = f"dd if={dm_dev} of=/dev/null bs=512"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Where a normal 'dd' fails, 'ddrescue' is expected to succeed
         self.assertRunOk(f"ddrescue {dm_dev} {ddrescue_img}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
