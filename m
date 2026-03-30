Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1089A1061B20
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 19:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF6C340CA0;
	Mon, 30 Mar 2026 19:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N08JT7wlJeaC; Mon, 30 Mar 2026 19:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE0B40CA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774900305;
	bh=8dbMIZUImnlkxLrco/BzttzhDUJKVjdc0uP/fQjvRFw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P9/MLp26I+E7U1fwmV2xa99yyAQ9g9H/thyqe0aGtAa9xyHFB3mLp+fndp0iigIGO
	 hqDIhmFHIGuovIhn4HY+8icIHAtD9dcJyxrdliRP2V40+ZvXPgSfjvv0MvZm7lEvqe
	 qY8xBitSbm/QrB/qZEFJ/90cFp47jP/BlGGk3Dm5phmWd4ILGHVVXXr1DMvsBuSVSz
	 Bg2h3uqjx9mNSYQuzuZnKfjgYODGhjIzdjidfWbN7lWPNAKYGlfVgSmZ+FKOFh7egF
	 NkaqxTZwMZRreKSYe816cQpZk94rLwBrF9NF2B7EDy4Qy6Ky/1YNqlSfTj/ReBPn2b
	 bFm2sz/zFdiMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE0B40CA1;
	Mon, 30 Mar 2026 19:51:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 444B1350
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 365924055A
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjMeqdA82kR6 for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 19:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388B84002A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 388B84002A
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:51:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94DCD7FDFF; Mon, 30 Mar 2026 19:51:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Mar 2026 21:48:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d421a5d278790f01033266fe45bdd26e10ee23b7
X-Git-Newrev: fc6377f7f949ac23d38fb58c2c4a2f27bba73b1f
X-Patchwork-Hint: ignore
Message-Id: <20260330195143.94DCD7FDFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20260130
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc6377f7f949ac23d38fb58c2c4a2f27bba73b1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For changelog, see [1].

Also, kirk removed update the "--framework ltp" option in [1]
and "--sut host" in [2]. This commit updates the test_ltp_testsuite
runtime test to remove those options to reflect those changes.

[1] https://github.com/linux-test-project/ltp/releases/tag/20260130
[2] https://github.com/linux-test-project/kirk/commit/818abbb90e14454e94675da3757ff7fdafaa26af
[3] https://github.com/linux-test-project/kirk/commit/d2761ce865405c4abcdd5e3919ca96721fb6178f

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien:
 - add link to changelog
 - update test_ltp_testsuite.py
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ltp-testsuite/ltp-testsuite.hash            | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk              | 2 +-
 support/testing/tests/package/test_ltp_testsuite.py | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index b96e1f46fa..e1861ae4e4 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20250930/ltp-full-20250930.tar.xz.sha256
-sha256  048fa4d69ddbe8a94aa15da9bdc85713ab07a0abbc3de2b8bdd9757644aef1e4  ltp-full-20250930.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20260130/ltp-full-20260130.tar.xz.sha256
+sha256  5effc9d3eb3f5cd45d47e8ac3d78f59cb8f3f73c8598a2f182ef5b40ddfff311  ltp-full-20260130.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 12db8f2d3b..2e4767b1a5 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20250930
+LTP_TESTSUITE_VERSION = 20260130
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
index 6ff59b9700..58e3af19ed 100644
--- a/support/testing/tests/package/test_ltp_testsuite.py
+++ b/support/testing/tests/package/test_ltp_testsuite.py
@@ -30,8 +30,6 @@ class TestLtpTestsuite(infra.basetest.BRTest):
         # fast execution. See "kirk --help" for option details.
         cmd = f"LTPROOT={ltp_root}"
         cmd += f" {ltp_root}/kirk"
-        cmd += " --sut host"
-        cmd += " --framework ltp"
         cmd += " --run-suite syscalls"
         cmd += " --run-pattern '^read0[0-9]*'"
         cmd += f" --json-report {report_file}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
