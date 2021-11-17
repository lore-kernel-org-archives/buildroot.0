Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6AEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:03:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 463E1619EA
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 463E1619EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 214BD835E0;
	Wed, 17 Nov 2021 22:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NreCLZzACubm; Wed, 17 Nov 2021 22:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463988354D;
	Wed, 17 Nov 2021 22:03:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A368B1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EBAF409EF
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cg6ExWuuNJ6X for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:02:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8471B40964
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 736A58D5F6; Wed, 17 Nov 2021 21:58:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:57:31 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8dea79bf8544e6f0629d08ef29f387825192ac16
X-Git-Newrev: 77bcdf3dd1460aba5ae8aa371e3c47197f161cda
X-Patchwork-Hint: ignore
Message-Id: <20211117215831.736A58D5F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/glmark2:
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

commit: https://git.buildroot.net/buildroot/commit/?id=77bcdf3dd1460aba5ae8aa371e3c47197f161cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
