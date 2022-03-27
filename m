Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BF7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24305828B5;
	Sun, 27 Mar 2022 15:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HABrBd2PrQQ; Sun, 27 Mar 2022 15:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3965B81AAC;
	Sun, 27 Mar 2022 15:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10AAD1BF20B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F19A81467
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkDo_3mcbO9U for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 679778268F
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 09E2785DB7; Sun, 27 Mar 2022 15:50:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:47:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 945f8a788f8b30983aa6b2ce7275551a8a60efc8
X-Git-Newrev: ad21d84a589458fd4542993912891daa503d72dd
X-Patchwork-Hint: ignore
Message-Id: <20220327155020.09E2785DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbguard: bump to version 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad21d84a589458fd4542993912891daa503d72dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- This bump fixes unauthorized access via D-Bus (CVE-2019-25058):
  https://github.com/advisories/GHSA-p5wh-m4gj-x2mr
  but dbus is disabled on buildroot
- musl is supported since
  https://github.com/USBGuard/usbguard/commit/b04e8deacac4f3f4a82a10b219c2d555e1b2aa24
- C++17 is now mandatory:
  https://github.com/USBGuard/usbguard/commit/8c86264986685bf646c65228abce2432e08e3c4c
- Update hash of license file (use license file from gnu.org:
  https://github.com/USBGuard/usbguard/commit/3292511ab164ce0bdf6d58f0369ce3993dded9ad)

https://github.com/USBGuard/usbguard/blob/usbguard-1.1.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/usbguard/Config.in     | 8 +++-----
 package/usbguard/usbguard.hash | 6 ++++--
 package/usbguard/usbguard.mk   | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index ca6d52034b..ce7a3b8bc4 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -3,9 +3,8 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
@@ -19,10 +18,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		|| BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 comment "usbguard needs a toolchain not affected by GCC bug 64735"
diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
index fd77acc75a..a69240b3f9 100644
--- a/package/usbguard/usbguard.hash
+++ b/package/usbguard/usbguard.hash
@@ -1,3 +1,5 @@
+# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.1/usbguard-1.1.1.tar.gz.sum
+sha256  460ebfb4ffc5609739a202a3a1d9fda1c30de033b634845b8baa136352bfb432  usbguard-1.1.1.tar.gz
+
 # Locally calculated
-sha256  5617986cd5dd1a2d311041648a1977d836cf4e33a4121d7f82599f21496abc42  usbguard-1.0.0.tar.gz
-sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index d2b03eeb2a..26dc40d15b 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBGUARD_VERSION = 1.0.0
+USBGUARD_VERSION = 1.1.1
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
