Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DD7C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 07:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 812BA40A85;
	Tue,  8 Aug 2023 07:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 812BA40A85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUbp1P0znOMQ; Tue,  8 Aug 2023 07:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B311540AA2;
	Tue,  8 Aug 2023 07:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B311540AA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 399421BF82F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1389F610A9
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1389F610A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GColFHp7NJ65 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 07:45:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E16B610A8
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E16B610A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BE4B848DF; Tue,  8 Aug 2023 07:45:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 09:45:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5582d4b5ebc57e6ecf71193ca62bc69e8038aad2
X-Git-Newrev: ccc49c16bc457878f7d750f6fa8d7d0f102e7a9d
X-Patchwork-Hint: ignore
Message-Id: <20230808074554.3BE4B848DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6svg: use the
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccc49c16bc457878f7d750f6fa8d7d0f102e7a9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
to specify what cmake backend to use, instead of special-coding it's use.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6svg/qt6svg.mk | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index be0addbd0d..25e87dd208 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -10,6 +10,8 @@ QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
 QT6SVG_INSTALL_STAGING = YES
 QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 
+QT6SVG_CMAKE_BACKEND = ninja
+
 QT6SVG_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \
@@ -25,7 +27,6 @@ QT6SVG_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6SVG_CONF_OPTS = \
-	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -33,19 +34,6 @@ QT6SVG_CONF_OPTS = \
 
 QT6SVG_DEPENDENCIES = \
 	host-pkgconf \
-	host-ninja \
 	qt6base
 
-define QT6SVG_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SVG_BUILDDIR)
-endef
-
-define QT6SVG_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
-endef
-
-define QT6SVG_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
