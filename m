Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CA4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 776ED848CA;
	Wed, 30 Mar 2022 17:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyUW4yHCwPrr; Wed, 30 Mar 2022 17:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E8D1848C7;
	Wed, 30 Mar 2022 17:25:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 790241BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65AF261272
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNqdQOwU8LA8 for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:25:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2C7260BDC
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:25:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 74A7285FD3; Wed, 30 Mar 2022 17:16:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 19:24:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 997ac4e38bb9a98dfa3db8b046fcaaae192d5291
X-Git-Newrev: 208aee57beb66f8b2739033c694277cd03bc9718
X-Patchwork-Hint: ignore
Message-Id: <20220330171617.74A7285FD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcamera-apps:
 X11 support needs libdrm
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

commit: https://git.buildroot.net/buildroot/commit/?id=208aee57beb66f8b2739033c694277cd03bc9718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- X11 support needs libdrm (optional libdrm dependency already
  present in libcamera-apps.mk)

Fixes:

  http://autobuild.buildroot.net/results/5df48038df5deb4f1e85287cde9a403c5681c28e

  .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/preview/egl_preview.cpp:18:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
     18 | #include <libdrm/drm_fourcc.h>
        |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e2bc5e916beedc1965da2a7bf9a86e74b24a5562)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera-apps/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index a1affc2d23..492a99cf55 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 	select BR2_PACKAGE_LIBEPOXY if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
