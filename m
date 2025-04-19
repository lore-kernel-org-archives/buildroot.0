Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C061C369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12365607FC;
	Sat, 19 Apr 2025 20:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Am8H0erHgIT; Sat, 19 Apr 2025 20:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7B3607D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7B3607D8;
	Sat, 19 Apr 2025 20:16:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD4A228
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 407CE607D8
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P10QLfpVMmh2 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65F14607B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65F14607B8
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:15:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BFA485C5C; Sat, 19 Apr 2025 20:15:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 22:14:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e627c1628438818ec3bd8638bd1e3400541a85e
X-Git-Newrev: 6a47aa648a15b5c0b3d47767e423ccd10f13d3af
X-Patchwork-Hint: ignore
Message-Id: <20250419201557.5BFA485C5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: bump to 2.48.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a47aa648a15b5c0b3d47767e423ccd10f13d3af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps webkit to the 2.48 stable series.

WebKitGTK+ 2.48 highlights:
https://webkitgtk.org/2025/04/08/webkitgtk-2.48.html

News:
- https://webkitgtk.org/2025/03/14/webkitgtk2.48.0-released.html
- https://webkitgtk.org/2025/04/02/webkitgtk2.48.1-released.html

And brings some security fixes:
- https://webkitgtk.org/security/WSA-2025-0002.html
- https://webkitgtk.org/security/WSA-2025-0003.html

Also,

- Raise the minimal GCC requirement [1],
which should have been raised by the 2.46.4 bump.

- Handle SPEECH_SYNTHESIS, which has been enabled
by default in commit [2].

[1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
[2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in      | 6 +++---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 9 ++++++++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3594299314..bcb4b12fa3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
@@ -33,7 +33,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 96100d4c7c..fd9420bad9 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.46.4.tar.xz.sums
-sha1  10d4dbd222acec30b1d20ee3b7d02c0d9727c5a9  webkitgtk-2.46.4.tar.xz
-sha256  0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176  webkitgtk-2.46.4.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.1.tar.xz.sums
+sha1  f7939f920f92f6b1395b8573f069d3fb9c085b3f  webkitgtk-2.48.1.tar.xz
+sha256  98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f  webkitgtk-2.48.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ec63d093b7..2c22bfb607 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.46.4
+WEBKITGTK_VERSION = 2.48.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -73,6 +73,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FLITE),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=ON
+WEBKITGTK_DEPENDENCIES += flite
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
 WEBKITGTK_DEPENDENCIES += lcms2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
