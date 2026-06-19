Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E8DCD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C15F6F5FB;
	Fri, 19 Jun 2026 09:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YZZS56C7Hja; Fri, 19 Jun 2026 09:05:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 857C56F634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859938;
	bh=6O+s5bMLU6OQUj5cYhWO3Wylt7kjRT/sbCOPfUiY9gA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MeIrSKi5C5PpiA9ailGIU4Q0t+5fyKkKHV5gvV7+gFdAqscF4miGMy9FHMOHcVEJE
	 fRHrS+jqFYhjj0woLCsiwzyD/2UH8PStTAt6lkKwhQOWWYnOKwMeLbYFfKay0vlY0a
	 sTRys8xjJFfon4Vncu7GaVKbmNbWxQWp2n6eDzQ67Z1tTKAImUbBDmZrDWFL8ApM2M
	 NztR8wOud98/Ci4+lUNXNIO5Qsgr7Sr8mMoaxiR6lvX30tOII0xOipsNplUTyfMGSq
	 3Rp3by/obR0mcdcZeQgg04g/0nnxOEUrMyU3hcwzRaZ1k0W/whv+920sDc2BozSFEI
	 GsWy/uZb6ODjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857C56F634;
	Fri, 19 Jun 2026 09:05:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FDCE279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE2784BE9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgHSVruX1bGn for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61EEC84C79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61EEC84C79
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E183381666; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aae70a3ab5d25f192babf8ecd91416eee176c216
X-Git-Newrev: 0853612155125494f79f66f410884a50ef2fe606
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.E183381666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_mariadb.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0853612155125494f79f66f410884a50ef2fe606
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
