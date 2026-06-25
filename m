Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE6CC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0136F60F45;
	Fri, 26 Jun 2026 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcmixZAUcJE8; Fri, 26 Jun 2026 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A79F60F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485429;
	bh=cWODpNFuRp5YUfI3I4m5SnH348yFOFdAISeteHjin2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hkWQKV9OI6I58Rrhf2D8ZYVGmJpiJlGWCBVv6tjg30h+hokyKhQw/smy8oR7SE+st
	 NMWSvqQp2eJpEHwbLLjeoP4u7cm6RqRr+K1634be07i/cpAuceulXgZf3MuJDzF9cg
	 8HeUO3v/WWhoeclzZkpULKhvvKcdrhyGUYlB3UoFNLZQdsjLrYm9HUqKFZ6bRoAfCS
	 FAXOZxRCwUGz+16NpDm1Eeap8ua6uW8hyAkOnXp4JuBKqhuDPFVRVeZi/MGgKKAkUD
	 JYvguM9BS9r2WH1SSz1/hMqhxoGQPSq/Hn1hYR3ObEVx9bBp7Sctni3gLFj4yJ2DrO
	 kAHvOJEimC2GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A79F60F96;
	Fri, 26 Jun 2026 14:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7CEA3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEB0C81FBF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxpizK8j43cD for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76BB82201
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B76BB82201
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B83EB863C5; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:36:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a76f24d70bbcfee34888bd09ebb508db3e94871e
X-Git-Newrev: 2016f425e2bd1355e75a9576bd7c711c6c12f67b
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.B83EB863C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_iproute2.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2016f425e2bd1355e75a9576bd7c711c6c12f67b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f3942975c49804cec7b2e5288cc9fba906dcafdc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_iproute2.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_iproute2.py b/support/testing/tests/package/test_iproute2.py
index 91d9006e23..78f8dc291e 100644
--- a/support/testing/tests/package/test_iproute2.py
+++ b/support/testing/tests/package/test_iproute2.py
@@ -46,8 +46,7 @@ class TestIpRoute2(infra.basetest.BRTest):
         for addr in addrs:
             self.assertRunOk(f"{ping_cmd} {addr}")
         # ...but the IP outside is supposed to fail.
-        _, ret = self.emulator.run(f"{ping_cmd} 127.1.2.3")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"{ping_cmd} 127.1.2.3")
 
         # We add a prohibited route.
         self.assertRunOk("ip route add prohibit 127.0.1.0/24")
@@ -57,8 +56,7 @@ class TestIpRoute2(infra.basetest.BRTest):
         # ...while the other IPs expected to fail.
         addrs = ["127.0.1.2", "127.1.2.3"]
         for addr in addrs:
-            _, ret = self.emulator.run(f"{ping_cmd} {addr}")
-            self.assertNotEqual(ret, 0)
+            self.assertRunNotOk(f"{ping_cmd} {addr}")
 
         # We should be able to see our prohibited route.
         out, ret = self.emulator.run("ip route list")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
