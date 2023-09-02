Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B71EC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C4280BFF;
	Thu,  7 Sep 2023 15:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C4280BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeiQtQwu9WVV; Thu,  7 Sep 2023 15:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EC9680B9F;
	Thu,  7 Sep 2023 15:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC9680B9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FEDA1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C17D41DC2
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C17D41DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUC0lcfWzOLp for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E48A641E68
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E48A641E68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF506869E0; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 11:58:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c27f3a12d77bc3cef97123148ff13929d13d73e
X-Git-Newrev: 9e057e7897008a6aabcd91109cf004e5ffd957ff
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.CF506869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-headers: add comment on
 version being shared with other packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e057e7897008a6aabcd91109cf004e5ffd957ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vulkan-headers/vulkan-headers.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
index 5434f69a40..20b248364d 100644
--- a/package/vulkan-headers/vulkan-headers.mk
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# Note: changing this version will also affect vulkan-loader and
+# vulkan-tools, so please update those packages as well.
 VULKAN_HEADERS_VERSION = 1.3.262
 VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
 VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
