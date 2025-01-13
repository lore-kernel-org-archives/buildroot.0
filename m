Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2451CE7719E
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 10:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C061560688;
	Mon, 13 Jan 2025 10:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1VkDGr7FDuV; Mon, 13 Jan 2025 10:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAB5606D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBAB5606D6;
	Mon, 13 Jan 2025 10:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C384195D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A28EF40131
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzUTqp5bllwX for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 10:25:43 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.15;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE6E340129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE6E340129
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE6E340129
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:25:43 +0000 (UTC)
X-CSE-ConnectionGUID: Eg9g30zmSXWCHpzS3AGO3w==
X-CSE-MsgGUID: TkWzGZbxT8qjv8vZt2cxjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="40698503"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40698503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 02:25:43 -0800
X-CSE-ConnectionGUID: T/5mGykjQKW1xJuo+p2oyQ==
X-CSE-MsgGUID: /VXFRSTmRpm49IYZRGGY4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141722843"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP; 13 Jan 2025 02:25:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id EFCB9329; Mon, 13 Jan 2025 12:25:40 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Mon, 13 Jan 2025 12:25:40 +0200
Message-ID: <20250113102540.1940023-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736763944; x=1768299944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yqjZetdwFxAogGYLcqtgiEZpvnMJxedcaIDKwijJSwA=;
 b=R5PdTXHpw4uyuAfejRg05SIIjDuuxZfx9MxVp0u2cAr8fT5PrIO5qe3X
 WHLAJ1yS4jmOo/FTTovV9Go3uTdOsWw3mYit5dVAkPHUGnXaCbp2GJ2n5
 zNbSyKvIeyn7j/DBDeWnu1+3KH6Aj9bd9gW5Tmw6lUVUERiAugK3Kn4/n
 AXuLvFcBbl9wuCBvE20T4mSTqQuS7LZF0tm8DdDKHxQgKS9paycf8Cv3r
 PgvY6ZmjGVlNKvAEdJsbYwwgNRVd0WLEJX8efCkfxTwqUR9m3ozyGtjUZ
 /fyXrB3ScB0ciICWuq30IfaPQFp/X7WgJ461uI5+2bL3oCsHHYiHcJpwy
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R5PdTXHp
Subject: [Buildroot] [PATCH] package/tbtools: bump to version 0.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest release of tbtools.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 25879c2780..58793dee0c 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6ec94630bc4e1afec1342cfd635d1c7da7d82f6c5f00adac61d164505c2a0717  tbtools-0.4.2-cargo2.tar.gz
+sha256  377d2fab96cf78d24dfd1b16b737afb4e47f0b712e13abb7ac1443fc2aa0931a  tbtools-0.5.0-cargo2.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 13b2ee65f9..1200e1c669 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.4.2
+TBTOOLS_VERSION = 0.5.0
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
