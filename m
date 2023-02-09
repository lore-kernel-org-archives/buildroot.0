Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E2C636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D4A82181;
	Thu,  9 Feb 2023 20:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D4A82181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qDaDCRy-GkM; Thu,  9 Feb 2023 20:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F4B482140;
	Thu,  9 Feb 2023 20:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F4B482140
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B53E31BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C9CB60F69
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9CB60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_k5KLUHpjnt for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:33:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B24660F4D
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B24660F4D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A350848D5; Thu,  9 Feb 2023 20:33:58 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Feb 2023 21:32:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 554d79f5cc01c20d886cbe9c676195159947f066
X-Git-Newrev: b1bceb4b51581e0c7b3953181ee3a2c31f0094f6
X-Patchwork-Hint: ignore
Message-Id: <20230209203358.6A350848D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire-media-session: bump to
 version 0.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1bceb4b51581e0c7b3953181ee3a2c31f0094f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly set installed_tests to disabled.

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...eson-remove-session-managers-option-check.patch | 36 ----------------------
 .../pipewire-media-session.hash                    |  2 +-
 .../pipewire-media-session.mk                      |  7 +++--
 3 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch b/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
deleted file mode 100644
index fc1d25edb3..0000000000
--- a/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1923c97fbd0b3d8cacdb72386886f860c818bccf Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 10 Nov 2021 08:54:06 -0700
-Subject: [PATCH] meson: remove session-managers option check.
-
-This option no longer exists and causes a build failure if building
-with the systemd system service enabled.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/pipewire/media-session/-/merge_requests/24]
----
- systemd/system/meson.build | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/systemd/system/meson.build b/systemd/system/meson.build
-index ab0d49064..0e9885b0f 100644
---- a/systemd/system/meson.build
-+++ b/systemd/system/meson.build
-@@ -4,9 +4,7 @@ systemd_system_services_dir = systemd.get_variable(pkgconfig: 'systemdsystemunit
- systemd_config = configuration_data()
- systemd_config.set('PW_MEDIA_SESSION_BINARY', media_session_bindir / 'pipewire-media-session')
- 
--if get_option('session-managers').contains('media-session')
--  configure_file(input : 'pipewire-media-session.service.in',
--               output : 'pipewire-media-session.service',
--               configuration : systemd_config,
--               install_dir : systemd_system_services_dir)
--endif
-+configure_file(input : 'pipewire-media-session.service.in',
-+             output : 'pipewire-media-session.service',
-+             configuration : systemd_config,
-+             install_dir : systemd_system_services_dir)
--- 
-2.25.1
-
diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
index e335fd8913..e6b176eea2 100644
--- a/package/pipewire-media-session/pipewire-media-session.hash
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ebdf9f8e389896fdc4b58da5f909afce18441b4b53d5b4f2104dd53586ea8681  media-session-0.4.1.tar.bz2
+sha256  26e21852e0834a4418b40eae342ac5178dfe40342b9c5afe204d43ef8aafa14e  media-session-0.4.2.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
index d349fd7454..cc7317f925 100644
--- a/package/pipewire-media-session/pipewire-media-session.mk
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.1
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.2
 PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
 PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
 PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
@@ -17,7 +17,10 @@ PIPEWIRE_MEDIA_SESSION_DEPENDENCIES = \
 	pipewire \
 	$(TARGET_NLS_DEPENDENCIES)
 
-PIPEWIRE_MEDIA_SESSION_CONF_OPTS = -Ddocs=disabled -Dtests=disabled
+PIPEWIRE_MEDIA_SESSION_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dtests=disabled \
+	-Dinstalled_tests=disabled
 
 PIPEWIRE_MEDIA_SESSION_MODULE_SETS_LIST = alsa
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
