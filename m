Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38682CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 21:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B953081423;
	Sun, 15 Oct 2023 21:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B953081423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOm19MnvskCZ; Sun, 15 Oct 2023 21:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CDDB81431;
	Sun, 15 Oct 2023 21:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CDDB81431
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5F7E1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D77E401ED
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D77E401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dw1_jC7TksV for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 21:05:50 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6416240136
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 21:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6416240136
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8257BA4C0AF8
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 23:05:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qs8J2-0007Ce-0v
 for buildroot@buildroot.org; Sun, 15 Oct 2023 23:05:48 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 23:05:48 +0200
Message-Id: <20231015210548.36882-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697403948;
 bh=3kBQGo3jhJtmmnoBMIQK+uK62QUTkDt96DtHSXYB5N8=;
 h=From:To:Subject:Date:From;
 b=AnVm3W8vqMUl93ldJdyEUBz1Zw3aZwVrdEx6tytb61onAQEO+sQiyzCIYYfxKEUgo
 uqcsBmOQWLntg4XnJKY9tjYfMo/KWvvS3yw8VkpO6RuoeSHK0cgNggu0h596Gq1asj
 XXWMsjGuAmjD7NHq5EqDyHf74g2RNwgHcFuXe7UPJ2+6kfJJnbacVy+gZPGJ5IqsI/
 19ejNM6KyjkfQiAPYgPe5l8WSxL8j/vn1RVvzW1bl0H4V2f5fpf/Cgc1KJHOrPZTDg
 EaQyYs0l2bc4yj8YsWpqraU+yqNTOwjxyzQM+HzyGxDo06j9Bh0QF/nsLJb/9bD8zb
 ltJL0CEQEzhVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=AnVm3W8v
Subject: [Buildroot] [PATCH 1/1] package/ethtool: switch to git snapshot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream tarball does not include several header files leading to build
errors with older kernels. For details see:
https://patchwork.kernel.org/project/netdevbpf/patch/20231005163053.1800218-1-florian.fainelli@broadcom.com/

Switch _SITE to git snapshot and add _AUTORECONF = YES which needs
host-pkgconf to fix subsequent configure error:

./configure: line 4723: PKG_PROG_PKG_CONFIG: command not found

./configure: line 5055: syntax error near unexpected token `MNL,'
./configure: line 5055: `    PKG_CHECK_MODULES(MNL, libmnl)'

Fixes:
http://autobuild.buildroot.net/results/69e/69e01b7f370920630d132fc43a40104fa5b3959f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ethtool/ethtool.hash | 3 +--
 package/ethtool/ethtool.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 8d2bf58420..812e4dd8d1 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,4 @@
-# From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  814171ea4b8026b081c0741dbbf32e6968311483ecf64711232faec2ac70a14c  ethtool-6.5.tar.xz
 # Locally calculated
+sha256  b1f5fa66f71c3bab9daeacbd77e010b52c47df0a711b216847f78405f3299189  ethtool-6.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 94d14b123b..ee710e0021 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -5,8 +5,11 @@
 ################################################################################
 
 ETHTOOL_VERSION = 6.5
-ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
-ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
+ETHTOOL_SITE = https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/snapshot
+# needed only for autoreconf
+ETHTOOL_DEPENDENCIES = host-pkgconf
+# GIT version, shipped without configure
+ETHTOOL_AUTORECONF = YES
 ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = LICENSE COPYING
 ETHTOOL_CPE_ID_VENDOR = kernel
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
