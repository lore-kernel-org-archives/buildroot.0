Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D94C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 11:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F175C837CE;
	Fri, 10 Nov 2023 11:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F175C837CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UVPih4Xx2ab; Fri, 10 Nov 2023 11:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3E4837BC;
	Fri, 10 Nov 2023 11:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3E4837BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 698AD1BF3E1
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 430F841F8A
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430F841F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6URA1Y7Rp_R for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8489141F71
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8489141F71
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7333C86EE7; Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 12:50:26 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6ff63490d1ca805250cb1ecd7ebfc359a19d9943
X-Git-Newrev: c9e4f18658ecc07c78492cea0d3e644ba9313f1d
X-Patchwork-Hint: ignore
Message-Id: <20231110115336.7333C86EE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 support/testing/tests/package/test_lxc.py: use timeout argument for
 emulator.login
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9e4f18658ecc07c78492cea0d3e644ba9313f1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

self.emulator.timeout_multiplier *= 10 is equivilent to 60 * 10 or 600.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4889ac89b8438cfaba0708338fb52d553110c1a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_lxc.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index f66b31f3ba..5a37df7a38 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -32,9 +32,9 @@ class TestLxc(infra.basetest.BRTest):
         self.assertRunOk(cmd, 120)
 
     def wait_boot(self):
-        # the complete boot with systemd takes more time than what the default multipler permits
-        self.emulator.timeout_multiplier *= 10
-        self.emulator.login()
+        # the complete boot with systemd takes more time than what the
+        # default typically allows
+        self.emulator.login(timeout=600)
 
     def setup_run_test_container(self):
         self.run_ok("lxc-create -n lxc_iperf3 -t none -f /usr/share/lxc/config/minimal-iperf3.conf")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
