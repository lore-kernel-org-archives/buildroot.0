Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBE8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F0176105A
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F0176105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2994F608B3;
	Mon, 25 Oct 2021 22:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qiBVmcCxQoh; Mon, 25 Oct 2021 22:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7811C608C8;
	Mon, 25 Oct 2021 22:44:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C19861BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1ECD80CFB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tru03y-imHDH for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:44:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B27DC80CF5
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=5sSTEWPRL+5FtELzLWZu3oZ64MxqrdB2zmK1thT65qI=; 
 b=MD3XJ4+n7J57MJrvz8LPJPRWZ7yj7+lpVxAGb1I+2HcSnij75JAozJgWMGEHsEbmRBTMf+HFXYTYG7jTD8FW2zDGezJ8doCLyDEKgk5njVEJts/dpNCFkiaGIezsEZbgFtFbGUDx/MA2jPBJAn4cFqi9Rgx6XWkkz0olBCOZEMXlj76lpomaNj4Ubepqfqry6O3BmFNPpVU2DRivJ+aB/WMIJPxRpnmcQSXeFiciSqmxWSzpd+siBC8SgmH1/jLcieslMMvhJaXarroiT6plUPldlE1iqhT3+7JjxIpj+pPyac0qlzJtklcmFWLzuAOM++wbpxbsK8s958t4litAJA==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mf8ha-00031C-Dp; Tue, 26 Oct 2021 00:44:22 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1bdfb6cc;
 Mon, 25 Oct 2021 22:44:04 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 01:44:01 +0300
Message-Id: <20211025224403.979315-3-aperez@igalia.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224403.979315-1-aperez@igalia.com>
References: <20211025224403.979315-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/wpebackend-fdo: bump to version
 1.12.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Most of the changes from this release were already in 1.10.0, but it
has some Meson build fixes and the new DMA-BUF buffer pool support.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.12.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index f280024b28..06289900b0 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.10.0.tar.xz.sums
-md5  306adbb0c66dc753e1794c83b7a2682b  wpebackend-fdo-1.10.0.tar.xz
-sha1  bf71718a213c6511dea278ade5ce90967d181995  wpebackend-fdo-1.10.0.tar.xz
-sha256  b89dfd3500a4dec711132cd7bff72599e67d56a419d000730e14bb99547509cc  wpebackend-fdo-1.10.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.12.0.tar.xz.sums
+md5  c43b34a4b4933bcd80068ae5776ee346  wpebackend-fdo-1.12.0.tar.xz
+sha1  e2576d564bd6d9a86737a4cd31dd5827ebc00fdf  wpebackend-fdo-1.12.0.tar.xz
+sha256  6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac  wpebackend-fdo-1.12.0.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 72f0ad9019..5fe9c5397f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.10.0
+WPEBACKEND_FDO_VERSION = 1.12.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
