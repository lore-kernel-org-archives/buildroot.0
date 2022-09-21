Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D432C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE457404F7;
	Wed, 21 Sep 2022 19:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE457404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-FSQLL8r1Na; Wed, 21 Sep 2022 19:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D009140217;
	Wed, 21 Sep 2022 19:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D009140217
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 399D91BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 152C161049
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 152C161049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3_dk6cXajkI for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6545E61060
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6545E61060
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54BF785D04; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:24:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25b396bfbfc349912a77c09da2f4fb2c119d51d7
X-Git-Newrev: 4d4a03665a8b3cb0f158ca126020c1a7f986d62e
X-Patchwork-Hint: ignore
Message-Id: <20220921193119.54BF785D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-utils: bump to version
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d4a03665a8b3cb0f158ca126020c1a7f986d62e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for new drm(libdrm) option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-utils/wayland-utils.hash | 10 +++++-----
 package/wayland-utils/wayland-utils.mk   | 11 +++++++++--
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/wayland-utils/wayland-utils.hash b/package/wayland-utils/wayland-utils.hash
index 00b6da4033..c9b16e0535 100644
--- a/package/wayland-utils/wayland-utils.hash
+++ b/package/wayland-utils/wayland-utils.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-July/041565.html
-md5  714875aefb10e7f683cde24e58d033ad  wayland-utils-1.0.0.tar.xz
-sha1  b5b8d498a892866d56ffbe862039d7c97acbe7bc  wayland-utils-1.0.0.tar.xz
-sha256  64fecc4c58e87ae9b302901abe10c2e8af69c7503c221a96ecd0700e0aa268c0  wayland-utils-1.0.0.tar.xz
-sha512  4c6f1822435b36b3acd361c0c54e56150e8a2697a9c4b2c20a149fcfaafe237e45807df3471884ddf594d89558001099e2d938e3f48988ba6950a0f1e3538db2  wayland-utils-1.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-September/042399.html
+md5  1a398cbb75c3ac1ac231b2a8f84bd6d6  wayland-utils-1.1.0.tar.xz
+sha1  38e5c37f5b35b86a84289659b4b0796811eb66cd  wayland-utils-1.1.0.tar.xz
+sha256  9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a  wayland-utils-1.1.0.tar.xz
+sha512  5b841ecb9b534a9b353e104dda9410961495495380fa65e32ef40855750609b03942a87c2fd66339aab57c05b3b8699e2bee055cfd44151f9609a5f6c53349df  wayland-utils-1.1.0.tar.xz
 sha256  1eba39c11640014a5841dd3017e5245fc31f47e1cf43a3287a286dd6a8de8a1a  COPYING
diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
index 30a33b61d6..bc648a6904 100644
--- a/package/wayland-utils/wayland-utils.mk
+++ b/package/wayland-utils/wayland-utils.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-WAYLAND_UTILS_VERSION = 1.0.0
-WAYLAND_UTILS_SITE = https://wayland.freedesktop.org/releases
+WAYLAND_UTILS_VERSION = 1.1.0
+WAYLAND_UTILS_SITE = https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/$(WAYLAND_UTILS_VERSION)/downloads
 WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
 WAYLAND_UTILS_LICENSE = MIT
 WAYLAND_UTILS_LICENSE_FILES = COPYING
 WAYLAND_UTILS_DEPENDENCIES = host-pkgconf wayland wayland-protocols
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+WAYLAND_UTILS_DEPENDENCIES += libdrm
+WAYLAND_UTILS_CONF_OPTS += -Ddrm=enabled
+else
+WAYLAND_UTILS_CONF_OPTS += -Ddrm=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
