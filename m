Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D186AC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C8A61086;
	Fri, 26 Jun 2026 14:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gH1p0D3gCVkd; Fri, 26 Jun 2026 14:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D99226106E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485531;
	bh=FM/aHCyDqlmQQp/jt/YUsvpgym1fKW47vOV7X7MkJzs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lV9IN3qyJAMV5NtAStolCrVzEN4CvgpycOs3yQAuDrv6gQD8G881lrmXUFxsVCCWY
	 94fSmDa2kFtcDhnAeSfglUF7x1uaoj/7tHKuMPGKVK2WoBh3kFqwuBThjmPZhSVQzn
	 HsHod36EaHOzjcncH9bA0bAffwdhWmMItmrxpVLjp3hBT4HaLakbHIxdKKgujN0een
	 6+zslOr5l6UmFGagojF9n6rU8qj2wGbYtxP4RUt5TSx0XIqcMApoOSmXbrVFkePUgR
	 Th7ne2b0pF2JPvGVXBA+frMaob/N+VSCDw92kvyNhdVrioNyGb70Ba4rB2b3ctEttZ
	 0qTHv3WlZCUZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99226106E;
	Fri, 26 Jun 2026 14:52:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3744614A4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25B8A60F72
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LL1k-X4UzALt for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C61660FC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C61660FC9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE0C847A3; Fri, 26 Jun 2026 14:51:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:08 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d7cb451475d1800442a896ba55cc4b228c6432ac
X-Git-Newrev: 3536c9de39f3df9e9c6a92e4114c603ec724c74d
X-Patchwork-Hint: ignore
Message-Id: <20260626145121.4CE0C847A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_usbip.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3536c9de39f3df9e9c6a92e4114c603ec724c74d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6e04f8f21f2770d5e2205f4afa44831d23e05982)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_usbip.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index da94d6f92c..2fae8f7f6a 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -56,8 +56,7 @@ class TestUsbIp(infra.basetest.BRTest):
 
         # The daemon is not running yet. Listing remote devices is
         # expected to fail.
-        _, ret = self.emulator.run("usbip list --remote=127.0.0.1")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("usbip list --remote=127.0.0.1")
 
         # We start the USBIP daemon.
         self.assertRunOk("usbipd -D")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
