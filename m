Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038E3CD37B7
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 09:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFC0408EC;
	Sat, 16 Sep 2023 09:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFC0408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ix9rwiBjWrQ1; Sat, 16 Sep 2023 09:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEF2A405ED;
	Sat, 16 Sep 2023 09:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEF2A405ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 019BD1BF574
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 09:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCDDC606F2
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 09:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCDDC606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRVnbPYOqJfn for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 09:25:47 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3645605EC
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 09:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3645605EC
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id D3E0124002A
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 11:18:31 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Rnlpv36Rjz9rxM;
 Sat, 16 Sep 2023 11:18:31 +0200 (CEST)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 09:18:30 +0000
Message-ID: <20230916091831.13118-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.net; s=2017; 
 t=1694855911; bh=5z4LPkfrUYNdMMNZY2OuKc1qGLd5y2/8oWEjqZ9jLWU=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=PN9jx8gyn88BtFDJlqdtQIQiD6+KIJXvgLaox+ezYQL/9DnfMWZw9hrDt0qZq9MiT
 wSPsYCcDFlzYjFCM5KyY4lE+H/ZP0lnsODI5Jf4wp8ILWoyVv8Yv5PUerVINvxAuGF
 K5LFABOpIkDuEs2ViBKxfHop0jaCG09NRDcfFS5Bis8bjYb24URAb1guNB8WGqOI+3
 wwx33FAgSeOuSw9EFY0B2RDDEN4muCo9uKrZr4spBhZIvhO/rbACy17BidAwBcXbz0
 iN+EWEwL+cTtFqC9BF2/3X4feg/gXWfJR3mDSsSNzyFExele00r3eJ+Elhh4oUVdzt
 ULAkqojP7hACQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net
 header.a=rsa-sha256 header.s=2017 header.b=PN9jx8gy
Subject: [Buildroot] [PATCH 1/2] package/multipath-tools: bump version to
 0.9.6
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/multipath-tools/Config.in            | 3 +++
 package/multipath-tools/multipath-tools.hash | 2 +-
 package/multipath-tools/multipath-tools.mk   | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
index 222f78b86ce6..4c648a6abb34 100644
--- a/package/multipath-tools/Config.in
+++ b/package/multipath-tools/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_MULTIPATH_TOOLS
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	help
 	  This package provides the following binaries to drive
 	  the Device Mapper multipathing driver:
diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index ecaad05e25ad..158f0faa960e 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6ed3cf6e786da20a451d9747cbd4c5817815388b8fc8022d1074b3018479031d  multipath-tools-0.9.4.tar.gz
+sha256  401c6f6e8dc5d3feaaee76280716aee718579ac024ce4f2fae77c798dc7a0f9f  multipath-tools-0.9.6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 23b3cc944267..d9d0f959943d 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.9.4
+MULTIPATH_TOOLS_VERSION = 0.9.6
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
@@ -20,7 +20,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 	README.md
 MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
 
-MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
+MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf util-linux-libs
 MULTIPATH_TOOLS_MAKE_OPTS = \
 	kernel_incdir=$(STAGING_DIR)/usr/include \
 	LIB="lib" \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
