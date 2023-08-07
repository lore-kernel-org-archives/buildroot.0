Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2345FC001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C387A403F5;
	Mon,  7 Aug 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C387A403F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kN_1LLXwDdqK; Mon,  7 Aug 2023 21:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE2C402BD;
	Mon,  7 Aug 2023 21:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE2C402BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA3601BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9172381E9C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9172381E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5qJzfzbY5ke for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:26:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4F4181E6B
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F4181E6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C23B784755; Mon,  7 Aug 2023 21:26:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:26:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c64a3e9767757f6bab0ecf2df35871508003f39e
X-Git-Newrev: b66dc042f5f5861375a91a6363920f9aea32fa43
X-Patchwork-Hint: ignore
Message-Id: <20230807212644.C23B784755@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6serialport: use
 the CMAKE_NINJA flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=b66dc042f5f5861375a91a6363920f9aea32fa43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
to specify what cmake backend to use, instead of special-coding it's use.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6serialport/qt6serialport.mk | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index 497719d4ec..bdb16dd892 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -10,6 +10,8 @@ QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT
 QT6SERIALPORT_INSTALL_STAGING = YES
 QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
 
+QT6SERIALPORT_CMAKE_BACKEND = ninja
+
 QT6SERIALPORT_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \
@@ -25,7 +27,6 @@ QT6SERIALPORT_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6SERIALPORT_CONF_OPTS = \
-	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -33,19 +34,6 @@ QT6SERIALPORT_CONF_OPTS = \
 
 QT6SERIALPORT_DEPENDENCIES = \
 	host-pkgconf \
-	host-ninja \
 	qt6base
 
-define QT6SERIALPORT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALPORT_BUILDDIR)
-endef
-
-define QT6SERIALPORT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
-endef
-
-define QT6SERIALPORT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
