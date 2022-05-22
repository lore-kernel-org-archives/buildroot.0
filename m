Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36595C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB09C60E74;
	Sun, 22 May 2022 20:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5OigN1DrrGf; Sun, 22 May 2022 20:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF25E60B60;
	Sun, 22 May 2022 20:20:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14E5F1BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11BAC416FD
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iQCMB0sH6OE for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:19:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19074416FC
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82A818632F; Sun, 22 May 2022 20:08:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 22:17:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c495d12ea3a74ea5308b10a1e9b087fc473ed601
X-Git-Newrev: 28065bdcbb99edf9e79c6ddd0fd7672444725285
X-Patchwork-Hint: ignore
Message-Id: <20220522200827.82A818632F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/network-manager:
 remove invalid dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=28065bdcbb99edf9e79c6ddd0fd7672444725285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Dependency on libiw has been removed since 0.9.3.990 [1].
Dependency on libgcrypt has been removed since 1.2-beta1 [2].
Dependency on libuuid has been removed since 1.31.4-dev [3].

[1]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/7d0761588c2dde8816c109c38c1c94233fd74afe
[2]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/b6f5f030331cc680edbe19ae322e894494d63687
[3]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8b47feff2ff8ac37355431cb0414822da2c87ea1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in          | 6 ------
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a48cb37b15..1370c81c9c 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "network-manager"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
@@ -13,11 +12,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_WIRELESS_TOOLS
-	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	select BR2_PACKAGE_LIBNDP
 	help
 	  NetworkManager is a set of co-operative tools that make
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a90228992c..d979cfc0d7 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
-	libgcrypt wireless_tools util-linux host-intltool libndp
+	host-intltool libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
