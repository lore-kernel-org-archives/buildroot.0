Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8542CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D831610E7;
	Fri, 12 Jun 2026 11:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7856bNKaD6p; Fri, 12 Jun 2026 11:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC80610CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263462;
	bh=GIiuHR1+3QXLCOf+6mS8OTo3LdtXyg2/s59TuRLg5EY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k2G43N6pZwRS9pv8sdkR4Xv+2X6D8vrbEmFO1XOvBhonSUPNoFG4b95vRB9vLE5K6
	 3VUBPykbktykEuyAPSzSjsWcj68xIMpD7wsfmML0fZKdi1ppjycfA45quMll3/Nd5E
	 4aYnBD5gwqLaxO5qNxiXvKZ84lMcJGVzvMIhSLVy61ahKASHZv3xwOUnLUpT2Ezxjn
	 7de/yE4vsJ+CtxWiLLgk37My5aViVOZ1woq5I7qhHvW7KuxrGqLqU4Xtiqsz7lQswB
	 9DePTCEcJc1tWjvHYET7TrjEhCIARSQ31sHVVApwd6eJQGP0xxa+far94AYPdW1PtD
	 yAtzTLzEWS3vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC80610CD;
	Fri, 12 Jun 2026 11:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5DB237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D500C4065F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baMYedsfQJrM for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B4E40667
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B4E40667
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A6AF880EA; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:30:42 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c4a95526c051a4f2550028e28777e1b5994d8a29
X-Git-Newrev: f4c69e4ff012a6bbbdb468718943ddf7c12ffc1d
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.7A6AF880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing:
 TestPppd: force the baudrate for pppd
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f4c69e4ff012a6bbbdb468718943ddf7c12ffc1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Since the ARM AArch64 toolchain toolchain bump [1], the TestPppd fail
at runtime since ttyppp0 and ttyppp1 interfaces were not created
properly:

    pppd[87]: pppd 2.5.2 started by root, uid 0
    pppd[87]: Baud rate for /dev/ttyppp1 is 0; need explicit baud rate

The new toolchain uses glibc 2.42 that include a rework in termios
"implement arbitrary and split speeds in termios" to support BOTHER
[2]. This rework seems to conflict with pppd workaround [3] introduced
when BOTHER was not supported in Glibc.

Fix this by setting the baudrate on pppd command line (we already set
this baudrate on socat command line).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335920 (TestPppd)

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=5cf101a85aae0d703cdd8ed7b25fe288e41fdacb
[3] https://github.com/ppp-project/ppp/commit/d65f6713c8514b016629b87d44d5154d70776f7b

Fix-suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 50d772b66bb0ab281aef2bade584de39b4cd6da5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_pppd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_pppd.py b/support/testing/tests/package/test_pppd.py
index 015f10f02d..0ba1ff7ee2 100644
--- a/support/testing/tests/package/test_pppd.py
+++ b/support/testing/tests/package/test_pppd.py
@@ -81,7 +81,7 @@ class TestPppd(infra.basetest.BRTest):
 
         # We start our (fake) remote pppd instance, in our netns.
         cmd = f"ip netns exec {namespace} "
-        cmd += f"pppd noauth ifname ppp1 {pty1} {remote_ip}:{local_ip}"
+        cmd += f"pppd noauth ifname ppp1 {pty1} 115200 {remote_ip}:{local_ip}"
         self.assertRunOk(cmd)
 
         # We wait a bit for the pppd to settle...
@@ -89,7 +89,7 @@ class TestPppd(infra.basetest.BRTest):
 
         # We start out local pppd instance, this time in the default
         # network namespace.
-        cmd = f"pppd noauth ifname ppp0 {pty0} {local_ip}:{remote_ip}"
+        cmd = f"pppd noauth ifname ppp0 {pty0} 115200 {local_ip}:{remote_ip}"
         self.assertRunOk(cmd)
 
         # We wait again...
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
