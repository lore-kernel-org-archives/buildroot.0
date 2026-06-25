Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B98DC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F90581DE0;
	Fri, 26 Jun 2026 14:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhNzy5b22bIZ; Fri, 26 Jun 2026 14:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 749A3822F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485524;
	bh=mynW0RIzspjOmDNcY3yxXUyCtD4o1sok2kwksS7Rnto=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D1wJPThEBwDsABLPf6yeva6g5y1ajA9K2kG351m7y60fPx6Kq/PsliF3V/9x7Px11
	 tQN2Nb9+MbtQt52fdHYjVAPJT9O2qnPMCTsCcW/4MswtqMhJzJiX9+YMYfntM/RaWW
	 ym3tn4v/WV1bGbGuvy2SYDXpQUrzIuknWHyB+7DxxE+FFP9Qt+y/OhIUKBQmV6M+Sf
	 V9BXhATCJsRHPHs8y0tZYFiaJafZQzsZV+X0PRtw1v50G4m1kcGCxjNqq5QW+9IMxe
	 VDWo7DDWMN7RoH6vzKywtWZRbCdldpwgQyqOuw7tJ75a4PjEIar7aHuqDoZRtMsGvq
	 QeHH+4kPJ0NpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749A3822F0;
	Fri, 26 Jun 2026 14:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A87E03A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B46581008
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0u3Vv6BgvC2X for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A236180DBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A236180DBB
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CB92864B9; Fri, 26 Jun 2026 14:51:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 64f5559e11a7d9ef28f0b6544581c2a09f8f7c41
X-Git-Newrev: e554f9a84e57fa3df258ff7424dfe268f2da90bc
X-Patchwork-Hint: ignore
Message-Id: <20260626145116.7CB92864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_mariadb.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e554f9a84e57fa3df258ff7424dfe268f2da90bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0853612155125494f79f66f410884a50ef2fe606)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_mariadb.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
index 67ae61c3e1..9ffe6aa3b3 100644
--- a/support/testing/tests/package/test_mariadb.py
+++ b/support/testing/tests/package/test_mariadb.py
@@ -179,8 +179,7 @@ class TestMariaDB(infra.basetest.BRTest):
         self.assertRunOk("/etc/init.d/S97mysqld stop")
 
         # Check the server is stopped.
-        _, exit_code = self.emulator.run("mariadb-admin ping")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("mariadb-admin ping")
 
         # Restart the server.
         self.assertRunOk("/etc/init.d/S97mysqld start")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
