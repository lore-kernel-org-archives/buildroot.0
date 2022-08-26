Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB74ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38FCF6FB4F;
	Sun, 11 Sep 2022 09:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38FCF6FB4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQiI-Ei7q1ux; Sun, 11 Sep 2022 09:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4813F6FB09;
	Sun, 11 Sep 2022 09:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4813F6FB09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3171BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E406FB46
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E406FB46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmBDFrAxV6U7 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F6D606E6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F6D606E6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B440E83620; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 22:45:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c09118dc42f48156376527665a38d1cbb871a38
X-Git-Newrev: 7a4d4380009e96701ae7c05364d0fccbd43afe02
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.B440E83620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: needs host-libxslt
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a4d4380009e96701ae7c05364d0fccbd43afe02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Besides, order depends alphabetically.

Fixes:
output/build/network-manager-1.36.4/meson.build:89:0: ERROR: Program 'xsltproc' not found or not executable

See:
http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb?h=kirkstone#n13

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: one-item per-line in multiline assignment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/network-manager.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index d782370082..a3bcd4dab8 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,14 +9,23 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
-	host-intltool libndp util-linux
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
 NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
+NETWORK_MANAGER_DEPENDENCIES = \
+	host-intltool \
+	host-libxslt \
+	host-pkgconf \
+	dbus \
+	gnutls \
+	libglib2 \
+	libndp \
+	udev \
+	util-linux
+
 NETWORK_MANAGER_CONF_OPTS = \
 	-Dintrospection=false \
 	-Ddocs=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
