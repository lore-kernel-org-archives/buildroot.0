Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3C5C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80C7141156;
	Fri, 26 Jun 2026 14:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6VZvmkgFK3g; Fri, 26 Jun 2026 14:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A65684116C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485526;
	bh=n7jakfADuAhQR7zohYX6HSqpwO7LaDCgBBCwmy57FTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OLst5HJfnDjMXZW4CUhxcLixr7m9QAbNx+QreciVu3Klx7sdxW9W7SU8dKYZvPsxP
	 BlHEziBXHEduzzHBwb/iXoUaIqMVib8uY0LGdpavaKYKQU0I6685wPjcrOONmPQaiL
	 zYxkZ572pFspPwn8yH3YR822K4Fe0/zPNXeuNw88JlNzxmxepGdShoLgo7Rl2I6CZc
	 eB4UU/qd+G02v9LvMPbdPG+O9Y3BdlsYISq4zEsDvuFoJeDzTTNPCPiKJeUaluPHag
	 ftA1/SQ2WSIi4lZ3zQ9WP9XAs9R7h0EFUXuLVsl6Tu6BiCsjEcWcOF/YcHmILky2KC
	 fzsd0rczN/jaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A65684116C;
	Fri, 26 Jun 2026 14:52:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA2843A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F89B40FC1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptaU9BK7cLT1 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A742740FE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A742740FE0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A900C8649C; Fri, 26 Jun 2026 14:51:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:39:29 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e4c74627660c25080f36cfc3ddd87800ab3f34a7
X-Git-Newrev: e9b1a3c0d5fd2419bb57b3b894704a11844a8141
X-Patchwork-Hint: ignore
Message-Id: <20260626145116.A900C8649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_octave.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9b1a3c0d5fd2419bb57b3b894704a11844a8141
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5c017f6635b8cc1856e6bd74f87eca320dd3575)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_octave.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 5c0b26a5fd..ef6516939e 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -51,8 +51,7 @@ class TestOctave(infra.basetest.BRTest):
 
         # Check octave can fail
         cmd = self.octave_cmd("assert(false)")
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Check string output
         string = "Hello World"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
