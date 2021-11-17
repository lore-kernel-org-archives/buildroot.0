Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3384C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:02:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B9F619EA
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67B9F619EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31EC5405EC;
	Wed, 17 Nov 2021 22:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBG7gWTaKTAM; Wed, 17 Nov 2021 22:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25FD7405E2;
	Wed, 17 Nov 2021 22:02:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34D5A1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3042C405EA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhscmHs3ukzY for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:02:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5522D405CA
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 42AFC8D5EF; Wed, 17 Nov 2021 21:58:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:57:15 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: e37bb3285289cb439c8b305436eb7dbb61cc3ca0
X-Git-Newrev: 64643e9d4807a1674e0d90aefecdde3b50e83160
X-Patchwork-Hint: ignore
Message-Id: <20211117215820.42AFC8D5EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/glmark2:
 drm-glesv2 needs libdrm
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

commit: https://git.buildroot.net/buildroot/commit/?id=64643e9d4807a1674e0d90aefecdde3b50e83160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes:
http://autobuild.buildroot.net/results/58a/58a498fac83cbb55b252ab54cd8db04570bb5ec9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: comment on same line as depends-on]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b401925baa99bc5a8c1a1f2f55ad51b3a05fc5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glmark2/Config.in  | 2 ++
 package/glmark2/glmark2.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index ddc27479cf..130af129d2 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libpthread-stubs -> libdrm
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL
@@ -61,6 +62,7 @@ config BR2_PACKAGE_GLMARK2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 9e47b426fe..98c47ac572 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -11,7 +11,7 @@ GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
-GLMARK2_DEPENDENCIES += libgles udev
+GLMARK2_DEPENDENCIES += libdrm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
