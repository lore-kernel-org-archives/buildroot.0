Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623CAC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3736F81DE6;
	Fri, 26 Jun 2026 14:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDeWCzICHCoS; Fri, 26 Jun 2026 14:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E4781BB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485521;
	bh=zQZgGSBPsVfTW5vIwUT0+S9ZrBvAcuODIFUspj7hNKY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YPPdFGl7JPvidfJIT3dR8TWNtIajPlOvg0E0ToK4BCr3Yayn2CAa1I+CLwxbCwCWN
	 P9K+YwbBMLikUHuyijGMCEuHqubcmhFuuz4bXhQE2g3uoYR3IzUmxZ451sQXX7Gvj6
	 VgRJeACuW3pXeSQmdg93JhuVUxGRIzLRTdcQilSd96xSLGuX0gWh82SJn9VtojvMEH
	 yeklIirtRCKME+0zcyMh5k1/Xga1Tav7ycofG4XDfHMSbo09zaywaBUXjgKoiM+xdh
	 fUqLN/tB9KUb/qNbXMqI8OLHVJvKuJJGvX3e7yOS1VS5d5QWyVFisXklIVShkuzDwn
	 TJ2gNPoEJzdoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E4781BB2;
	Fri, 26 Jun 2026 14:52:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5A083A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D758180F68
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WScCU3JfwwVY for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F349C80E0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F349C80E0D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39098649C; Fri, 26 Jun 2026 14:51:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:20 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 3b795d74b9f8987c2f8357acbd1e3ca73f8948d3
X-Git-Newrev: 35c3d26371b50ee690e42981c78fdd30508ae62e
X-Patchwork-Hint: ignore
Message-Id: <20260626145115.F39098649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_kmod.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35c3d26371b50ee690e42981c78fdd30508ae62e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c566e5c6453ef60c0f710080ecb157d7557e0575)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_kmod.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
index 3c06589b2b..a88257ef57 100644
--- a/support/testing/tests/package/test_kmod.py
+++ b/support/testing/tests/package/test_kmod.py
@@ -73,8 +73,7 @@ class TestKmod(infra.basetest.BRTest):
         # With this test configuration, we are not supposed to have an
         # eth0 Ethernet interface yet. Attempting to show info on this
         # interface is expected to fail .
-        _, ret = self.emulator.run("ip link show dev eth0")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("ip link show dev eth0")
 
         # We try to load the module.
         self.assertRunOk("modprobe virtio-net")
@@ -101,5 +100,4 @@ class TestKmod(infra.basetest.BRTest):
 
         # Now the driver is unloaded, we should no longer be able to
         # ping the emulator.
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
