Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A3BCFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 11:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32FB240328;
	Sun,  6 Oct 2024 11:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aP6f4VTdFH3T; Sun,  6 Oct 2024 11:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE2140120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAE2140120;
	Sun,  6 Oct 2024 11:11:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE14F1BF40A
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 11:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE15A40120
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 11:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fra70ZxzFYCi for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 11:11:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A87FE40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87FE40022
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A87FE40022
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 11:11:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8580DB0053D;
 Sun,  6 Oct 2024 13:11:45 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 13:11:40 +0200
Message-ID: <20241006111140.1500225-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728213106;
 bh=pOzMHr706Y/FtIqThewC7GKNZMNCYj/CS99+Xlgg69Q=;
 h=From:To:Cc:Subject:Date:From;
 b=MT89L2UcF5RbnJog6w+k4K5b527hkewUctl3a9FVkI+EKTzXkJ8hxJ2VBwepyEjW+
 k+VTKtg/+USNaMLTAoVk1QExjVk2YqDooqVpv46uCUUHZ90UnR+IC1mVybt8/zFmlG
 MEEndQn8YtP+g9XJuawJWfiPTb05o9qt7Xc5t7jJ0ZCIGCYlbfTqeXMMgyPZb/Iu6n
 aQO6s0ud98c/E1jB7PLByP7uLd7/wEJ2ogn0eeLl25LKbFquadcIhLnkSUDRMOh9yp
 ngTBC1DDoNGg8z81hsRZk78LKtwrg7sPR84ReZQp6E6vbpQaQm7aSLzQL8NkA04K4h
 AJEYX3MGmx+9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MT89L2Uc
Subject: [Buildroot] [PATCH 1/1] package/perftest: bump to version
 24.07.0-0.44
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

For change log since 24.04.0-0.41, see:
https://github.com/linux-rdma/perftest/releases/tag/24.07.0-0.44

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8004128022
---
 package/perftest/perftest.hash | 2 +-
 package/perftest/perftest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
index f40d1d1e96..496ced9a61 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d398cb7a364735485b5ae033b242d7cf0bedcdb5f4d512e54b18c9a3e7a98b87  perftest-24.04.0-0.41.tar.gz
+sha256  3e62774a4b098ad91aa13353333ad221cf541d280dc9ba94db50270d4bb5b84a  perftest-24.07.0-0.44.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 36cb775254..12d5c1fdba 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 24.04.0-0.41
+PERFTEST_VERSION = 24.07.0-0.44
 PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
