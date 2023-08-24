Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B9EC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA5283C35;
	Thu,  7 Sep 2023 15:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA5283C35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8B4B99407Mdk; Thu,  7 Sep 2023 15:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A9AD83BC2;
	Thu,  7 Sep 2023 15:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A9AD83BC2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA931BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D06F41E03
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D06F41E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MeskYq7U34X for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B95D141E36
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B95D141E36
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A963886A21; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:14:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46f1cd6fe3b6a0f066e6217dec19ea8eb96d3923
X-Git-Newrev: 6ca42939d6debc645fbfb431b99ace4b93b5cc0d
X-Patchwork-Hint: ignore
Message-Id: <20230907145132.A963886A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: enable for qt6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ca42939d6debc645fbfb431b99ace4b93b5cc0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quazip/Config.in |  3 ++-
 package/quazip/quazip.mk | 12 +++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index bba5eddf3d..4c7a187571 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_QUAZIP
 	bool "quazip"
-	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
+	select BR2_PACKAGE_QT6CORE5COMPAT if BR2_PACKAGE_QT6
 	help
 	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
 	  ZIP/UNZIP package that can be used to access ZIP
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index bf3b844624..665058d890 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -7,9 +7,15 @@
 QUAZIP_VERSION = 1.4
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
-QUAZIP_DEPENDENCIES = \
-	zlib \
-	qt5base
+QUAZIP_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+QUAZIP_DEPENDENCIES +=  qt5base
+endif
+ifeq ($(BR2_PACKAGE_QT6BASE),y)
+QUAZIP_DEPENDENCIES +=  qt6base qt6core5compat
+endif
+
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 QUAZIP_CPE_ID_VENDOR = quazip_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
