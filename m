Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF45CDB46D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14CC6F63C;
	Fri, 19 Jun 2026 09:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FiRGcvmnZ4N; Fri, 19 Jun 2026 09:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 201F96F63D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859932;
	bh=Y0oQhnTCQvFn8XyvJ5Iuf0iM4rh1+jxQ3ycDIOKPV4Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VA7DArxpl/jbChlASIZSLxCqvd4SaSpTcCg7Myej5Gghbos+NVyGwca/v+Qbbtr/n
	 TNS082s0/hlVmld20hXOHb9cQe/+ffE/fG4MXNJPSz+Iym7KNgu8IFaKYrccgGz/aX
	 qw30wFDDixobAdhmPponn8FHFC5uxJlyqjc5oFTsRna9AHwTfevOhUX3lrq208w5Xu
	 4HZFl9s3jmX1NoVwHnJZWRq4ZMay4QPMnawxPdLoM51xndw8P+Hi/DMycrwcguYzPy
	 fb5+dLM1OcZ3JsximEXaP4KcZNOJF+oqbT+QOSFUu0VLqDQ2YQAcJXXa7/RH209bqS
	 FX6NpyXvztEIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 201F96F63D;
	Fri, 19 Jun 2026 09:05:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E66ED06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6054B84BDE
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvCXZ5W3hZWa for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A32E84CB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A32E84CB1
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25CB581656; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4ef71a5927897c01326c1388f81f0c6c34b953b
X-Git-Newrev: 382146eff4d9706614d0167702df1caa20927266
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.25CB581656@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_postgresql.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/382146eff4d9706614d0167702df1caa20927266
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
