Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3DCC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E28AE82250;
	Fri, 26 Jun 2026 14:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mMuuiKlbdGb; Fri, 26 Jun 2026 14:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 164D482257
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485428;
	bh=o/1ve6A+q1+7TYvph/Jr5f8xc1F+N1R0XUEkAGLlFkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N2xg4aXBsPWg6OFCPUIh2UG50IkR9zwhiD8e1KpzOdxqbYktcxfPDFlCp3Biprzdj
	 /J7LenvRpVx4iWdZZkD9R1z4Qv2j/25oEnQijXRMwnk0Do48ZKcP09U1kJwx47kgXb
	 zeeYYLtzEgz+Lvkz/h6sIMWIlx0OWgukqkrS/KnwgAvLnS212ZSKZacn+j6O/wPOIg
	 m0g0QOn1uZcrbJ7xUYc3+uXmB3TEYIqVJOAaOAnXhjG2ywC0uJKK5uCgMrAN22zpEn
	 V14tzJgxXP9QIqAM+JHz0TuMx9Sz5FCJcEI03n/NWU6HEB/6q15rKCsEGPOA4aSrYR
	 It+ip3egIiUDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 164D482257;
	Fri, 26 Jun 2026 14:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD7D53A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E88981FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRanJk9mEueb for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2CB1821FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2CB1821FF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A378F864A4; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:58 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: df353e4d2a5b3d5b995a560da09b809b1e99af9d
X-Git-Newrev: 0a0e108a5873cc62859b1883fd85e034ab9f1771
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.A378F864A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a0e108a5873cc62859b1883fd85e034ab9f1771
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
