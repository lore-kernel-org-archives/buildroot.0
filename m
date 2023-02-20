Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18F7C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1BB07029C;
	Tue, 21 Feb 2023 02:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1BB07029C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AI3MzjFK9IZ; Tue, 21 Feb 2023 02:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE7B170077;
	Tue, 21 Feb 2023 02:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7B170077
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC441BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2549870044
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2549870044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81ZtWwRQGAs0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8046E70024
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8046E70024
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EA908648F; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 18:22:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b21cd8be3f9469d6bdbbaed951ae7c59efb46a24
X-Git-Newrev: 4c7fcbbe75de5c535e8d5dd7182900b6d09e2b03
X-Patchwork-Hint: ignore
Message-Id: <20230220205303.7EA908648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: security
 bump to version 2.38.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c7fcbbe75de5c535e8d5dd7182900b6d09e2b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bugfix release, with many security fixes, including (but not limited to)
a patch for CVE-2023-23529.

Release notes:

  https://webkitgtk.org/2023/02/15/webkitgtk2.38.5-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2023-0002.html

Also raise the minimal GCC version to 8.3, which was already required since webkitgtk-2.36.4.
Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
we do check on >= GCC 8, because we can't check on >= GCC 8.3.

  https://github.com/WebKit/WebKit/commit/f812c5db1ff22bcbe1070ca4ed613085cd36499b

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in      | 4 ++--
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index dc5d738dae..976341093e 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 8, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
@@ -32,7 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 34fd19d3de..c771297b5a 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.4.tar.xz.sums
-md5  1c9ca83a0ad7e4ca9e933094572cb7d9  webkitgtk-2.38.4.tar.xz
-sha1  38b47df2be9bfb97d68fce8c7fa2819966a79036  webkitgtk-2.38.4.tar.xz
-sha256  4f47ea29a2d4d5f15eef3dc9e2d6c6f067e8de863a3f64455e1ccf9693cc1d36  webkitgtk-2.38.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.5.tar.xz.sums
+md5  de05d314a3ecb5fb3835e4d84f8f466d  webkitgtk-2.38.5.tar.xz
+sha1  1774390c628bb3a524d4ed76f11de4a878078db6  webkitgtk-2.38.5.tar.xz
+sha256  40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7  webkitgtk-2.38.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index a6974db926..3263f7fea0 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.4
+WEBKITGTK_VERSION = 2.38.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
