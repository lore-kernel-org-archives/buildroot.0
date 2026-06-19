Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C06CD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE30E84D84;
	Fri, 19 Jun 2026 09:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdUjfUWbKsMF; Fri, 19 Jun 2026 09:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E39D784D2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859922;
	bh=xmTyjCOKYM+wrdDhlClAzjK4RtI12tclcRcHzYajxJw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hetrnZCVvDVVe10kMeeef4VLKcBGbjHIvesnnvZ2N8egALGMdWzpvdrLXhmDkWm1R
	 QJTdHu6YTIPlxgml7LccY0b3nWZtsqxLBeGuMPqikz9+DNR4jNPXDhpqCY3UXsRfCm
	 JnirDr3QOUWBHVItDxzYNsgmZKbzdyZNP1YvmfJwUo66b82b7tSf1dDlDWyfnHyKmv
	 Y47xcSDEzN93aqkSHnknlMsTAAYJx1Xezd524Qd/1zj0lyPzjPbvnuDC43wgI+lfb6
	 TpLhDLon0fJmhtn7GnGIm0TR/Tz+mkSNFSRhjdu3cHaD+W5jZd2lnO+qljhmYh9ht/
	 5oBfa8dMWTMRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E39D784D2A;
	Fri, 19 Jun 2026 09:05:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E76D06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B76AF84BE0
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZaGc6ZsdZd3 for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0379884BE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0379884BE9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8344481666; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b1ea65f3a0eb433a70a9814eedd86d73650cf1a
X-Git-Newrev: 9a1d42e5d477ae3c5be3fe50490585243b05c5c8
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.8344481666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_fping.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a1d42e5d477ae3c5be3fe50490585243b05c5c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
