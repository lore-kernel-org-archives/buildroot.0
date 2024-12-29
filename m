Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3214E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 19:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C43B80F57;
	Sun, 29 Dec 2024 19:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bSC1TWaEuaF; Sun, 29 Dec 2024 19:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 143BB80F40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 143BB80F40;
	Sun, 29 Dec 2024 19:54:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1385ACA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 231156084D
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO7EPjM__Dxy for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 19:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC68F60827
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC68F60827
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3A6E876F5; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ff971d7c2233cd8f95dc32dfe395e104d8e5439
X-Git-Newrev: 6ef3c9d64f700bb90c61c898021d3a129638fa2c
X-Patchwork-Hint: ignore
Message-Id: <20241229195346.E3A6E876F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-tools: drop directfb support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ef3c9d64f700bb90c61c898021d3a129638fa2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the DirectFB package, let's drop DirectFB
support in vulkan-tools.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vulkan-tools/vulkan-tools.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
index 68f7c1c04d..9f5bf46b79 100644
--- a/package/vulkan-tools/vulkan-tools.mk
+++ b/package/vulkan-tools/vulkan-tools.mk
@@ -17,14 +17,8 @@ VULKAN_TOOLS_CONF_OPTS += \
 	-DBUILD_CUBE=OFF \
 	-DBUILD_ICD=OFF \
 	-DBUILD_VULKANINFO=ON \
-	-DINSTALL_ICD=OFF
-
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-VULKAN_TOOLS_DEPENDENCIES += directfb
-VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
-else
-VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
-endif
+	-DINSTALL_ICD=OFF \
+	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VULKAN_TOOLS_DEPENDENCIES += libxcb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
