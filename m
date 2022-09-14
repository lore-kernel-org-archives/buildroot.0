Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61455ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 07:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0208940B47;
	Wed, 14 Sep 2022 07:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0208940B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQd_s-8fs9Go; Wed, 14 Sep 2022 07:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 226B840B3C;
	Wed, 14 Sep 2022 07:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 226B840B3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 102111BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 698C140B47
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 698C140B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17BkudmjLAYO for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B57840B3F
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B57840B3F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 173897F8DD; Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 09:31:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7b166d93e20140b525ea9ec77914e77758cbe05a
X-Git-Newrev: cd852bca8e13eece52156d7c0c46ea79323f3fb3
X-Patchwork-Hint: ignore
Message-Id: <20220914073925.173897F8DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cog: add dep on
 libgbm's dmabuf & plane-count-modifier features
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd852bca8e13eece52156d7c0c46ea79323f3fb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cog uses the dmabuf and plane-count-modifier features from libgbm.
These are provided by mesa3d, but may not be provided by other libgbm
providers.

So, make this a dependency.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8bbf5cb7cf0769e4ffb83de29d406a37623edee2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index 484eb85c70..d2a910f9b8 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -41,6 +41,8 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	help
@@ -56,6 +58,8 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
 comment "DRM platform needs EGL and GBM"
 	depends on \
 		!BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBGBM
+		!BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
