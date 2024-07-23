Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A68C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C38A403EB;
	Tue, 23 Jul 2024 08:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxTvIdV_DUMk; Tue, 23 Jul 2024 08:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6A4E40452
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6A4E40452;
	Tue, 23 Jul 2024 08:50:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EFD61BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7DD401CC
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBBSVwsGtoQ4 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C3B84017D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C3B84017D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:50:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4BAC87155; Tue, 23 Jul 2024 08:50:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:50:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2822fdd0bc2a961544e38cf0f8c6f4bd22855714
X-Git-Newrev: 49156a0fa4a48d5d80f03c3854f631f312b486d4
X-Patchwork-Hint: ignore
Message-Id: <20240723085020.D4BAC87155@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: package: gpsd: fix
 gpsfake command line
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49156a0fa4a48d5d80f03c3854f631f312b486d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gpsfake command line has a typo (a missing space), which makes the
next gpsctl command to always fail.

This commit fixes the issue by adding the missing space.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792948

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
