Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA72C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F269C60F20;
	Sun, 27 Mar 2022 16:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zV0LZ4HAc_sr; Sun, 27 Mar 2022 16:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB866606C6;
	Sun, 27 Mar 2022 16:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04CA01BF9A4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE48781AAD
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKIh6l9_aq1H for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BECDD818CD
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5886C85E91; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b848117699707390b6507e59e2e705c54acdc9fc
X-Git-Newrev: 83ab8cc0bdb3ff376d7c61ceeb0b749f8c142b8a
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.5886C85E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: bump to version
 1.36.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=83ab8cc0bdb3ff376d7c61ceeb0b749f8c142b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CONTRIBUTING.md hash changed due to various style updates.

Set new default wifi backend config option to iwd when enabled in
cases where the default wpa_supplicant is not enabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/network-manager/network-manager.hash |  6 +++---
 package/network-manager/network-manager.mk   | 13 ++++++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index d25f0e8194..26bcf843c2 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.34/NetworkManager-1.34.0.sha256sum
-sha256  819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd  NetworkManager-1.34.0.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.36/NetworkManager-1.36.4.sha256sum
+sha256  61304e937dd926471d56715bdede7bab7ccac827356e67f2700d343317cd3c59  NetworkManager-1.36.4.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  ad0abd8e90dd134cc5546f7a13eb4268707b77a5a1a5e3afe31dc4397a573a04  CONTRIBUTING.md
+sha256  f3c5ae3cafa27c24590cf89e732581cbeb4d25d950fe49ce7e4042963012b105  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a90228992c..3479bb3794 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.34
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION_MAJOR = 1.36
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -53,8 +53,15 @@ endif
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
 NETWORK_MANAGER_CONF_OPTS += --with-iwd
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
+NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
 else
-NETWORK_MANAGER_CONF_OPTS += --without-iwd
+NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
+endif
+else
+NETWORK_MANAGER_CONF_OPTS += \
+	--without-iwd \
+	--with-config-wifi-backend-default=wpa_supplicant
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
