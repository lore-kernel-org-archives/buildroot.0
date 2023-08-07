Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03695EC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B3C81337;
	Thu,  7 Sep 2023 15:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B3C81337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKIV7SFIsT5f; Thu,  7 Sep 2023 15:16:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C5283B05;
	Thu,  7 Sep 2023 15:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6C5283B05
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13ABB1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AECC841DA3
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECC841DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oO6gWzN1L_0O for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C200F41D77
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C200F41D77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B129886A1F; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:26:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b66dc042f5f5861375a91a6363920f9aea32fa43
X-Git-Newrev: 14956518c8ac9d5eba24f76de5a916a7624ce6f1
X-Patchwork-Hint: ignore
Message-Id: <20230907145127.B129886A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6serialbus: use the
 CMAKE_NINJA flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=14956518c8ac9d5eba24f76de5a916a7624ce6f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
to specify what cmake backend to use, instead of special-coding it's use.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6serialbus/qt6serialbus.mk | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/qt6/qt6serialbus/qt6serialbus.mk b/package/qt6/qt6serialbus/qt6serialbus.mk
index 0717736387..631531e14f 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.mk
+++ b/package/qt6/qt6serialbus/qt6serialbus.mk
@@ -10,6 +10,8 @@ QT6SERIALBUS_SOURCE = qtserialbus-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALBUS_VE
 QT6SERIALBUS_INSTALL_STAGING = YES
 QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO
 
+QT6SERIALBUS_CMAKE_BACKEND = ninja
+
 QT6SERIALBUS_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0, GFDL-1.3 no invariants (docs)
@@ -21,7 +23,6 @@ QT6SERIALBUS_LICENSE_FILES = \
 	LICENSES/GFDL-1.3-no-invariants-only.txt
 
 QT6SERIALBUS_CONF_OPTS = \
-	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -30,16 +31,4 @@ QT6SERIALBUS_CONF_OPTS = \
 QT6SERIALBUS_DEPENDENCIES = \
 	qt6serialport
 
-define QT6SERIALBUS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALBUS_BUILDDIR)
-endef
-
-define QT6SERIALBUS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR)
-endef
-
-define QT6SERIALBUS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
