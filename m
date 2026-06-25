Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC69C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA76410ED;
	Fri, 26 Jun 2026 14:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIdbiUTjfHoX; Fri, 26 Jun 2026 14:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69E5B41142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485523;
	bh=6XVGobSRmlYLc8uYTM425ewU1zFzFlgW0bSu/1ChQS0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CLaBOL+MDGAAtKRFjGYnYmQP81FHyrRyvi56nK1xKtctbUM4R75zYvzJXTHGVWZZ7
	 ANGYOipbg9XrwSWOP7A0KMp4kcKht41lXpic5BaxsE0F4taiaynAC4jWeQlh6ggWQa
	 8vPdisuCAIXnIWNCR7DsvqHl5AYfdn/66Sd2gENGljxqMKSAlqEvqBuMt9/B/gyuu4
	 4hi2Zeb/O2qq7ZTjYKF0wmRixdncY8PEUoEipDq8HjWjJn8v4XZERNfzHl46B6rhKC
	 8KhN3zA1NHvRC5qvBWxpnOB8wBro9nNqIPCmlYF9unKsyD40A/1ZDTl54hvSWD82F8
	 9XNmmX2lrVYPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E5B41142;
	Fri, 26 Jun 2026 14:52:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EABB231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 503FF40ECC
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBgNZHIEmt-G for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBC040FDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FBC040FDC
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE038649C; Fri, 26 Jun 2026 14:51:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:47 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e554f9a84e57fa3df258ff7424dfe268f2da90bc
X-Git-Newrev: e4c74627660c25080f36cfc3ddd87800ab3f34a7
X-Patchwork-Hint: ignore
Message-Id: <20260626145116.8CE038649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_mtools.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4c74627660c25080f36cfc3ddd87800ab3f34a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ae1ff2d8dce7a5e142758faf5fb567c572451ec9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_mtools.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mtools.py b/support/testing/tests/package/test_mtools.py
index 23ec08b6d6..8fc8766207 100644
--- a/support/testing/tests/package/test_mtools.py
+++ b/support/testing/tests/package/test_mtools.py
@@ -29,8 +29,7 @@ class TestMtools(infra.basetest.BRTest):
         # Any Mtools command is expected to fail on an unformatted
         # partition.
         cmd = f"minfo {mtools_opts} ::"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Now, let's format the partition file to FAT
         self.assertRunOk(f"mformat {mtools_opts} ::")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
