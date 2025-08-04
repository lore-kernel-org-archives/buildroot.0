Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6029C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 797F18237F;
	Mon,  4 Aug 2025 20:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAUJUE6nY5-y; Mon,  4 Aug 2025 20:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D9B682377
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D9B682377;
	Mon,  4 Aug 2025 20:04:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FC43233
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62727606F3
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvA8XXRusjXX for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8556B60AD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8556B60AD4
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:04:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75BEF86E85; Mon,  4 Aug 2025 20:04:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Aug 2025 22:02:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 178cc76deb67730de6d4d669709da82daa0dff9a
X-Git-Newrev: 6b607a774403f7cbdfd968a80ec1c5bcf7eff524
X-Patchwork-Hint: ignore
Message-Id: <20250804200412.75BEF86E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.29.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b607a774403f7cbdfd968a80ec1c5bcf7eff524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/wayland-devel/2025-March/044026.html
https://lists.freedesktop.org/archives/wayland-devel/2025-April/044102.html
https://lore.freedesktop.org/wayland-devel/20250731092534.GA4100432@quokka/T/

Upstream changed mtdev into an optional dependency:
https://gitlab.freedesktop.org/libinput/libinput/-/commit/27f4b0ae744a2b2655755188f2224dd5f8c4bdeb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/Config.in     |  1 -
 package/libinput/libinput.hash |  2 +-
 package/libinput/libinput.mk   | 11 +++++++++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 1a8fcc7ed4..f5253dfec2 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBEVDEV
-	select BR2_PACKAGE_MTDEV
 	help
 	  libinput is a library to handle input devices in Wayland
 	  compositors and to provide a generic X.Org input driver.
diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f6ec570588..cd60e70c40 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8e823cc9f44c51b63ae90af0b73676ed82c0402cc1cbd4a59ac91b7bb6cad716  libinput-1.27.0.tar.bz2
+sha256  7160c16c409c9ea4f7da9d91923ae0a92df7f3453a292bf684bed071acd7b4ff  libinput-1.29.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ee15b781e6..93d8a51aca 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.27.0
+LIBINPUT_VERSION = 1.29.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
-LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
+LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
@@ -31,6 +31,13 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+ifeq ($(BR2_PACKAGE_MTDEV),y)
+LIBINPUT_CONF_OPTS += -Dmtdev=true
+LIBINPUT_DEPENDENCIES += mtdev
+else
+LIBINPUT_CONF_OPTS += -Dmtdev=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS),)
 LIBINPUT_PYTHON_TOOLS = libinput-analyze-per-slot-delta \
 	libinput-analyze-recording \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
