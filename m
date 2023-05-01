Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DB6C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 11:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B09409A6;
	Mon,  1 May 2023 11:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B09409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgpO6eY2F8fP; Mon,  1 May 2023 11:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 747DF40B72;
	Mon,  1 May 2023 11:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 747DF40B72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3847C1BF855
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E33C40965
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E33C40965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WepNKELic-YI for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 11:40:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8ABB4151C
 for <buildroot@buildroot.org>; Mon,  1 May 2023 11:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8ABB4151C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5FF184F30; Mon,  1 May 2023 11:40:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 13:37:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 244fe62cafb428e2bce303010b4f7699640bcafe
X-Git-Newrev: 6e863bdef45c3f4ffabcc8d007f658ea04cb9908
X-Patchwork-Hint: ignore
Message-Id: <20230501114025.D5FF184F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-tools: fix build dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e863bdef45c3f4ffabcc8d007f658ea04cb9908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes the dependency on libfdt for host-sunxi-tools.
Also it fixes the dependency on zlib for sunxi-tools.

Fix the following host build failure raised since commit
2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb

fit_image.c:19:10: fatal error: libfdt.h: No such file or directory
   19 | #include <libfdt.h>
      |          ^~~~~~~~~~
compilation terminated.

Fixes: http://autobuild.buildroot.net/results/2677c69ac34642a7a501230e1dd22b193db0899d/
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-tools/Config.in      | 1 +
 package/sunxi-tools/Config.in.host | 1 +
 package/sunxi-tools/sunxi-tools.mk | 7 ++++---
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index e748637c72..14f7da5bf2 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_ZLIB
 	help
 	  The sunxi-fel command can interact with a sunxi device in
 	  fel mode. This allows do download code to memory and execute
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
index 51f13cf623..f7c60b37a9 100644
--- a/package/sunxi-tools/Config.in.host
+++ b/package/sunxi-tools/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SUNXI_TOOLS
 	bool "host sunxi-tools"
 	depends on BR2_arm
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
+	select BR2_PACKAGE_HOST_DTC
 	help
 	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i)
 	  based devices. This includes fex2bin which can be used to
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index a9569f2910..97863efc13 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -8,7 +8,7 @@ SUNXI_TOOLS_VERSION = 1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
-HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
+HOST_SUNXI_TOOLS_DEPENDENCIES = host-dtc host-libzlib host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/bin/fex2bin
 
 SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_FEXC) += sunxi-fexc
@@ -26,13 +26,14 @@ SUNXI_TOOLS_FEXC_LINKS += fex2bin bin2fex
 endif
 
 ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
-SUNXI_TOOLS_DEPENDENCIES += dtc libusb host-pkgconf
+SUNXI_TOOLS_DEPENDENCIES += dtc libusb zlib host-pkgconf
 endif
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" \
 		PREFIX=$(HOST_DIR) EXTRA_CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" -C $(@D) tools misc
+		LDFLAGS="$(HOST_LDFLAGS) -I$(HOST_DIR)/include/libfdt" \
+		-C $(@D) tools misc
 endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
