Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9C8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 02:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C29E60FF4;
	Fri, 15 Apr 2022 02:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJvsMxZBKR2m; Fri, 15 Apr 2022 02:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43CD460FCB;
	Fri, 15 Apr 2022 02:52:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1B6D1BF388
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 02:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF9DC60FCB
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 02:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_GqiRMvlKrm for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 02:52:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80D4A60769
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 02:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fEfFJ
 GO8uPgJl3bZDItAqejB94fAT1z8MhM032ltISk=; b=RfVOEj136FNZsDJMF5g9L
 pzCUBf6U8yd/E2hV4Ah8+HhDlfh2KPfFRhRHqJr4B1f1GUDTrKo5SSqFQjVeLy9B
 GnT/6LogYZ8aS02gJqhgI3iN+dRtweG1nQqcYaRH0JFWh6HH14k117ex5lixaYrP
 SSVcV4EFLQLGhIt8kSVRhs=
Received: from localhost.localdomain (unknown [123.185.181.120])
 by smtp7 (Coremail) with SMTP id C8CowAC3R5v73VhinGhyBQ--.35679S2;
 Fri, 15 Apr 2022 10:52:44 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 19:52:24 -0700
Message-Id: <20220415025224.1876125-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowAC3R5v73VhinGhyBQ--.35679S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1xtw1DXF47Kry7Ar1UZFb_yoW5GFW5pr
 WftF1UG3yqg34FvrWUJw1fZ3WY9Fs3Kr15G3WxC3W0vrWfXrsaqr929F4DZ34DWrW3A3y5
 ZF48urW5ur4UXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRVHqcUUUUU=
X-Originating-IP: [123.185.181.120]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbCqR-jjV0DeyTc5AAAsh
Subject: [Buildroot] [PATCH] package/network-manager: remove invalid
 dependencies
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dependency on libiw has been removed since 0.9.3.990 [1].
Dependency on libgcrypt has been removed since 1.2-beta1 [2].
Dependency on libuuid has been removed since 1.31.4-dev [3].

[1]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/7d0761588c2dde8816c109c38c1c94233fd74afe
[2]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/b6f5f030331cc680edbe19ae322e894494d63687
[3]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
