Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F5C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED74E81DFD;
	Mon,  5 Dec 2022 12:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED74E81DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPbuP_fZgOXi; Mon,  5 Dec 2022 12:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D33F81DED;
	Mon,  5 Dec 2022 12:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D33F81DED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7511BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13EE0408E5
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13EE0408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQduzIgWuUK3 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DDD1405B5
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DDD1405B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 682D485B9B; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 22:35:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01fec1b37265fdbd2e89f0217bccd35275e32f98
X-Git-Newrev: d31447bce49e44e5085fb333528fe70772fc01d2
X-Patchwork-Hint: ignore
Message-Id: <20221205112609.682D485B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbredir: bump to version 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d31447bce49e44e5085fb333528fe70772fc01d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usbredirserver was dropped by
https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da2803684776f7659083a530819

Add an option to enable tools (and usbredirect binary) as a replacement
to usbredirserver

https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               |  8 ++++++++
 package/usbredir/Config.in     | 18 +++++++++++++-----
 package/usbredir/usbredir.hash |  4 ++--
 package/usbredir/usbredir.mk   | 22 ++++++++--------------
 4 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0e63d59a98..17f0858e70 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_USBREDIR_SERVER
+	bool "usbredirserver removed"
+	select BR2_LEGACY
+	help
+	  usbredirserver has been dropped by upstream since version
+	  0.13.0. usbredir tools (which include usbredirect binary) can
+	  be used as a replacement.
+
 config BR2_KERNEL_HEADERS_5_17
 	bool "kernel headers version 5.17.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
index 8ce180a884..6de6227e5c 100644
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -15,18 +15,26 @@ config BR2_PACKAGE_USBREDIR
 	  protocol.
 
 	  Note: only the library is installed, not the utilities. Say
-	  'y' below if you want the server too.
+	  'y' below if you want the tools too.
 
 	  http://www.spice-space.org/page/UsbRedir
 
 if BR2_PACKAGE_USBREDIR
 
-config BR2_PACKAGE_USBREDIR_SERVER
-	bool "usbredirserver on target"
+config BR2_PACKAGE_USBREDIR_TOOLS
+	bool "enable tools"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  If you want to serve usbredir requests on your target, say
-	  'y' here to have the usbredir server on the target.
+	  'y' here to have the tools built and installed on the target
+	  (including usbredirect binary).
 
-	  Note: the server is not required to use the library.
+	  Note: the tools are not required to use the library.
+
+comment "tools needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index f738c36690..577e08efba 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,5 +1,5 @@
-# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
-sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
+# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
+sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
 
 # Hash for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 6792a3e758..325e7313aa 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.12.0
+USBREDIR_VERSION = 0.13.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
@@ -14,21 +14,15 @@ USBREDIR_DEPENDENCIES = host-pkgconf libusb
 USBREDIR_CONF_OPTS = \
 	-Dgit_werror=disabled \
 	-Dstack_protector=disabled \
-	-Dtests=disabled \
-	-Dtools=disabled
-
-ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
+	-Dtests=disabled
 
+ifeq ($(BR2_PACKAGE_USBREDIR_TOOLS),y)
 USBREDIR_LICENSE += , GPL-2.0+ (program)
 USBREDIR_LICENSE_FILES += COPYING
-
-else # BR2_PACKAGE_USBREDIR_SERVER != y
-
-define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
-endef
-USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-
-endif # BR2_PACKAGE_USBREDIR_SERVER
+USBREDIR_DEPENDENCIES += libglib2
+USBREDIR_CONF_OPTS += -Dtools=enabled
+else
+USBREDIR_CONF_OPTS += -Dtools=disabled
+endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
