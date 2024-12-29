Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0B4C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4480849CD;
	Fri, 28 Feb 2025 16:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whwH8jnCJVDF; Fri, 28 Feb 2025 16:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05ECA849D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05ECA849D6;
	Fri, 28 Feb 2025 16:47:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1FA68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 436924199E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDn5EfIxwsYJ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 860C742582
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 860C742582
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8230887697; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 306ed19f7293c5bbbf86455c7c40bf57e3406ae1
X-Git-Newrev: 9ff971d7c2233cd8f95dc32dfe395e104d8e5439
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.8230887697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vulkan-loader: drop
 directfb support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ff971d7c2233cd8f95dc32dfe395e104d8e5439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As we're about to remove the DirectFB package, let's drop DirectFB
support in vulkan-loader.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vulkan-loader/vulkan-loader.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
index b1545a4972..7aceb207b5 100644
--- a/package/vulkan-loader/vulkan-loader.mk
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -15,15 +15,9 @@ VULKAN_LOADER_DEPENDENCIES = host-pkgconf vulkan-headers
 VULKAN_LOADER_CONF_OPTS += \
 	-DASSEMBLER_WORKS=FALSE \
 	-DBUILD_WSI_SCREEN_QNX_SUPPORT=OFF \
+	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
 	-DLOADER_CODEGEN=OFF
 
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-VULKAN_LOADER_DEPENDENCIES += directfb
-VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
-else
-VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VULKAN_LOADER_DEPENDENCIES += libxcb
 VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
