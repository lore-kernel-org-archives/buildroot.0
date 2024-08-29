Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243EDC83F25
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 13:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933D14196A;
	Thu, 29 Aug 2024 13:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FN86VAjGUgP4; Thu, 29 Aug 2024 13:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15EC141300
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15EC141300;
	Thu, 29 Aug 2024 13:42:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4183D1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BDCF40431
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVleuaZ7Lcwq for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 13:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD0140407
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FD0140407
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 13:42:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A51186679; Thu, 29 Aug 2024 13:42:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 15:35:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: fdce4439ae919c5b92c7db2191b637491de870dc
X-Git-Newrev: 37d82d410e3532b867749d29d9c52f80ac6b43f2
X-Patchwork-Hint: ignore
Message-Id: <20240829134226.1A51186679@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: package:
 gpsd: fix gpsfake command line
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=37d82d410e3532b867749d29d9c52f80ac6b43f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The gpsfake command line has a typo (a missing space), which makes the
next gpsctl command to always fail.

This commit fixes the issue by adding the missing space.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792948

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 49156a0fa4a48d5d80f03c3854f631f312b486d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_gpsd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
index deed586c17..7ca5973981 100644
--- a/support/testing/tests/package/test_gpsd.py
+++ b/support/testing/tests/package/test_gpsd.py
@@ -33,7 +33,7 @@ class TestGpsd(infra.basetest.BRTest):
         # We start the "gpsfake" GPS emulator instead.
         cmd = "gpsfake"
         cmd += " --slow --cycle 0.1 --quiet"
-        cmd += "/root/udp-nmea.log &> /dev/null &"
+        cmd += " /root/udp-nmea.log &> /dev/null &"
         self.assertRunOk(cmd)
 
         # Wait a bit, to let the gpsfake and gpsd to settle...
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
