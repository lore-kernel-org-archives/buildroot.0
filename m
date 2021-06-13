Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67D6C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F8A960F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F8A960F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 080FD40592;
	Tue,  3 Aug 2021 21:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCepfdGeblCd; Tue,  3 Aug 2021 21:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB794059A;
	Tue,  3 Aug 2021 21:46:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 415AB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E15940261
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nuI-KLlNiNZj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A723540235
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F22A3843F5; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 18:34:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b7a5b9d06d484700fc4fcbd354f2c15e0422688c
X-Git-Newrev: dc97260606d41fed2d1f8effc09cff7352440395
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.F22A3843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ltp-testsuite: bump
 version to 20210524
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc97260606d41fed2d1f8effc09cff7352440395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add locally computed sha256 (+ keep sha1 from github checksum file).

sysinfo.h fix patch is still needed (until Buildroot MUSL toolchain gets
updated).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ltp-testsuite/ltp-testsuite.hash | 5 +++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index f0b2c89704..ed2a50cd4f 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,5 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20210121/ltp-full-20210121.tar.xz.sha1
-sha1 ac9c1c711aed4319c5fbd0b665d36f75236a4ec2  ltp-full-20210121.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20210524/ltp-full-20210524.tar.xz.sha1
+sha1 08d84f8ac3ba0c800f3070768c651703869105d7  ltp-full-20210524.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  831678c64b85a8c24957c71632752537b2266890f2d2f352da9ed0ec45458189  ltp-full-20210524.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 978d01b7a6..badd161d5a 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20210121
+LTP_TESTSUITE_VERSION = 20210524
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
