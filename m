Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93B5C87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 18:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93BF483E1C;
	Fri, 25 Jul 2025 18:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9sgAIcg-ZTn; Fri, 25 Jul 2025 18:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA85C83E14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA85C83E14;
	Fri, 25 Jul 2025 18:46:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB4FF1D9
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 18:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCFAD617AC
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 18:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iro_9K47KXQT for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 18:46:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB60660664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB60660664
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB60660664
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 18:46:16 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id C56CAE00282;
 Fri, 25 Jul 2025 20:46:12 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Fri, 25 Jul 2025 20:46:08 +0200
Message-ID: <20250725184609.3794-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1753469172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lpAAbWt3OcqJSfS6IF+2dRG3TF9i5p7oJzcdEzAEzB0=;
 b=O+wUCERee59ohQn/ZA/F8GqAmqQKugrzvuauSQ1NG5xlwwR3b5KqQXNHUKl4Dh6jMx0BV4
 SYeG/GSw8c+o+QEM41A+2QYwFmo9+pop5RyGDRMwOye8ecorPqevwSx4TpegoBVeWoPiaS
 OrFrc/Pmbwn96+Np47bz59U8VIrkkiY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=O+wUCERe
Subject: [Buildroot] [PATCH 1/1] package/libmbus: switch to git repo
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

www.rscada.se has been offline for a long time, causing build failures.
However, there is an official[1] GitHub repo. This also seems to be
where new releases are happening rather than the old site.

Switch to git for fetching the source code. Unlike the tarball,
the repo only ships partial autotools files (Makefile.in is missing, for
example), so we need to do an autoreconf, which also requires a patch
for modern Automake versions.

[1] https://web.archive.org/web/20250122102111/http://www.rscada.se/libmbus/index.php

Fixes: https://autobuild.buildroot.org/results/11d/11d9e371033f7cdd3b24a9c1feb85b6aa921f96a
Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...with-automake-1.11-and-should-work-w.patch | 28 +++++++++++++++++++
 package/libmbus/libmbus.hash                  |  2 +-
 package/libmbus/libmbus.mk                    |  3 +-
 3 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 package/libmbus/0001-fix-build-error-with-automake-1.11-and-should-work-w.patch

diff --git a/package/libmbus/0001-fix-build-error-with-automake-1.11-and-should-work-w.patch b/package/libmbus/0001-fix-build-error-with-automake-1.11-and-should-work-w.patch
new file mode 100644
index 0000000000..fca78d1fe4
--- /dev/null
+++ b/package/libmbus/0001-fix-build-error-with-automake-1.11-and-should-work-w.patch
@@ -0,0 +1,28 @@
+From 991b26d2de1d91cddf994b724e3e4543d8cf6529 Mon Sep 17 00:00:00 2001
+From: Stefan Wahren <info@lategoodbye.de>
+Date: Thu, 4 Apr 2013 21:20:37 +0200
+Subject: [PATCH] fix build error with automake 1.11 and should work with automake 1.12 too
+
+Upstream: https://github.com/rscada/libmbus/commit/450ac7b9f4b1ddfe128b5334cf1855b0967153a3
+[Florian: Rebased to 0.8.0]
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 461b616..d65df01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,8 @@ AM_INIT_AUTOMAKE([-Wall -Werror foreign])
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AM_PROG_LIBTOOL
++# fix for automake 1.11 & 1.12
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 
+ LDFLAGS="$LDFLAGS -version-info 0:8:0"
+ 
+-- 
+2.50.1
+
diff --git a/package/libmbus/libmbus.hash b/package/libmbus/libmbus.hash
index 493bab5820..f83c8460e0 100644
--- a/package/libmbus/libmbus.hash
+++ b/package/libmbus/libmbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4  libmbus-0.8.0.tar.gz
+sha256  9ae68426ba6ffb2818943741e3afa79448d7328446853added418a101b5ea53e  libmbus-0.8.0.tar.gz
 sha256  ea171a4ae443eca7186f564db2c3cc8b84c1ac343f227f92cd52ec6a948f4a74  COPYING
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 61f797b5b9..4a27700570 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -5,9 +5,10 @@
 ################################################################################
 
 LIBMBUS_VERSION = 0.8.0
-LIBMBUS_SITE = http://www.rscada.se/public-dist
+LIBMBUS_SITE = $(call github,rscada,libmbus,$(LIBMBUS_VERSION))
 LIBMBUS_INSTALL_STAGING = YES
 LIBMBUS_LICENSE = BSD-3-Clause
 LIBMBUS_LICENSE_FILES = COPYING
+LIBMBUS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
