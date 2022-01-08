Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF06C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47CA560908;
	Sat,  8 Jan 2022 16:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlpiiDLPiDvK; Sat,  8 Jan 2022 16:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1EB60AFD;
	Sat,  8 Jan 2022 16:15:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFD0C1BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A77114011F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lL7PGew66WsY for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDBCD400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:15:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2EB0F831C3; Sat,  8 Jan 2022 16:08:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 17:14:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97c74a73e5dee17530647f89b2c7d8692781eb14
X-Git-Newrev: 2b5f7ce29288e2ba393ca7cd4768a83cdb5dec48
X-Patchwork-Hint: ignore
Message-Id: <20220108160854.2EB0F831C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opengl/libgbm: clarify option
 comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b5f7ce29288e2ba393ca7cd4768a83cdb5dec48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comments were *after* the option they applied to, which was
confusing, so bring back the comments before the option they apply to.

In addition, instead of saying "this option", explicitly name the
option to clear any ambiguity.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
