Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBB4C28B2E
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 21:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FFB040B43;
	Tue, 11 Mar 2025 21:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWLPYo8nekPF; Tue, 11 Mar 2025 21:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 839974086F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 839974086F;
	Tue, 11 Mar 2025 21:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1DFC1DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90657400FB
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFHH-RShTrBA for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 21:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60FB14011F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60FB14011F
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:54:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53B5E87E8D; Tue, 11 Mar 2025 21:54:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 22:52:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e444597f486deb86cf8ef7ea84af8693397002c2
X-Git-Newrev: ff85110701cf884869f07b04bd041e06dcac3018
X-Patchwork-Hint: ignore
Message-Id: <20250311215457.53B5E87E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/network-manager: bump
 version to 1.52.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff85110701cf884869f07b04bd041e06dcac3018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream changelog with a mix of new features and bugfixes:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.0/NEWS?ref_type=tags

Support for the "dhcpcanon" DHCP client has been removed.

Systemd code imported into NetworkManager [1] now requires kernel
headers 5.4 [2], update "depends on" accordingly.

Also update the homepage, wiki.gnome.org has been retired.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2115
[2] https://github.com/systemd/systemd/commit/6e14c46bac760d01868b0bf48461f6ac44c86be3

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/network-manager/Config.in            | 8 ++++----
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index de7989a9c5..b388c573fe 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	# We need NETLINK_GET_STRICT_CHK
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
@@ -23,7 +23,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	  configured and joined once, it can be detected and re-joined
 	  automatically the next time it's available.
 
-	  http://projects.gnome.org/NetworkManager/
+	  https://networkmanager.dev/
 
 if BR2_PACKAGE_NETWORK_MANAGER
 
@@ -60,10 +60,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	  This option enables support for OpenVSwitch
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 4.20, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 5.4, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 64ec5acbea..a0963e010f 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.50.2/downloads/NetworkManager-1.50.2.tar.xz.sha256sum
-sha256  10473be9d3ab89f8a27a68b7bf5bc9557851a5183b74b6241e5e0fa5c6921fef  NetworkManager-1.50.2.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.0/downloads/NetworkManager-1.52.0.tar.xz.sha256sum
+sha256  356f21a15da51e4218fd4d0fd78cea61e067b1116a25cddee4af9df05062e92d  NetworkManager-1.52.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1a0adacfa0..ab3a437838 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.50
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION_MAJOR = 1.52
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
