Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61351C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E24410E6;
	Fri, 26 Jun 2026 14:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qp4AlXbr3jI9; Fri, 26 Jun 2026 14:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA439410B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485514;
	bh=8fXC2GWDIyPpQYMroYE2Nflq/+vQSxsVb1/CbWmkp2s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hFT4kYSErt9mC00RjKSXw3DacczoyFMefpNHsdBQhwElG71ffzslHLnTSTQj9ie8c
	 OVjEbYtzm2lPBFjEhap0jCLqsn1q+NUrrhesn+CdM7CufXmOAN4qa5mga7d1S5rFBr
	 U9OexlFgN99fczy+jZBy+wDegKMn7403fhDYOH7JXjc14Dsz8otqicV9xy7YeFMfu0
	 YStKMm3nDUYwCCoS7MPeT9EEMEw2SBoy6Yg5xvtu35c+RCH++JPabI8t1oaWECj9E7
	 bBPsQlFmRa0g5+XEGT3WbOFscp1W+rJuTENFbHblUYh4gvylw1P9q527GfGChX0DzR
	 2z7Xmpmv0oW/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA439410B8;
	Fri, 26 Jun 2026 14:51:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3185231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9A8B4071A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYB28M7KB6Ut for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1297A40702
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1297A40702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 132D1864B7; Fri, 26 Jun 2026 14:51:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:36:00 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5bccec2779e49b3ba0be27f14e6aa4afa99aa01b
X-Git-Newrev: 288b47d79bbe661c39ad605db332452fcf423204
X-Patchwork-Hint: ignore
Message-Id: <20260626145113.132D1864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_fping.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/288b47d79bbe661c39ad605db332452fcf423204
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9a1d42e5d477ae3c5be3fe50490585243b05c5c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_fping.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_fping.py b/support/testing/tests/package/test_fping.py
index 507c4ce73b..e8aba653f1 100644
--- a/support/testing/tests/package/test_fping.py
+++ b/support/testing/tests/package/test_fping.py
@@ -41,5 +41,4 @@ class TestFping(infra.basetest.BRTest):
         self.assertRunOk("ip route add to prohibit 192.168.12.0/24")
 
         # We expect fping to fail when pinging the prohibited network.
-        _, ret = self.emulator.run("fping 192.168.12.34")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("fping 192.168.12.34")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
