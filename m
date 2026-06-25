Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB5FC43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0481F82170;
	Fri, 26 Jun 2026 14:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7zILZYSKVbC; Fri, 26 Jun 2026 14:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1128215C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485412;
	bh=QtAMyCcni60RoyOM+NfotDByW35roSQyhQS4pODnshI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JJtslT0LtR7N6gUchvFdGJZa0qspe83up69yWssxvFDs5+wE6NuKW1S5/pSxTgqdO
	 FcOVz4FrGN0sodb2Zat3eVLcXDBUBy4hFac9jCIHfhNt61aDDZDSLk7SRT2/D6soab
	 9sZj7plQ3mLeDiVpVt83jpc7ja0nVzTCPzNlR80vGL8TN8lKetlCuW58wsX+vIApQY
	 vif1ArYul7W1drhmqhm3G3UNfrka7FYmeQJ1Ik9SFvfXiSo4nY4CICP9w7sY4tM6x6
	 PhReGrK8XJ8MSR9SsQmky35xoiQiyBvnt4GFjXTEQTmfdEJ/4z4vUcrDE0QLaJj57i
	 BlnRbgkoG6f7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1128215C;
	Fri, 26 Jun 2026 14:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89F1F3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70BFC81FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uOl4FtfBp_L for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A52B82224
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A52B82224
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B1498649C; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:39:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e37adc76dc16789afe1c3cd1eb5bffe93ba42aea
X-Git-Newrev: 3b5e1a62f6f38cd4944516f09e3cb3ddcb544c47
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.2B1498649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_postgresql.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b5e1a62f6f38cd4944516f09e3cb3ddcb544c47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 382146eff4d9706614d0167702df1caa20927266)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_postgresql.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
index bd41fc3f1b..08926b0ffc 100644
--- a/support/testing/tests/package/test_postgresql.py
+++ b/support/testing/tests/package/test_postgresql.py
@@ -180,8 +180,7 @@ class TestPostgreSQL(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
         # Check the server is no longer ready.
-        _, exit_code = self.emulator.run("pg_isready")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("pg_isready")
 
         # Restart the server.
         cmd = f"su - {self.db_admin} -c 'pg_ctl start -D {self.pgdata_dir}'"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
