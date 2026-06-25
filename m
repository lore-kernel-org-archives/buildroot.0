Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A518C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE0C60F75;
	Fri, 26 Jun 2026 14:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwE11ApRypYy; Fri, 26 Jun 2026 14:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9F060FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485519;
	bh=3xCYebjWZpGWjf514eJP8R5YfkmpMcVZVGaPTpZzS/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BnX7YsmDbxerhEzDqtR4nXvbqGSlRRQ35pd7qCC+EX8nw2WBFcPMxynM9RKVRw0FM
	 efvDDtZKSz6rqHHFi7EZwXnwfqamhcm/KuIvys8w9cij2sKFNxnW9IXVaeMu4AYNQA
	 4Qo3ivrxUZ/HnMxJIr5fUaJFvpoMVrzUEa+PO4J2gcetr5axRRdhEGBlHOQuNTcay6
	 aaSd/H2ba830EZCslXoH8pjysQv3McbEft4oGi9XyFKZ7oEeJqE1oUF8bTLV0UddbL
	 7+LP302yNV9Mv6ULVCyGf794swy/jw9ilhsolvmzl0Pq2bwEI06IcVXs+WZ2fZkl6s
	 vqD/qe+5ilatA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F9F060FE4;
	Fri, 26 Jun 2026 14:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28DFC14A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AFA660F83
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6uJuGkVNbVO for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52EDA60F5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52EDA60F5E
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50D408649C; Fri, 26 Jun 2026 14:51:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:14 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e2e56f99d2f2f789b468b2383baeb19cd39294c5
X-Git-Newrev: 3b795d74b9f8987c2f8357acbd1e3ca73f8948d3
X-Patchwork-Hint: ignore
Message-Id: <20260626145113.50D408649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b795d74b9f8987c2f8357acbd1e3ca73f8948d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
