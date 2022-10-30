Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB49C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A2C403BF;
	Sun, 30 Oct 2022 16:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A2C403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgKZu341fMwp; Sun, 30 Oct 2022 16:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2F5840352;
	Sun, 30 Oct 2022 16:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2F5840352
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 626651BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B96860A74
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B96860A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKV0mE4fpvZp for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 715BC606EC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 715BC606EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DB3887571; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:10:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 241db490b703fc734f0e8719a07d0f9ff40faaba
X-Git-Newrev: ce8eb37a7ea0a13644fe9ec29bf8ce72df094386
X-Patchwork-Hint: ignore
Message-Id: <20221030161421.5DB3887571@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.113
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce8eb37a7ea0a13644fe9ec29bf8ce72df094386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch various configure options from true/false to enabled/disabled
due to upstream commits:
https://cgit.freedesktop.org/mesa/drm/commit/?id=26eb15165b767de50bef3c02abd29cec256cf4a1
https://cgit.freedesktop.org/mesa/drm/commit/?id=a64a176cfd62956cc4967aa2929db2526d4faee2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libdrm/libdrm.hash |  6 +++---
 package/libdrm/libdrm.mk   | 54 +++++++++++++++++++++++-----------------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 082a158074..a47e169bed 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2022-July/362994.html
-sha256  00b07710bd09b35cd8d80eaf4f4497fe27f4becf467a9830f1f5e8324f8420ff  libdrm-2.4.112.tar.xz
-sha512  df8a207d9cce220ee2cf67877eda65394733fbfd0ff85fdbadb2b20ba9bacc41421b32452506c8caecddaf8361564ca68cd6c74d4faf3b1569ab30a3243e4340  libdrm-2.4.112.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2022-August/369983.html
+sha256  7fd7eb2967f63beb4606f22d50e277d993480d05ef75dd88a9bd8e677323e5e1  libdrm-2.4.113.tar.xz
+sha512  fca9834ce090f63ce6dc6d04491a2c5e86162fdddfc8ea70d55a6cdeb401be656388aae1577e58f463a78d8dc502be0a641908784819874e20bbec9a39a057e0  libdrm-2.4.113.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 79d9416ef0..34bd678c5a 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.112
+LIBDRM_VERSION = 2.4.113
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
@@ -16,8 +16,8 @@ LIBDRM_DEPENDENCIES = \
 	host-pkgconf
 
 LIBDRM_CONF_OPTS = \
-	-Dcairo-tests=false \
-	-Dman-pages=false
+	-Dcairo-tests=disabled \
+	-Dman-pages=disabled
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
@@ -27,70 +27,70 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
-LIBDRM_CONF_OPTS += -Dintel=true
+LIBDRM_CONF_OPTS += -Dintel=enabled
 LIBDRM_DEPENDENCIES += libpciaccess
 else
-LIBDRM_CONF_OPTS += -Dintel=false
+LIBDRM_CONF_OPTS += -Dintel=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
-LIBDRM_CONF_OPTS += -Dradeon=true
+LIBDRM_CONF_OPTS += -Dradeon=enabled
 else
-LIBDRM_CONF_OPTS += -Dradeon=false
+LIBDRM_CONF_OPTS += -Dradeon=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
-LIBDRM_CONF_OPTS += -Damdgpu=true
+LIBDRM_CONF_OPTS += -Damdgpu=enabled
 else
-LIBDRM_CONF_OPTS += -Damdgpu=false
+LIBDRM_CONF_OPTS += -Damdgpu=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
-LIBDRM_CONF_OPTS += -Dnouveau=true
+LIBDRM_CONF_OPTS += -Dnouveau=enabled
 else
-LIBDRM_CONF_OPTS += -Dnouveau=false
+LIBDRM_CONF_OPTS += -Dnouveau=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
-LIBDRM_CONF_OPTS += -Dvmwgfx=true
+LIBDRM_CONF_OPTS += -Dvmwgfx=enabled
 else
-LIBDRM_CONF_OPTS += -Dvmwgfx=false
+LIBDRM_CONF_OPTS += -Dvmwgfx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
-LIBDRM_CONF_OPTS += -Domap=true
+LIBDRM_CONF_OPTS += -Domap=enabled
 else
-LIBDRM_CONF_OPTS += -Domap=false
+LIBDRM_CONF_OPTS += -Domap=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_ETNAVIV),y)
-LIBDRM_CONF_OPTS += -Detnaviv=true
+LIBDRM_CONF_OPTS += -Detnaviv=enabled
 else
-LIBDRM_CONF_OPTS += -Detnaviv=false
+LIBDRM_CONF_OPTS += -Detnaviv=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
-LIBDRM_CONF_OPTS += -Dexynos=true
+LIBDRM_CONF_OPTS += -Dexynos=enabled
 else
-LIBDRM_CONF_OPTS += -Dexynos=false
+LIBDRM_CONF_OPTS += -Dexynos=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
-LIBDRM_CONF_OPTS += -Dfreedreno=true
+LIBDRM_CONF_OPTS += -Dfreedreno=enabled
 else
-LIBDRM_CONF_OPTS += -Dfreedreno=false
+LIBDRM_CONF_OPTS += -Dfreedreno=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_TEGRA),y)
-LIBDRM_CONF_OPTS += -Dtegra=true
+LIBDRM_CONF_OPTS += -Dtegra=enabled
 else
-LIBDRM_CONF_OPTS += -Dtegra=false
+LIBDRM_CONF_OPTS += -Dtegra=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
-LIBDRM_CONF_OPTS += -Dvc4=true
+LIBDRM_CONF_OPTS += -Dvc4=enabled
 else
-LIBDRM_CONF_OPTS += -Dvc4=false
+LIBDRM_CONF_OPTS += -Dvc4=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
@@ -101,10 +101,10 @@ LIBDRM_CONF_OPTS += -Dudev=false
 endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
-LIBDRM_CONF_OPTS += -Dvalgrind=true
+LIBDRM_CONF_OPTS += -Dvalgrind=enabled
 LIBDRM_DEPENDENCIES += valgrind
 else
-LIBDRM_CONF_OPTS += -Dvalgrind=false
+LIBDRM_CONF_OPTS += -Dvalgrind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
