Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBFBD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 22:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DB781F1A;
	Sun,  7 Dec 2025 22:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQCQq3muPWYK; Sun,  7 Dec 2025 22:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1430181F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765145623;
	bh=dx8QdlbTu7OHARJEhXsno9Xt0u0kiAcE7V7X0pNCKpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g9BFEAtaIRwIRfRCuBjDlMb+bWMctgbHLz0LELnNtPS7bTAPy2hB5ClxKpyuAwSZd
	 IqJsil8WVR4mXrzauT/1YtVoocu5b9Yh1LQCwgyoSgAq1fdcyyLKH49TTKc1lLQyGR
	 V9+gppwTnqCxUscUmy0lMr56pgeLX0zaHH0ET4GwU5DOrhvC5WjGjDaTlkOwCTv9mm
	 VeyooiUxNp2LKlHZS1T/gpnuNErU0cCJPx/3MxiRnWQvSO21MZ2IEtOrOFPzSQl601
	 xK9fV799GYitlYKfEr60TIWsf7o4Dwe55/G0tLWNzC+zENYK6dAEKDOTPRKPZc1OOD
	 kRTwZXjDuG9pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1430181F36;
	Sun,  7 Dec 2025 22:13:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA7352CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACA784079C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bCmPijg6Boy for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 22:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F205540701
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F205540701
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:13:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF3B868B4; Sun,  7 Dec 2025 22:13:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 22:53:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: def104dd90952e9f80fb0f3c161d5641a0d168eb
X-Git-Newrev: 050b663f4c52ec56b2f26ec4f1a379dea3b20d8f
X-Patchwork-Hint: ignore
Message-Id: <20251207221340.DDF3B868B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnss: bump version
 to 3.119
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

commit: https://git.buildroot.net/buildroot/commit/?id=050b663f4c52ec56b2f26ec4f1a379dea3b20d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119.rst

NOTE: libnss 3.119 require libnspr 4.38.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: rebase on branch next]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d4824bc81d..1b15364a93 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_118_1_RTM/src/SHA256SUMS
-sha256  8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3  nss-3.118.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
+sha256  e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9  nss-3.119.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index dee668118b..4a9386d3a5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.118.1
+LIBNSS_VERSION = 3.119
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
