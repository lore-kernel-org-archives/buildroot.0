Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D31C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:15:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72906120E
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B72906120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C9314075C;
	Fri,  5 Nov 2021 16:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYJjs90OPmKZ; Fri,  5 Nov 2021 16:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA7B440260;
	Fri,  5 Nov 2021 16:15:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DEC71BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02456154A
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1YIc9pvdTsr for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1324961681
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:15:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4349F8A6B2; Fri,  5 Nov 2021 16:11:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:10:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6063583ffdb950d69f3296fe78816943da41f9f
X-Git-Newrev: d9796f2db9866060b916487784b046bb6b76f9b6
X-Patchwork-Hint: ignore
Message-Id: <20211105161120.4349F8A6B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9796f2db9866060b916487784b046bb6b76f9b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop arm fix patch that is now upstream.

Dbus is now an optional dependency for pipewire.

Add pipewire-v4l2 config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../pipewire/0001-cpu-fix-compilation-on-ARM.patch | 28 ----------------------
 package/pipewire/pipewire.hash                     |  2 +-
 package/pipewire/pipewire.mk                       | 15 ++++++++----
 3 files changed, 12 insertions(+), 33 deletions(-)

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch b/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
deleted file mode 100644
index 445cab08bd..0000000000
--- a/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f8817b439433798bd7217dc4ae72197887b0fc96 Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Thu, 30 Sep 2021 11:12:27 +0200
-Subject: [PATCH] cpu: fix compilation on ARM
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-f8817b439433798bd7217dc4ae72197887b0fc96]
----
- spa/plugins/support/cpu-arm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
-index d80b8ad87..de07ebf41 100644
---- a/spa/plugins/support/cpu-arm.c
-+++ b/spa/plugins/support/cpu-arm.c
-@@ -80,7 +80,7 @@ arm_init(struct impl *impl)
- 	int arch;
- 
- 	if (!(cpuinfo = get_cpuinfo())) {
--		spa_log_warn(impl->log, NAME " %p: Can't read cpuinfo", impl);
-+		spa_log_warn(impl->log, "%p: Can't read cpuinfo", impl);
- 		return 1;
- 	}
- 
--- 
-2.25.1
-
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 879cfa41cb..7894939b0d 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f4ae272e8d3fa3ff6a6ba2a465d1f951405b08fd31bbb82c27bb7cf55e113ba1  pipewire-0.3.38.tar.bz2
+sha256  fafcde675b264485883df1f3bf7e08f36fd1d661ecc092dcec6fd35a059c2aff  pipewire-0.3.39.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 272cd046aa..f376f3c276 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.38
+PIPEWIRE_VERSION = 0.3.39
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
 PIPEWIRE_LICENSE_FILES = COPYING LICENSE
 PIPEWIRE_INSTALL_STAGING = YES
-PIPEWIRE_DEPENDENCIES = host-pkgconf dbus $(TARGET_NLS_DEPENDENCIES)
+PIPEWIRE_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 PIPEWIRE_CONF_OPTS += \
 	-Ddocs=disabled \
@@ -28,6 +28,13 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+PIPEWIRE_CONF_OPTS += -Ddbus=enabled
+PIPEWIRE_DEPENDENCIES += dbus
+else
+PIPEWIRE_CONF_OPTS += -Ddbus=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PIPEWIRE_CONF_OPTS += -Dudev=enabled
 PIPEWIRE_DEPENDENCIES += udev
@@ -106,9 +113,9 @@ PIPEWIRE_DEPENDENCIES += ncurses
 endif
 
 ifeq ($(BR2_PACKAGE_PIPEWIRE_V4L2),y)
-PIPEWIRE_CONF_OPTS += -Dv4l2=enabled
+PIPEWIRE_CONF_OPTS += -Dpipewire-v4l2=enabled -Dv4l2=enabled
 else
-PIPEWIRE_CONF_OPTS += -Dv4l2=disabled
+PIPEWIRE_CONF_OPTS += -Dpipewire-v4l2=disabled -Dv4l2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_HAS_UDEV),yyy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
