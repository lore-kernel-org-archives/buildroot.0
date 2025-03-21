Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630FDC35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 07:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7943608C5;
	Sat, 22 Mar 2025 07:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9p_STAKMnD2; Sat, 22 Mar 2025 07:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2B9608CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED2B9608CE;
	Sat, 22 Mar 2025 07:39:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3453E2
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3EFE42463
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90vCyIdyJU-V for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 07:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E483542425
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E483542425
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:39:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D52FC881A5; Sat, 22 Mar 2025 07:39:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Mar 2025 22:21:13 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bfcceaca1d91a4babdd439065cb5d9fcc4578b09
X-Git-Newrev: e0403cef7d8b84f750cfdbffe1b502e343a99ac9
X-Patchwork-Hint: ignore
Message-Id: <20250322073945.D52FC881A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/webkitgtk: bump
 to 2.46.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0403cef7d8b84f750cfdbffe1b502e343a99ac9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Stable release to the 2.46 series.

Release notes:

  https://webkitgtk.org/2024/09/17/webkitgtk2.46.0-released.html
  https://webkitgtk.org/2024/09/30/webkitgtk2.46.1-released.html
  https://webkitgtk.org/2024/10/21/webkitgtk2.46.2-released.html
  https://webkitgtk.org/2024/10/30/webkitgtk2.46.3-released.html
  https://webkitgtk.org/2024/11/27/webkitgtk2.46.4-released.html

Added BR2_PACKAGE_WEBP_MUX to fix this error:

-- The following WebP libraries were not found:
--  mux (required)

Added USE_SYSTEM_SYSPROF_CAPTURE=OFF to fix this error:

-- Checking for module 'sysprof-capture-4'
--   Package 'sysprof-capture-4', required by 'virtual:world', not found
-- Could NOT find SysProfCapture (missing: SysProfCapture_LIBRARY SysProfCapture_INCLUDE_DIR)

For now, use USE_SKIA=OFF which is the replacement for cairo.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a199751e5bbfede9e9879d4bfb0bec7c9f4aa871)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in      | 1 +
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 4 +++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 7d3ddaf79e..a31bce2fb8 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WEBP_MUX
 	select BR2_PACKAGE_WOFF2
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 49f758d6a8..96100d4c7c 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.44.4.tar.xz.sums
-sha1  3699ff9c9b84e755a0736e72dfd6e5a13151f7d6  webkitgtk-2.44.4.tar.xz
-sha256  2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796  webkitgtk-2.44.4.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.46.4.tar.xz.sums
+sha1  10d4dbd222acec30b1d20ee3b7d02c0d9727c5a9  webkitgtk-2.46.4.tar.xz
+sha256  0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176  webkitgtk-2.46.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index e482a4b187..7c2f37c975 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.44.4
+WEBKITGTK_VERSION = 2.46.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -30,6 +30,8 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_AVIF=OFF \
 	-DUSE_GTK4=OFF \
 	-DUSE_LIBHYPHEN=OFF \
+	-DUSE_SKIA=OFF \
+	-DUSE_SYSTEM_SYSPROF_CAPTURE=OFF \
 	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
