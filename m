Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0792C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 17:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E27D41D95;
	Fri, 18 Feb 2022 17:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sj-I3N7zcQra; Fri, 18 Feb 2022 17:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8824741D93;
	Fri, 18 Feb 2022 17:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 789FB1BF48C
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 17:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66A4584C35
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 17:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaVHptkl0hRx for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 17:36:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6309184C34
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 17:36:17 +0000 (UTC)
Received: from localhost.localdomain ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L7B0nQUksNVvLL7B1nlMg2; Fri, 18 Feb 2022 18:36:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645205775; bh=14Qy9YE3usypwm0d94g74Mqi/yL+dLGrpWr+SD2WkA0=;
 h=From:To:Subject:Date:MIME-Version;
 b=AHJoDTUJ4Dp5kAUKE4bdIhdvL6sLi1hnqvwPT30Aox13j8DbBjyxYXYw+bqVzYJtm
 6CsDlPnsYSXBnOvz8NnQb3FW9yqGi23EvwfV+YLJBRBY9+j10Iukx21a6zXe8yf/X7
 GbuTb5dByuqFJj5AmSXikLiV8X/EQv3PGS4uMU+aB3l6NiXgHkkekkewwTvy2jaWrl
 s8X1II58+CUAxydGleuP75sy58DpA6KFL/F1+Bu6w7ec4QFv7emI2+YBkPc9db7+KV
 lgjidDpZLBpGcMF8oPVymp2XirBbgYUsqBnLAEX73iQhpS/Ro0aiZE9sS1S9/B+fHc
 ALRLP7+NZlAZA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 18:36:13 +0100
Message-Id: <20220218173613.315794-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218173613.315794-1-giulio.benetti@benettiengineering.com>
References: <20220218173613.315794-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHCoV8CQPVssWmJjKQ4C4CHZgmfOx9fsWnoakLcoXcHs8FfFW1/KqNM1FkXk+QwBC7R05CSvfXjdHP8Fuv6uOZfe6HijA7SQwjRhLXupmtFmybkNE2nr
 6VZRlNnm7Tr7/bGd37O8jY9BsZ3tacnKCP2sLN7pGQ136tDluSYQ08N1MspUh8Bg3Dp5vMK0V5Oe3w1l9WtN2d3X0xvyteStCVjKMO8bwYRmD8GHixLya0F7
 9RXGfgYUN/3BF4Byidlubds/4SOvMTJHCSfNL1iLbx7I6XHIiqZrqN++PrfsgUajAwcX5+Hdzaa3nHSMdIZuqw==
Subject: [Buildroot] [PATCH] package/trace-cmd: bump to version 2.9.7
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 00cecc7828..4d39e4d5ea 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  45924a763376a700221f64b4034f87263e4038ec88b120a0abfb5743d051d068  trace-cmd-v2.9.6.tar.gz
+sha256  a74d9ade2633b88d0ad199360d51996427e23f4835594133e456cd6e3bd3a651  trace-cmd-v2.9.7.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index fe0cd71ec4..52bb99036c 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 2.9.6
+TRACE_CMD_VERSION = 2.9.7
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
