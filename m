Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6B0C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1340081FBF;
	Fri, 26 Jun 2026 14:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4urgDwtuRlJ; Fri, 26 Jun 2026 14:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C6C682256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485431;
	bh=7y7RH/Ho6S0uqdfC7UOLxEtvFJiBpEOkN2FNabi9Hdo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QE5NkB9THs6nslsB3AtMdQTGiZok/sUqO5YSfTdn3nfAl80be0uGfX5QubC+tsRHx
	 dgDPcPpSjw0SC27M+Y4Szr8BEjQ3b6LU2cUb233LtEGSaRBmOpreuLg+OVYtYnPqkf
	 wxauUvPY9gmLQomLdH4JazgsDE3SZWh398pWa+D0kzppvhggqZu/irFcLdpTE0RDhI
	 NaBIFoavASPZiQ/EBohpOfOs+c6TKpJUkGD34ftcgamWSVD+zm61Dh/W0lM2m+2a85
	 WqNfbEHRh7N3c4u2ZJq04F6SQYP6vfmIblI0aY6Yn9gUn5/5kNFYMS26PeDCDxj26b
	 n9rqyf3QJ3W5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C6C682256;
	Fri, 26 Jun 2026 14:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F877231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 054CA8215C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxljJ1X0KtNs for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C529982203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C529982203
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3C5A847A4; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2016f425e2bd1355e75a9576bd7c711c6c12f67b
X-Git-Newrev: 93ef3f534bda1ecae263e65f3d796f9912b2f9fd
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.C3C5A847A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_jq.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93ef3f534bda1ecae263e65f3d796f9912b2f9fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cab36bc293e99c54adbc14857098202724210b0f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
