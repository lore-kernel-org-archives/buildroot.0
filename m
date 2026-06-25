Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA04C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667F182164;
	Fri, 26 Jun 2026 14:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5x11CdYou2O8; Fri, 26 Jun 2026 14:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F021821FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485402;
	bh=UFKuH+vT5eQmkr2cV5ZQzk67r8FVa++pOB3UEIslkEc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GR+0bqzCk3BJTWKxHMcNxmRoU5PBFr3t2rqFMg4b/lBzkWumFpXiwOOACmZuNZP4P
	 2mOgSO2tVVe+HoTF8RgQ3Jt8aIWkhKUtsE28+f65LMBSMSM/23Hstg9E+0rlDUIx7Z
	 5+ydhN/ykh3lserZ1uwROZvsNwxt4yQnGABwLbSncnK8snDwVg8B526Lw9ESLCV0q4
	 8E0oRPGBNaH9rLoYEffw/XxwaDqFUqdsPLX0pBx7c3tzzmjm30gHYyISnOad/hZ0Kf
	 k5JBH555yZuNSMRycNQ1FchcLNCt2G2JS+m8ImxKW3uzzlvUQStOvWqiXZK/O95s/j
	 VfryHB2WL3Hhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F021821FF;
	Fri, 26 Jun 2026 14:50:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C89414A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 429918215C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLKZ1eLhQ97K for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E4F821C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E4F821C4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6936A864AD; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0a891269b963874eba0925fef84650ba47456421
X-Git-Newrev: 2500d8534f72ed1d089dd5fe892c468e199a215d
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.6936A864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2500d8534f72ed1d089dd5fe892c468e199a215d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 830e0f49bbe42ba3acf0d91ff1a65748c434c46d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_bitcoin.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index 2cf8ad0be9..e301283075 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -101,8 +101,7 @@ class TestBitcoin(infra.basetest.BRTest):
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
