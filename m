Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731B3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106B660184
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 106B660184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2EC183A92;
	Tue,  3 Aug 2021 22:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1T_OMNbVXSaO; Tue,  3 Aug 2021 22:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D72882AF5;
	Tue,  3 Aug 2021 22:11:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B46B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FA1840584
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3-l3oCiM6Gn for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6906240435
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C05098B43E; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 May 2021 22:15:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c2ebfe7d78f999ff2201a4d9b59cc8c0efe85218
X-Git-Newrev: 45a13be315f2e3dd9caa29dae8c84280975d4807
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.C05098B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing:
 test_hardening disable PIC/PIE
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=45a13be315f2e3dd9caa29dae8c84280975d4807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since [1], PIC/PIE is enabled by default but the TestRelroPartial
test expect implicitely PIC/PIE being disabled.

Disable PIC/PIE from the config fragment provided by
TestRelroPartial.

[1] 810ba387bec3c5b6904e8893fb4cb6f9d3717466

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661757

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/core/test_hardening.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 60e14303a3..e9d30f3a38 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -52,6 +52,7 @@ class TestRelroPartial(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
         BR2_RELRO_PARTIAL=y
+        # BR2_PIC_PIE is not set
         """
 
     def test_run(self):
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
