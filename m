Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BF5CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A52860F15;
	Fri,  5 Jun 2026 12:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8KcJ7BFHHsw; Fri,  5 Jun 2026 12:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7027860792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663262;
	bh=sID0KqAms31iwEEobX1z8c8b0jezOEo4/96Q75M2TQA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o69KsDOvQ1kLd1ctlNC9hnsXu/eRNyUQqFqjVe1EYE+nqITKHjClYWIqPYFmWigAL
	 oTtQA7t7Q8fEtN2n/K3YRHAFyE45GngxbPvGDGmX5ed2rO8IJ5tIQ3hbdTJ3FEr2Vb
	 9biivWzyIHUcCkmGPaJFpz8lScdEqJSQBWrmnkF09/IxPOHSu8SgxcgtzztzUWer+l
	 UEoX5hfj0l3ujS8KN6xtYpe5X1u7WdoDPIb+KKrg4blCqz2qH1DpKHsAVJituhsvjc
	 yjKH4pZAql2PJugDV0kuOhiBtcYt0bSyfsFqqxdGhb5v0tTrOCiIu4DKxkDune1kLN
	 7wtbxJGq4p+QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7027860792;
	Fri,  5 Jun 2026 12:41:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1237C3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B4D641065
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iodiVDpi3njz for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 154954103D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 154954103D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E38B87B3C; Fri,  5 Jun 2026 12:38:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:29:57 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 21e66bceace780a63f3f360aa07f5c7d86cb8d34
X-Git-Newrev: 3fbf04200d5b0c1d3cc2f9159752eb9481bf6fc4
X-Patchwork-Hint: ignore
Message-Id: <20260605123840.3E38B87B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libheif: security
 bump version to 1.23.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3fbf04200d5b0c1d3cc2f9159752eb9481bf6fc4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/strukturag/libheif/releases/tag/v1.23.0
https://github.com/strukturag/libheif/security/advisories/GHSA-jvmp-j3cw-84mh

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a72da6d7f5bba1113d5b6962498f2f8540ac31fa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 22697f307c..780059facf 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.22.2
-sha256  eea48e4841f83fbe51d029337ffd2d14512d0203015dad40b90213d872958af3  libheif-1.22.2.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.0
+sha256  4c9182b18897617182eed12ab5eb9f9d855b3aa3a736d6bdb31abc034ec7d393  libheif-1.23.0.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 4b23f1fda3..be97b18bd0 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.22.2
+LIBHEIF_VERSION = 1.23.0
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
