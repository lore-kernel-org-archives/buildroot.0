Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99A8C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF5760673;
	Wed, 28 Feb 2024 16:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KO4cDGVyF152; Wed, 28 Feb 2024 16:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F2060EA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F2060EA0;
	Wed, 28 Feb 2024 16:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68AC71BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55A8580E47
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2-tgkYa2WrU for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E0F80B1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E0F80B1F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5643187BFB; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 14:43:22 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 817f16ca02256d16d7218e9fbf5f64fb47bec848
X-Git-Newrev: b9b7b9cf6f39f8766196dce8cfaaaef56effc206
X-Patchwork-Hint: ignore
Message-Id: <20240228164457.5643187BFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wpewebkit:
 security bump to version 2.42.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9b7b9cf6f39f8766196dce8cfaaaef56effc206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The minimum GCC version is changed to 10.x, conditionals added for
USE_JPEGXL and USE_GBM. Both are optional and will be automatically
enabled if the relevent packages have been enabled. GBM is recommended
for performance, is it avoids a buffer copy on each frame rendered by
WebKit.

Release notes:

 - https://wpewebkit.org/release/wpewebkit-2.40.4.html
 - https://wpewebkit.org/release/wpewebkit-2.40.5.html
 - https://wpewebkit.org/release/wpewebkit-2.42.0.html
 - https://wpewebkit.org/release/wpewebkit-2.42.1.html
 - https://wpewebkit.org/release/wpewebkit-2.42.2.html
 - https://wpewebkit.org/release/wpewebkit-2.42.3.html
 - https://wpewebkit.org/release/wpewebkit-2.42.4.html

This update covers fixes for CVE-2023-37450, CVE-2023-38133,
CVE-2023-38572, CVE-2023-38592, CVE-2023-38594, CVE-2023-38595,
CVE-2023-38597, CVE-2023-38599, CVE-2023-38600, CVE-2023-38611,
CVE-2023-40397, CVE-2023-39928, CVE-2023-39434, CVE-2023-40451,
CVE-2023-41074, CVE-2023-41993, CVE-2023-32359, CVE-2023-41983,
CVE-2023-42852, CVE-2023-42916, CVE-2023-42917, CVE-2023-42883,
and CVE-2023-42890.

Relevant security advisories:

 - https://wpewebkit.org/security/WSA-2023-0006.html
 - https://wpewebkit.org/security/WSA-2023-0007.html
 - https://wpewebkit.org/security/WSA-2023-0008.html
 - https://wpewebkit.org/security/WSA-2023-0009.html
 - https://wpewebkit.org/security/WSA-2023-0010.html
 - https://wpewebkit.org/security/WSA-2023-0011.html
 - https://wpewebkit.org/security/WSA-2023-0012.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a8c112df7a15426c602bc04eb720c762ba8bc98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/Config.in      |  6 +++---
 package/wpewebkit/wpewebkit.hash |  6 +++---
 package/wpewebkit/wpewebkit.mk   | 16 +++++++++++++++-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 81b66f8429..432aa4c3a3 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
+comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
@@ -37,7 +37,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index aaeea2bcda..322e494c36 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,6 +1,6 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.40.3.tar.xz.sums
-sha1  c840bd76b2c86cb8ca0d68b56598cb0abbafc727  wpewebkit-2.40.3.tar.xz
-sha256  05b6a9cb1d7d03485e0dc41b2a8e6f99a36aea23d32ba3ecb38d0d6860747ada  wpewebkit-2.40.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.42.4.tar.xz.sums
+sha1  34da38e9554586154c83fdbb5c20e353b6d97277  wpewebkit-2.42.4.tar.xz
+sha256  8836040a3687581970b47a232b713e7023c080d5613427f52db619c29fb253a4  wpewebkit-2.42.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index bf0b095372..13143efb38 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.40.3
+WPEWEBKIT_VERSION = 2.42.4
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -84,6 +84,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_JPEGXL=ON
+WPEWEBKIT_DEPENDENCIES += libjxl
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_JPEGXL=OFF
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
 WPEWEBKIT_DEPENDENCIES += systemd
@@ -91,6 +98,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_GBM=ON
+WPEWEBKIT_DEPENDENCIES += libgbm
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 # JIT is not supported for MIPS r6, but the WebKit build system does not
 # have a check for these processors. The same goes for ARMv5 and ARMv6.
 # Disable JIT forcibly here and use the CLoop interpreter instead.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
