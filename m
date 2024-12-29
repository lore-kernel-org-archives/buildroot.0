Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F7DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C009E4FCE2;
	Fri, 28 Feb 2025 16:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cQWyQzdcHfB; Fri, 28 Feb 2025 16:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 837D14FCCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 837D14FCCD;
	Fri, 28 Feb 2025 16:47:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 114231DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8530F42E07
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEohiyEVZA2x for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0EF342583
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0EF342583
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93FBF84C4E; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9ff971d7c2233cd8f95dc32dfe395e104d8e5439
X-Git-Newrev: 6ef3c9d64f700bb90c61c898021d3a129638fa2c
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.93FBF84C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vulkan-tools: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ef3c9d64f700bb90c61c898021d3a129638fa2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
