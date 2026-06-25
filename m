Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1646C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836DB60FD4;
	Fri, 26 Jun 2026 14:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4iXDKH_o2qm; Fri, 26 Jun 2026 14:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A74106100F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485528;
	bh=i9BibmsSTjwGxJl+8k5BiZBehZ3jLh0XUDa3vADkJ+k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PO9Wx0rLY1nKjEL9lNhHnytr7C3T6wUN1N6V3GLgQf/dmQYHT4ACSvNiKn4TIdgcd
	 K6Oo4TLEuzmekhRbsRL2Cja5xe+Jx+tyubIXf73esfa0I/z5E7E0uGSOOIeOySK07H
	 gBwpqXcPvJPE3/KOIrSY+IjyT4NN0KdMPxvM7KOSDILqlh6VJqw5NHzjXe1nJVitCL
	 EvLyxmlon4Wr8yPblmejPicpwWhn5jU8obhnYVQM05CYzDjy53m4f7g/ju337Qmvz6
	 R4Y08/xwhUl7cXlAOe78A0l6lSEHvuhjjXxD0RYEFaMwNnqY9ZR5qFfi7OxbnqfnCY
	 focMn4ApCpLgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74106100F;
	Fri, 26 Jun 2026 14:52:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB2B53A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D71181008
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbxV8in-CZOW for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C2D80FA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4C2D80FA8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8BB28649C; Fri, 26 Jun 2026 14:51:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:39:47 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d7204970beedbf2ba961be5c911b16ce74bd93b8
X-Git-Newrev: aef386b2811eeaa83cb1b7b961b05c9eff8d265b
X-Patchwork-Hint: ignore
Message-Id: <20260626145118.C8BB28649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aef386b2811eeaa83cb1b7b961b05c9eff8d265b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
