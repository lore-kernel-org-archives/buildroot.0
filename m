Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0222C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB4A409FE;
	Fri, 10 Jul 2026 16:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqOhpMFBD3l5; Fri, 10 Jul 2026 16:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E185D409FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701856;
	bh=YDF2QnbzEKiIUAojnuksR+1MQHPIKvqmM4g27G8pLWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IW+HJrHIYopyvSMJxqt8POI20hOX71qXLAz+Wf7lvm+8/xqymlWmxfWE9CbvhBcdb
	 xj5NNjv+CGXfBX1fODeO9AstZkexbtv353o2cpUcy757ghDeEzZCwz7goNddfrFqX0
	 I5aBwZhhGrNaDvAQVvpVd2Ba4r+hme8vK7unHjI+uUGWMOq1VVdVJWGgbZoclchVpp
	 z6jm1eW4QCu6iyuWOOJBM0faNKM/dwu8AdTQd0xXOH577uaNXMl4bMs/pHqB4E0G2P
	 ZtliHTdgWT8zyIGkwP258QtHtPWrB+yLzG2rNrHwd6VWyUGEp6gq1Z6wKHLiJIh7kM
	 EJNRDLFYNi0TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E185D409FF;
	Fri, 10 Jul 2026 16:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3281BFD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24AE8606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hmza2iBzbCmb for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD476069A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBD476069A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0609886A5; Fri, 10 Jul 2026 16:43:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:42:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f469f24cbd947e1094483dde9038b82c9549d9c
X-Git-Newrev: 4c2b9973818852bafc12526c80608cf2a22084bc
X-Patchwork-Hint: ignore
Message-Id: <20260710164336.E0609886A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c2b9973818852bafc12526c80608cf2a22084bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 6fbe8689ea..99764cef98 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e10b1565f45fd2052c9704639bb6144fc56b21979039f3b44151dfe5b281e18  intel-media-26.2.3.tar.gz
+sha256  a23185fca05c8fa8bdec09ea9ee8a20361163c87035ec978de4e2bb048a55534  intel-media-26.2.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index a197c2a6de..6c77ef83a7 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.3
+INTEL_MEDIADRIVER_VERSION = 26.2.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
