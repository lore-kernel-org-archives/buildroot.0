Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE49DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6122040B47;
	Thu, 27 Jan 2022 07:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id byQd2Q3B1xlO; Thu, 27 Jan 2022 07:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5772540B41;
	Thu, 27 Jan 2022 07:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB3A21BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA0C984DEF
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoyTNBt1dc4u for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:19:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B97584DEC
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:19:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD09882212; Thu, 27 Jan 2022 07:12:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:19:05 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e5e649a544da652a38683b2fd40c48cbec96fc59
X-Git-Newrev: fbbf702f00d7f92bf3a33ac880b1c8942998bbac
X-Patchwork-Hint: ignore
Message-Id: <20220127071246.CD09882212@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/opengl/libgbm:
 clarify option comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbbf702f00d7f92bf3a33ac880b1c8942998bbac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The comments were *after* the option they applied to, which was
confusing, so bring back the comments before the option they apply to.

In addition, instead of saying "this option", explicitly name the
option to clear any ambiguity.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b5f7ce29288e2ba393ca7cd4768a83cdb5dec48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opengl/libgbm/Config.in | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/opengl/libgbm/Config.in b/package/opengl/libgbm/Config.in
index 7aa3efb97a..6eb39761c4 100644
--- a/package/opengl/libgbm/Config.in
+++ b/package/opengl/libgbm/Config.in
@@ -5,20 +5,21 @@ config BR2_PACKAGE_PROVIDES_LIBGBM
 	string
 	depends on BR2_PACKAGE_HAS_LIBGBM
 
+# gbm implementations should select
+# BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT if they
+# provide the format modifier plane count feature. This API was
+# initially introduced in mesa3d version 17. A gbm implementation
+# provides this feature if it is implement function
+# gbm_device_get_format_modifier_plane_count.
 config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 	bool
 	depends on BR2_PACKAGE_HAS_LIBGBM
 
-# gbm implementations should select this option if they provide the
-# format modifier plane count feature. This API was initially introduced
-# in mesa3d version 17. A gbm implementation provides this feature if it
-# is implement function gbm_device_get_format_modifier_plane_count.
-
+# gbm implementations should select
+# BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF if they provide the dma
+# buffer feature. This API was initially introduced in mesa3d version
+# 10. A gbm implementation provides this feature if it is implement
+# function gbm_bo_get_fd.
 config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	bool
 	depends on BR2_PACKAGE_HAS_LIBGBM
-
-# gbm implementations should select this option if they provide the
-# dma buffer feature. This API was initially introduced in mesa3d
-# version 10. A gbm implementation provides this feature if it
-# is implement function gbm_bo_get_fd.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
