Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03238C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C620340929;
	Fri, 26 Jun 2026 14:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VcPG6YZ3ike; Fri, 26 Jun 2026 14:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB9454092C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485423;
	bh=R9bZZF7wlX8N9oifj3MHePTmdsdq6m8qh72ttaKAgmk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c95ocF0c9yRMkNKGkjnku3/HQl3xpcd8V82qTicg6fh4XagVMAXn0CkdpUwdjMyGP
	 lD/y/XRXcw7FetL6VnqQ+f/eevXGL6mDGy+FOA8XdBbeb7zFDsUHcYbozg47SnMHdF
	 XryPkX2MxFnuo1eD90voXssvAo4tGjMxSs/ysK6cpaCP2izL+A1S11mpkDp5rOT+0q
	 lzkfPiOyH38Oq+uo/iSL/XU4awQJ85ESzaE6hccpfzy040zse3KV+Z2Jj6y6mqoVhM
	 H3yTpy9vfW9Y86XjTP/GpzVrzbAhRAWOrgyGvNVKC3ZNgjEdMJfoXqNJ6D/ZX8A99H
	 XD0Us31WZIvEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB9454092C;
	Fri, 26 Jun 2026 14:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FEDE231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 325418217F
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRGYKewDNT7j for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F52982227
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F52982227
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60A04863C5; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 33866bc42c181f9f42361e3d15076e28c606e5e3
X-Git-Newrev: 44001e3e87db6b5749b2caa995d21ee418e713a7
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.60A04863C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_weston.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44001e3e87db6b5749b2caa995d21ee418e713a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ffa0905607e7b642b30bcc6bb54b5feb5426704)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_weston.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index c4bfc06ca4..4d4301c079 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -150,5 +150,4 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
 
         # Now weston is supposed to be stopped,
         # a simple client is expected to fail.
-        _, exit_code = self.emulator.run("wayland-info")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("wayland-info")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
