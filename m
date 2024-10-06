Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A0FCFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 14:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CB5260745;
	Sun,  6 Oct 2024 14:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrXOlnKELDSA; Sun,  6 Oct 2024 14:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D02056073C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D02056073C;
	Sun,  6 Oct 2024 14:44:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18E311BF59B
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 127B36073C
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZdHmom2jqTy for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 14:44:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6321160729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6321160729
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6321160729
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 14:44:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A6D2DB00535;
 Sun,  6 Oct 2024 16:44:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 16:44:29 +0200
Message-ID: <20241006144429.538674-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728225876;
 bh=SGrvizl2hJb3RQF6vYDng3eCPjLNG/pqMSyBnlWQ1Sk=;
 h=From:To:Cc:Subject:Date:From;
 b=CclXZM6nLnH9MON1IUg4ha+Ub6NZxumsX1Dh720Qeq/yej0ZIRW+s5v8VRhVK+0Rw
 qvLhztfeZtRcgFQd/V8FVOzj+GNe8jZZo7fJooASeSF8r5XkYHvpoTn/jQznLsTzyb
 L+TGP0fl2k0AmrHJAc54vbc8k9Zs++VJixm2BvJc7C84l+Ou+VybtZzIZOb+2E0pPe
 /YiOoWTJ2q3Z9amPaGrJlSwhc9l1qnEOgcLQNaeOxmKy8NzabcxphlNOs9Ml43dsl1
 U/q1xHKZSspKkn2k9TFmRHj6UkGWdO6YSmpQqxnnqGnlYym/GuHsP4mGoS6Grm75p8
 X8MrJUCaF6ERw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CclXZM6n
Subject: [Buildroot] [PATCH 1/1] package/tk: bump to version 8.6.15
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.15/tcltk-release-notes-8.6.15.txt

Note: commit 1af4eae90 "package/tcl: bump version to 8.6.15" updated
the tcl package. This commit updates the tk package, which is released
alongside tcl.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tk/tk.hash | 2 +-
 package/tk/tk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tk/tk.hash b/package/tk/tk.hash
index aee03a152e..77195582cf 100644
--- a/package/tk/tk.hash
+++ b/package/tk/tk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ffdb720f47a6ca6107eac2dd877e30b0ef7fac14f3a84ebbd0b3612cee41a94  tk8.6.14-src.tar.gz
+sha256  550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec  tk8.6.15-src.tar.gz
 sha256  2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
diff --git a/package/tk/tk.mk b/package/tk/tk.mk
index c8dd7bc32c..3efabd5ec4 100644
--- a/package/tk/tk.mk
+++ b/package/tk/tk.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TK_VERSION_MAJOR = 8.6
-TK_VERSION = $(TK_VERSION_MAJOR).14
+TK_VERSION = $(TK_VERSION_MAJOR).15
 TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
 TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
 TK_LICENSE = TCL
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
