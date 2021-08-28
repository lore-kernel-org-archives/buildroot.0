Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5856AC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:05:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1454C60E93
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1454C60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0BCA42779;
	Sat, 28 Aug 2021 16:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACuSIwnSmTut; Sat, 28 Aug 2021 16:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E1834277C;
	Sat, 28 Aug 2021 16:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF1E1BF48C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 631A560747
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euJtMhV8L72b for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 16:04:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C077C605CE
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 16:04:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0CF828602A; Sat, 28 Aug 2021 16:03:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 18:02:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 21ccfccd93ea42971e7e2df779d69d883beadca3
X-Git-Newrev: 50c5495f81d3418a0f63fc642dc6beb41cd316e0
X-Patchwork-Hint: ignore
Message-Id: <20210828160352.0CF828602A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libqmi: bump to
 version 1.30.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=50c5495f81d3418a0f63fc642dc6beb41cd316e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This release introduces meson build system support.

As meson files are only available in git, switch the location to
https://gitlab.freedesktop.org.

Add support for bash-completion.

Add an upstream patch fixing the compilation without gobject-intorspection.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-build-meson-fix-introspection-option.patch | 33 ++++++++++++++++++++
 package/libqmi/libqmi.hash                         |  2 +-
 package/libqmi/libqmi.mk                           | 36 ++++++++++++----------
 3 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
new file mode 100644
index 0000000000..0528868025
--- /dev/null
+++ b/package/libqmi/0001-build-meson-fix-introspection-option.patch
@@ -0,0 +1,33 @@
+From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Fri, 6 Aug 2021 10:32:22 +0200
+Subject: [PATCH] build,meson: fix introspection option
+
+Using -Dintrospection=false would actually not disable it. There is no
+longer an "auto" option for the introspection support, it will be
+either enabled or disabled depending on what the user asks
+for (default enabled).
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ meson.build | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index b25bca57..d28e5601 100644
+--- a/meson.build
++++ b/meson.build
+@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
+ version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
+
+ # introspection support
+-enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
++enable_gir = get_option('introspection')
++if enable_gir
++  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
++endif
+
+ random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
+
+--
+2.17.0
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 0bfc63f4a4..0373bb4e75 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd  libqmi-1.28.6.tar.xz
+sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 7b1d76a0c1..05fd3ae9af 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.28.6
-LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
-LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
+LIBQMI_VERSION = 1.30.0
+LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
 LIBQMI_CPE_ID_VENDOR = libqmi_project
@@ -14,47 +13,52 @@ LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-LIBQMI_CONF_OPTS = --disable-Werror
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBQMI_DEPENDENCIES += gobject-introspection
-LIBQMI_CONF_OPTS += --enable-introspection
+LIBQMI_CONF_OPTS += -Dintrospection=true
 else
-LIBQMI_CONF_OPTS += --disable-introspection
+LIBQMI_CONF_OPTS += -Dintrospection=false
 endif
 
 # if libgudev available, request udev support for a better
 # qmi-firmware-update experience
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 LIBQMI_DEPENDENCIES += libgudev
-LIBQMI_CONF_OPTS += --with-udev
+LIBQMI_CONF_OPTS += -Dudev=true
 else
-LIBQMI_CONF_OPTS += --without-udev
+LIBQMI_CONF_OPTS += -Dudev=false
 endif
 
 # if libmbim available, request QMI-over-MBIM support
 ifeq ($(BR2_PACKAGE_LIBMBIM),y)
 LIBQMI_DEPENDENCIES += libmbim
-LIBQMI_CONF_OPTS += --enable-mbim-qmux
+LIBQMI_CONF_OPTS += -Dmbim_qmux=true
 else
-LIBQMI_CONF_OPTS += --disable-mbim-qmux
+LIBQMI_CONF_OPTS += -Dmbim_qmux=false
 endif
 
 # if libqrtr-glib available, enable support for QMI over QRTR
 ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
 LIBQMI_DEPENDENCIES += libqrtr-glib
-LIBQMI_CONF_OPTS += --enable-qrtr
+LIBQMI_CONF_OPTS += -Dqrtr=true
 else
-LIBQMI_CONF_OPTS += --disable-qrtr
+LIBQMI_CONF_OPTS += -Dqrtr=false
 endif
 
 # if ModemManager available, enable MM runtime check in
 # qmi-firmware-update (note that we don't need to build-depend on
 # anything else)
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
-LIBQMI_CONF_OPTS += --enable-mm-runtime-check
+LIBQMI_CONF_OPTS += -Dmm_runtime_check=true
+else
+LIBQMI_CONF_OPTS += -Dmm_runtime_check=false
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBQMI_DEPENDENCIES += bash-completion
+LIBQMI_CONF_OPTS += -Dbash_completion=true
 else
-LIBQMI_CONF_OPTS += --disable-mm-runtime-check
+LIBQMI_CONF_OPTS += -Dbash_completion=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
