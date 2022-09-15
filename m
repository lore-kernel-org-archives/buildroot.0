Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009D3C32771
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 20:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FC3818C4;
	Thu, 15 Sep 2022 20:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FC3818C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftKkymAg18hu; Thu, 15 Sep 2022 20:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1D9813DE;
	Thu, 15 Sep 2022 20:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A1D9813DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA371BF314
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 20:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7593F41949
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 20:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7593F41949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wQgfNtjBAXp for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 20:48:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF20541947
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF20541947
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 20:48:45 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.86.190])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7A952B0053E;
 Thu, 15 Sep 2022 22:48:39 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 22:48:31 +0200
Message-Id: <20220915204831.1547363-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663274922;
 bh=n0U1NllK/gRMuYgKaOfFJrAJRhtvLhe9DTtrkgwMZXo=;
 h=From:To:Cc:Subject:Date:From;
 b=qyyH3Jzzx5DjBs91+7lFHJXLEvguhYhIFbUEwYMKAb1UopakGnJkhg7Ul65J+WxOa
 m6kMPqpYX3pB0Jvp4HnsZNQj3w7vpz1Z9fGo8Kg/6NGH+LhvIMFm+8zRxtu5sFCnxv
 UnEpFaAoV5KPgLscImumDDrqM5sSiDhYrC2MJi74j8XYHmldyJk5SIKA/QTLI8LH/7
 RtxmE+YjGcDdoZCJ3+BWy3VdC99dwZDcYLYApAOx/O6nd9LKjSx0gCDnP7OwtocWLc
 o1nfI8hXaIrS0VwcpnAS2zNObDFNvVvfmLd6Bt1EvRt9MpcoUlgmdocSiOCknZYjTo
 b7zfAuzA/f6CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qyyH3Jzz
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 2.8.0
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
Cc: Steven Noonan <steven@uplinklabs.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit also adds the md5 and sha1 hashes published on the project
download page.

For change log, see:
- https://github.com/open-mpi/hwloc/blob/hwloc-2.8.0/NEWS#L20

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hwloc/hwloc.hash | 6 ++++--
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index ca77e3301c..b146472195 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,4 +1,6 @@
-# From https://www.open-mpi.org/software/hwloc/v2.7/
-sha256  028cee53ebcfe048283a2b3e87f2fa742c83645fc3ae329134bf5bb8b90384e0  hwloc-2.7.0.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.8/
+md5  1d40ecdded67bbe4bafc8f8e8479376c  hwloc-2.8.0.tar.bz2
+sha1  314faaeda9f1982da97fca93b83307bc34d5b414  hwloc-2.8.0.tar.bz2
+sha256  348a72fcd48c32a823ee1da149ae992203e7ad033549e64aed6ea6eeb01f42c1  hwloc-2.8.0.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 04543a7e64..3f73b3ecc8 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.7
+HWLOC_VERSION_MAJOR = 2.8
 HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
