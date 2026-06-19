Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEFFCDB46C
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB3F84BDC;
	Fri, 19 Jun 2026 09:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJ8NIQUfIdLS; Fri, 19 Jun 2026 09:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2684184E62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859934;
	bh=VY3izHyhXtjVD+Q7ZjV8PbwBYos2YyZSQhZsBhr3lwc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jon43/cJld7welI7tQv/tjoVWtaWlZnNG4dyU13J32mvetmS94ZI9DlGvpA6WUKQ2
	 kzjiW2vFAfyJrUbCZV7BZzI0N8tXnOMQvbZn4GBcFkxmhwShC3Xn2g8NiWu4nL9BcG
	 DXtzts/hz/NgAA01uER9QerYz/aYA3wwRvow2I5+5t6ElGCHxgnAuf7veutnuhyHvB
	 km2QG3Mf0gCxPlG5pQAlI1Q2gkS1sCGYd2d/0VzZLmbc00G53MU8Rk60CJMY6e+Fk/
	 EyIdEbbD7vUo4DrvWcF9GRI+xyJh7DlpGVH4BUAZ6L6aRGwIiadaqmh99HdSjhverL
	 bkNAt2Kpxin4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2684184E62;
	Fri, 19 Jun 2026 09:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 131ABD06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F58784CB1
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGqEh5UoWqdz for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3246084C35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3246084C35
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1E0981666; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75ae191b5f8bbe7fc971283922bb6b356a5e0c4d
X-Git-Newrev: cab36bc293e99c54adbc14857098202724210b0f
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.B1E0981666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_jq.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cab36bc293e99c54adbc14857098202724210b0f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_jq.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_jq.py b/support/testing/tests/package/test_jq.py
index 67420abb6b..ffa284ce31 100644
--- a/support/testing/tests/package/test_jq.py
+++ b/support/testing/tests/package/test_jq.py
@@ -34,8 +34,7 @@ class TestJq(infra.basetest.BRTest):
 
         # Check the execution fails on a non JSON file.
         cmd = "jq -M '.' broken.json"
-        _, ret = self.emulator.run(cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd)
 
         # Check an execution of a simple query. Note that output is a
         # JSON (quoted) string.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
