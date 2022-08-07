Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EFDC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD11415FE;
	Sun,  7 Aug 2022 16:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD11415FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwpXwC3-ufid; Sun,  7 Aug 2022 16:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C561414C2;
	Sun,  7 Aug 2022 16:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C561414C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83E0D1BF681
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58BE5827A5
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58BE5827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ER06tY4kpxFb for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:55:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E22C2827A1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E22C2827A1
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:55:50 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.115.116])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 93B466012D;
 Sun,  7 Aug 2022 18:55:46 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 18:55:37 +0200
Message-Id: <20220807165538.850640-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659891347;
 bh=5HufWvbYNtrf7pTiwwjPeFMVN1gYjj7wcxOtrTAm7II=;
 h=From:To:Cc:Subject:Date:From;
 b=pcystcrqniq0TCibHP9oUDj+oE8eDMefhteh5X5rTOxxP85t4cR87sjif/DhGbfWG
 eNytu3OYRm+buTT/ojsplu5WGaHHjah9k3XZpIxu6eubR9Y0P3RZYS1ys7pGyiInhu
 VwRd/jCnO5FVmH0r6B4MsKBhh6lKD4qZM88vypIuzm9hSRI2oiYjwtiZR/ThXRpHKB
 hg7wz8WOUKmH8symcYJck1EIXrVrh6GLRUD48zaRqCzTcQtYH7UpuudwPBZTfPYwf8
 QLDMeSUvQfvo+Q2bbGJpyZH/26m+a7CdHBlkNyY90+wHqwB8DylstwqI64fuWnV0xk
 tw1BU6EUEyLWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pcystcrq
Subject: [Buildroot] [PATCH 1/2] support/testing: octave: increase test
 timeout
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Octave package test can occasionally fail due to timeout.
This commit slightly increase timeout values to reduce those failures.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_octave.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 82a70e09c2..2d808e0cca 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -34,6 +34,7 @@ class TestOctave(infra.basetest.BRTest):
                            kernel=kern,
                            kernel_cmdline=["console=ttyAMA0"],
                            options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.timeout_multiplier *= 2
         self.emulator.login()
 
         # Check Euler identity
@@ -76,4 +77,4 @@ class TestOctave(infra.basetest.BRTest):
 
         for mod in octave_modules:
             cmd = self.octave_cmd('assert(test(\"{}\"),true)'.format(mod))
-            self.assertRunOk(cmd)
+            self.assertRunOk(cmd, timeout=10)
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
