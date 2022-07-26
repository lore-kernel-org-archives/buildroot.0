Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D893C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3295960EB4;
	Tue, 26 Jul 2022 16:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3295960EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajHQDLYpv42x; Tue, 26 Jul 2022 16:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6928160D71;
	Tue, 26 Jul 2022 16:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6928160D71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 215CF1BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDEA6422BC
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDEA6422BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1r2pbE5XqTi for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:44:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0BB5422C0
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BB5422C0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CF34385F07; Tue, 26 Jul 2022 16:31:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:44:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b78ecb7ef80a558f508bd9ca6b2b6439040b442b
X-Git-Newrev: 7d1bae0707f0411a6874ba1c801d4e59d0d7b4fa
X-Patchwork-Hint: ignore
Message-Id: <20220726163108.CF34385F07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-headers: bring back the
 installation of dri.pc
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d1bae0707f0411a6874ba1c801d4e59d0d7b4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the version bump to 22.x, the dri.pc file was no longer deployed as
it was believed to not be provided.

While it was temporarily missing from upstream as part of deprecating
the classic driver, it was reintroduced prior to the 22.0 release via:
  https://gitlab.freedesktop.org/mesa/mesa/-/commit/3ae3569d822c2546c4c748090f8a6c8016f763ea

This file is still necessary to build Xorg server. See previous commits:
  9014c21cac
  7468b60e7c

Fixes: 6c25d1099 ("package/{mesa3d, mesa3d-headers}: bump version to 22.1.3")

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a5cefa254f..ba96c71e98 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -33,9 +33,19 @@ MESA3D_HEADERS_DIRS += GL
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 
+# Not using $(SED) because we do not want to work in-place, and $(SED)
+# contains -i.
+define MESA3D_HEADERS_BUILD_DRI_PC
+	sed -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
+		$(MESA3D_HEADERS_PKGDIR)/dri.pc \
+		>$(@D)/src/gallium/frontends/dri/dri.pc
+endef
+
 define MESA3D_HEADERS_INSTALL_DRI_PC
 	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
 		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
+	$(INSTALL) -D -m 0644 $(@D)/src/gallium/frontends/dri/dri.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
 endef
 
 endif # Xorg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
