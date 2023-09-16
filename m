Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD5DC2BA15
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 17:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E2141721;
	Sat, 16 Sep 2023 17:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E2141721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F20xB5e5M4XX; Sat, 16 Sep 2023 17:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA5F741726;
	Sat, 16 Sep 2023 17:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA5F741726
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 601811BF42D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 17:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3976160BF1
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 17:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3976160BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUn-zWJkdK1v for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 17:48:50 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00F3760598
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 17:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00F3760598
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BF82513F89A;
 Sat, 16 Sep 2023 19:48:45 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 19:48:38 +0200
Message-ID: <20230916174838.3537042-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694886527;
 bh=T9RvlaVE36Eb+fdf+aBJO4rfFUqAZubHlqmq10/tNXM=;
 h=From:To:Cc:Subject:Date:From;
 b=fQULsWcL0i9N3KPqmbMg5so41le6BB+D6P2TfwWIiywmefI3kzkqU70SVEc/QM1Gt
 rtOIYhXik0qMhf5MUOBR+xoHTsh4/6+9ABkqmRLCBlLvjXGBp6rcBaOfRtEpB10Q2w
 +o7LaaNJi3zgXus4Ggr2+3iftiDpcYR3lNVRz5sh8uR/X8bZBXEFY8yODFj3bXROE9
 6WCbpGUDMNLd7aCFuZK8bXsmbxkGVsBPbfUIEJzv59jMavbRBGTFvGwlAaSe2lhoIt
 ahfAnn5lqpEnmR7yWSjzVjvd7IUjbJXrCtNaYSSTxWEMjv+IYzW2dFvO7FNtInQP4P
 ZWaUyGNtElSaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fQULsWcL
Subject: [Buildroot] [PATCH 1/1] package/tcl: bump to version 8.6.13
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

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.13/tcltk-release-notes-8.6.13.txt

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 9584c80 with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p tcl
    ...
    45 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/tcl/tcl.hash | 2 +-
 package/tcl/tcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 2b82a1938b..109ea3d79c 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  26c995dd0f167e48b11961d891ee555f680c175f7173ff8cb829f4ebcde4c1a6  tcl8.6.12-src.tar.gz
+sha256  43a1fae7412f61ff11de2cfd05d28cfc3a73762f354a417c62370a54e2caf066  tcl8.6.13-src.tar.gz
 sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 97754b63d0..843d58a4ae 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).12
+TCL_VERSION = $(TCL_VERSION_MAJOR).13
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
