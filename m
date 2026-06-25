Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECEDC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70134107D;
	Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XU2WzMjbdikN; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1537340FF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485510;
	bh=aRqMkvXp31xE3HPdx5bra3CG0lYbPc8E69BRQmStydA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iMVVVPjib5MmeKZr1Jkzrf84BrW4+PcGSC1wfBrpHrcLGSMrakbFmAPf7NjZr8CcX
	 pCozZa9BXMcmaEWf+vQ6/p+PHXbGA/ueuizso7z+7QuLOYY/8OtTmNQmm650/Y0hxa
	 nDsVPhJ7SSCagR3XvtalEFHXcBotoLwQOTe4glvuvaOKiUP+VkwreEHNl3aFG0e/6w
	 8HLi8QXvIVblCnrTqLEvRgJd7wf/6QIZpnE8MFxr5/T9N0vSaoMKbAdYFtC9TqnAod
	 QbWxlhvn+WTHRqNrjBWMMnlnaY6ogZmsswYaotkUbJ3bw85jxTVnRtea34CJPiP+bz
	 75+Hdci1OIFMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1537340FF6;
	Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32AE53A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22E3580DE0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pR_LfWhaGh9J for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5975C80DBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5975C80DBB
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C3EE8649C; Fri, 26 Jun 2026 14:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:27 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 45f26d60a9e1b08beb57d4f4001d50fbf3d639a9
X-Git-Newrev: 21bb39308fc64ba145f56e0be236afbb17361631
X-Patchwork-Hint: ignore
Message-Id: <20260626145111.4C3EE8649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_bitcoin.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21bb39308fc64ba145f56e0be236afbb17361631
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 830e0f49bbe42ba3acf0d91ff1a65748c434c46d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_bitcoin.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index 186240b280..9a7d78e5e8 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -108,8 +108,7 @@ class TestBitcoin(infra.basetest.BRTest):
         # The bitcoin daemon is not started. A client ping is expected
         # to fail.
         ping_cmd = f"{self.cli_cmd} ping"
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
 
         # Start the daemon.
         cmd = f"bitcoind -regtest -daemonwait -fallbackfee={btc_fee:f}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
