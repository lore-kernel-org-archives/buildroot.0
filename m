Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DC1CA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A49C60C2C;
	Sat,  2 Sep 2023 10:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A49C60C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qj5Gi2LNHzJi; Sat,  2 Sep 2023 10:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DEE160BC1;
	Sat,  2 Sep 2023 10:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DEE160BC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B87861BF21A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1680E60BB0
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1680E60BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJXbIDiPY4yg for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 431B960BA6
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 431B960BA6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31DDC86884; Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 11:58:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c27f3a12d77bc3cef97123148ff13929d13d73e
X-Git-Newrev: 9e057e7897008a6aabcd91109cf004e5ffd957ff
X-Patchwork-Hint: ignore
Message-Id: <20230902095901.31DDC86884@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vulkan-headers: add
 comment on version being shared with other packages
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
