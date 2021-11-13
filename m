Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFFCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:51:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B398860F70
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B398860F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E10405AF;
	Sat, 13 Nov 2021 09:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knOQFg4bFYEH; Sat, 13 Nov 2021 09:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7CF4058D;
	Sat, 13 Nov 2021 09:51:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16D771BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B7F4013B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTDPtG4Tmn2C for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:51:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2408740155
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:51:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 75FB788FA3; Sat, 13 Nov 2021 09:47:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 10:50:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b401925baa99bc5a8c1a1f2f55ad51b3a05fc5a
X-Git-Newrev: 695fd9bf72d0257d2754af5436e6225c3c32ef88
X-Patchwork-Hint: ignore
Message-Id: <20211113094705.75FB788FA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glmark2: drm-glesv2 needs libgbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=695fd9bf72d0257d2754af5436e6225c3c32ef88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error with defconfig from:
http://autobuild.buildroot.net/results/e393dbfba7c2989fe983df47ea0638c3ba62ae7a/

  Checking for 'libdrm': yes
  Checking for 'gbm'   : not found

after http://patchwork.ozlabs.org/project/buildroot/patch/20200104193919.91589-1-bernd.kuhls@t-online.de/
was applied. Both patches are needed to fix the build error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glmark2/Config.in  | 1 +
 package/glmark2/glmark2.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 130af129d2..059acc62c4 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # libpthread-stubs -> libdrm
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 5ad3ea2cb4..e8d6f71dad 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -11,7 +11,7 @@ GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
-GLMARK2_DEPENDENCIES += libdrm libgles udev
+GLMARK2_DEPENDENCIES += libdrm libgbm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
