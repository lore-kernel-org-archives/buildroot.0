Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD47C83F34
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 18:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E1460AC9;
	Fri, 18 Jul 2025 18:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nG49Z6_WBXpa; Fri, 18 Jul 2025 18:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7865360844
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7865360844;
	Fri, 18 Jul 2025 18:35:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC641A6
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 18:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 537B860844
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 18:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yK3znzyAZ6CV for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 18:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0527B60773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0527B60773
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0527B60773
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 18:35:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id cpvjuwaxUzKH1cpvjuJFtC; Fri, 18 Jul 2025 20:35:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 18 Jul 2025 20:35:34 +0200
Message-Id: <20250718183534.1973124-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIkI0hpTrqVMctzQTo/19UFcZGMivkOi48wSuFMc+oB29dFiCoZkKPsWLWE9YZxgv14yCM0on6u5ExN1Ol9KI9BDbGULmakEZ+1CDM0nKEwOYqSjKsGD
 9Kn1SmQ5phxVn8FVwFar2Uw+wR/qZdXDI6eEYWnoWkPfWaZ+eOFpidR8eHVRVB5rl3v2FoVqaCOtvHNZIUdutfdQBVcBXpC4zMNbEYHA5GYCBnChc8fEXmS1
 lS4Er0UA4BbFn7DvFlbLM+EuF9MPnkMlfbtChkL4ris=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1752863735; bh=2ywqjtvq6FreNMlTC/HyL9Uw/Hr7HrvgmHmre0GAx8E=;
 h=From:To:Subject:Date:MIME-Version;
 b=l8efQ0eoxmSu/8dfS9Xfvx5AptBmdVknn7J3SF6otq1qnwdSkkpsNcQnFzqDEiOPU
 GWtSGGZjLGap6GoAXR7p+S+W9o0z3yS0xyBuwtx7N4j7B3O/lPuNSmo86G1c+Ps70k
 WCC6qxYKwdI/lwcN1gzEJC6iN2Yk0b3VsEW16g8SFPObcqt9htTEcAlMuLXZ5SH0Ma
 UGdPS4khjYHjoEkMrDmVM0FquCBxUja+WdvO62QdjPpRto9mAbKBQOpZtKCA/yTpHa
 XnvTdLUlLgkEpX1tKJd5sc+MAfDqYW0cjv3e+11iMke5RafeGawUwcOaxKU/StnUuE
 Jj8gJnJFstA9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=l8efQ0eo
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2025-07-18
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

This version builds up to Linux 6.15.
URL has moved to github benetti-engineering-sas to let's modify
accordingly.

Fixes:
still not occured

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash    | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index b8f96ae1b3..0b5dc9c2f8 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce73be1fb5f5d24f0e66516623db0b51c45adb30d845bfa8cb78aed9b6d8913f  sunxi-mali-utgard-driver-9926236a20904ecfca68f3365657c11f92695546.tar.gz
+sha256  b0cf26625db13989be54844d3625e6918bee6d4ae6d054da161a2bf9e3665532  sunxi-mali-utgard-driver-b47f74c92fbcbdf175a16052d1b0ce8345efc6b2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 9c68285256..ea3bc258a6 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = 9926236a20904ecfca68f3365657c11f92695546
-SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_VERSION = b47f74c92fbcbdf175a16052d1b0ce8345efc6b2
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,benetti-engineering-sas,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
 SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
