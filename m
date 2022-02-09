Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00573C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A79B8405BC;
	Wed,  9 Feb 2022 21:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ED7D5VuNDVyM; Wed,  9 Feb 2022 21:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AC2A405D1;
	Wed,  9 Feb 2022 21:42:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A37B1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2518360E4F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKnfRQZE_fjU for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C92BA60E46
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CB3038323C; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4bbd6da50488944debba29e195557e5b345f2b1
X-Git-Newrev: f8c3859b6f351aab631e1b3abdb87ce8fa930d3d
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.CB3038323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2c-tools: drop python2 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f8c3859b6f351aab631e1b3abdb87ce8fa930d3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/i2c-tools/i2c-tools.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 7565349f5e..5c9ce26628 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -13,10 +13,6 @@ I2C_TOOLS_CPE_ID_VENDOR = i2c-tools_project
 I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
 I2C_TOOLS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-I2C_TOOLS_DEPENDENCIES += python
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 I2C_TOOLS_DEPENDENCIES += python3
 endif
@@ -31,7 +27,7 @@ endif
 
 # Build/install steps mirror the distutil python package type in the python package
 # infrastructure
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # BASE_ENV taken from PKG_PYTHON_DISTUTILS_ENV in package/pkg-python.mk
 I2C_TOOLS_PYTHON_BASE_ENV = \
 	$(PKG_PYTHON_DISTUTILS_ENV) \
@@ -51,7 +47,7 @@ define I2C_TOOLS_INSTALL_PYSMBUS
 		$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS))
 endef
 
-endif # BR2_PACKAGE_PYTHON
+endif # BR2_PACKAGE_PYTHON3
 
 define I2C_TOOLS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) -C $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
